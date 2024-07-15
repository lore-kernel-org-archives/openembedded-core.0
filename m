Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D85FC3DA61
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 14:15:18 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.38955.1721052912469732292
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 07:15:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AFET894V;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4266f535e82so29279805e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 07:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721052910; x=1721657710; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kD/aYAryd6/wqUT21FIB3IeIMdHmrv4D3N1V3rHL7kM=;
        b=AFET894VbfO96jBoDVZKYjKBeX6NMTqeqSYJVszLzBhpMkX7hOs+ACrGj9m9UhaviD
         ymFRu7aXI8rtU9izY/6jomk9L+MMnuRQJCF/bZanD8SmklOFgF7aHNd2ols0uTtu0IWB
         Wb1s/oomk3FPFolkV8ALLSt/or0mvYBCogM/IibsTyqCMacbO/PETHwy8MRtShU8DiCv
         88hiLZPBeve74eoqS0lH6sCoQ08Jw7+o/J2gzPujS+wyjJWiSy711k//00r+ectTYGNF
         eyI0s5eDZBbTJ5l/gPf4GQPOj4Ng2nPLJQr9fl0WJCgCGddFgFhvas2o47+QHgh5Cu+X
         jXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721052910; x=1721657710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kD/aYAryd6/wqUT21FIB3IeIMdHmrv4D3N1V3rHL7kM=;
        b=g/BlObNwlbmtpwLZV7nddiTRSJw46RC9CNasvwh0XWM4OLk2zU9T4rwz20qagrQ8It
         okQdbIWA2v50L8MkJcwsaMniOZ6KDWiR1+Ki6SMJu4yH6ijLsu2ZRAxmntXOr4yhRT+c
         eCPO60bUAdlo2Cnm8Wzey87B/pclEBuYVrAN5nDfZTryNK7WwfhQA4yNZHskzIIvBe0j
         W2pqMp4MC/U/Wa84dxJUTxeIX/if9yaG+ru1kIQv+Q2DIqoDKxCrjHjZLNiMRIkK2wEo
         WuMZfqyemTM3J1I4qR32bhuJmAh3QacwDTmto91n6JiUHDiUfzlwoyz4OJUJieLK5pSh
         HQEg==
X-Gm-Message-State: AOJu0YzxgaGWd3R/Yir9ldZmNI6ytqWiIXCi7W+tVPgwaOuToac+sfKw
	YpxKlvanFcIWVdkffcF4yLpBz5cn/wMPMNsWf/65rg0F+wQPO+YDyzJkgA==
X-Google-Smtp-Source: AGHT+IHdzTkFFiWN66HxM7hVaYvermvX2isdDfXgh/uaFYSog/JNDiSIhzY19AYAe3jNsOrXQSI/Hg==
X-Received: by 2002:a05:600c:48a7:b0:425:7bbf:fd07 with SMTP id 5b1f17b1804b1-426707cea0bmr121285305e9.5.1721052910439;
        Mon, 15 Jul 2024 07:15:10 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680daccbddsm6499074f8f.64.2024.07.15.07.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 07:15:09 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 5/6] kernel: refactor fitimage
Date: Mon, 15 Jul 2024 16:10:42 +0200
Message-ID: <20240715141448.2158477-6-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240715141448.2158477-1-adrian.freihofer@gmail.com>
References: <20240715141448.2158477-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 14:15:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201931

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
 meta/classes-recipe/kernel.bbclass          | 28 ++++++----
 2 files changed, 50 insertions(+), 35 deletions(-)

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
index 89badd90f18..6a8c3c25c07 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -136,18 +136,24 @@ fi
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
+            d.appendVarFlag('do_deploy', 'depends', ' ${PN}:do_install')
 
     # NOTE: setting INITRAMFS_TASK is for backward compatibility
     #       The preferred method is to set INITRAMFS_IMAGE, because
@@ -327,6 +333,8 @@ do_bundle_initramfs () {
 				mv -f ${KERNEL_OUTPUT_DIR}/$imageType.bak ${KERNEL_OUTPUT_DIR}/$imageType
 			fi
 		done
+	else
+		bbwarn "Calling do_bundle_initramfs with INITRAMFS_IMAGE_BUNDLE=1 is deprecated"
 	fi
 }
 do_bundle_initramfs[dirs] = "${B}"
@@ -347,8 +355,6 @@ python do_devshell:prepend () {
     os.environ["LDFLAGS"] = ''
 }
 
-addtask bundle_initramfs after do_install before do_deploy
-
 KERNEL_DEBUG_TIMESTAMPS ??= "0"
 
 kernel_do_compile() {
-- 
2.45.2


