Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D621C3DA60
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 14:15:18 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.39146.1721052911490420730
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 07:15:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mPAe+Ma3;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4265b7514fcso31299615e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 07:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721052910; x=1721657710; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TKbRF475+i8njE7lfi7doo/9sY0h6c1exqIwosZbr+g=;
        b=mPAe+Ma3tvClEtNYoobIC864RUukFHDvxpc5sE79UJvlVNMKIcmBlc28iJu0i2AXuU
         juGN9kGkpENhE3a46tuLX5adhuqRLVxCj4Xyq31tzAY6MNdxoydbdv22wD0thB71jTB6
         FV2JdRbktZpKf8tk2g1anWQ9rn12FQVUyRkn4HJCsiI/7oo64JL7Mxok0KfzNI1ctpBz
         75QOjU+ZKxL4aF2LNVbjhvzsKJvl9HNU+DW2l1Zg98K2S1Brmt5dMykDKeU4gi/OGbff
         03LnlwBOjbDO6S8NNG+3JtYYsfspcioaKu0EdAKs9v6ltM8odyixMXYGOuRk0Va47Ko+
         DOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721052910; x=1721657710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKbRF475+i8njE7lfi7doo/9sY0h6c1exqIwosZbr+g=;
        b=EED55feqvSx9p6G4np1itjb1+LhnUSLslV313jnhWLEJsk6ez51eFaf003qnHdmmuU
         UYR2rjDaX1l4fndRP73mjL2MKCwId8nfCyDRKQPP+zEcWIDBa7A/9Gw9jHfE9ZH5svPG
         A4lrdDMPVY9Ruho2ecouIbaXekZIkn9rF3PtxxD+eZanbwTpSNVb6OFY4BbbdzQ3/GiN
         x/Pg5QeualxFN3VCPKvTHSMKQ89QqtWCVASxWzoo6uptdZy0JpyPyMZmTZjXym++mxaT
         xg7M98KTVt8gL10guvsfqSuE2GpQHKyO8ZGErokT+ze6N5H/ra57+HLkQDDKLS8QZW8I
         mUVw==
X-Gm-Message-State: AOJu0YxxQnvCHrlN7r21YxQENpofBkor6Z4qTt4xJe2twKyMHXUWrBu/
	ZGCub326YwdSSmEGoK5yWa4tbWe+gL90DPAZa3TlYgalConXxdmzrSCSVA==
X-Google-Smtp-Source: AGHT+IFfuNPxONNQnVQ61KgA6fVsrFNlo7dsQJAnhnW3NtYpJq2IAiYSU3/VJm0vqZrQrDUKrNKE5Q==
X-Received: by 2002:a5d:480c:0:b0:362:ff95:5697 with SMTP id ffacd0b85a97d-367ff70cc30mr7169187f8f.28.1721052909600;
        Mon, 15 Jul 2024 07:15:09 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680daccbddsm6499074f8f.64.2024.07.15.07.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 07:15:09 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 4/6] kernel-fitimage: refactor fitimage_assemble
Date: Mon, 15 Jul 2024 16:10:41 +0200
Message-ID: <20240715141448.2158477-5-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240715141448.2158477-1-adrian.freihofer@gmail.com>
References: <20240715141448.2158477-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 14:15:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201930

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Make the fitimage_assemble function usable with absolute paths for the
generated its and the fitImage file.

Later on this will allow to take the linux.bin and the DTB files from
the sstated deploy derectory and write the generated files to a separate
folder with independent sstate-cache handling.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 32 +++++++++++++++------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index 02b5fd8e3f5..705b3ab657f 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -169,8 +169,9 @@ fitimage_emit_section_kernel() {
 
 	ENTRYPOINT="${UBOOT_ENTRYPOINT}"
 	if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
+		kernel_base=$(basename $3)
 		ENTRYPOINT=`${HOST_PREFIX}nm vmlinux | \
-			awk '$3=="${UBOOT_ENTRYSYMBOL}" {print "0x"$1;exit}'`
+			awk '$kernel_base=="${UBOOT_ENTRYSYMBOL}" {print "0x"$1;exit}'`
 	fi
 
 	cat << EOF >> $1
@@ -567,7 +568,7 @@ fitimage_assemble() {
 	setupcount=""
 	bootscr_id=""
 	default_dtb_image=""
-	rm -f $1 arch/${ARCH}/boot/$2
+	rm -f "$1" "arch/${ARCH}/boot/$(basename $2)"
 
 	if [ -n "${UBOOT_SIGN_IMG_KEYNAME}" -a "${UBOOT_SIGN_KEYNAME}" = "${UBOOT_SIGN_IMG_KEYNAME}" ]; then
 		bbfatal "Keys used to sign images and configuration nodes must be different."
@@ -608,6 +609,17 @@ fitimage_assemble() {
 				DTB=`basename $DTB`
 			fi
 
+			# Find DTBs without sub-folders when running in deploy folder
+			if [ ! -e "$DTB_PATH" ]; then
+				DTB=$(basename $DTB)
+				DTB_PATH=$(readlink -f $DTB)
+			fi
+
+			# Fail as early as possible if there is still no DTB file found
+			if [ ! -e "$DTB_PATH" ]; then
+				bberror "Cannot find the DTB file at $DTB_PATH"
+			fi
+
 			# Set the default dtb image if it exists in the devicetree.
 			if [ "${FIT_CONF_DEFAULT_DTB}" = "$DTB" ];then
 				default_dtb_image=$(echo "$DTB" | tr '/' '_')
@@ -658,9 +670,8 @@ fitimage_assemble() {
 
 	if [ -n "${UBOOT_ENV}" ] && [ -d "${STAGING_DIR_HOST}/boot" ]; then
 		if [ -e "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY}" ]; then
-			cp ${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY} ${B}
 			bootscr_id="${UBOOT_ENV_BINARY}"
-			fitimage_emit_section_boot_script $1 "$bootscr_id" ${UBOOT_ENV_BINARY}
+			fitimage_emit_section_boot_script $1 "$bootscr_id" "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY}"
 		else
 			bbwarn "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY} not found."
 		fi
@@ -669,9 +680,14 @@ fitimage_assemble() {
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
@@ -744,8 +760,8 @@ fitimage_assemble() {
 	#
 	${UBOOT_MKIMAGE} \
 		${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
-		-f $1 \
-		${KERNEL_OUTPUT_DIR}/$2
+		-f "$1" \
+		"$2"
 
 	#
 	# Step 8: Sign the image
@@ -754,7 +770,7 @@ fitimage_assemble() {
 		${UBOOT_MKIMAGE_SIGN} \
 			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
 			-F -k "${UBOOT_SIGN_KEYDIR}" \
-			-r ${KERNEL_OUTPUT_DIR}/$2 \
+			-r "$2" \
 			${UBOOT_MKIMAGE_SIGN_ARGS}
 	fi
 }
@@ -763,7 +779,7 @@ do_assemble_fitimage() {
 	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
 		cd ${B}
 		uboot_prep_kimage
-		fitimage_assemble fit-image.its fitImage-none ""
+		fitimage_assemble fit-image.its ${KERNEL_OUTPUT_DIR}/fitImage-none ""
 		if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
 			ln -sf fitImage-none ${B}/${KERNEL_OUTPUT_DIR}/fitImage
 		fi
-- 
2.45.2


