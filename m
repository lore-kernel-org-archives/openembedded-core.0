Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5259677B1A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 12:11:57 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id l37so30819526wrc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 05:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=b4SXMbcRnQOJ6rbFQpQ1GiFWQJbY/GgIFrn/bjo+0pc=;
	b=T3Ucw73TSkEb9X39613cePCdM67p2Hth2e7YBz22FNByEdkKONOnNow0uIb8xzPnCD
	Las+WDm4S93Kw/YHLdbsWN1omGxRq0lKJM42FfXT9B83WuFY3355U25e0trcLtwGzMZE
	Fm7evN0p5CycSc5GuV/UhEZVzmOoilymQENpoHRaydOBYl9Gy8k8X5f7GWIgERurg3Hp
	AB6D8gPguPIB8yx1Xm0UZpCvSM9BTCOdRBU+IyTA7og9rbMgAVgVAmN1cCaffnuwcHu5
	Ahzlnw8JUuqwcWC2+4JMbyav19aFIZi1I2WODIA7JX1kB3wiaP+9doidU5WeH0dPaqkz
	ggCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=b4SXMbcRnQOJ6rbFQpQ1GiFWQJbY/GgIFrn/bjo+0pc=;
	b=P64OxzNG1eDtHjVMl/v2jaqFOSR9ehp0xDChmZKmbiU1o7WXvqZwpRA7JnqHY5jGr2
	ga3XrYz9RS46jHnJNi5tD957sLIbQmd0XPJPsrXGYsqcOOWXlh9wcFUsYzGK1g39di3U
	GrBOmdWrDnxUJyawGRgQuaOnOHvi6xsERR+DrFh9GCeF61Xz/nV18cPxCzzF7Yw/zuFZ
	DRqudRmQwVjezbpAr/ZNyTwBsVB5+Qs8KUQiEnHQE56MlNABWFU7JU+28a0o4I2ko+ei
	Sz4wCIrmpgdkEQJz82xxptDVGTqL2OssVNR6FMe2Qw9x47MsWIGjpmegLWUoLF7cddxw
	ly8g==
X-Gm-Message-State: AFeK/H37VLhRdo8b18xK6WQOmRsg3nUkw5tVQMN8TYkrVA0IgJNS/txNdCN0XYhC9gYRBQ==
X-Received: by 10.223.135.109 with SMTP id 42mr2519116wrz.141.1490271118999;
	Thu, 23 Mar 2017 05:11:58 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.217.162]) by smtp.gmail.com with ESMTPSA id
	k190sm4093773wmg.10.2017.03.23.05.11.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Mar 2017 05:11:58 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Mar 2017 13:11:13 +0100
Message-Id: <1490271075-3490-3-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490271075-3490-1-git-send-email-liu.ming50@gmail.com>
References: <1490271075-3490-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH V4 2/4] kernel.bbclass: introduce INITRAMFS_IMAGE_NAME
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
X-List-Received-Date: Thu, 23 Mar 2017 12:11:58 -0000

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
index 2d344b5..0958db4 100644
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
index d175f1d..4c4086a 100644
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


