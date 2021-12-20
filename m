Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF1BC433F5
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 21:58:51 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.3079.1640037530389120508
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 13:58:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=Ckz9xUCJ;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id B64CA20B717A; Mon, 20 Dec 2021 13:58:49 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B64CA20B717A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1640037529;
	bh=unIXrulSPo6AOijDbG+Aq467czlHzq9QVoBReshOq9k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ckz9xUCJnbbWB6QJ2aFJ3fxhjDcio5BU6syRguF1v63VhvhD0o59tjQhySuH5wsfO
	 FIGrF/3hFSbFjMNXajTZMFv/pkDTvhF4KFrT/VUnZXJoD/GIsq62xbIxaMwJomTguf
	 e/iuSi7bbfGevofO2ZL7NM3nJr5l0YvDVQ103r0s=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/3] classes/kernel*: allow disabling symlink creation
Date: Mon, 20 Dec 2021 13:58:22 -0800
Message-Id: 
 <604edd70714fbd7e2af7dbc6f92af0b7971d82b1.1640036988.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1640036988.git.paul.eggleton@linux.microsoft.com>
References: <cover.1640036988.git.paul.eggleton@linux.microsoft.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 21:58:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159902

From: Paul Eggleton <paul.eggleton@microsoft.com>

Allow setting any of the *_LINK_NAME variables to empty string in order
to disable creating symlinks for kernel artifacts, as you can already
for filesystem images with IMAGE_LINK_NAME. Additionally, for the image
type named symlinks, add a KERNEL_IMAGETYPE_SYMLINK boolean variable
which you can set to 0 to disable those symlinks as well.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 meta/classes/kernel-artifact-names.bbclass |  1 +
 meta/classes/kernel-devicetree.bbclass     | 20 ++++++++++++++------
 meta/classes/kernel-fitimage.bbclass       | 16 ++++++++++++----
 meta/classes/kernel.bbclass                | 16 ++++++++++++----
 4 files changed, 39 insertions(+), 14 deletions(-)

diff --git a/meta/classes/kernel-artifact-names.bbclass b/meta/classes/kernel-artifact-names.bbclass
index a65cddd..e1d943b 100644
--- a/meta/classes/kernel-artifact-names.bbclass
+++ b/meta/classes/kernel-artifact-names.bbclass
@@ -11,6 +11,7 @@ KERNEL_ARTIFACT_LINK_NAME ?= "${MACHINE}"
 
 KERNEL_IMAGE_NAME ?= "${KERNEL_ARTIFACT_NAME}"
 KERNEL_IMAGE_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"
+KERNEL_IMAGETYPE_SYMLINK ?= "1"
 
 KERNEL_DTB_NAME ?= "${KERNEL_ARTIFACT_NAME}"
 KERNEL_DTB_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"
diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index a50ea4f..c8aaf74 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -83,21 +83,29 @@ do_deploy:append() {
 		dtb_base_name=`basename $dtb .$dtb_ext`
 		install -d $deployDir
 		install -m 0644 ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext $deployDir/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext
-		ln -sf $dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext $deployDir/$dtb_base_name.$dtb_ext
-		ln -sf $dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext $deployDir/$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext
+		if [ "${KERNEL_IMAGETYPE_SYMLINK}" = "1" ] ; then
+			ln -sf $dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext $deployDir/$dtb_base_name.$dtb_ext
+		fi
+		if [ -n "${KERNEL_DTB_LINK_NAME}" ] ; then
+			ln -sf $dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext $deployDir/$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext
+		fi
 		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
 			if [ "$type" = "zImage" ] && [ "${KERNEL_DEVICETREE_BUNDLE}" = "1" ]; then
 				cat ${D}/${KERNEL_IMAGEDEST}/$type \
 					$deployDir/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext \
 					> $deployDir/$type-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext.bin
-				ln -sf $type-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext.bin \
-					$deployDir/$type-$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext.bin
+				if [ -n "${KERNEL_DTB_LINK_NAME}" ]; then
+					ln -sf $type-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext.bin \
+						$deployDir/$type-$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext.bin
+				fi
 				if [ -e "${KERNEL_OUTPUT_DIR}/${type}.initramfs" ]; then
 					cat ${KERNEL_OUTPUT_DIR}/${type}.initramfs \
 						$deployDir/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext \
 						>  $deployDir/${type}-${INITRAMFS_NAME}-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext.bin
-					ln -sf ${type}-${INITRAMFS_NAME}-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext.bin \
-						$deployDir/${type}-${INITRAMFS_NAME}-$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext.bin
+					if [ -n "${KERNEL_DTB_LINK_NAME}" ]; then
+						ln -sf ${type}-${INITRAMFS_NAME}-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext.bin \
+							$deployDir/${type}-${INITRAMFS_NAME}-$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext.bin
+					fi
 				fi
 			fi
 		done
diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 8718ce7..11dce67 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -722,22 +722,30 @@ kernel_do_deploy:append() {
 		if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
 			echo "Copying fit-image.its source file..."
 			install -m 0644 ${B}/fit-image.its "$deployDir/fitImage-its-${KERNEL_FIT_NAME}.its"
-			ln -snf fitImage-its-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${KERNEL_FIT_LINK_NAME}"
+			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
+				ln -snf fitImage-its-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${KERNEL_FIT_LINK_NAME}"
+			fi
 
 			echo "Copying linux.bin file..."
 			install -m 0644 ${B}/linux.bin $deployDir/fitImage-linux.bin-${KERNEL_FIT_NAME}.bin
-			ln -snf fitImage-linux.bin-${KERNEL_FIT_NAME}.bin "$deployDir/fitImage-linux.bin-${KERNEL_FIT_LINK_NAME}"
+			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
+				ln -snf fitImage-linux.bin-${KERNEL_FIT_NAME}.bin "$deployDir/fitImage-linux.bin-${KERNEL_FIT_LINK_NAME}"
+			fi
 		fi
 
 		if [ -n "${INITRAMFS_IMAGE}" ]; then
 			echo "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
 			install -m 0644 ${B}/fit-image-${INITRAMFS_IMAGE}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its"
-			ln -snf fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
+			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
+				ln -snf fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
+			fi
 
 			if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
 				echo "Copying fitImage-${INITRAMFS_IMAGE} file..."
 				install -m 0644 ${B}/arch/${ARCH}/boot/fitImage-${INITRAMFS_IMAGE} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.bin"
-				ln -snf fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.bin "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
+				if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
+					ln -snf fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.bin "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
+				fi
 			fi
 		fi
 	fi
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 0df24ac..57990bd 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -769,8 +769,12 @@ kernel_do_deploy() {
 	for imageType in ${KERNEL_IMAGETYPES} ; do
 		baseName=$imageType-${KERNEL_IMAGE_NAME}
 		install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType $deployDir/$baseName.bin
-		ln -sf $baseName.bin $deployDir/$imageType-${KERNEL_IMAGE_LINK_NAME}.bin
-		ln -sf $baseName.bin $deployDir/$imageType
+		if [ -n "${KERNEL_IMAGE_LINK_NAME}" ] ; then
+			ln -sf $baseName.bin $deployDir/$imageType-${KERNEL_IMAGE_LINK_NAME}.bin
+		fi
+		if [ "${KERNEL_IMAGETYPE_SYMLINK}" = "1" ] ; then
+			ln -sf $baseName.bin $deployDir/$imageType
+		fi
 	done
 
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
@@ -783,7 +787,9 @@ kernel_do_deploy() {
 		TAR_ARGS="$TAR_ARGS --owner=0 --group=0"
 		tar $TAR_ARGS -cv -C ${D}${root_prefix} lib | gzip -9n > $deployDir/modules-${MODULE_TARBALL_NAME}.tgz
 
-		ln -sf modules-${MODULE_TARBALL_NAME}.tgz $deployDir/modules-${MODULE_TARBALL_LINK_NAME}.tgz
+		if [ -n "${MODULE_TARBALL_LINK_NAME}" ] ; then
+			ln -sf modules-${MODULE_TARBALL_NAME}.tgz $deployDir/modules-${MODULE_TARBALL_LINK_NAME}.tgz
+		fi
 	fi
 
 	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
@@ -793,7 +799,9 @@ kernel_do_deploy() {
 			fi
 			initramfsBaseName=$imageType-${INITRAMFS_NAME}
 			install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType.initramfs $deployDir/$initramfsBaseName.bin
-			ln -sf $initramfsBaseName.bin $deployDir/$imageType-${INITRAMFS_LINK_NAME}.bin
+			if [ -n "${INITRAMFS_LINK_NAME}" ] ; then
+				ln -sf $initramfsBaseName.bin $deployDir/$imageType-${INITRAMFS_LINK_NAME}.bin
+			fi
 		done
 	fi
 }
-- 
1.8.3.1


