Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ScsfF-0001rN-3p
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 08:27:17 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Jun 2012 23:16:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="149906081"
Received: from unknown (HELO [10.255.12.110]) ([10.255.12.110])
	by orsmga001.jf.intel.com with ESMTP; 07 Jun 2012 23:16:44 -0700
Message-ID: <4FD198CB.6080707@linux.intel.com>
Date: Thu, 07 Jun 2012 23:16:43 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4FCE71F6.3060001@linux.intel.com> <4FCF8999.4000405@windriver.com>
	<074C2787-310B-4A3D-84AC-EB2E59D48FF3@dominion.thruhere.net>
In-Reply-To: <074C2787-310B-4A3D-84AC-EB2E59D48FF3@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: RFC: Braindump on Bootloaders, Image Types, and Installers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Jun 2012 06:27:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/07/2012 09:11 AM, Koen Kooi wrote:
>
> Op 6 jun. 2012, om 18:47 heeft Mark Hatle het volgende geschreven:
>
>> I don't have specific comments below, but I can share some of what I will be working on for my company in the next 6 months or so.
>>
>> I will be working on moving the image generation: filesystem construction, filesystem ->  image generation, and similar into a framework that can reside externally of OE-core/bitbake.
>>
>> The idea is that we should have a single framework that can construct the filesystem from the package feeds, construct the images (using the parameters and more that you list below), and then eventually deploy these images onto the target system.
>>
>> Having this external of oe-core will allow it to be invoked by OE-core, as it is today, as well as for on-target installers, people who want to start w/ the package feeds, etc.
>
> Chris Larson mentioned this idea during lunch at the last ELC. For angstrom we already put heavy emphasis on the narcissus tool for users to generate their images and lately I have been needing root permissions for various ext4 tweaks which oe-core/bitbake can't do (and really shouldn't).
>
Hmm, more info here, please.

I am looking at moving OE-Core to use ext4 by default, is there 
something that will break if we do that?  It seems like it's the right 
time to do that based on where maintenance and support of ext3 and ext4 are.

Sau!

> I really like the idea of revamping the whole processes inbetween having packages and making an image out of them.
>
> regards,
>
> Koen
>
>>
>> I believe this fits within the vision you have below, but may throw in some issues when we start talking about external capable tooling.
>>
>> --Mark
>>
>> On 6/5/12 3:54 PM, Darren Hart wrote:
>>> All,
>>>
>>> There has been a lot of discussion scattered across the lists and
>>> bugzilla regarding bootable image types. There are a variety of
>>> different situations, each with specific requirements. Our current set
>>> of image types are showing their age. Here I collect what I've seen in
>>> an attempt to start a consolidated discussion to help arrive at a clear
>>> vision of where we want to be, and to define tasks that we can
>>> distribute across various people. If you are on CC, I intend to include
>>> you in that list of people ;-)
>>>
>>> Current issues:
>>> * hddimg types fail to boot on many intel platforms [3]
>>> * USBZIP image creation is slow and not integrated into the bitbake
>>>    process
>>> * dosfstools is stuck at an old version to avoid requiring GPLv2 to
>>>    build images
>>> * no support for kernel+initramfs as a single blob [9]
>>> * can't create partitioned images as the tools require root access
>>> * hybrid ISO images are more universally bootable, but don't provide
>>>    persistent storage even on USB sticks.
>>> * different boot loaders are used on the live images and the installed
>>>    images
>>> * boot parameters are not preserved across installation [0]
>>> * the installer is very limited to where it can install
>>> * the installer doesn't work for EFI images [1]
>>> * the hddimg will load the first rootfs it finds, even if it isn't the
>>>    one on the hddimg boot media
>>> * the boot prompts are not self descriptive
>>> * EFI, PCBIOS, ISO all have subtly different boot requirements which
>>>    complicate the bootimg recipe and associated classes.
>>> * custom multi-partition images are not supported [4]
>>> * Can't build the image and the bootloader as different arches [5]
>>> * Various issues with unionfs [7] and chroot [8]
>>>
>>> ... and that's just for x86...
>>>
>>> Where I envision images going:
>>>
>>> * Create the follwing image types:
>>>    * Live Installer
>>>      - this is the merger of hddimg, ISO, and ISOHYBRID
>>>      - non-persistent storage
>>>      - intended for demonstration and installation
>>>      - can be written directly to USB sticks or CDs
>>>    * Disk Image
>>>      - create partitioned images (not just volume images)
>>>      - intended to be written to USB sticks, MMC drives, or SATA disks
>>>      - may require a script to assemble the image for specific target
>>>        devices.
>>>    * Initramfs
>>>      - Linux kernel and initramfs as a single image
>>>      - this will require some significant workflow changes as images are
>>>        generated after the kernel and the kernel needs the rootfs to
>>>        build the combined image.
>>>
>>> As for boot loaders. In x86 land, we have syslinux, efilinux, grub, and
>>> grub-efi. We use syslinux for the hddimg and grub after installation,
>>> which accounts for some of the boot parameters being lost in the
>>> transition. I feel we would benefit from unifying the bootloader across
>>> image types and presenting a consistent interface. For the core, I plan
>>> to adopt syslinux everywhere [6]. Syslinux supports ISO images, EXT
>>> filesystems, FAT filesystems, and will support EFI soon enough. It also
>>> has the option for a menu system and basic graphics. With this, we can
>>> greatly improve the initial experience and keep that consistent across
>>> the various image types, as well as after installation.
>>>
>>> EFI merits a special note here. While working with an EFI enabled
>>> system, it often makes sense to work from the EFI shell for a variety of
>>> reasons. As such, packaging and including efibootmgr to manage boot
>>> targets in the EFI firmware is something we should be providing in
>>> addition to the common use case of a boot/install boot loader. Our
>>> current EFI images frequently do not boot automatically, despite using
>>> the "boot/EFI/boot[ARCH].efi" path for the payload as specified in the
>>> EFI specification. This may be do to the media not being ready in time
>>> (USB can be awfully slow). Some additional research is clearly necessary
>>> to properly support EFI in our images, and likely some hacks to work
>>> around buggy firmware [2]. We should be making friends with Matthew Gerrett.
>>>
>>>
>>> References
>>> [0] https://bugzilla.yoctoproject.org/show_bug.cgi?id=2426
>>> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=1919
>>> [2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=1950
>>> [3] https://bugzilla.yoctoproject.org/show_bug.cgi?id=1763
>>> [4] https://bugzilla.yoctoproject.org/show_bug.cgi?id=1780
>>> [5] https://bugzilla.yoctoproject.org/show_bug.cgi?id=2073
>>> [6] https://bugzilla.yoctoproject.org/show_bug.cgi?id=1635
>>> [7] https://bugzilla.yoctoproject.org/show_bug.cgi?id=2343
>>> [8] https://bugzilla.yoctoproject.org/show_bug.cgi?id=2064
>>> [9] https://lists.yoctoproject.org/pipermail/yocto/2012-May/008633.html
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


