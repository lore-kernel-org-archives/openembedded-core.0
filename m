Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id BAF2971CA3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Mar 2017 13:13:59 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id n11so10204753wma.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Mar 2017 06:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DAIo3+oToQlhfef7fDeEPhypXUKHiLC5WzWrYlkwVQ0=;
	b=Jl9vnoYgWCEzeGurPXcZzyJ6cueoAVQP5H+L3f9N1HwEGzoFOpgbqjPMTzRws7NkPq
	JnctTZmyFyftZ85F1KjiuQOYakyzK1Fu407h/BfeokIYHYsYMR7LYgdtlBlOtObqEDu2
	dWFGYRd5i8GHR2eM/zPrz8p3MM1ifmCCj14frQ1OdtrYRxu31Bw7t90Ycok72pGPRcgd
	cxD+uiFsAvYvPwSryWVJreKKJWO2wgDCke7g3P2KoKAojS5kyictugJmaLu3WDJ08xaw
	EZZBHHn7c3QcTYfa7aXY9J+x5RXyTooitVLOv4ceI2DU38WKhpLNgSf5wK8a8ZGViQKT
	UCHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DAIo3+oToQlhfef7fDeEPhypXUKHiLC5WzWrYlkwVQ0=;
	b=EYlJwZY3zSwGgv/RxJ1drRzy7Is6HbJT5nKPupsBR4tnshtbHzD4zSf6MbFlYgvAR5
	ONqyuVB4pywlOrOX74s7DqLXsZQlHy22yWQan52/UWNYSmU2aQqbs0cyD7ImCoPZgsRI
	rtiNXapaXachxhvIE92/RatWU3hz5KAhsn2R25aCRCFX/zwGZ9C0yP0DDu25L004jlJh
	0LiBEa6miWkmrttDnr4mTTnFK05q3mzbXz10Oo5ESNFgodydcGjj+zmEB1ioP/HxmD9j
	YnBy9+jG0YWaldGhXbA+SkeqmAWral5wJSj2TFa+1x3HcIfhOPoFPDy9vRmcvp1CpP+j
	0tLQ==
X-Gm-Message-State: AFeK/H0IonUzvJddH7g9ZvsCF8TJU8i5b+NcNbMK+C1ninEIvc7yanvfOphNpv4i/Lm4ww==
X-Received: by 10.28.37.135 with SMTP id l129mr5607171wml.49.1489929240344;
	Sun, 19 Mar 2017 06:14:00 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.217.162])
	by smtp.gmail.com with ESMTPSA id 36sm1114616wrk.15.2017.03.19.06.13.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 19 Mar 2017 06:13:59 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Mar 2017 14:13:34 +0100
Message-Id: <1489929217-24568-2-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489929217-24568-1-git-send-email-liu.ming50@gmail.com>
References: <1489929217-24568-1-git-send-email-liu.ming50@gmail.com>
Cc: bruce.ashfield@windriver.com, yue.tao@windriver.com,
	Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH 1/4] kernel.bbclass: introduce INITRAMFS_IMAGE_NAME
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
X-List-Received-Date: Sun, 19 Mar 2017 13:14:00 -0000

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
index f9702f8..1be9022 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -362,7 +362,7 @@ fitimage_assemble() {
 	if [ "x${ramdiskcount}" = "x1" ] ; then
 		# Find and use the first initramfs image archive type we find
 		for img in cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.gz cpio; do
-			initramfs_path="${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.${img}"
+			initramfs_path="${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.${img}"
 			echo "Using $initramfs_path"
 			if [ -e "${initramfs_path}" ]; then
 				fitimage_emit_section_ramdisk ${1} "${ramdiskcount}" "${initramfs_path}"
@@ -445,11 +445,11 @@ kernel_do_deploy_append() {
 
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
index 1e0646a..6905a9b 100644
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


