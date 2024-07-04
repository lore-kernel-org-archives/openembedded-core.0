Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3E4C3814E
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 07:10:33 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.4920.1720077028237534754
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 00:10:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hNYkvrXp;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-425624255f3so1776325e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 00:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720077026; x=1720681826; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPt6isDFJtT0jGUsvsuVgCAQmzlr5ID+Zeeft0LO+XM=;
        b=hNYkvrXpZYW3om/sbHH2IUz+majxGZCtYTeMx8+bMQglkEou+kIS/420Q4GQ39WFv7
         hhTD+eUkKwPqj9YQFDcJeGtCiHR0lcXEAvnbBmpMh9j+BTFi9H1HHjwAMl9AAL1rtf6R
         ow9aCfiF4R9I5TXYhzku83W4cEiby8hQf7bncm//PSpDu0ia5raow5hRn1Zx4m6bbqK6
         cHdVpZMOj5URIUc1M1/Xgb8qUWPVLsSQ02TSujuulGCVNrEKydN2LVH/91ThcDQZMHS5
         NBUZCBikZyGDwmqOil6Bw4yqI7jGJttpY1rmhG88y/eG//jWet530kWOVVGQt4E4yQ2H
         TcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720077026; x=1720681826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZPt6isDFJtT0jGUsvsuVgCAQmzlr5ID+Zeeft0LO+XM=;
        b=iZNl0nEibJuQcM0Utfym3OrHglmMV5sPWHqE5eQ/F1XoGDTRtNxUjA31s/So6to8v4
         aBWx+RdS35nCpP6lWs2zxv94ZmUywlGtd2CNj5OtgFmtcpL+GFpB/lJtwRg6tvkvCdvb
         mMw1QJ0ylQPYzcJSya3mpOOQ6bj8/bM7fbUs1EuOeFIBwBZdHdbk38+InvxEcj1V22uE
         a6iMjwaQnKoFxu82poBYlKj5y/W2YzAJJkxLpIC8yEoqG9nDQiLaaVGOYvt6iF3UpGVK
         LfIYnAO3SbahkbXR8FlXgicJNNZOMB8GsjxJA9rIn6jXHKzd93smEP9FCyZNvT8mL4Qc
         DxwQ==
X-Gm-Message-State: AOJu0YyQgx4nTUIwjLw8563K0LThsxkEqaSTeqIZX+abWVGtnBYHkL+9
	lIUoLz0FBSzkc+pdhDuS8ULqYos0uiJDNuA07ueP8SY3FlFB/3eGvtglhA==
X-Google-Smtp-Source: AGHT+IGOuczcLiGVxSFRMau/+fiNbHiqhcsiOal+z5lzEF+I8VgYoFIrF7oaXHFNRELvViRdxWEsug==
X-Received: by 2002:a05:600c:4f42:b0:424:8be4:f2c with SMTP id 5b1f17b1804b1-4264b0cc4b0mr5438355e9.2.1720077026255;
        Thu, 04 Jul 2024 00:10:26 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1f23f9sm11597255e9.26.2024.07.04.00.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 00:10:25 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 10/14] kernel-fitimage: refactor creation of linux.bin
Date: Thu,  4 Jul 2024 09:09:46 +0200
Message-ID: <20240704071013.2982700-11-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240704071013.2982700-1-adrian.freihofer@gmail.com>
References: <20240704071013.2982700-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 07:10:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201515

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Assembling the fitImage with initramfs requires the linux.bin and the
corresponding DTB files. To avoid that the kernel gets re-built from
scratch whenever the initramfs changes, these files must be sstate
cached after the kernel is built, before the fitImage gets assembled.

Therefore the uboot_prep_kimage needs to be split:
- a function creating the linux.bin artifact
- a function which can find the linux.bin file from an independent task
  later on.

This will allow to run the do_assemble_fitimage_initramfs task from the
deploy folder where the linux.bin and the DTBs are provided via
sstate-cache.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass |  8 ++++----
 meta/classes-recipe/kernel-uboot.bbclass    | 17 +++++++++++++++++
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index e084dc57573..64836f6bef0 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -165,12 +165,12 @@ EOF
 # $1 ... .its filename
 # $2 ... Image counter
 # $3 ... Path to kernel image
-# $4 ... Compression type
 fitimage_emit_section_kernel() {
 
 	kernel_csum="${FIT_HASH_ALG}"
 	kernel_sign_algo="${FIT_SIGN_ALG}"
 	kernel_sign_keyname="${UBOOT_SIGN_IMG_KEYNAME}"
+	get_linux_comp
 
 	ENTRYPOINT="${UBOOT_ENTRYPOINT}"
 	if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
@@ -186,7 +186,7 @@ fitimage_emit_section_kernel() {
                         type = "${UBOOT_MKIMAGE_KERNEL_TYPE}";
                         arch = "${UBOOT_ARCH}";
                         os = "linux";
-                        compression = "$4";
+                        compression = "$linux_comp";
                         load = <${UBOOT_LOADADDRESS}>;
                         entry = <$ENTRYPOINT>;
                         hash-1 {
@@ -585,8 +585,6 @@ fitimage_assemble() {
 	# Step 1: Prepare a kernel image section.
 	#
 	fitimage_emit_section_maint $1 imagestart
-
-	uboot_prep_kimage
 	fitimage_emit_section_kernel $1 $kernelcount "$(readlink -f linux.bin)" "$linux_comp"
 
 	#
@@ -785,6 +783,7 @@ fitimage_assemble() {
 do_assemble_fitimage() {
 	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
 		cd ${B}
+		uboot_prep_kimage
 		fitimage_assemble fit-image.its "${KERNEL_OUTPUT_DIR}/fitImage-none" ""
 		if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
 			ln -sf fitImage-none "${B}/${KERNEL_OUTPUT_DIR}/fitImage"
@@ -806,6 +805,7 @@ do_assemble_fitimage_initramfs() {
 	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage" && \
 		test -n "${INITRAMFS_IMAGE}" ; then
 		cd ${B}
+		uboot_prep_kimage
 		if [ "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
 			fitimage_assemble "fit-image-${INITRAMFS_IMAGE}.its" "${KERNEL_OUTPUT_DIR}/fitImage-bundle" ""
 			ln -sf fitImage-bundle "${B}/${KERNEL_OUTPUT_DIR}/fitImage"
diff --git a/meta/classes-recipe/kernel-uboot.bbclass b/meta/classes-recipe/kernel-uboot.bbclass
index 30a85ccc287..e692ca27cdd 100644
--- a/meta/classes-recipe/kernel-uboot.bbclass
+++ b/meta/classes-recipe/kernel-uboot.bbclass
@@ -47,3 +47,20 @@ uboot_prep_kimage() {
 
 	echo "${linux_comp}"
 }
+
+# Get the linux_comp variable back from the linux.bin file
+# which was created by uboot_prep_kimage
+get_linux_comp() {
+	if [ ! -e linux.bin ]; then
+	    bbfatal "linux.bin does not exist $(pwd)"
+	fi
+
+	linux_comp=none
+	if gzip -l linux.bin> /dev/null 2>&1; then
+		linux_comp=gzip
+	elif lzop -l linux.bin> /dev/null 2>&1; then
+		linux_comp=lzo
+	fi
+
+	echo "${linux_comp}"
+}
-- 
2.45.2


