Return-Path: <ejo@pengutronix.de>
Received: from metis.ext.4.pengutronix.de (metis.ext.4.pengutronix.de
	[92.198.50.35])
	by mail.openembedded.org (Postfix) with ESMTP id 0805F719D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 08:40:05 +0000 (UTC)
Received: from mango.hi.pengutronix.de ([2001:67c:670:100:76d4:35ff:fee8:98b3])
	by metis.ext.pengutronix.de with esmtp (Exim 4.84_2)
	(envelope-from <ejo@pengutronix.de>)
	id 1c9T64-0008Ap-Jo; Wed, 23 Nov 2016 09:40:04 +0100
To: Kristian Amlie <kristian.amlie@mender.io>,
	Patrick Ohly <patrick.ohly@intel.com>,
	Eduard Bartosh <eduard.bartosh@intel.com>
References: <a90e8685-f087-5ee2-888b-aa537ebd94c4@mender.io>
	<1479813004.3239.19.camel@intel.com>
	<6913e4bf-96dc-eefa-d214-9df5cde181b8@mender.io>
From: Enrico Joerns <ejo@pengutronix.de>
Message-ID: <776827b7-ca3e-e319-c2f0-b8b15bef4fb2@pengutronix.de>
Date: Wed, 23 Nov 2016 09:40:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <6913e4bf-96dc-eefa-d214-9df5cde181b8@mender.io>
X-SA-Exim-Connect-IP: 2001:67c:670:100:76d4:35ff:fee8:98b3
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Contents of non-rootfs partitions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Nov 2016 08:40:06 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 11/22/2016 12:54 PM, Kristian Amlie wrote:
> On 22/11/16 12:10, Patrick Ohly wrote:
>>> ...
>>
>> All of these introduce some special mechanism. Let me propose something
>> that might integrate better with the existing tooling:
>>
>> The "rootfs" directory gets redefined as representing the entire virtual
>> file system. When creating a disk image, it gets split up into different
>> partitions based on the image configuration.
>>
>> For example, the /home or /data directories in the rootfs could hold the
>> content that in some image configurations goes into separate partitions.
>>
>> The advantage of this approach is that the tooling for staging content
>> for image creation does not need to be changed. The same staged content
>> then can be used to create different images, potentially even using
>> different partition layouts.
>
> That's a very good idea. I think it beats all of my suggestions!

I totally agree with this solution, because it is the same approach we 
are already using for several years.

Instead of wic we are using the genimage tool 
(http://public.pengutronix.de/software/genimage/) together with a Yocto 
class for easing image creation, but its pretty much the same concerning 
its base purpose.

We called the option to split up 'mountpoint' while assuming that the 
splitted partition will be mounted to the same location in the file 
system it was taken from.

An example configuration would look like this (stripped down to the 
essential parts):

   image my-disk-image {
           [...]
           partition root {
                   image = "rootfs.ext4"
                   [...]
           }

           partition home {
                   image = "home.ext4"
                   [...]
           }
   }

   image rootfs.ext4 {
           [...]
           mountpoint = "/"
   }

   image home.ext4 {
           [...]
           mountpoint = "/home"
   }

Maybe a similar approach could be used in wic, too.


Best regards, Enrico

-- 
Pengutronix e.K.                           | Enrico Jörns                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-5080 |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


