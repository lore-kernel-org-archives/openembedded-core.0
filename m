Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C06E06AC3A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 20:44:36 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 30 Jan 2015 12:44:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="447705918"
Received: from cmfiguer-mobl.amr.corp.intel.com (HELO
	swold-mobl5.amr.corp.intel.com) ([10.252.248.194])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Jan 2015 12:30:24 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Jan 2015 12:44:11 -0800
Message-Id: <1422650651-21474-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] btrfs: create an empty file to build the fs in
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
X-List-Received-Date: Fri, 30 Jan 2015 20:44:40 -0000

The newer btrfs-utils needs an empty file to build the filesystem in, so
create an empty file and use it for the mkfs to build the fs in.

[YOCTO #6804]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/image_types.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 0c27f29..d6cc87f 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -59,8 +59,8 @@ IMAGE_CMD_ext3 = "oe_mkext234fs ext3 ${EXTRA_IMAGECMD}"
 IMAGE_CMD_ext4 = "oe_mkext234fs ext4 ${EXTRA_IMAGECMD}"
 
 IMAGE_CMD_btrfs () {
-	touch ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.btrfs
-	mkfs.btrfs -b `expr ${ROOTFS_SIZE} \* 1024` ${EXTRA_IMAGECMD} -r ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.btrfs
+	dd if=/dev/zero of=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.btrfs count=${ROOTFS_SIZE} bs=1024
+	mkfs.btrfs ${EXTRA_IMAGECMD} -r ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.btrfs
 }
 
 IMAGE_CMD_squashfs = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs ${EXTRA_IMAGECMD} -noappend"
-- 
2.1.0


