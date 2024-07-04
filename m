Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA331C3DA41
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 07:10:33 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.4922.1720077029712528362
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 00:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NWJ5MGVz;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52ccc40e72eso198045e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 00:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720077028; x=1720681828; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K8rFO0esp8YzioHYvq1YGCdToDuB+fv05fshR+tD2+Q=;
        b=NWJ5MGVzng1iA2j8tXsy0mqIYORAqNfZQ8TCmGOre+ABhiCEJBZ4iBdH74F6gkvZmg
         yBvfBIS7g12UtN9aVuZTQiU1v91qpW4V2WKcfluSDPCNbZJBAf6nkQ6DxuhwjH1MohmR
         IpvbFjLlt1+1xb9VJD0TAlY8rJ74u3liN+LNXXQLiO1KHOlqcdAM3brZQtiQ+95bcbzf
         XnHeq9AzhNC5XvPIUUAcAgi9a2ycPEHNpggV+Iu3QQLjvEtOzra1dXZ/rJzMxrgzNU8u
         yoR7KLCiUJPIAF9DLmVfn0w3qiSlZf0lBVmVumRodypstgiortsCJajURWI0x6nZySsw
         GXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720077028; x=1720681828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K8rFO0esp8YzioHYvq1YGCdToDuB+fv05fshR+tD2+Q=;
        b=k/RonwVwA7paLH/NaOAGFENkF7HwTFmMgtmSM28HUBBlQ6zr6ZBJZ8xiM2A02j8vz0
         bffu/2eP4jMjM+TjkwNqPHwUXhcbBMDhF+bs+b++yrLWrEBQeCXrpBz9yxQAKzC9y5Zv
         yJ9Eis1LZTkIi0mq9Q4vgK2j08eWAwwYFy6drYZWv7BU7Of7co+c2ayxusdrfvhZrZ5l
         +EszPkpBAB7nnc3/4GdnDeUMD6e5s4hnj0kGgsBj6jGNDuygukbZXERwA3Y/A17Cam+q
         7XW2+tCZstR9K0dEZmlb+ci/FoaOPsSJ9e7jonJyi+Fdf78qzSe5wqxNVcQs7pIxZ5ac
         fQkQ==
X-Gm-Message-State: AOJu0YyHSxuGlxG2rG9NKuaFdAOR4Jj3x2fsfY6MOGinmF/E8vQN8oUr
	KS1dvWIdU6So+oIBZjVeJZT7x+om69lC8HnJVBHmiGBFirEK5wnamWMyDQ==
X-Google-Smtp-Source: AGHT+IFkbU7DAnS89cKM4RZ67aaBMDiQEwg6HxEJ7Rcq7WII83HvEH6aKYfkgDNOw9zfTlXUHxpsxw==
X-Received: by 2002:ac2:4115:0:b0:52c:f3fa:86c with SMTP id 2adb3069b0e04-52ea0629bc7mr549347e87.18.1720077027454;
        Thu, 04 Jul 2024 00:10:27 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1f23f9sm11597255e9.26.2024.07.04.00.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 00:10:27 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 12/14] kernel-fitimage: run unbundled fitimage after deploy
Date: Thu,  4 Jul 2024 09:09:48 +0200
Message-ID: <20240704071013.2982700-13-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240704071013.2982700-1-adrian.freihofer@gmail.com>
References: <20240704071013.2982700-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 07:10:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201517

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Generate the fitImage with unbundled initramfs after do_deploy. This
allows to use the kernel image from the sstate of the do_deploy task.

Without this change, the kernel is always rebuilt if something changes
in the initramfs, which happens frequently. If the kernel is rebuilt
with an empty TMPDIR, the process starts by fetching the large kernel
git repository and recompiling it from scratch. This is very
inefficient.
This cannot be improved if INITRAMFS_IMAGE_BUNDLE = "1". If the kernel
Makefile is needed to generate the initramfs bundle the kernel build
folder is required.
But for a build configuration with INITRAMFS_IMAGE_BUNDLE = "" the
build folder is not needed. Creating the initramfs bundle requires:
linux.bin, DTBs and the initramfs which are availabe in the deploy
directory. That means creating the fitImage can be done with artifacts
which are already cached by the sstate.

The do_assemble_fitimage_initramfs gets split into two tasks:
- do_assemble_fitimage_initramfs creates the bundled fitImage which runs
  before do_deploy. This is without sstate and therefore the do_deploy
  task still deploys the artifacts generated by this task.
- do_deploy_fitimage_unbundled creates the fitImage in unbundled mode.
  This task runs after do_deploy. It uses the linux.bin artifact from
  do_deploy (and hence from sstate if available) to create the fitImage
  with initramfs.
  This task is done with SSTATE_SKIP_CREATION, because calling mkimage
  is probably quicker than handling this via sstate. Further this also
  works with the eSDK installer (oe-selftest -r esdk is successful).

Unfortunately, this change is not 100% backwards compatible. Previously,
a dependency on do_deploy deployed all types of fit images. With this
change, deploying the unbundled fit image requires a dependency on
do_deploy_fitimage_unbundled. This will be mitigated with a next commit.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 131 ++++++++++++--------
 meta/classes-recipe/kernel.bbclass          |   3 +-
 2 files changed, 80 insertions(+), 54 deletions(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index 88b8edb9b54..c4d474b8c1f 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -26,35 +26,52 @@ def get_fit_replacement_type(d):
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
-    if bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE')):
-        bb.build.addtask('assemble_fitimage_initramfs', 'do_deploy', 'do_bundle_initramfs', d)
-    else:
-        bb.build.addtask('assemble_fitimage_initramfs', 'do_deploy', 'do_install', d)
-
-    image = d.getVar('INITRAMFS_IMAGE')
-    if image:
-        d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
-
-    ubootenv = d.getVar('UBOOT_ENV')
-    if ubootenv:
-        d.appendVarFlag('do_assemble_fitimage', 'depends', ' virtual/bootloader:do_populate_sysroot')
-
     #check if there are any dtb providers
     providerdtb = d.getVar("PREFERRED_PROVIDER_virtual/dtb")
     if providerdtb:
         d.appendVarFlag('do_assemble_fitimage', 'depends', ' virtual/dtb:do_populate_sysroot')
-        d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' virtual/dtb:do_populate_sysroot')
         d.setVar('EXTERNAL_KERNEL_DEVICETREE', "${RECIPE_SYSROOT}/boot/devicetree")
+
+    d.appendVarFlag('do_assemble_fitimage', 'depends',
+                    ' u-boot-tools-native:do_populate_sysroot dtc-native:do_populate_sysroot')
+    ubootenv = d.getVar('UBOOT_ENV')
+    if ubootenv:
+        d.appendVarFlag('do_assemble_fitimage', 'depends', ' virtual/bootloader:do_populate_sysroot')
+
+    typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE") or ""
+    if 'fitImage' in typeformake.split():
+        # Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
+        # to kernel.bbclass . We have to override it, since we pack zImage
+        # (at least for now) into the fitImage .
+        d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake.replace('fitImage', d.getVar('KERNEL_IMAGETYPE_REPLACEMENT')))
+
+        # A fitImage with the initramfs bundled in the kernel Image is deployed by do_deploy.
+        # In case of a build from an empty TMPDIR a clean kernel re-build is required just because creating the bundled
+        # kernel image requires the kernel Makefile and therefore the kernel's populated build directory.
+        # In case of an unbundled fitImage assembling the fitImage works independenly from the kernel build framework.
+        # This allow to take the kernel binary from the sstated deploy directory. But it requires to assemble the
+        # fitImage in a separate task (do_deploy_fitimage_unbundled) running after do_deploy.
+        initramfs_image = d.getVar('INITRAMFS_IMAGE')
+        bundled = bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE'))
+        if initramfs_image:
+            if bundled:
+                bb.build.addtask('do_assemble_fitimage_initramfs', 'do_deploy', 'do_bundle_initramfs', d)
+                d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' ' + initramfs_image + ':do_image_complete')
+                d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends',
+                                ' u-boot-tools-native:do_populate_sysroot dtc-native:do_populate_sysroot')
+                if providerdtb:
+                    d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' virtual/dtb:do_populate_sysroot')
+            else:
+                bb.build.addtask('do_deploy_fitimage_unbundled', 'do_build', 'do_deploy', d)
+                bb.build.addtask('do_deploy_fitimage_unbundled_setscene', '', '', d)
+                d.appendVar('SSTATETASKS', ' do_deploy_fitimage_unbundled')
+                d.appendVarFlag('do_deploy_fitimage_unbundled', 'depends', ' ' + initramfs_image + ':do_image_complete')
+                d.appendVarFlag('do_deploy_fitimage_unbundled', 'depends',
+                                ' u-boot-tools-native:do_populate_sysroot dtc-native:do_populate_sysroot')
+                if providerdtb:
+                    d.appendVarFlag('do_deploy_fitimage_unbundled', 'depends', ' virtual/dtb:do_populate_sysroot')
 }
 
 
@@ -802,18 +819,30 @@ do_install:append() {
 }
 
 do_assemble_fitimage_initramfs() {
-	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage" && \
-		test -n "${INITRAMFS_IMAGE}" ; then
-		cd ${B}
-		uboot_prep_kimage
-		if [ "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
-			fitimage_assemble "fit-image-${INITRAMFS_IMAGE}.its" "${KERNEL_OUTPUT_DIR}/fitImage-bundle" ""
-			ln -sf fitImage-bundle "${B}/${KERNEL_OUTPUT_DIR}/fitImage"
-		else
-			fitimage_assemble "fit-image-${INITRAMFS_IMAGE}.its" "${KERNEL_OUTPUT_DIR}/fitImage-${INITRAMFS_IMAGE}" 1
-		fi
+	uboot_prep_kimage
+	fitimage_assemble "fit-image-${INITRAMFS_IMAGE}.its" "${KERNEL_OUTPUT_DIR}/fitImage-bundle" ""
+	ln -sf fitImage-bundle "${B}/${KERNEL_OUTPUT_DIR}/fitImage"
+}
+do_assemble_fitimage_initramfs[dirs] = "${B}"
+
+do_deploy_fitimage_unbundled() {
+	fitimage_assemble "${DEPLOY_DIR_IMAGE}/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its"\
+	  "${DEPLOY_DIR_IMAGE}/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}" 1
+	if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
+		ln -snf "fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}" "${DEPLOY_DIR_IMAGE}/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
+		ln -snf fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its "${DEPLOY_DIR_IMAGE}/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
 	fi
 }
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
 
 do_kernel_generate_rsa_keys() {
 	if [ "${UBOOT_SIGN_ENABLE}" = "0" ] && [ "${FIT_GENERATE_KEYS}" = "1" ]; then
@@ -866,9 +895,23 @@ kernel_do_deploy[vardepsexclude] = "DATETIME"
 kernel_do_deploy:append() {
 	# Update deploy directory
 	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
-
-		if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
-			# deploy the artifacts of do_assemble_fitimage
+		if  [ -n "${INITRAMFS_IMAGE}" ] && [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
+			# do_deploy_fitimage_unbundled needs the linux.bin file for the unbundled fitImage deployment
+			bbnote "Deploying linux.bin file for do_deploy_fitimage_unbundled..."
+			uboot_prep_kimage
+			install -m 0644 ${B}/linux.bin $deployDir/linux.bin
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
@@ -881,23 +924,5 @@ kernel_do_deploy:append() {
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
index 6d242114852..3a3b2d40b2c 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -484,7 +484,8 @@ kernel_do_install() {
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


