Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D97C52D6F
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 15:22:18 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.213179.1724080930743867143
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 08:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b3z7y17t;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-428141be2ddso34536015e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 08:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724080929; x=1724685729; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ladx8L9nqOXtaOZBWO7bu+2AnNG4HnjVyFfCcSGOdI=;
        b=b3z7y17tNL3ziXNNCuVFDtQGDBiifN/w7PCTZXxv4BoN7qdh0qyOX6p1W9PfOW70kG
         nAJbiF9lpNRq+kIrLFdv38hlHSrvRzalMNIZH3r5y0YABD9agtJ+raSooQNbJ5kIuUC/
         +RNkAl2Byj0+C44FANAUFgyrLff05P/OaJOP0JvC+Gic9tPTSNTi6HvyW7rw0TTj9XDi
         RCNDDUwr6zPrs0aVGI20WwXlPx5QTpeWvKdpqZ3kxsp7GRYyUEe9ERa6XtnpeDnswV5h
         U237SDZmCeGirFJRDjawHRodrEjtuzuI/1h82lErkyCVAVlIfv9+DyllGFsENg4A3EN9
         C/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724080929; x=1724685729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ladx8L9nqOXtaOZBWO7bu+2AnNG4HnjVyFfCcSGOdI=;
        b=H/XC1Cfhkrj25fanTZRGv1elr07aRKDleHO8R0E9osZfhFKAW2+gi1Jccja8jLAXUb
         6fmhxHk+wiHQLACmjdsrYHOhRhU+o0UIjxzLhID5SoX9PSAMOoCqv0ByOV/Uc8ScLWdm
         IBouMGPph1AoVyUk0t3kenbAHoJchxDJp5Fe8nqBzEDxsUfi5w9Jx0HAry+awr93wwJR
         IwEVAhhUVuR3KiarJ1rYO/7Bn0QXWN+odd/b+xoe+R6NMkyY1DNWulNilAOYQhbl4Be/
         G9vRcQuIoW+gdLr2my65clUxBkj6OEAQ1Ozrp0ukyo4FI6JHB448csADFDrfM5Nz1gTS
         dItg==
X-Gm-Message-State: AOJu0YzP1GdX3TQcfEedG+q5HM1cIeiw4/J4CzDrZxlkNr6Z61dp8mCE
	c/zB50k5/fSjpw3kfe7q3Ig9r8g3BTjMBYgCyE70wJ8x0w2IOWVChvTGUA==
X-Google-Smtp-Source: AGHT+IEX5+d3o9KIxaxjyH20UYjDLPO0FNn8tRNOR151qza4CP5AUgf5ku/IH3WmJy6OGCjlizR2CA==
X-Received: by 2002:a05:600c:524e:b0:426:6158:962d with SMTP id 5b1f17b1804b1-429ed7d1a08mr70926705e9.23.1724080928746;
        Mon, 19 Aug 2024 08:22:08 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718985a286sm10782649f8f.54.2024.08.19.08.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 08:22:06 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/4] kernel-fitimage: refactor fitimage_assemble
Date: Mon, 19 Aug 2024 17:17:06 +0200
Message-ID: <20240819152136.1185744-3-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819152136.1185744-1-adrian.freihofer@gmail.com>
References: <20240819152136.1185744-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 15:22:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203512

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
2.46.0


