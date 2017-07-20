Return-Path: <tom.rini@gmail.com>
Received: from mail-yb0-f196.google.com (mail-yb0-f196.google.com
	[209.85.213.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6DD9E78308
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 22:42:42 +0000 (UTC)
Received: by mail-yb0-f196.google.com with SMTP id z37so1216111ybh.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 15:42:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=FbPCz0RuDdya08qDveKHcLA5Wd+Jmhu1iMtkQqu9teE=;
	b=T5CkeBMT++nnTen09XhFJDnahgS8bGKRdczV1qIGQt2QriblGVxnTazE7QRtqZxGKf
	/IR7JbIVcTtEzr8Rmq6xBoLZwstz0aySXe52iAp4xNxm78DZTPamXqY6egd3K29l6cqJ
	3shvS4GpVMmc/sFHwsMLdlDKs355RoK3LH9xqqkZ78oo38WpMy9qKgCULlEuDPEeoWur
	7Vhyiu+jq7nmcD7PRPdgh8lrRlwboput0sG+FchkA/sOnXnVL8sE+RSplguZ0b8CIpnn
	j5qp335Iy1Yo8kKHvel6VVk+eKqmkjNEriC974yx8wma8vy/JvAjjNgZvKfKy+iOHPeK
	6SOg==
X-Gm-Message-State: AIVw112vMQmq4VhbTZS1CIuQP29tz7u+4ITGADhqgiXk5l+j7DIX6CQa
	y3COR+NyQYzaF87w
X-Received: by 10.37.76.193 with SMTP id z184mr5095855yba.34.1500590563088;
	Thu, 20 Jul 2017 15:42:43 -0700 (PDT)
Received: from localhost.localdomain (cpe-174-106-0-58.ec.res.rr.com.
	[174.106.0.58])
	by smtp.gmail.com with ESMTPSA id w7sm1229574yww.33.2017.07.20.15.42.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 20 Jul 2017 15:42:42 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 18:43:50 -0400
Message-Id: <1500590631-2028-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/2] image-vm: Convert vmdk/vdi/qcow2/hdddirect images to IMAGE_CMD
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
X-List-Received-Date: Thu, 20 Jul 2017 22:42:42 -0000

The support for writing vmdk/vdi/qcow2 images has not been converted to make
use of the IMAGE_CMD infrastructure and instead relies on custom logic for
adding tasks in the right place.  Convert these images to making use of
IMAGE_CMD.  This mainly involves re-listing some of the depends to the new task
names.  We clarify that only hdddirect images depend on the value of
VM_ROOTFS_TYPE and then that vmdk/vdi/qcow2 depend on that.  We convert the old
do_bootdirectdisk task into a python function, boot_direct_disk_prep that we
call from build_boot_dd().  An important side-effect of this is that we now get
free compression on these image types.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
 meta/classes/image-vm.bbclass                      | 74 ++++++++--------------
 meta/classes/image_types.bbclass                   |  2 +-
 .../images/build-appliance-image_15.0.0.bb         |  2 +-
 3 files changed, 27 insertions(+), 51 deletions(-)

diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image-vm.bbclass
index b52df9fbf5a1..a888f0232caa 100644
--- a/meta/classes/image-vm.bbclass
+++ b/meta/classes/image-vm.bbclass
@@ -17,21 +17,26 @@
 
 inherit live-vm-common
 
-do_bootdirectdisk[depends] += "dosfstools-native:do_populate_sysroot \
-                               virtual/kernel:do_deploy \
-                               syslinux:do_populate_sysroot \
-                               syslinux-native:do_populate_sysroot \
-                               parted-native:do_populate_sysroot \
-                               mtools-native:do_populate_sysroot \
-                               ${PN}:do_image_${VM_ROOTFS_TYPE} \
-                               "
-
-IMAGE_TYPEDEP_vmdk = "${VM_ROOTFS_TYPE}"
-IMAGE_TYPEDEP_vdi = "${VM_ROOTFS_TYPE}"
-IMAGE_TYPEDEP_qcow2 = "${VM_ROOTFS_TYPE}"
+do_image_vmdk[depends] += "qemu-native:do_populate_sysroot"
+do_image_vdi[depends] += "qemu-native:do_populate_sysroot"
+do_image_qcow2[depends] += "qemu-native:do_populate_sysroot"
+do_image_hdddirect[depends] += "dosfstools-native:do_populate_sysroot \
+                                virtual/kernel:do_deploy \
+                                syslinux:do_populate_sysroot \
+                                syslinux-native:do_populate_sysroot \
+                                parted-native:do_populate_sysroot \
+                                mtools-native:do_populate_sysroot \
+                                ${PN}:do_image_${VM_ROOTFS_TYPE} \
+                                "
+
+IMAGE_CMD_vmdk = "run_qemu_img vmdk"
+IMAGE_TYPEDEP_vmdk = "hdddirect"
+IMAGE_CMD_vdi = "run_qemu_img vdi"
+IMAGE_TYPEDEP_vdi = "hdddirect"
+IMAGE_CMD_qcow2 = "run_qemu_img qcow2"
+IMAGE_TYPEDEP_qcow2 = "hdddirect"
+IMAGE_CMD_hdddirect = "build_boot_dd"
 IMAGE_TYPEDEP_hdddirect = "${VM_ROOTFS_TYPE}"
-IMAGE_TYPES_MASKED += "vmdk vdi qcow2 hdddirect"
-
 VM_ROOTFS_TYPE ?= "ext4"
 ROOTFS ?= "${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.${VM_ROOTFS_TYPE}"
 
@@ -50,9 +55,11 @@ DISK_SIGNATURE ?= "${DISK_SIGNATURE_GENERATED}"
 DISK_SIGNATURE[vardepsexclude] = "DISK_SIGNATURE_GENERATED"
 
 build_boot_dd() {
+	${@boot_direct_disk_prep(d)}
+
 	HDDDIR="${S}/hdd/boot"
 	HDDIMG="${S}/hdd.image"
-	IMAGE=${IMGDEPLOYDIR}/${IMAGE_NAME}.hdddirect
+	IMAGE=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.hdddirect
 
 	populate_kernel $HDDDIR
 
@@ -103,21 +110,16 @@ build_boot_dd() {
 
 	dd if=$HDDIMG of=$IMAGE conv=notrunc seek=1 bs=512
 	dd if=${ROOTFS} of=$IMAGE conv=notrunc seek=$OFFSET bs=512
-
-	cd ${IMGDEPLOYDIR}
-
-	ln -sf ${IMAGE_NAME}.hdddirect ${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.hdddirect
 } 
 
-python do_bootdirectdisk() {
+def boot_direct_disk_prep(d):
     validate_disk_signature(d)
     set_live_vm_vars(d, 'VM')
     if d.getVar("PCBIOS") == "1":
         bb.build.exec_func('build_syslinux_cfg', d)
     if d.getVar("EFI") == "1":
         bb.build.exec_func('build_efi_cfg', d)
-    bb.build.exec_func('build_boot_dd', d)
-}
+    return ''
 
 def generate_disk_signature():
     import uuid
@@ -141,31 +143,5 @@ DISK_SIGNATURE_GENERATED := "${@generate_disk_signature()}"
 
 run_qemu_img (){
     type="$1"
-    qemu-img convert -O $type ${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.hdddirect ${IMGDEPLOYDIR}/${IMAGE_NAME}.$type
-
-    ln -sf ${IMAGE_NAME}.$type ${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.$type
-}
-create_vmdk_image () {
-    run_qemu_img vmdk
+    qemu-img convert -O $type ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.hdddirect ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$type
 }
-
-create_vdi_image () {
-    run_qemu_img vdi
-}
-
-create_qcow2_image () {
-    run_qemu_img qcow2
-}
-
-python do_vmimg() {
-    if 'vmdk' in d.getVar('IMAGE_FSTYPES'):
-        bb.build.exec_func('create_vmdk_image', d)
-    if 'vdi' in d.getVar('IMAGE_FSTYPES'):
-        bb.build.exec_func('create_vdi_image', d)
-    if 'qcow2' in d.getVar('IMAGE_FSTYPES'):
-        bb.build.exec_func('create_qcow2_image', d)
-}
-
-addtask bootdirectdisk before do_vmimg
-addtask vmimg after do_bootdirectdisk before do_image_complete
-do_vmimg[depends] += "qemu-native:do_populate_sysroot"
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 8f8d79cd3d70..059c0e73e785 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -302,5 +302,5 @@ RUNNABLE_MACHINE_PATTERNS ?= "qemu"
 DEPLOYABLE_IMAGE_TYPES ?= "hddimg iso" 
 
 # The IMAGE_TYPES_MASKED variable will be used to mask out from the IMAGE_FSTYPES,
-# images that will not be built at do_rootfs time: vmdk, vdi, qcow2, hdddirect, hddimg, iso, etc.
+# images that will not be built at do_rootfs time: hddimg, iso, etc.
 IMAGE_TYPES_MASKED ?= ""
diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index f145b5e6568d..1a5d639f4f04 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -130,4 +130,4 @@ python do_bundle_files() {
     bb.build.exec_func('create_bundle_files', d)
 }
 
-addtask bundle_files after do_vmimg before do_image_complete
+addtask bundle_files after do_image_vmdk before do_image_complete
-- 
1.9.1


