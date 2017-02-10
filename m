Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 55DBC7199A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 15:28:59 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Feb 2017 07:28:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,142,1484035200"; d="scan'208";a="57298976"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 10 Feb 2017 07:28:59 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 2B9946A4080
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 07:27:57 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2017 17:05:48 +0200
Message-Id: <a60722f69c4218aa4e8de11df2d0abf63dbfd2b7.1486738307.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1486738307.git.ed.bartosh@linux.intel.com>
References: <cover.1486738307.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 12/13] wic: direct: move generation of part.realnum to PartitionedImage
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
X-List-Received-Date: Fri, 10 Feb 2017 15:28:59 -0000

Moved the code that generates real partition numbers from DirectPlugin
to PartitionedImage.

The idea is to have all code that works with partitions
in PartitionedImage class.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 9c4109e..c517904 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -74,19 +74,6 @@ class DirectPlugin(ImagerPlugin):
         self.ptable_format = self.ks.bootloader.ptable
         self.parts = self.ks.partitions
 
-        # calculate the real partition number, accounting for partitions not
-        # in the partition table and logical partitions
-        realnum = 0
-        for part in self.parts:
-            if part.no_table:
-                part.realnum = 0
-            else:
-                realnum += 1
-                if self.ptable_format == 'msdos' and realnum > 3:
-                    part.realnum = realnum + 1
-                    continue
-                part.realnum = realnum
-
         # as a convenience, set source to the boot partition source
         # instead of forcing it to be set via bootloader --source
         for part in self.parts:
@@ -317,6 +304,19 @@ class PartitionedImage():
         self.sector_size = SECTOR_SIZE
         self.native_sysroot = native_sysroot
 
+        # calculate the real partition number, accounting for partitions not
+        # in the partition table and logical partitions
+        realnum = 0
+        for part in self.partitions:
+            if part.no_table:
+                part.realnum = 0
+            else:
+                realnum += 1
+                if self.ptable_format == 'msdos' and realnum > 3:
+                    part.realnum = realnum + 1
+                    continue
+                part.realnum = realnum
+
         # generate parition UUIDs
         for part in self.partitions:
             if not part.uuid and part.use_uuid:
-- 
2.1.4


