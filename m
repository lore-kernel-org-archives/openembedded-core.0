Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F63CC4167B
	for <webhook@archiver.kernel.org>; Sat,  2 Dec 2023 19:03:38 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.24661.1701543812848755715
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Dec 2023 11:03:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GCYnaVt3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 162BD60002;
	Sat,  2 Dec 2023 19:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701543810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DmE7O4R++ulVz+7PhBCGxyq2a4e88vFXI5Yq+E5DJpY=;
	b=GCYnaVt3zeBmrgzRkimkIioVcLvc+1EzK7bUOpb/Y6DH/WQF6Tn1tzjT2nNqXARnps2IWy
	FU2YtcwGdsxJbJtmEHN3PHu5zLjCbvkZmCGvQMSy2JY6RW0TainloKBA5Z6acXMRsTlqG1
	JLVttImVN962vtgjJgUdcmxtlokDmD0xCsoV9dJQvvUNcmC4OHY+z9/kRjVQBc/iC82HZf
	2ZY4NdhU+cLBLDhv6BjrUINl0FHymjlqmv83FtmnSCJWR7XLAsjCCt9fuFhArOX+h1KBWw
	Ge1LnLqJgmZnpfKxaIEPhiWz2g1WQbXIoXNCcq9NlvjYQAu4Q1RrceI7A34BpQ==
Date: Sat, 2 Dec 2023 20:03:28 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Andrey Popov <andrey.popov@yadro.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3] image-live: Add support for building
 EFI-bootable ISO images for non-x86-based archs
Message-ID: <20231202190328142d6d70@mail.local>
References: <20231130161624.1833206-1-andrey.popov@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130161624.1833206-1-andrey.popov@yadro.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Dec 2023 19:03:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191703

Hello,

This fails on the AB:

https://autobuilder.yoctoproject.org/typhoon/#/builders/58/builds/8051/steps/12/logs/errors

ERROR: Nothing PROVIDES 'libisoburn-native'.

On 30/11/2023 19:16:24+0300, Andrey Popov wrote:
> Since syslinux is only compatible with platforms that use x86-based
> CPUs, this change allows creation of bootable ISO images for other
> EFI-compatible platforms by replacing invocation of the isohybrid
> tool for those platforms with a python script that creates MBR
> partition table with a single entry that points to a bootable
> EFI image placed inside the ISO image.
> 
> Signed-off-by: Andrey Popov <andrey.popov@yadro.com>
> ---
>  meta/classes-recipe/image-live.bbclass | 124 ++++++++++++++++++-------
>  1 file changed, 92 insertions(+), 32 deletions(-)
> 
> diff --git a/meta/classes-recipe/image-live.bbclass b/meta/classes-recipe/image-live.bbclass
> index 95dd44a..c01bc71 100644
> --- a/meta/classes-recipe/image-live.bbclass
> +++ b/meta/classes-recipe/image-live.bbclass
> @@ -2,15 +2,15 @@
>  #
>  # SPDX-License-Identifier: MIT
>  
> -# Creates a bootable image using syslinux, your kernel and an optional
> +# Creates a bootable image using syslinux (for x86), your kernel and an optional
>  # initrd
>  
>  #
>  # End result is two things:
>  #
> -# 1. A .hddimg file which is an msdos filesystem containing syslinux, a kernel,
> -# an initrd and a rootfs image. These can be written to harddisks directly and
> -# also booted on USB flash disks (write them there with dd).
> +# 1. A .hddimg file which is an msdos filesystem containing syslinux (for x86),
> +# a kernel, an initrd and a rootfs image. These can be written to harddisks
> +# directly and also booted on USB flash disks (write them there with dd).
>  #
>  # 2. A CD .iso image
>  
> @@ -18,6 +18,10 @@
>  # in syslinux. Actions based on the label are then performed (e.g. installing to
>  # an hdd)
>  
> +# Since some versions of isohybrid are still looking for the isolinux.bin inside
> +# the target image, if machine does not have pcbios feature defined we have to
> +# use our own method to create EFI-bootable MBR.
> +
>  # External variables (also used by syslinux.bbclass)
>  # ${INITRD} - indicates a list of filesystem images to concatenate and use as an initrd (optional)
>  # ${HDDIMG_ID} - FAT image volume-id
> @@ -29,8 +33,12 @@ do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
>                          mtools-native:do_populate_sysroot \
>                          cdrtools-native:do_populate_sysroot \
>                          virtual/kernel:do_deploy \
> -                        ${MLPREFIX}syslinux:do_populate_sysroot \
> -                        syslinux-native:do_populate_sysroot \
> +                        ${@bb.utils.contains('MACHINE_FEATURES', 'pcbios', \
> +                                             d.getVar('MLPREFIX') + 'syslinux:do_populate_sysroot \
> +                                             syslinux-native:do_populate_sysroot', '', d)} \
> +                        ${@bb.utils.contains('MACHINE_FEATURES', 'efi', \
> +                                             bb.utils.contains('MACHINE_FEATURES', 'pcbios', \
> +                                                               '', 'libisoburn-native:do_populate_sysroot', d), '', d)} \
>                          ${@'%s:do_image_%s' % (d.getVar('PN'), d.getVar('LIVE_ROOTFS_TYPE').replace('-', '_')) if d.getVar('ROOTFS') else ''} \
>                          "
>  
> @@ -66,19 +74,65 @@ COMPACT_ISODIR = "${S}/iso.z"
>  ISOLINUXDIR ?= "/isolinux"
>  ISO_BOOTIMG = "isolinux/isolinux.bin"
>  ISO_BOOTCAT = "isolinux/boot.cat"
> -MKISOFS_OPTIONS = "-no-emul-boot -boot-load-size 4 -boot-info-table"
> +MKISOFS_BOOT_OPTIONS = "-no-emul-boot -boot-load-size 4 -boot-info-table"
>  
>  BOOTIMG_VOLUME_ID   ?= "boot"
>  BOOTIMG_EXTRA_SPACE ?= "512"
>  
> +def compute_chs(sector_z):
> +    C = int(sector_z / (63 * 255))
> +    H = int((sector_z % (63 * 255)) / 63)
> +    # convert zero-based sector to CHS format
> +    S = int(sector_z % 63) + 1
> +    # munge accord to partition table format
> +    S = (S & 0x3f) | (((C >> 8) & 0x3) << 6)
> +    C = (C & 0xFF)
> +    return (C, H, S)
> +
> +def mk_efi_part_table(iso, start, length):
> +    from struct import pack
> +
> +    # Compute starting and ending CHS addresses for the partition entry.
> +    (s_C, s_H, s_S) = compute_chs(start)
> +    (e_C, e_H, e_S) = compute_chs(start + length - 1)
> +
> +    # Write the 66 byte partition table to bytes 0x1BE through 0x1FF in
> +    # sector 0 of the .ISO.
> +    #
> +    # See the partition table format here:
> +    # http://en.wikipedia.org/wiki/Master_boot_record#Sector_layout
> +    f = open(iso, 'r+b')
> +    f.seek(0x1BE)
> +    f.write(pack("<8BLL48xH", 0x80, s_H, s_S, s_C,
> +                 0xEF, e_H, e_S, e_C, start, length, 0xAA55))
> +    f.close()
> +
> +def install_efi_part_table(iso_img):
> +    import subprocess
> +
> +    find_efi_img_cmd = "xorriso -indev %s -find /efi.img \
> +                        -name efi.img -exec report_lba --" % iso_img
> +    ret = subprocess.run(find_efi_img_cmd.split(), capture_output=True)
> +    efi_img_start = -1
> +    efi_img_length = -1
> +    for line in ret.stdout.decode(encoding='utf-8').split("\n"):
> +        if "File data lba:" in line and "/efi.img" in line:
> +            file_stat = line[14:].split(',')
> +            efi_img_start = int(file_stat[1].strip()) * 4
> +            efi_img_length = int(int(file_stat[3].strip()) / 512)
> +            break
> +    if (efi_img_start < 0) or (efi_img_length < 0):
> +        bb.fatal("Failed to determine /efi.img attributes")
> +    mk_efi_part_table(iso_img, efi_img_start, efi_img_length)
> +
>  populate_live() {
> -    populate_kernel $1
> +	populate_kernel $1
>  	if [ -s "${ROOTFS}" ]; then
>  		install -m 0644 ${ROOTFS} $1/rootfs.img
>  	fi
>  }
>  
> -build_iso() {
> +build_iso_base() {
>  	# Only create an ISO if we have an INITRD and the live or iso image type was selected
>  	if [ -z "${INITRD}" ] || [ "${@bb.utils.contains_any('IMAGE_FSTYPES', 'live iso', '1', '0', d)}" != "1" ]; then
>  		bbnote "ISO image will not be created."
> @@ -103,14 +157,6 @@ build_iso() {
>  		build_fat_img ${EFIIMGDIR} ${ISODIR}/efi.img
>  	fi
>  
> -	# EFI only
> -	if [ "${PCBIOS}" != "1" ] && [ "${EFI}" = "1" ] ; then
> -		# Work around bug in isohybrid where it requires isolinux.bin
> -		# In the boot catalog, even though it is not used
> -		mkdir -p ${ISODIR}/${ISOLINUXDIR}
> -		install -m 0644 ${STAGING_DATADIR}/syslinux/isolinux.bin ${ISODIR}${ISOLINUXDIR}
> -	fi
> -
>  	# We used to have support for zisofs; this is a relic of that
>  	mkisofs_compress_opts="-r"
>  
> @@ -128,26 +174,40 @@ build_iso() {
>  		fi
>  	fi
>  
> -	if [ "${PCBIOS}" = "1" ] && [ "${EFI}" != "1" ] ; then
> -		# PCBIOS only media
> -		mkisofs -V ${BOOTIMG_VOLUME_ID} \
> -		        -o ${IMGDEPLOYDIR}/${IMAGE_NAME}.iso \
> -			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} \
> -			$mkisofs_compress_opts \
> -			${MKISOFS_OPTIONS} $mkisofs_iso_level ${ISODIR}
> +	if [ "${PCBIOS}" = "1" ]; then
> +		if [ "${EFI}" = "1" ]; then
> +			# EFI+PCBIOS
> +			mkisofs -A ${BOOTIMG_VOLUME_ID} -V ${BOOTIMG_VOLUME_ID} \
> +				-o ${IMGDEPLOYDIR}/${IMAGE_NAME}.iso \
> +				-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} \
> +				$mkisofs_compress_opts ${MKISOFS_BOOT_OPTIONS} $mkisofs_iso_level \
> +				-eltorito-alt-boot -eltorito-platform efi \
> +				-b efi.img -no-emul-boot \
> +				${ISODIR}
> +			isohybrid_args="-u"
> +		else
> +			# PCBIOS only
> +			mkisofs -V ${BOOTIMG_VOLUME_ID} \
> +				-o ${IMGDEPLOYDIR}/${IMAGE_NAME}.iso \
> +				-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} \
> +				$mkisofs_compress_opts \
> +				${MKISOFS_BOOT_OPTIONS} $mkisofs_iso_level ${ISODIR}
> +		fi
> +
> +		isohybrid $isohybrid_args ${IMGDEPLOYDIR}/${IMAGE_NAME}.iso
>  	else
> -		# EFI only OR EFI+PCBIOS
>  		mkisofs -A ${BOOTIMG_VOLUME_ID} -V ${BOOTIMG_VOLUME_ID} \
> -		        -o ${IMGDEPLOYDIR}/${IMAGE_NAME}.iso \
> -			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} \
> -			$mkisofs_compress_opts ${MKISOFS_OPTIONS} $mkisofs_iso_level \
> -			-eltorito-alt-boot -eltorito-platform efi \
> -			-b efi.img -no-emul-boot \
> +			-o ${IMGDEPLOYDIR}/${IMAGE_NAME}.iso \
> +			$mkisofs_compress_opts $mkisofs_iso_level \
>  			${ISODIR}
> -		isohybrid_args="-u"
>  	fi
> +}
>  
> -	isohybrid $isohybrid_args ${IMGDEPLOYDIR}/${IMAGE_NAME}.iso
> +python build_iso() {
> +    bb.build.exec_func("build_iso_base", d)
> +    if d.getVar("PCBIOS") != "1" and d.getVar("EFI") == "1":
> +        install_efi_part_table(d.getVar("IMGDEPLOYDIR") + "/" + \
> +                               d.getVar("IMAGE_NAME") + ".iso")
>  }
>  
>  build_fat_img() {
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191512): https://lists.openembedded.org/g/openembedded-core/message/191512
> Mute This Topic: https://lists.openembedded.org/mt/102896781/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

