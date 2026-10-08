Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B708CA6002
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 06:09:57 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9463.1791439794013362062
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2026 23:09:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=tK+VwhuQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48b042c0759so2090667f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 23:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791439792; x=1792044592; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B8uiRONi4/efkTVyJszkz4CHIoSlpeBTvCcSzw94xfA=;
        b=tK+VwhuQaCYQpb/C3XVubKvA7sr/sY2we6JLDrT7UjKv6EJoGkKVCL7a0ulzw2AB2f
         1ndWipOyhsQuKxCNIY0KsgIGSknVK/PHZKnI9cRubM90M3L8uBweiG93DYWqSBb5qtrJ
         ttdfa1cpcsLJlLTwMc6sMI5JnM4dsaBV//6Yzjd3IjBEy2c3u+wWqAQyYoFc4x9uZ/W9
         xWXjMZOthQsPGD7+cM2RVUAaq1wZj26uwc6rZcrQ0Cm/anuNsPA8lxoCuxgu8odB/dw7
         xnfcWZ9iG2HpqIEwJD/lkiQcEXKwLeWXummq1v7TG7NAroNVva7/jRUi8m/WlDnJFAnU
         s8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439792; x=1792044592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B8uiRONi4/efkTVyJszkz4CHIoSlpeBTvCcSzw94xfA=;
        b=kaJT5WSwCVAOTg2F83IiE4X68/j0ZWiysfdxxGXMvZ4r3Vw3MhjEalhoJpKgmkack0
         i3edxAj/lbqb6/m9W/0j4XV5fSheHtFc4CMoAdybj27PlDx5yJUMZ8s3nODFAA/nBBv9
         2dKTnO2DDGBwqR79XlZpw7JpaGSEnSfPUW+ywsQNr6IcEhTlIvh3KelLLZfEQ8rjvt+s
         ANEejpSL64/oATE4aQTP6Ep2vYuLXRVZAe3U1cC7DlbQIcje+66TMs9+344nSGxYtUxl
         7KEYc+EClCDTq59spXLtvdikZ8WdXiDfFotpO7WsxKRtiRGd+T76nBA7MOfHVKUg5RLX
         to/Q==
X-Gm-Message-State: AFq9FYIVdnzX56wB1ctG2Qjzxh+wjR1V2iirWU+BI596k3DLmdPowZ7H
	0ViZ7zv9bDqTjM6NnNS6lC7jiQN+tQqPozC6TVrHIXv60XpAKIHowV6RHbIWvmz+
X-Gm-Gg: AYBFou3iMiTfqZrVetNYBjdrWJ3jm4ABGHyNj7KQfIX7BD0MeOD3fzY6vKuTvtpC2F4
	T74eza7ALFlSuCo9Sc0W0c43Wphz7D8+J8Py21mdWQr5C642ESHNw3ZVjZkckXcL0W5XRuookTf
	jPvwfWiTXmgwIBvUlsu7yn7CbySLv3kFBRc/xmkyyhkbR5c+YKDomcBWvh1LtyAUcDpQMiR4iuM
	8gj58rvBEOnzlaSfs6FtkfIcgWlToAdifXpwRZdGB9wOm2xqSqOcHwuGW93kf4OX9K+iwWPev5f
	o0g7Ljb6SLpYo4IbTr95s91n2Ic2HTwphyGs0f8scBsJ1TQdx9/GYpNKLJoqLPixvDC+fu2FCad
	vAKPPRNDw0t0vkeEi3hb741qxEKB7FJa9dpHT6zTvQA43LuPCeqAD746dTVri92fkphYbb5En1O
	NMB2UXSG9kEG0Qsr9mmp8dzTqfkhTLE1SYsMVWihFpkLajUnXBwu6cQ8MJJBojIQ4bPsFQmAgtZ
	cWXGRgAn3+UPkkcZbv+666alPE=
X-Received: by 2002:a5d:584c:0:b0:48c:7719:8e56 with SMTP id ffacd0b85a97d-48c77198f37mr6139279f8f.8.1791439791750;
        Wed, 07 Oct 2026 23:09:51 -0700 (PDT)
Received: from penguin.lxd ([81.0.251.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3d3eesm10630219f8f.53.2026.10.07.23.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:09:49 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: a.fatoum@pengutronix.de,
	adrian.freihofer@siemens.com,
	Marta Rybczynska <rybczynska@gmail.com>
Subject: [PATCH v4 1/3] uboot-sign: add the option to sign SPL FIT configurations
Date: Thu,  8 Oct 2026 08:09:33 +0200
Message-Id: <20261008060935.4225-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 06:09:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247413

The SPL FIT signing path was signing individual images, but not the configuration.

Introduce signing of configuration with images under a separate option SPL_SIGN_CONF.
For now it is disabled. Enabling this option implies changes in the DTB content.

The old behaviour is possible with SPL_SIGN_INDIVIDUAL, but should be removed in
a subsequent patch.

Signed-off-by: Marta Rybczynska <rybczynska@gmail.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 86 ++++++++++++++++++++++++--
 1 file changed, 82 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 236d19925e..42319d15ff 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -33,6 +33,16 @@ UBOOT_FITIMAGE_ENABLE ?= "0"
 # Signature activation - this requires UBOOT_FITIMAGE_ENABLE = "1"
 SPL_SIGN_ENABLE ?= "0"
 
+# Sign the FIT configuration in the SPL signing flow. Configuration
+# signatures bind the selected images and boot metadata together.
+SPL_SIGN_CONF ?= "0"
+
+# Legacy compatibility knob for per-image signatures in the SPL FIT path.
+# Individual image signatures do not protect the configuration metadata
+# which selects and parameterizes the boot images.
+# INSECURE, use at your own risk
+SPL_SIGN_INDIVIDUAL ?= "1"
+
 # Default value for deployment filenames.
 UBOOT_DTB_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.dtb"
 UBOOT_DTB_BINARY ?= "u-boot.dtb"
@@ -327,7 +337,15 @@ uboot_fitimage_atf() {
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
@@ -354,7 +372,15 @@ uboot_fitimage_tee() {
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
@@ -395,7 +421,15 @@ uboot_fitimage_assemble() {
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
@@ -414,7 +448,15 @@ EOF
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
@@ -447,9 +489,20 @@ EOF
 		conf_loadables="${conf_loadables}${UBOOT_FIT_CONF_USER_LOADABLES}"
 	fi
 
+	conf_sign_images=""
+	conf_sign_images_sep=""
+
 	if [ -n "${UBOOT_FIT_CONF_FIRMWARE}" ] ; then
 		conf_firmware="firmware = \"${UBOOT_FIT_CONF_FIRMWARE}\";"
+		conf_sign_images="${conf_sign_images}${conf_sign_images_sep}\"firmware\""
+		conf_sign_images_sep=", "
+	fi
+
+	if [ -n "${conf_loadables}" ] ; then
+		conf_sign_images="${conf_sign_images}${conf_sign_images_sep}\"loadables\""
+		conf_sign_images_sep=", "
 	fi
+	conf_sign_images="${conf_sign_images}${conf_sign_images_sep}\"fdt\""
 
 	cat << EOF >> ${UBOOT_ITS}
     };
@@ -461,6 +514,19 @@ EOF
             ${conf_firmware}
             loadables = ${conf_loadables};
             fdt = "fdt";
+EOF
+
+	if [ "${SPL_SIGN_ENABLE}" = "1" ] && [ "${SPL_SIGN_CONF}" = "1" ] ; then
+		cat << EOF >> ${UBOOT_ITS}
+            signature {
+                algo = "${UBOOT_FIT_HASH_ALG},${UBOOT_FIT_SIGN_ALG}";
+                key-name-hint = "${SPL_SIGN_KEYNAME}";
+                sign-images = ${conf_sign_images};
+            };
+EOF
+	fi
+
+	cat << EOF >> ${UBOOT_ITS}
         };
     };
 };
@@ -475,6 +541,18 @@ EOF
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
+			bbwarn "SPL_SIGN_INDIVIDUAL=1 is enabled for compatibility only. It is INSECURE. Individual image signatures do not replace configuration signing."
+		fi
+
 		if [ -n "${SPL_DTB_BINARY}" ] ; then
 			#
 			# Sign the U-boot FIT image and add public key to SPL dtb.
-- 
2.43.0


