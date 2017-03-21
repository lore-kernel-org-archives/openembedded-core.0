Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8A741776C6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 14:35:14 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id x124so3268572wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 07:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3vZ4T+IthADdcdhJj8LLY9R65fG90AGZktTHoc+mBC0=;
	b=FhvgA2wN/msgfCwzKtIcNB+pyBsZlFJztN92dsFV6PLdr8vN9pzgXb6XmSkN8IHNZW
	bVMtoy6Frn0v6tUcv1Xbqu3UwyS21y/zX8jYf6djWb0Q39KiMeysa532a/UeclS4g0im
	mI2imiaL8mz/d7St/EjpRtmqZl7Y83HQGxe4DiHm4NKgq2n+yL/85OTmrUGbYt0qM+bx
	fdzta0LA1G+0KkPmC59rjxeYe4qZGPRLe345dNoLBv/tK+PlXN3nMKcmE+HkTWbAUZlC
	EW28A7AK1rUmhRPxWQuDvkQpughCjuKCbH4Gixnc2xBpdKIrGobVULebTzwOYnnLib7/
	92Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3vZ4T+IthADdcdhJj8LLY9R65fG90AGZktTHoc+mBC0=;
	b=pnSVkopZM+PcL1wbEURrXZILhJxH46UjJBqnfnEldTbGlzsb0e5tZODqzhQ0JyAPN3
	ZiUoOOfiz/gwsxZ4SMWcNqlOxlCVwF7/ct/sDTXJlIzsAJvYlUVWf5Julgh3Gmcc/PAZ
	ll+/3G2FHgcIYkXZFXt79AIBfssZlisL+t3w3aNE+mdUDzJRQQHbxL9bJoaW+ZUzFzEO
	HXldFlRp96JL1nKYhdD+nqg4L+ExTTvF6aK7/r/QaMmBBHoLIsTxrjxEV8Oru74LxhJR
	hV1N8kF035DIfz1qZMgGh4ilGY40gqoEFx02cMRRmOzCfuae3vNKKBMFJjtO2X++iOrq
	i/Zg==
X-Gm-Message-State: AFeK/H2AXBu9cMj00T8GBugQqF0zY9Zr6chpa443/Zt96GbsCO/DZip/U4YGwWoBT8wcPg==
X-Received: by 10.28.111.136 with SMTP id c8mr3097836wmi.128.1490106915144;
	Tue, 21 Mar 2017 07:35:15 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.217.162]) by smtp.gmail.com with ESMTPSA id
	u41sm25225692wrc.24.2017.03.21.07.35.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Mar 2017 07:35:14 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Mar 2017 15:34:49 +0100
Message-Id: <1490106891-13909-3-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490106891-13909-1-git-send-email-liu.ming50@gmail.com>
References: <1490106891-13909-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH 2/4] kernel.bbclass: introduce INITRAMFS_IMAGE_NAME
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
X-List-Received-Date: Tue, 21 Mar 2017 14:35:14 -0000

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


