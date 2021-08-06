Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web12.7011.1628266375979498908
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 09:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: thomas.perrot@bootlin.com)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0F02120009;
	Fri,  6 Aug 2021 16:12:53 +0000 (UTC)
From: "Thomas Perrot" <thomas.perrot@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] kernel-fitimage: images should not be signed with the same keys as the configurations
Date: Fri,  6 Aug 2021 18:10:38 +0200
Message-Id: <20210806161038.1593772-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Otherwise the "required" property, from UBOOT_DTB_BINARY, will be set to "conf"
and no error will be raised in case of error.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta/classes/kernel-fitimage.bbclass | 40 ++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 5 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index a9d1002200c9..72f692e40e63 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -60,6 +60,14 @@ FIT_DESC ?= "Kernel fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}"
 # Sign individual images as well
 FIT_SIGN_INDIVIDUAL ?= "0"
 
+# Keys used to sign individually images nodes.
+# The keys to sign images nodes must be different from those used to sign
+# configurations nodes, otherwise the "required" property, from
+# UBOOT_DTB_BINARY, will be set to "conf", because "conf" prevails on "image".
+# Then images signature checking will not be mandatory and no error will be
+# raised.
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
 
+	if [ "${UBOOT_SIGN_KEYNAME}" = "${UBOOT_SIGN_IMG_KEYNAME}" ]; then
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

