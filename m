Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D59CD72DED
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 18:40:15 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 05 Feb 2015 10:33:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,525,1418112000"; d="scan'208";a="523192632"
Received: from swold-mobl.jf.intel.com ([10.24.2.202])
	by orsmga003.jf.intel.com with ESMTP; 05 Feb 2015 10:32:04 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 10:39:48 -0800
Message-Id: <1423161588-6867-11-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1423161588-6867-1-git-send-email-sgw@linux.intel.com>
References: <1423161588-6867-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 10/10] btrfs: create an empty file to build the fs in
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
X-List-Received-Date: Thu, 05 Feb 2015 18:40:16 -0000

The newer btrfs-utils needs an empty file to build the filesystem in, so
create an empty file and use it for the mkfs to build the fs in.

[YOCTO #6804]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/image_types.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 99a07da..1ea2c8f 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -57,8 +57,8 @@ IMAGE_CMD_ext3 = "oe_mkext234fs ext3 ${EXTRA_IMAGECMD}"
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


