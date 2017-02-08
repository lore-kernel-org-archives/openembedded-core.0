Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 10AA971D8F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 19:14:39 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 08 Feb 2017 11:14:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,348,1484035200"; d="scan'208";a="818593555"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Feb 2017 11:14:39 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 77B6F6A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 11:13:38 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Feb 2017 20:51:30 +0200
Message-Id: <12d5805ca886180ba719775e9c1998ad4a1b3d32.1486579259.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1486579259.git.ed.bartosh@linux.intel.com>
References: <cover.1486579259.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 6/9] wic: make sure layout_partitions is called once
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
X-List-Received-Date: Wed, 08 Feb 2017 19:14:39 -0000

Removed artificial _partitions_layed_out attribute and
unneeded call of layout_partitions method.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/partitionedfs.py | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index fb5c0c2..5397bb7 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -46,7 +46,6 @@ class Image():
         self.partimages = []
         # Size of a sector used in calculations
         self.sector_size = SECTOR_SIZE
-        self._partitions_layed_out = False
         self.native_sysroot = native_sysroot
 
     def _add_disk(self, disk_name):
@@ -58,8 +57,6 @@ class Image():
             # We already have this disk
             return
 
-        assert not self._partitions_layed_out
-
         self.disks[disk_name] = \
                 {'disk': None,     # Disk object
                  'numpart': 0,     # Number of allocate partitions
@@ -90,8 +87,6 @@ class Image():
         # Converting kB to sectors for parted
         part.size_sec = part.disk_size * 1024 // self.sector_size
 
-        assert not self._partitions_layed_out
-
         self.partitions.append(part)
         self._add_disk(part.disk)
 
@@ -102,11 +97,6 @@ class Image():
 
         msger.debug("Assigning %s partitions to disks" % ptable_format)
 
-        if self._partitions_layed_out:
-            return
-
-        self._partitions_layed_out = True
-
         # Go through partitions in the order they are added in .ks file
         for num in range(len(self.partitions)):
             part = self.partitions[num]
@@ -219,8 +209,6 @@ class Image():
             disk = self.disks[dev]
             disk['disk'].create()
 
-        self.layout_partitions()
-
         for dev in self.disks:
             disk = self.disks[dev]
             msger.debug("Initializing partition table for %s" % \
-- 
2.1.4


