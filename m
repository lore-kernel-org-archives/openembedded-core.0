Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A890271C9B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 19:14:36 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 08 Feb 2017 11:14:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,348,1484035200"; d="scan'208";a="818593545"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Feb 2017 11:14:36 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 379136A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 11:13:35 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Feb 2017 20:51:27 +0200
Message-Id: <169662163c0b93161eaf0c405ee2dc6009bb53af.1486579259.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1486579259.git.ed.bartosh@linux.intel.com>
References: <cover.1486579259.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 3/9] wic: partitionedfs: rename __create_partition and __add_disk
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
X-List-Received-Date: Wed, 08 Feb 2017 19:14:36 -0000

Renamed private methods with leading double underscores:
__create_partition -> _create_partition
__add_disk -> _add_disk

There is no point to have those names mangled, one underscore
is enough.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/partitionedfs.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index 2cfdf70..b7ab1d5 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -49,7 +49,7 @@ class Image():
         self._partitions_layed_out = False
         self.native_sysroot = native_sysroot
 
-    def __add_disk(self, disk_name):
+    def _add_disk(self, disk_name):
         """ Add a disk 'disk_name' to the internal list of disks. Note,
         'disk_name' is the name of the disk in the target system
         (e.g., sdb). """
@@ -76,7 +76,7 @@ class Image():
         can be added. In case of multiple disks, disk partitions have to be
         added for each disk separately with 'add_partition()". """
 
-        self.__add_disk(disk_name)
+        self._add_disk(disk_name)
         self.disks[disk_name]['disk'] = disk_obj
         self.disks[disk_name]['identifier'] = identifier
 
@@ -217,7 +217,7 @@ class Image():
 
             disk['min_size'] *= self.sector_size
 
-    def __create_partition(self, device, parttype, fstype, start, size):
+    def _create_partition(self, device, parttype, fstype, start, size):
         """ Create a partition on an image described by the 'device' object. """
 
         # Start is included to the size so we need to substract one from the end.
@@ -272,9 +272,9 @@ class Image():
                 # starts a sector before the first logical partition,
                 # add a sector at the back, so that there is enough
                 # room for all logical partitions.
-                self.__create_partition(disk['disk'].device, "extended",
-                                        None, part['start'] - 1,
-                                        disk['offset'] - part['start'] + 1)
+                self._create_partition(disk['disk'].device, "extended",
+                                       None, part['start'] - 1,
+                                       disk['offset'] - part['start'] + 1)
 
             if part['fstype'] == "swap":
                 parted_fs_type = "linux-swap"
@@ -297,8 +297,8 @@ class Image():
                             part['mountpoint'])
                 part['size'] -= 1
 
-            self.__create_partition(disk['disk'].device, part['type'],
-                                    parted_fs_type, part['start'], part['size'])
+            self._create_partition(disk['disk'].device, part['type'],
+                                   parted_fs_type, part['start'], part['size'])
 
             if part['part_type']:
                 msger.debug("partition %d: set type UID to %s" % \
-- 
2.1.4


