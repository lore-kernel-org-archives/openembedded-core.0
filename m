Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37850C61D9B
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 12:45:18 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.18518.1700657110939866611
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 04:45:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QdTgDUC9;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-507adc3381cso8776558e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 04:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700657109; x=1701261909; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AaIWlj/kH04lhyF/rK9+F7zPEE7qOwCYMrLmeUFyI6c=;
        b=QdTgDUC91Q366XeSCDFUSGcRlgpq+kfvDlpNOQ+pPxfHyjiYz5tBSxMXL3/cz+AnmA
         JKou363T4ziFiux1eUJkmjSasDQ1JE/X/PBZ8R9L+O2oR7eX4PojO5FF5rKPZRmATs3x
         7HJ7Rkm0ZZfcK2VOAkJUnhwTIuRu5Z3MhfUzd6gX9V73uUMZQgNcksfNLi7HVvsj27WF
         yPh1j8MqC3ngDVjFzNTWP27cjU9OawKbZXotovdsBZrwv0590zAtyqFnwZ+PN4rIXs0e
         jxAIj/gePetEsR59onoybP4Ai/zPzsGV0vfJmgQSUb1M+FzPIROj5QT4lDmVqTk0rELz
         b0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700657109; x=1701261909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AaIWlj/kH04lhyF/rK9+F7zPEE7qOwCYMrLmeUFyI6c=;
        b=DGO3EF57RN//nImCiTC7rMhv5hlOwjTrg8Enr9KE9wVuiR2KI8IZIwrvFOldjptT8C
         LDRMfxStczduE9kgP45mZjUh/EnNzE6fgqa21y6SQeMowcpRqZ1vB+/N8rqvyJqN7BUk
         D2xt0xXf19ZO/HDpvCbCK/eimDXweke06i2MOEMfu+5zy8VF5/3EYvJNt2sWC7/7pDIy
         VgpV+dS92g6cYfFy5aAdm+8RaCFBTd2BbxBTuOgLCHpYEi/aO0cpzSsu1k5gO8ag2h0m
         2mnwz2e/NLVk6pw9TASgl7j5odZnMuAjgzYdj7zYhiRNSaj7tWXWWZFdwJw1xjrKTFBw
         2Haw==
X-Gm-Message-State: AOJu0Ywy3IxV9dDIgtvwOsDs2ghxr+l9t4Nvxw1NhaXNgwrln4VKCuO7
	GV1lza0qcnQftW4Q5jOI8Nx2aOO/EAc=
X-Google-Smtp-Source: AGHT+IE7rwHqv/4xhLnPBVm7fY4vN2I2iO9qdDV5178wnhFHMmlmqb20J7FKUD1t/7/FF8C/xAn8Fw==
X-Received: by 2002:a19:a418:0:b0:502:9fce:b6da with SMTP id q24-20020a19a418000000b005029fceb6damr1433063lfc.21.1700657108840;
        Wed, 22 Nov 2023 04:45:08 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id x15-20020a170906710f00b009bd9ac83a9fsm6523560ejj.152.2023.11.22.04.45.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 04:45:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/21] image*.bbclass, kernel*.bbclass: create version-less artifacts and versioned hard links
Date: Wed, 22 Nov 2023 13:44:31 +0100
Message-ID: <932d980fb4fcfd3b78183d5bd51adb4f038eee47.1700600804.git.martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1700600804.git.martin.jansa@gmail.com>
References: <cover.1700600804.git.martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 12:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191078

From: Martin Jansa <Martin.Jansa@gmail.com>

* instead of versioned artifacts and version-less symlinks

* We used to create the actual artifact files with some version
  in the filename and then created symlink without any version
  which was updated to point to the latest one created.
  In some scenarios it's useful to create all artifacts - typically
  rootfs and kernel images with the same version - like release
  build even when the kernel itself wasn't modified since the
  previous release.

  If we include the release version in the regular _NAME variables
  then we'll need to re-run do_deploy and do_image which will cause
  kernel to be rebuilt and image to be re-created even when the
  only change since last build was the version number.

  With this change we can re-use kernel and image from sstate when
  nothing was changed and run only very fast do_deploy_links task
  which just adds another hard link to existing artifact from
  sstate.

* This is already used by various LGE builds as do_webos_deploy_fixup()
  https://github.com/webosose/meta-webosose/blob/master/meta-webos/classes/webos_deploy.bbclass
  but injecting this task in all the right places is difficult
  and sometimes requires whole bbclass to be duplicated. Having
  simpler way of versioning artifacts directly in oe-core might
  be useful for others.

* move IMAGE_VERSION_SUFFIX from _NAME variables to _LINK_NAME
  that way e.g. kernel.do_deploy can be reused from sstate to
  provide "version-less" artifacts and then very fast
  do_deploy_links task just adds links with consistent suffixes
  (by default the version from the recipe but could be easily set
  to e.g. some release name when building some products).
* create hard links instead of symlinks, so that whatever version
  the filename says is really there
* some IMAGE_FSTYPES might need the "version-less" IMAGE_NAME file
  to be removed first or they might either append or update the
  content of the image instead of creating new image file from
  scratch - I have seen this only with one proprietary format we
  generate with our own tool, so hopefully this isn't very common
* this is basically the mechanism are using in webOS with
  WEBOS_IMAGE_NAME_SUFFIX which is for official builds set from
  jenkins job and then all artifacts (images as well as corresponding
  kernel files) have the same version string)

* without this, you can still easily set the variables to contain
  the version from jenkins job (excluded from sstate signature like
  DATETIME currently is to prevent rebuilding it everytime even when
  the content didn't change) but then when kernel is reused from sstate
  you can have version 1.0 used on kernel artifacts and 2.0 on image
  artifacts.

* if you don't exclude the version string with vardepsexclude, then
  you get the right version in the filenames but for cost of
  re-executing do_deploy every single time, which with rm_work will
  cause all kernel tasks to be re-executed (together with everything
  which depends on it like external modules etc).

* the implementation "from outside" is a bit tricky as shown in webOS
  OSE, because first you need to reverse the meaning of IMAGE_NAME
  and IMAGE_LINK_NAME like here, but also replace all symlinks with
  hardlinks and then adjust all recipes/bbclasses to depend on our
  do_deploy_fixup task instead of the original do_deploy
  see the variable modifications:
  https://github.com/webosose/meta-webosose/blob/a35e81622aae1066591e44a132d01297ff478248/meta-webos/conf/distro/include/webos.inc#L65
  and then various bbclasses to hook do_webos_deploy_fixup task creating
  the hardlinks for possible artifacts:
  https://github.com/webosose/meta-webosose/blob/a35e81622aae1066591e44a132d01297ff478248/meta-webos/classes/webos_deploy.bbclass
  https://github.com/webosose/meta-webosose/blob/a35e81622aae1066591e44a132d01297ff478248/meta-webos/classes/kernel.bbclass
  https://github.com/webosose/meta-webosose/blob/a35e81622aae1066591e44a132d01297ff478248/meta-webos/classes/image.bbclass
  so hopefully with all these changes in oe-core other project can
  achieve the same just by setting one variable IMAGE_VERSION_SUFFIX

* drop ${PKGE}-${PKGV}-${PR} from kernel artifacts names (this is the
  latest build) and add it only in hardlinks created in do_deploy_links
  so that we can use PKGR there again (because these links are generally
  used only by human operators and they don't have their own TASKHASH or
  the IMAGE_VERSION_SUFFIX might be set to some release name which they
  do understand

* this allows to drop package_get_auto_pr from kernel do_deploy as well,
  leaving only 2 EXTENDPRAUTO bumps for each kernel build (do_package
  and do_deploy_links, unfortunatelly these will still have different
  value, so if you're looking for the exact kernel image in deploy
  directory based on kernel image package version seen on the device the
  EXTENDPRAUTO part of PR will be different).

[YOCTO #12937]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../image-artifact-names.bbclass              |  8 ++--
 meta/classes-recipe/image.bbclass             | 12 ++---
 .../kernel-artifact-names.bbclass             |  6 ++-
 meta/classes-recipe/kernel-devicetree.bbclass | 35 +++++++++-----
 meta/classes-recipe/kernel-fitimage.bbclass   | 33 ++++++++-----
 meta/classes-recipe/kernel.bbclass            | 47 ++++++++++++-------
 meta/classes-recipe/qemuboot.bbclass          |  2 +-
 .../rootfs-postcommands.bbclass               |  4 +-
 meta/classes/cve-check.bbclass                | 14 +++---
 meta/lib/oe/cve_check.py                      |  6 +--
 10 files changed, 100 insertions(+), 67 deletions(-)

diff --git a/meta/classes-recipe/image-artifact-names.bbclass b/meta/classes-recipe/image-artifact-names.bbclass
index bc76ff0e16..d0f1b0dc55 100644
--- a/meta/classes-recipe/image-artifact-names.bbclass
+++ b/meta/classes-recipe/image-artifact-names.bbclass
@@ -9,12 +9,12 @@
 ##################################################################
 
 IMAGE_BASENAME ?= "${PN}"
-IMAGE_VERSION_SUFFIX ?= "-${DATETIME}"
+IMAGE_VERSION_SUFFIX ?= "-${PKGE}-${PKGV}-${PKGR}-${DATETIME}"
 IMAGE_VERSION_SUFFIX[vardepsexclude] += "DATETIME SOURCE_DATE_EPOCH"
-IMAGE_NAME ?= "${IMAGE_LINK_NAME}${IMAGE_VERSION_SUFFIX}"
-IMAGE_LINK_NAME ?= "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}${IMAGE_NAME_SUFFIX}"
+IMAGE_NAME ?= "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}${IMAGE_NAME_SUFFIX}"
+IMAGE_LINK_NAME ?= "${IMAGE_NAME}${IMAGE_VERSION_SUFFIX}"
 
-# This needs to stay in sync with IMAGE_LINK_NAME, but with INITRAMFS_IMAGE instead of IMAGE_BASENAME
+# This needs to stay in sync with IMAGE_NAME, but with INITRAMFS_IMAGE instead of IMAGE_BASENAME
 # and without ${IMAGE_NAME_SUFFIX} which all initramfs images should set to empty
 INITRAMFS_IMAGE_NAME ?= "${@['${INITRAMFS_IMAGE}${IMAGE_MACHINE_SUFFIX}', ''][d.getVar('INITRAMFS_IMAGE') == '']}"
 
diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index 7231fad940..2dd004d312 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -141,7 +141,7 @@ do_rootfs[vardeps] += "${@rootfs_variables(d)}"
 # This follows many common usecases and user expectations.
 # But if you are building an image which doesn't need the kernel image at all,
 # you can unset this variable manually.
-KERNEL_DEPLOY_DEPEND ?= "virtual/kernel:do_deploy"
+KERNEL_DEPLOY_DEPEND ?= "virtual/kernel:do_deploy_links"
 do_build[depends] += "${KERNEL_DEPLOY_DEPEND}"
 
 
@@ -599,14 +599,14 @@ python create_symlinks() {
         return
     for type in subimages:
         dst = os.path.join(deploy_dir, link_name + "." + type)
-        src = img_name + "." + type
-        if os.path.exists(os.path.join(deploy_dir, src)):
-            bb.note("Creating symlink: %s -> %s" % (dst, src))
+        src = os.path.join(deploy_dir, img_name + "." + type)
+        if os.path.exists(src):
+            bb.note("Creating hardlink: %s -> %s" % (dst, src))
             if os.path.islink(dst):
                 os.remove(dst)
-            os.symlink(src, dst)
+            os.link(src, dst)
         else:
-            bb.note("Skipping symlink, source does not exist: %s -> %s" % (dst, src))
+            bb.note("Skipping hardlink, source does not exist: %s -> %s" % (dst, src))
 }
 
 MULTILIBRE_ALLOW_REP =. "${base_bindir}|${base_sbindir}|${bindir}|${sbindir}|${libexecdir}|${sysconfdir}|${nonarch_base_libdir}/udev|/lib/modules/[^/]*/modules.*|"
diff --git a/meta/classes-recipe/kernel-artifact-names.bbclass b/meta/classes-recipe/kernel-artifact-names.bbclass
index 1a7611a15e..186c6bc5b9 100644
--- a/meta/classes-recipe/kernel-artifact-names.bbclass
+++ b/meta/classes-recipe/kernel-artifact-names.bbclass
@@ -12,8 +12,10 @@
 
 inherit image-artifact-names
 
-KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}${IMAGE_MACHINE_SUFFIX}${IMAGE_VERSION_SUFFIX}"
-KERNEL_ARTIFACT_LINK_NAME ?= "${MACHINE}"
+KERNEL_VERSION_SUFFIX ?= "${IMAGE_VERSION_SUFFIX}"
+
+KERNEL_ARTIFACT_NAME ?= "${MACHINE}"
+KERNEL_ARTIFACT_LINK_NAME ?= "${KERNEL_ARTIFACT_NAME}${KERNEL_VERSION_SUFFIX}"
 KERNEL_ARTIFACT_BIN_EXT ?= ".bin"
 
 KERNEL_IMAGE_NAME ?= "${KERNEL_ARTIFACT_NAME}"
diff --git a/meta/classes-recipe/kernel-devicetree.bbclass b/meta/classes-recipe/kernel-devicetree.bbclass
index eff052b402..cbfaa5c183 100644
--- a/meta/classes-recipe/kernel-devicetree.bbclass
+++ b/meta/classes-recipe/kernel-devicetree.bbclass
@@ -91,7 +91,7 @@ do_install:append() {
 	done
 }
 
-do_deploy:append() {
+kernel_do_deploy:append() {
 	for dtbf in ${KERNEL_DEVICETREE}; do
 		dtb=`normalize_dtb "$dtbf"`
 		dtb_ext=${dtb##*.}
@@ -102,10 +102,7 @@ do_deploy:append() {
 		fi
 		install -m 0644 ${D}/${KERNEL_DTBDEST}/$dtb $deployDir/$dtb_base_name.$dtb_ext
 		if [ -n "${KERNEL_DTB_NAME}" ] ; then
-			ln -sf $dtb_base_name.$dtb_ext $deployDir/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext
-		fi
-		if [ -n "${KERNEL_DTB_LINK_NAME}" ] ; then
-			ln -sf $dtb_base_name.$dtb_ext $deployDir/$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext
+			ln -vf $deployDir/$dtb_base_name.$dtb_ext $deployDir/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext
 		fi
 		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
 			if [ "$type" = "zImage" ] && [ "${KERNEL_DEVICETREE_BUNDLE}" = "1" ]; then
@@ -116,10 +113,6 @@ do_deploy:append() {
 					ln -sf $type-$dtb_base_name.$dtb_ext${KERNEL_DTB_BIN_EXT} \
 						$deployDir/$type-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext${KERNEL_DTB_BIN_EXT}
 				fi
-				if [ -n "${KERNEL_DTB_LINK_NAME}" ]; then
-					ln -sf $type-$dtb_base_name.$dtb_ext${KERNEL_DTB_BIN_EXT} \
-						$deployDir/$type-$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext${KERNEL_DTB_BIN_EXT}
-				fi
 				if [ -e "${KERNEL_OUTPUT_DIR}/${type}.initramfs" ]; then
 					cat ${KERNEL_OUTPUT_DIR}/${type}.initramfs \
 						$deployDir/$dtb_base_name.$dtb_ext \
@@ -128,10 +121,26 @@ do_deploy:append() {
 						ln -sf ${type}-${INITRAMFS_NAME}-$dtb_base_name.$dtb_ext${KERNEL_DTB_BIN_EXT} \
 							$deployDir/${type}-${INITRAMFS_NAME}-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext${KERNEL_DTB_BIN_EXT}
 					fi
-					if [ -n "${KERNEL_DTB_LINK_NAME}" ]; then
-						ln -sf ${type}-${INITRAMFS_NAME}-$dtb_base_name.$dtb_ext${KERNEL_DTB_BIN_EXT} \
-							$deployDir/${type}-${INITRAMFS_NAME}-$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext${KERNEL_DTB_BIN_EXT}
-					fi
+				fi
+			fi
+		done
+	done
+}
+kernel_do_deploy_links:append() {
+	for dtbf in ${KERNEL_DEVICETREE}; do
+		dtb=`normalize_dtb "$dtbf"`
+		dtb_ext=${dtb##*.}
+		dtb_base_name=`basename $dtb .$dtb_ext`
+		if [ -n "${KERNEL_DTB_LINK_NAME}" ] ; then
+			ln -vf $deployDir/$dtb_base_name.$dtb_ext $deployDir/$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext
+		fi
+		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
+			if [ "$type" = "zImage" ] && [ "${KERNEL_DEVICETREE_BUNDLE}" = "1" ] && [ -n "${KERNEL_DTB_LINK_NAME}" ]; then
+				ln -vf $deployDir/$type-$dtb_base_name.$dtb_ext${KERNEL_DTB_BIN_EXT} \
+					$deployDir/$type-$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext${KERNEL_DTB_BIN_EXT}
+				if [ -e "${KERNEL_OUTPUT_DIR}/${type}.initramfs" ]; then
+					ln -vf $deployDir/${type}-${INITRAMFS_NAME}-$dtb_base_name.$dtb_ext${KERNEL_DTB_BIN_EXT} \
+						$deployDir/${type}-${INITRAMFS_NAME}-$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext${KERNEL_DTB_BIN_EXT}
 				fi
 			fi
 		done
diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index 7e30a5d47e..0ad200d9db 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -837,7 +837,6 @@ do_kernel_generate_rsa_keys() {
 
 addtask kernel_generate_rsa_keys before do_assemble_fitimage after do_compile
 
-kernel_do_deploy[vardepsexclude] = "DATETIME"
 kernel_do_deploy:append() {
 	# Update deploy directory
 	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
@@ -845,29 +844,39 @@ kernel_do_deploy:append() {
 		if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
 			bbnote "Copying fit-image.its source file..."
 			install -m 0644 ${B}/fit-image.its "$deployDir/fitImage-its-${KERNEL_FIT_NAME}.its"
-			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
-				ln -snf fitImage-its-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${KERNEL_FIT_LINK_NAME}"
-			fi
-
 			bbnote "Copying linux.bin file..."
 			install -m 0644 ${B}/linux.bin $deployDir/fitImage-linux.bin-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}
-			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
-				ln -snf fitImage-linux.bin-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT} "$deployDir/fitImage-linux.bin-${KERNEL_FIT_LINK_NAME}"
-			fi
 		fi
 
 		if [ -n "${INITRAMFS_IMAGE}" ]; then
 			bbnote "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
 			install -m 0644 ${B}/fit-image-${INITRAMFS_IMAGE}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its"
+			if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
+				bbnote "Copying fitImage-${INITRAMFS_IMAGE} file..."
+				install -m 0644 ${B}/${KERNEL_OUTPUT_DIR}/fitImage-${INITRAMFS_IMAGE} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}"
+			fi
+		fi
+	fi
+}
+kernel_do_deploy_links:append() {
+	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
+		if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
+			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
+				ln -vf $deployDir/fitImage-its-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${KERNEL_FIT_LINK_NAME}"
+			fi
 			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
-				ln -snf fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
+				ln -vf $deployDir/fitImage-linux.bin-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT} "$deployDir/fitImage-linux.bin-${KERNEL_FIT_LINK_NAME}"
+			fi
+		fi
+
+		if [ -n "${INITRAMFS_IMAGE}" ]; then
+			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
+				ln -vf $deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
 			fi
 
 			if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
-				bbnote "Copying fitImage-${INITRAMFS_IMAGE} file..."
-				install -m 0644 ${B}/${KERNEL_OUTPUT_DIR}/fitImage-${INITRAMFS_IMAGE} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}"
 				if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
-					ln -snf fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
+					ln -vf $deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
 				fi
 			fi
 		fi
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 9ff37f5c38..db289d776f 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -820,9 +820,6 @@ kernel_do_deploy() {
 		else
 			install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType $deployDir/$baseName${KERNEL_IMAGE_BIN_EXT}
 		fi
-		if [ -n "${KERNEL_IMAGE_LINK_NAME}" ] ; then
-			ln -sf $baseName${KERNEL_IMAGE_BIN_EXT} $deployDir/$imageType-${KERNEL_IMAGE_LINK_NAME}${KERNEL_IMAGE_BIN_EXT}
-		fi
 		if [ "${KERNEL_IMAGETYPE_SYMLINK}" = "1" ] ; then
 			ln -sf $baseName${KERNEL_IMAGE_BIN_EXT} $deployDir/$imageType
 		fi
@@ -837,10 +834,6 @@ kernel_do_deploy() {
 		fi
 		TAR_ARGS="$TAR_ARGS --owner=0 --group=0"
 		tar $TAR_ARGS -cv -C ${D}${root_prefix} lib | gzip -9n > $deployDir/modules-${MODULE_TARBALL_NAME}.tgz
-
-		if [ -n "${MODULE_TARBALL_LINK_NAME}" ] ; then
-			ln -sf modules-${MODULE_TARBALL_NAME}.tgz $deployDir/modules-${MODULE_TARBALL_LINK_NAME}.tgz
-		fi
 	fi
 
 	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
@@ -848,22 +841,42 @@ kernel_do_deploy() {
 			if [ "$imageType" = "fitImage" ] ; then
 				continue
 			fi
-			initramfsBaseName=$imageType-${INITRAMFS_NAME}
-			install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType.initramfs $deployDir/$initramfsBaseName${KERNEL_IMAGE_BIN_EXT}
-			if [ -n "${INITRAMFS_LINK_NAME}" ] ; then
-				ln -sf $initramfsBaseName${KERNEL_IMAGE_BIN_EXT} $deployDir/$imageType-${INITRAMFS_LINK_NAME}${KERNEL_IMAGE_BIN_EXT}
-			fi
+			install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType.initramfs $deployDir/$imageType-${INITRAMFS_NAME}${KERNEL_IMAGE_BIN_EXT}
 		done
 	fi
 }
 
-# We deploy to filenames that include PKGV and PKGR, read the saved data to
-# ensure we get the right values for both
-do_deploy[prefuncs] += "read_subpackage_metadata"
-
 addtask deploy after do_populate_sysroot do_packagedata
 
-EXPORT_FUNCTIONS do_deploy
+kernel_do_deploy_links() {
+	deployDir="${DEPLOY_DIR_IMAGE}"
+	if [ -n "${KERNEL_DEPLOYSUBDIR}" ]; then
+		deployDir="${DEPLOY_DIR_IMAGE}/${KERNEL_DEPLOYSUBDIR}"
+		mkdir "$deployDir"
+	fi
+
+	for imageType in ${KERNEL_IMAGETYPES} ; do
+		ln -vf $deployDir/$imageType-${KERNEL_IMAGE_NAME}.bin $deployDir/$imageType-${KERNEL_IMAGE_LINK_NAME}${KERNEL_IMAGE_BIN_EXT}
+	done
+
+	if [ ${MODULE_TARBALL_DEPLOY} = "1" -a -f $deployDir/modules-${MODULE_TARBALL_NAME}.tgz ] ; then
+		ln -vf $deployDir/modules-${MODULE_TARBALL_NAME}.tgz $deployDir/modules-${MODULE_TARBALL_LINK_NAME}.tgz
+	fi
+
+	if [ ! -z "${INITRAMFS_IMAGE}" -a "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
+		for imageType in ${KERNEL_IMAGETYPES} ; do
+			if [ "$imageType" = "fitImage" ] ; then
+				continue
+			fi
+			ln -vf $deployDir/$imageType-${INITRAMFS_NAME}.bin $deployDir/$imageType-${INITRAMFS_LINK_NAME}${KERNEL_IMAGE_BIN_EXT}
+		done
+	fi
+}
+do_deploy_links[prefuncs] += "read_subpackage_metadata"
+
+addtask deploy_links after do_deploy before do_build
+
+EXPORT_FUNCTIONS do_deploy do_deploy_links
 
 # Add using Device Tree support
 inherit kernel-devicetree
diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/qemuboot.bbclass
index ff32aac902..0ee4008a65 100644
--- a/meta/classes-recipe/qemuboot.bbclass
+++ b/meta/classes-recipe/qemuboot.bbclass
@@ -178,5 +178,5 @@ python do_write_qemuboot_conf() {
     if qemuboot_link and qemuboot_link != qemuboot:
         if os.path.lexists(qemuboot_link):
            os.remove(qemuboot_link)
-        os.symlink(os.path.basename(qemuboot), qemuboot_link)
+        os.link(qemuboot, qemuboot_link)
 }
diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index 29ee74932a..a8173c32bc 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -396,7 +396,7 @@ python write_image_manifest () {
         if manifest_link != manifest_name:
             if os.path.lexists(manifest_link):
                 os.remove(manifest_link)
-            os.symlink(os.path.basename(manifest_name), manifest_link)
+            os.link(manifest_name, manifest_link)
 }
 
 # Can be used to create /etc/timestamp during image construction to give a reasonably
@@ -469,7 +469,7 @@ python write_image_test_data() {
         if testdata_link != testdata_name:
             if os.path.lexists(testdata_link):
                 os.remove(testdata_link)
-            os.symlink(os.path.basename(testdata_name), testdata_link)
+            os.link(testdata_name, testdata_link)
 }
 write_image_test_data[vardepsexclude] += "TOPDIR"
 
diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 5191d04303..b87d565755 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -125,7 +125,7 @@ python () {
 def generate_json_report(d, out_path, link_path):
     if os.path.exists(d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")):
         import json
-        from oe.cve_check import cve_check_merge_jsons, update_symlinks
+        from oe.cve_check import cve_check_merge_jsons, update_links
 
         bb.note("Generating JSON CVE summary")
         index_file = d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")
@@ -143,12 +143,12 @@ def generate_json_report(d, out_path, link_path):
         with open(out_path, "w") as f:
             json.dump(summary, f, indent=2)
 
-        update_symlinks(out_path, link_path)
+        update_links(out_path, link_path)
 
 python cve_save_summary_handler () {
     import shutil
     import datetime
-    from oe.cve_check import update_symlinks
+    from oe.cve_check import update_links
 
     cve_tmp_file = d.getVar("CVE_CHECK_TMP_FILE")
 
@@ -162,7 +162,7 @@ python cve_save_summary_handler () {
     if os.path.exists(cve_tmp_file):
         shutil.copyfile(cve_tmp_file, cve_summary_file)
         cvefile_link = os.path.join(cvelogpath, cve_summary_name)
-        update_symlinks(cve_summary_file, cvefile_link)
+        update_links(cve_summary_file, cvefile_link)
         bb.plain("Complete CVE report summary created at: %s" % cvefile_link)
 
     if d.getVar("CVE_CHECK_FORMAT_JSON") == "1":
@@ -219,7 +219,7 @@ python cve_check_write_rootfs_manifest () {
     import shutil
     import json
     from oe.rootfs import image_list_installed_packages
-    from oe.cve_check import cve_check_merge_jsons, update_symlinks
+    from oe.cve_check import cve_check_merge_jsons, update_links
 
     if d.getVar("CVE_CHECK_COPY_FILES") == "1":
         deploy_file = d.getVar("CVE_CHECK_RECIPE_FILE")
@@ -274,7 +274,7 @@ python cve_check_write_rootfs_manifest () {
         with open(manifest_name, "w") as f:
             f.write(text_data)
 
-        update_symlinks(manifest_name, link_path)
+        update_links(manifest_name, link_path)
         bb.plain("Image CVE report stored in: %s" % manifest_name)
 
     if enable_json:
@@ -284,7 +284,7 @@ python cve_check_write_rootfs_manifest () {
         with open(manifest_name, "w") as f:
             json.dump(json_data, f, indent=2)
 
-        update_symlinks(manifest_name, link_path)
+        update_links(manifest_name, link_path)
         bb.plain("Image CVE JSON report stored in: %s" % manifest_name)
 }
 
diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index 3fa77bf9a7..0e56589a03 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -178,15 +178,15 @@ def cve_check_merge_jsons(output, data):
 
     output["package"].append(data["package"][0])
 
-def update_symlinks(target_path, link_path):
+def update_links(target_path, link_path):
     """
-    Update a symbolic link link_path to point to target_path.
+    Update a link link_path to point to target_path.
     Remove the link and recreate it if exist and is different.
     """
     if link_path != target_path and os.path.exists(target_path):
         if os.path.exists(os.path.realpath(link_path)):
             os.remove(link_path)
-        os.symlink(os.path.basename(target_path), link_path)
+        os.link(target_path, link_path)
 
 
 def convert_cve_version(version):
-- 
2.43.0


