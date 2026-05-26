Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F14ECD5BD0
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 09:41:07 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33561.1779788456970159052
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 02:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=s772CddJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490426d72f7so36616175e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 02:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779788455; x=1780393255; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=njR6uBf2RFrA6edBjyOIJlA/r+xFFe2XaV3S03sfxeM=;
        b=s772CddJSGvAS7aa2Pdl+ToWAHHNrpsZ+4114Ng8XrFmrX4DLOfTEg6lqgBlxS3PDu
         tFc7U7QA5zCaPvgE4gpEXFmmlxVX/BYOK6P/1Pf04hsTlNIfW21D9QMr0LS2UKMC+Wrg
         rek9FJMyw6gzOBk5bnuRNVUlrRzIG8+Vr+9hcmGBeUbF6VfjSlRysaBRux4lnqAGW/3d
         ziB5GYK493FqCyNPRFxL0MM7N4G/ARIXlM4UA9DZlcaozzEXV53+spim0KN26ds8uBxZ
         c8HmmG/UjM4zGb9S88PWKnAhTH7aCxjGC5rnmCOaSM1NRTOPw6vWNJsz0om/wE4VCGCA
         6DEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779788455; x=1780393255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=njR6uBf2RFrA6edBjyOIJlA/r+xFFe2XaV3S03sfxeM=;
        b=HOs75J9R1j+KU7eHFWopIAknk+j8cxRTSQkNNfCB8w/SZcYbmymQc4k0wp/XiaV/fr
         qmOnPe76iDoZXTbYtGmffv23TZURz96tXWsbv5OVKWr55NpC76J7E1WToM73dYoM1uzi
         TLz9MRkE+5ifRYlud0gWmjKwuk9WdnB0CzzqI4T4Y4LtKsm6zE8Q2Tv6VWhypwTDPE/Y
         v5TYayTMy15gOMk1bfNTDVpCwwT4+SaL1WsQTszjoHuMUvcQVs9/e+Qw6Y5MikQKYpWM
         i/oLLQR9Y+2I5B9QjPlg4LXSwIr4GGi+QzuPKQq1d8pzrxsrj4pbbJlc+jZG3Agraw+c
         oqTw==
X-Gm-Message-State: AOJu0YyV1bDXLDoa0U2lMngb7jg1ZgiCfRnw02inZ0IuLg5KNY9kIvm7
	KlNZqHxd7ANRUAFPs2zsbNm9pxa8xZH69Rnh8iO/1Q+/2iynScCqa5i9fIvy2g==
X-Gm-Gg: Acq92OEcX6kQ9v4c32lyHr754ISdIWMwaJ4p0kNJmBe0UipMWtIU76WB4le6VllYELa
	jslAx+0CTwvj8kSQlhR0zvebL46e/lf0t0jdK5tEI0keGRFLM1vlshgbm4w5H6v/hXCy8Wnuo37
	zzFUNmrd4SzpgPQRfbOoesCEu3s33fcPNqFKcdtb9fb/3Xe72pzG1zYoiFidiy/kiUnr5TnMt4a
	VIhAweTUeqVVktlhFZnOnKKcdMAoGQRaXkiZ6co2WrrfD2nfWm2aPrF5M3+x4XreV8w4lMBQJ1d
	94fF2GkyMgZRi9poQ78VootG5jD4UlOe7LePPDvyHqzGAj39gRZ2EoAkwyPTMeg0VK7hw6KCD+q
	lCmEXD6UREJB69GIc7bTpRkot/JQ6flFtHp3ixLR5/6TYeH1kh6LbCLXA8KmLGxM2ZqtsbpPH9D
	cRxj+fDIixm/hRCvsgQAq6G4sgJLLUUYWByTgeaNpKJlWfZrSwOfS4lHI0sC4+k89/DXK0DuQVq
	65N7SJk156L4h82X3MwUfdjCAwiw0X8GmWKQg==
X-Received: by 2002:a05:600c:6290:b0:490:46df:a852 with SMTP id 5b1f17b1804b1-49046dfaa16mr304164045e9.10.1779788455160;
        Tue, 26 May 2026 02:40:55 -0700 (PDT)
Received: from localhost.localdomain (88-174-158-187.subs.proxad.net. [88.174.158.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d70c51sm36508800f8f.36.2026.05.26.02.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 02:40:53 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@ygreky.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <rybczynska@gmail.com>
Subject: [PATCH v2 1/2] uboot-sign: sign SPL FIT configurations instead of images
Date: Tue, 26 May 2026 11:40:41 +0200
Message-ID: <20260526094042.54135-1-marta.rybczynska@ygreky.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 09:41:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237592

From: Marta Rybczynska <rybczynska@gmail.com>

The SPL FIT signing path was signing individual images, but not the configuration.

Introduce signing of configuration with images under a separate option SPL_SIGN_CONF,
enabled by default. It implies changes in the DTB content.

The old behaviour is possible with SPL_SIGN_INDIVIDUAL, but should be removed in
a subsequent patch.

Signed-off-by: Marta Rybczynska <rybczynska@gmail.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 77 ++++++++++++++++++++++++--
 1 file changed, 73 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 9cb5c6ccf3..d8e7252cc3 100644
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
@@ -442,8 +484,10 @@ EOF
 		conf_loadables="${conf_loadables}${UBOOT_FIT_CONF_USER_LOADABLES}"
 	fi
 
+	conf_sign_images='"loadables", "fdt"'
 	if [ -n "${UBOOT_FIT_CONF_FIRMWARE}" ] ; then
 		conf_firmware="firmware = \"${UBOOT_FIT_CONF_FIRMWARE}\";"
+		conf_sign_images='"firmware", "loadables", "fdt"'
 	fi
 
 	cat << EOF >> ${UBOOT_ITS}
@@ -456,6 +500,19 @@ EOF
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
@@ -470,6 +527,18 @@ EOF
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
2.47.3


