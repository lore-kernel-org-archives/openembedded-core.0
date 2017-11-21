Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8B56B7854F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 15:26:43 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Nov 2017 07:26:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,432,1505804400"; 
   d="scan'208";a="5382422"
Received: from swold-mobl2.jf.intel.com ([10.24.10.203])
	by fmsmga001.fm.intel.com with ESMTP; 21 Nov 2017 07:26:44 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Tue, 21 Nov 2017 07:26:44 -0800
Message-Id: <20171121152644.8716-1-sgw@linux.intel.com>
X-Mailer: git-send-email 2.13.5
Subject: [PATCH] image_types: Add debugging code to ext4 fs creation
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
X-List-Received-Date: Tue, 21 Nov 2017 15:26:43 -0000

We have seen a small number of issues with ROOTFS_SIZE not getting
computed correctly, resulting in a failure in the mke2fs processing
and populating the resulting new filesystem.

This information should help us to reproduce [YOCTO #12304]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/image_types.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index b373b217145..cab2963756b 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -83,7 +83,11 @@ oe_mkext234fs () {
 		eval COUNT=\"$MIN_COUNT\"
 	fi
 	# Create a sparse image block
+	bbdebug 1 Executing "dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype seek=$ROOTFS_SIZE count=$COUNT bs=1024"
 	dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype seek=$ROOTFS_SIZE count=$COUNT bs=1024
+	bbdebug 1 "Actual Rootfs size:  `du -s ${IMAGE_ROOTFS}`"
+	bbdebug 1 "Actual Partion size: `ls -s ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype`"
+	bbdebug 1 Executing "mkfs.$fstype -F $extra_imagecmd ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype -d ${IMAGE_ROOTFS}"
 	mkfs.$fstype -F $extra_imagecmd ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype -d ${IMAGE_ROOTFS}
 	# Error codes 0-3 indicate successfull operation of fsck (no errors or errors corrected)
 	fsck.$fstype -pvfD ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype || [ $? -le 3 ]
-- 
2.13.5


