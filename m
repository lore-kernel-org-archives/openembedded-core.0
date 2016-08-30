Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1B29670022
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 09:31:06 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 30 Aug 2016 02:31:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,255,1470726000"; d="scan'208";a="162395246"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 30 Aug 2016 02:31:07 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 6BC4F6A4080
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 02:30:47 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Aug 2016 12:29:35 +0300
Message-Id: <ac2920ea56a5c1edbb8f131d916450c876f04d05.1472548574.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1472548574.git.ed.bartosh@linux.intel.com>
References: <cover.1472548574.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1472548574.git.ed.bartosh@linux.intel.com>
References: <cover.1472548574.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 02/18] image-vm.bbclass: deploy images to DEPLOYDIR
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
X-List-Received-Date: Tue, 30 Aug 2016 09:31:10 -0000

Changed deployment directory from DEPLOY_DIR_IMAGE to DEPLOYDIR
to make sstate machinery to do final deployment and generate
manifest.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image-vm.bbclass | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image-vm.bbclass
index bf57e2c..2a86b40 100644
--- a/meta/classes/image-vm.bbclass
+++ b/meta/classes/image-vm.bbclass
@@ -33,14 +33,14 @@ IMAGE_TYPEDEP_hdddirect = "${VM_ROOTFS_TYPE}"
 IMAGE_TYPES_MASKED += "vmdk vdi qcow2 hdddirect"
 
 VM_ROOTFS_TYPE ?= "ext4"
-ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.${VM_ROOTFS_TYPE}"
+ROOTFS ?= "${DEPLOYDIR}/${IMAGE_LINK_NAME}.${VM_ROOTFS_TYPE}"
 
 # Used by bootloader
 LABELS_VM ?= "boot"
 ROOT_VM ?= "root=/dev/sda2"
 # Using an initramfs is optional. Enable it by setting INITRD_IMAGE_VM.
 INITRD_IMAGE_VM ?= ""
-INITRD_VM ?= "${@'${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_VM}-${MACHINE}.cpio.gz' if '${INITRD_IMAGE_VM}' else ''}"
+INITRD_VM ?= "${@'${DEPLOYDIR}/${INITRD_IMAGE_VM}-${MACHINE}.cpio.gz' if '${INITRD_IMAGE_VM}' else ''}"
 do_bootdirectdisk[depends] += "${@'${INITRD_IMAGE_VM}:do_image_complete' if '${INITRD_IMAGE_VM}' else ''}"
 
 BOOTDD_VOLUME_ID   ?= "boot"
@@ -52,7 +52,7 @@ DISK_SIGNATURE[vardepsexclude] = "DISK_SIGNATURE_GENERATED"
 build_boot_dd() {
 	HDDDIR="${S}/hdd/boot"
 	HDDIMG="${S}/hdd.image"
-	IMAGE=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hdddirect
+	IMAGE=${DEPLOYDIR}/${IMAGE_NAME}.hdddirect
 
 	populate_kernel $HDDDIR
 
@@ -104,13 +104,13 @@ build_boot_dd() {
 	dd if=$HDDIMG of=$IMAGE conv=notrunc seek=1 bs=512
 	dd if=${ROOTFS} of=$IMAGE conv=notrunc seek=$OFFSET bs=512
 
-	cd ${DEPLOY_DIR_IMAGE}
+	cd ${DEPLOYDIR}
 
-	if [ "${RM_OLD_IMAGE}" = "1" ] && [ -L ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect ]; then
-		rm -f $(readlink -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect)
+	if [ "${RM_OLD_IMAGE}" = "1" ] && [ -L ${DEPLOYDIR}/${IMAGE_LINK_NAME}.hdddirect ]; then
+		rm -f $(readlink -f ${DEPLOYDIR}/${IMAGE_LINK_NAME}.hdddirect)
 	fi
 
-	ln -sf ${IMAGE_NAME}.hdddirect ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect
+	ln -sf ${IMAGE_NAME}.hdddirect ${DEPLOYDIR}/${IMAGE_LINK_NAME}.hdddirect
 } 
 
 python do_bootdirectdisk() {
@@ -145,13 +145,13 @@ DISK_SIGNATURE_GENERATED := "${@generate_disk_signature()}"
 
 run_qemu_img (){
     type="$1"
-    qemu-img convert -O $type ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.$type
+    qemu-img convert -O $type ${DEPLOYDIR}/${IMAGE_LINK_NAME}.hdddirect ${DEPLOYDIR}/${IMAGE_NAME}.$type
 
-    if [ "${RM_OLD_IMAGE}" = "1" ] && [ -L ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.$type ]; then
-        rm -f $(readlink -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.$type)
+    if [ "${RM_OLD_IMAGE}" = "1" ] && [ -L ${DEPLOYDIR}/${IMAGE_LINK_NAME}.$type ]; then
+        rm -f $(readlink -f ${DEPLOYDIR}/${IMAGE_LINK_NAME}.$type)
     fi
 
-    ln -sf ${IMAGE_NAME}.$type ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.$type
+    ln -sf ${IMAGE_NAME}.$type ${DEPLOYDIR}/${IMAGE_LINK_NAME}.$type
 }
 create_vmdk_image () {
     run_qemu_img vmdk
-- 
2.1.4


