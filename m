Return-Path: <david.wretman@ferroamp.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3151C4707B
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 15:10:55 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.13914.1705590646607486051
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 07:10:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ferroamp-se.20230601.gappssmtp.com header.s=20230601 header.b=PrMHCaCB;
 spf=permerror, err=too many SPF records (domain: ferroamp.se, ip: 209.85.167.52, mailfrom: david.wretman@ferroamp.se)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50eaabc36bcso15488732e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 07:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ferroamp-se.20230601.gappssmtp.com; s=20230601; t=1705590644; x=1706195444; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4BLiVwVRnAiQaD2BSQZFzRdhAy6rm7DfAmTMtfWO17Y=;
        b=PrMHCaCBdf09Yb5Nst5EVhyPLvMlO32HHIaUDc/xcyhI8GSB8BNOY2xa6X0dvmBdVn
         bOISOM2IQ3gaigupGRfK6dmXiy2Obw2vK4E9ijQCEQ66OkwtptnLE5QPujnPFU03gaDd
         eiBhlv1DZQbFm1orW1aPDukLMlSRn9n6qV3W/Ui6Ol95XnVLTKewqt9VBt3io/zZdSGw
         UXd8VhVReJ0W8VVgNb5k/BqYJYcEsYmHOWt2oDYZ6hc6rQczAvJjQeA0HhKLJ8x6GRdQ
         oagEwmAfpkkVEP60rlod9iYBLWKzCELnYr1oJGVoROz2gBw9f+y0IAE4z4VD8Tr16TNx
         xoug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705590644; x=1706195444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4BLiVwVRnAiQaD2BSQZFzRdhAy6rm7DfAmTMtfWO17Y=;
        b=KNu5ihqQbxJjXPq0iy0U4RDbuJla7BQHq2cd23b7yH0ZP0EyIJUjOyKO7wVkwfTx5J
         pdPXTUH4djPQ0F7u79/9NWev6BbPHgoDPS8c+AikTmJvLw1JpnX0X8GE6ZGrgmWQdCG9
         05ElBajj8sOAttOUerQ19Q7Tkj/kvtjatZlNPzHPaKAeuIZq+vElVmeFbuES/ebrmayl
         bGqcYAcL9ajpJFRLiPqvP/Bb6rSJ86p9TxM6lS0GBvQAXc0la4ts1nik4izImzujjY0d
         AbiqiccjBWs/UWh889TwGUsIJhYZ9j9d4X4jFkdfbxOZ92usw5NvbpBDNy3HZSyaUTbe
         46+Q==
X-Gm-Message-State: AOJu0YxgghXIekhDyIkZYqcEhEbdR6yz9c5uJ9berImehmNUBfYOq7uS
	UR8t9yhi6oSw5qCowToEF7V5iC3ZGn1DZ8f51eYg/l2e0XPyIR0rZgGiU9CYIauRxxD3A4cubFv
	8
X-Google-Smtp-Source: AGHT+IEOr/HB6TMHTnu+nJNyymbwrXhP41jAlPzd7dBNkx0cotJ9QkGCDPp8M8e4Sbp8SpZz/R4R2Q==
X-Received: by 2002:a05:6512:b07:b0:50e:246d:7566 with SMTP id w7-20020a0565120b0700b0050e246d7566mr867180lfu.7.1705590644021;
        Thu, 18 Jan 2024 07:10:44 -0800 (PST)
Received: from dwr-latitude-5400.local (c-5b7de455.017-252-73746f3.bbcust.telenor.se. [85.228.125.91])
        by smtp.gmail.com with ESMTPSA id p15-20020a056512234f00b0050e7ec49881sm662658lfu.21.2024.01.18.07.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 07:10:43 -0800 (PST)
From: David Wretman <david.wretman@ferroamp.se>
To: openembedded-core@lists.openembedded.org
Cc: David Wretman <david.wretman@ferroamp.se>
Subject: [PATCH 1/1] uboot-sign.bbclass: Break dependency loop in fitImage signing
Date: Thu, 18 Jan 2024 16:10:30 +0100
Message-Id: <20240118151030.1781313-2-david.wretman@ferroamp.se>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240118151030.1781313-1-david.wretman@ferroamp.se>
References: <20240118151030.1781313-1-david.wretman@ferroamp.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 15:10:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193991

This commit creates a dummy fitImage to feed to mkimage when adding the
public key to the U-Boot dtb. This instead of using the Linux fitImage.
The dependency on Linux fitImage availability from U-Boot recipes can
then be removed, breaking a dependecy loop created when trying to add
a boot script to a signed Linux fitImage.

Signed-off-by: David Wretman <david.wretman@ferroamp.se>
---
 meta/classes-recipe/uboot-sign.bbclass | 77 ++++++++++++++++++++------
 1 file changed, 61 insertions(+), 16 deletions(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index ad04c82378..e08ebda232 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -90,26 +90,75 @@ KERNEL_PN = "${PREFERRED_PROVIDER_virtual/kernel}"
 
 python() {
     # We need u-boot-tools-native if we're creating a U-Boot fitImage
-    sign = d.getVar('UBOOT_SIGN_ENABLE') == '1'
-    if d.getVar('UBOOT_FITIMAGE_ENABLE') == '1' or sign:
+    if d.getVar('UBOOT_FITIMAGE_ENABLE') == '1' or d.getVar('UBOOT_SIGN_ENABLE') == '1':
         d.appendVar('DEPENDS', " u-boot-tools-native dtc-native")
-    if sign:
-        d.appendVar('DEPENDS', " " + d.getVar('KERNEL_PN'))
 }
 
+# Create a dummy U-boot FIT and use that as input to mkimage when we want to
+# add the public key used to sign the Linux FIT to the U-Boot dtb.
+uboot_dtb_add_keys() {
+	# First we create an ITS script
+	cat << EOF > dummy.its
+/dts-v1/;
+
+/ {
+    description = "Dummy U-Boot its";
+
+    images {
+        uboot {
+            description = "U-Boot image";
+            data = /incbin/("${UBOOT_NODTB_BINARY}");
+            type = "standalone";
+            os = "u-boot";
+            arch = "${UBOOT_ARCH}";
+            compression = "none";
+            load = <${UBOOT_LOADADDRESS}>;
+            entry = <${UBOOT_ENTRYPOINT}>;
+            signature {
+                algo = "${FIT_HASH_ALG},${FIT_SIGN_ALG}";
+                key-name-hint = "${UBOOT_SIGN_KEYNAME}";
+            };
+        };
+    };
+
+    configurations {
+        default = "conf";
+        conf {
+            description = "Boot with signed U-Boot FIT";
+            loadables = "uboot";
+        };
+    };
+};
+EOF
+
+	#
+	# Assemble the Dummy FIT image
+	#
+	${UBOOT_MKIMAGE} \
+		${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
+		-f dummy.its \
+		dummy-fitImage
+
+	#
+	# Sign the Dummy FIT image to add public key to the U-Boot dtb
+	#
+	${UBOOT_MKIMAGE_SIGN} \
+		${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
+		-F -k "${UBOOT_SIGN_KEYDIR}" \
+		-K "${UBOOT_DTB_BINARY}" \
+		-r ${B}/dummy-fitImage \
+		${UBOOT_MKIMAGE_SIGN_ARGS}
+	cp ${UBOOT_DTB_BINARY} ${UBOOT_DTB_SIGNED}
+}
+
+
+
 concat_dtb() {
 	type="$1"
 	binary="$2"
 
 	if [ -e "${UBOOT_DTB_BINARY}" ]; then
-		# Re-sign the kernel in order to add the keys to our dtb
-		${UBOOT_MKIMAGE_SIGN} \
-			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
-			-F -k "${UBOOT_SIGN_KEYDIR}" \
-			-K "${UBOOT_DTB_BINARY}" \
-			-r ${B}/fitImage-linux \
-			${UBOOT_MKIMAGE_SIGN_ARGS}
-		cp ${UBOOT_DTB_BINARY} ${UBOOT_DTB_SIGNED}
+		uboot_dtb_add_keys
 	fi
 
 	# If we're not using a signed u-boot fit, concatenate SPL w/o DTB & U-Boot DTB
@@ -336,10 +385,6 @@ uboot_assemble_fitimage_helper() {
 }
 
 do_uboot_assemble_fitimage() {
-	if [ "${UBOOT_SIGN_ENABLE}" = "1" ] ; then
-		cp "${STAGING_DIR_HOST}/sysroot-only/fitImage" "${B}/fitImage-linux"
-	fi
-
 	if [ -n "${UBOOT_CONFIG}" ]; then
 		unset i j k
 		for config in ${UBOOT_MACHINE}; do
-- 
2.34.1


