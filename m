Return-Path: <raymond.tan@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 955AF76643
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 05:51:18 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 16 May 2016 22:51:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,323,1459839600"; d="scan'208";a="978454407"
Received: from flexuser-devmachine.png.intel.com ([172.30.196.15])
	by orsmga002.jf.intel.com with ESMTP; 16 May 2016 22:51:18 -0700
From: Raymond Tan <raymond.tan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 May 2016 13:41:09 +0800
Message-Id: <1463463669-23155-1-git-send-email-raymond.tan@intel.com>
X-Mailer: git-send-email 2.8.2
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [meta-oe][PATCH] mkefidisk.sh: mount images as read-only
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
X-List-Received-Date: Tue, 17 May 2016 05:51:24 -0000

Mount the hddimg and rootfs.img as read-only when creating the bootable
image on the medium. Otherwise, the md5 checksum values of the hddimg will
be altered. As this changed checksum value might cause issue for users
whom would reuse the hddimg.

Signed-off-by: Raymond Tan <raymond.tan@intel.com>
---
 scripts/contrib/mkefidisk.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index 333284f..d8db3c0 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -369,8 +369,8 @@ mkswap $SWAP >$OUT 2>&1 || die "Failed to prepare swap"
 # Installing to $DEVICE
 #
 debug "Mounting images and device in preparation for installation"
-mount -o loop $HDDIMG $HDDIMG_MNT >$OUT 2>&1 || error "Failed to mount $HDDIMG"
-mount -o loop $HDDIMG_MNT/rootfs.img $HDDIMG_ROOTFS_MNT >$OUT 2>&1 || error "Failed to mount rootfs.img"
+mount -o ro,loop $HDDIMG $HDDIMG_MNT >$OUT 2>&1 || error "Failed to mount $HDDIMG"
+mount -o ro,loop $HDDIMG_MNT/rootfs.img $HDDIMG_ROOTFS_MNT >$OUT 2>&1 || error "Failed to mount rootfs.img"
 mount $ROOTFS $ROOTFS_MNT >$OUT 2>&1 || error "Failed to mount $ROOTFS on $ROOTFS_MNT"
 mount $BOOTFS $BOOTFS_MNT >$OUT 2>&1 || error "Failed to mount $BOOTFS on $BOOTFS_MNT"
 
-- 
2.8.2


