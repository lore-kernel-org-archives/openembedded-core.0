Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 665F1C61DF4
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 12:45:18 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.18435.1700657114441052745
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 04:45:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eDbBiqcZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9fffa4c4f43so410289566b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 04:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700657113; x=1701261913; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fqhjYl5w8LOzOCTE8sWbviy2v9fZ5k92HrDXd354WwA=;
        b=eDbBiqcZGs4+amWrvd4nVskyKsgz9BZhtz8b8hxGRIbzXe3RWz73oa3qc7LZlJYIrl
         tTNbBXeoeiEuLmxoqCKsoDpEJROVLBdIaqeC1D8KMJSendW+k7uXvFl8IQ4D9CIWHfpm
         HmBJ0powZwQmGgriYRHB7mYXXdqPl1j0vhnx9o9deCiR2tqAIrtHEF6U9/Bzhs93nxQg
         IUfiYonePpdv3VF5d0iL5ayQV17XknN5oa2wmFwVOI2a6xbFVagzWWV6mv4Kt+q/R2eh
         JgRHuWXobyxFCnvLFJGJKaDn/JVXuYYiQINkjrYlOgIA/fII5xDgOgLRX5xn5ur8gBAo
         bUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700657113; x=1701261913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqhjYl5w8LOzOCTE8sWbviy2v9fZ5k92HrDXd354WwA=;
        b=H5w+TorQ64SRjmckniataERp8K7yJYWYT9sC08E3xPCBb9MmexTspsGlzKn6ld5v9A
         n79hqOHVQEFepBsM6zIfrdR+CgJcSOD2l/s5TBMw4tt+MA62yjSxigDanRvt8uUOB7Zf
         TUgGolh/tP1CA5kX2oYCYqh8nqpcx7shZruK5fwI6pkPA63tmDpOCyYDEqFN55XdyLlg
         JEhbmipBx+P7WatXopcqtFS9nK33aVP1kCkqdpZaKQHLk2Pomdb4AE9CrHF8GneM+o+R
         8cVLVQxg6OoRaRka6QM2Zg7xHxdfwyrBQZu1bFCF0YsFGl0HeUbl1udUNE5QzoAy5SY0
         yQJQ==
X-Gm-Message-State: AOJu0Yy+xcGy5VDLrItVqYgSZz+fROdXMWnK6x18rbtZP2DUOVr8bdXe
	08QZhli3e0gEdOXt7JEx9o3KFIMn7m4=
X-Google-Smtp-Source: AGHT+IE7Zy+rRtS67uOFUj0W6chEpAZsowv8wwE9joTa07vvtIYn/XBqPWZd/tN7OGRe5N5JsYUh8g==
X-Received: by 2002:a17:906:535b:b0:a03:7de1:374f with SMTP id j27-20020a170906535b00b00a037de1374fmr1610269ejo.25.1700657112867;
        Wed, 22 Nov 2023 04:45:12 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id e10-20020a170906314a00b009a13fdc139fsm6529375eje.183.2023.11.22.04.45.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 04:45:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/21] kernel-fitimage.bbclass: add .its extension also to links
Date: Wed, 22 Nov 2023 13:44:36 +0100
Message-ID: <f65abce22a039037c01c11ca5a97f3a7ffaade64.1700600804.git.martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1700600804.git.martin.jansa@gmail.com>
References: <cover.1700600804.git.martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 12:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191083

* for consistency with the names

[YOCTO #12937]
---
 meta/classes-recipe/kernel-artifact-names.bbclass | 2 ++
 meta/classes-recipe/kernel-fitimage.bbclass       | 8 ++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/kernel-artifact-names.bbclass b/meta/classes-recipe/kernel-artifact-names.bbclass
index 023ce61de5..1117a5b61f 100644
--- a/meta/classes-recipe/kernel-artifact-names.bbclass
+++ b/meta/classes-recipe/kernel-artifact-names.bbclass
@@ -31,6 +31,8 @@ KERNEL_FIT_NAME ?= "${KERNEL_ARTIFACT_NAME}"
 KERNEL_FIT_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"
 KERNEL_FIT_BIN_EXT ?= "${KERNEL_ARTIFACT_BIN_EXT}"
 
+KERNEL_FIT_ITS_EXT ?= ".its"
+
 MODULE_TARBALL_NAME ?= "${KERNEL_ARTIFACT_NAME}"
 MODULE_TARBALL_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"
 MODULE_TARBALL_DEPLOY ?= "1"
diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index 25a33123a6..ee2496fedc 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -843,14 +843,14 @@ kernel_do_deploy:append() {
 
 		if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
 			bbnote "Copying fit-image.its source file..."
-			install -m 0644 ${B}/fit-image.its "$deployDir/fitImage-its${KERNEL_FIT_NAME}.its"
+			install -m 0644 ${B}/fit-image.its "$deployDir/fitImage-its${KERNEL_FIT_NAME}${KERNEL_FIT_ITS_EXT}"
 			bbnote "Copying linux.bin file..."
 			install -m 0644 ${B}/linux.bin $deployDir/fitImage-linux${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}
 		fi
 
 		if [ -n "${INITRAMFS_IMAGE}" ]; then
 			bbnote "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
-			install -m 0644 ${B}/fit-image-${INITRAMFS_IMAGE}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}${KERNEL_FIT_NAME}.its"
+			install -m 0644 ${B}/fit-image-${INITRAMFS_IMAGE}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}${KERNEL_FIT_NAME}${KERNEL_FIT_ITS_EXT}"
 			if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
 				bbnote "Copying fitImage-${INITRAMFS_IMAGE} file..."
 				install -m 0644 ${B}/${KERNEL_OUTPUT_DIR}/fitImage-${INITRAMFS_IMAGE} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}"
@@ -864,12 +864,12 @@ kernel_do_deploy_links:append() {
 			bbnote "Not creating versioned hardlinks, because KERNEL_FIT_LINK_NAME is empty or identical to KERNEL_FIT_NAME"
 		else
 			if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
-				ln -vf $deployDir/fitImage-its${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its${KERNEL_FIT_LINK_NAME}"
+				ln -vf $deployDir/fitImage-its${KERNEL_FIT_NAME}${KERNEL_FIT_ITS_EXT} "$deployDir/fitImage-its${KERNEL_FIT_LINK_NAME}${KERNEL_FIT_ITS_EXT}"
 				ln -vf $deployDir/fitImage-linux${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT} "$deployDir/fitImage-linux${KERNEL_FIT_LINK_NAME}${KERNEL_FIT_BIN_EXT}"
 			fi
 
 			if [ -n "${INITRAMFS_IMAGE}" ]; then
-				ln -vf $deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}${KERNEL_FIT_LINK_NAME}"
+				ln -vf $deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}${KERNEL_FIT_NAME}${KERNEL_FIT_ITS_EXT} "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}${KERNEL_FIT_LINK_NAME}${KERNEL_FIT_ITS_EXT}"
 				if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
 					ln -vf $deployDir/fitImage-${INITRAMFS_IMAGE_NAME}${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}${KERNEL_FIT_LINK_NAME}${KERNEL_FIT_BIN_EXT}"
 				fi
-- 
2.43.0


