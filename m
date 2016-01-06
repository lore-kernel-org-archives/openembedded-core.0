Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 20B61731EF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 22:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u06MvtAq023420 for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jan 2016 22:57:55 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TjlmYGCpE-Hs
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 22:57:55 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u06Mvnak023412
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jan 2016 22:57:50 GMT
Message-ID: <1452121069.7598.98.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 06 Jan 2016 22:57:49 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH 4/4] classes: Fix do_rootfs references
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
X-List-Received-Date: Wed, 06 Jan 2016 22:57:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

After the separation of do_rootfs, some rootfs references need changing 
to image_complete.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index 4a7e2b7..624ff38 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -9,8 +9,8 @@ LABELS_append = " ${SYSLINUX_LABELS} "
 
 ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.ext4"
 
-do_bootimg[depends] += "${INITRD_IMAGE}:do_rootfs"
-do_bootimg[depends] += "${PN}:do_rootfs"
+do_bootimg[depends] += "${INITRD_IMAGE}:do_image_complete"
+do_bootimg[depends] += "${PN}:do_image_complete"
 
 inherit bootimg
 
diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image-vm.bbclass
index 575a4b7..d214bf8 100644
--- a/meta/classes/image-vm.bbclass
+++ b/meta/classes/image-vm.bbclass
@@ -6,10 +6,10 @@ LABELS_append = " ${SYSLINUX_LABELS} "
 # Using an initramfs is optional. Enable it by setting INITRD_IMAGE.
 INITRD_IMAGE ?= ""
 INITRD ?= "${@'${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE}-${MACHINE}.cpio.gz' if '${INITRD_IMAGE}' else ''}"
-do_bootdirectdisk[depends] += "${@'${INITRD_IMAGE}:do_rootfs' if '${INITRD_IMAGE}' else ''}"
+do_bootdirectdisk[depends] += "${@'${INITRD_IMAGE}:do_image_complete' if '${INITRD_IMAGE}' else ''}"
 
 # need to define the dependency and the ROOTFS for directdisk
-do_bootdirectdisk[depends] += "${PN}:do_rootfs"
+do_bootdirectdisk[depends] += "${PN}:do_image_complete"
 ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.ext4"
 
 # creating VM images relies on having a hddimg so ensure we inherit it here.
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 7cf2da3..c405d99 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -167,7 +167,7 @@ python () {
     initramfs_image = d.getVar('INITRAMFS_IMAGE', True) or ""
     if initramfs_image != "":
         d.appendVarFlag('do_build', 'depends', " %s:do_bundle_initramfs" %  d.getVar('PN', True))
-        d.appendVarFlag('do_bundle_initramfs', 'depends', " %s:do_rootfs" % initramfs_image)
+        d.appendVarFlag('do_bundle_initramfs', 'depends', " %s:do_image_complete" % initramfs_image)
 }
 
 IMAGE_CLASSES += "image_types"
@@ -488,4 +488,4 @@ do_bundle_initramfs[noexec] = "1"
 do_bundle_initramfs () {
 	:
 }
-addtask bundle_initramfs after do_rootfs
+addtask bundle_initramfs after do_image_complete
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index afe8d0c..c74f7cc 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -93,7 +93,7 @@ IMAGE_CMD_squashfs-lzo = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE
 IMAGE_CMD_TAR ?= "tar"
 IMAGE_CMD_tar = "${IMAGE_CMD_TAR} -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar -C ${IMAGE_ROOTFS} ."
 
-do_rootfs[cleandirs] += "${WORKDIR}/cpio_append"
+do_image_cpio[cleandirs] += "${WORKDIR}/cpio_append"
 IMAGE_CMD_cpio () {
 	(cd ${IMAGE_ROOTFS} && find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
 	if [ ! -L ${IMAGE_ROOTFS}/init -a ! -e ${IMAGE_ROOTFS}/init ]; then
@@ -200,7 +200,7 @@ IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES"
 
 # Rebuild when the wks file changes
 USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c for c in '${COMPRESSIONTYPES}'.split()), '1', '', d)}"
-do_rootfs[file-checksums] += "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
+do_image_wic[file-checksums] += "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
 
 EXTRA_IMAGECMD = ""
 
diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 2a56a54..f1b409c 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -14,7 +14,7 @@ python __anonymous () {
 
         image = d.getVar('INITRAMFS_IMAGE', True)
         if image:
-            d.appendVarFlag('do_assemble_fitimage', 'depends', ' ${INITRAMFS_IMAGE}:do_rootfs')
+            d.appendVarFlag('do_assemble_fitimage', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
 }
 
 #
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 4ce1611..997376d 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -25,7 +25,7 @@ python __anonymous () {
 
     image = d.getVar('INITRAMFS_IMAGE', True)
     if image:
-        d.appendVarFlag('do_bundle_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_rootfs')
+        d.appendVarFlag('do_bundle_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
 
     # NOTE: setting INITRAMFS_TASK is for backward compatibility
     #       The preferred method is to set INITRAMFS_IMAGE, because
diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 0012e8c..c647d88 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -67,6 +67,10 @@ do_rm_work () {
                i=dummy
                break
                ;;
+            *do_image*)
+               i=dummy
+               break
+               ;;
             *do_build*)
                 i=dummy
                 break
@@ -108,7 +112,7 @@ rm_work_populatesdk () {
 }
 rm_work_populatesdk[cleandirs] = "${WORKDIR}/sdk"
 
-do_rootfs[postfuncs] += "rm_work_rootfs"
+do_image_complete[postfuncs] += "rm_work_rootfs"
 rm_work_rootfs () {
     :
 }
diff --git a/meta/classes/testimage-auto.bbclass b/meta/classes/testimage-auto.bbclass
index 860599d..e0a22b7 100644
--- a/meta/classes/testimage-auto.bbclass
+++ b/meta/classes/testimage-auto.bbclass
@@ -18,6 +18,6 @@ inherit testimage
 python do_testimage_auto() {
     testimage_main(d)
 }
-addtask testimage_auto before do_build after do_rootfs
+addtask testimage_auto before do_build after do_image_complete
 do_testimage_auto[depends] += "${TESTIMAGEDEPENDS}"
 do_testimage_auto[lockfiles] += "${TESTIMAGELOCK}"



