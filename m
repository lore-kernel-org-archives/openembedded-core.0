Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RbRAz-0008DT-FG
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 07:21:49 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 15 Dec 2011 22:14:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="87178337"
Received: from unknown (HELO localhost) ([10.255.15.170])
	by orsmga001.jf.intel.com with ESMTP; 15 Dec 2011 22:14:49 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2011 22:14:19 -0800
Message-Id: <33febd68cae9e482a7d35c230a0b875849e86669.1324015563.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1324015563.git.dvhart@linux.intel.com>
References: <cover.1324015563.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 1/2] bootimg: Use mcopy to construct the hddimg
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
X-List-Received-Date: Fri, 16 Dec 2011 06:21:50 -0000

The initial directory support (-d) added to mkdosfs has proven to be incomplete
and non-compliant with FAT. Rather than continue to maintain this feature and
work around the various issues, we can use mcopy to construct the image.

bootimg.bbclass already depends on mtools-native (although it may not have
needed to previously). No new dependencies are introduced. The image created
passes dosfsck cleanly. Remove the call to dosfsck.

mcopy reported an error with the image we were creating:
Total number of sectors (107574) not a multiple of sectors per track (32)!

Add some logic to ensure the total sector count is an integral number of sectors
per track, including forcing the logical sector size to 512 in the mkdosfs
command.

The du -bks arguments are contradictory, -b is equivalent to "--apparent-size
--block-size=1" and -k is --block-size=1K. If reordered, -kbs will report the
disk usage in bytes insteadk of 1k blocks. Eliminate the ambiguity by using:
du --apparent-size -ks

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
CC: Nitin A. Kamble <nitin.a.kamble@intel.com>
---
 meta/classes/bootimg.bbclass |   18 +++++++++++++-----
 1 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index 8ec07a0..b50202f 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -103,13 +103,21 @@ build_hddimg() {
 			grubefi_hddimg_populate
 		fi
 
-		# Determine the block count for the final image
-		BLOCKS=`du -bks ${HDDDIR} | cut -f 1`
+		# Determine the 1024 byte block count for the final image.
+		BLOCKS=`du --apparent-size -ks ${HDDDIR} | cut -f 1`
 		SIZE=`expr $BLOCKS + ${BOOTIMG_EXTRA_SPACE}`
 
-		mkdosfs -n ${BOOTIMG_VOLUME_ID} -d ${HDDDIR} \
-		        -C ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg $SIZE
-		dosfsck -a -l ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg || true
+		# Ensure total sectors is an integral number of sectors per
+		# track or mcopy will complain. Sectors are 512 bytes, and and
+		# we generate images with 32 sectors per track. This calculation
+		# is done in blocks, which are twice the size of sectors, thus
+		# the 16 instead of 32.
+		SIZE=$(expr $SIZE + $(expr 16 - $(expr $SIZE % 16)))
+
+		IMG=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
+		mkdosfs -n ${BOOTIMG_VOLUME_ID} -S 512 -C ${IMG} ${SIZE}
+		# Copy HDDDIR recursively into the image file directly
+		mcopy -i ${IMG} -s ${HDDDIR}/* ::/
 
 		if [ "${PCBIOS}" = "1" ]; then
 			syslinux_hddimg_install
-- 
1.7.6.4



