Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 993C971A54
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 19:58:23 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP; 11 Jan 2017 11:58:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="807758391"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Jan 2017 11:58:23 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jan 2017 19:55:20 +0000
Message-Id: <b15cc7cffbf3ef385dd6c4afb8f3d80d37082576.1484164023.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1484164023.git.alejandro.hernandez@linux.intel.com>
References: <cover.1484164023.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1484164023.git.alejandro.hernandez@linux.intel.com>
References: <cover.1484164023.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 3/7] image-.bbclass: standarize usage of DEPLOY_DIR_IMAGE
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
X-List-Received-Date: Wed, 11 Jan 2017 19:58:23 -0000

Since wic now looks for boot artifacts on DEPLOY_DIR_IMAGE,
we need to standarize the usage of this variable and drop
HDDDIR to avoid confusion, which will let us drop support
for hddimg in the future.

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/classes/image-live.bbclass | 18 +++++++++---------
 meta/classes/image-vm.bbclass   | 12 ++++++------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index a3d1b4e..60364e6 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -60,7 +60,7 @@ python() {
         d.appendVarFlag('do_bootimg', 'depends', ' %s:do_image_complete' % initrd_i)
 }
 
-HDDDIR = "${S}/hddimg"
+DEPLOY_DIR_IMAGE = "${S}/hddimg"
 ISODIR = "${S}/iso"
 EFIIMGDIR = "${S}/efi_img"
 COMPACT_ISODIR = "${S}/iso.z"
@@ -230,29 +230,29 @@ build_fat_img() {
 build_hddimg() {
 	# Create an HDD image
 	if [ "${NOHDD}" != "1" ] ; then
-		populate_live ${HDDDIR}
+		populate_live ${DEPLOY_DIR_IMAGE}
 
 		if [ "${PCBIOS}" = "1" ]; then
-			syslinux_hddimg_populate ${HDDDIR}
+			syslinux_hddimg_populate ${DEPLOY_DIR_IMAGE}
 		fi
 		if [ "${EFI}" = "1" ]; then
-			efi_hddimg_populate ${HDDDIR}
+			efi_hddimg_populate ${DEPLOY_DIR_IMAGE}
 		fi
 
-		# Check the size of ${HDDDIR}/rootfs.img, error out if it
+		# Check the size of ${DEPLOY_DIR_IMAGE}/rootfs.img, error out if it
 		# exceeds 4GB, it is the single file's max size of FAT fs.
-		if [ -f ${HDDDIR}/rootfs.img ]; then
-			rootfs_img_size=`stat -c '%s' ${HDDDIR}/rootfs.img`
+		if [ -f ${DEPLOY_DIR_IMAGE}/rootfs.img ]; then
+			rootfs_img_size=`stat -c '%s' ${DEPLOY_DIR_IMAGE}/rootfs.img`
 			max_size=`expr 4 \* 1024 \* 1024 \* 1024`
 			if [ $rootfs_img_size -gt $max_size ]; then
-				bberror "${HDDDIR}/rootfs.img execeeds 4GB,"
+				bberror "${DEPLOY_DIR_IMAGE}/rootfs.img execeeds 4GB,"
 				bberror "this doesn't work on FAT filesystem, you can try either of:"
 				bberror "1) Reduce the size of rootfs.img"
 				bbfatal "2) Use iso, vmdk or vdi to instead of hddimg\n"
 			fi
 		fi
 
-		build_fat_img ${HDDDIR} ${IMGDEPLOYDIR}/${IMAGE_NAME}.hddimg
+		build_fat_img ${DEPLOY_DIR_IMAGE} ${IMGDEPLOYDIR}/${IMAGE_NAME}.hddimg
 
 		if [ "${PCBIOS}" = "1" ]; then
 			syslinux_hddimg_install
diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image-vm.bbclass
index 35c9244..5015753 100644
--- a/meta/classes/image-vm.bbclass
+++ b/meta/classes/image-vm.bbclass
@@ -50,26 +50,26 @@ DISK_SIGNATURE ?= "${DISK_SIGNATURE_GENERATED}"
 DISK_SIGNATURE[vardepsexclude] = "DISK_SIGNATURE_GENERATED"
 
 build_boot_dd() {
-	HDDDIR="${S}/hdd/boot"
+	DEPLOY_DIR_IMAGE="${S}/hdd/boot"
 	HDDIMG="${S}/hdd.image"
 	IMAGE=${IMGDEPLOYDIR}/${IMAGE_NAME}.hdddirect
 
-	populate_kernel $HDDDIR
+	populate_kernel $DEPLOY_DIR_IMAGE
 
 	if [ "${PCBIOS}" = "1" ]; then
-		syslinux_hddimg_populate $HDDDIR
+		syslinux_hddimg_populate $DEPLOY_DIR_IMAGE
 	fi
 	if [ "${EFI}" = "1" ]; then
-		efi_hddimg_populate $HDDDIR
+		efi_hddimg_populate $DEPLOY_DIR_IMAGE
 	fi
 
-	BLOCKS=`du -bks $HDDDIR | cut -f 1`
+	BLOCKS=`du -bks $DEPLOY_DIR_IMAGE | cut -f 1`
 	BLOCKS=`expr $BLOCKS + ${BOOTDD_EXTRA_SPACE}`
 
 	# Remove it since mkdosfs would fail when it exists
 	rm -f $HDDIMG
 	mkdosfs -n ${BOOTDD_VOLUME_ID} -S 512 -C $HDDIMG $BLOCKS 
-	mcopy -i $HDDIMG -s $HDDDIR/* ::/
+	mcopy -i $HDDIMG -s $DEPLOY_DIR_IMAGE/* ::/
 
 	if [ "${PCBIOS}" = "1" ]; then
 		syslinux_hdddirect_install $HDDIMG
-- 
2.6.6


