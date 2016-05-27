Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2D37A6B6EA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 08:08:48 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 27 May 2016 01:08:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,373,1459839600"; d="scan'208";a="111456450"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga004.fm.intel.com with ESMTP; 27 May 2016 01:08:49 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Fri, 27 May 2016 11:08:46 +0300
Message-Id: <5b3fdf4709cde6ecfbb88c1c79aa4d8a89aece5a.1464336009.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1464336009.git.jussi.kukkonen@intel.com>
References: <cover.1464336009.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/1] image-live.bbclass: Tweak rounding up sector count
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
X-List-Received-Date: Fri, 27 May 2016 08:08:49 -0000

New mkdosfs has changed the default sectors-per-track it sets on a
new image: This number is useless in our use case but mcopy has
sanity checks to make sure image size is an integral number of
sectors-per-track.

Make sure our sector count is always divisible by sectors-per-track.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/classes/image-live.bbclass | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index ea6ced2..9b65753 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -199,14 +199,15 @@ build_fat_img() {
 	FAT_SECTORS=$(expr $(expr $(expr $FAT_BYTES + 511) / 512) \* 2)
 	SECTORS=$(expr $SECTORS + $(expr $DIR_SECTORS + $FAT_SECTORS))
 
-	# Determine the final size in blocks accounting for some padding
-	BLOCKS=$(expr $(expr $SECTORS / 2) + ${BOOTIMG_EXTRA_SPACE})
+	# Determine the final size accounting for some padding
+	SECTORS=$(expr $SECTORS + $(expr ${BOOTIMG_EXTRA_SPACE} \* 2))
 
 	# Ensure total sectors is an integral number of sectors per
-	# track or mcopy will complain. Sectors are 512 bytes, and we
-	# generate images with 32 sectors per track. This calculation is
-	# done in blocks, thus the mod by 16 instead of 32.
-	BLOCKS=$(expr $BLOCKS + $(expr 16 - $(expr $BLOCKS % 16)))
+	# track or mcopy will complain. Sectors are 512 bytes, and current
+	# mkdosfs generates images with 63 sectors per track. Use 2*63
+	# as the mod to ensure result is divisible by two.
+	SECTORS=$(expr $SECTORS + $(expr 126 - $(expr $SECTORS % 126)))
+	BLOCKS=$(expr $SECTORS / 2)
 
 	# mkdosfs will sometimes use FAT16 when it is not appropriate,
 	# resulting in a boot failure from SYSLINUX. Use FAT32 for
-- 
2.1.4


