Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob08.myregisteredsite.com
	(atl4mhob08.myregisteredsite.com [209.17.115.46])
	by mail.openembedded.org (Postfix) with ESMTP id DE58A65DB1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 07:55:11 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.206])
	by atl4mhob08.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	s7C7tBXd011384 for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 03:55:11 -0400
Received: (qmail 2375 invoked by uid 0); 12 Aug 2014 07:55:11 -0000
X-TCPREMOTEIP: 88.159.208.100
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO paradigit.TOPIC.LOCAL)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 12 Aug 2014 07:55:11 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Aug 2014 09:54:59 +0200
Message-Id: <1407830099-17923-2-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1407830099-17923-1-git-send-email-mike.looijmans@topic.nl>
References: <1407753199.22187.4.camel@ted>
	<1407830099-17923-1-git-send-email-mike.looijmans@topic.nl>
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH v2 2/2] Support image type "squashfs-lzo"
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
X-List-Received-Date: Tue, 12 Aug 2014 07:55:17 -0000

Add "squashfs-lzo" to the image types. LZO compression support has been
in both kernel and squashfs tools for many years, but OE never enabled
it.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta/classes/image_types.bbclass |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 99a07da..d298897 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -63,6 +63,7 @@ IMAGE_CMD_btrfs () {
 
 IMAGE_CMD_squashfs = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs ${EXTRA_IMAGECMD} -noappend"
 IMAGE_CMD_squashfs-xz = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-xz ${EXTRA_IMAGECMD} -noappend -comp xz"
+IMAGE_CMD_squashfs-lzo = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-lzo ${EXTRA_IMAGECMD} -noappend -comp lzo"
 IMAGE_CMD_tar = "tar -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar -C ${IMAGE_ROOTFS} ."
 
 IMAGE_CMD_cpio () {
@@ -121,12 +122,13 @@ IMAGE_DEPENDS_ext4 = "e2fsprogs-native"
 IMAGE_DEPENDS_btrfs = "btrfs-tools-native"
 IMAGE_DEPENDS_squashfs = "squashfs-tools-native"
 IMAGE_DEPENDS_squashfs-xz = "squashfs-tools-native"
+IMAGE_DEPENDS_squashfs-lzo = "squashfs-tools-native"
 IMAGE_DEPENDS_elf = "virtual/kernel mkelfimage-native"
 IMAGE_DEPENDS_ubi = "mtd-utils-native"
 IMAGE_DEPENDS_ubifs = "mtd-utils-native"
 
 # This variable is available to request which values are suitable for IMAGE_FSTYPES
-IMAGE_TYPES = "jffs2 jffs2.sum cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma btrfs iso hddimg squashfs squashfs-xz ubi ubifs tar tar.gz tar.bz2 tar.xz tar.lz4 cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 vmdk elf"
+IMAGE_TYPES = "jffs2 jffs2.sum cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma btrfs iso hddimg squashfs squashfs-xz squashfs-lzo ubi ubifs tar tar.gz tar.bz2 tar.xz tar.lz4 cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 vmdk elf"
 
 COMPRESSIONTYPES = "gz bz2 lzma xz lz4 sum"
 COMPRESS_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}.rootfs.${type}"
-- 
1.7.9.5


