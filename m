Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Qy6DB-0007lm-Ct
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Aug 2011 20:05:29 +0200
Received: by gyg4 with SMTP id 4so4601243gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2011 11:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=nngawF3Mu4NjFCRBuKG4L80sp4UaqNwqjOBTFdlt0ms=;
	b=nVyN4llmYQ139xm+VNmhENwijFrG9eFWP4SbVzFhSii+IjKoRPMLBg/63QvwEkmAZa
	INbDIdxJV86IDi9GJ6ox+7eHQ4SHf2Fyq0ssYzlCimRltWc81rHrYBw9pqZLXZDa0rPS
	7ffSEMurzFGc3NMgDYfgw7NRDppSYuJcW/XN8=
Received: by 10.236.191.170 with SMTP id g30mr26498046yhn.117.1314640836761;
	Mon, 29 Aug 2011 11:00:36 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id x42sm199458yhm.79.2011.08.29.11.00.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 29 Aug 2011 11:00:36 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2011 11:00:28 -0700
Message-Id: <1314640829-28570-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 1/2] image_types: add ext4 types from OE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Aug 2011 18:05:30 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/classes/image_types.bbclass |   27 ++++++++++++++++++++++++++-
 1 files changed, 26 insertions(+), 1 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index cd901c1..2bdda41 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -1,4 +1,3 @@
-
 def get_imagecmds(d):
     cmds = "\n"
     old_overrides = bb.data.getVar('OVERRIDES', d, 0)
@@ -61,6 +60,30 @@ IMAGE_CMD_ext3.gz () {
 	rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz
 }
 
+oe_mkext4fs () {
+	genext2fs -b $ROOTFS_SIZE -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} $1
+	tune2fs -O extents,uninit_bg,dir_index,has_journal $1
+	e2fsck -yfDC0 $1 || chk=$?
+	case $chk in
+	0|1|2)
+	    ;;
+	*)
+	    return $chk
+	    ;;
+	esac
+}
+
+IMAGE_CMD_ext4 () {
+	oe_mkext4fs ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4
+}
+IMAGE_CMD_ext4.gz () {
+	rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz && mkdir ${DEPLOY_DIR_IMAGE}/tmp.gz
+	oe_mkext4fs ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4
+	gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4
+	mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4.gz
+	rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz
+}
+
 IMAGE_CMD_btrfs () {
 	mkfs.btrfs -b `expr ${ROOTFS_SIZE} \* 1024` ${EXTRA_IMAGECMD} -r ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.btrfs
 }
@@ -104,6 +127,8 @@ IMAGE_DEPENDS_ext2 = "genext2fs-native"
 IMAGE_DEPENDS_ext2.gz = "genext2fs-native"
 IMAGE_DEPENDS_ext3 = "genext2fs-native e2fsprogs-native"
 IMAGE_DEPENDS_ext3.gz = "genext2fs-native e2fsprogs-native"
+IMAGE_DEPENDS_ext4 = "genext2fs-native e2fsprogs-native"
+IMAGE_DEPENDS_ext4.gz = "genext2fs-native e2fsprogs-native"
 IMAGE_DEPENDS_btrfs = "btrfs-tools-native"
 IMAGE_DEPENDS_squashfs = "squashfs-tools-native"
 IMAGE_DEPENDS_squashfs-lzma = "squashfs-lzma-tools-native"
-- 
1.7.3.2.430.g208247



