Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8805C6612D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 00:55:26 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id x124so341649wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 17:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3vZ4T+IthADdcdhJj8LLY9R65fG90AGZktTHoc+mBC0=;
	b=ayu8dljgeLHDy2srhU6uFeLKTRmSOd/KXgJe4pLCaokCYBEPG9KGRDrENr9KSwbwif
	9DvZE4Ba9iL220fXQka8s3+64iL+FSRFrLQbHvGR212sOOEu6hWaLOVVM2pSSGCVtK71
	gp/v8xObBNoypXzhn8qouXeHqEUP+RAempEYtOLCuIzJ44x+eNGUX8aNcVlWkgZr8G51
	4RjorxZvMW3vOW9jzgqXfb/21Nwi6byLjSxBmhqzsQCwTU8lfvW3JQBAnP0Karhf16yu
	obHauO2fBtSz+gRbvexaHiq+kUhJHl85zxL9LmCDealUZrboHY3FOSIh0q0Trn+Eg7ke
	MI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3vZ4T+IthADdcdhJj8LLY9R65fG90AGZktTHoc+mBC0=;
	b=bOeKcCaqgWoPbclIB6S0sgjIFuM1T34GPG7cq4jF5N60hgSIOF9v1HeicFZYwt1zDU
	SavjvoBw0m37+DBvKAQw3Rf5oXVTtSUH1dNTeNmjwTl/ynr3iWiMkwYHD0VNDnUQHnq5
	KcTev4tfRTwsvnYVRq9/FxMJim6pTddIWPShARVmVBmalNcs98jJnHLX/brBiNqT3g3F
	kjzTT6TXZOz7WK6Ec01ZnnmQz1np/wLA8XELNFah/WSbTId8hrlJOVM1N2HKwjV2rNit
	5MLiO4gDErHFb7iyb0iMtijQOeXSiyaWDvAv7Y84eea9jsoAxZjNJRAT3JWebFIJ9d2v
	6aVw==
X-Gm-Message-State: AFeK/H30h56l4Kv0LipigFn/+p9wyER/Qcxg/izf87LXcwVhEuGxRZL5IkIdvis6Z+T5Iw==
X-Received: by 10.28.109.147 with SMTP id b19mr272806wmi.69.1490057727732;
	Mon, 20 Mar 2017 17:55:27 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([223.104.101.84])
	by smtp.gmail.com with ESMTPSA id 10sm8882258wrz.44.2017.03.20.17.55.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Mar 2017 17:55:27 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Mar 2017 01:55:00 +0100
Message-Id: <1490057703-12819-3-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490057703-12819-1-git-send-email-liu.ming50@gmail.com>
References: <1490057703-12819-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH 2/5] kernel.bbclass: introduce INITRAMFS_IMAGE_NAME
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
X-List-Received-Date: Tue, 21 Mar 2017 00:55:26 -0000

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
index d39fa24..8feb2c1 100644
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


