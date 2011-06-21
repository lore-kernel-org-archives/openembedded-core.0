Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QZ7bI-0004fd-4z
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 22:31:08 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 21 Jun 2011 13:27:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,402,1304319600"; d="scan'208";a="16391758"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by azsmga001.ch.intel.com with ESMTP; 21 Jun 2011 13:27:33 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jun 2011 13:27:22 -0700
Message-Id: <5efc4056b89573e6b6292ba4dd87a318965a98c8.1308687821.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <c3a70e785af909a60451135bf72663bed052ff7d.1308687821.git.nitin.a.kamble@intel.com>
References: <c3a70e785af909a60451135bf72663bed052ff7d.1308687821.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1308687821.git.nitin.a.kamble@intel.com>
References: <cover.1308687821.git.nitin.a.kamble@intel.com>
Subject: [btrfs patch 2/6] image-types.bbclass: get the image size in the whole number
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
X-List-Received-Date: Tue, 21 Jun 2011 20:31:08 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Avoid fractions like 80.72 and round them to whole numbers.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/classes/image_types.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index edd6e1d..dd69612 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -13,7 +13,7 @@ def get_imagecmds(d):
 
 runimagecmd () {
 	# Image generation code for image type ${type}
-	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{size = $1 * ${IMAGE_OVERHEAD_FACTOR} + ${IMAGE_ROOTFS_EXTRA_SPACE}; print (size > ${IMAGE_ROOTFS_SIZE} ? size : ${IMAGE_ROOTFS_SIZE}) }'`
+	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{size = $1 * ${IMAGE_OVERHEAD_FACTOR} + ${IMAGE_ROOTFS_EXTRA_SPACE}; OFMT = "%.0f" ; print (size > ${IMAGE_ROOTFS_SIZE} ? size : ${IMAGE_ROOTFS_SIZE}) }'`
 	${cmd}
 	cd ${DEPLOY_DIR_IMAGE}/
 	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.${type}
-- 
1.7.4.4



