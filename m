Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob18.myregisteredsite.com
	(atl4mhob18.myregisteredsite.com [209.17.115.111])
	by mail.openembedded.org (Postfix) with ESMTP id A847D65F37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 10:12:05 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.208])
	by atl4mhob18.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	s7BAC5Nu028194 for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 06:12:05 -0400
Received: (qmail 16022 invoked by uid 0); 11 Aug 2014 10:12:05 -0000
X-TCPREMOTEIP: 88.159.208.100
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO paradigit.TOPIC.LOCAL)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 11 Aug 2014 10:12:04 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Aug 2014 12:12:00 +0200
Message-Id: <1407751920-9684-2-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1407751920-9684-1-git-send-email-mike.looijmans@topic.nl>
References: <1407751920-9684-1-git-send-email-mike.looijmans@topic.nl>
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH 2/2] Support image type "squashfs-lzo"
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
X-List-Received-Date: Mon, 11 Aug 2014 10:12:11 -0000

Add "squashfs-lzo" to the image types. LZO compression support has been
in both kernel and squashfs tools for many years, but OE never enabled
it.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta/classes/image_types.bbclass |   16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 54ecb15..e7d48c2 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -176,6 +176,7 @@ IMAGE_CMD_btrfs () {
 }
 
 IMAGE_CMD_squashfs = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs ${EXTRA_IMAGECMD} -noappend"
+IMAGE_CMD_squashfs-lzo = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-lzo ${EXTRA_IMAGECMD} -noappend -comp lzo"
 IMAGE_CMD_squashfs-xz = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-xz ${EXTRA_IMAGECMD} -noappend -comp xz"
 IMAGE_CMD_tar = "cd ${IMAGE_ROOTFS} && tar -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar ."
 
@@ -201,12 +202,12 @@ IMAGE_CMD_elf () {
 UBI_VOLNAME ?= "${MACHINE}-rootfs"
 
 IMAGE_CMD_ubi () {
-	echo \[ubifs\] > ubinize.cfg 
+	echo \[ubifs\] > ubinize.cfg
 	echo mode=ubi >> ubinize.cfg
-	echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs >> ubinize.cfg 
-	echo vol_id=0 >> ubinize.cfg 
-	echo vol_type=dynamic >> ubinize.cfg 
-	echo vol_name=${UBI_VOLNAME} >> ubinize.cfg 
+	echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs >> ubinize.cfg
+	echo vol_id=0 >> ubinize.cfg
+	echo vol_type=dynamic >> ubinize.cfg
+	echo vol_name=${UBI_VOLNAME} >> ubinize.cfg
 	echo vol_flags=autoresize >> ubinize.cfg
 	mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS} && ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS} ubinize.cfg
 }
@@ -235,13 +236,14 @@ IMAGE_DEPENDS_ext3 = "e2fsprogs-native"
 IMAGE_DEPENDS_ext4 = "e2fsprogs-native"
 IMAGE_DEPENDS_btrfs = "btrfs-tools-native"
 IMAGE_DEPENDS_squashfs = "squashfs-tools-native"
+IMAGE_DEPENDS_squashfs-lzo = "squashfs-tools-native"
 IMAGE_DEPENDS_squashfs-xz = "squashfs-tools-native"
 IMAGE_DEPENDS_elf = "virtual/kernel mkelfimage-native"
 IMAGE_DEPENDS_ubi = "mtd-utils-native"
 IMAGE_DEPENDS_ubifs = "mtd-utils-native"
 
 # This variable is available to request which values are suitable for IMAGE_FSTYPES
-IMAGE_TYPES = "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma btrfs iso hddimg squashfs squashfs-xz ubi ubifs tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma vmdk elf"
+IMAGE_TYPES = "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma btrfs iso hddimg squashfs squashfs-lzo squashfs-xz ubi ubifs tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma vmdk elf"
 
 COMPRESSIONTYPES = "gz bz2 lzma xz"
 COMPRESS_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}.rootfs.${type}"
@@ -256,7 +258,7 @@ COMPRESS_DEPENDS_xz = "xz-native"
 RUNNABLE_IMAGE_TYPES ?= "ext2 ext3"
 RUNNABLE_MACHINE_PATTERNS ?= "qemu"
 
-DEPLOYABLE_IMAGE_TYPES ?= "hddimg iso" 
+DEPLOYABLE_IMAGE_TYPES ?= "hddimg iso"
 
 # Use IMAGE_EXTENSION_xxx to map image type 'xxx' with real image file extension name(s) for Hob
 IMAGE_EXTENSION_live = "hddimg iso"
-- 
1.7.9.5


