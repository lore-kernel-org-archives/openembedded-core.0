Return-Path: <dvhart@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 12E5F61861
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 18:09:13 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 12 Sep 2013 11:09:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,892,1371106800"; d="scan'208";a="294146350"
Received: from unknown (HELO [10.255.14.117]) ([10.255.14.117])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Sep 2013 11:09:09 -0700
Message-ID: <1379009349.1285.24.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Jason Wessel <jason.wessel@windriver.com>
Date: Thu, 12 Sep 2013 11:09:09 -0700
In-Reply-To: <1379006387-20186-5-git-send-email-jason.wessel@windriver.com>
References: <1379006387-20186-1-git-send-email-jason.wessel@windriver.com>
	<1379006387-20186-5-git-send-email-jason.wessel@windriver.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/5] bootimage.bbclass: Improve EFI & PCBIOS+EFI ISO support
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
X-List-Received-Date: Thu, 12 Sep 2013 18:09:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-09-12 at 12:19 -0500, Jason Wessel wrote:
> Using the latest mkisofs it is possible to generate 3 different types
> of ISO images, which can be used in various scenarios.
> 
> 1) PCBIOS Only ISO
>    - This option remains unchanged by this commit
>    - Uses syslinux menus
>    - Can be directly copied with dd to a USB device
>    - Can be burned to optical media
> 
> 2) EFI Only ISO
>    - Uses grub 2 menus
>    - Can be burned to optical media
>    - If you want to use this image on a USB device
>      extra steps must be taken in order to format the USB
>      device with fat32, and copy an EFI loader which will
>      in turn load the iso image
> 
> 3) PCBIOS / EFI ISO
>    - This is a hybrid image ISO that will work for case 1 or 2
>      as above with the same restrictions and boot menu types
>      depending on what type of firmware is installed on
>      the hardware or depending on if EFI or "Legacy Boot" is
>      enabled on some UEFI firmwares.
> 
> [YOCTO #4100]
> 
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  meta/classes/bootimg.bbclass |   37 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 34 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
> index 2ed7017..b4301e8 100644
> --- a/meta/classes/bootimg.bbclass
> +++ b/meta/classes/bootimg.bbclass
> @@ -35,6 +35,7 @@ EXCLUDE_FROM_WORLD = "1"
>  
>  HDDDIR = "${S}/hddimg"
>  ISODIR = "${S}/iso"
> +EFIIMGDIR = "${S}/efi_img"
>  COMPACT_ISODIR = "${S}/iso.z"
>  
>  BOOTIMG_VOLUME_ID   ?= "boot"
> @@ -109,19 +110,49 @@ build_iso() {
>  		mkisofs_opts="-R -z -D -l"
>  	fi
>  

Am I missing a patch? I don't have this mkisofs_opts in my
bootimg.bbclass....

How are $mkisofs_opts and ${MKISOFS_OPTIONS} related? Do we need both?

> -	if [ "${PCBIOS}" = "1" ]; then
> +	if [ "${EFI}" = "1" ] ; then
> +		# Build a EFI directory to create efi.img
> +		mkdir -p ${EFIIMGDIR}/${EFIDIR}
> +		cp ${ISODIR}/${EFIDIR}/* ${EFIIMGDIR}${EFIDIR}
> +		cp ${ISODIR}/vmlinuz ${EFIIMGDIR}
> +		GRUB_IMAGE="bootia32.efi"
> +		if [ "${TARGET_ARCH}" = "x86_64" ]; then
> +			GRUB_IMAGE="bootx64.efi"
> +		fi
> +		echo "EFI\\BOOT\\${GRUB_IMAGE}" > ${EFIIMGDIR}/startup.nsh
> +		if [ -f "${ISODIR}/initrd" ] ; then
> +			cp ${ISODIR}/initrd ${EFIIMGDIR}
> +		fi
> +		build_fat_img ${EFIIMGDIR} ${ISODIR}/efi.img
> +	fi
> +
> +	# Three ways to build the media
> +	if [ "${PCBIOS}" = "1" -a "${EFI}" = "1" ]; then

Per the Dash as BinSh wiki, the -a syntax is discouraged, best practices
seem to be the use of && and || instead:

if ([ "${PCBIOS}" = "1" ] && [ "${EFI}" = "1" ]); then


> +		# 1) Build EFI + PCBIOS hybrid
> +		mkisofs -A ${BOOTIMG_VOLUME_ID} -V ${BOOTIMG_VOLUME_ID} \
> +		        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
> +			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} $mkisofs_opts \
> +			${MKISOFS_OPTIONS} \
> +			-eltorito-alt-boot -eltorito-platform efi \
> +			-b efi.img -no-emul-boot \
> +			${ISODIR}

Has this been verified on any 32 bit PCBIOS platforms?
It was my understanding the many 32 bit PCBIOS systems had very buggy
el-torito support and didn't deal well with multiple el-torito images on
the same disk. Although... looking at the command above, I'm not sure
you're doing this with mutliple images. Do you have the syslinux and the
efi image combined in the same efi.img?

Has this been verified to work on USB media?
It was explained to me that, at least for some implementations, if the
boot device selection code will not look for ISO9660 on anything that
doesn't have a block size of 2048, making it give up on a USB device
before even attempting to find the ISO9660 FS.



> +	elif [ "${PCBIOS}" = "1" ] ; then
> +		# 2) Build PCBIOS only media
>  		mkisofs -V ${BOOTIMG_VOLUME_ID} \
>  		        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
>  			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} $mkisofs_opts \
>  			${MKISOFS_OPTIONS} ${ISODIR}
>  	else

This should also verify that we are building for EFI. !PCBIOS != EFI. If
none of these options eval to true, an error should be printed

> -		bbnote "EFI-only ISO images are untested, please provide feedback."
>  		mkisofs -V ${BOOTIMG_VOLUME_ID} \
>  		        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
> +			-eltorito-alt-boot -eltorito-platform efi \
> +			-b efi.img -no-emul-boot \
>  			-r ${ISODIR}
>  	fi
>  
> -	isohybrid ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso
> +	if [ "${PCBIOS}" = "1" ]; then
> +		isohybrid ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso
> +	fi

A comment would be good around the isohybrid block describing what it is
doing and why it only applies to PCBIOS.

>  
>  	cd ${DEPLOY_DIR_IMAGE}
>  	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.iso


Thanks Jason, this is long overdue. Your effort here is very much
appreciated.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



