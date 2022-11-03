Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF5CC4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 00:24:08 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.13973.1667435040598637290
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 17:24:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=g39Pah73;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id BFDC120B9F81; Wed,  2 Nov 2022 17:23:59 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BFDC120B9F81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1667435039;
	bh=kwTItNHQdX9amQKzdkFCQeiZSqZm0vsnFDYcCnkx3uI=;
	h=From:To:Subject:Date:From;
	b=g39Pah73Cq+ibgJNk+v7JDUUyR43J8qi4iJJDoezE3mU7Q47gF7MJQLJnBhfcL/Zw
	 GvPwpKJv8rVwrP9WpZ7Htq2jKeyo2CyL4QjhvtHQiRf0pQcwKDuHS7rbtMj/qhv+tP
	 Xlh/SPITtA+4AWz6vaxtZ8DmblVdyXOSENCn+6iA=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC] [PATCH] Allow fitimage + initramfs rebuild to be accelerated
Date: Wed,  2 Nov 2022 17:23:51 -0700
Message-Id: <1667435031-7224-1-git-send-email-paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 00:24:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172601

From: Paul Eggleton <paul.eggleton@microsoft.com>

We have a usecase where our initramfs changes on every build (since it
contains a version number which is based on the date), and we're
incorporating that into a fitImage. Most of the time our builds are done
from shared state and we want them to be as efficient as possible.
Currently, when the initramfs signature is different this setup requires
the kernel to be recompiled on every build, which is not ideal. I've
come up with the following rough patch to address this, which does the
following:

* Avoid the dependency of do_bundle_initramfs on ${INITRAMFS_IMAGE} if
  we are going to be building that for the fit image later anyway
* Add a do_preserve_kernel_build task to preserve the files needed to
  re-run do_assemble_fitimage_initramfs in a separate location from
  ${B}, which can be saved to sstate
* Add a do_deploy_fitimage task to deploy just the files written out by
  do_assemble_fitimage_initramfs to ${DEPLOY_DIR_IMAGE}; this allows us
  to preserve less in sstate than we would have to if we allowed
  do_deploy to rerun. Of course the downside is we then need to add a
  dependency from the image's do_build on the kernel's
  do_deploy_fitimage, and I had to introduce a variable to control that
  which is a bit awkward.

This patch is quite rough and I'd like to take suggestions on how to
improve it. One of my challenges is I don't have a complete grasp of all
the usage modes supported by this code so I'd appreciate folks who do
taking a look.

Thanks!
Paul
---
 meta/classes-recipe/image.bbclass           |  5 +--
 meta/classes-recipe/kernel-fitimage.bbclass | 55 ++++++++++++++++++++++++-----
 meta/classes-recipe/kernel.bbclass          |  2 +-
 3 files changed, 51 insertions(+), 11 deletions(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index e387645..cedd913 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -137,13 +137,14 @@ def rootfs_variables(d):
 
 do_rootfs[vardeps] += "${@rootfs_variables(d)}"
 
+IMAGE_FITIMAGE_DEPEND = "${@'virtual/kernel:do_deploy_fitimage' if d.getVar('IMAGE_FITIMAGE') == '1' else ''}"
+
 # This is needed to have kernel image in DEPLOY_DIR.
 # This follows many common usecases and user expectations.
 # But if you are building an image which doesn't need the kernel image at all,
 # you can unset this variable manually.
 KERNEL_DEPLOY_DEPEND ?= "virtual/kernel:do_deploy"
-do_build[depends] += "${KERNEL_DEPLOY_DEPEND}"
-
+do_build[depends] += "${KERNEL_DEPLOY_DEPEND} ${IMAGE_FITIMAGE_DEPEND}"
 
 python () {
     def extraimage_getdepends(task):
diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index 7980910..40406fc 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -731,10 +731,32 @@ do_install:append() {
 	fi
 }
 
+python do_preserve_kernel_build() {
+    archdir = d.getVar('KERNEL_OUTPUT_DIR')
+    src = d.getVar('B')
+    dst = d.getVar('INITRAMFSDIR')
+    oe.path.copyhardlinktree(os.path.join(src, archdir), os.path.join(dst, archdir))
+    for fn in ['vmlinux', 'fit-image.its']:
+        oe.path.copyhardlink(os.path.join(src, fn), os.path.join(dst, fn))
+}
+
+INITRAMFSDIR = "${WORKDIR}/initramfs-work"
+SSTATETASKS += "do_preserve_kernel_build"
+do_preserve_kernel_build[cleandirs] = "${INITRAMFSDIR}"
+do_preserve_kernel_build[sstate-plaindirs] = "${INITRAMFSDIR}"
+
+python do_preserve_kernel_build_setscene () {
+    sstate_setscene(d)
+}
+addtask preserve_kernel_build_setscene
+
+
+addtask preserve_kernel_build after do_bundle_initramfs
+
 do_assemble_fitimage_initramfs() {
 	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage" && \
 		test -n "${INITRAMFS_IMAGE}" ; then
-		cd ${B}
+		cd ${INITRAMFSDIR}
 		if [ "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
 			fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage-bundle ""
 			ln -sf fitImage-bundle ${B}/${KERNEL_OUTPUT_DIR}/fitImage
@@ -744,7 +766,9 @@ do_assemble_fitimage_initramfs() {
 	fi
 }
 
-addtask assemble_fitimage_initramfs before do_deploy after do_bundle_initramfs
+addtask assemble_fitimage_initramfs after do_preserve_kernel_build
+
+do_assemble_fitimage_initramfs[depends] += "virtual/${TARGET_PREFIX}binutils:do_populate_sysroot"
 
 do_kernel_generate_rsa_keys() {
 	if [ "${UBOOT_SIGN_ENABLE}" = "0" ] && [ "${FIT_GENERATE_KEYS}" = "1" ]; then
@@ -793,20 +817,33 @@ do_kernel_generate_rsa_keys() {
 
 addtask kernel_generate_rsa_keys before do_assemble_fitimage after do_compile
 
-kernel_do_deploy[vardepsexclude] = "DATETIME"
-kernel_do_deploy:append() {
+FITIMGDEPLOYDIR = "${WORKDIR}/fitimage-deploy"
+SSTATETASKS += "do_deploy_fitimage"
+do_deploy_fitimage[sstate-inputdirs] = "${FITIMGDEPLOYDIR}"
+do_deploy_fitimage[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
+
+python do_deploy_fitimage_setscene () {
+        sstate_setscene(d)
+}
+addtask do_deploy_fitimage_setscene
+
+do_deploy_fitimage[dirs] = "${FITIMGDEPLOYDIR} ${INITRAMFSDIR}"
+
+do_deploy_fitimage[vardepsexclude] = "DATETIME"
+do_deploy_fitimage() {
+	deployDir="${FITIMGDEPLOYDIR}"
 	# Update deploy directory
 	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
 
 		if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
 			bbnote "Copying fit-image.its source file..."
-			install -m 0644 ${B}/fit-image.its "$deployDir/fitImage-its-${KERNEL_FIT_NAME}.its"
+			install -m 0644 ${INITRAMFSDIR}/fit-image.its "$deployDir/fitImage-its-${KERNEL_FIT_NAME}.its"
 			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
 				ln -snf fitImage-its-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${KERNEL_FIT_LINK_NAME}"
 			fi
 
 			bbnote "Copying linux.bin file..."
-			install -m 0644 ${B}/linux.bin $deployDir/fitImage-linux.bin-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}
+			install -m 0644 ${INITRAMFSDIR}/linux.bin $deployDir/fitImage-linux.bin-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}
 			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
 				ln -snf fitImage-linux.bin-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT} "$deployDir/fitImage-linux.bin-${KERNEL_FIT_LINK_NAME}"
 			fi
@@ -814,14 +851,14 @@ kernel_do_deploy:append() {
 
 		if [ -n "${INITRAMFS_IMAGE}" ]; then
 			bbnote "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
-			install -m 0644 ${B}/fit-image-${INITRAMFS_IMAGE}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its"
+			install -m 0644 ${INITRAMFSDIR}/fit-image-${INITRAMFS_IMAGE}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its"
 			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
 				ln -snf fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
 			fi
 
 			if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
 				bbnote "Copying fitImage-${INITRAMFS_IMAGE} file..."
-				install -m 0644 ${B}/${KERNEL_OUTPUT_DIR}/fitImage-${INITRAMFS_IMAGE} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}"
+				install -m 0644 ${INITRAMFSDIR}/${KERNEL_OUTPUT_DIR}/fitImage-${INITRAMFS_IMAGE} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}"
 				if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
 					ln -snf fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
 				fi
@@ -829,3 +866,5 @@ kernel_do_deploy:append() {
 		fi
 	fi
 }
+
+addtask do_deploy_fitimage before do_build after do_deploy do_assemble_fitimage_initramfs
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 7bb3449..f2efb3e 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -140,7 +140,7 @@ set -e
     # If the INTIRAMFS_IMAGE is set but the INITRAMFS_IMAGE_BUNDLE is set to 0,
     # the do_bundle_initramfs does nothing, but the INITRAMFS_IMAGE is built
     # standalone for use by wic and other tools.
-    if image:
+    if image and 'fitImage' not in d.getVar('KERNEL_IMAGETYPES'):
         if d.getVar('INITRAMFS_MULTICONFIG'):
             d.appendVarFlag('do_bundle_initramfs', 'mcdepends', ' mc::${INITRAMFS_MULTICONFIG}:${INITRAMFS_IMAGE}:do_image_complete')
         else:
-- 
1.8.3.1


