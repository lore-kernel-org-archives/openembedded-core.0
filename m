Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7994FC41513
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 14:15:18 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.39147.1721052913220723811
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 07:15:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ew2vIY9c;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-367b6e5ffbfso2458297f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 07:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721052911; x=1721657711; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+7gHmybsY8jlXqMhw27Zxa1l8YpnHBrRMYcsfzD6sc=;
        b=Ew2vIY9c6kSGjKEraZZyQi/6Ztm57O/nnbGPwBRS84BxfL1cO1yEMoTEap5AwoM0N9
         2D+rfXICjTl13w2n6Qc5kQ8NOfbJdteyVrP8KAQdoMpL/pM00RemllqD6QA2JnF2SJ6R
         UKsitgGSZXAZqGd8Rcnk6z2K+wu+F+kz/Z1XUyuyXxwtfI4mcrpDJdPOo5IF0B52SL9Y
         /n1NsHRUOjefx95Rl0K+mWngU5VLnz1Np9Fhh3uY7l1So6pdfNxTebYiKCtzgXek679h
         k158gPKG+FsNDJbWX1t+G7ER90tEWO7fhGFeS/vKTknLhJt6L5rx25UShXV/coHbzZTd
         RqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721052911; x=1721657711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F+7gHmybsY8jlXqMhw27Zxa1l8YpnHBrRMYcsfzD6sc=;
        b=CJh2P6m0eqZpX/EC8NkuxoqBLT1yp79bP/wV6ZXYH91wCUjoUVlbRAVPuEzawutabl
         3C6B2+jnEBko+wN0NfUrqyBnYZq8aPPOZvkeFAiTwtDptA8iuLyCB2weR7LTHFEJzuup
         jPNUh6FYR7AxIch15NS/0GR+NPQBUYpXiE7ao++ESOyGT0lKqcKOw71hNf1x1RrtgtV5
         nfCQzFbguxS+2OJYjVziR7wIZRf2oHBlhUBj49iFNdi6Ozr+KWfUmZKLdDfVMUjFMAAZ
         Wo3u9zK/GlW0r14esiqLvATyG0+K0QSxFOLST+TS92TYH1DOMwoXGZmbs+D3rYC+kSsK
         xn1w==
X-Gm-Message-State: AOJu0YzsPldIzyDMjr4bDVpRh5qgYKdZPOhU20OP6ZUjdhWz+HItLy2F
	NxS4e0o7XxMU/HFh4ruvpBuYbML5y4wXzJKG/xX3dygfC+0i8hVjstvajQ==
X-Google-Smtp-Source: AGHT+IHjvWpulWw9vhmMcB9bgF4ok/daNX6UtK0+RwCk6yRbMnjRKz9wZl4WD5DQiBJylm4M/thJMg==
X-Received: by 2002:a5d:6da6:0:b0:367:94a7:12c8 with SMTP id ffacd0b85a97d-367cea46deamr15804210f8f.6.1721052911064;
        Mon, 15 Jul 2024 07:15:11 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680daccbddsm6499074f8f.64.2024.07.15.07.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 07:15:10 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 6/6] kernel-fitimage: run unbundled fitimage after deploy
Date: Mon, 15 Jul 2024 16:10:43 +0200
Message-ID: <20240715141448.2158477-7-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240715141448.2158477-1-adrian.freihofer@gmail.com>
References: <20240715141448.2158477-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 14:15:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201932

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Without this change, the kernel is always rebuilt if something changes
in the initramfs. If the kernel is rebuilt with an empty TMPDIR, the
process starts by fetching the large kernel git repository and
recompiling it from scratch. This is very inefficient.

This cannot be improved if INITRAMFS_IMAGE_BUNDLE = "1". If the kernel
Makefile is needed to generate the initramfs bundle the kernel build
folder is required. For this cases nothing changes.

But for a build configuration with INITRAMFS_IMAGE_BUNDLE = "" the
build folder is not needed. Creating the initramfs bundle requires:
linux.bin, DTBs and the initramfs. These artifacts are all available in
the deploy folder which is also sstate cached.

Therefore do_assemble_fitimage_initramfs gets split into two tasks:
- do_assemble_fitimage_initramfs creates the bundled fitImage which runs
  before do_deploy_image. This is without sstate and therefore the
  do_deploy_image task still deploys the artifacts generated by this
  task.
- do_deploy_fitimage_unbundled creates the fitImage in unbundled mode.
  This task runs after do_deploy_image. It uses the linux.bin artifact
  from do_deploy_image to create the fitImage with initramfs.
  This task is done with SSTATE_SKIP_CREATION, because this also works
  with the eSDK installer (oe-selftest -r esdk is successful). It is
  also more effective to quickly create the fit image instead of
  handling it via sstate.

Unfortunately, this change is not 100% backward compatible. Previously,
a dependency on do_deploy deployed all types of fit images. With this
change, deploying the unbundled fit image requires a dependency on
do_deploy_fitimage_unbundled. The assignment of the KERNEL_DEPLOY_DEPEND
is improved to handle this appropriately.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/image.bbclass           | 12 ++-
 meta/classes-recipe/kernel-fitimage.bbclass | 84 +++++++++++++--------
 meta/classes-recipe/kernel.bbclass          |  3 +-
 3 files changed, 66 insertions(+), 33 deletions(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index 32bafcdbbc3..f5754fb6fd9 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -147,7 +147,17 @@ do_rootfs[vardeps] += "${@rootfs_variables(d)}"
 # This follows many common usecases and user expectations.
 # But if you are building an image which doesn't need the kernel image at all,
 # you can unset this variable manually.
-KERNEL_DEPLOY_DEPEND ?= "virtual/kernel:do_deploy"
+def get_kernel_do_deploy(d):
+    kerneltypes = d.getVar('KERNEL_IMAGETYPES') or ""
+    kerneltype = d.getVar('KERNEL_IMAGETYPE') or ""
+    fitimage = kerneltype == 'fitImage' or 'fitImage' in kerneltypes.split()
+    initramfs_image = d.getVar('INITRAMFS_IMAGE') or ""
+    bundled = d.getVar('INITRAMFS_IMAGE_BUNDLE') == '1'
+    if fitimage and initramfs_image and not bundled:
+        return "virtual/kernel:do_deploy_fitimage_unbundled"
+    return "virtual/kernel:do_deploy"
+
+KERNEL_DEPLOY_DEPEND ?= "${@get_kernel_do_deploy(d)}"
 do_build[depends] += "${KERNEL_DEPLOY_DEPEND}"
 
 
diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index 2dda5aec056..f42a0cabeb3 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -49,18 +49,28 @@ python __anonymous () {
         d.appendVarFlag('do_assemble_fitimage', 'depends',
                         ' u-boot-tools-native:do_populate_sysroot dtc-native:do_populate_sysroot')
 
+        # A fitImage with the initramfs bundled in the kernel Image is deployed by do_deploy.
+        # In case of a build from an empty TMPDIR a clean kernel re-build is required just because creating the bundled
+        # kernel image requires the kernel Makefile and therefore the kernel's populated build directory.
+        # In case of an unbundled fitImage assembling the fitImage works independenly from the kernel build framework.
+        # This allow to take the kernel binary from the sstated deploy directory. But it requires to assemble the
+        # fitImage in a separate task (do_deploy_fitimage_unbundled) running after do_deploy.
         initramfs_image = d.getVar('INITRAMFS_IMAGE')
         bundled = bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE'))
         if initramfs_image:
             if bundled:
-                bb.build.addtask('do_assemble_fitimage_initramfs', 'do_deploy', 'do_bundle_initramfs', d)
+                fit_assemble_task = 'do_assemble_fitimage_initramfs'
+                bb.build.addtask(fit_assemble_task, 'do_deploy', 'do_bundle_initramfs', d)
             else:
-                bb.build.addtask('do_assemble_fitimage_initramfs', 'do_deploy', 'do_install', d)
+                fit_assemble_task = 'do_deploy_fitimage_unbundled'
+                bb.build.addtask(fit_assemble_task, 'do_build', 'do_deploy', d)
+                bb.build.addtask(fit_assemble_task + '_setscene', '', '', d)
+                d.appendVar('SSTATETASKS', fit_assemble_task)
 
-            d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends',
+            d.appendVarFlag(fit_assemble_task, 'depends',
                             ' u-boot-tools-native:do_populate_sysroot dtc-native:do_populate_sysroot ${INITRAMFS_IMAGE}:do_image_complete')
             if providerdtb:
-                d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' virtual/dtb:do_populate_sysroot')
+                d.appendVarFlag(fit_assemble_task, 'depends', ' virtual/dtb:do_populate_sysroot')
 }
 
 
@@ -808,15 +818,30 @@ do_install:append() {
 }
 
 do_assemble_fitimage_initramfs() {
-	if [ "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
-		fitimage_assemble "fit-image-${INITRAMFS_IMAGE}.its" "${KERNEL_OUTPUT_DIR}/fitImage-bundle" ""
-		ln -sf fitImage-bundle "${B}/${KERNEL_OUTPUT_DIR}/fitImage"
-	else
-		fitimage_assemble "fit-image-${INITRAMFS_IMAGE}.its" "${KERNEL_OUTPUT_DIR}/fitImage-${INITRAMFS_IMAGE}" 1
-	fi
+	fitimage_assemble "fit-image-${INITRAMFS_IMAGE}.its" "${KERNEL_OUTPUT_DIR}/fitImage-bundle" ""
+	ln -sf fitImage-bundle "${B}/${KERNEL_OUTPUT_DIR}/fitImage"
 }
 do_assemble_fitimage_initramfs[dirs] = "${B}"
 
+do_deploy_fitimage_unbundled() {
+	fitimage_assemble "${DEPLOY_DIR_IMAGE}/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its"\
+	  "${DEPLOY_DIR_IMAGE}/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}" 1
+	if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
+		ln -snf "fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}" "${DEPLOY_DIR_IMAGE}/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
+		ln -snf fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its "${DEPLOY_DIR_IMAGE}/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
+	fi
+}
+DEPLOYDIR_FITIMAGE_UNBUNDLED = "${WORKDIR}/deploy-fitimage-unbundled-${PN}"
+SSTATE_SKIP_CREATION:task-deploy-fitimage-unbundled = '1'
+do_deploy_fitimage_unbundled[sstate-inputdirs] = "${DEPLOYDIR_FITIMAGE_UNBUNDLED}"
+do_deploy_fitimage_unbundled[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
+python do_deploy_fitimage_unbundled_setscene () {
+    sstate_setscene(d)
+}
+do_deploy_fitimage_unbundled[dirs] = "${DEPLOY_DIR_IMAGE}"
+do_deploy_fitimage_unbundled[cleandirs] = "${DEPLOYDIR_FITIMAGE_UNBUNDLED}"
+do_deploy_fitimage_unbundled[stamp-extra-info] = "${MACHINE_ARCH}"
+
 do_kernel_generate_rsa_keys() {
 	if [ "${UBOOT_SIGN_ENABLE}" = "0" ] && [ "${FIT_GENERATE_KEYS}" = "1" ]; then
 		bbwarn "FIT_GENERATE_KEYS is set to 1 even though UBOOT_SIGN_ENABLE is set to 0. The keys will not be generated as they won't be used."
@@ -868,9 +893,24 @@ kernel_do_deploy[vardepsexclude] = "DATETIME"
 kernel_do_deploy:append() {
 	# Update deploy directory
 	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
-
-		if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
-			# deploy the artifacts of do_assemble_fitimage
+		if  [ -n "${INITRAMFS_IMAGE}" ] && [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
+			# do_deploy_fitimage_unbundled needs the linux.bin file for the unbundled fitImage deployment
+			bbnote "Deploying linux.bin and linux.comp file for do_deploy_fitimage_unbundled..."
+			uboot_prep_kimage
+			install -m 0644 ${B}/linux.bin $deployDir/linux.bin
+			install -m 0644 ${B}/linux.comp $deployDir/linux.comp
+			if [ -e "${B}/${KERNEL_OUTPUT_DIR}/setup.bin" ]; then
+				install -m 0644 "${B}/${KERNEL_OUTPUT_DIR}/setup.bin" "$deployDir/setup.bin"
+			fi
+		elif [ -n "${INITRAMFS_IMAGE}" ]; then
+			# deploy the artifacts created by do_assemble_fitimage_initramfs for bundled mode
+			bbnote "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
+			install -m 0644 ${B}/fit-image-${INITRAMFS_IMAGE}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its"
+			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
+				ln -snf fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
+			fi
+		else
+			# deploy the artifacts of do_assemble_fitimage (fitImage without initramfs)
 			bbnote "Copying fit-image.its source file..."
 			install -m 0644 ${B}/fit-image.its "$deployDir/fitImage-its-${KERNEL_FIT_NAME}.its"
 			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
@@ -883,23 +923,5 @@ kernel_do_deploy:append() {
 				ln -snf fitImage-linux.bin-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT} "$deployDir/fitImage-linux.bin-${KERNEL_FIT_LINK_NAME}"
 			fi
 		fi
-
-		if [ -n "${INITRAMFS_IMAGE}" ]; then
-			# deploy the artifacts of do_assemble_fitimage_initramfs for bundled as well as un-bundled mode
-			bbnote "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
-			install -m 0644 ${B}/fit-image-${INITRAMFS_IMAGE}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its"
-			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
-				ln -snf fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
-			fi
-
-			# deploy the artifacts of do_assemble_fitimage_initramfs for bundled mode only
-			if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
-				bbnote "Copying fitImage-${INITRAMFS_IMAGE} file..."
-				install -m 0644 ${B}/${KERNEL_OUTPUT_DIR}/fitImage-${INITRAMFS_IMAGE} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}"
-				if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
-					ln -snf fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
-				fi
-			fi
-		fi
 	fi
 }
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 6a8c3c25c07..848f4e5e431 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -488,7 +488,8 @@ kernel_do_install() {
 	# So, at the level of the install task we should not try to install the fitImage. fitImage is still not
 	# generated yet.
 	# After the generation of the fitImage, the deploy task copies the fitImage from the build directory to
-	# the deploy folder.
+	# the deploy folder. If INITRAMFS_IMAGE_BUNDLE != 1 the fitImage with initramfs is deployed after the
+	# deploy task.
 	#
 
 	for imageType in ${KERNEL_IMAGETYPES} ; do
-- 
2.45.2


