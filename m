Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.5333.1606352514942136650
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2020 17:01:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=klwjHjPa;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 50FEF20B717B; Wed, 25 Nov 2020 17:01:54 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 50FEF20B717B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1606352514;
	bh=d7Qn/QX8xr+wv/TdG9Wz9EEJaybP7WTX52KvvVfWwVY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=klwjHjPa1VGtrDg2ROeuINKh2DzAq+JeA0cEVD5MUyM6qwXLZ3JrvL4gVeX3Tfnp6
	 btSt/C5G2kq+du9PfSyHfDU5MqrEn2j941I5IxSmj7paRSgjllyDSnesdm+Rj0opOQ
	 CGyekRoq3hb/AfVuBeYdlMYx8z3ombzkRdYyxwto=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] classes/kernel*: allow disabling symlink creation
Date: Wed, 25 Nov 2020 17:01:47 -0800
Message-Id: <3cbf479d1c740e65e5c2fdaae2b060910766b1c6.1606352479.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1606352479.git.paul.eggleton@linux.microsoft.com>
References: <cover.1606352479.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

Allow setting any of the *_LINK_NAME variables to empty string in order
to disable creating symlinks. This is particularly useful for situations
where symlinks in DEPLOY_DIR_IMAGE will be treated externally as
duplicates of the linked files (in which case you would probably set
KERNEL_ARTIFACT_LINK_NAME = "" to disable them all at once).

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 meta/classes/kernel-devicetree.bbclass | 18 ++++++++++++------
 meta/classes/kernel-fitimage.bbclass   | 16 ++++++++++++----
 meta/classes/kernel.bbclass            | 14 ++++++++++----
 3 files changed, 34 insertions(+), 14 deletions(-)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index 81dda80..7cde549 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -73,21 +73,27 @@ do_deploy_append() {
 		dtb_base_name=`basename $dtb .$dtb_ext`
 		install -d $deployDir
 		install -m 0644 ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext $deployDir/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext
-		ln -sf $dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext $deployDir/$dtb_base_name.$dtb_ext
-		ln -sf $dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext $deployDir/$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext
+		if [ -n "${KERNEL_DTB_LINK_NAME}" ] ; then
+			ln -sf $dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext $deployDir/$dtb_base_name.$dtb_ext
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
index bb2f3c4..e91c95f 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -573,20 +573,28 @@ kernel_do_deploy_append() {
 	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
 		echo "Copying fit-image.its source file..."
 		install -m 0644 ${B}/fit-image.its "$deployDir/fitImage-its-${KERNEL_FIT_NAME}.its"
-		ln -snf fitImage-its-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${KERNEL_FIT_LINK_NAME}"
+		if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
+			ln -snf fitImage-its-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${KERNEL_FIT_LINK_NAME}"
+		fi
 
 		echo "Copying linux.bin file..."
 		install -m 0644 ${B}/linux.bin $deployDir/fitImage-linux.bin-${KERNEL_FIT_NAME}.bin
-		ln -snf fitImage-linux.bin-${KERNEL_FIT_NAME}.bin "$deployDir/fitImage-linux.bin-${KERNEL_FIT_LINK_NAME}"
+		if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
+			ln -snf fitImage-linux.bin-${KERNEL_FIT_NAME}.bin "$deployDir/fitImage-linux.bin-${KERNEL_FIT_LINK_NAME}"
+		fi
 
 		if [ -n "${INITRAMFS_IMAGE}" ]; then
 			echo "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
 			install -m 0644 ${B}/fit-image-${INITRAMFS_IMAGE}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its"
-			ln -snf fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
+			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
+				ln -snf fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
+			fi
 
 			echo "Copying fitImage-${INITRAMFS_IMAGE} file..."
 			install -m 0644 ${B}/arch/${ARCH}/boot/fitImage-${INITRAMFS_IMAGE} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.bin"
-			ln -snf fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.bin "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
+			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
+				ln -snf fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.bin "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
+			fi
 		fi
 		if [ "${UBOOT_SIGN_ENABLE}" = "1" -a -n "${UBOOT_DTB_BINARY}" ] ; then
 			# UBOOT_DTB_IMAGE is a realfile, but we can't use
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 1a444ef..299e559 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -725,8 +725,10 @@ kernel_do_deploy() {
 	for imageType in ${KERNEL_IMAGETYPES} ; do
 		baseName=$imageType-${KERNEL_IMAGE_NAME}
 		install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType $deployDir/$baseName.bin
-		ln -sf $baseName.bin $deployDir/$imageType-${KERNEL_IMAGE_LINK_NAME}.bin
-		ln -sf $baseName.bin $deployDir/$imageType
+		if [ -n "${KERNEL_IMAGE_LINK_NAME}" ] ; then
+			ln -sf $baseName.bin $deployDir/$imageType-${KERNEL_IMAGE_LINK_NAME}.bin
+			ln -sf $baseName.bin $deployDir/$imageType
+		fi
 	done
 
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
@@ -739,7 +741,9 @@ kernel_do_deploy() {
 		TAR_ARGS="$TAR_ARGS --owner=0 --group=0"
 		tar $TAR_ARGS -cv -C ${D}${root_prefix} lib | gzip -9n > $deployDir/modules-${MODULE_TARBALL_NAME}.tgz
 
-		ln -sf modules-${MODULE_TARBALL_NAME}.tgz $deployDir/modules-${MODULE_TARBALL_LINK_NAME}.tgz
+		if [ -n "${MODULE_TARBALL_LINK_NAME}" ] ; then
+			ln -sf modules-${MODULE_TARBALL_NAME}.tgz $deployDir/modules-${MODULE_TARBALL_LINK_NAME}.tgz
+		fi
 	fi
 
 	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
@@ -749,7 +753,9 @@ kernel_do_deploy() {
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

