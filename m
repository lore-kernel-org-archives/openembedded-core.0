Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RsI5l-0002s0-8n
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 19:06:05 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 31 Jan 2012 09:36:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="61737535"
Received: from unknown (HELO localhost) ([10.255.14.180])
	by AZSMGA002.ch.intel.com with ESMTP; 31 Jan 2012 09:36:19 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org, Saul Wold <sgw@linux.intel.com>
Date: Tue, 31 Jan 2012 09:35:43 -0800
Message-Id: <8f3b292dfbf229d32f972906148df26e81913e39.1328030784.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328030784.git.dvhart@linux.intel.com>
References: <cover.1328030784.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1328030784.git.dvhart@linux.intel.com>
References: <cover.1328030784.git.dvhart@linux.intel.com>
Subject: [PATCH 1/1] bootimg: Do not force FAT32 on all images, it violates the FAT specification
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
X-List-Received-Date: Tue, 31 Jan 2012 18:06:05 -0000

Fixes [YOCTO #1940]

do_bootimg was performing the FAT overhead calculations assuming FAT32 and then
forcing the use of FAT32 with "-F 32" to mkdosfs. The FAT specification is clear
on cluster count being the determining factor for FAT size (even if the fs
string is set to FAT32, go figure). Syslinux follows this spec, and rightly so,
resulting in a failure on core-image-minimal:

	syslinux: zero FAT sectors (FAT12/16)

Drop the "-F 32" from mkdosfs to allow it to select the appropriate FAT size
based on cluster count. Leave the FAT overhead calculation in FAT32. This will
result in a little extra padding for really small images, but not enough extra
to justify recalculating for FAT12 and FAT16.

Tested with a core-image-minimal build for atom-pc. do_bootimg completed
successfully, and the resulting image was FAT16.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/classes/bootimg.bbclass |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index e65bef7..a717600 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -114,6 +114,9 @@ build_hddimg() {
 		# Account for the filesystem overhead. This includes directory
 		# entries in the clusters as well as the FAT itself.
 		# Assumptions:
+		#   FAT32 (12 or 16 may be selected by mkdosfs, but the extra
+		#   padding will be minimal on those smaller images and not
+		#   worth the logic here to caclulate the smaller FAT sizes)
 		#   < 16 entries per directory
 		#   8.3 filenames only
 
@@ -142,7 +145,7 @@ build_hddimg() {
 		BLOCKS=$(expr $BLOCKS + $(expr 16 - $(expr $BLOCKS % 16)))
 
 		IMG=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
-		mkdosfs -F 32 -n ${BOOTIMG_VOLUME_ID} -S 512 -C ${IMG} ${BLOCKS}
+		mkdosfs -n ${BOOTIMG_VOLUME_ID} -S 512 -C ${IMG} ${BLOCKS}
 		# Copy HDDDIR recursively into the image file directly
 		mcopy -i ${IMG} -s ${HDDDIR}/* ::/
 
-- 
1.7.6.5



