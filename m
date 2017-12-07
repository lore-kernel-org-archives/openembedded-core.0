Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7B7C771994
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 03:46:36 +0000 (UTC)
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Dec 2017 19:46:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,370,1508828400"; 
   d="scan'208";a="533400"
Received: from swold-mobl2.jf.intel.com (HELO swold-mobl2.amr.intel.com)
	([10.254.34.148])
	by fmsmga007.fm.intel.com with ESMTP; 06 Dec 2017 19:46:38 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Wed,  6 Dec 2017 19:46:35 -0800
Message-Id: <20171207034635.7353-1-sgw@linux.intel.com>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH] image_types: btrfs use sparse file creation
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
X-List-Received-Date: Thu, 07 Dec 2017 03:46:37 -0000

This will speed up file creation and still allow the btrfs tools to
create a full btrfs image.  This is similar to what we do for ext234
FS types.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index aaba1073a08..ce7699d9b60 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -104,7 +104,7 @@ IMAGE_CMD_btrfs () {
 		size=${MIN_BTRFS_SIZE}
 		bbwarn "Rootfs size is too small for BTRFS. Filesystem will be extended to ${size}K"
 	fi
-	dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.btrfs count=${size} bs=1024
+	dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.btrfs seek=${size} count=0 bs=1024
 	mkfs.btrfs ${EXTRA_IMAGECMD} -r ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.btrfs
 }
 
-- 
2.13.6


