Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.4475.1621671947161487889
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 May 2021 01:25:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=onqjUpCk;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: liu.ming50@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id z137-20020a1c7e8f0000b02901774f2a7dc4so7789637wmc.0
        for <openembedded-core@lists.openembedded.org>; Sat, 22 May 2021 01:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C/WbU10J/ca2apENo9t0yHRX/InVB9H4I2LIM8cvVb4=;
        b=onqjUpCkQHbe7kdwOXERavZSAqn/h/ttAw2dMbCE+Y76HXAroERUjCV/uNpVU6Mgc0
         0YMgxhwUZ2EJCI+vOB4YjdXv86PBKk8i30guBK59S5yql68+pFt64dtQuI8i+GQnrpLj
         O/8o3DfMZSwlohsoTMLGVmWVDBMQUmaDYVOcQYgUSUiKtjhBI+zItjWTZyDhPOASM6Hq
         tbpOhhrJors9PQfQ+xZYgeFPxTNFMl0wJU0qfU3/PHgcpwWL+sEh7UB+oaAy45hHVXvK
         sGl0AqXkg41ulfoEVKks+SfMh4PvoOGKa69EthnWUKC5KW/poTIydIUpVlcpidl6ROkk
         3N/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C/WbU10J/ca2apENo9t0yHRX/InVB9H4I2LIM8cvVb4=;
        b=T6BnZNqLAsnHil5MBvsHPJ1J6aRYjpMw0fxd8pLHTHJUeM/b+98lMSVgGieOgBuVdb
         iGA3h4HAuy9c7x30wgIVZ5GgnA1MszXpvCMSzVudZmxaV52vMa6juCWND2EEOkdGjsXe
         XBhgx+X7cn2tITRJ1jajZ0bdANb+jFSxYZWvLLcAHxpCpXu8ckfNQggWrBZ5hjZEp/aC
         PZiu5D21wY817TglhCL7RZRObUUNig/IVlnpbhvmi8lZJDOn1LVssabLyMbeq44y1rLH
         Ltmqs7HHchLibZFKdJmF3RRlRxQ0c72kZdmGdf9J8dAl1rvsPcamJsIQx/Y0k9XjtuQ2
         Y01g==
X-Gm-Message-State: AOAM533SjkC6JBkl4MQYTrhPy5I9ZKU04QtHllznecVfiqXSYv7mwfjZ
	p4oNkKWYbgLjanb4YZgSbDV4LJYQcAQ=
X-Google-Smtp-Source: ABdhPJyr94VAXnapJqy2wmApQCQBfIUP6hs8g/htnN1QKYUhSqAjdU8RQG4Fv7CgjCGwYWPfT254EA==
X-Received: by 2002:a1c:28b:: with SMTP id 133mr11853998wmc.135.1621671945365;
        Sat, 22 May 2021 01:25:45 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.toradex.int (m90-129-203-26.cust.tele2.se. [90.129.203.26])
        by smtp.gmail.com with ESMTPSA id n20sm1889150wmk.12.2021.05.22.01.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 May 2021 01:25:45 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] uboot-sign/kernel-fitimage: split generate_rsa_keys task
Date: Sat, 22 May 2021 10:25:41 +0200
Message-Id: <20210522082541.11857-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <liu.ming50@gmail.com>

Currently generate_rsa_keys tasks are being executed parallelly in
kernel and uboot's task list, and both of them are calling openssl to
generate rsa keys in same path, this can lead to race condition.

Let's split it to kernel_generate_rsa_keys and uboot_generate_rsa_keys.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/kernel-fitimage.bbclass | 37 ++++++++++++++++++++++++----
 meta/classes/uboot-sign.bbclass      | 29 ++--------------------
 2 files changed, 34 insertions(+), 32 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 5cfd8af99d..039640be1f 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -667,7 +667,34 @@ do_assemble_fitimage_initramfs() {
 
 addtask assemble_fitimage_initramfs before do_deploy after do_bundle_initramfs
 
-addtask generate_rsa_keys before do_assemble_fitimage after do_compile
+do_kernel_generate_rsa_keys() {
+	if [ "${UBOOT_SIGN_ENABLE}" = "0" ] && [ "${FIT_GENERATE_KEYS}" = "1" ]; then
+		bbwarn "FIT_GENERATE_KEYS is set to 1 even though UBOOT_SIGN_ENABLE is set to 0. The keys will not be generated as they won't be used."
+	fi
+
+	if [ "${UBOOT_SIGN_ENABLE}" = "1" ] && [ "${FIT_GENERATE_KEYS}" = "1" ]; then
+
+		# Generate keys only if they don't already exist
+		if [ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key ] || \
+			[ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".crt ]; then
+
+			# make directory if it does not already exist
+			mkdir -p "${UBOOT_SIGN_KEYDIR}"
+
+			echo "Generating RSA private key for signing fitImage"
+			openssl genrsa ${FIT_KEY_GENRSA_ARGS} -out \
+				"${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key \
+			"${FIT_SIGN_NUMBITS}"
+
+			echo "Generating certificate for signing fitImage"
+			openssl req ${FIT_KEY_REQ_ARGS} "${FIT_KEY_SIGN_PKCS}" \
+				-key "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key \
+				-out "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".crt
+		fi
+	fi
+}
+
+addtask kernel_generate_rsa_keys before do_assemble_fitimage after do_compile
 
 kernel_do_deploy[vardepsexclude] = "DATETIME"
 kernel_do_deploy_append() {
@@ -718,13 +745,13 @@ kernel_do_deploy_append() {
 # - Removes do_assemble_fitimage. FIT generation is done through
 #   do_assemble_fitimage_initramfs. do_assemble_fitimage is not needed
 #   and should not be part of the tasks to be executed.
-# - Since do_generate_rsa_keys is inserted by default
+# - Since do_kernel_generate_rsa_keys is inserted by default
 #   between do_compile and do_assemble_fitimage, this is
-#   not suitable in case of initramfs bundles.  do_generate_rsa_keys
+#   not suitable in case of initramfs bundles.  do_kernel_generate_rsa_keys
 #   should be between do_bundle_initramfs and do_assemble_fitimage_initramfs.
 python () {
     if d.getVar('INITRAMFS_IMAGE_BUNDLE') == "1":
         bb.build.deltask('do_assemble_fitimage', d)
-        bb.build.deltask('generate_rsa_keys', d)
-        bb.build.addtask('generate_rsa_keys', 'do_assemble_fitimage_initramfs', 'do_bundle_initramfs', d)
+        bb.build.deltask('kernel_generate_rsa_keys', d)
+        bb.build.addtask('kernel_generate_rsa_keys', 'do_assemble_fitimage_initramfs', 'do_bundle_initramfs', d)
 }
diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index d11882f90f..29b2edc833 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -255,32 +255,7 @@ do_install_append() {
 	fi
 }
 
-do_generate_rsa_keys() {
-	if [ "${UBOOT_SIGN_ENABLE}" = "0" ] && [ "${FIT_GENERATE_KEYS}" = "1" ]; then
-		bbwarn "FIT_GENERATE_KEYS is set to 1 even though UBOOT_SIGN_ENABLE is set to 0. The keys will not be generated as they won't be used."
-	fi
-
-	if [ "${UBOOT_SIGN_ENABLE}" = "1" ] && [ "${FIT_GENERATE_KEYS}" = "1" ]; then
-
-		# Generate keys only if they don't already exist
-		if [ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key ] || \
-			[ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".crt ]; then
-
-			# make directory if it does not already exist
-			mkdir -p "${UBOOT_SIGN_KEYDIR}"
-
-			echo "Generating RSA private key for signing fitImage"
-			openssl genrsa ${FIT_KEY_GENRSA_ARGS} -out \
-				"${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key \
-				"${FIT_SIGN_NUMBITS}"
-
-			echo "Generating certificate for signing fitImage"
-			openssl req ${FIT_KEY_REQ_ARGS} "${FIT_KEY_SIGN_PKCS}" \
-				-key "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key \
-				-out "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".crt
-		fi
-	fi
-
+do_uboot_generate_rsa_keys() {
 	if [ "${SPL_SIGN_ENABLE}" = "0" ] && [ "${UBOOT_FIT_GENERATE_KEYS}" = "1" ]; then
 		bbwarn "UBOOT_FIT_GENERATE_KEYS is set to 1 eventhough SPL_SIGN_ENABLE is set to 0. The keys will not be generated as they won't be used."
 	fi
@@ -308,7 +283,7 @@ do_generate_rsa_keys() {
 
 }
 
-addtask generate_rsa_keys before do_uboot_assemble_fitimage after do_compile
+addtask uboot_generate_rsa_keys before do_uboot_assemble_fitimage after do_compile
 
 # Create a ITS file for the U-boot FIT, for use when
 # we want to sign it so that the SPL can verify it
-- 
2.29.0

