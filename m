Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.2570.1608173537549950620
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 18:52:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=bpmaQ7Lt;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 9F03620B718A; Wed, 16 Dec 2020 18:52:16 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9F03620B718A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1608173536;
	bh=TX+151Q9sJCtBnpGVMe5EAwQLj671KIkSHTkFEZyyO0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bpmaQ7Lt7TOlo10k4/OV29XSvy1RcMlgWc7GgTfvBJlWR8qe4dl2Lq5DJ5xfjOUmU
	 BzjIEwp3msVPUyuZhNS532L1jSZcIXOTzP4nSDoU2u14FUHFGV+LUhNOusnJCRm5yf
	 MzmP4TDm/f7yqEfki5tWCbgQJcsOjVp8gnz+VjhY=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Usama Arif <usama.arif@arm.com>
Subject: [PATCH 5/8] classes/kernel-fitimage: add ability to sign individual images
Date: Wed, 16 Dec 2020 18:51:39 -0800
Message-Id: <80bcf9a995b32f239a043d12cfac44e75f1880a6.1608173226.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1608173226.git.paul.eggleton@linux.microsoft.com>
References: <cover.1608173226.git.paul.eggleton@linux.microsoft.com>

From: Luca Boccassi <luca.boccassi@microsoft.com>

Add the ability to have the kernel, dtb and ramdisk individually signed
by setting FIT_SIGN_INDIVIDUAL = "1". This could be useful if you are
intending to verify signatures before using kexec for example.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 meta/classes/kernel-fitimage.bbclass | 42 ++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 9661b4f..9fa302a 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -75,6 +75,9 @@ FIT_KEY_SIGN_PKCS ?= "-x509"
 # Description string
 FIT_DESC ?= "U-Boot fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}"
 
+# Sign individual images as well
+FIT_SIGN_INDIVIDUAL ?= "0"
+
 # mkimage command
 UBOOT_MKIMAGE ?= "uboot-mkimage"
 UBOOT_MKIMAGE_SIGN ?= "${UBOOT_MKIMAGE}"
@@ -142,6 +145,8 @@ EOF
 fitimage_emit_section_kernel() {
 
 	kernel_csum="${FIT_HASH_ALG}"
+	kernel_sign_algo="${FIT_SIGN_ALG}"
+	kernel_sign_keyname="${UBOOT_SIGN_KEYNAME}"
 
 	ENTRYPOINT="${UBOOT_ENTRYPOINT}"
 	if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
@@ -164,6 +169,17 @@ fitimage_emit_section_kernel() {
                         };
                 };
 EOF
+
+	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "${kernel_sign_keyname}" ] ; then
+		sed -i '$ d' ${1}
+		cat << EOF >> ${1}
+                        signature@1 {
+                                algo = "${kernel_csum},${kernel_sign_algo}";
+                                key-name-hint = "${kernel_sign_keyname}";
+                        };
+                };
+EOF
+	fi
 }
 
 #
@@ -175,6 +191,8 @@ EOF
 fitimage_emit_section_dtb() {
 
 	dtb_csum="${FIT_HASH_ALG}"
+	dtb_sign_algo="${FIT_SIGN_ALG}"
+	dtb_sign_keyname="${UBOOT_SIGN_KEYNAME}"
 
 	dtb_loadline=""
 	dtb_ext=${DTB##*.}
@@ -198,6 +216,17 @@ fitimage_emit_section_dtb() {
                         };
                 };
 EOF
+
+	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "${dtb_sign_keyname}" ] ; then
+		sed -i '$ d' ${1}
+		cat << EOF >> ${1}
+                        signature@1 {
+                                algo = "${dtb_csum},${dtb_sign_algo}";
+                                key-name-hint = "${dtb_sign_keyname}";
+                        };
+                };
+EOF
+	fi
 }
 
 #
@@ -236,6 +265,8 @@ EOF
 fitimage_emit_section_ramdisk() {
 
 	ramdisk_csum="${FIT_HASH_ALG}"
+	ramdisk_sign_algo="${FIT_SIGN_ALG}"
+	ramdisk_sign_keyname="${UBOOT_SIGN_KEYNAME}"
 	ramdisk_loadline=""
 	ramdisk_entryline=""
 
@@ -261,6 +292,17 @@ fitimage_emit_section_ramdisk() {
                         };
                 };
 EOF
+
+	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "${ramdisk_sign_keyname}" ] ; then
+		sed -i '$ d' ${1}
+		cat << EOF >> ${1}
+                        signature@1 {
+                                algo = "${ramdisk_csum},${ramdisk_sign_algo}";
+                                key-name-hint = "${ramdisk_sign_keyname}";
+                        };
+                };
+EOF
+	fi
 }
 
 #
-- 
1.8.3.1

