Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E07AEC3DA7F
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 21:15:07 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.57873.1723497303486849460
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 14:15:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=njQjrcw2;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52efdf02d13so8162311e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 14:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723497301; x=1724102101; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gM/2royk0+DJpgWF11nXfcfYnBj/DcoSqF4xiIBxJEI=;
        b=njQjrcw2hO/NCjSAiEE8pAZHEZGfE9R/Pvhffg7LYpOMn4WqkR1G1ybKopFPKuv232
         jNaMpMmhKhwfPyGSHCfq+utBD+a3hnbvVgCH/bFEwXQeCF1cJxa6biwBIWlWDc+qqQJg
         KiP0cfNFWcDwok5REX+9lJHBnG9VsMhlwUvB4TqRUebT+44T7CBJbvDjnTEsNvSwLBdJ
         FhvapnfApxtaOyIwqQ/GD+KLAyyhn1YKbo4TO0hJSowlTi/qNVUrGwv7x+wL6UrKnPjk
         3nJrMWTZkilp2myt6naIiifWtfEroHmcSSvaE4g5fTBrBrbIGj7m2X/V5SRDMZgLEmtb
         c5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723497301; x=1724102101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gM/2royk0+DJpgWF11nXfcfYnBj/DcoSqF4xiIBxJEI=;
        b=osgWCC0XzXy65O0s7uyfoe/ixvnV12l2HyX48k7Rp/aOmUBVPpdUPdijZp1BsAXEB7
         QF+hC0scsi3/Q/KFJvIaZietlkfvQAucG+VUDQmAQ4vHWyZ7ZlNYy0XxqkrktEHVnyhc
         MtIJg6FWMEpOEXqh7wniV3n9i9D7DlgE+J//tF+DFO91dBbhrMO+hF/eFdalelHifeYs
         qNTzp4Zt0YG1n8XcaXUMU6oshxlSCHYztz5hnqAjMkIlcantjEmglAQEmtF9Ltx6Dis5
         eUWCsbLbOanBIGghCPiIPJFTg7tpKRdvIZEXqBk71qGaAxkpnnQh6kdeMUrGQ3yp5F6R
         YyXw==
X-Gm-Message-State: AOJu0Yxo/Ox2v4uBGv09Moj0RqvQSTW+VmJHEJ+LagpDeh+YKUi3ni17
	PGyDlBMiT8NIhKfK4EeVhgXQFqbF045kmmWTKqepx+4nohe47PtVHuFSUA==
X-Google-Smtp-Source: AGHT+IFpukN/OLjDXXf52ObVo9n8sgPQicV2bzJW6Tc+QKykOEsiLzcACO32viOKPzDpsMMDg0qxDA==
X-Received: by 2002:a05:6512:230c:b0:52c:dd94:bda9 with SMTP id 2adb3069b0e04-53213692e16mr1021657e87.56.1723497300965;
        Mon, 12 Aug 2024 14:15:00 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f3fb069dsm10828366b.80.2024.08.12.14.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 14:15:00 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 3/4] kernel: refactor fitimage
Date: Mon, 12 Aug 2024 23:12:56 +0200
Message-ID: <20240812211437.2736977-4-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240812211437.2736977-1-adrian.freihofer@gmail.com>
References: <20240812211437.2736977-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 21:15:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203238

From: Adrian Freihofer <adrian.freihofer@siemens.com>

* do_bundle_initramfs only when needed
  With INITRAMFS_IMAGE_BUNDLE = "1" the kernel Makefile is used to
  bundle the kernel binary and the initramfs. This works only when the
  build folder of the kernel is available. Building with sstate but with
  an empty TMPDIR requires to rebuild the kernel from scratch whenever
  something in the initramfs changes.

  With INITRAMFS_IMAGE_BUNDLE = "" the fitImage generation is basically
  independent from the kernel Makefile and could therefore work with
  kernel binaries and tools provided by the sstate. But the dependency
  on the do_bundle_initramfs tasks does not allow this. However, if the
  INTIRAMFS_IMAGE is set but the INITRAMFS_IMAGE_BUNDLE is set to 0 the
  do_bundle_initramfs does nothing. There is no real argument for
  running this tasks.

  As a first step towards getting the kernel from sstate when building
  an unbundled fitImage, the task dependencies need to be simplified.
  The do_bundle_initramfs task is now scheduled only when needed.

  Removing the do_bundle_initramfs also removes these task dependencies
  do_deploy --> do_bundle_initramfs --> do_install. But the dependency
  do_deploy --> do_install must be kept because the do_deploy task needs
  the build folder when deploying the kernel artifacts. Therefore the
  do_install depedency is added.
  There is also a dependendency like do_deploy --> do_populate_sysroot
  --> do_install. However since the do_populate_sysroot task is sstate
  cached, the build folder is not available for the do_deploy task if
  the do_populate_sysroot setscene tasks runs.

* If KERNEL_IMAGETYPES does not contain fitImage and INITRAMFS_IMAGE is
  not set, the do_assemble_fitimage_initramfs ends up as an empty task.
  Add the do_assemble_fitimage_initramfs only if a fitImage with
  initramfs needs to be built.

* cd in bitbake task is easy to break e.g. by bbappend. Replace the cd
  by defining the task's dirs variable flag.

* Add 3 comments which are helpful for the next commits.

* Since the tasks and task dependencies are anyway created by an
  anonymous function, align and make the DEPENDS code more specific too.

This refactoring is not very valuable on its own. But it simplifies the
task dependencies which is helpful for the next commit.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 57 ++++++++++++---------
 meta/classes-recipe/kernel.bbclass          | 29 ++++++-----
 2 files changed, 50 insertions(+), 36 deletions(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index 705b3ab657f..2dda5aec056 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -26,20 +26,8 @@ def get_fit_replacement_type(d):
     return replacementtype
 
 KERNEL_IMAGETYPE_REPLACEMENT ?= "${@get_fit_replacement_type(d)}"
-DEPENDS:append = " ${@'u-boot-tools-native dtc-native' if 'fitImage' in (d.getVar('KERNEL_IMAGETYPES') or '').split() else ''}"
 
 python __anonymous () {
-    # Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
-    # to kernel.bbclass . We have to override it, since we pack zImage
-    # (at least for now) into the fitImage .
-    typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE") or ""
-    if 'fitImage' in typeformake.split():
-        d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake.replace('fitImage', d.getVar('KERNEL_IMAGETYPE_REPLACEMENT')))
-
-    image = d.getVar('INITRAMFS_IMAGE')
-    if image:
-        d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
-
     ubootenv = d.getVar('UBOOT_ENV')
     if ubootenv:
         d.appendVarFlag('do_assemble_fitimage', 'depends', ' virtual/bootloader:do_populate_sysroot')
@@ -48,8 +36,31 @@ python __anonymous () {
     providerdtb = d.getVar("PREFERRED_PROVIDER_virtual/dtb")
     if providerdtb:
         d.appendVarFlag('do_assemble_fitimage', 'depends', ' virtual/dtb:do_populate_sysroot')
-        d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' virtual/dtb:do_populate_sysroot')
         d.setVar('EXTERNAL_KERNEL_DEVICETREE', "${RECIPE_SYSROOT}/boot/devicetree")
+
+    typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE") or ""
+    if 'fitImage' in typeformake.split():
+        # Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
+        # to kernel.bbclass . We have to override it, since we pack zImage
+        # (at least for now) into the fitImage .
+        d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake.replace('fitImage', d.getVar('KERNEL_IMAGETYPE_REPLACEMENT')))
+
+        # mkimage and dtc are required by the fitimage_assemble function
+        d.appendVarFlag('do_assemble_fitimage', 'depends',
+                        ' u-boot-tools-native:do_populate_sysroot dtc-native:do_populate_sysroot')
+
+        initramfs_image = d.getVar('INITRAMFS_IMAGE')
+        bundled = bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE'))
+        if initramfs_image:
+            if bundled:
+                bb.build.addtask('do_assemble_fitimage_initramfs', 'do_deploy', 'do_bundle_initramfs', d)
+            else:
+                bb.build.addtask('do_assemble_fitimage_initramfs', 'do_deploy', 'do_install', d)
+
+            d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends',
+                            ' u-boot-tools-native:do_populate_sysroot dtc-native:do_populate_sysroot ${INITRAMFS_IMAGE}:do_image_complete')
+            if providerdtb:
+                d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' virtual/dtb:do_populate_sysroot')
 }
 
 
@@ -797,19 +808,14 @@ do_install:append() {
 }
 
 do_assemble_fitimage_initramfs() {
-	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage" && \
-		test -n "${INITRAMFS_IMAGE}" ; then
-		cd ${B}
-		if [ "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
-			fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage-bundle ""
-			ln -sf fitImage-bundle ${B}/${KERNEL_OUTPUT_DIR}/fitImage
-		else
-			fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage-${INITRAMFS_IMAGE} 1
-		fi
+	if [ "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
+		fitimage_assemble "fit-image-${INITRAMFS_IMAGE}.its" "${KERNEL_OUTPUT_DIR}/fitImage-bundle" ""
+		ln -sf fitImage-bundle "${B}/${KERNEL_OUTPUT_DIR}/fitImage"
+	else
+		fitimage_assemble "fit-image-${INITRAMFS_IMAGE}.its" "${KERNEL_OUTPUT_DIR}/fitImage-${INITRAMFS_IMAGE}" 1
 	fi
 }
-
-addtask assemble_fitimage_initramfs before do_deploy after do_bundle_initramfs
+do_assemble_fitimage_initramfs[dirs] = "${B}"
 
 do_kernel_generate_rsa_keys() {
 	if [ "${UBOOT_SIGN_ENABLE}" = "0" ] && [ "${FIT_GENERATE_KEYS}" = "1" ]; then
@@ -864,6 +870,7 @@ kernel_do_deploy:append() {
 	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
 
 		if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
+			# deploy the artifacts of do_assemble_fitimage
 			bbnote "Copying fit-image.its source file..."
 			install -m 0644 ${B}/fit-image.its "$deployDir/fitImage-its-${KERNEL_FIT_NAME}.its"
 			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
@@ -878,12 +885,14 @@ kernel_do_deploy:append() {
 		fi
 
 		if [ -n "${INITRAMFS_IMAGE}" ]; then
+			# deploy the artifacts of do_assemble_fitimage_initramfs for bundled as well as un-bundled mode
 			bbnote "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
 			install -m 0644 ${B}/fit-image-${INITRAMFS_IMAGE}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its"
 			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
 				ln -snf fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
 			fi
 
+			# deploy the artifacts of do_assemble_fitimage_initramfs for bundled mode only
 			if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
 				bbnote "Copying fitImage-${INITRAMFS_IMAGE} file..."
 				install -m 0644 ${B}/${KERNEL_OUTPUT_DIR}/fitImage-${INITRAMFS_IMAGE} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}"
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 4464155b730..217f42b4f4f 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -139,18 +139,23 @@ fi
 set -e
 """ % (type, type, type))
 
-
     image = d.getVar('INITRAMFS_IMAGE')
-    # If the INTIRAMFS_IMAGE is set but the INITRAMFS_IMAGE_BUNDLE is set to 0,
-    # the do_bundle_initramfs does nothing, but the INITRAMFS_IMAGE is built
-    # standalone for use by wic and other tools.
     if image:
-        if d.getVar('INITRAMFS_MULTICONFIG'):
-            d.appendVarFlag('do_bundle_initramfs', 'mcdepends', ' mc::${INITRAMFS_MULTICONFIG}:${INITRAMFS_IMAGE}:do_image_complete')
+        # If the INTIRAMFS_IMAGE is set but the INITRAMFS_IMAGE_BUNDLE is set to 0,
+        # the do_bundle_initramfs is not needed, but the INITRAMFS_IMAGE is built
+        # standalone for use by wic and other tools.
+        def add_initramfs_dep_task(initramfs_dep_task, d):
+            if d.getVar('INITRAMFS_MULTICONFIG'):
+                d.appendVarFlag(initramfs_dep_task, 'mcdepends', ' mc::${INITRAMFS_MULTICONFIG}:${INITRAMFS_IMAGE}:do_image_complete')
+            else:
+                d.appendVarFlag(initramfs_dep_task, 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
+
+        if bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE')):
+            bb.build.addtask('do_bundle_initramfs', 'do_deploy', 'do_install', d)
+            add_initramfs_dep_task('do_bundle_initramfs', d)
+            bb.build.addtask('do_transform_bundled_initramfs', 'do_deploy', 'do_bundle_initramfs', d)
         else:
-            d.appendVarFlag('do_bundle_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
-    if image and bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE')):
-        bb.build.addtask('do_transform_bundled_initramfs', 'do_deploy', 'do_bundle_initramfs', d)
+            add_initramfs_dep_task('do_deploy', d)
 
     # NOTE: setting INITRAMFS_TASK is for backward compatibility
     #       The preferred method is to set INITRAMFS_IMAGE, because
@@ -330,6 +335,8 @@ do_bundle_initramfs () {
 				mv -f ${KERNEL_OUTPUT_DIR}/$imageType.bak ${KERNEL_OUTPUT_DIR}/$imageType
 			fi
 		done
+	else
+		bbwarn "Calling do_bundle_initramfs with INITRAMFS_IMAGE_BUNDLE=1 is deprecated"
 	fi
 }
 do_bundle_initramfs[dirs] = "${B}"
@@ -350,8 +357,6 @@ python do_devshell:prepend () {
     os.environ["LDFLAGS"] = ''
 }
 
-addtask bundle_initramfs after do_install before do_deploy
-
 KERNEL_DEBUG_TIMESTAMPS ??= "0"
 
 kernel_do_compile() {
@@ -873,7 +878,7 @@ kernel_do_deploy() {
 # ensure we get the right values for both
 do_deploy[prefuncs] += "read_subpackage_metadata"
 
-addtask deploy after do_populate_sysroot do_packagedata
+addtask deploy after do_install do_populate_sysroot do_packagedata
 
 EXPORT_FUNCTIONS do_deploy
 
-- 
2.46.0


