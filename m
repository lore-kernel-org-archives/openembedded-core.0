Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F232C3DA47
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 07:10:34 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.4919.1720077027588936562
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 00:10:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YN13AdZ0;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42562a984d3so1912265e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 00:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720077026; x=1720681826; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJ3iec5ihluS2a3rxR22927fjwYbjNfmkxb9Xw8+NNY=;
        b=YN13AdZ0f6kkTgg5rjUWJKE6jm48OSBvm4fA4/X4CVEbV0XRayuotPncS+yKL16prb
         c34xolWAYoCC5JYuDtYb4Ju/Glye/j7v1g8HETOMltfg+N2D77vMVchlXh+0LmO7ts9e
         s+KNrTN4sZrXj3SdeFcwMxSvGdvk7EMQGzD8eGipSHrm98G24GYKTFfIKL/5/GrB2+s1
         aEY+5C65X4l666McZ99L4t6eDv7uxAcJRxEbQcRYhES77Q3d/bCRqgHosKrNuVOeRyqm
         E2AAreFHSFbO2h6AeMswIOdEr2emGXnGRrGUolGMyyZ2/vu5/9yUHrevjP7/OXGxYh8k
         Q22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720077026; x=1720681826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJ3iec5ihluS2a3rxR22927fjwYbjNfmkxb9Xw8+NNY=;
        b=Y2WqgcV3OaP73QMMY+li08DHCV+QJaCvoZaFpmJHEY8llMUtaZYyAuEg9rs+v5nF5b
         1RFaWTmN8CQV2tJCQfXJHH/fi9tTNR2jRO9P8x6KbLf88bIS+1cQ24gellm0C8GUmm6p
         UOGZm3kHbLNUAZkMuLkE03V5s4u07AgiXr1n8fwvMqyC8fmzdMsvogesB2RlbRS7iSnq
         makzm2vSbvFVXxwuUwtnfRzqF1E0kabl5hBzXgJeAcCfZ8CiUoeYHgdNE7UCLKHADURb
         PSDyijcGr7HLMqHRp/P5f6uKVfOz5JHay8TGy8s4IgItXw9nnbIG+66cX4g4vZMBi+pV
         Lqww==
X-Gm-Message-State: AOJu0Yy+SNeIugrdQ814NB9XBrbrvdeJOdM7Vbj/DPwiu8Ildw3pUr9H
	uEfiWFgiHFITcLIS4Z4FQujiFtzQVlCtS4huALJff4BvsRNXrPQv9jmXlA==
X-Google-Smtp-Source: AGHT+IGs5FDflZCFlaWXgg0Ow5ijsVBdMztecNBWAoSVkjssnv9F9ugvhxgqJztZG/3LIdxAJACfmw==
X-Received: by 2002:a05:600c:1584:b0:425:68b7:e47c with SMTP id 5b1f17b1804b1-4264a3cc8damr5165275e9.5.1720077025611;
        Thu, 04 Jul 2024 00:10:25 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1f23f9sm11597255e9.26.2024.07.04.00.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 00:10:25 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 09/14] kernel-fitimage: refactor do_assemble_fitimage_initramfs
Date: Thu,  4 Jul 2024 09:09:45 +0200
Message-ID: <20240704071013.2982700-10-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240704071013.2982700-1-adrian.freihofer@gmail.com>
References: <20240704071013.2982700-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 07:10:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201513

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Make the fitimage_assemble function usable with absolute paths for the
generated its and the fitImage file.

Later on this will allow to take the linux.bin and the DTB files from
the sstated deploy derectory and write the generated files to a separate
folder with independent sstate-cache handling.

Add 3 comments which are helpful for the next commit.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 49 ++++++++++++++-------
 1 file changed, 34 insertions(+), 15 deletions(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index fbeb20596ea..e084dc57573 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -174,8 +174,9 @@ fitimage_emit_section_kernel() {
 
 	ENTRYPOINT="${UBOOT_ENTRYPOINT}"
 	if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
+		kernel_base=$(basename $3)
 		ENTRYPOINT=`${HOST_PREFIX}nm vmlinux | \
-			awk '$3=="${UBOOT_ENTRYSYMBOL}" {print "0x"$1;exit}'`
+			awk '$kernel_base=="${UBOOT_ENTRYSYMBOL}" {print "0x"$1;exit}'`
 	fi
 
 	cat << EOF >> $1
@@ -572,7 +573,7 @@ fitimage_assemble() {
 	setupcount=""
 	bootscr_id=""
 	default_dtb_image=""
-	rm -f $1 arch/${ARCH}/boot/$2
+	rm -f "$1" "arch/${ARCH}/boot/$(basename $2)"
 
 	if [ -n "${UBOOT_SIGN_IMG_KEYNAME}" -a "${UBOOT_SIGN_KEYNAME}" = "${UBOOT_SIGN_IMG_KEYNAME}" ]; then
 		bbfatal "Keys used to sign images and configuration nodes must be different."
@@ -586,7 +587,7 @@ fitimage_assemble() {
 	fitimage_emit_section_maint $1 imagestart
 
 	uboot_prep_kimage
-	fitimage_emit_section_kernel $1 $kernelcount linux.bin "$linux_comp"
+	fitimage_emit_section_kernel $1 $kernelcount "$(readlink -f linux.bin)" "$linux_comp"
 
 	#
 	# Step 2: Prepare a DTB image section
@@ -610,9 +611,20 @@ fitimage_assemble() {
 				DTB_PATH="${KERNEL_OUTPUT_DIR}/$DTB"
 			fi
 
-		        # Strip off the path component from the filename
+			# Strip off the path component from the filename
 			if "${@'false' if oe.types.boolean(d.getVar('KERNEL_DTBVENDORED')) else 'true'}"; then
-			    DTB=`basename $DTB`
+				DTB=`basename $DTB`
+			fi
+
+			# Find DTBs without sub-folders when running in deploy folder
+			if [ ! -e "$DTB_PATH" ]; then
+				DTB=$(basename $DTB)
+				DTB_PATH=$(readlink -f $DTB)
+			fi
+
+			# Fail as early as possible if there is still no DTB file found
+			if [ ! -e "$DTB_PATH" ]; then
+				bberror "Cannot find the DTB file at $DTB_PATH"
 			fi
 
 			# Set the default dtb image if it exists in the devicetree.
@@ -665,9 +677,8 @@ fitimage_assemble() {
 
 	if [ -n "${UBOOT_ENV}" ] && [ -d "${STAGING_DIR_HOST}/boot" ]; then
 		if [ -e "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY}" ]; then
-			cp ${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY} ${B}
 			bootscr_id="${UBOOT_ENV_BINARY}"
-			fitimage_emit_section_boot_script $1 "$bootscr_id" ${UBOOT_ENV_BINARY}
+			fitimage_emit_section_boot_script $1 "$bootscr_id" "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY}"
 		else
 			bbwarn "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY} not found."
 		fi
@@ -676,9 +687,14 @@ fitimage_assemble() {
 	#
 	# Step 4: Prepare a setup section. (For x86)
 	#
+	# Run from kernel build folder (bundled mode)
 	if [ -e ${KERNEL_OUTPUT_DIR}/setup.bin ]; then
 		setupcount=1
 		fitimage_emit_section_setup $1 $setupcount ${KERNEL_OUTPUT_DIR}/setup.bin
+	# Run from deploy folder (unbundled mode)
+	elif [ -e setup.bin ]; then
+		setupcount=1
+		fitimage_emit_section_setup $1 $setupcount "$(readlink -f setup.bin)"
 	fi
 
 	#
@@ -751,8 +767,8 @@ fitimage_assemble() {
 	#
 	${UBOOT_MKIMAGE} \
 		${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
-		-f $1 \
-		${KERNEL_OUTPUT_DIR}/$2
+		-f "$1" \
+		"$2"
 
 	#
 	# Step 8: Sign the image
@@ -761,7 +777,7 @@ fitimage_assemble() {
 		${UBOOT_MKIMAGE_SIGN} \
 			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
 			-F -k "${UBOOT_SIGN_KEYDIR}" \
-			-r ${KERNEL_OUTPUT_DIR}/$2 \
+			-r "$2" \
 			${UBOOT_MKIMAGE_SIGN_ARGS}
 	fi
 }
@@ -769,9 +785,9 @@ fitimage_assemble() {
 do_assemble_fitimage() {
 	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
 		cd ${B}
-		fitimage_assemble fit-image.its fitImage-none ""
+		fitimage_assemble fit-image.its "${KERNEL_OUTPUT_DIR}/fitImage-none" ""
 		if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
-			ln -sf fitImage-none ${B}/${KERNEL_OUTPUT_DIR}/fitImage
+			ln -sf fitImage-none "${B}/${KERNEL_OUTPUT_DIR}/fitImage"
 		fi
 	fi
 }
@@ -791,10 +807,10 @@ do_assemble_fitimage_initramfs() {
 		test -n "${INITRAMFS_IMAGE}" ; then
 		cd ${B}
 		if [ "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
-			fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage-bundle ""
-			ln -sf fitImage-bundle ${B}/${KERNEL_OUTPUT_DIR}/fitImage
+			fitimage_assemble "fit-image-${INITRAMFS_IMAGE}.its" "${KERNEL_OUTPUT_DIR}/fitImage-bundle" ""
+			ln -sf fitImage-bundle "${B}/${KERNEL_OUTPUT_DIR}/fitImage"
 		else
-			fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage-${INITRAMFS_IMAGE} 1
+			fitimage_assemble "fit-image-${INITRAMFS_IMAGE}.its" "${KERNEL_OUTPUT_DIR}/fitImage-${INITRAMFS_IMAGE}" 1
 		fi
 	fi
 }
@@ -852,6 +868,7 @@ kernel_do_deploy:append() {
 	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
 
 		if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
+			# deploy the artifacts of do_assemble_fitimage
 			bbnote "Copying fit-image.its source file..."
 			install -m 0644 ${B}/fit-image.its "$deployDir/fitImage-its-${KERNEL_FIT_NAME}.its"
 			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
@@ -866,12 +883,14 @@ kernel_do_deploy:append() {
 		fi
 
 		if [ -n "${INITRAMFS_IMAGE}" ]; then
+			# deploy the artifacts of do_assemble_fitimage_initramfs for bundled as well as un-bundled mode
 			bbnote "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
 			install -m 0644 ${B}/fit-image-${INITRAMFS_IMAGE}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its"
 			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
 				ln -snf fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
 			fi
 
+			# deploy the artifacts of do_assemble_fitimage_initramfs for bundled mode only
 			if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
 				bbnote "Copying fitImage-${INITRAMFS_IMAGE} file..."
 				install -m 0644 ${B}/${KERNEL_OUTPUT_DIR}/fitImage-${INITRAMFS_IMAGE} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}"
-- 
2.45.2


