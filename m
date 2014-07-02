Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 356AC65E1A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jul 2014 00:59:02 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Jul 2014 17:59:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,585,1400050800"; d="scan'208";a="452304257"
Received: from ranerica-desk01.sc.intel.com ([10.3.52.100])
	by azsmga001.ch.intel.com with ESMTP; 01 Jul 2014 17:59:03 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Jul 2014 17:57:38 -0700
Message-Id: <1404262658-20024-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Cc: Matt Fleming <matt.fleming@intel.com>,
	"Glenn P. Williamson" <glenn.p.williamson@intel.com>
Subject: [PATCH] bootimg.bbclass: Add parameter to specify HDDIMG volume ID
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
X-List-Received-Date: Wed, 02 Jul 2014 00:59:05 -0000

Users and children of the bootimg class may need to specify at build
time the volume ID of the HDDIMG vfat partition. An example of this
may be when at runtime the partition is uniquely identified by
the volume ID.

The HDDIMG_ID is expected to be provided externally. If the variable
is not set, mkdosfs will use the default volume-id.

Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
 meta/classes/bootimg.bbclass | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index 7678567..d52aace 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -22,6 +22,7 @@
 # ${COMPRESSISO} - Transparent compress ISO, reduce size ~40% if set to 1
 # ${NOISO}  - skip building the ISO image if set to 1
 # ${NOHDD}  - skip building the HDD image if set to 1
+# ${HDDIMG_ID} - FAT image volume-id
 # ${ROOTFS} - indicates a filesystem image to include as the root filesystem (optional)
 
 do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
@@ -193,7 +194,14 @@ build_fat_img() {
 		FATSIZE="-F 32"
 	fi
 
-	mkdosfs ${FATSIZE} -n ${BOOTIMG_VOLUME_ID} -S 512 -C ${FATIMG} ${BLOCKS}
+	if [ -z "${HDDIMG_ID}" ]; then
+		mkdosfs ${FATSIZE} -n ${BOOTIMG_VOLUME_ID} -S 512 -C ${FATIMG} \
+			${BLOCKS}
+	else
+		mkdosfs ${FATSIZE} -n ${BOOTIMG_VOLUME_ID} -S 512 -C ${FATIMG} \
+		${BLOCKS} -i ${HDDIMG_ID}
+	fi
+
 	# Copy FATSOURCEDIR recursively into the image file directly
 	mcopy -i ${FATIMG} -s ${FATSOURCEDIR}/* ::/
 }
-- 
1.9.1


