Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E59C7C2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 20:09:49 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.5650.1720555785439270750
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 13:09:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 469K8gUH005618;
	Tue, 9 Jul 2024 15:08:43 -0500
Received: from [192.168.2.37] ([192.168.2.37])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 469K8f4w032590;
	Tue, 9 Jul 2024 15:08:42 -0500
Message-ID: <e37f2059-2a77-4f33-b3f2-bf2541307013@kernel.crashing.org>
Date: Tue, 9 Jul 2024 15:08:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 09/14] kernel-fitimage: refactor
 do_assemble_fitimage_initramfs
Content-Language: en-US
To: Adrian Freihofer <adrian.freihofer@gmail.com>,
        openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
References: <20240704071013.2982700-1-adrian.freihofer@gmail.com>
 <20240704071013.2982700-10-adrian.freihofer@gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <20240704071013.2982700-10-adrian.freihofer@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 20:09:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201682



On 7/4/24 2:09 AM, Adrian Freihofer wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
> 
> Make the fitimage_assemble function usable with absolute paths for the
> generated its and the fitImage file.
> 
> Later on this will allow to take the linux.bin and the DTB files from
> the sstated deploy derectory and write the generated files to a separate
> folder with independent sstate-cache handling.
> 
> Add 3 comments which are helpful for the next commit.
> 
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>   meta/classes-recipe/kernel-fitimage.bbclass | 49 ++++++++++++++-------
>   1 file changed, 34 insertions(+), 15 deletions(-)
> 
> diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
> index fbeb20596ea..e084dc57573 100644
> --- a/meta/classes-recipe/kernel-fitimage.bbclass
> +++ b/meta/classes-recipe/kernel-fitimage.bbclass
> @@ -174,8 +174,9 @@ fitimage_emit_section_kernel() {
>   
>   	ENTRYPOINT="${UBOOT_ENTRYPOINT}"
>   	if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
> +		kernel_base=$(basename $3)
>   		ENTRYPOINT=`${HOST_PREFIX}nm vmlinux | \
> -			awk '$3=="${UBOOT_ENTRYSYMBOL}" {print "0x"$1;exit}'`
> +			awk '$kernel_base=="${UBOOT_ENTRYSYMBOL}" {print "0x"$1;exit}'`
>   	fi
>   
>   	cat << EOF >> $1
> @@ -572,7 +573,7 @@ fitimage_assemble() {
>   	setupcount=""
>   	bootscr_id=""
>   	default_dtb_image=""
> -	rm -f $1 arch/${ARCH}/boot/$2
> +	rm -f "$1" "arch/${ARCH}/boot/$(basename $2)"
>   
>   	if [ -n "${UBOOT_SIGN_IMG_KEYNAME}" -a "${UBOOT_SIGN_KEYNAME}" = "${UBOOT_SIGN_IMG_KEYNAME}" ]; then
>   		bbfatal "Keys used to sign images and configuration nodes must be different."
> @@ -586,7 +587,7 @@ fitimage_assemble() {
>   	fitimage_emit_section_maint $1 imagestart
>   
>   	uboot_prep_kimage
> -	fitimage_emit_section_kernel $1 $kernelcount linux.bin "$linux_comp"
> +	fitimage_emit_section_kernel $1 $kernelcount "$(readlink -f linux.bin)" "$linux_comp"
>   
>   	#
>   	# Step 2: Prepare a DTB image section
> @@ -610,9 +611,20 @@ fitimage_assemble() {
>   				DTB_PATH="${KERNEL_OUTPUT_DIR}/$DTB"
>   			fi
>   
> -		        # Strip off the path component from the filename
> +			# Strip off the path component from the filename
>   			if "${@'false' if oe.types.boolean(d.getVar('KERNEL_DTBVENDORED')) else 'true'}"; then
> -			    DTB=`basename $DTB`
> +				DTB=`basename $DTB`
> +			fi
> +

I'm purely reading the comment here (below).  It talks about using the 'deploy' 
folder.  I'm not sure what current behavior is, but with our (amd fpga) code, 
we've tried to completely move away from using ANYTHING out of the deploy 
directory.  We found it horrible fragile [during the build] because the 
do_deploy can be delayed or not executed in some cases.  (To be clear that isn't 
a bug!)

Instead everything we've done has moved to using the workdir/recipe-sysroot to 
access files and components.

> +			# Find DTBs without sub-folders when running in deploy folder
> +			if [ ! -e "$DTB_PATH" ]; then
> +				DTB=$(basename $DTB)
> +				DTB_PATH=$(readlink -f $DTB)
> +			fi
> +
> +			# Fail as early as possible if there is still no DTB file found
> +			if [ ! -e "$DTB_PATH" ]; then
> +				bberror "Cannot find the DTB file at $DTB_PATH"
>   			fi
>   
>   			# Set the default dtb image if it exists in the devicetree.
> @@ -665,9 +677,8 @@ fitimage_assemble() {
>   
>   	if [ -n "${UBOOT_ENV}" ] && [ -d "${STAGING_DIR_HOST}/boot" ]; then
>   		if [ -e "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY}" ]; then
> -			cp ${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY} ${B}
>   			bootscr_id="${UBOOT_ENV_BINARY}"
> -			fitimage_emit_section_boot_script $1 "$bootscr_id" ${UBOOT_ENV_BINARY}
> +			fitimage_emit_section_boot_script $1 "$bootscr_id" "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY}"
>   		else
>   			bbwarn "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY} not found."
>   		fi
> @@ -676,9 +687,14 @@ fitimage_assemble() {
>   	#
>   	# Step 4: Prepare a setup section. (For x86)
>   	#
> +	# Run from kernel build folder (bundled mode)
>   	if [ -e ${KERNEL_OUTPUT_DIR}/setup.bin ]; then
>   		setupcount=1
>   		fitimage_emit_section_setup $1 $setupcount ${KERNEL_OUTPUT_DIR}/setup.bin

Same comment here about the 'deploy' vs recipe-sysroot.  It looks to me like 
it's doing all of this in the CWD, but I'm unclear what it has been set to.  So 
this could be an issue?  I think that's why it was KERNEL_OUTPUT_DIR before.

> +	# Run from deploy folder (unbundled mode)
> +	elif [ -e setup.bin ]; then
> +		setupcount=1
> +		fitimage_emit_section_setup $1 $setupcount "$(readlink -f setup.bin)"
>   	fi
>   
>   	#
> @@ -751,8 +767,8 @@ fitimage_assemble() {
>   	#
>   	${UBOOT_MKIMAGE} \
>   		${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
> -		-f $1 \
> -		${KERNEL_OUTPUT_DIR}/$2
> +		-f "$1" \
> +		"$2"
>   
>   	#
>   	# Step 8: Sign the image
> @@ -761,7 +777,7 @@ fitimage_assemble() {
>   		${UBOOT_MKIMAGE_SIGN} \
>   			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
>   			-F -k "${UBOOT_SIGN_KEYDIR}" \
> -			-r ${KERNEL_OUTPUT_DIR}/$2 \
> +			-r "$2" \
>   			${UBOOT_MKIMAGE_SIGN_ARGS}
>   	fi
>   }
> @@ -769,9 +785,9 @@ fitimage_assemble() {
>   do_assemble_fitimage() {
>   	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
>   		cd ${B}
> -		fitimage_assemble fit-image.its fitImage-none ""
> +		fitimage_assemble fit-image.its "${KERNEL_OUTPUT_DIR}/fitImage-none" ""
>   		if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
> -			ln -sf fitImage-none ${B}/${KERNEL_OUTPUT_DIR}/fitImage
> +			ln -sf fitImage-none "${B}/${KERNEL_OUTPUT_DIR}/fitImage"
>   		fi
>   	fi
>   }
> @@ -791,10 +807,10 @@ do_assemble_fitimage_initramfs() {
>   		test -n "${INITRAMFS_IMAGE}" ; then
>   		cd ${B}
>   		if [ "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
> -			fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage-bundle ""
> -			ln -sf fitImage-bundle ${B}/${KERNEL_OUTPUT_DIR}/fitImage
> +			fitimage_assemble "fit-image-${INITRAMFS_IMAGE}.its" "${KERNEL_OUTPUT_DIR}/fitImage-bundle" ""
> +			ln -sf fitImage-bundle "${B}/${KERNEL_OUTPUT_DIR}/fitImage"
>   		else
> -			fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage-${INITRAMFS_IMAGE} 1
> +			fitimage_assemble "fit-image-${INITRAMFS_IMAGE}.its" "${KERNEL_OUTPUT_DIR}/fitImage-${INITRAMFS_IMAGE}" 1
>   		fi
>   	fi
>   }
> @@ -852,6 +868,7 @@ kernel_do_deploy:append() {
>   	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
>   
>   		if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
> +			# deploy the artifacts of do_assemble_fitimage
>   			bbnote "Copying fit-image.its source file..."
>   			install -m 0644 ${B}/fit-image.its "$deployDir/fitImage-its-${KERNEL_FIT_NAME}.its"
>   			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
> @@ -866,12 +883,14 @@ kernel_do_deploy:append() {
>   		fi
>   
>   		if [ -n "${INITRAMFS_IMAGE}" ]; then
> +			# deploy the artifacts of do_assemble_fitimage_initramfs for bundled as well as un-bundled mode
>   			bbnote "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
>   			install -m 0644 ${B}/fit-image-${INITRAMFS_IMAGE}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its"
>   			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
>   				ln -snf fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
>   			fi
>   
> +			# deploy the artifacts of do_assemble_fitimage_initramfs for bundled mode only
>   			if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
>   				bbnote "Copying fitImage-${INITRAMFS_IMAGE} file..."
>   				install -m 0644 ${B}/${KERNEL_OUTPUT_DIR}/fitImage-${INITRAMFS_IMAGE} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201513): https://lists.openembedded.org/g/openembedded-core/message/201513
> Mute This Topic: https://lists.openembedded.org/mt/107033894/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

