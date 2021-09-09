Received: from mail.klausen.dk (mail.klausen.dk [157.90.24.29])
 by mx.groups.io with SMTP id smtpd.web08.3366.1631212420342391070
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 11:33:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@klausen.dk header.s=dkim header.b=H9CQlK0/;
 spf=pass (domain: klausen.dk, ip: 157.90.24.29, mailfrom: kristian@klausen.dk)
Date: Thu, 9 Sep 2021 20:33:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=klausen.dk; s=dkim;
	t=1631212416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+MWxiy3l23V/+ySAvx8KCnE1yavLUpNOFHwCop5sJnA=;
	b=H9CQlK0/r3cGW/uDZEG0Jyu/qjekITMQ9gMOasW8BFOnB6rtH3/kI8wVhgFtGBv4lgc5yM
	wZlK2j66B6ad2f2KXg/GPqv6+wXD0BBOgT3gFe7DLqqDmIT/GWd11nZ4YTcUzAPzpLjjoD
	2LM5wofARPm2Xj34839ak2fdqFyHDOU=
From: "Kristian Klausen" <kristian@klausen.dk>
To: openembedded-core@lists.openembedded.org
Cc: Kristian Klausen <kristian@klausen.dk>
Subject: Re: [RFC][PATCH] kernel: Add Unified Kernel Image image type
Message-ID: <20210909183335.ziiuheuf2i2yljow@bob>
References: <20210908145316.223635-1-kristian@klausen.dk>
MIME-Version: 1.0
In-Reply-To: <20210908145316.223635-1-kristian@klausen.dk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 08, 2021 at 04:53:16PM +0200, Kristian Klausen wrote:
> "A unified kernel image is a single EFI PE executable combining an EFI
> stub loader, a kernel image, an initramfs image, and the kernel command
> line.
> 
> [...]
> 
> Images of this type have the advantage that all metadata and payload
> that makes up the boot entry is monopolized in a single PE file that can
> be signed cryptographically as one for the purpose of EFI
> SecureBoot."[1]
> 
> The cmdline can be set with the UNIFIED_KERNEL_IMAGE_CMDLINE variable.
> 
> [1] https://systemd.io/BOOT_LOADER_SPECIFICATION/#type-2-efi-unified-kernel-images
> 
> Signed-off-by: Kristian Klausen <kristian@klausen.dk>
> ---
> 
> This patch is a RFC as I'm unsure if this is the best way to do it.
> 
> Ideally creating the UKI would happen in the do_install task, but the
> initramfs must be built and adding before
> ${INITRAMFS_IMAGE}:do_image_complete causes a circular dependency.
> 
> Ideally UNIFIED_KERNEL_IMAGE_CMDLINE would also default to ${APPEND} but
> I couldn't get it to work.
> 
> As hinted in the commit message we need this for Secure Boot.

This patch has been superseded by:
"[PATCH] wic/bootimg-efi: Add Unified Kernel Image option"[1]

[1] https://lists.openembedded.org/g/openembedded-core/topic/patch_wic_bootimg_efi_add/85490739

> 
>  meta/classes/kernel.bbclass | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index d13c38fb02..6126528a35 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -1,4 +1,5 @@
>  inherit linux-kernel-base kernel-module-split
> +require conf/image-uefi.conf
>  
>  COMPATIBLE_HOST = ".*-linux"
>  
> @@ -10,6 +11,7 @@ DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-na
>  DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lzo", "lzop-native", "", d)}"
>  DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lz4", "lz4-native", "", d)}"
>  DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.zst", "zstd-native", "", d)}"
> +DEPENDS += "${@bb.utils.contains("KERNEL_IMAGETYPE", "bzImage.efi", "systemd-boot binutils os-release", "", d)}"
>  PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
>  
>  do_deploy[depends] += "depmodwrapper-cross:do_populate_sysroot gzip-native:do_populate_sysroot"
> @@ -30,6 +32,7 @@ INITRAMFS_IMAGE ?= ""
>  INITRAMFS_IMAGE_NAME ?= "${@['${INITRAMFS_IMAGE}-${MACHINE}', ''][d.getVar('INITRAMFS_IMAGE') == '']}"
>  INITRAMFS_TASK ?= ""
>  INITRAMFS_IMAGE_BUNDLE ?= ""
> +UNIFIED_KERNEL_IMAGE_CMDLINE ?= ""
>  
>  # KERNEL_VERSION is extracted from source code. It is evaluated as
>  # None for the first parsing, since the code has not been fetched.
> @@ -85,6 +88,8 @@ python __anonymous () {
>          for type in types.split():
>              if type == 'vmlinux.gz':
>                  type = 'vmlinux'
> +            if type == 'bzImage.efi':
> +                type = 'bzImage'
>              typeformake.add(type)
>  
>          d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', ' '.join(sorted(typeformake)))
> @@ -442,7 +447,7 @@ kernel_do_install() {
>  	#
>  
>  	for imageType in ${KERNEL_IMAGETYPES} ; do
> -		if [ $imageType != "fitImage" ] || [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ] ; then
> +		if [ $imageType != "bzImage.efi" ] && ([ $imageType != "fitImage" ] || [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]); then
>  			install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType ${D}/${KERNEL_IMAGEDEST}/$imageType-${KERNEL_VERSION}
>  		fi
>  	done
> @@ -755,7 +760,18 @@ kernel_do_deploy() {
>  
>  	for imageType in ${KERNEL_IMAGETYPES} ; do
>  		baseName=$imageType-${KERNEL_IMAGE_NAME}
> -		install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType $deployDir/$baseName.bin
> +		if [ "${imageType}" = "bzImage.efi" ]; then
> +			echo "${UNIFIED_KERNEL_IMAGE_CMDLINE}" > cmdline
> +			# https://github.com/systemd/systemd/blob/7728f6aa812f1af563821505d9f377a7f4f727d9/test/test-efi-create-disk.sh#L32-L38
> +			objcopy \
> +				--add-section .osrel="${RECIPE_SYSROOT}${nonarch_libdir}/os-release" --change-section-vma .osrel=0x20000 \
> +				--add-section .cmdline="cmdline" --change-section-vma .cmdline=0x30000 \
> +				--add-section .linux="${KERNEL_OUTPUT_DIR}/bzImage" --change-section-vma .linux=0x2000000 \
> +				--add-section .initrd="${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.${INITRAMFS_FSTYPES}" --change-section-vma .initrd=0x3000000 \
> +				"${DEPLOY_DIR_IMAGE}/linux${EFI_ARCH}.efi.stub" "$deployDir/$baseName.bin"
> +		else
> +			install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType $deployDir/$baseName.bin
> +		fi
>  		ln -sf $baseName.bin $deployDir/$imageType-${KERNEL_IMAGE_LINK_NAME}.bin
>  		ln -sf $baseName.bin $deployDir/$imageType
>  	done
> -- 
> 2.25.1
> 
