Return-Path: <ejo@pengutronix.de>
Received: from metis.ext.4.pengutronix.de (metis.ext.4.pengutronix.de
	[92.198.50.35])
	by mail.openembedded.org (Postfix) with ESMTP id 987A271951
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 10:12:36 +0000 (UTC)
Received: from mango.hi.pengutronix.de ([2001:67c:670:100:76d4:35ff:fee8:98b3])
	by metis.ext.pengutronix.de with esmtp (Exim 4.84_2)
	(envelope-from <ejo@pengutronix.de>)
	id 1c9UXd-0002QP-Ea; Wed, 23 Nov 2016 11:12:37 +0100
To: =?UTF-8?Q?Maciej_Borz=c4=99cki?= <maciej.borzecki@rndity.com>
References: <a90e8685-f087-5ee2-888b-aa537ebd94c4@mender.io>
	<1479813004.3239.19.camel@intel.com>
	<6913e4bf-96dc-eefa-d214-9df5cde181b8@mender.io>
	<776827b7-ca3e-e319-c2f0-b8b15bef4fb2@pengutronix.de>
	<CAD4b0_LrF=sQMV3r+3Kb8hqxcqD9U_LBMesxCyby+FGS7YssFQ@mail.gmail.com>
From: Enrico Joerns <ejo@pengutronix.de>
Message-ID: <71ba6b2a-4a87-9544-d249-c3fccc48a9f5@pengutronix.de>
Date: Wed, 23 Nov 2016 11:12:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAD4b0_LrF=sQMV3r+3Kb8hqxcqD9U_LBMesxCyby+FGS7YssFQ@mail.gmail.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:76d4:35ff:fee8:98b3
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Cc: Eduard Bartosh <eduard.bartosh@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 23 Nov 2016 10:12:37 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/23/2016 10:24 AM, Maciej Borzęcki wrote:
> On Wed, Nov 23, 2016 at 9:40 AM, Enrico Joerns <ejo@pengutronix.de> wrote:
>> On 11/22/2016 12:54 PM, Kristian Amlie wrote:
>>>
>>> On 22/11/16 12:10, Patrick Ohly wrote:
>>>>>
>>>>> ...
>>>>
>>>>
>>>> All of these introduce some special mechanism. Let me propose something
>>>> that might integrate better with the existing tooling:
>>>>
>>>> The "rootfs" directory gets redefined as representing the entire virtual
>>>> file system. When creating a disk image, it gets split up into different
>>>> partitions based on the image configuration.
>>>>
>>>> For example, the /home or /data directories in the rootfs could hold the
>>>> content that in some image configurations goes into separate partitions.
>>>>
>>>> The advantage of this approach is that the tooling for staging content
>>>> for image creation does not need to be changed. The same staged content
>>>> then can be used to create different images, potentially even using
>>>> different partition layouts.
>>>
>>>
>>> That's a very good idea. I think it beats all of my suggestions!
>>
>>
>> I totally agree with this solution, because it is the same approach we are
>> already using for several years.
>>
>> Instead of wic we are using the genimage tool
>> (http://public.pengutronix.de/software/genimage/) together with a Yocto
>> class for easing image creation, but its pretty much the same concerning its
>> base purpose.
>>
>> We called the option to split up 'mountpoint' while assuming that the
>> splitted partition will be mounted to the same location in the file system
>> it was taken from.
>>
>> An example configuration would look like this (stripped down to the
>> essential parts):
>>
>>   image my-disk-image {
>>           [...]
>>           partition root {
>>                   image = "rootfs.ext4"
>>                   [...]
>>           }
>>
>>           partition home {
>>                   image = "home.ext4"
>>                   [...]
>>           }
>>   }
>>
>>   image rootfs.ext4 {
>>           [...]
>>           mountpoint = "/"
>>   }
>>
>>   image home.ext4 {
>>           [...]
>>           mountpoint = "/home"
>>   }
>>
>> Maybe a similar approach could be used in wic, too.
>
> I went through the README from genimage repo
> https://git.pengutronix.de/cgit/genimage/tree/README. Definitely looks
> interesting and covers storage medias that are not supported by wic
> right now. The split option does not seem to be documented though. If I
> understood you correctly, the partition is seeded with data from
> location specified by `mountpoint` inside IMAGE_ROOTFS. Is that correct?

Yes, what the genimage class (see below) does, is unpacking the final 
rootfs.tar.xz inside a fakeroot environment and call the genimage tool 
with the --rootpath argument set to this path.

The mountpoint="/home" tells genimage to pack all content in directory 
/home into a separate data ext4 image (temporary named 'home.ext4') and 
all other content in a rootfs ext4 image (temporary named 'rootfs.ext4').

The `image` section then specifies how to construct the final disk image 
using the referenced generated rootfs and datafs images (and optionally 
some bootloader, non-partition-data, etc.).


Note that this is only one way to use genimage. Another common way to 
use it is to simply construct complex disk images out of different 
filesystem images, e.g. with

   partition barebox {
           image = "barebox-any-platform.img"
           size = 1M
           in-partition-table = false
   }

> I see there's a large overlap in functionality with wic (at least for
> block devices), so perhaps the best way would be introduce genimage as
> another IMAGE_CMD.
>
> I've quickly checked at https://layers.openembedded.org and there are no
> recipes for genimage/libconfuse listed there. Do happen to have done
> integration with OE in some private repo already? Would it be possible
> for you to post the relevant patches?
>

We have a layer for this, which is potentially publicly available but 
not advertised as the general plan was to move some of its content to 
upstream (oe-core, meta-oe) and split up other content (e.g. the rauc 
update tool stuff) to separate layers that will be made publicly 
available. But, as always, there are more plans than time left ;)

Well, to make a long story short, the path to the git repository is:

   https://git.pengutronix.de/cgit/meta-ptx

The genimage class I mentioned above you can find in it, too:

   https://git.pengutronix.de/cgit/meta-ptx/tree/classes/genimage.bbclass


When starting with Yocto I thought about changing from genimage to wic 
for disk image creation as wic already seemed to become the standard 
solution for building disk images. But back in these days it was a very 
separate tool and there was no integration with the BSP itself (which is 
crucial when having to reproduce builds). But the main reason why I 
decided to stay with genimage was that wic simply did not cover most of 
the use cases I required for building complex disk images for different 
embedded platforms. I'm pretty sure that this has changed in some 
points, but had no time to get deeper into this topic again, yet.


Hope that helps, best regards

Enrico

-- 
Pengutronix e.K.                           | Enrico Jörns                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-5080 |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


