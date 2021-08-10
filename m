Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web09.7292.1628598771720264540
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 05:32:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: thomas.perrot@bootlin.com)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id F28D7C0002;
	Tue, 10 Aug 2021 12:32:49 +0000 (UTC)
From: "Thomas Perrot" <thomas.perrot@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com,
	Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [PATCH 1/2] kernel-fitimage: images should not be signed with the same keys as the configurations
Date: Tue, 10 Aug 2021 14:30:12 +0200
Message-Id: <20210810123013.943078-2-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210810123013.943078-1-thomas.perrot@bootlin.com>
References: <20210810123013.943078-1-thomas.perrot@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Otherwise the "required" property, from UBOOT_DTB_BINARY, will be set to "conf"
and no error will be raised in case of error.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta/classes/kernel-fitimage.bbclass | 40 ++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 5 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index a9d1002200c9..2ef8f06b1428 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -60,6 +60,14 @@ FIT_DESC ?= "Kernel fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}"
 # Sign individual images as well
 FIT_SIGN_INDIVIDUAL ?= "0"
 
+# Keys used to sign individually image nodes.
+# The keys to sign image nodes must be different from those used to sign
+# configuration nodes, otherwise the "required" property, from
+# UBOOT_DTB_BINARY, will be set to "conf", because "conf" prevails on "image".
+# Then the images signature checking will not be mandatory and no error will be
+# raised in case of failure.
+# UBOOT_SIGN_IMG_KEYNAME = "dev2" # keys name in keydir (eg. "dev2.crt", "dev2.key")
+
 #
 # Emit the fitImage ITS header
 #
@@ -121,7 +129,7 @@ fitimage_emit_section_kernel() {
 
 	kernel_csum="${FIT_HASH_ALG}"
 	kernel_sign_algo="${FIT_SIGN_ALG}"
-	kernel_sign_keyname="${UBOOT_SIGN_KEYNAME}"
+	kernel_sign_keyname="${UBOOT_SIGN_IMG_KEYNAME}"
 
 	ENTRYPOINT="${UBOOT_ENTRYPOINT}"
 	if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
@@ -167,7 +175,7 @@ fitimage_emit_section_dtb() {
 
 	dtb_csum="${FIT_HASH_ALG}"
 	dtb_sign_algo="${FIT_SIGN_ALG}"
-	dtb_sign_keyname="${UBOOT_SIGN_KEYNAME}"
+	dtb_sign_keyname="${UBOOT_SIGN_IMG_KEYNAME}"
 
 	dtb_loadline=""
 	dtb_ext=${DTB##*.}
@@ -214,7 +222,7 @@ fitimage_emit_section_boot_script() {
 
         bootscr_csum="${FIT_HASH_ALG}"
 	bootscr_sign_algo="${FIT_SIGN_ALG}"
-	bootscr_sign_keyname="${UBOOT_SIGN_KEYNAME}"
+	bootscr_sign_keyname="${UBOOT_SIGN_IMG_KEYNAME}"
 
         cat << EOF >> ${1}
                 bootscr-${2} {
@@ -278,7 +286,7 @@ fitimage_emit_section_ramdisk() {
 
 	ramdisk_csum="${FIT_HASH_ALG}"
 	ramdisk_sign_algo="${FIT_SIGN_ALG}"
-	ramdisk_sign_keyname="${UBOOT_SIGN_KEYNAME}"
+	ramdisk_sign_keyname="${UBOOT_SIGN_IMG_KEYNAME}"
 	ramdisk_loadline=""
 	ramdisk_entryline=""
 
@@ -475,6 +483,10 @@ fitimage_assemble() {
 	bootscr_id=""
 	rm -f ${1} arch/${ARCH}/boot/${2}
 
+	if [ ! -z "${UBOOT_SIGN_IMG_KEYNAME}" -a "${UBOOT_SIGN_KEYNAME}" = "${UBOOT_SIGN_IMG_KEYNAME}" ]; then
+		bbfatal "Keys used to sign images and configuration nodes must be different."
+	fi
+
 	fitimage_emit_fit_header ${1}
 
 	#
@@ -674,7 +686,7 @@ do_kernel_generate_rsa_keys() {
 
 	if [ "${UBOOT_SIGN_ENABLE}" = "1" ] && [ "${FIT_GENERATE_KEYS}" = "1" ]; then
 
-		# Generate keys only if they don't already exist
+		# Generate keys to sign configuration nodes, only if they don't already exist
 		if [ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key ] || \
 			[ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".crt ]; then
 
@@ -691,6 +703,24 @@ do_kernel_generate_rsa_keys() {
 				-key "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key \
 				-out "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".crt
 		fi
+
+		# Generate keys to sign image nodes, only if they don't already exist
+		if [ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_IMG_KEYNAME}".key ] || \
+			[ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_IMG_KEYNAME}".crt ]; then
+
+			# make directory if it does not already exist
+			mkdir -p "${UBOOT_SIGN_KEYDIR}"
+
+			echo "Generating RSA private key for signing fitImage"
+			openssl genrsa ${FIT_KEY_GENRSA_ARGS} -out \
+				"${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_IMG_KEYNAME}".key \
+			"${FIT_SIGN_NUMBITS}"
+
+			echo "Generating certificate for signing fitImage"
+			openssl req ${FIT_KEY_REQ_ARGS} "${FIT_KEY_SIGN_PKCS}" \
+				-key "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_IMG_KEYNAME}".key \
+				-out "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_IMG_KEYNAME}".crt
+		fi
 	fi
 }
 
-- 
2.31.1

