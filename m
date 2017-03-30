Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id E05D177C28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 08:00:04 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id p52so9645237wrc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 01:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8qSicYT2eIBLQlJuoknbq32aMl5Iuunp/6e9CwaSJjY=;
	b=hw/BuKC4viDrLF9fvgwDCSIkjdPPgIbjVB3iEcDiyWCiBXLa5aD0MAWBUrVIxoVW+k
	P2zuCoWMo3fx9bwxtx8pEKCG+mZ/fc80eTx+rd5MeXlqW1Exyf3jl8mVp7YQplrWfbBl
	YbrvanGsO9yqowKOy3YN4RY8Vl5Ms1W9oXw6HMMj7JwYc/2taTHZETcmzpVA3bxXPQUl
	wcAbE2qH1gp3j8u6bJQTalT0O/rEydItZl99mGePJnmPc/RNvHVenER682vR3aCzQc8w
	VLEo7EXyctPe8awZq7hH6Yyeqvqak/ICs4eCkwYCUe12ioqjLJefVfB1S9NAXSEpMqAD
	6xZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8qSicYT2eIBLQlJuoknbq32aMl5Iuunp/6e9CwaSJjY=;
	b=GTg3XKepcR6oF33soucL0KZ84yIHTK/idyQ5reAWicWh3YUjVP7yKnDhMsSRZIollN
	DVWoYGtQtd+s16vnLHmF9+55PBKlI6TpI8+01Rz6cXKV725dowrc77HKvDTSvMzLyo5J
	cEvGDrAkOjeTrbhu0Y7JfxV9mythQdyaUzChWtSjEHaQpvgqFbt1lRzCPjHvif6uZF9s
	fY+e2Q1eGs55AtukkjOwWxOZHVPn76FjyE7cvf0etU3FTEknFBaz9oCRjLfbVVAjz3Mk
	7RAPbcJ7IC2C257jSNOv0YLH7APM8cF1UJMXosi3L0+7VZlULeN15Zv/Fom8w80sscqw
	ZXLA==
X-Gm-Message-State: AFeK/H2uKPRVDPowEe9TaIXlMBq5BvVu2yO/qfxK9bWf+2vowHPSv5y9B8Jp3gvp+pC9sQ==
X-Received: by 10.223.175.103 with SMTP id z94mr4191874wrc.3.1490860805569;
	Thu, 30 Mar 2017 01:00:05 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.223.149])
	by smtp.gmail.com with ESMTPSA id e72sm2195252wma.5.2017.03.30.01.00.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Mar 2017 01:00:05 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 09:59:58 +0200
Message-Id: <1490860798-28313-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] kernel.bbclass: introduce INITRAMFS_IMAGE_NAME
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Mar 2017 08:00:05 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

It defaults to ${INITRAMFS_IMAGE}-${MACHINE} if INITRAMFS_IMAGE is not
empty.

This allows the end users to be able to override the initramfs image
name with a customized value.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/kernel-fitimage.bbclass | 10 +++++-----
 meta/classes/kernel.bbclass          | 21 +++++++++++----------
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 8ae2eb6..2630b47 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -370,7 +370,7 @@ fitimage_assemble() {
 	if [ "x${ramdiskcount}" = "x1" ] ; then
 		# Find and use the first initramfs image archive type we find
 		for img in cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.gz cpio; do
-			initramfs_path="${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.${img}"
+			initramfs_path="${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.${img}"
 			echo "Using $initramfs_path"
 			if [ -e "${initramfs_path}" ]; then
 				fitimage_emit_section_ramdisk ${1} "${ramdiskcount}" "${initramfs_path}"
@@ -459,11 +459,11 @@ kernel_do_deploy_append() {
 
 		if [ -n "${INITRAMFS_IMAGE}" ]; then
 			echo "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
-			its_initramfs_base_name="fitImage-its-${INITRAMFS_IMAGE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
-			its_initramfs_symlink_name=fitImage-its-${INITRAMFS_IMAGE}-${MACHINE}
+			its_initramfs_base_name="fitImage-its-${INITRAMFS_IMAGE_NAME}-${PV}-${PR}-${DATETIME}"
+			its_initramfs_symlink_name=fitImage-its-${INITRAMFS_IMAGE_NAME}
 			install -m 0644 fit-image-${INITRAMFS_IMAGE}.its ${DEPLOYDIR}/${its_initramfs_base_name}.its
-			fit_initramfs_base_name="fitImage-${INITRAMFS_IMAGE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
-			fit_initramfs_symlink_name=fitImage-${INITRAMFS_IMAGE}-${MACHINE}
+			fit_initramfs_base_name="fitImage-${INITRAMFS_IMAGE_NAME}-${PV}-${PR}-${DATETIME}"
+			fit_initramfs_symlink_name=fitImage-${INITRAMFS_IMAGE_NAME}
 			install -m 0644 arch/${ARCH}/boot/fitImage-${INITRAMFS_IMAGE} ${DEPLOYDIR}/${fit_initramfs_base_name}.bin
 		fi
 
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 244087a..2bee754 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -16,6 +16,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 KERNEL_IMAGETYPE ?= "zImage"
 INITRAMFS_IMAGE ?= ""
+INITRAMFS_IMAGE_NAME ?= "${@['${INITRAMFS_IMAGE}-${MACHINE}', ''][d.getVar('INITRAMFS_IMAGE') == '']}"
 INITRAMFS_TASK ?= ""
 INITRAMFS_IMAGE_BUNDLE ?= ""
 
@@ -167,34 +168,34 @@ copy_initramfs() {
 	# In case the directory is not created yet from the first pass compile:
 	mkdir -p ${B}/usr
 	# Find and use the first initramfs image archive type we find
-	rm -f ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
+	rm -f ${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
 	for img in cpio cpio.gz cpio.lz4 cpio.lzo cpio.lzma cpio.xz; do
-		if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img" ]; then
-			cp ${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img ${B}/usr/.
+		if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img" ]; then
+			cp ${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img ${B}/usr/.
 			case $img in
 			*gz)
 				echo "gzip decompressing image"
-				gunzip -f ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.$img
+				gunzip -f ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
 				break
 				;;
 			*lz4)
 				echo "lz4 decompressing image"
-				lz4 -df ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.$img
+				lz4 -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
 				break
 				;;
 			*lzo)
 				echo "lzo decompressing image"
-				lzop -df ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.$img
+				lzop -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
 				break
 				;;
 			*lzma)
 				echo "lzma decompressing image"
-				lzma -df ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.$img
+				lzma -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
 				break
 				;;
 			*xz)
 				echo "xz decompressing image"
-				xz -df ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.$img
+				xz -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
 				break
 				;;
 			esac
@@ -222,7 +223,7 @@ do_bundle_initramfs () {
 				tmp_path=$tmp_path" "$type"##"
 			fi
 		done
-		use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
+		use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
 		kernel_do_compile
 		# Restoring kernel image
 		for tp in $tmp_path ; do
@@ -261,7 +262,7 @@ kernel_do_compile() {
 		# The old style way of copying an prebuilt image and building it
 		# is turned on via INTIRAMFS_TASK != ""
 		copy_initramfs
-		use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
+		use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
 	fi
 	for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
 		oe_runmake ${typeformake} CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
-- 
2.7.4


