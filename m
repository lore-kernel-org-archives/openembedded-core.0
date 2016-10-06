Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2CE616078D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 10:59:50 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP; 06 Oct 2016 03:59:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,453,1473145200"; d="scan'208";a="1050224880"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 06 Oct 2016 03:59:52 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id B985D6A4006;
	Thu,  6 Oct 2016 03:59:22 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Oct 2016 13:33:37 +0300
Message-Id: <54a9bc54ede473cfa3e1b168f9fdfc5c1f9a5a4e.1475749929.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1475749929.git.ed.bartosh@linux.intel.com>
References: <cover.1475749929.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1475749929.git.ed.bartosh@linux.intel.com>
References: <cover.1475749929.git.ed.bartosh@linux.intel.com>
Cc: Saul Wold <saul.wold@intel.com>
Subject: [wic][PATCH 3/4] wic: rewrite MBR disk identifier
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
X-List-Received-Date: Thu, 06 Oct 2016 10:59:51 -0000

Disk identifier created by parted doesn't match the one we generated
and used in bootloader config. We need to rewrite it to make our image
bootable.

Modified involved API and data structures to access previously
generated disk identifiers after MBR is initialized. Written disk
identifiers to MBR.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/imager/direct.py       |  2 +-
 scripts/lib/wic/utils/partitionedfs.py | 12 ++++++++++--
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index 123a078..edf5e5d 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -315,7 +315,7 @@ class DirectImageCreator(BaseImageCreator):
                         % (disk_name, full_path, disk['min_size']))
             disk_obj = DiskImage(full_path, disk['min_size'])
             self.__disks[disk_name] = disk_obj
-            self.__image.add_disk(disk_name, disk_obj)
+            self.__image.add_disk(disk_name, disk_obj, disk_ids.get(disk_name))
 
         self.__image.create()
 
diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index 8d93a68..cb03009 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -68,15 +68,17 @@ class Image():
                  'offset': 0,      # Offset of next partition (in sectors)
                  # Minimum required disk size to fit all partitions (in bytes)
                  'min_size': 0,
-                 'ptable_format': "msdos"} # Partition table format
+                 'ptable_format': "msdos", # Partition table format
+                 'identifier': None} # Disk system identifier
 
-    def add_disk(self, disk_name, disk_obj):
+    def add_disk(self, disk_name, disk_obj, identifier):
         """ Add a disk object which have to be partitioned. More than one disk
         can be added. In case of multiple disks, disk partitions have to be
         added for each disk separately with 'add_partition()". """
 
         self.__add_disk(disk_name)
         self.disks[disk_name]['disk'] = disk_obj
+        self.disks[disk_name]['identifier'] = identifier
 
     def __add_partition(self, part):
         """ This is a helper function for 'add_partition()' which adds a
@@ -245,6 +247,12 @@ class Image():
                             (disk['disk'].device, disk['ptable_format']),
                             self.native_sysroot)
 
+            if disk['identifier']:
+                msger.debug("Set disk identifier %x" % disk['identifier'])
+                with open(disk['disk'].device, 'r+b') as img:
+                    img.seek(0x1B8)
+                    img.write(disk['identifier'].to_bytes(4, 'little'))
+
         msger.debug("Creating partitions")
 
         for part in self.partitions:
-- 
2.1.4


