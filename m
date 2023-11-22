Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72F4AC61DF5
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 12:45:18 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.18520.1700657113383887267
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 04:45:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ThQkF0cQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-991c786369cso936911166b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 04:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700657112; x=1701261912; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lkJ1ujenh9mWajf7E1tItRrrdulx+HQ2UQSuIWBRZak=;
        b=ThQkF0cQ8dT5B3eaCvg/6Q/zFzvVGgbvlyLOhyg95CPk5g8bNVJaUl8krZQrFowkIP
         Wm+bR+1dcD+jOA7BaxoWRpj5/yMkSCA7lY5VU8a7ZGmoCv0Gx2IuFtOEYYgrtNx3c1G9
         NGBvRDripPmHMXSOc/PCEENv9ad8hX7c49bKwzlFSW6B5QR4NDqXfbspWuVe8CcuRHq/
         1Xkvt9Ug3gEzi8aX+pdV3sGvfhPmuMtUGSYdjNR4WYYVO9y/uuoJxOzZTbR5uXbQWkdM
         Ev12EBT34r/hJOW8WVcn43QJqmHF4pdNRNJXFTiozVDhySGIP0QfQbqTd1UIHYXOLtVb
         Sx4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700657112; x=1701261912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lkJ1ujenh9mWajf7E1tItRrrdulx+HQ2UQSuIWBRZak=;
        b=jmlYXaKFJQeGjQ6kQDY3vR4QSNumjSGi3QMeHWRguHC1ypta3nfQCaeAtbTWT8+Sl9
         Bzxjx1BU2hDMOxBsxIHSbxDsKWsvcuThZ2ekFCudAtvqVy1+cJjnjTzCU9IyplxEpOmH
         zU4bxaYWxQLM8S6WW6hR5Nf5qPajqvP/mlmmLD64H2RoYwc6VhnufPXEOaDZaqgf/mlU
         RNVRhqg8W65Xre0eSo/WqMlHZjnLZQ+vascgZVUrvzy1bdRPjt+6its2em3JcC+RJ/ib
         iigJUI0W3nS+O7C8ae2K1EgAyF/yMCoUpJBEZrNjoRSyT/74oPhbkuo1JPDHObxhWNJQ
         JKtA==
X-Gm-Message-State: AOJu0Yxa32AMMZsc34Kb3w0L7eQU75x9EfBJk69k+nWo4fxyzaub2RqX
	kRDalBDQ+e4icnlBaKD2ZsJgtsxllRE=
X-Google-Smtp-Source: AGHT+IGhfWq/5A6qxDBc1hK5mWV8rP/aAckn1P03ppqOfBUyzL2jn6aNWt4IHQeiUKDZWihIGRdy/Q==
X-Received: by 2002:a17:906:4749:b0:9bf:9c58:e91e with SMTP id j9-20020a170906474900b009bf9c58e91emr1291789ejs.56.1700657111518;
        Wed, 22 Nov 2023 04:45:11 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id n3-20020a1709061d0300b00a047ef6f2c6sm700393ejh.135.2023.11.22.04.45.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 04:45:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/21] kernel: move the leading dash into KERNEL_ARTIFACT_NAME
Date: Wed, 22 Nov 2023 13:44:34 +0100
Message-ID: <4002ad7942d87e16d61df25dab114975a0272a39.1700600804.git.martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1700600804.git.martin.jansa@gmail.com>
References: <cover.1700600804.git.martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 12:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191081

* this matches how IMAGE_MACHINE_SUFFIX works and we can use
  that for the default value

* allows to set IMAGE_MACHINE_SUFFIX to empty for people
  who prefer to keep MACHINE name only in the directory name
  otherwise there would be a stray dash in:
  lrwxrwxrwx 2 martin martin   12 Nov 18 13:25 bzImage -> bzImage-.bin
  -rw-r--r-- 2 martin martin  12M Nov 18 13:25 bzImage-.bin
  -rw-r--r-- 2 martin martin 182M Nov 18 13:25 modules-.tgz
  if you set
  KERNEL_ARTIFACT_NAME = ""

[YOCTO #12937]

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../classes-recipe/kernel-artifact-names.bbclass |  6 +++---
 meta/classes-recipe/kernel-devicetree.bbclass    | 12 ++++++------
 meta/classes-recipe/kernel-fitimage.bbclass      | 16 ++++++++--------
 meta/classes-recipe/kernel.bbclass               | 10 +++++-----
 4 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/meta/classes-recipe/kernel-artifact-names.bbclass b/meta/classes-recipe/kernel-artifact-names.bbclass
index 186c6bc5b9..023ce61de5 100644
--- a/meta/classes-recipe/kernel-artifact-names.bbclass
+++ b/meta/classes-recipe/kernel-artifact-names.bbclass
@@ -14,7 +14,7 @@ inherit image-artifact-names
 
 KERNEL_VERSION_SUFFIX ?= "${IMAGE_VERSION_SUFFIX}"
 
-KERNEL_ARTIFACT_NAME ?= "${MACHINE}"
+KERNEL_ARTIFACT_NAME ?= "${IMAGE_MACHINE_SUFFIX}"
 KERNEL_ARTIFACT_LINK_NAME ?= "${KERNEL_ARTIFACT_NAME}${KERNEL_VERSION_SUFFIX}"
 KERNEL_ARTIFACT_BIN_EXT ?= ".bin"
 
@@ -35,5 +35,5 @@ MODULE_TARBALL_NAME ?= "${KERNEL_ARTIFACT_NAME}"
 MODULE_TARBALL_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"
 MODULE_TARBALL_DEPLOY ?= "1"
 
-INITRAMFS_NAME ?= "initramfs-${KERNEL_ARTIFACT_NAME}"
-INITRAMFS_LINK_NAME ?= "initramfs-${KERNEL_ARTIFACT_LINK_NAME}"
+INITRAMFS_NAME ?= "initramfs${KERNEL_ARTIFACT_NAME}"
+INITRAMFS_LINK_NAME ?= "initramfs${KERNEL_ARTIFACT_LINK_NAME}"
diff --git a/meta/classes-recipe/kernel-devicetree.bbclass b/meta/classes-recipe/kernel-devicetree.bbclass
index 1fde90f023..2cd8588304 100644
--- a/meta/classes-recipe/kernel-devicetree.bbclass
+++ b/meta/classes-recipe/kernel-devicetree.bbclass
@@ -102,7 +102,7 @@ kernel_do_deploy:append() {
 		fi
 		install -m 0644 ${D}/${KERNEL_DTBDEST}/$dtb $deployDir/$dtb_base_name.$dtb_ext
 		if [ -n "${KERNEL_DTB_NAME}" ] ; then
-			ln -vf $deployDir/$dtb_base_name.$dtb_ext $deployDir/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext
+			ln -vf $deployDir/$dtb_base_name.$dtb_ext $deployDir/$dtb_base_name${KERNEL_DTB_NAME}.$dtb_ext
 		fi
 		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
 			if [ "$type" = "zImage" ] && [ "${KERNEL_DEVICETREE_BUNDLE}" = "1" ]; then
@@ -111,7 +111,7 @@ kernel_do_deploy:append() {
 					> $deployDir/$type-$dtb_base_name.$dtb_ext${KERNEL_DTB_BIN_EXT}
 				if [ -n "${KERNEL_DTB_NAME}" ]; then
 					ln -sf $type-$dtb_base_name.$dtb_ext${KERNEL_DTB_BIN_EXT} \
-						$deployDir/$type-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext${KERNEL_DTB_BIN_EXT}
+						$deployDir/$type-$dtb_base_name${KERNEL_DTB_NAME}.$dtb_ext${KERNEL_DTB_BIN_EXT}
 				fi
 				if [ -e "${KERNEL_OUTPUT_DIR}/${type}.initramfs" ]; then
 					cat ${KERNEL_OUTPUT_DIR}/${type}.initramfs \
@@ -119,7 +119,7 @@ kernel_do_deploy:append() {
 						>  $deployDir/${type}-${INITRAMFS_NAME}-$dtb_base_name.$dtb_ext${KERNEL_DTB_BIN_EXT}
 					if [ -n "${KERNEL_DTB_NAME}" ]; then
 						ln -sf ${type}-${INITRAMFS_NAME}-$dtb_base_name.$dtb_ext${KERNEL_DTB_BIN_EXT} \
-							$deployDir/${type}-${INITRAMFS_NAME}-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext${KERNEL_DTB_BIN_EXT}
+							$deployDir/${type}-${INITRAMFS_NAME}-$dtb_base_name${KERNEL_DTB_NAME}.$dtb_ext${KERNEL_DTB_BIN_EXT}
 					fi
 				fi
 			fi
@@ -134,14 +134,14 @@ kernel_do_deploy_links:append() {
 			dtb=`normalize_dtb "$dtbf"`
 			dtb_ext=${dtb##*.}
 			dtb_base_name=`basename $dtb .$dtb_ext`
-			ln -vf $deployDir/$dtb_base_name.$dtb_ext $deployDir/$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext
+			ln -vf $deployDir/$dtb_base_name.$dtb_ext $deployDir/$dtb_base_name${KERNEL_DTB_LINK_NAME}.$dtb_ext
 			for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
 				if [ "$type" = "zImage" ] && [ "${KERNEL_DEVICETREE_BUNDLE}" = "1" ] ; then
 					ln -vf $deployDir/$type-$dtb_base_name.$dtb_ext${KERNEL_DTB_BIN_EXT} \
-						$deployDir/$type-$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext${KERNEL_DTB_BIN_EXT}
+						$deployDir/$type-$dtb_base_name${KERNEL_DTB_LINK_NAME}.$dtb_ext${KERNEL_DTB_BIN_EXT}
 					if [ -e "${KERNEL_OUTPUT_DIR}/${type}.initramfs" ]; then
 						ln -vf $deployDir/${type}-${INITRAMFS_NAME}-$dtb_base_name.$dtb_ext${KERNEL_DTB_BIN_EXT} \
-							$deployDir/${type}-${INITRAMFS_NAME}-$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext${KERNEL_DTB_BIN_EXT}
+							$deployDir/${type}-${INITRAMFS_NAME}-$dtb_base_name${KERNEL_DTB_LINK_NAME}.$dtb_ext${KERNEL_DTB_BIN_EXT}
 					fi
 				fi
 			done
diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index 50d89a4383..266680ffa8 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -843,17 +843,17 @@ kernel_do_deploy:append() {
 
 		if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
 			bbnote "Copying fit-image.its source file..."
-			install -m 0644 ${B}/fit-image.its "$deployDir/fitImage-its-${KERNEL_FIT_NAME}.its"
+			install -m 0644 ${B}/fit-image.its "$deployDir/fitImage-its${KERNEL_FIT_NAME}.its"
 			bbnote "Copying linux.bin file..."
-			install -m 0644 ${B}/linux.bin $deployDir/fitImage-linux.bin-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}
+			install -m 0644 ${B}/linux.bin $deployDir/fitImage-linux.bin${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}
 		fi
 
 		if [ -n "${INITRAMFS_IMAGE}" ]; then
 			bbnote "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
-			install -m 0644 ${B}/fit-image-${INITRAMFS_IMAGE}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its"
+			install -m 0644 ${B}/fit-image-${INITRAMFS_IMAGE}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}${KERNEL_FIT_NAME}.its"
 			if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
 				bbnote "Copying fitImage-${INITRAMFS_IMAGE} file..."
-				install -m 0644 ${B}/${KERNEL_OUTPUT_DIR}/fitImage-${INITRAMFS_IMAGE} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}"
+				install -m 0644 ${B}/${KERNEL_OUTPUT_DIR}/fitImage-${INITRAMFS_IMAGE} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}"
 			fi
 		fi
 	fi
@@ -864,14 +864,14 @@ kernel_do_deploy_links:append() {
 			bbnote "Not creating versioned hardlinks, because KERNEL_FIT_LINK_NAME is empty or identical to KERNEL_FIT_NAME"
 		else
 			if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
-				ln -vf $deployDir/fitImage-its-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${KERNEL_FIT_LINK_NAME}"
-				ln -vf $deployDir/fitImage-linux.bin-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT} "$deployDir/fitImage-linux.bin-${KERNEL_FIT_LINK_NAME}"
+				ln -vf $deployDir/fitImage-its${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its${KERNEL_FIT_LINK_NAME}"
+				ln -vf $deployDir/fitImage-linux.bin${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT} "$deployDir/fitImage-linux.bin${KERNEL_FIT_LINK_NAME}"
 			fi
 
 			if [ -n "${INITRAMFS_IMAGE}" ]; then
-				ln -vf $deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
+				ln -vf $deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}${KERNEL_FIT_LINK_NAME}"
 				if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
-					ln -vf $deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
+					ln -vf $deployDir/fitImage-${INITRAMFS_IMAGE_NAME}${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}${KERNEL_FIT_LINK_NAME}"
 				fi
 			fi
 		fi
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 7963b6cc17..e38784a320 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -813,7 +813,7 @@ kernel_do_deploy() {
 	fi
 
 	for imageType in ${KERNEL_IMAGETYPES} ; do
-		baseName=$imageType-${KERNEL_IMAGE_NAME}
+		baseName=$imageType${KERNEL_IMAGE_NAME}
 
 		if [ -s ${KERNEL_OUTPUT_DIR}/$imageType.stripped ] ; then
 			install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType.stripped $deployDir/$baseName${KERNEL_IMAGE_BIN_EXT}
@@ -833,7 +833,7 @@ kernel_do_deploy() {
 			TAR_ARGS=""
 		fi
 		TAR_ARGS="$TAR_ARGS --owner=0 --group=0"
-		tar $TAR_ARGS -cv -C ${D}${root_prefix} lib | gzip -9n > $deployDir/modules-${MODULE_TARBALL_NAME}.tgz
+		tar $TAR_ARGS -cv -C ${D}${root_prefix} lib | gzip -9n > $deployDir/modules${MODULE_TARBALL_NAME}.tgz
 	fi
 
 	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
@@ -859,15 +859,15 @@ kernel_do_deploy_links() {
 		bbnote "Not creating versioned hardlinks for kernel images, because KERNEL_IMAGE_LINK_NAME is empty or identical to KERNEL_IMAGE_NAME"
 	else
 		for imageType in ${KERNEL_IMAGETYPES} ; do
-			ln -vf $deployDir/$imageType-${KERNEL_IMAGE_NAME}.bin $deployDir/$imageType-${KERNEL_IMAGE_LINK_NAME}${KERNEL_IMAGE_BIN_EXT}
+			ln -vf $deployDir/$imageType${KERNEL_IMAGE_NAME}.bin $deployDir/$imageType${KERNEL_IMAGE_LINK_NAME}${KERNEL_IMAGE_BIN_EXT}
 		done
 	fi
 
 	if [ -z "${MODULE_TARBALL_LINK_NAME}" -o "${MODULE_TARBALL_LINK_NAME}" = "${MODULE_TARBALL_NAME}" ] ; then
 		bbnote "Not creating versioned hardlinks for module tarball, because MODULE_TARBALL_LINK_NAME is empty or identical to MODULE_TARBALL_NAME"
 	else
-		if [ ${MODULE_TARBALL_DEPLOY} = "1" -a -f $deployDir/modules-${MODULE_TARBALL_NAME}.tgz ] ; then
-			ln -vf $deployDir/modules-${MODULE_TARBALL_NAME}.tgz $deployDir/modules-${MODULE_TARBALL_LINK_NAME}.tgz
+		if [ ${MODULE_TARBALL_DEPLOY} = "1" -a -f $deployDir/modules${MODULE_TARBALL_NAME}.tgz ] ; then
+			ln -vf $deployDir/modules${MODULE_TARBALL_NAME}.tgz $deployDir/modules${MODULE_TARBALL_LINK_NAME}.tgz
 		fi
 	fi
 
-- 
2.43.0


