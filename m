Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Rl8Bo-00019L-68
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 01:06:44 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Jan 2012 15:59:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="97216829"
Received: from unknown (HELO localhost) ([10.255.13.207])
	by orsmga002.jf.intel.com with ESMTP; 11 Jan 2012 15:59:12 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jan 2012 15:58:52 -0800
Message-Id: <4f781e4f05f1336c18d4d64bc547c538d7cbef9c.1326326259.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326326259.git.dvhart@linux.intel.com>
References: <cover.1326326259.git.dvhart@linux.intel.com>
Subject: [PATCH 1/1] bootimg: Account for FAT filesystem overhead in image size
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
X-List-Received-Date: Thu, 12 Jan 2012 00:06:44 -0000

Fixes [YOCTO #1852]

The bootimg class wasn't accounting for non-trivial amount of space
required by the directory entries and FATs for the FAT filesystem.

This patch attempts to make an accurate prediction of FAT overhead and
adjusts the image size accordingly. It assumes no more than 16 directory
entries per directory (which fit in a single sector). It also assumes
8.3 filenames. With the ceiling functions rounding up to full sectors
and tracks, these assumptions seem reasonable.

In order to ensure the calculations are accurate, this patch forces the
FAT size to 32, rather than allowing mkdosfs to automatically select 12,
16, or 32 depending on the image being built.

Tested by setting BOOTIMG_EXTRA_SPACE=0 and building core-image-minimal
and core-image-sato for fri2-noemgd from meta-intel.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
CC: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/bootimg.bbclass |   45 +++++++++++++++++++++++++++++++++--------
 1 files changed, 36 insertions(+), 9 deletions(-)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index b50202f..df3ee73 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -103,19 +103,46 @@ build_hddimg() {
 			grubefi_hddimg_populate
 		fi
 
-		# Determine the 1024 byte block count for the final image.
-		BLOCKS=`du --apparent-size -ks ${HDDDIR} | cut -f 1`
-		SIZE=`expr $BLOCKS + ${BOOTIMG_EXTRA_SPACE}`
+		# Calculate the size required for the final image including the
+		# data and filesystem overhead.
+		# Sectors: 512 bytes
+		#  Blocks: 1024 bytes
+
+		# Determine the sector count just for the data
+		SECTORS=$(expr $(du --apparent-size -ks ${HDDDIR} | cut -f 1) \* 2)
+
+		# Account for the filesystem overhead. This includes directory
+		# entries in the clusters as well as the FAT itself.
+		# Assumptions:
+		#   < 16 entries per directory
+		#   8.3 filenames only
+
+		# 32 bytes per dir entry
+		DIR_BYTES=$(expr $(find ${HDDDIR} | tail -n +2 | wc -l) \* 32)
+		# 32 bytes for every end-of-directory dir entry
+		DIR_BYTES=$(expr $DIR_BYTES + $(expr $(find ${HDDDIR} -type d | tail -n +2 | wc -l) \* 32))
+		# 4 bytes per FAT entry per sector of data
+		FAT_BYTES=$(expr $SECTORS \* 4)
+		# 4 bytes per FAT entry per end-of-cluster list
+		FAT_BYTES=$(expr $FAT_BYTES + $(expr $(find ${HDDDIR} -type d | tail -n +2 | wc -l) \* 4))
+
+		# Use a ceiling function to determine FS overhead in sectors
+		DIR_SECTORS=$(expr $(expr $DIR_BYTES + 511) / 512)
+		# There are two FATs on the image
+		FAT_SECTORS=$(expr $(expr $(expr $FAT_BYTES + 511) / 512) \* 2)
+		SECTORS=$(expr $SECTORS + $(expr $DIR_SECTORS + $FAT_SECTORS))
+
+		# Determine the final size in blocks accounting for some padding
+		BLOCKS=$(expr $(expr $SECTORS \* 2) + ${BOOTIMG_EXTRA_SPACE})
 
 		# Ensure total sectors is an integral number of sectors per
-		# track or mcopy will complain. Sectors are 512 bytes, and and
-		# we generate images with 32 sectors per track. This calculation
-		# is done in blocks, which are twice the size of sectors, thus
-		# the 16 instead of 32.
-		SIZE=$(expr $SIZE + $(expr 16 - $(expr $SIZE % 16)))
+		# track or mcopy will complain. Sectors are 512 bytes, and we
+		# generate images with 32 sectors per track. This calculation is
+		# done in blocks, thus the mod by 16 instead of 32.
+		BLOCKS=$(expr $BLOCKS + $(expr 16 - $(expr $BLOCKS % 16)))
 
 		IMG=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
-		mkdosfs -n ${BOOTIMG_VOLUME_ID} -S 512 -C ${IMG} ${SIZE}
+		mkdosfs -F 32 -n ${BOOTIMG_VOLUME_ID} -S 512 -C ${IMG} ${BLOCKS}
 		# Copy HDDDIR recursively into the image file directly
 		mcopy -i ${IMG} -s ${HDDDIR}/* ::/
 
-- 
1.7.6.5



