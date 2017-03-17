Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A4F756FFF7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 11:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489751211; x=1521287211;
	h=from:to:cc:subject:date:message-id;
	bh=xLb4zjsZj12B2pfco3yCCbrVUz2VbGYCnrwXlWKwdY0=;
	b=FYB404Sgk95XOma2A9VUMCEST/IrLp2FM9bI5eA85mC4Vsm1nQw5TtBi
	K/5W158GbO2RKPWq8607iCWzUrp1Gw==;
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Mar 2017 04:46:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,176,1486454400"; d="scan'208";a="76519847"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 17 Mar 2017 04:46:43 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 68EE72C8001;
	Fri, 17 Mar 2017 04:46:38 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Mar 2017 13:32:25 +0200
Message-Id: <1489750345-29718-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] image_types: increase filesystem size for BTRFS
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
X-List-Received-Date: Fri, 17 Mar 2017 11:46:50 -0000

16777216 bytes is a minimal possible filesystem size for BTRFS.
mkfs.btrfs fails to create a filesystem if rootfs size is too small.

Increased filesystem size to make it possible for mkfs.btrfs
to create an image for small rootfs directories,
e.g. for core-image-minimal.

[YOCTO #11163]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image_types.bbclass | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index d2eb99d..99adeb3 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -82,12 +82,13 @@ IMAGE_CMD_ext4 = "oe_mkext234fs ext4 ${EXTRA_IMAGECMD}"
 
 MIN_BTRFS_SIZE ?= "16384"
 IMAGE_CMD_btrfs () {
-	if [ ${ROOTFS_SIZE} -gt ${MIN_BTRFS_SIZE} ]; then
-		dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.btrfs count=${ROOTFS_SIZE} bs=1024
-		mkfs.btrfs ${EXTRA_IMAGECMD} -r ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.btrfs
-	else
-		bbfatal "Rootfs is too small for BTRFS (Rootfs Actual Size: ${ROOTFS_SIZE}, BTRFS Minimum Size: ${MIN_BTRFS_SIZE})"
+	size=${ROOTFS_SIZE}
+	if [ ${size} -lt ${MIN_BTRFS_SIZE} ] ; then
+		size=${MIN_BTRFS_SIZE}
+		bbwarn "Rootfs size is too small for BTRFS. Filesystem will be extended to ${size}K"
 	fi
+	dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.btrfs count=${size} bs=1024
+	mkfs.btrfs ${EXTRA_IMAGECMD} -r ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.btrfs
 }
 
 IMAGE_CMD_squashfs = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs ${EXTRA_IMAGECMD} -noappend"
-- 
2.1.4


