Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4C8B575771
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jun 2015 08:06:58 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 05 Jun 2015 01:06:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,557,1427785200"; d="scan'208";a="737561416"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 05 Jun 2015 01:06:59 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 3841D6A4083;
	Fri,  5 Jun 2015 01:06:25 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jun 2015 09:13:09 +0300
Message-Id: <1433484789-304-5-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1433484789-304-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1433484789-304-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 4/4] wic: pylinted partitionedfs.py
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
X-List-Received-Date: Fri, 05 Jun 2015 08:06:58 -0000

Fixed some pylint findings in partitionedfs.py

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index dcb63e5..902548f 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -31,7 +31,7 @@ GPT_OVERHEAD = 34
 # Size of a sector in bytes
 SECTOR_SIZE = 512
 
-class Image:
+class Image(object):
     """
     Generic base object for an image.
 
@@ -58,14 +58,14 @@ class Image:
         assert not self._partitions_layed_out
 
         self.disks[disk_name] = \
-                { 'disk': None,     # Disk object
-                  'numpart': 0,     # Number of allocate partitions
-                  'realpart': 0,    # Number of partitions in the partition table
-                  'partitions': [], # Indexes to self.partitions
-                  'offset': 0,      # Offset of next partition (in sectors)
-                  # Minimum required disk size to fit all partitions (in bytes)
-                  'min_size': 0,
-                  'ptable_format': "msdos" } # Partition table format
+                {'disk': None,     # Disk object
+                 'numpart': 0,     # Number of allocate partitions
+                 'realpart': 0,    # Number of partitions in the partition table
+                 'partitions': [], # Indexes to self.partitions
+                 'offset': 0,      # Offset of next partition (in sectors)
+                 # Minimum required disk size to fit all partitions (in bytes)
+                 'min_size': 0,
+                 'ptable_format': "msdos"} # Partition table format
 
     def add_disk(self, disk_name, disk_obj):
         """ Add a disk object which have to be partitioned. More than one disk
@@ -97,20 +97,20 @@ class Image:
 
         # We still need partition for "/" or non-subvolume
         if mountpoint == "/" or not fsopts:
-            part = { 'ks_pnum' : ks_pnum, # Partition number in the KS file
-                     'size': size, # In sectors
-                     'mountpoint': mountpoint, # Mount relative to chroot
-                     'source_file': source_file, # partition contents
-                     'fstype': fstype, # Filesystem type
-                     'fsopts': fsopts, # Filesystem mount options
-                     'label': label, # Partition label
-                     'disk_name': disk_name, # physical disk name holding partition
-                     'device': None, # kpartx device node for partition
-                     'num': None, # Partition number
-                     'boot': boot, # Bootable flag
-                     'align': align, # Partition alignment
-                     'no_table' : no_table, # Partition does not appear in partition table
-                     'part_type' : part_type } # Partition type
+            part = {'ks_pnum': ks_pnum, # Partition number in the KS file
+                    'size': size, # In sectors
+                    'mountpoint': mountpoint, # Mount relative to chroot
+                    'source_file': source_file, # partition contents
+                    'fstype': fstype, # Filesystem type
+                    'fsopts': fsopts, # Filesystem mount options
+                    'label': label, # Partition label
+                    'disk_name': disk_name, # physical disk name holding partition
+                    'device': None, # kpartx device node for partition
+                    'num': None, # Partition number
+                    'boot': boot, # Bootable flag
+                    'align': align, # Partition alignment
+                    'no_table' : no_table, # Partition does not appear in partition table
+                    'part_type' : part_type} # Partition type
 
             self.__add_partition(part)
 
@@ -213,7 +213,7 @@ class Image:
 
         # Once all the partitions have been layed out, we can calculate the
         # minumim disk sizes.
-        for disk_name, d in self.disks.items():
+        for d in self.disks.values():
             d['min_size'] = d['offset']
             if d['ptable_format'] == "gpt":
                 d['min_size'] += GPT_OVERHEAD
@@ -314,14 +314,14 @@ class Image:
 
     def cleanup(self):
         if self.disks:
-            for dev in self.disks.keys():
+            for dev in self.disks:
                 d = self.disks[dev]
                 try:
                     d['disk'].cleanup()
                 except:
                     pass
 
-    def __write_partition(self, num, source_file, start, size):
+    def __write_partition(self, num, source_file, start, size, image_file):
         """
         Install source_file contents into a partition.
         """
@@ -330,23 +330,20 @@ class Image:
 
         # Start is included in the size so need to substract one from the end.
         end = start + size - 1
-        msger.debug("Installed %s in partition %d, sectors %d-%d, size %d sectors" % (source_file, num, start, end, size))
+        msger.debug("Installed %s in partition %d, sectors %d-%d, "
+                    "size %d sectors" % (source_file, num, start, end, size))
 
         dd_cmd = "dd if=%s of=%s bs=%d seek=%d count=%d conv=notrunc" % \
-            (source_file, self.image_file, self.sector_size, start, size)
+            (source_file, image_file, self.sector_size, start, size)
         exec_cmd(dd_cmd)
 
 
     def assemble(self, image_file):
         msger.debug("Installing partitions")
 
-        self.image_file = image_file
-
         for p in self.partitions:
-            d = self.disks[p['disk_name']]
-
             self.__write_partition(p['num'], p['source_file'],
-                                   p['start'], p['size'])
+                                   p['start'], p['size'], image_file)
 
     def create(self):
         for dev in self.disks.keys():
-- 
2.1.4


