Return-Path: <gchoc-openembedded-core@m.gmane.org>
Received: from blaine.gmane.org (195-159-176-226.customer.powertech.no
	[195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id DBBD47FA95
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 12:24:27 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.89)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1iOhau-000rDG-DG for openembedded-core@lists.openembedded.org;
	Sun, 27 Oct 2019 13:24:28 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Ferry Toth <fntoth@gmail.com>
Date: Sun, 27 Oct 2019 13:24:20 +0100
Message-ID: <47af37ed-25aa-65aa-cea7-febfada814f7@gmail.com>
References: <CAA=hcWTH9VCNgbDbU+ai3sydbWWKNR9HfnuGKu3oQ7XsHN6JBQ@mail.gmail.com>
	<de0e9a45-522a-be55-120a-b3cbd398ec6c@gmail.com>
	<CAA=hcWSTFCUBniK19V-2d0o87PjLN1dkpsWCXhjMXfBQiFvtEw@mail.gmail.com>
Mime-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.2
In-Reply-To: <CAA=hcWSTFCUBniK19V-2d0o87PjLN1dkpsWCXhjMXfBQiFvtEw@mail.gmail.com>
Cc: public-openembedded-core-ZwoEplunGu3dfDuKDZ/zN51Ccm5ICvs9@plane.gmane.org
Subject: Re: zimage Initramfs booting stuck at Start Kernel
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
X-List-Received-Date: Sun, 27 Oct 2019 12:24:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Op 27-10-2019 om 02:27 schreef JH:
> Hi Ferry,
> 
> On 10/27/19, Ferry Toth <fntoth@gmail.com> wrote:
>>
>> As an example you might want to look at my repo, I have 2 images minimal
>> and initramfs:
>> https://github.com/edison-fw/meta-intel-edison/tree/master/meta-intel-edison-distro/recipes-core/images
>>
>> I don't exactly know how you are doing it. But I'll try to explain what
>> I do:
>> I have
>> 1) a normal rootfs (say edison-image-minimal) and
>> 2) a initramfs rootfs containing kernel modules needed for booting and a
>> init script.
>>
>> Initramfs is build using core-image-minimal-initramfs.bbappend. Some
>> additional unneeded packages are pulled, and as size is restricted (10MB
>> or so?) we remove them here.
> 
> Thanks for the tips, that confirms my long suspensions that the size
> of the image could be the cause of the problem, my working zImage size
> is 8MB, my failing zImager-initramfs size is 35MB. How did you remove
> the 10 MB size restriction? I checked your

I don't. I reduce the contents as much as possible.

> core-image-minimal-initramfs.bbappend, there is no sign to remove 10
> MB size restriction. You have a resize-rootfs.service, but I am not
> sure that is the one for fixing the 10 MB size restriction. The

No, it isn't.

> edison-image-minimal.bb has the IMAGE_ROOTFS_SIZE = "1048576", sorry
> for my dumb, is that size for 1048576 KB (1GB) or 1048576 B (1MB)?

The rootfs is on disk (/) and is 1GB. It has nothing to do with initramfs.

>> The init script is here:
>> https://github.com/edison-fw/meta-intel-edison/blob/master/meta-intel-edison-distro/recipes-core/initrdscripts/initramfs-framework/init
>>
>> The init script loads modules, waits for the disk with the rootfs to
>> appear and mount it. Then switchroot to it.
>> If it doesn't appear it drops to a shell so you can investigate what's
>> wrong.
> 
> I am confident that the 10 MB size restriction is the problem, I am
> not clear where that 10 MB size restriction is defined and how to fix
> the size restriction, appreciate your helps.

I am not sure where it comes from, I think internal in the kernel there 
is a limit, after uncompress. Initramfs is in ram, I think we just need 
to accept there is a size restriction.

>> To build everything edison-image-minimal triggers build of u-boot,
>> kernel, rootfs, initramfs and kernel-with-built-in-initramfs.
> 
>> Search for 'init' and 'live' and find the needed lines in
>> https://github.com/edison-fw/meta-intel-edison/blob/master/meta-intel-edison-distro/recipes-core/images/edison-image-minimal.bb
> 
> I looked at the init script, but not clear if it is critical for
> fixing that issue or not. My init is the symblic link to
> /lib/systemd/systemd in imx6.

Given the size restriction I think we have no choice to use initramfs to 
load minimum required modules and then mount and switchroot to a file 
system on disk. So, yes, you need to modify init for that. After 
switchroot there will be a new init, the symbolic link you mention.

> Thank you very much.
> 
> Kind regards,
> 
> - jh
> 



