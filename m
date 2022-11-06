Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C22C9C433FE
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 14:18:41 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web08.16549.1667744312545607472
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 06:18:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=tcsqSlR7;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id e129so8297795pgc.9
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 06:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QR3rPWxV2qeBWGcO0M2OQTS7/lTNmTCFZnicvyenzD4=;
        b=tcsqSlR7P8ADOBTLnfa9Nd5VLZ/g6wDQ8Io0BJPTQokdrxPoovRjNUS32MLEUOVPXz
         veqHZWc4+CoS8LyTK1HBDB1CN48iA4ZzYgLNj0n5H74PM+HJl24v/hREBVdDd4oaAbLE
         gtDODCxwKNN7BdFCA854MtGNKoBKlSGtV14uJwke+AV582bmG9jp9WtDca5+t+mDsKIz
         +2FiGLa2+GNTftjg9T8S/FGEirNSD6vN9amLO6gX0L+kE8gz8eO7bWMLD94CDF4Fes2S
         Y+3ew26ISPzPJJJIl+Pplp7WVI4kGm2VByh29bJqCm8BY65Q3Jq90G2/akIkzfNgO0wK
         VGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QR3rPWxV2qeBWGcO0M2OQTS7/lTNmTCFZnicvyenzD4=;
        b=wycj9zEl9l6gXR3Ht2Rvk9N4CcshmR/14MP0TLjv3kYFRGg0KD9IEy5CT4TkiKnVU3
         iKGNv5VuQTUJ0lK+c4ty/w9MTikSk1pGzwedpikU5+KakvHW3xJ43p+HrI2ySt/HVyYs
         XoobI6CsOTdMi4gn8lkZOV+K1xJ+up9u4Q4m/ESI1WHmPa4MEoElE6BCdbx8mGzM7wfq
         S4LrAWxQBioLTWrYxoLv7N/sQPa4hiiNf3sg9Rd7K6f+7EQVwgtGM4po7u3cgh3OrlZ4
         DrMI4Y07c2yvwVpkmmvTNEpLcIFuq8bJuBSHFTcUMpT8kxm55aAx+V0Hlts6LWdg7uJv
         YySQ==
X-Gm-Message-State: ACrzQf077mhvIMag2tXcB9/vkc28XqINaH9upZlTCFpu1QHlhdkRQiXY
	29kLEX3/Zaj3C8yG60tN7tD+tg3QMdbAbWQ0
X-Google-Smtp-Source: AMsMyM6gTdhfLXaGugL4uJIpMSvZsO8kEUguJE2m+R6UVZviGdYBasuoXpuNb2HqHFD1anY4EMRzOA==
X-Received: by 2002:a63:4c17:0:b0:43b:e31c:efd0 with SMTP id z23-20020a634c17000000b0043be31cefd0mr39209930pga.213.1667744311630;
        Sun, 06 Nov 2022 06:18:31 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0017534ffd491sm3224907pll.163.2022.11.06.06.18.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 06:18:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 31/34] kernel-fitimage: Use KERNEL_OUTPUT_DIR where appropriate
Date: Sun,  6 Nov 2022 04:17:14 -1000
Message-Id: <dda8017274e71daa7aa4d8a3a15e128df213b0de.1667744095.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667744095.git.steve@sakoman.com>
References: <cover.1667744095.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 14:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172799

From: Sean Anderson <sean.anderson@seco.com>

We have a specific variable for the path to the boot directory. Use it
instead of open-coding this path.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 725b75e83bc2b2111f2ab5103b7e7f60d6d3f34e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index 107914e28c..8ddebf8dd8 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -496,7 +496,7 @@ fitimage_assemble() {
 	ramdiskcount=$3
 	setupcount=""
 	bootscr_id=""
-	rm -f $1 arch/${ARCH}/boot/$2
+	rm -f $1 ${KERNEL_OUTPUT_DIR}/$2
 
 	if [ -n "${UBOOT_SIGN_IMG_KEYNAME}" -a "${UBOOT_SIGN_KEYNAME}" = "${UBOOT_SIGN_IMG_KEYNAME}" ]; then
 		bbfatal "Keys used to sign images and configuration nodes must be different."
@@ -529,9 +529,9 @@ fitimage_assemble() {
 				continue
 			fi
 
-			DTB_PATH="arch/${ARCH}/boot/dts/$DTB"
+			DTB_PATH="${KERNEL_OUTPUT_DIR}/dts/$DTB"
 			if [ ! -e "$DTB_PATH" ]; then
-				DTB_PATH="arch/${ARCH}/boot/$DTB"
+				DTB_PATH="${KERNEL_OUTPUT_DIR}/$DTB"
 			fi
 
 			DTB=$(echo "$DTB" | tr '/' '_')
@@ -574,9 +574,9 @@ fitimage_assemble() {
 	#
 	# Step 4: Prepare a setup section. (For x86)
 	#
-	if [ -e arch/${ARCH}/boot/setup.bin ]; then
+	if [ -e ${KERNEL_OUTPUT_DIR}/setup.bin ]; then
 		setupcount=1
-		fitimage_emit_section_setup $1 $setupcount arch/${ARCH}/boot/setup.bin
+		fitimage_emit_section_setup $1 $setupcount ${KERNEL_OUTPUT_DIR}/setup.bin
 	fi
 
 	#
@@ -650,7 +650,7 @@ fitimage_assemble() {
 	${UBOOT_MKIMAGE} \
 		${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
 		-f $1 \
-		arch/${ARCH}/boot/$2
+		${KERNEL_OUTPUT_DIR}/$2
 
 	#
 	# Step 8: Sign the image and add public key to U-Boot dtb
@@ -667,7 +667,7 @@ fitimage_assemble() {
 			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
 			-F -k "${UBOOT_SIGN_KEYDIR}" \
 			$add_key_to_u_boot \
-			-r arch/${ARCH}/boot/$2 \
+			-r ${KERNEL_OUTPUT_DIR}/$2 \
 			${UBOOT_MKIMAGE_SIGN_ARGS}
 	fi
 }
@@ -770,7 +770,7 @@ kernel_do_deploy:append() {
 
 			if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
 				bbnote "Copying fitImage-${INITRAMFS_IMAGE} file..."
-				install -m 0644 ${B}/arch/${ARCH}/boot/fitImage-${INITRAMFS_IMAGE} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}"
+				install -m 0644 ${B}/${KERNEL_OUTPUT_DIR}/fitImage-${INITRAMFS_IMAGE} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}"
 				if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
 					ln -snf fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
 				fi
-- 
2.25.1


