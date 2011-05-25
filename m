Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QP9hD-0002N2-5p
	for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 10:44:04 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 25 May 2011 01:40:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,266,1304319600"; 
   d="scan'208";a="1223599"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.133])
	by azsmga001.ch.intel.com with ESMTP; 25 May 2011 01:40:53 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2011 01:40:39 -0700
Message-Id: <367934ada7c081ba3fc95f02dc14c7d6f97bfccb.1306312621.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306312621.git.sgw@linux.intel.com>
References: <cover.1306312621.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306312621.git.sgw@linux.intel.com>
References: <cover.1306312621.git.sgw@linux.intel.com>
Subject: [Updated Consolidated Pull 17/19] image_types: add IMAGE_ROOTFS_EXTRA_SPACE
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
X-List-Received-Date: Wed, 25 May 2011 08:44:04 -0000

[YOCTO #886]

This address 2 needs after the IMAGE_ROOTFS_SIZE is cleaned up, by
removing the _ext2/3 overrides it allows for a cleaner override
using IMAGE_ROOTFS_SIZE to create a large rootfs, or by setting the
IMAGE_ROOTFS_EXTRA_SPACE, will allow for extra space allocated in Kilobytes
above the base size (determined by du of the rootfs * IMAGE_OVERHEAD_FACTOR,
default of 1.3).

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/image_types.bbclass |    2 +-
 meta/conf/bitbake.conf           |    4 ++++
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 69f859e..601a5fb 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -13,7 +13,7 @@ def get_imagecmds(d):
 
 runimagecmd () {
 	# Image generation code for image type ${type}
-	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{size = $1 * ${IMAGE_OVERHEAD_FACTOR}; print (size > ${IMAGE_ROOTFS_SIZE} ? size : ${IMAGE_ROOTFS_SIZE}) }'`
+	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{size = $1 * ${IMAGE_OVERHEAD_FACTOR} + ${IMAGE_ROOTFS_EXTRA_SPACE}; print (size > ${IMAGE_ROOTFS_SIZE} ? size : ${IMAGE_ROOTFS_SIZE}) }'`
 	${cmd}
 	cd ${DEPLOY_DIR_IMAGE}/
 	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.${type}
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 18028f3..35fd6f8 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -350,6 +350,10 @@ IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${MACHINE}"
 # This option allows for a precentage overage of the actaul image size rather than a
 # fixed extra space
 IMAGE_OVERHEAD_FACTOR ?= 1.3
+# This option allow for adding addition space in K above and beyond what the 
+# IMAGE_OVERHEAD_FACTOR might add. To set a fixed size then overrideing IMAGE_ROOTFS_SIZE
+# with the max size one wants should do the trick
+IMAGE_ROOTFS_EXTRA_SPACE = "0"
 
 EXTRA_IMAGEDEPENDS = ""
 
-- 
1.7.3.4



