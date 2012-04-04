Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SFSLa-0001xI-IM
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 17:42:10 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 Apr 2012 08:32:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="127032539"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.20])
	by azsmga001.ch.intel.com with ESMTP; 04 Apr 2012 08:32:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2012 16:32:50 +0100
Message-Id: <0d5a88036c74a354a62e13cf83d05f99fca8175b.1333553396.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1333553396.git.paul.eggleton@linux.intel.com>
References: <cover.1333553396.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1333553396.git.paul.eggleton@linux.intel.com>
References: <cover.1333553396.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] classes/image_types: add IMAGE_TUNE2FS_ext3
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
X-List-Received-Date: Wed, 04 Apr 2012 15:42:10 -0000

Add a variable that allows additional options to be passed to tune2fs,
such as -m to control the amount of space reserved for root.

This could potentially be added for other filesystems, but right now we
need it only for ext3 for self-hosted-image.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/image_types.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index b590ae1..152e5b4 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -132,9 +132,11 @@ IMAGE_CMD_ext2 () {
 	rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}
 }
 
+IMAGE_TUNE2FS_ext3 ?= ""
+
 IMAGE_CMD_ext3 () {
 	genext2fs -b $ROOTFS_SIZE -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3
-	tune2fs -j ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3
+	tune2fs -j ${IMAGE_TUNE2FS_ext3} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3
 }
 
 oe_mkext4fs () {
-- 
1.7.5.4



