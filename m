Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE02BC433FE
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 21:58:51 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.3080.1640037530457152965
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 13:58:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=RlIoWzrJ;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id C143920B717B; Mon, 20 Dec 2021 13:58:49 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C143920B717B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1640037529;
	bh=HZSmYezc/Sn56gNHTQ09jMrZqrYsK/uCSg1pDY1KKOk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RlIoWzrJPeDFDp7cO1Xo3PEJpEuNJKkrcwbp8BlIlELMndPgSukvaKzWJ4XFBB5e8
	 +yrLJcrC1Arqs05xW/mbxbJih1T7YVhTelnt2b8uO2iYscjpvJbgh1ptpjplr7TbfH
	 PKHueL4Wj5+0Kk4e2fiIqwu9+zRl4eBt0co8lFvM=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/3] classes/kernel*: add variables to allow changing
 artifact extension
Date: Mon, 20 Dec 2021 13:58:23 -0800
Message-Id: 
 <f3b6f49c506eea679efc1b5d5840c8a0ba7f45f7.1640036988.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1640036988.git.paul.eggleton@linux.microsoft.com>
References: <cover.1640036988.git.paul.eggleton@linux.microsoft.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 21:58:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159899

From: Paul Eggleton <paul.eggleton@microsoft.com>

Allow .bin suffix to be removed (or changed) in the various artifact
filenames. Removing this extension is useful when trying to remove
symlinks and present only unversioned image files (especially for the
FIT image).

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 meta/classes/kernel-artifact-names.bbclass |  4 ++++
 meta/classes/kernel-devicetree.bbclass     | 12 ++++++------
 meta/classes/kernel-fitimage.bbclass       |  8 ++++----
 meta/classes/kernel.bbclass                | 10 +++++-----
 4 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/meta/classes/kernel-artifact-names.bbclass b/meta/classes/kernel-artifact-names.bbclass
index e1d943b..e77107c 100644
--- a/meta/classes/kernel-artifact-names.bbclass
+++ b/meta/classes/kernel-artifact-names.bbclass
@@ -8,16 +8,20 @@ inherit image-artifact-names
 
 KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
 KERNEL_ARTIFACT_LINK_NAME ?= "${MACHINE}"
+KERNEL_ARTIFACT_BIN_EXT ?= ".bin"
 
 KERNEL_IMAGE_NAME ?= "${KERNEL_ARTIFACT_NAME}"
 KERNEL_IMAGE_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"
+KERNEL_IMAGE_BIN_EXT ?= "${KERNEL_ARTIFACT_BIN_EXT}"
 KERNEL_IMAGETYPE_SYMLINK ?= "1"
 
 KERNEL_DTB_NAME ?= "${KERNEL_ARTIFACT_NAME}"
 KERNEL_DTB_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"
+KERNEL_DTB_BIN_EXT ?= "${KERNEL_ARTIFACT_BIN_EXT}"
 
 KERNEL_FIT_NAME ?= "${KERNEL_ARTIFACT_NAME}"
 KERNEL_FIT_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"
+KERNEL_FIT_BIN_EXT ?= "${KERNEL_ARTIFACT_BIN_EXT}"
 
 MODULE_TARBALL_NAME ?= "${KERNEL_ARTIFACT_NAME}"
 MODULE_TARBALL_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"
diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index c8aaf74..b4338da 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -93,18 +93,18 @@ do_deploy:append() {
 			if [ "$type" = "zImage" ] && [ "${KERNEL_DEVICETREE_BUNDLE}" = "1" ]; then
 				cat ${D}/${KERNEL_IMAGEDEST}/$type \
 					$deployDir/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext \
-					> $deployDir/$type-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext.bin
+					> $deployDir/$type-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext${KERNEL_DTB_BIN_EXT}
 				if [ -n "${KERNEL_DTB_LINK_NAME}" ]; then
-					ln -sf $type-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext.bin \
-						$deployDir/$type-$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext.bin
+					ln -sf $type-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext${KERNEL_DTB_BIN_EXT} \
+						$deployDir/$type-$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext${KERNEL_DTB_BIN_EXT}
 				fi
 				if [ -e "${KERNEL_OUTPUT_DIR}/${type}.initramfs" ]; then
 					cat ${KERNEL_OUTPUT_DIR}/${type}.initramfs \
 						$deployDir/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext \
-						>  $deployDir/${type}-${INITRAMFS_NAME}-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext.bin
+						>  $deployDir/${type}-${INITRAMFS_NAME}-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext${KERNEL_DTB_BIN_EXT}
 					if [ -n "${KERNEL_DTB_LINK_NAME}" ]; then
-						ln -sf ${type}-${INITRAMFS_NAME}-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext.bin \
-							$deployDir/${type}-${INITRAMFS_NAME}-$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext.bin
+						ln -sf ${type}-${INITRAMFS_NAME}-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext${KERNEL_DTB_BIN_EXT} \
+							$deployDir/${type}-${INITRAMFS_NAME}-$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext${KERNEL_DTB_BIN_EXT}
 					fi
 				fi
 			fi
diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 11dce67..b0c971b 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -727,9 +727,9 @@ kernel_do_deploy:append() {
 			fi
 
 			echo "Copying linux.bin file..."
-			install -m 0644 ${B}/linux.bin $deployDir/fitImage-linux.bin-${KERNEL_FIT_NAME}.bin
+			install -m 0644 ${B}/linux.bin $deployDir/fitImage-linux.bin-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}
 			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
-				ln -snf fitImage-linux.bin-${KERNEL_FIT_NAME}.bin "$deployDir/fitImage-linux.bin-${KERNEL_FIT_LINK_NAME}"
+				ln -snf fitImage-linux.bin-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT} "$deployDir/fitImage-linux.bin-${KERNEL_FIT_LINK_NAME}"
 			fi
 		fi
 
@@ -742,9 +742,9 @@ kernel_do_deploy:append() {
 
 			if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
 				echo "Copying fitImage-${INITRAMFS_IMAGE} file..."
-				install -m 0644 ${B}/arch/${ARCH}/boot/fitImage-${INITRAMFS_IMAGE} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.bin"
+				install -m 0644 ${B}/arch/${ARCH}/boot/fitImage-${INITRAMFS_IMAGE} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}"
 				if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
-					ln -snf fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.bin "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
+					ln -snf fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
 				fi
 			fi
 		fi
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 57990bd..5d70940 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -768,12 +768,12 @@ kernel_do_deploy() {
 
 	for imageType in ${KERNEL_IMAGETYPES} ; do
 		baseName=$imageType-${KERNEL_IMAGE_NAME}
-		install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType $deployDir/$baseName.bin
+		install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType $deployDir/$baseName${KERNEL_IMAGE_BIN_EXT}
 		if [ -n "${KERNEL_IMAGE_LINK_NAME}" ] ; then
-			ln -sf $baseName.bin $deployDir/$imageType-${KERNEL_IMAGE_LINK_NAME}.bin
+			ln -sf $baseName${KERNEL_IMAGE_BIN_EXT} $deployDir/$imageType-${KERNEL_IMAGE_LINK_NAME}${KERNEL_IMAGE_BIN_EXT}
 		fi
 		if [ "${KERNEL_IMAGETYPE_SYMLINK}" = "1" ] ; then
-			ln -sf $baseName.bin $deployDir/$imageType
+			ln -sf $baseName${KERNEL_IMAGE_BIN_EXT} $deployDir/$imageType
 		fi
 	done
 
@@ -798,9 +798,9 @@ kernel_do_deploy() {
 				continue
 			fi
 			initramfsBaseName=$imageType-${INITRAMFS_NAME}
-			install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType.initramfs $deployDir/$initramfsBaseName.bin
+			install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType.initramfs $deployDir/$initramfsBaseName${KERNEL_IMAGE_BIN_EXT}
 			if [ -n "${INITRAMFS_LINK_NAME}" ] ; then
-				ln -sf $initramfsBaseName.bin $deployDir/$imageType-${INITRAMFS_LINK_NAME}.bin
+				ln -sf $initramfsBaseName${KERNEL_IMAGE_BIN_EXT} $deployDir/$imageType-${INITRAMFS_LINK_NAME}${KERNEL_IMAGE_BIN_EXT}
 			fi
 		done
 	fi
-- 
1.8.3.1


