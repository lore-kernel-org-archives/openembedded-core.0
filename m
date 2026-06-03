Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F59CCD6E56
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 10:55:09 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17419.1780484102752240783
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2026 03:55:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ita1KWnO;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b9318997so3716235e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 03:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780484101; x=1781088901; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l50T6TkGNyaJ7upEG2OHJSeJXX34wsszfk4490+mUcA=;
        b=ita1KWnOnadSsgcMrMNY6MRIefy3qPhDgomM4OOalB9NwDLg2cLyEhUNe038tSZ8Fa
         QTFcmjE+9Qak0h0h/GYe5N2WR+SF5IbV6Hgtv5Cqsm8Ci2omFEsanoXzzUusEGk2HYHy
         PfRMrufYI5tlCuc+00IWpIAncynhndPRGLIKaptaZVC/2cbDC6uOlF3F+Meba77IZpAh
         Y8yunW1rxKZyuzJdW+pHv4dGgCvhA91TspvZl+LoIFe0RY1VPLMJFUjN9TXwOjj6N0dH
         coiQBZ7Q9oJhEHN/NZKlGCjoACLlVkRCH2kBOWsI9Zjw4PIva+E2Su8nzL2nSTBegH2c
         6zSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780484101; x=1781088901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l50T6TkGNyaJ7upEG2OHJSeJXX34wsszfk4490+mUcA=;
        b=TAJYGxNPmT+GKFiAPi+QLs5phw5FA/ij6p3WLS7uSp5iBeIYdiXFEzAvA4DhDkQ6j0
         ni4seEWu3RH1YY39SRXDjD2GJKRfTWoSabv9mYo6svbeamoInh7xZ2mkJyNVY3I7g+eT
         6jMf1Bxp8txOk/+eaQhbNpmTmibxSIEKaAQ2KdN/X3A4Mt95VqYyySGttBXkgv5CN0KX
         v4ZBf6v/NfR21GmNIwfeBzNS8J530wCHFFoGE1+nhJuwv1y/rI0OBlZzCTfSNpyMpNDq
         SYUQxEROXgZKTLULOGNz0DBzbLXbIk5z34qgItwqmCeUmZbQLWyWRHFFyVzd5LuazsJX
         xwfQ==
X-Gm-Message-State: AOJu0Yy8qCqj0vgY3/IPGMy9D83OODgsM07H2XTEB6a6sclTBxbQkpwd
	P4XMTLPmE1HnNbaaWgNzbUKQGjAi8LsfUlUN/NXjMvlmAFGfFkrxcccrxe8Nog==
X-Gm-Gg: Acq92OEnz6pYt/OL/3CaJuotIZEL11ReH79pb5gDv6lI2IMX5P8e+UKjxlN/8uAjjZh
	kockbX7F1TmS6q6uFmzuB8CPwGBgMnDxttvsPyEaqxSNdSDyYFIceTd/921Afr/Fmy752pUvYq7
	A2Wnj+//JgfPZhV0SJjVdpsK64GJrq/JaHmJeM8TGnaqfpUyW+oJFa9JXTEaITBIUHAslZRAD11
	YefnoOShKpVn199sGQ/Ovo8QBTZAgZ4SsZ5lSIb0SJsi9TqxXjOeA5Na/cjya9vPziEYjiishFW
	gwM+pn8LegyOPKz4RjmCBB8pZAppThjQjns8og3PB03uGZi9Q4t5vlLvoOEm0kQ3P9C4gDEb1Kt
	Ljv/hdfSnvr3vxccLPXULkQg9Ne4xDDloKnqITXoh1J35IUTjQZId02RTOq0XoNQqf1qCdSHrKC
	EjTedEYBYIWRjJq0RiRmRbIU0G+MTcKf1igeg+oT5yk1Swlu2swKpbO7/xHQO7K6dPiRoCZg7JT
	DlnvHJCIUDDK9b39yMc2TsLP47FJ4fvNt0=
X-Received: by 2002:a05:600c:c10e:b0:485:3abe:ab86 with SMTP id 5b1f17b1804b1-490b5e839bdmr40953275e9.4.1780484100841;
        Wed, 03 Jun 2026 03:55:00 -0700 (PDT)
Received: from host2.home (88-170-249-143.subs.proxad.net. [88.170.249.143])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b7a52dabsm13174295e9.1.2026.06.03.03.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 03:54:59 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@ygreky.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <rybczynska@gmail.com>
Subject: [PATCH v3 1/2] uboot-sign: sign SPL FIT configurations instead of images
Date: Wed,  3 Jun 2026 12:54:52 +0200
Message-ID: <20260603105453.25881-1-marta.rybczynska@ygreky.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 10:55:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238091

From: Marta Rybczynska <rybczynska@gmail.com>

The SPL FIT signing path was signing individual images, but not the configuration.

Introduce signing of configuration with images under a separate option SPL_SIGN_CONF,
enabled by default. It implies changes in the DTB content.

The old behaviour is possible with SPL_SIGN_INDIVIDUAL, but should be removed in
a subsequent patch.

Signed-off-by: Marta Rybczynska <rybczynska@gmail.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 86 ++++++++++++++++++++++++--
 1 file changed, 82 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 9cb5c6ccf3..3729dcd9c8 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -34,6 +34,16 @@ UBOOT_FITIMAGE_ENABLE ?= "0"
 # Signature activation - this requires UBOOT_FITIMAGE_ENABLE = "1"
 SPL_SIGN_ENABLE ?= "0"
 
+# Sign the FIT configuration in the SPL signing flow. Configuration
+# signatures bind the selected images and boot metadata together.
+SPL_SIGN_CONF ?= "1"
+
+# Legacy compatibility knob for per-image signatures in the SPL FIT path.
+# Individual image signatures do not protect the configuration metadata
+# which selects and parameterizes the boot images.
+# INSECURE, use at your own risk
+SPL_SIGN_INDIVIDUAL ?= "0"
+
 # Default value for deployment filenames.
 UBOOT_DTB_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.dtb"
 UBOOT_DTB_BINARY ?= "u-boot.dtb"
@@ -325,7 +335,15 @@ uboot_fitimage_atf() {
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
@@ -352,7 +370,15 @@ uboot_fitimage_tee() {
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
@@ -393,7 +419,15 @@ uboot_fitimage_assemble() {
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
@@ -412,7 +446,15 @@ EOF
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
@@ -442,9 +484,20 @@ EOF
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
@@ -456,6 +509,19 @@ EOF
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
@@ -470,6 +536,18 @@ EOF
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
 			# Sign the U-boot FIT image and add public key to SPL dtb
-- 
2.43.0


