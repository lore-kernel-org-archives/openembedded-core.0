Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 586ACC71135
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 08:24:36 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.6346.1748939071357906739
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 01:24:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=okE17ZWq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-202506030824295a07ea1a67f9d7f270-jykhz8@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202506030824295a07ea1a67f9d7f270
        for <openembedded-core@lists.openembedded.org>;
        Tue, 03 Jun 2025 10:24:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=/E31mOqCS7hwH3ngpiigIpIqrwNqcw8IOdtMXKCiIKI=;
 b=okE17ZWqiH9sirkHFMm7K0z5HD7ZqnITti1I7GY80lHfIwbHNrHAoJkJy/g847dmIVLlc5
 yATt2CsV7I8EPXAxoTwe/TT7E7DmgXfy3yGeWHzWcJOrOp6ZLaTtOLpG3ACPIu2RD8WKBWQg
 8tFx4+gcfkMRUK/bpw3mrrCfXINPmRk/WQtW/xvqqDy8xOD2xtNQbjoubnV1i5PTXQTBkAVP
 NPZoRUdj4PvXcnmoU+N5Sl8fhlagzwjyWr0XDymNaxFo3IfJNteZMC+hPiuFok+AjzHPXIvZ
 /6FIrY2Y+iABhKd5Kd9Vc5DxR+G5QkoKzoelIJBKiHY29rQzyWrucV1g==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v7 06/20] kernel-signing-keys-native: refactor key generation into a new recipe
Date: Tue,  3 Jun 2025 10:23:17 +0200
Message-ID: <20250603082419.409564-7-adrian.freihofer@siemens.com>
In-Reply-To: <20250603082419.409564-1-adrian.freihofer@siemens.com>
References: <20250603082419.409564-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 08:24:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217771

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The do_kernel_generate_rsa_keys function from kernel-fitimage.bbclass
is moved to a new recipe, kernel-signing-keys-native.bb. This
refactoring introduces no functional changes.

Intention this change:
- Remove the dependency of uboot-sign.bbclass on kernel-fitimage.bbclass.
- Simplify the use of custom key generation implementations by
  isolating the functionality into a separate recipe.

Known limitations of this (and also the previous) implementation:
- When generating from an existing TMPDIR, the existing key is reused.
  However, when generating from an empty TMPDIR or an SDK using the
  sstate-cache, a new key is generated, which may lead to
  inconsistencies.
- The use of random keys (via FIT_GENERATE_KEYS) is convenient for
  experiments but unsuitable for production environments requiring
  deterministic and secure key management.

Future improvements to consider:
- Ensure reproducibility, even when using the sstate-cache. However,
  simply storing the private key in a potentially shared sstate artifact
  may not always be ideal from a security perspective.
- Support encrypted keys via `SRC_URI` for reliable key updates.
- Enable signing with an HSM (Hardware Security Module) through
  mechanisms like PKCS#11 or post-processing scripts.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass   | 52 +------------
 meta/classes-recipe/uboot-sign.bbclass        |  5 +-
 .../kernel-signing-keys-native.bb             | 75 +++++++++++++++++++
 3 files changed, 82 insertions(+), 50 deletions(-)
 create mode 100644 meta/recipes-kernel/kernel-signing-keys/kernel-signing-keys-native.bb

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index 07786647e19..f5f02f30f0a 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -27,7 +27,10 @@ def get_fit_replacement_type(d):
     return replacementtype
 
 KERNEL_IMAGETYPE_REPLACEMENT ?= "${@get_fit_replacement_type(d)}"
-DEPENDS:append = " ${@'u-boot-tools-native dtc-native' if 'fitImage' in (d.getVar('KERNEL_IMAGETYPES') or '').split() else ''}"
+DEPENDS:append = " \
+    ${@'u-boot-tools-native dtc-native' if 'fitImage' in (d.getVar('KERNEL_IMAGETYPES') or '').split() else ''} \
+    ${@'kernel-signing-keys-native' if d.getVar('FIT_GENERATE_KEYS') == '1' else ''} \
+"
 
 python __anonymous () {
     # Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
@@ -754,53 +757,6 @@ do_assemble_fitimage_initramfs() {
 
 addtask assemble_fitimage_initramfs before do_deploy after do_bundle_initramfs
 
-do_kernel_generate_rsa_keys() {
-	if [ "${UBOOT_SIGN_ENABLE}" = "0" ] && [ "${FIT_GENERATE_KEYS}" = "1" ]; then
-		bbwarn "FIT_GENERATE_KEYS is set to 1 even though UBOOT_SIGN_ENABLE is set to 0. The keys will not be generated as they won't be used."
-	fi
-
-	if [ "${UBOOT_SIGN_ENABLE}" = "1" ] && [ "${FIT_GENERATE_KEYS}" = "1" ]; then
-
-		# Generate keys to sign configuration nodes, only if they don't already exist
-		if [ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key ] || \
-			[ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".crt ]; then
-
-			# make directory if it does not already exist
-			mkdir -p "${UBOOT_SIGN_KEYDIR}"
-
-			bbnote "Generating RSA private key for signing fitImage"
-			openssl genrsa ${FIT_KEY_GENRSA_ARGS} -out \
-				"${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key \
-			"${FIT_SIGN_NUMBITS}"
-
-			bbnote "Generating certificate for signing fitImage"
-			openssl req ${FIT_KEY_REQ_ARGS} "${FIT_KEY_SIGN_PKCS}" \
-				-key "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key \
-				-out "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".crt
-		fi
-
-		# Generate keys to sign image nodes, only if they don't already exist
-		if [ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_IMG_KEYNAME}".key ] || \
-			[ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_IMG_KEYNAME}".crt ]; then
-
-			# make directory if it does not already exist
-			mkdir -p "${UBOOT_SIGN_KEYDIR}"
-
-			bbnote "Generating RSA private key for signing fitImage"
-			openssl genrsa ${FIT_KEY_GENRSA_ARGS} -out \
-				"${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_IMG_KEYNAME}".key \
-			"${FIT_SIGN_NUMBITS}"
-
-			bbnote "Generating certificate for signing fitImage"
-			openssl req ${FIT_KEY_REQ_ARGS} "${FIT_KEY_SIGN_PKCS}" \
-				-key "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_IMG_KEYNAME}".key \
-				-out "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_IMG_KEYNAME}".crt
-		fi
-	fi
-}
-
-addtask kernel_generate_rsa_keys before do_assemble_fitimage after do_compile
-
 kernel_do_deploy[vardepsexclude] = "DATETIME"
 kernel_do_deploy:append() {
 	# Update deploy directory
diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 796c040e8b4..73e9ce3f11f 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -112,13 +112,14 @@ UBOOT_FIT_CONF_USER_LOADABLES ?= ''
 UBOOT_FIT_UBOOT_LOADADDRESS ?= "${UBOOT_LOADADDRESS}"
 UBOOT_FIT_UBOOT_ENTRYPOINT ?= "${UBOOT_ENTRYPOINT}"
 
+
+DEPENDS:append = " ${@'kernel-signing-keys-native' if d.getVar('FIT_GENERATE_KEYS') == '1' else ''}"
+
 python() {
     # We need u-boot-tools-native if we're creating a U-Boot fitImage
     sign = d.getVar('UBOOT_SIGN_ENABLE') == '1'
     if d.getVar('UBOOT_FITIMAGE_ENABLE') == '1' or sign:
         d.appendVar('DEPENDS', " u-boot-tools-native dtc-native")
-    if d.getVar('FIT_GENERATE_KEYS') == '1' and sign:
-        d.appendVarFlag('do_uboot_assemble_fitimage', 'depends', ' virtual/kernel:do_kernel_generate_rsa_keys')
 }
 
 concat_dtb() {
diff --git a/meta/recipes-kernel/kernel-signing-keys/kernel-signing-keys-native.bb b/meta/recipes-kernel/kernel-signing-keys/kernel-signing-keys-native.bb
new file mode 100644
index 00000000000..704973dffb7
--- /dev/null
+++ b/meta/recipes-kernel/kernel-signing-keys/kernel-signing-keys-native.bb
@@ -0,0 +1,75 @@
+# Automatically generate key pairs in UBOOT_SIGN_KEYDIR if they do not exist.
+# The key pair is generated by the kernel-signing-keys-native recipe and is not
+# stored in the sstate cache. This can be beneficial from a security standpoint,
+# as it avoids unintentionally caching and distributing private keys.
+# However, this behavior can lead to non-reproducible builds. For example, if
+# the keys are deleted, they must be manually restored, or you must run:
+#   bitbake -c cleanall kernel-signing-keys-native
+# before new key pairs are generated.
+#
+# However, this approach is only suitable for simple or local development use
+# cases. For more advanced or production-grade scenarios, a more robust solution
+# is usually required—such as external signing or re-signing using e.g a HSM.
+
+
+SUMMARY = "Signing keys for the kernel FIT image"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+require conf/image-fitimage.conf
+
+DEPENDS += "openssl-native"
+
+inherit native
+
+do_fetch[noexec] = "1"
+do_unpack[noexec] = "1"
+do_patch[noexec] = "1"
+do_configure[noexec] = "1"
+do_install[noexec] = "1"
+
+
+do_compile() {
+	if [ "${UBOOT_SIGN_ENABLE}" = "0" ] && [ "${FIT_GENERATE_KEYS}" = "1" ]; then
+		bbwarn "FIT_GENERATE_KEYS is set to 1 even though UBOOT_SIGN_ENABLE is set to 0. The keys will not be generated as they won't be used."
+	fi
+
+	if [ "${UBOOT_SIGN_ENABLE}" = "1" ] && [ "${FIT_GENERATE_KEYS}" = "1" ]; then
+
+		# Generate keys to sign configuration nodes, only if they don't already exist
+		if [ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key ] || \
+			[ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".crt ]; then
+
+			# make directory if it does not already exist
+			mkdir -p "${UBOOT_SIGN_KEYDIR}"
+
+			bbnote "Generating RSA private key for signing fitImage"
+			openssl genrsa ${FIT_KEY_GENRSA_ARGS} -out \
+				"${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key \
+			"${FIT_SIGN_NUMBITS}"
+
+			bbnote "Generating certificate for signing fitImage"
+			openssl req ${FIT_KEY_REQ_ARGS} "${FIT_KEY_SIGN_PKCS}" \
+				-key "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key \
+				-out "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".crt
+		fi
+
+		# Generate keys to sign image nodes, only if they don't already exist
+		if [ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_IMG_KEYNAME}".key ] || \
+			[ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_IMG_KEYNAME}".crt ]; then
+
+			# make directory if it does not already exist
+			mkdir -p "${UBOOT_SIGN_KEYDIR}"
+
+			bbnote "Generating RSA private key for signing fitImage"
+			openssl genrsa ${FIT_KEY_GENRSA_ARGS} -out \
+				"${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_IMG_KEYNAME}".key \
+			"${FIT_SIGN_NUMBITS}"
+
+			bbnote "Generating certificate for signing fitImage"
+			openssl req ${FIT_KEY_REQ_ARGS} "${FIT_KEY_SIGN_PKCS}" \
+				-key "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_IMG_KEYNAME}".key \
+				-out "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_IMG_KEYNAME}".crt
+		fi
+	fi
+}
-- 
2.49.0


