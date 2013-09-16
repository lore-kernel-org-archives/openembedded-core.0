Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DB92860F28
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 17:57:52 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Sep 2013 10:54:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,917,1371106800"; d="scan'208";a="379050578"
Received: from dvhart-mobl4.jf.intel.com (HELO [10.7.201.128]) ([10.7.201.128])
	by orsmga001.jf.intel.com with ESMTP; 16 Sep 2013 10:57:54 -0700
Message-ID: <1379354273.1285.169.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Jason Wessel <jason.wessel@windriver.com>
Date: Mon, 16 Sep 2013 10:57:53 -0700
In-Reply-To: <1379117343-29877-8-git-send-email-jason.wessel@windriver.com>
References: <1379117343-29877-1-git-send-email-jason.wessel@windriver.com>
	<1379117343-29877-8-git-send-email-jason.wessel@windriver.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [v2 PATCH 7/7] bootimage.bbclass, zisofs-tools-native: add ability to compress ISO images
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
X-List-Received-Date: Mon, 16 Sep 2013 17:57:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-09-13 at 19:09 -0500, Jason Wessel wrote:
> The mkzftree is needed to allow ISO images to be compressed with
> minimal runtime overhead.  Below is an example of the savings on a
> core-image-minimal.
> 
> Before ls -l:
> 24117248 core-image-minimal-qemux86-64.iso
> 
> Using the mkzftree ls -l:
> 16777216 core-image-minimal-qemux86-64.iso
> 
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  meta/classes/bootimg.bbclass                       |   24 +++++++++++++++++---
>  .../zisofs-tools/zisofs-tools-native_1.0.8.bb      |   19 ++++++++++++++++
>  2 files changed, 40 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-devtools/zisofs-tools/zisofs-tools-native_1.0.8.bb
> 
> diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
> index 756a287..e9e4e8d 100644
> --- a/meta/classes/bootimg.bbclass
> +++ b/meta/classes/bootimg.bbclass
> @@ -19,13 +19,15 @@
>  
>  # External variables (also used by syslinux.bbclass)
>  # ${INITRD} - indicates a filesystem image to use as an initrd (optional)
> +# ${COMPRESSISO} - Transparent compress ISO, reduce size ~40% if set to 1
>  # ${NOISO}  - skip building the ISO image if set to 1
>  # ${NOHDD}  - skip building the HDD image if set to 1
>  # ${ROOTFS} - indicates a filesystem image to include as the root filesystem (optional)
>  
>  do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
>                          mtools-native:do_populate_sysroot \
> -                        cdrtools-native:do_populate_sysroot"
> +                        cdrtools-native:do_populate_sysroot \
> +                        ${@oe.utils.ifelse(d.getVar('COMPRESSISO'),'zisofs-tools-native:do_populate_sysroot','')}"
>  
>  PACKAGES = " "
>  EXCLUDE_FROM_WORLD = "1"
> @@ -33,6 +35,8 @@ EXCLUDE_FROM_WORLD = "1"
>  HDDDIR = "${S}/hddimg"
>  ISODIR = "${S}/iso"
>  EFIIMGDIR = "${S}/efi_img"
> +COMPACT_ISODIR = "${S}/iso.z"
> +COMPRESSISO ?= ""


Would an explicit '0' here be better?


>  
>  BOOTIMG_VOLUME_ID   ?= "boot"
>  BOOTIMG_EXTRA_SPACE ?= "512"
> @@ -95,18 +99,32 @@ build_iso() {
>  		install -m 0644 ${STAGING_DATADIR}/syslinux/isolinux.bin ${ISODIR}${ISOLINUXDIR}
>  	fi
>  
> +	if [ "${COMPRESSISO}" = "1" ] ; then
> +		# create compact directory, compress iso
> +		mkdir -p ${COMPACT_ISODIR}
> +		mkzftree -z 9 -p 4 -F ${ISODIR}/rootfs.img ${COMPACT_ISODIR}/rootfs.img
> +
> +		# move compact iso to iso, then remove compact directory
> +		mv ${COMPACT_ISODIR}/rootfs.img ${ISODIR}/rootfs.img
> +		rm -Rf ${COMPACT_ISODIR}
> +		mkisofs_compress_opts="-R -z -D -l"
> +	else
> +		mkisofs_compress_opts="-r"
> +	fi
> +
>  	if [ "${PCBIOS}" = "1" ] && [ "${EFI}" != "1" ] ; then
>  		# PCBIOS only media
>  		mkisofs -V ${BOOTIMG_VOLUME_ID} \
>  		        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
> -			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} -r \
> +			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} \
> +			$mkisofs_compress_opts \
>  			${MKISOFS_OPTIONS} ${ISODIR}
>  	else
>  		# EFI only OR EFI+PCIBIOS
>  		mkisofs -A ${BOOTIMG_VOLUME_ID} -V ${BOOTIMG_VOLUME_ID} \
>  		        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
>  			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} \
> -			-r ${MKISOFS_OPTIONS} \
> +			$mkisofs_compress_opts ${MKISOFS_OPTIONS} \
>  			-eltorito-alt-boot -eltorito-platform efi \
>  			-b efi.img -no-emul-boot \
>  			${ISODIR}


OK...


> diff --git a/meta/recipes-devtools/zisofs-tools/zisofs-tools-native_1.0.8.bb b/meta/recipes-devtools/zisofs-tools/zisofs-tools-native_1.0.8.bb
> new file mode 100644
> index 0000000..1501307
> --- /dev/null
> +++ b/meta/recipes-devtools/zisofs-tools/zisofs-tools-native_1.0.8.bb
> @@ -0,0 +1,19 @@
> +# zisofs-tools-native OE build file
> +# Copyright (C) 1989, 1991 Free Software Foundation, Inc.
> +SUMMARY = "A set of tools for iso file compression"
> +DESCRIPTION = "A set of tools for iso file compression"
> +HOMEPAGE = "http://http://freecode.com/projects/zisofs-tools"
> +SECTION = "console/utils"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> +
> +SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/zisofs-tools/zisofs-tools-${PV}.tar.bz2/2d0ed8c9a1f60b45f949b136f9be1f6c/zisofs-tools-${PV}.tar.bz2"
> +
> +SRC_URI[md5sum] = "2d0ed8c9a1f60b45f949b136f9be1f6c"
> +SRC_URI[sha256sum] = "ae4e53e4914934d41660248fb59d3c8761f1f1fd180d5ec993c17ddb3afd04f3"
> +
> +inherit native
> +
> +do_install() {
> +	oe_runmake install INSTALLROOT=${D} bindir=${bindir}
> +}

Does EXTRA_OEMAKE not work here? I see it isn't listed in the reference
manual for the install step (just the compile step), so perhaps not.
Just wanted to check.

Generally speaking, I think this looks fine though and I don't object to
it going in as-is.

Reviewed-by: Darren Hart <dvhart@linux.intel.com>


-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



