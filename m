Return-Path: <gchoc-openembedded-core@m.gmane.org>
Received: from blaine.gmane.org (195-159-176-226.customer.powertech.no
	[195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id 540807FAA5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2019 20:46:47 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.89)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1iPBuY-000okb-RI for openembedded-core@lists.openembedded.org;
	Mon, 28 Oct 2019 21:46:46 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Ferry Toth <fntoth@gmail.com>
Date: Mon, 28 Oct 2019 21:46:38 +0100
Message-ID: <8733775b-ae58-30a3-2b11-daf8abed85b4@gmail.com>
References: <CAA=hcWTH9VCNgbDbU+ai3sydbWWKNR9HfnuGKu3oQ7XsHN6JBQ@mail.gmail.com>
	<de0e9a45-522a-be55-120a-b3cbd398ec6c@gmail.com>
	<CAA=hcWSTFCUBniK19V-2d0o87PjLN1dkpsWCXhjMXfBQiFvtEw@mail.gmail.com>
	<47af37ed-25aa-65aa-cea7-febfada814f7@gmail.com>
	<CAA=hcWQ8xjT03MC9MQPXgFVB04ZdbE5=Nd8LOE=6w308r44kGg@mail.gmail.com>
	<e91e63ef-9da5-3110-17d2-6f78bf09c904@gmail.com>
	<CAA=hcWTF5GVrEQ6WtjgLoHovrtyNKUUt_aHYpiaQ9pzHtqt7nQ@mail.gmail.com>
Mime-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.2
In-Reply-To: <CAA=hcWTF5GVrEQ6WtjgLoHovrtyNKUUt_aHYpiaQ9pzHtqt7nQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 28 Oct 2019 20:46:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Op 28-10-2019 om 03:02 schreef JH:
> On 10/28/19, Ferry Toth <fntoth@gmail.com> wrote:
>>> No, there is no limitation in kernel, BTW, the zImage-initramfs is not
>>> just kernel space, the zImage-initramfs = kernel + rootfs which cannot
>>> be limited to 10 MB. I have a zImage-initramfs created by openwrt, the
>>> size is 28 MB. The problem is created by oe-core, most likely in
>>> kernel.bbclass, could anyone in oe-core development provide insights
>>> where is the 10 MB limitation from and how to fix it?
>>
>> I see that Ubuntu keeps the initramfs in a separate cpio, while we are
>> trying to build the cpio into the kernel (afaiu the cpio is unpacked
>> into a kernel directory, and then built-in by the kernels build system).
> 
> I built all package formats, rootfs.tar.gz, rootfs.cpio.gz,
> rootfs.cpio.gz.u-boot, zImage->zImage*.bin,
> zImage-initramfs->zImage-initramfs*.bin.
> 
> I did try to run different images to boot it to imx6 RAM, but the
> zImage*.bin (8MB) is the only one I could boot it to imx6 RAM,
> obviously it failed to mount rootfs as it did not bundle the rootfs.
> 
> How did you build the cpio into the kernel?

https://github.com/edison-fw/meta-intel-edison/blob/master/meta-intel-edison-bsp/conf/machine/edison.conf

And there is the max size!

>> And that cpio is ~64MB, so it must be possible.
> 
> Is the 64MB for compressed cpio.gz? If so, that should be fine. Did
> you allude that 64MB is also a limitation for cpio?

No I don't think so.

>> In my case kernel, cpio and zImage-initramfs are all built. And although
>> U-Boot allows to load kernel and cpio separately I didn't try (or don't
>> remember the result). So, maybe that's the trick.
> 
> Both rootfs.cpio.gz and rootfs.cpio.gz.u-boot I built are gzip
> compressed data, thaI cannot be booted to imx6 RAM.
> 
> Here is the image format built from openwrt which I could boot to imx6 RAM:
> 
> 0             0x0             Linux kernel ARM boot executable zImage
> (little-endian)
> 15464         0x3C68          xz compressed data
> 15696         0x3D50          xz compressed data
> 
> Here is the zImage (8MB) image format I build from bitbake which did
> not bundle rootfs, but it could be booted to imx6 RAM
> 
> 0             0x0             Linux kernel ARM boot executable zImage
> (little-endian)
> 6904          0x1AF8          LZO compressed data
> 7316          0x1C94          LZO compressed data
> 7918          0x1EEE          device tree image (dtb)
> 57505         0xE0A1          device tree image (dtb)
> 312284        0x4C3DC         LZ4 compressed data, legacy
> 2049118       0x1F445E        SHA256 hash constants, little endian
> 2372712       0x243468        mcrypt 2.5 encrypted data, algorithm:
> "]", keysize: 23701 bytes, mode: "(",
> 6093219       0x5CF9A3        device tree image (dtb)
> 8127047       0x7C0247        LZ4 compressed data, legacy
> 
> Here is the zImage-initramfs (35 MB) I build from bitbake which
> bundled the rootfs, but could not be booted I believe the cause is the
> size too large:
> 
> 0             0x0             Linux kernel ARM boot executable zImage
> (little-endian)
> 6904          0x1AF8          LZO compressed data
> 7316          0x1C94          LZO compressed data
> 7918          0x1EEE          device tree image (dtb)
> 57505         0xE0A1          device tree image (dtb)
> 312302        0x4C3EE         LZ4 compressed data, legacy
> 2049266       0x1F44F2        SHA256 hash constants, little endian
> 2372864       0x243500        mcrypt 2.5 encrypted data, algorithm:
> "]", keysize: 23701 bytes, mode: "(",
> 6093526       0x5CFAD6        device tree image (dtb)
> 8127489       0x7C0401        LZ4 compressed data, legacy
> 10886101      0xA61BD5        ZBOOT firmware header, header size: 32
> bytes, load address: 0x0564F721, start address: 0x2E4CEE95, checksum:
> 0x22771426, version: 0x1D216514, image size: 185068065 bytes
> 11990008      0xB6F3F8        mcrypt 2.5 encrypted data, algorithm:
> ">", keysize: 2093 bytes, mode: "-",
> 12899061      0xC4D2F5        LZMA compressed data, properties: 0x63,
> dictionary size: 2097152 bytes, uncompressed size: 139006573920 bytes
> 12899237      0xC4D3A5        LZMA compressed data, properties: 0x6C,
> dictionary size: 2097152 bytes, uncompressed size: 541203680 bytes
> 12899272      0xC4D3C8        LZMA compressed data, properties: 0x63,
> dictionary size: 2097152 bytes, uncompressed size: 139810176352 bytes
> 12899719      0xC4D587        LZMA compressed data, properties: 0x65,
> dictionary size: 2097152 bytes, uncompressed size: 541990112 bytes
> 12940308      0xC57414        LZMA compressed data, properties: 0x5E,
> dictionary size: 522190848 bytes, uncompressed size: 2157628 bytes
> 12945629      0xC588DD        LZMA compressed data, properties: 0xBE,
> dictionary size: -1108672512 bytes, uncompressed size: 138831226112
> bytes
> 12948853      0xC59575        LZMA compressed data, properties: 0xC0,
> dictionary size: -551550976 bytes, uncompressed size: 2117660 bytes
> 12995870      0xC64D1E        Copyright string: "Copyright 2017, NXP"
> 13729894      0xD18066        ELF, 32-bit LSB processor-specific,
> 14855286      0xE2AC76        mcrypt 2.5 encrypted data, algorithm:
> "9n", keysize: 2452 bytes, mode: "4",
> 14956131      0xE43663        ELF, 32-bit LSB processor-specific, ("")
> 15462188      0xEBEF2C        device tree image (dtb)
> 15506348      0xEC9BAC        device tree image (dtb)
> 15760959      0xF07E3F        LZ4 compressed data, legacy
> 17497877      0x10AFF15       SHA256 hash constants, little endian
> 17821483      0x10FEF2B       mcrypt 2.5 encrypted data, algorithm:
> "]", keysize: 23701 bytes, mode: "(",
> 21542158      0x148B50E       device tree image (dtb)
> 23402211      0x16516E3       LZ4 compressed data, legacy
> 23899460      0x16CAD44       mcrypt 2.5 encrypted data, algorithm:
> ")}", keysize: 11556 bytes, mode: "|",
> 25538245      0x185AEC5       PARity archive data - file number 13345
> 25763629      0x1891F2D       mcrypt 2.5 encrypted data, algorithm:
> "*l", keysize: 20516 bytes, mode: "~",
> 26601909      0x195E9B5       SHA256 hash constants, little endian
> 27027026      0x19C6652       SHA256 hash constants, little endian
> 27294589      0x1A07B7D       ELF, 32-bit LSB processor-specific, ("")
> 27377983      0x1A1C13F       mcrypt 2.5 encrypted data, algorithm:
> "ute0^", keysize: 25971 bytes, mode: """,
> 27653793      0x1A5F6A1       Base64 standard index table
> 28982449      0x1BA3CB1       ELF, 32-bit LSB processor-specific, ("")
> 29102151      0x1BC1047       LZMA compressed data, properties: 0xB7,
> dictionary size: 1572864 bytes, uncompressed size: 106573083904 bytes
> 30170892      0x1CC5F0C       SHA256 hash constants, little endian
> 31079699      0x1DA3D13       lrzip compressed data
> 31079703      0x1DA3D17       LZ4 compressed data
> 31079707      0x1DA3D1B       LZ4 compressed data, legacy
> 31081483      0x1DA440B       EBML file
> 31165137      0x1DB8AD1       lrzip compressed data
> 31165149      0x1DB8ADD       LZ4 compressed data
> 31165156      0x1DB8AE4       LZ4 compressed data, legacy
> 31167662      0x1DB94AE       Gameboy ROM,
> 31168529      0x1DB9811       EBML file
> 31273481      0x1DD3209       lrzip compressed data
> 31273482      0x1DD320A       rzip compressed data - version 32.-20
> (-1785336650 bytes)
> 31552610      0x1E17462       gzip compressed data, from FAT
> filesystem (MS-DOS, OS/2, NT), last modified: 1970-01-01 00:01:36
> (bogus date)
> 32680766      0x1F2AB3E       eCos RTOS string reference: "ECOS field"
> 33863073      0x204B5A1       mcrypt 2.5 encrypted data, algorithm:
> "_fd", keysize: 8881 bytes, mode: "h",
> 34075614      0x207F3DE       ELF, 32-bit LSB processor-specific, ("")
> 34638178      0x2108962       Copyright string: "copyrighted by many
> authors between 1998-2015."
> 34664157      0x210EEDD       SHA256 hash constants, little endian
> 
> Could anyone share insights how to fix it or if there is a workarounds?
> 
> Thanks Ferry.
> 
> Kind regards,
> 
> - jh
> 



