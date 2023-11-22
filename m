Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B72BAC624B4
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 12:45:18 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.18433.1700657112377877467
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 04:45:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dt9gWLcV;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-548f0b7ab11so3300375a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 04:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700657111; x=1701261911; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ax7SqeQuMmGdkGTx59zhzzfJPaq1NnyD/uyZZ2WikvQ=;
        b=Dt9gWLcVGJaS965eFDDETitpNJ4JDUQX4LfwaPTnLRbBfWpQ6/WWPhwesNP2RtzdhJ
         yviYUfKuErChWeoklV7QfeS1u2taVc8mzHPXpQih0QonSpB7lf9iz7Laoh0Ptfo0kVJa
         Ao5V9Deklhxshl/sSegWiCBEEYn4S/FHYzDuclpfddXv6n31m53a3ZPETSg5bhX6Pi0g
         eKZBAT6lCnVoFHnqyosTedfT58hxZHllhLO25I36ZtV+BjdDmt4jeQM3qZ3p8rLuNswJ
         UlrgNfNxHcQUdvZNhdgKwDDzdSPQ+4Yen/hyOqW5X5mHIsD6/IWYM3R+11POKUSfJqTx
         SiTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700657111; x=1701261911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ax7SqeQuMmGdkGTx59zhzzfJPaq1NnyD/uyZZ2WikvQ=;
        b=CKOXYSTfl/VQdxD1uASVWv3qwr9tK/sE4EHwXhtwAWQAnzaF1qCgoZZ007HMpqcWrH
         339/dxfxrGrslxhkxbUVVxZ3bIzmLIxvBMVAaDpGvO8ErzCcNm/hczDkVpE0gjxSdxJf
         9go2UPetJteThrnngCTyRPv7owMe5Ad2Lw9fto4225NMA6XkXis1ak933rTM3wLWvEvX
         sf8NSeKtl9kXkEZ9QJxOKpijc7LAZR/BgSmofO4moXJJo6PDOdbkFwYyv6ArsF4nSD4Q
         UiJ65009XBapKL56wMT6CuBMcBVAOJKjK1YptgAyUksPLNMTroWQ1KyaurjCmlr3C9Pv
         14kQ==
X-Gm-Message-State: AOJu0YwbAQ9uXa4zs3b9wPNI7BjO2nPafBrizxaJOkBE7l6PXrvgnvIY
	PggTyvmybu7uwH8HcbiqLfXZA2WjsFU=
X-Google-Smtp-Source: AGHT+IFZt5MOC3pIToW1/rhoBzVGfJTqP1gLOMrEl9mui5pt1auoTQ7W0JpubQKE+YdCVaA+8RU36g==
X-Received: by 2002:a50:ed89:0:b0:548:5fa3:1483 with SMTP id h9-20020a50ed89000000b005485fa31483mr223116edr.6.1700657110646;
        Wed, 22 Nov 2023 04:45:10 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id r6-20020aa7cfc6000000b0054a9410bac5sm9641edy.77.2023.11.22.04.45.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 04:45:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/21] image, kernel: allow to disable creating the hardlinks by setting *LINK_NAME variables to empty
Date: Wed, 22 Nov 2023 13:44:33 +0100
Message-ID: <3fb298d945d4a4eef1c95f993af6330abdc14ffa.1700600804.git.martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1700600804.git.martin.jansa@gmail.com>
References: <cover.1700600804.git.martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 12:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191080

From: Martin Jansa <Martin.Jansa@gmail.com>

* they can be disabled individually by setting *_LINK_NAME
  to empty or disable them all by setting IMAGE_VERSION_SUFFIX
  to empty (making them equal to *_NAME variables)

There are couple *_LINK_NAME variables:

IMAGE_LINK_NAME = ""
KERNEL_IMAGE_LINK_NAME = ""
KERNEL_DTB_LINK_NAME = ""
KERNEL_FIT_LINK_NAME = ""
MODULE_TARBALL_LINK_NAME = ""
INITRAMFS_LINK_NAME = ""

or

IMAGE_MACHINE_SUFFIX = ""
IMAGE_NAME_SUFFIX = ""
IMAGE_VERSION_SUFFIX = ""

to have really the minimal filenames:

$ ls tmp/deploy/images/qemux86-64/
bzImage                  core-image-minimal.manifest       core-image-minimal.tar.bz2
bzImage-qemux86-64.bin   core-image-minimal.qemuboot.conf  core-image-minimal.testdata.json
core-image-minimal.ext4  core-image-minimal.spdx.tar.zst   modules-qemux86-64.tgz

and to remove MACHINE name from kernel artifacts as well
(if you prefer the MACHINE name in directory only), you can set:
KERNEL_ARTIFACT_NAME = ""

[YOCTO #12937]

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/classes-recipe/image.bbclass             |  3 +-
 meta/classes-recipe/kernel-devicetree.bbclass | 32 +++++++++--------
 meta/classes-recipe/kernel-fitimage.bbclass   | 17 ++++-----
 meta/classes-recipe/kernel.bbclass            | 36 ++++++++++++-------
 4 files changed, 49 insertions(+), 39 deletions(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index 2dd004d312..48dc70b8fc 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -595,7 +595,8 @@ python create_symlinks() {
     taskname = d.getVar("BB_CURRENTTASK")
     subimages = (d.getVarFlag("do_" + taskname, 'subimages', False) or "").split()
 
-    if not link_name:
+    if not link_name or link_name == img_name:
+        bb.note("Not creating versioned hardlinks, because IMAGE_LINK_NAME is empty or identical to IMAGE_NAME")
         return
     for type in subimages:
         dst = os.path.join(deploy_dir, link_name + "." + type)
diff --git a/meta/classes-recipe/kernel-devicetree.bbclass b/meta/classes-recipe/kernel-devicetree.bbclass
index cbfaa5c183..1fde90f023 100644
--- a/meta/classes-recipe/kernel-devicetree.bbclass
+++ b/meta/classes-recipe/kernel-devicetree.bbclass
@@ -127,22 +127,24 @@ kernel_do_deploy:append() {
 	done
 }
 kernel_do_deploy_links:append() {
-	for dtbf in ${KERNEL_DEVICETREE}; do
-		dtb=`normalize_dtb "$dtbf"`
-		dtb_ext=${dtb##*.}
-		dtb_base_name=`basename $dtb .$dtb_ext`
-		if [ -n "${KERNEL_DTB_LINK_NAME}" ] ; then
+	if [ -z "${KERNEL_DTB_LINK_NAME}" -o "${KERNEL_DTB_LINK_NAME}" = "${KERNEL_DTB_NAME}" ] ; then
+		bbnote "Not creating versioned hardlinks, because KERNEL_DTB_LINK_NAME is empty or identical to KERNEL_DTB_NAME"
+	else
+		for dtbf in ${KERNEL_DEVICETREE}; do
+			dtb=`normalize_dtb "$dtbf"`
+			dtb_ext=${dtb##*.}
+			dtb_base_name=`basename $dtb .$dtb_ext`
 			ln -vf $deployDir/$dtb_base_name.$dtb_ext $deployDir/$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext
-		fi
-		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
-			if [ "$type" = "zImage" ] && [ "${KERNEL_DEVICETREE_BUNDLE}" = "1" ] && [ -n "${KERNEL_DTB_LINK_NAME}" ]; then
-				ln -vf $deployDir/$type-$dtb_base_name.$dtb_ext${KERNEL_DTB_BIN_EXT} \
-					$deployDir/$type-$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext${KERNEL_DTB_BIN_EXT}
-				if [ -e "${KERNEL_OUTPUT_DIR}/${type}.initramfs" ]; then
-					ln -vf $deployDir/${type}-${INITRAMFS_NAME}-$dtb_base_name.$dtb_ext${KERNEL_DTB_BIN_EXT} \
-						$deployDir/${type}-${INITRAMFS_NAME}-$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext${KERNEL_DTB_BIN_EXT}
+			for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
+				if [ "$type" = "zImage" ] && [ "${KERNEL_DEVICETREE_BUNDLE}" = "1" ] ; then
+					ln -vf $deployDir/$type-$dtb_base_name.$dtb_ext${KERNEL_DTB_BIN_EXT} \
+						$deployDir/$type-$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext${KERNEL_DTB_BIN_EXT}
+					if [ -e "${KERNEL_OUTPUT_DIR}/${type}.initramfs" ]; then
+						ln -vf $deployDir/${type}-${INITRAMFS_NAME}-$dtb_base_name.$dtb_ext${KERNEL_DTB_BIN_EXT} \
+							$deployDir/${type}-${INITRAMFS_NAME}-$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext${KERNEL_DTB_BIN_EXT}
+					fi
 				fi
-			fi
+			done
 		done
-	done
+	fi
 }
diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index 0ad200d9db..50d89a4383 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -860,22 +860,17 @@ kernel_do_deploy:append() {
 }
 kernel_do_deploy_links:append() {
 	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
-		if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
-			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
+		if [ -z "${KERNEL_FIT_LINK_NAME}" -o "${KERNEL_FIT_LINK_NAME}" = "${KERNEL_FIT_NAME}" ] ; then
+			bbnote "Not creating versioned hardlinks, because KERNEL_FIT_LINK_NAME is empty or identical to KERNEL_FIT_NAME"
+		else
+			if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
 				ln -vf $deployDir/fitImage-its-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${KERNEL_FIT_LINK_NAME}"
-			fi
-			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
 				ln -vf $deployDir/fitImage-linux.bin-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT} "$deployDir/fitImage-linux.bin-${KERNEL_FIT_LINK_NAME}"
 			fi
-		fi
 
-		if [ -n "${INITRAMFS_IMAGE}" ]; then
-			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
+			if [ -n "${INITRAMFS_IMAGE}" ]; then
 				ln -vf $deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
-			fi
-
-			if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
-				if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
+				if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
 					ln -vf $deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
 				fi
 			fi
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index db289d776f..7963b6cc17 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -855,21 +855,33 @@ kernel_do_deploy_links() {
 		mkdir "$deployDir"
 	fi
 
-	for imageType in ${KERNEL_IMAGETYPES} ; do
-		ln -vf $deployDir/$imageType-${KERNEL_IMAGE_NAME}.bin $deployDir/$imageType-${KERNEL_IMAGE_LINK_NAME}${KERNEL_IMAGE_BIN_EXT}
-	done
+	if [ -z "${KERNEL_IMAGE_LINK_NAME}" -o "${KERNEL_IMAGE_LINK_NAME}" = "${KERNEL_IMAGE_NAME}" ] ; then
+		bbnote "Not creating versioned hardlinks for kernel images, because KERNEL_IMAGE_LINK_NAME is empty or identical to KERNEL_IMAGE_NAME"
+	else
+		for imageType in ${KERNEL_IMAGETYPES} ; do
+			ln -vf $deployDir/$imageType-${KERNEL_IMAGE_NAME}.bin $deployDir/$imageType-${KERNEL_IMAGE_LINK_NAME}${KERNEL_IMAGE_BIN_EXT}
+		done
+	fi
 
-	if [ ${MODULE_TARBALL_DEPLOY} = "1" -a -f $deployDir/modules-${MODULE_TARBALL_NAME}.tgz ] ; then
-		ln -vf $deployDir/modules-${MODULE_TARBALL_NAME}.tgz $deployDir/modules-${MODULE_TARBALL_LINK_NAME}.tgz
+	if [ -z "${MODULE_TARBALL_LINK_NAME}" -o "${MODULE_TARBALL_LINK_NAME}" = "${MODULE_TARBALL_NAME}" ] ; then
+		bbnote "Not creating versioned hardlinks for module tarball, because MODULE_TARBALL_LINK_NAME is empty or identical to MODULE_TARBALL_NAME"
+	else
+		if [ ${MODULE_TARBALL_DEPLOY} = "1" -a -f $deployDir/modules-${MODULE_TARBALL_NAME}.tgz ] ; then
+			ln -vf $deployDir/modules-${MODULE_TARBALL_NAME}.tgz $deployDir/modules-${MODULE_TARBALL_LINK_NAME}.tgz
+		fi
 	fi
 
-	if [ ! -z "${INITRAMFS_IMAGE}" -a "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
-		for imageType in ${KERNEL_IMAGETYPES} ; do
-			if [ "$imageType" = "fitImage" ] ; then
-				continue
-			fi
-			ln -vf $deployDir/$imageType-${INITRAMFS_NAME}.bin $deployDir/$imageType-${INITRAMFS_LINK_NAME}${KERNEL_IMAGE_BIN_EXT}
-		done
+	if [ -z "${INITRAMFS_LINK_NAME}" -o "${INITRAMFS_LINK_NAME}" = "${INITRAMFS_NAME}" ] ; then
+		bbnote "Not creating versioned hardlinks for initramfs image, because INITRAMFS_LINK_NAME is empty"
+	else
+		if [ ! -z "${INITRAMFS_IMAGE}" -a "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
+			for imageType in ${KERNEL_IMAGETYPES} ; do
+				if [ "$imageType" = "fitImage" ] ; then
+					continue
+				fi
+				ln -vf $deployDir/$imageType-${INITRAMFS_NAME}.bin $deployDir/$imageType-${INITRAMFS_LINK_NAME}${KERNEL_IMAGE_BIN_EXT}
+			done
+		fi
 	fi
 }
 do_deploy_links[prefuncs] += "read_subpackage_metadata"
-- 
2.43.0


