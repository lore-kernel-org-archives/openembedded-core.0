Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C28C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 14:15:59 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web08.11458.1648476958904992903
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 07:15:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E6phwcP/;
 spf=pass (domain: gmail.com, ip: 209.85.167.43,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id w7so25016470lfd.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 07:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XBIuiAaUoKu+WRRN3OSVNupE0aiNlFQwl6sO9vyjorI=;
        b=E6phwcP/nKnE+0vWOvp3+TG2pnJWj4tox7xTzDvn0YCk1yuo8lYxiKXBpw+mjBwwWe
         EcVljirWcLOyGwroMC1uedE35GQNq9zxSPHr4jEiKTIkeRMdiTszBHhHiNVx6eZ4PBan
         PZpm9e9YqdN68d32bguKTxI4YmN6yLAFQQmoSPo3MChwHfr3PmAVVqnuGtsi0gosrCa0
         HsuguuVVspHxiXb3yrP/OWAZs1SL1B6gqb0STXZla+XLggZHxCQsNi6TS7X+mK1Ozd5M
         ZRx9lsWRuVMhtseAchiYGfKgxWLWuRS9qoR72M8eU8OzmTFumR8HtcHM+6Ow/FUi9Cii
         Eq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XBIuiAaUoKu+WRRN3OSVNupE0aiNlFQwl6sO9vyjorI=;
        b=7z39n9stuh8kMahDk1pHEHsfZ0uO5voONIXHeeHDVTMvgeI7A6jpCnNlIuZrNQCY4X
         IOldfe2OaJTNXBeEJrszKF3kOzmEVsKaiTEp5X5IyS3CsuAJ/Uy2RG5bZYtiPWAaTHzk
         g0UF/R6o88HIhDedDQc438UN6zBSEyYmrza+huK2RkYGhjMf1AVIhC/gA0eWWU+OC6Xh
         S52yxLXdy7Pl+e/6LL2t6RLBVWjeyqOIVg8ZMRxEnA2wsS2HWCFlZVzMXl1l/4tIcrGI
         SxxGGtMleupgKMz+GAeYAw48kcdlPJqd9AAoR30Cz3JgT8UVcCaA73StwRG2MSt5lD1h
         DMug==
X-Gm-Message-State: AOAM531LUAaOONoTQ9UYounyc8gGo4XVnpIE/vlSSi8mARt3PQRAwWg2
	ej6eooAeG5zcAAmQBXALrS9ost/pjaCR9g==
X-Google-Smtp-Source: 
 ABdhPJwhPiCOVmxXR4aHGUJFL04ViYFoDYgRFA1rrl/vyvfzbkdnxrsJtxhrBvhoS/IxykTJvuMtNw==
X-Received: by 2002:a19:495b:0:b0:44a:4be2:4347 with SMTP id
 l27-20020a19495b000000b0044a4be24347mr20661658lfj.420.1648476956862;
        Mon, 28 Mar 2022 07:15:56 -0700 (PDT)
Received: from localhost.localdomain ([2a00:801:73c:8290:4c78:ea54:965b:7b3c])
        by smtp.gmail.com with ESMTPSA id
 r11-20020a2e8e2b000000b0024980665874sm1729301ljk.52.2022.03.28.07.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 07:15:56 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH 1/2] kernel-fitimage.bbclass: change 'echo' to
 'bbnote'
Date: Mon, 28 Mar 2022 16:15:50 +0200
Message-Id: <20220328141551.571676-2-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220328141551.571676-1-liu.ming50@gmail.com>
References: <20220328141551.571676-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 14:15:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163708

From: Ming Liu <liu.ming50@gmail.com>

Change 'echo' usages to 'bbnote' for better logging.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/kernel-fitimage.bbclass | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index df5de0427b..13af4daafc 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -568,13 +568,12 @@ fitimage_assemble() {
 		# Find and use the first initramfs image archive type we find
 		for img in cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.zst cpio.gz ext2.gz cpio; do
 			initramfs_path="${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img"
-			echo -n "Searching for $initramfs_path..."
 			if [ -e "$initramfs_path" ]; then
-				echo "found"
+				bbnote "Found initramfs image: $initramfs_path"
 				fitimage_emit_section_ramdisk $1 "$ramdiskcount" "$initramfs_path"
 				break
 			else
-				echo "not found"
+				bbnote "Did not find initramfs image: $initramfs_path"
 			fi
 		done
 	fi
@@ -686,12 +685,12 @@ do_kernel_generate_rsa_keys() {
 			# make directory if it does not already exist
 			mkdir -p "${UBOOT_SIGN_KEYDIR}"
 
-			echo "Generating RSA private key for signing fitImage"
+			bbnote "Generating RSA private key for signing fitImage"
 			openssl genrsa ${FIT_KEY_GENRSA_ARGS} -out \
 				"${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key \
 			"${FIT_SIGN_NUMBITS}"
 
-			echo "Generating certificate for signing fitImage"
+			bbnote "Generating certificate for signing fitImage"
 			openssl req ${FIT_KEY_REQ_ARGS} "${FIT_KEY_SIGN_PKCS}" \
 				-key "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key \
 				-out "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".crt
@@ -704,12 +703,12 @@ do_kernel_generate_rsa_keys() {
 			# make directory if it does not already exist
 			mkdir -p "${UBOOT_SIGN_KEYDIR}"
 
-			echo "Generating RSA private key for signing fitImage"
+			bbnote "Generating RSA private key for signing fitImage"
 			openssl genrsa ${FIT_KEY_GENRSA_ARGS} -out \
 				"${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_IMG_KEYNAME}".key \
 			"${FIT_SIGN_NUMBITS}"
 
-			echo "Generating certificate for signing fitImage"
+			bbnote "Generating certificate for signing fitImage"
 			openssl req ${FIT_KEY_REQ_ARGS} "${FIT_KEY_SIGN_PKCS}" \
 				-key "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_IMG_KEYNAME}".key \
 				-out "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_IMG_KEYNAME}".crt
@@ -725,13 +724,13 @@ kernel_do_deploy:append() {
 	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
 
 		if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
-			echo "Copying fit-image.its source file..."
+			bbnote "Copying fit-image.its source file..."
 			install -m 0644 ${B}/fit-image.its "$deployDir/fitImage-its-${KERNEL_FIT_NAME}.its"
 			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
 				ln -snf fitImage-its-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${KERNEL_FIT_LINK_NAME}"
 			fi
 
-			echo "Copying linux.bin file..."
+			bbnote "Copying linux.bin file..."
 			install -m 0644 ${B}/linux.bin $deployDir/fitImage-linux.bin-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}
 			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
 				ln -snf fitImage-linux.bin-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT} "$deployDir/fitImage-linux.bin-${KERNEL_FIT_LINK_NAME}"
@@ -739,14 +738,14 @@ kernel_do_deploy:append() {
 		fi
 
 		if [ -n "${INITRAMFS_IMAGE}" ]; then
-			echo "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
+			bbnote "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
 			install -m 0644 ${B}/fit-image-${INITRAMFS_IMAGE}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its"
 			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
 				ln -snf fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
 			fi
 
 			if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
-				echo "Copying fitImage-${INITRAMFS_IMAGE} file..."
+				bbnote "Copying fitImage-${INITRAMFS_IMAGE} file..."
 				install -m 0644 ${B}/arch/${ARCH}/boot/fitImage-${INITRAMFS_IMAGE} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}"
 				if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
 					ln -snf fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
@@ -765,9 +764,9 @@ kernel_do_deploy:append() {
 		# If we're also creating and/or signing the uboot fit, now we need to
 		# deploy it, it's its file, as well as u-boot-spl.dtb
 		install -m 0644 ${B}/u-boot-spl-${MACHINE}*.dtb "$deployDir/"
-		echo "Copying u-boot-fitImage file..."
+		bbnote "Copying u-boot-fitImage file..."
 		install -m 0644 ${B}/u-boot-fitImage-* "$deployDir/"
-		echo "Copying u-boot-its file..."
+		bbnote "Copying u-boot-its file..."
 		install -m 0644 ${B}/u-boot-its-* "$deployDir/"
 	fi
 }
-- 
2.25.1


