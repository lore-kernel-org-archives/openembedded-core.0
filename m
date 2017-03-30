Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8366B77D4B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 18:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490899519; x=1522435519;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=2FyKSBvtleRW+UsEi98L1zAofUt32WGfuqGosjiB8O8=;
	b=eFpFu18mmafqLxi31hCDMz1iSopZ6eW6RIREA1mgDc1Sk68tzND8XJmH
	+0uz60eNv1dOnDp0ZjApL1YRv5PL5g==;
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Mar 2017 11:45:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,248,1486454400"; d="scan'208";a="1129030312"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 30 Mar 2017 11:45:18 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id AC8482C8001
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 11:45:10 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 21:43:48 +0300
Message-Id: <5de070eb93418b97c192502ad6b6b32cc7d34746.1490898545.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1490898545.git.ed.bartosh@linux.intel.com>
References: <cover.1490898545.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 6/9] wic: set correct system id for msdos partitions
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
X-List-Received-Date: Thu, 30 Mar 2017 18:45:17 -0000

Explicitly set system id 0x6(FAT16) for msdos partitions.

Removed old code that attempts to achieve the same result
using 'parted ... lba off'.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 79b948a..f2e6127 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -487,6 +487,8 @@ class PartitionedImage():
                 parted_fs_type = "fat32"
             elif part.fstype == "msdos":
                 parted_fs_type = "fat16"
+                if not part.system_id:
+                    part.system_id = '0x6' # FAT16
             else:
                 # Type for ext2/ext3/ext4/btrfs
                 parted_fs_type = "ext2"
@@ -536,17 +538,6 @@ class PartitionedImage():
                                 (self.path, part.num, part.system_id),
                                 self.native_sysroot)
 
-            # Parted defaults to enabling the lba flag for fat16 partitions,
-            # which causes compatibility issues with some firmware (and really
-            # isn't necessary).
-            if parted_fs_type == "fat16":
-                if self.ptable_format == 'msdos':
-                    logger.debug("Disable 'lba' flag for partition '%s' on disk '%s'",
-                                 part.num, self.path)
-                    exec_native_cmd("parted -s %s set %d lba off" % \
-                                    (self.path, part.num),
-                                    self.native_sysroot)
-
     def cleanup(self):
         # remove partition images
         for image in set(self.partimages):
-- 
2.1.4


