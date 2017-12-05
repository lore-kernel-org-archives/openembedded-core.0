Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5024F78684
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 23:27:25 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Dec 2017 15:27:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,365,1508828400"; 
   d="scan'208";a="9937228"
Received: from swold-mobl2.jf.intel.com ([10.24.10.97])
	by fmsmga004.fm.intel.com with ESMTP; 05 Dec 2017 15:27:27 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Tue,  5 Dec 2017 15:27:27 -0800
Message-Id: <20171205232727.27430-1-sgw@linux.intel.com>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH] image_types: add support for modern f2fs flash filesystem
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
X-List-Received-Date: Tue, 05 Dec 2017 23:27:26 -0000

The f2fs filesystem is a newer flash filesystem that is available in
meta-filesystems. This needs a minimum sized blank space to operate
in correctly.

The f2fs has overprovision functionality and when building smaller
filesystems, you actually need more space, therefore under 500M (or so)
double the amount of space needed in order to handle the overprovision
functions in f2fs.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/image_types.bbclass | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index d09d1277eaa..aaba1073a08 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -218,6 +218,24 @@ IMAGE_CMD_ubi () {
 
 IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.ubifs ${MKUBIFS_ARGS}"
 
+MKF2FS_ARGS = ""
+FIX_F2FS_SIZE ?= "524288"
+IMAGE_CMD_f2fs () {
+        # We need to add additional smarts here form devices smaller than 1.5G
+        # Need to scale appropriately between 40M -> 1.5G as the "overprovision
+        # ratio" goes down as the device gets bigger (70% -> 4.5%), below about
+        # 500M the standard IMAGE_OVERHEAD_FACTOR does not work, so add additional
+        # space here when under 500M
+	size=${ROOTFS_SIZE}
+	if [ ${size} -lt ${FIX_F2FS_SIZE} ] ; then
+		size=`expr ${size}*2`
+		bbwarn "Rootfs size is too small for F2FS. Filesystem will be extended to ${size}K"
+	fi
+	dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.f2fs count=${size} bs=1024
+	mkfs.f2fs ${MKF2FS_ARGS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.f2fs
+	sload.f2fs -f ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.f2fs
+}
+
 EXTRA_IMAGECMD = ""
 
 inherit siteinfo kernel-arch
@@ -231,6 +249,7 @@ EXTRA_IMAGECMD_ext3 ?= "-i 4096"
 EXTRA_IMAGECMD_ext4 ?= "-i 4096"
 EXTRA_IMAGECMD_btrfs ?= "-n 4096"
 EXTRA_IMAGECMD_elf ?= ""
+EXTRA_IMAGECMD_f2fs ?= ""
 
 do_image_jffs2[depends] += "mtd-utils-native:do_populate_sysroot"
 do_image_cramfs[depends] += "util-linux-native:do_populate_sysroot"
@@ -246,6 +265,7 @@ do_image_elf[depends] += "virtual/kernel:do_populate_sysroot mkelfimage-native:d
 do_image_ubi[depends] += "mtd-utils-native:do_populate_sysroot"
 do_image_ubifs[depends] += "mtd-utils-native:do_populate_sysroot"
 do_image_multiubi[depends] += "mtd-utils-native:do_populate_sysroot"
+do_image_f2fs[depends] += "f2fs-tools-native:do_populate_sysroot"
 
 # This variable is available to request which values are suitable for IMAGE_FSTYPES
 IMAGE_TYPES = " \
@@ -264,6 +284,7 @@ IMAGE_TYPES = " \
     elf \
     wic wic.gz wic.bz2 wic.lzma \
     container \
+    f2fs \
 "
 
 # Compression is a special case of conversion. The old variable
-- 
2.13.6


