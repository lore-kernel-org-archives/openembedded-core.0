Return-Path: <chee.yang.lee@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 2D0DB7CFA4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 08:09:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 May 2019 01:09:45 -0700
X-ExtLoop1: 1
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga006.fm.intel.com with ESMTP; 31 May 2019 01:09:44 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2019 16:09:44 +0800
Message-Id: <1559290184-54222-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-intel][PATCH v2] wic: add image-installer.wks.in
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
X-List-Received-Date: Fri, 31 May 2019 08:09:44 -0000

From: Chee Yang Lee <chee.yang.lee@intel.com>

This wks.in create image that perform installation similar to hddimg.
Partition in ext4 format allow rootfs size to be greater than hddimg
limit which is  4GB.

To build simple installer image, add below configuration to local.conf:

WKS_FILE = "image-installer.wks.in"
IMAGE_FSTYPES_append = " ext4"
IMAGE_TYPEDEP_wic = "ext4"
INITRD_IMAGE_LIVE="core-image-minimal-initramfs"
do_image_wic[depends] += "${INITRD_IMAGE_LIVE}:do_image_complete"
do_rootfs[depends] += "virtual/kernel:do_deploy"
IMAGE_BOOT_FILES_append = "\
    ${KERNEL_IMAGETYPE} \
    microcode.cpio \
    systemd-bootx64.efi;EFI/BOOT/bootx64.efi \
    ${IMAGE_ROOTFS}/boot/loader/loader.conf;loader/loader.conf \
    ${IMAGE_ROOTFS}/boot/loader/entries/boot.conf;loader/entries/boot.conf \
    ${IMGDEPLOYDIR}/${IMAGE_BASENAME}-${MACHINE}.ext4;rootfs.img \
    "

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 wic/image-installer.wks.in | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 wic/image-installer.wks.in

diff --git a/wic/image-installer.wks.in b/wic/image-installer.wks.in
new file mode 100644
index 0000000..58bcfd5
--- /dev/null
+++ b/wic/image-installer.wks.in
@@ -0,0 +1,8 @@
+# create an installer disk image
+# populate content to install using IMAGE_BOOT_FILES
+
+part /boot --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER},title=install,label=install-efi,initrd=${INITRD_IMAGE_LIVE}-${MACHINE}.${INITRAMFS_FSTYPES}" --ondisk sda --label install --active --align 1024 --use-uuid
+
+part / --source bootimg-partition --ondisk sda --fstype=ext4 --label image --use-uuid --align 1024
+
+bootloader --ptable gpt --timeout=5 --append="rootwait ${APPEND}"
-- 
2.7.4


