Return-Path: <gchoc-openembedded-core@m.gmane.org>
Received: from blaine.gmane.org (195-159-176-226.customer.powertech.no
	[195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id 741EE7FBA0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 21:20:40 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.89)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1iOTUE-000c7C-Lt for openembedded-core@lists.openembedded.org;
	Sat, 26 Oct 2019 23:20:38 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Ferry Toth <fntoth@gmail.com>
Date: Sat, 26 Oct 2019 23:20:31 +0200
Message-ID: <de0e9a45-522a-be55-120a-b3cbd398ec6c@gmail.com>
References: <CAA=hcWTH9VCNgbDbU+ai3sydbWWKNR9HfnuGKu3oQ7XsHN6JBQ@mail.gmail.com>
Mime-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.2
In-Reply-To: <CAA=hcWTH9VCNgbDbU+ai3sydbWWKNR9HfnuGKu3oQ7XsHN6JBQ@mail.gmail.com>
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
X-List-Received-Date: Sat, 26 Oct 2019 21:20:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Op 26-10-2019 om 11:46 schreef JH:
> Hi,
> 
> I finally built the
> zImage->zImage--4.19.75+git0+d573e8a79f-r0-20191026074920.bin and
> zImage-initramfs ->
> zImage-initramfs--4.19.75+git0+d573e8a79f-r0-20191026074920.bin based
> on oe-core kernel.bbclass.
> 
> The zImage could be loaded by u-boot on RAM booting but failed at
> mount rootfs which was fine as it did not bundle the rootfs. The
> zImage-initramfs bundled to rootfs, but it could not be started and
> stuck at u-boot Starting kernel, there was no trace of errors.
> 
> Hit any key to stop autoboot:  0
> => bootz ${loadaddr} - ${fdt_addr}
> Kernel image @ 0x80800000 [ 0x000000 - 0x219df80 ]
> ## Flattened Device Tree blob at 83000000
>     Booting using the fdt blob at 0x83000000
>     Using Device Tree in place at 83000000, end 83008831
> ft_system_setup for mx6
> 
> Starting kernel ...
> 
> Because zImage could be started, zImage-initramfs could not, that
> implies there were no issues in the u-boot, is must be something wrong
> with the zImage-initramfs. Seems debug is harder, are there anyway to
> extract information from zImage-initramfs to figure out what is wrong?

As an example you might want to look at my repo, I have 2 images minimal 
and initramfs:
https://github.com/edison-fw/meta-intel-edison/tree/master/meta-intel-edison-distro/recipes-core/images

I don't exactly know how you are doing it. But I'll try to explain what 
I do:
I have
1) a normal rootfs (say edison-image-minimal) and
2) a initramfs rootfs containing kernel modules needed for booting and a 
init script.

Initramfs is build using core-image-minimal-initramfs.bbappend. Some 
additional unneeded packages are pulled, and as size is restricted (10MB 
or so?) we remove them here.

The init script is here: 
https://github.com/edison-fw/meta-intel-edison/blob/master/meta-intel-edison-distro/recipes-core/initrdscripts/initramfs-framework/init

The init script loads modules, waits for the disk with the rootfs to 
appear and mount it. Then switchroot to it.
If it doesn't appear it drops to a shell so you can investigate what's 
wrong.

To build everything edison-image-minimal triggers build of u-boot, 
kernel, rootfs, initramfs and kernel-with-built-in-initramfs.

Search for 'init' and 'live' and find the needed lines in 
https://github.com/edison-fw/meta-intel-edison/blob/master/meta-intel-edison-distro/recipes-core/images/edison-image-minimal.bb

> Thank you.
> 
> Kind regards,
> 
> - jh
> 



