Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 789C171C9B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 19:14:35 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 08 Feb 2017 11:14:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,348,1484035200"; d="scan'208";a="56664980"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 08 Feb 2017 11:14:35 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 288FE6A4082
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 11:13:33 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Feb 2017 20:51:26 +0200
Message-Id: <107cb1f01b657217c11002d1bbcb8d836e4fc9ab.1486579259.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1486579259.git.ed.bartosh@linux.intel.com>
References: <cover.1486579259.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 2/9] wic: partitionedfs: get rid of __add_partition
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
X-List-Received-Date: Wed, 08 Feb 2017 19:14:35 -0000

3 lines long private method __add_partition is called only
from add_partition method. Merged them together to increase
readability.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/partitionedfs.py | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index 08ae52f..2cfdf70 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -80,15 +80,6 @@ class Image():
         self.disks[disk_name]['disk'] = disk_obj
         self.disks[disk_name]['identifier'] = identifier
 
-    def __add_partition(self, part):
-        """ This is a helper function for 'add_partition()' which adds a
-        partition to the internal list of partitions. """
-
-        assert not self._partitions_layed_out
-
-        self.partitions.append(part)
-        self.__add_disk(part['disk_name'])
-
     def add_partition(self, size, disk_name, mountpoint, source_file=None, fstype=None,
                       label=None, fsopts=None, boot=False, align=None, no_table=False,
                       part_type=None, uuid=None, system_id=None):
@@ -117,7 +108,10 @@ class Image():
                 'uuid': uuid, # Partition UUID
                 'system_id': system_id} # Partition system id
 
-        self.__add_partition(part)
+        assert not self._partitions_layed_out
+
+        self.partitions.append(part)
+        self._add_disk(part['disk_name'])
 
     def layout_partitions(self, ptable_format="msdos"):
         """ Layout the partitions, meaning calculate the position of every
-- 
2.1.4


