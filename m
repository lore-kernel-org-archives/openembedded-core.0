Return-Path: <mike.looijmans@topic.nl>
Received: from smtp02.online.nl (smtp02.online.nl [194.134.41.32])
	by mail.openembedded.org (Postfix) with ESMTP id 58DEB70A02
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Aug 2014 11:22:10 +0000 (UTC)
Received: from smtp02.online.nl (localhost [127.0.0.1])
	by smtp02.online.nl (Postfix) with ESMTP id 7359FA484;
	Sat,  9 Aug 2014 13:22:10 +0200 (CEST)
Received: from [192.168.1.6] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp02.online.nl (Postfix) with ESMTP;
	Sat,  9 Aug 2014 13:22:10 +0200 (CEST)
Message-ID: <53E60462.3010700@topic.nl>
Date: Sat, 09 Aug 2014 13:22:10 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
References: <1571948.CrPtZqAbFm@peggleto-mobl5.ger.corp.intel.com>	<53E3512E.5090008@dynamicdevices.co.uk>	<2374073.Q4LByM6bcI@peggleto-mobl5.ger.corp.intel.com>
	<53E5D844.2050909@topic.nl> <53E5DF83.3060301@dynamicdevices.co.uk>
In-Reply-To: <53E5DF83.3060301@dynamicdevices.co.uk>
X-Online-Scanned: by Cloudmark authority (on smtp02.online.nl)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [yocto] RFC: Improving the developer workflow
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
X-List-Received-Date: Sat, 09 Aug 2014 11:22:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/09/2014 10:44 AM, Alex J Lennon wrote:
>
> On 09/08/2014 09:13, Mike Looijmans wrote:
>> On 08/07/2014 03:05 PM, Paul Eggleton wrote:
>>> On Thursday 07 August 2014 11:13:02 Alex J Lennon wrote:
>>>> Historically I, and I suspect others, have done full image updates of
>>>> the storage medium,  onboard flash or whatever but these images are
>>>> getting so big now that I am trying to  move away from that and into
>>>> using package feeds for updates to embedded targets.
>>>
>>> Personally with how fragile package management can end up being, I'm
>>> convinced
>>> that full-image updates are the way to go for a lot of cases, but
>>> ideally with
>>> some intelligence so that you only ship the changes (at a filesystem
>>> level
>>> rather than a package or file level). This ensures that an upgraded
>>> image on
>>> one device ends up exactly identical to any other device including a
>>> newly
>>> deployed one. Of course it does assume that you have a read-only
>>> rootfs and
>>> keep your configuration data / logs / other writeable data on a separate
>>> partition or storage medium. However, beyond improvements to support for
>>> having a read-only rootfs we haven't really achieved anything in
>>> terms of out-
>>> of-the-box support for this, mainly due to lack of resources.
>>
>> Full-image upgrades are probably most seen in "lab" environments,
>> where the software is being developed.
>>
>> Once deployed to customers, who will not be using a build system, the
>> system must rely on packages and online updates.
>>
>> Embedded systems look more like desktops these days.
>>
>> - End-users will make changes to the system:
>>     - "plugins" and other applications.
>>     - configuration data
>>     - application data (e.g. loggings, EPG data)
>> - There is not enough room in the flash for two full images.
>> - There is usually a virtually indestructable bootloader that can
>> recover even from fully erasing the NAND flash.
>> - Flash filesystems are usually NAND. NAND isn't suitable for
>> read-only root filesystems, you want to wear-level across the whole
>> flash.
>>
>
> Agreeing with much you say Mike, I was under the impression that there
> are block management layers now which will wear level across partitions?
>
> So you could have your read only partition but still wear levelled
> across the NAND ?

Going off-topic here I guess, but I think you can use the UBI block 
layer in combination with e.g. squashfs. Never tried it, but it should 
be possible to create an UBI volume, write a squash blob into it and 
mount that.

However, any system that accomplishes that, is sort of cheating. It 
isn't a read-only rootfs in the true meaning of the word any more. In 
time, the volume will move around on the flash, thus the rootfs will be 
re-written.

>> For the OpenPLi settop boxes we've been using "online upgrades" which
>> basically just call "opkg update && opkg upgrade" for many years, and
>> there's never been a real disaster. The benefits easily outweigh the
>> drawbacks.
>>
>> When considering system upgrades, too much attention is being spent in
>> the "corner cases". It's not really a problem if the box is bricked
>> when the power fails during an upgrade. As long as there's a procedure
>> the end-user can use to recover the system (on most settop boxes,
>> debricking the system is just a matter of inserting a USB stick and
>> flipping the power switch).
>
> For us on this latest project - and indeed the past few projects - it is
> a major problem (and cost) if the device is bricked. These devices are
> not user-maintainable and we'd be sending engineers out around the world
> to fix.
>
> Not a good impression to make with the customers either.
>
> Whether we're a usual use case I don't know.

I think you're a very usual use case, and it's a valid one indeed. I'm 
just trying to create awareness that there are projects out there that 
use OE for consumer products, and have millions of devices running in 
the end-users' living rooms, who upgrade at a whim (feed servers sending 
out about 4TB traffic each month).

I've also done medical devices where, just as you say, bricking it just 
isn't an option. These are typically inaccessible by the end-user, and 
see no modification other than about 1k of configuration data (e.g. wifi 
keys) during their lifespan.

-- 
Mike Looijmans

