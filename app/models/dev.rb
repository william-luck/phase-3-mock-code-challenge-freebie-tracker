class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        item_names = []
        self.freebies.each do |freebie|
            item_names << freebie.item_name
        end
        item_names.include?(item_name)
    end

    def give_away(dev, freebie)
        # Test to see if the given dev has the given freebie

        if self.received_one?(freebie.item_name)
            freebie.dev_id = dev.id
            freebie.save
        end
    end

end
