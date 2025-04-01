Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58295C36010
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 13:50:27 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.19611.1743515422874500582
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 06:50:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ETFWFM4q;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: anshuld@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 531DoMQo2971391
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Apr 2025 08:50:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743515422;
	bh=O+JYNZCrQVfZ86gaPU6DUFSC5NvTedp2AzSLAERRHXU=;
	h=From:To:CC:Subject:Date;
	b=ETFWFM4qKDzLF1nVQ57UyZ+bNtuGgpQKA5zmXKtT5N3qzd3p5AMFIzNFN2xEjVr4F
	 rRhQgIzTlctK/78OGEevPo8tlm3We5rAJK5tJ/PB+1sInAqM9856ueJluWnRR6Mz7M
	 +OGIm8Y9g+0qPJjueDC+HJPpVjEU/vNdwIRGfsYM=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 531DoMOt115371
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Apr 2025 08:50:22 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 1
 Apr 2025 08:50:21 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 1 Apr 2025 08:50:21 -0500
Received: from localhost (dhcp-172-24-227-250.dhcp.ti.com [172.24.227.250])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 531DoLH5001487;
	Tue, 1 Apr 2025 08:50:21 -0500
From: Anshul Dalal <anshuld@ti.com>
To: <openembedded-core@lists.openembedded.org>
CC: Anshul Dalal <anshuld@ti.com>, <c-shilwant@ti.com>, <vigneshr@ti.com>,
        <reatmon@ti.com>, <afd@ti.com>, <denys@ti.com>
Subject: [RFC PATCH] u-boot: kernel-fitimage: add pre-processing hooks
Date: Tue, 1 Apr 2025 19:20:08 +0530
Message-ID: <20250401135010.3278105-1-anshuld@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 13:50:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214128

In some use cases it is desirable to perform some pre-processing on
fitImage's individual components before packaging them in the final FIT
such as using a custom signing mechanism for secure booting separate
from mkimage.

Therefore this patch adds a pre-processing hook called
`preprocess_binary` in the kernel-fitimage class to allow bsp layers to
override it and perform pre-processing to the fit components.

This functionality is enabled by setting the FIT_PREPROCESS_BINARY
variable to 1 which defaults to 0.

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 52 +++++++++++++++++++--
 1 file changed, 47 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index 18ab17bd2c..ebe159ea03 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -84,6 +84,9 @@ FIT_KEY_SIGN_PKCS ?= "-x509"
 # Sign individual images as well
 FIT_SIGN_INDIVIDUAL ?= "0"
 
+# Preprocess individual fitImage binaries (kernel, dtb etc.) with an overridable `preprocess_binary` function
+FIT_PREPROCESS_BINARY ?= "0"
+
 FIT_CONF_PREFIX ?= "conf-"
 FIT_CONF_PREFIX[doc] = "Prefix to use for FIT configuration node name"
 
@@ -553,6 +556,10 @@ EOF
 EOF
 }
 
+preprocess_binary() {
+	bbfatal "Provide an implementation for 'preprocess_binary' to preprocess fitImage binaries or unset FIT_PREPROCESS_BINARY"
+}
+
 #
 # Assemble fitImage
 #
@@ -581,7 +588,14 @@ fitimage_assemble() {
 	fitimage_emit_section_maint $1 imagestart
 
 	uboot_prep_kimage
-	fitimage_emit_section_kernel $1 $kernelcount linux.bin "$linux_comp"
+	BINARY_PATH="linux.bin"
+	if [ "x${FIT_PREPROCESS_BINARY}" = "x1" ]; then
+		PROCESSED_BINARY="${BINARY_PATH}.processed"
+		preprocess_binary $BINARY_PATH $PROCESSED_BINARY
+		fitimage_emit_section_kernel $1 $kernelcount $PROCESSED_BINARY "$linux_comp"
+	else
+		fitimage_emit_section_kernel $1 $kernelcount $BINARY_PATH "$linux_comp"
+	fi
 
 	#
 	# Step 2: Prepare a DTB image section
@@ -622,7 +636,14 @@ fitimage_assemble() {
 
 			DTBS="$DTBS $DTB"
 			DTB=$(echo $DTB | tr '/' '_')
-			fitimage_emit_section_dtb $1 $DTB $DTB_PATH
+			BINARY_PATH="$DTB_PATH"
+			if [ "x${FIT_PREPROCESS_BINARY}" = "x1" ]; then
+				PROCESSED_BINARY="${BINARY_PATH}.processed"
+				preprocess_binary $BINARY_PATH $PROCESSED_BINARY
+				fitimage_emit_section_dtb $1 $DTB $PROCESSED_BINARY
+			else
+				fitimage_emit_section_dtb $1 $DTB $BINARY_PATH
+			fi
 		done
 	fi
 
@@ -646,7 +667,14 @@ fitimage_assemble() {
 			[ $(symlink_points_below $DTB "${EXTERNAL_KERNEL_DEVICETREE}") ] && continue
 
 			DTB=$(echo $DTB | tr '/' '_')
-			fitimage_emit_section_dtb $1 $DTB "${EXTERNAL_KERNEL_DEVICETREE}/$DTB"
+			BINARY_PATH="${EXTERNAL_KERNEL_DEVICETREE}/$DTB"
+			if [ "x${FIT_PREPROCESS_BINARY}" = "x1" ]; then
+				PROCESSED_BINARY="${BINARY_PATH}.processed"
+				preprocess_binary $BINARY_PATH $PROCESSED_BINARY
+				fitimage_emit_section_dtb $1 $DTB $PROCESSED_BINARY
+			else
+				fitimage_emit_section_dtb $1 $DTB $BINARY_PATH
+			fi
 		done
 	fi
 
@@ -662,7 +690,14 @@ fitimage_assemble() {
 		if [ -e "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY}" ]; then
 			cp ${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY} ${B}
 			bootscr_id="${UBOOT_ENV_BINARY}"
-			fitimage_emit_section_boot_script $1 "$bootscr_id" ${UBOOT_ENV_BINARY}
+			BINARY_PATH="${UBOOT_ENV_BINARY}"
+			if [ "x${FIT_PREPROCESS_BINARY}" = "x1" ]; then
+				PROCESSED_BINARY="${BINARY_PATH}.processed"
+				preprocess_binary $BINARY_PATH $PROCESSED_BINARY
+				fitimage_emit_section_boot_script $1 "$bootscr_id" $PROCESSED_BINARY
+			else
+				fitimage_emit_section_boot_script $1 "$bootscr_id" $BINARY_PATH
+			fi
 		else
 			bbwarn "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY} not found."
 		fi
@@ -673,7 +708,14 @@ fitimage_assemble() {
 	#
 	if [ -e ${KERNEL_OUTPUT_DIR}/setup.bin ]; then
 		setupcount=1
-		fitimage_emit_section_setup $1 $setupcount ${KERNEL_OUTPUT_DIR}/setup.bin
+		BINARY_PATH="${KERNEL_OUTPUT_DIR}/setup.bin"
+		if [ "x${FIT_PREPROCESS_BINARY}" = "x1" ]; then
+			PROCESSED_BINARY="${BINARY_PATH}.processed"
+			preprocess_binary $BINARY_PATH $PROCESSED_BINARY
+			fitimage_emit_section_setup $1 $setupcount $PROCESSED_BINARY
+		else
+			fitimage_emit_section_setup $1 $setupcount $BINARY_PATH
+		fi
 	fi
 
 	#
-- 
2.49.0


