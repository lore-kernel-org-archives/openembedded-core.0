Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 303 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 21 Apr 2017 10:44:57 UTC
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id A2E6077A50
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 10:44:57 +0000 (UTC)
Received: by p910.zcs.saftware.de (Postfix, from userid 1000)
	id 00B28AD0070B; Fri, 21 Apr 2017 12:39:51 +0200 (CEST)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Apr 2017 12:39:51 +0200
Message-Id: <1492771191-4445-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] Revert "kernel: Fix symlinks"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Apr 2017 10:44:57 -0000

This reverts commit c7bc46b9bc29dd0953ab8d63b50fa105bb66892e.

It broke dpkg's update-alternatives, which requires absolute paths.

| update-alternatives: error: alternative path is not absolute as it should be

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/classes/kernel.bbclass             | 6 +++---
 meta/recipes-kernel/linux/linux-dtb.inc | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 12a748d..8cf357f 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -49,11 +49,10 @@ python __anonymous () {
 
     for type in types.split():
         typelower = type.lower()
-        imagedest = d.getVar('KERNEL_IMAGEDEST')
 
         d.appendVar('PACKAGES', ' ' + 'kernel-image-' + typelower)
 
-        d.setVar('FILES_kernel-image-' + typelower, '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME}')
+        d.setVar('FILES_kernel-image-' + typelower, '/boot/' + type + '-${KERNEL_VERSION_NAME}')
 
         d.appendVar('RDEPENDS_kernel-image', ' ' + 'kernel-image-' + typelower)
 
@@ -61,8 +60,9 @@ python __anonymous () {
 
         d.setVar('ALLOW_EMPTY_kernel-image-' + typelower, '1')
 
+        imagedest = d.getVar('KERNEL_IMAGEDEST')
         priority = d.getVar('KERNEL_PRIORITY')
-        postinst = '#!/bin/sh\n' + 'update-alternatives --install /' + imagedest + '/' + type + ' ' + type + ' ' + type + '-${KERNEL_VERSION_NAME} ' + priority + ' || true' + '\n'
+        postinst = '#!/bin/sh\n' + 'update-alternatives --install /' + imagedest + '/' + type + ' ' + type + ' ' + '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME} ' + priority + ' || true' + '\n'
         d.setVar('pkg_postinst_kernel-image-' + typelower, postinst)
 
         postrm = '#!/bin/sh\n' + 'update-alternatives --remove' + ' ' + type + ' ' + type + '-${KERNEL_VERSION_NAME} || true' + '\n'
diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 22e374f..41aad7c 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -63,7 +63,7 @@ pkg_postinst_kernel-devicetree () {
 			DTB_EXT=${DTB##*.}
 			DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
 			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
-			update-alternatives --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.${DTB_EXT} ${DTB_BASE_NAME}.${DTB_EXT} devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
+			update-alternatives --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.${DTB_EXT} ${DTB_BASE_NAME}.${DTB_EXT} /boot/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
 		done
 	done
 }
@@ -76,7 +76,7 @@ pkg_postrm_kernel-devicetree () {
 			DTB_EXT=${DTB##*.}
 			DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
 			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
-			update-alternatives --remove ${DTB_BASE_NAME}.${DTB_EXT} devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
+			update-alternatives --remove ${DTB_BASE_NAME}.${DTB_EXT} /boot/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
 		done
 	done
 }
-- 
2.7.4


