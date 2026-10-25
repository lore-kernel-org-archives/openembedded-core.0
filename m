Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27595.1792952682143348416
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2026 11:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=OYq5gBbB;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-202610251824390e36e88b07000207a9-6diw_r@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202610251824390e36e88b07000207a9
        for <openembedded-core@lists.openembedded.org>;
        Sun, 25 Oct 2026 19:24:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=vQVcmgjYxUEbY6/QPfm51RMw8b4UCoFe6Or/ajs/9qs=;
 b=OYq5gBbBHxUqfgPnBk1YS2OseKO4A5Y1biGBvBog96DdDZZWlOWpyYjGLkd+VJCNdHArfY
 lhxtckPqQSnh+7yMEqROoOgA7VManLY3BA161cRXpKsgK8zfT1o2Ezd3s0sUOZSODUCqrvNJ
 gWhgb11rgy/WpZZR2r0AMFyZpkNhx3T0WIYxrlPJCsdZLRzHCUdDfw65GZnwsnJmEKtlEDJP
 /DG1aOzzv8bHqgv3XjW/XOwKGx86fKE/cYmyNYRTGvnk6Ea3xmgxQAuYcnHK1CKxubjoq4Py
 C2dT5NXiXW7hwWwaarWKBqloYTJuXaLzq9TEI7efoR+0L6JsYFKFX5Nw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v5 1/6] uboot-sign: add the option to sign SPL FIT configurations
Date: Sun, 25 Oct 2026 19:23:54 +0100
Message-ID: <20261025182436.788918-2-adrian.freihofer@siemens.com>
In-Reply-To: <20261025182436.788918-1-adrian.freihofer@siemens.com>
References: <20261025182436.788918-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 18:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248623
Content-Type: text/plain; charset="utf-8"

From: Marta Rybczynska <rybczynska@gmail.com>

The SPL FIT signing path was signing individual images, but not the configuration.

Introduce signing of configuration with images under a separate option SPL_SIGN_CONF.
For now it is disabled. Enabling this option implies changes in the DTB content.

The old behaviour is possible with SPL_SIGN_INDIVIDUAL, but should be removed in
a subsequent patch.

Signed-off-by: Marta Rybczynska <rybczynska@gmail.com>
Reviewed-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 86 ++++++++++++++++++++++++--
 1 file changed, 82 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 5d9e48e103..9a79aeb366 100644
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
@@ -350,7 +360,15 @@ uboot_fitimage_atf() {
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
@@ -377,7 +395,15 @@ uboot_fitimage_tee() {
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
@@ -418,7 +444,15 @@ uboot_fitimage_assemble() {
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
@@ -437,7 +471,15 @@ EOF
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
@@ -470,10 +512,21 @@ EOF
 		conf_loadables="${conf_loadables}${UBOOT_FIT_CONF_USER_LOADABLES}"
 	fi
 
+	conf_sign_images=""
+	conf_sign_images_sep=""
+
 	if [ -n "${UBOOT_FIT_CONF_FIRMWARE}" ] ; then
 		conf_firmware="firmware = \"${UBOOT_FIT_CONF_FIRMWARE}\";"
+		conf_sign_images="${conf_sign_images}${conf_sign_images_sep}\"firmware\""
+		conf_sign_images_sep=", "
 	fi
 
+	if [ -n "${conf_loadables}" ] ; then
+		conf_sign_images="${conf_sign_images}${conf_sign_images_sep}\"loadables\""
+		conf_sign_images_sep=", "
+	fi
+	conf_sign_images="${conf_sign_images}${conf_sign_images_sep}\"fdt\""
+
 	cat << EOF >> ${UBOOT_ITS}
     };
 
@@ -484,6 +537,19 @@ EOF
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
@@ -498,6 +564,18 @@ EOF
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
2.56.0

