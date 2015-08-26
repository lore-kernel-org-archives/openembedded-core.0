Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8021676ACD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 21:57:05 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 26 Aug 2015 14:57:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,418,1437462000"; d="scan'208";a="632871980"
Received: from afshjern.zpn.intel.com ([10.219.17.7])
	by orsmga003.jf.intel.com with ESMTP; 26 Aug 2015 14:57:04 -0700
From: Alex Franco <alejandro.franco@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2015 16:57:35 -0500
Message-Id: <1440626255-29614-4-git-send-email-alejandro.franco@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1440626255-29614-1-git-send-email-alejandro.franco@linux.intel.com>
References: <1440626255-29614-1-git-send-email-alejandro.franco@linux.intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 3/3] Empty image: filesystem allocation
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
X-List-Received-Date: Wed, 26 Aug 2015 21:57:06 -0000

Increase sparse image block size when ROOTFS_SIZE is smaller than
the minimum needed for ext4 to fit into it.

[YOCTO #7664]

Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
---
 meta/classes/image_types.bbclass | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 35ceb7b..61ce222 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -49,8 +49,16 @@ oe_mkext234fs () {
 		extra_imagecmd=$@
 	fi
 
+	# If generating an empty image the size of the sparse block should be large
+	# enough to allocate an ext4 filesystem using 4096 bytes per inode, this is
+	# about 60K, so dd needs a minimum count of 60, with bs=1024 (bytes per IO)
+	eval local COUNT=\"0\"
+	eval local MIN_COUNT=\"60\"
+	if [ $ROOTFS_SIZE -lt $MIN_COUNT ]; then
+		eval COUNT=\"$MIN_COUNT\"
+	fi
 	# Create a sparse image block
-	dd if=/dev/zero of=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.$fstype seek=$ROOTFS_SIZE count=0 bs=1k
+	dd if=/dev/zero of=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.$fstype seek=$ROOTFS_SIZE count=$COUNT bs=1024
 	mkfs.$fstype -F $extra_imagecmd ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.$fstype -d ${IMAGE_ROOTFS}
 }
 
-- 
2.5.0


