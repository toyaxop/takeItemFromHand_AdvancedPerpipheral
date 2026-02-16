local invToya = peripheral.wrap("back")
local invMgk = peripheral.wrap("left")
local invAlya = peripheral.wrap("top")
local chat = peripheral.wrap("right")

local function rmItem(item, count, inv)
    local c = tonumber(count)
    inv.removeItemFromPlayer("back",
            { name=item, count=c })
end


local function takeItem(item, count, type,
                     inventory, leng)
    if type == "s" and leng >= 3 then
        chat.sendMessage("Taking "..count .. " " .. item)
        rmItem(item, count, inventory)
    end
    if type == "h" and leng >= 1 then
        local it = inventory.getItemInHand()
        if it ~= nil then
            chat.sendMessage("Taking from hand " ..
                             it.count .. " " ..
                             it.name)
            rmItem(it.name, it.count, inventory)
        else
            chat.sendMessage("Nothing in hand")
        end
    end 
end

local function main(username, message, inv)
    local msg = {}
    for word in message:gmatch("%S+") do
        table.insert(msg, word)
    end
    takeItem(msg[3], msg[2], msg[1], inv, #msg)
end

while true do
    local event, username, message,
     uuid, isHidden,
      messageUtf8 = os.pullEvent("chat")
    if event then
        if username == "ToyaXo" then
            main(username, message, invToya)
        end
        if username == "mgkbend" then
            main(username,message, invMgk)
        end
        if username == "_Alyaw" then
            main(username, message, invAlya)
        end
    end
end
