Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.29612.1629979487631845543
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 05:04:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M1W78HO0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id h13so4703680wrp.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 05:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=xPnjKQJXxmOjkA/XxWrBcmA4A605+ByyhVNdfa0K3fM=;
        b=M1W78HO0xX1jA+d4Yj4EqOM/LyEGL3u9fec3Ji3Em/0TpC0Zvrcje8DXlLDggwyWU2
         DXOtvIrKlmNlxwoscrzE+WkJd4h7gNPe4DAmhcT08+fJC/SmKTIN8JN540gtW2w4ggOx
         IEy2fcKMTA1CGkPkuTdnD8LLW31Z1G1Xt80WU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xPnjKQJXxmOjkA/XxWrBcmA4A605+ByyhVNdfa0K3fM=;
        b=RqL9Xpx+Pi5uQpA6HFi8ZxTQXXANIHdHNJjyIAB2PpN0WzhaoH32kNDYVKd9TSpBXX
         PTpalbr4NMzXTXDBK4vL1f/A8ZE5UFw9p3RLFvolPeGZ0ePygPGFHIq82B7vEKuz3mCV
         Eh5lkersHIsOGFWU4yQ6l5Jc0Jo2gEiB4QUF66r40BClv4qtFrDGd0jQAw82pDHKGqvA
         G4bh+qGdz1fzSdlnN5iHcC8W0sp0ooDV4iRMRvw85IRZmu7YupvvPdEuo0rXkLRxREC1
         huRROq1HjrLO8b2OF3D/AVnPZ1DAHlLt5NDAID3SUy07nOBDPNwOaQrMqkqQWA20F6HZ
         DJ3A==
X-Gm-Message-State: AOAM533NNjD+fCIemfur+4avtJNCXyzCwI22K9+wMQgfhkCOoDbxQ7EM
	aU50YII4AvMBBDi9lk61lCnHcGDOjD+2SQ==
X-Google-Smtp-Source: ABdhPJwSllMpeYN4sjAai90U7ZLsyWnjJsGGovvAgkpoiYk4XkLkeONf6fv+3/lkXolAdCPn+ullpw==
X-Received: by 2002:adf:9085:: with SMTP id i5mr3550862wri.241.1629979486043;
        Thu, 26 Aug 2021 05:04:46 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:a9d5:4a4f:480b:62d4? ([2001:8b0:aba:5f3c:a9d5:4a4f:480b:62d4])
        by smtp.gmail.com with ESMTPSA id d124sm2384674wmd.2.2021.08.26.05.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 05:04:45 -0700 (PDT)
Message-ID: <a789a2eaa7233e3a92e9409793d431e70c2ff5b7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 4/4] Support zstd-compressed squashfs and cpio initramfs
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: zboszor@pr.hu, openembedded-core@lists.openembedded.org
Cc: zboszor@gmail.com
Date: Thu, 26 Aug 2021 13:04:45 +0100
In-Reply-To: <20210823145450.103319-6-zboszor@pr.hu>
References: <20210823144712.101597-1-zboszor@pr.hu>
	 <20210823145450.103319-1-zboszor@pr.hu>
	 <20210823145450.103319-6-zboszor@pr.hu>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-08-23 at 16:54 +0200, Zoltan Boszormenyi via lists.openembedded.org
wrote:
> From: Zoltán Böszörményi <zboszor@gmail.com>
> 
> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
> ---
>  meta/classes/base.bbclass            |  4 ++++
>  meta/classes/image_types.bbclass     |  6 ++++--
>  meta/classes/kernel-fitimage.bbclass |  2 +-
>  meta/classes/kernel.bbclass          | 10 ++++++++--
>  4 files changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 11b65171d9..340ebe7d78 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -631,6 +631,10 @@ python () {
>          if path.endswith('.lz4'):
>              d.appendVarFlag('do_unpack', 'depends', ' lz4-native:do_populate_sysroot')
>  
> +        # *.zst should DEPEND on zstd-native for unpacking
> +        elif path.endswith('.zst'):
> +            d.appendVarFlag('do_unpack', 'depends', ' zstd-native:do_populate_sysroot')
> +
>          # *.lz should DEPEND on lzip-native for unpacking
>          elif path.endswith('.lz'):
>              d.appendVarFlag('do_unpack', 'depends', ' lzip-native:do_populate_sysroot')
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index e0eb06c1e3..32d4cd4c76 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -107,6 +107,7 @@ IMAGE_CMD:squashfs = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${
>  IMAGE_CMD:squashfs-xz = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs-xz ${EXTRA_IMAGECMD} -noappend -comp xz"
>  IMAGE_CMD:squashfs-lzo = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs-lzo ${EXTRA_IMAGECMD} -noappend -comp lzo"
>  IMAGE_CMD:squashfs-lz4 = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs-lz4 ${EXTRA_IMAGECMD} -noappend -comp lz4"
> +IMAGE_CMD:squashfs-zst = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs-zst ${EXTRA_IMAGECMD} -noappend -comp zstd"
>  
>  IMAGE_CMD:erofs = "mkfs.erofs ${EXTRA_IMAGECMD} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.erofs ${IMAGE_ROOTFS}"
>  IMAGE_CMD:erofs-lz4 = "mkfs.erofs -zlz4 ${EXTRA_IMAGECMD} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.erofs-lz4 ${IMAGE_ROOTFS}"
> @@ -244,6 +245,7 @@ do_image_squashfs[depends] += "squashfs-tools-native:do_populate_sysroot"
>  do_image_squashfs_xz[depends] += "squashfs-tools-native:do_populate_sysroot"
>  do_image_squashfs_lzo[depends] += "squashfs-tools-native:do_populate_sysroot"
>  do_image_squashfs_lz4[depends] += "squashfs-tools-native:do_populate_sysroot"
> +do_image_squashfs_zst[depends] += "squashfs-tools-native:do_populate_sysroot"
>  do_image_ubi[depends] += "mtd-utils-native:do_populate_sysroot"
>  do_image_ubifs[depends] += "mtd-utils-native:do_populate_sysroot"
>  do_image_multiubi[depends] += "mtd-utils-native:do_populate_sysroot"
> @@ -262,10 +264,10 @@ IMAGE_TYPES = " \
>      btrfs \
>      iso \
>      hddimg \
> -    squashfs squashfs-xz squashfs-lzo squashfs-lz4 \
> +    squashfs squashfs-xz squashfs-lzo squashfs-lz4 squashfs-zst \
>      ubi ubifs multiubi \
>      tar tar.gz tar.bz2 tar.xz tar.lz4 tar.zst \
> -    cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 \
> +    cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 cpio.zst \
>      wic wic.gz wic.bz2 wic.lzma wic.zst \
>      container \
>      f2fs \
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 2ef8f06b14..38e05153e3 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -576,7 +576,7 @@ fitimage_assemble() {
>  	#
>  	if [ "x${ramdiskcount}" = "x1" ] && [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
>  		# Find and use the first initramfs image archive type we find
> -		for img in cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.gz ext2.gz cpio; do
> +		for img in cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.zst cpio.gz ext2.gz cpio; do
>  			initramfs_path="${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.${img}"
>  			echo "Using $initramfs_path"
>  			if [ -e "${initramfs_path}" ]; then
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 9ec7daa17a..ab60e060c6 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -9,6 +9,7 @@ PROVIDES += "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel
>  DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native bison-native"
>  DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lzo", "lzop-native", "", d)}"
>  DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lz4", "lz4-native", "", d)}"
> +DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.zst", "zstd-native", "", d)}"
>  PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
>  
>  do_deploy[depends] += "depmodwrapper-cross:do_populate_sysroot gzip-native:do_populate_sysroot"
> @@ -237,7 +238,7 @@ copy_initramfs() {
>  	mkdir -p ${B}/usr
>  	# Find and use the first initramfs image archive type we find
>  	rm -f ${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
> -	for img in cpio cpio.gz cpio.lz4 cpio.lzo cpio.lzma cpio.xz; do
> +	for img in cpio cpio.gz cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.zst; do
>  		if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img" ]; then
>  			cp ${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img ${B}/usr/.
>  			case $img in
> @@ -266,12 +267,17 @@ copy_initramfs() {
>  				xz -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
>  				break
>  				;;
> +			*zst)
> +				echo "zst decompressing image"
> +				zstd -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
> +				break
> +				;;
>  			esac
>  			break
>  		fi
>  	done
>  	# Verify that the above loop found a initramfs, fail otherwise
> -	[ -f ${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio ] && echo "Finished copy of initramfs into ./usr" || die "Could not find any ${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.cpio{.gz|.lz4|.lzo|.lzma|.xz) for bundling; INITRAMFS_IMAGE_NAME might be wrong."
> +	[ -f ${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio ] && echo "Finished copy of initramfs into ./usr" || die "Could not find any ${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.cpio{.gz|.lz4|.lzo|.lzma|.xz|.zst) for bundling; INITRAMFS_IMAGE_NAME might be wrong."
>  }

Failed in testing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/2467/steps/14/logs/stdio

"mksquashfs: Compressor "zstd" is not supported!"

Cheers,

Richard

