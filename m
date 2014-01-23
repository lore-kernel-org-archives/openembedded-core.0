Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0A4956C765
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 06:50:15 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Jan 2014 22:50:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,704,1384329600"; d="scan'208";a="469462983"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jan 2014 22:50:15 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	joaohf@gmail.com
Date: Wed, 22 Jan 2014 22:50:14 -0800
Message-Id: <1390459814-15764-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] boot-directdisk: fix the support of vmdk
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
X-List-Received-Date: Thu, 23 Jan 2014 06:50:15 -0000

From: Joao Henrique Ferreira de Freitas <joaohf@gmail.com>

Previous change (086ce22b88f5ef5f75a83119a32c8b3fdcfa296d) broke
the creating of vmdk images. This protects shell expansion variables
and let dd generate the image to be transformed to vmdk by image-vmdk.class.

Signed-off-by: Joao Henrique Ferreira de Freitas <joaohf@gmail.com>

[edit to change the usage of IMAGE_FSTYPE to IS_VMDK]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/boot-directdisk.bbclass | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index 3277666..afab843 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -61,6 +61,8 @@ DISK_SIGNATURE ?= "${DISK_SIGNATURE_GENERATED}"
 SYSLINUX_ROOT ?= "root=/dev/sda2"
 SYSLINUX_TIMEOUT ?= "10"
 
+IS_VMDK = '${@base_contains("IMAGE_FSTYPES", "vmdk", "true", "false", d)}'
+
 boot_direct_populate() {
 	dest=$1
 	install -d $dest
@@ -88,10 +90,10 @@ build_boot_dd() {
 		grubefi_hddimg_populate $HDDDIR
 	fi
 
-	if [ ${IMAGE_FSTYPE} = "vmdk" ]; then
-		if [ x${AUTO_SYSLINUXMENU} = x1 ] ; then
+	if [ "${IS_VMDK}" ]; then
+		if [ "x${AUTO_SYSLINUXMENU}" = "x1" ] ; then
 			install -m 0644 ${STAGING_DIR}/${MACHINE}/usr/share/syslinux/vesamenu.c32 ${HDDDIR}${SYSLINUXDIR}/vesamenu.c32
-			if [ x${SYSLINUX_SPLASH} != x ] ; then
+			if [ "x${SYSLINUX_SPLASH}" != "x" ] ; then
 				install -m 0644 ${SYSLINUX_SPLASH} ${HDDDIR}${SYSLINUXDIR}/splash.lss
 			fi
 		fi
@@ -129,9 +131,7 @@ build_boot_dd() {
 	parted $IMAGE unit B mkpart primary ext2 ${END2}B ${END3}B
 	parted $IMAGE set 1 boot on 
 
-	if [ ${IMAGE_FSTYPE} != "vmdk" ]; then
-		parted $IMAGE print
-	fi
+	parted $IMAGE print
 
 	awk "BEGIN { printf \"$(echo ${DISK_SIGNATURE} | fold -w 2 | tac | paste -sd '' | sed 's/\(..\)/\\x&/g')\" }" | \
 		dd of=$IMAGE bs=1 seek=440 conv=notrunc
@@ -141,10 +141,8 @@ build_boot_dd() {
 		dd if=${STAGING_DATADIR}/syslinux/mbr.bin of=$IMAGE conv=notrunc
 	fi
 
-	if [ ${IMAGE_FSTYPE} != "vmdk" ]; then
-		dd if=$HDDIMG of=$IMAGE conv=notrunc seek=1 bs=512
-		dd if=${ROOTFS} of=$IMAGE conv=notrunc seek=$OFFSET bs=512	
-	fi
+	dd if=$HDDIMG of=$IMAGE conv=notrunc seek=1 bs=512
+	dd if=${ROOTFS} of=$IMAGE conv=notrunc seek=$OFFSET bs=512
 
 	cd ${DEPLOY_DIR_IMAGE}
 	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect
-- 
1.8.3.1


