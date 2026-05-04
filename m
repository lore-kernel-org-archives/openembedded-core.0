Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3656CFF885A
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 11:08:18 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12316.1777892896414328322
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2026 04:08:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TYQ3oU38;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so31664885e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2026 04:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777892894; x=1778497694; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qjw9IlJQZ7TAiueRegHLKhpuXUWisziSGML0sTPBSVU=;
        b=TYQ3oU385ews+99p2ru+u6Gsfsey0Mb0CXu1ZgDa5x2Ixi9mf+RkfI+rjfLYo1TKO/
         UtFFKHBC3K8SipR4jXmoHEWSfGo7p9qUJpIl/fK/BIzr8cq8E3tfDp34q5gaUZiH2OuL
         NqOOOl7lOdFH/OfrU2yUzSx1Y6MTnF59D2LaSoZc1Ord387N9X8drT5OeCA8CjkK14/g
         fCb8PXQ53WRcBNRv8gAq5fSSlA44C1ckN91/PSW9ZPW0BASxZxAMP5qcXU/DJT15s86Z
         5ss+h6uPepBeExj6aXHci+K9X91s8lXkUYxdO+Pa7uwWKBpvUl+nF/xiA+FUZFJpj2hg
         lx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777892894; x=1778497694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjw9IlJQZ7TAiueRegHLKhpuXUWisziSGML0sTPBSVU=;
        b=JzO1eA6I7L9t1+BUbbAGitaRoHE7Hsqkc4fLKg6WVO3obZCuXW1Lzeu4TSsHHBFbNf
         F5fOv8ooNO16oGUtLoQ/56MsVnzm7nxE8n1arJUZ+b0+7vIqfWcQK31NRoc9GQPFcyBD
         iwPX95WU8j8++qYvYeBsQw8gFX2yz5NFEf4Ibk1ibyasgYtEiuxSNIa7bwY28qz135Mh
         PBTHT/MWmGjhQ+CLRb5KFYqbb2xHqWKvRyuTCoRtutIEt2FqfboRkBuPjFYVzY5l8tdK
         bUwVFcJyZ2pwci0CMUNO4lsSaw61Vj50UwG0QQ5OnVLP7tTsGXQeDhOL+r15rqQ4g4CH
         Cntw==
X-Gm-Message-State: AOJu0Yya3j3haJMuuNLT79Bs+1T2j+ltZ227TWo1iSXyNfYWgX/7Kzlx
	8Y+aYxlEEEr2tMzIMPbtXJfkxUEkXlnNOJfimcKkJhp+ExPHsUyyo3rFSdF6JQ==
X-Gm-Gg: AeBDietlXuO9LKseu2+hZ2AiLNitjo4eS5TfxPVtLzWp3bn631Mo9dyijoLYzeqlhSt
	Krg96wQnbJ+zui32vgwYhwamzt1gSANo+C/00Bi8DXC/KiU6b+cVV99btzzJkuVVJBgDqeEGwF2
	tpdrZR113Tl8cUygZ+vZ9lmjJPPlSB1m688g4Iq0ojIu/m86esaQK0ccw2OJt6dbTjjklvt4/xN
	SYt/jb4VJoIdqqMyETR0XtMSl0rk4gxLizguikDOafnHznWfgi9aK5fOMFrxvHbChzkpACSyZ3y
	aaS49H4WiCFZyPG4tevouu1ctH/jBbmTudy+XZiKv7odrugo37+lWAoFBq99McFY8b+nMWR7U8W
	A2EZ5gIWSivFL0Nh1qoFwsdfkDRVKvNxENqQlpsx828U0YxEKGT/11M8ByPh25rhYanVJ7t3+io
	tSFrephWB3pXcyRhnsIymQp65TEihZ1UcdCZKtlC/6BQXIBGR4zVsGwx7uCTzOadfwG9tLHVXEY
	HeLaZ8NzfQQeFpmuxp7Yn1F8FI1ahJi+CpgDmdaTrwJITrJ
X-Received: by 2002:a05:600c:a111:b0:48a:8b02:ae91 with SMTP id 5b1f17b1804b1-48a9863cee3mr104953735e9.11.1777892894026;
        Mon, 04 May 2026 04:08:14 -0700 (PDT)
Received: from localhost.localdomain (88-174-158-187.subs.proxad.net. [88.174.158.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301b7bsm384002215e9.11.2026.05.04.04.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 04:08:13 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@ygreky.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <rybczynska@gmail.com>
Subject: [PATCH] uboot-sign: sign SPL FIT configurations instead of images
Date: Mon,  4 May 2026 13:08:03 +0200
Message-ID: <20260504110803.67431-1-marta.rybczynska@ygreky.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 May 2026 11:08:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236447

From: Marta Rybczynska <rybczynska@gmail.com>

The SPL FIT signing patch was signing individual images, but not the configuration.

Introduce signing of configuration with images under a separate option SPL_SIGN_CONF,
enabled by default. It implies changes in the DTB content.

The old behaviour is possible with SPL_SIGN_INDIVIDUAL, but should be removed in
a subsequent patch.

Signed-off-by: Marta Rybczynska <rybczynska@gmail.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 76 ++++++++++++++++++++++++--
 1 file changed, 72 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 9cb5c6ccf3..3af76200bf 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -34,6 +34,15 @@ UBOOT_FITIMAGE_ENABLE ?= "0"
 # Signature activation - this requires UBOOT_FITIMAGE_ENABLE = "1"
 SPL_SIGN_ENABLE ?= "0"
 
+# Sign the FIT configuration in the SPL signing flow. Configuration
+# signatures bind the selected images and boot metadata together.
+SPL_SIGN_CONF ?= "1"
+
+# Legacy compatibility knob for per-image signatures in the SPL FIT path.
+# Individual image signatures do not protect the configuration metadata
+# which selects and parameterizes the boot images.
+SPL_SIGN_INDIVIDUAL ?= "0"
+
 # Default value for deployment filenames.
 UBOOT_DTB_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.dtb"
 UBOOT_DTB_BINARY ?= "u-boot.dtb"
@@ -325,7 +334,15 @@ uboot_fitimage_atf() {
             entry = <${UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT}>;
             compression = "none";
 EOF
-	if [ "${SPL_SIGN_ENABLE}" = "1" ] ; then
+	if [ "${SPL_SIGN_ENABLE}" = "1" ] && [ "${SPL_SIGN_CONF}" = "1" ] ; then
+		cat << EOF >> ${UBOOT_ITS}
+            hash-1 {
+                algo = "${UBOOT_FIT_HASH_ALG}";
+            };
+EOF
+	fi
+
+	if [ "${SPL_SIGN_ENABLE}" = "1" ] && [ "${SPL_SIGN_INDIVIDUAL}" = "1" ] ; then
 		cat << EOF >> ${UBOOT_ITS}
             signature {
                 algo = "${UBOOT_FIT_HASH_ALG},${UBOOT_FIT_SIGN_ALG}";
@@ -352,7 +369,15 @@ uboot_fitimage_tee() {
             entry = <${UBOOT_FIT_TEE_ENTRYPOINT}>;
             compression = "none";
 EOF
-	if [ "${SPL_SIGN_ENABLE}" = "1" ] ; then
+	if [ "${SPL_SIGN_ENABLE}" = "1" ] && [ "${SPL_SIGN_CONF}" = "1" ] ; then
+		cat << EOF >> ${UBOOT_ITS}
+            hash-1 {
+                algo = "${UBOOT_FIT_HASH_ALG}";
+            };
+EOF
+	fi
+
+	if [ "${SPL_SIGN_ENABLE}" = "1" ] && [ "${SPL_SIGN_INDIVIDUAL}" = "1" ] ; then
 		cat << EOF >> ${UBOOT_ITS}
             signature {
                 algo = "${UBOOT_FIT_HASH_ALG},${UBOOT_FIT_SIGN_ALG}";
@@ -393,7 +418,15 @@ uboot_fitimage_assemble() {
             entry = <${UBOOT_FIT_UBOOT_ENTRYPOINT}>;
 EOF
 
-	if [ "${SPL_SIGN_ENABLE}" = "1" ] ; then
+	if [ "${SPL_SIGN_ENABLE}" = "1" ] && [ "${SPL_SIGN_CONF}" = "1" ] ; then
+		cat << EOF >> ${UBOOT_ITS}
+            hash-1 {
+                algo = "${UBOOT_FIT_HASH_ALG}";
+            };
+EOF
+	fi
+
+	if [ "${SPL_SIGN_ENABLE}" = "1" ] && [ "${SPL_SIGN_INDIVIDUAL}" = "1" ] ; then
 		cat << EOF >> ${UBOOT_ITS}
             signature {
                 algo = "${UBOOT_FIT_HASH_ALG},${UBOOT_FIT_SIGN_ALG}";
@@ -412,7 +445,15 @@ EOF
             compression = "none";
 EOF
 
-	if [ "${SPL_SIGN_ENABLE}" = "1" ] ; then
+	if [ "${SPL_SIGN_ENABLE}" = "1" ] && [ "${SPL_SIGN_CONF}" = "1" ] ; then
+		cat << EOF >> ${UBOOT_ITS}
+            hash-1 {
+                algo = "${UBOOT_FIT_HASH_ALG}";
+            };
+EOF
+	fi
+
+	if [ "${SPL_SIGN_ENABLE}" = "1" ] && [ "${SPL_SIGN_INDIVIDUAL}" = "1" ] ; then
 		cat << EOF >> ${UBOOT_ITS}
             signature {
                 algo = "${UBOOT_FIT_HASH_ALG},${UBOOT_FIT_SIGN_ALG}";
@@ -442,8 +483,10 @@ EOF
 		conf_loadables="${conf_loadables}${UBOOT_FIT_CONF_USER_LOADABLES}"
 	fi
 
+	conf_sign_images='"loadables", "fdt"'
 	if [ -n "${UBOOT_FIT_CONF_FIRMWARE}" ] ; then
 		conf_firmware="firmware = \"${UBOOT_FIT_CONF_FIRMWARE}\";"
+		conf_sign_images='"firmware", "loadables", "fdt"'
 	fi
 
 	cat << EOF >> ${UBOOT_ITS}
@@ -456,6 +499,19 @@ EOF
             ${conf_firmware}
             loadables = ${conf_loadables};
             fdt = "fdt";
+EOF
+
+	if [ "${SPL_SIGN_ENABLE}" = "1" ] && [ "${SPL_SIGN_CONF}" = "1" ] ; then
+		cat << EOF >> ${UBOOT_ITS}
+            sign-images = ${conf_sign_images};
+            signature {
+                algo = "${UBOOT_FIT_HASH_ALG},${UBOOT_FIT_SIGN_ALG}";
+                key-name-hint = "${SPL_SIGN_KEYNAME}";
+            };
+EOF
+	fi
+
+	cat << EOF >> ${UBOOT_ITS}
         };
     };
 };
@@ -470,6 +526,18 @@ EOF
 		${UBOOT_FITIMAGE_BINARY}
 
 	if [ "${SPL_SIGN_ENABLE}" = "1" ] ; then
+		if [ "${SPL_SIGN_CONF}" != "1" ] && [ "${SPL_SIGN_INDIVIDUAL}" != "1" ] ; then
+			bbfatal "SPL_SIGN_ENABLE=1 requires SPL_SIGN_CONF=1 or SPL_SIGN_INDIVIDUAL=1"
+		fi
+
+		if [ "${SPL_SIGN_CONF}" != "1" ] ; then
+			bbwarn "SPL_SIGN_CONF is disabled. FIT configuration signing is recommended for SPL verified boot."
+		fi
+
+		if [ "${SPL_SIGN_INDIVIDUAL}" = "1" ] ; then
+			bbwarn "SPL_SIGN_INDIVIDUAL=1 is enabled for compatibility only. Individual image signatures do not replace configuration signing."
+		fi
+
 		if [ -n "${SPL_DTB_BINARY}" ] ; then
 			#
 			# Sign the U-boot FIT image and add public key to SPL dtb
-- 
2.47.3


