Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 75434772BC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 09:01:53 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Feb 2017 01:01:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,165,1484035200"; d="scan'208";a="1126866914"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 15 Feb 2017 01:01:54 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 93A0A6A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 01:00:51 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2017 10:38:26 +0200
Message-Id: <f2849c1235b3aec0a94080962284ecdc421b579d.1487110279.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487110279.git.ed.bartosh@linux.intel.com>
References: <cover.1487110279.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 03/11] wic: use wic logger in imager direct plugin
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
X-List-Received-Date: Wed, 15 Feb 2017 09:01:54 -0000

Replaced msger with wic logger in the direct plugin.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 83 +++++++++++++++++---------------
 1 file changed, 43 insertions(+), 40 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 481d24d..2e2d26a 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -23,14 +23,16 @@
 # AUTHORS
 # Tom Zanussi <tom.zanussi (at] linux.intel.com>
 #
+
+import logging
 import os
 import shutil
-import uuid
+import sys
 import tempfile
+import uuid
 
 from time import strftime
 
-from wic import msger
 from wic.filemap import sparse_copy
 from wic.ksparser import KickStart, KickStartError
 from wic.plugin import pluginmgr
@@ -38,6 +40,8 @@ from wic.pluginbase import ImagerPlugin
 from wic.utils.errors import ImageError
 from wic.utils.misc import get_bitbake_var, exec_cmd, exec_native_cmd
 
+logger = logging.getLogger('wic')
+
 class DirectPlugin(ImagerPlugin):
     """
     Install a system into a file containing a partitioned disk image.
@@ -54,7 +58,8 @@ class DirectPlugin(ImagerPlugin):
         try:
             self.ks = KickStart(wks_file)
         except KickStartError as err:
-            msger.error(str(err))
+            logger.error(str(err))
+            sys.exit(1)
 
         # parse possible 'rootfs=name' items
         self.rootfs_dir = dict(rdir.split('=') for rdir in rootfs_dir.split(' '))
@@ -204,12 +209,12 @@ class DirectPlugin(ImagerPlugin):
         full_path = self._image.path
         # Generate .bmap
         if self.bmap:
-            msger.debug("Generating bmap file for %s" % disk_name)
+            logger.debug("Generating bmap file for %s", disk_name)
             exec_native_cmd("bmaptool create %s -o %s.bmap" % (full_path, full_path),
                             self.native_sysroot)
         # Compress the image
         if self.compressor:
-            msger.debug("Compressing disk %s with %s" % (disk_name, self.compressor))
+            logger.debug("Compressing disk %s with %s", disk_name, self.compressor)
             exec_cmd("%s %s" % (self.compressor, full_path))
 
     def print_info(self):
@@ -239,7 +244,7 @@ class DirectPlugin(ImagerPlugin):
         msg += '  KERNEL_DIR:                   %s\n' % self.kernel_dir
         msg += '  NATIVE_SYSROOT:               %s\n' % self.native_sysroot
 
-        msger.info(msg)
+        logger.info(msg)
 
     @property
     def rootdev(self):
@@ -342,7 +347,7 @@ class PartitionedImage():
         partition on the disk. The 'ptable_format' parameter defines the
         partition table format and may be "msdos". """
 
-        msger.debug("Assigning %s partitions to disks" % self.ptable_format)
+        logger.debug("Assigning %s partitions to disks", self.ptable_format)
 
         # Go through partitions in the order they are added in .ks file
         for num in range(len(self.partitions)):
@@ -389,10 +394,10 @@ class PartitionedImage():
                     # to move forward to the next alignment point
                     align_sectors = (part.align * 1024 // self.sector_size) - align_sectors
 
-                    msger.debug("Realignment for %s%s with %s sectors, original"
-                                " offset %s, target alignment is %sK." %
-                                (part.disk, self.numpart, align_sectors,
-                                 self.offset, part.align))
+                    logger.debug("Realignment for %s%s with %s sectors, original"
+                                 " offset %s, target alignment is %sK.",
+                                 part.disk, self.numpart, align_sectors,
+                                 self.offset, part.align)
 
                     # increase the offset so we actually start the partition on right alignment
                     self.offset += align_sectors
@@ -413,11 +418,10 @@ class PartitionedImage():
                         part.type = 'logical'
                         part.num = self.realpart + 1
 
-            msger.debug("Assigned %s to %s%d, sectors range %d-%d size %d "
-                        "sectors (%d bytes)." \
-                            % (part.mountpoint, part.disk, part.num,
-                               part.start, self.offset - 1,
-                               part.size_sec, part.size_sec * self.sector_size))
+            logger.debug("Assigned %s to %s%d, sectors range %d-%d size %d "
+                         "sectors (%d bytes).", part.mountpoint, part.disk,
+                         part.num, part.start, self.offset - 1, part.size_sec,
+                         part.size_sec * self.sector_size)
 
         # Once all the partitions have been layed out, we can calculate the
         # minumim disk size
@@ -432,8 +436,8 @@ class PartitionedImage():
 
         # Start is included to the size so we need to substract one from the end.
         end = start + size - 1
-        msger.debug("Added '%s' partition, sectors %d-%d, size %d sectors" %
-                    (parttype, start, end, size))
+        logger.debug("Added '%s' partition, sectors %d-%d, size %d sectors",
+                     parttype, start, end, size)
 
         cmd = "parted -s %s unit s mkpart %s" % (device, parttype)
         if fstype:
@@ -443,20 +447,20 @@ class PartitionedImage():
         return exec_native_cmd(cmd, self.native_sysroot)
 
     def create(self):
-        msger.debug("Creating sparse file %s" % self.path)
+        logger.debug("Creating sparse file %s", self.path)
         with open(self.path, 'w') as sparse:
             os.ftruncate(sparse.fileno(), self.min_size)
 
-        msger.debug("Initializing partition table for %s" % self.path)
+        logger.debug("Initializing partition table for %s", self.path)
         exec_native_cmd("parted -s %s mklabel %s" %
                         (self.path, self.ptable_format), self.native_sysroot)
 
-        msger.debug("Set disk identifier %x" % self.identifier)
+        logger.debug("Set disk identifier %x", self.identifier)
         with open(self.path, 'r+b') as img:
             img.seek(0x1B8)
             img.write(self.identifier.to_bytes(4, 'little'))
 
-        msger.debug("Creating partitions")
+        logger.debug("Creating partitions")
 
         for part in self.partitions:
             if part.num == 0:
@@ -494,39 +498,39 @@ class PartitionedImage():
             # even number of sectors.
             if part.mountpoint == "/boot" and part.fstype in ["vfat", "msdos"] \
                and part.size_sec % 2:
-                msger.debug("Subtracting one sector from '%s' partition to " \
-                            "get even number of sectors for the partition" % \
-                            part.mountpoint)
+                logger.debug("Subtracting one sector from '%s' partition to "
+                             "get even number of sectors for the partition",
+                             part.mountpoint)
                 part.size_sec -= 1
 
             self._create_partition(self.path, part.type,
                                    parted_fs_type, part.start, part.size_sec)
 
             if part.part_type:
-                msger.debug("partition %d: set type UID to %s" % \
-                            (part.num, part.part_type))
+                logger.debug("partition %d: set type UID to %s",
+                             part.num, part.part_type)
                 exec_native_cmd("sgdisk --typecode=%d:%s %s" % \
                                          (part.num, part.part_type,
                                           self.path), self.native_sysroot)
 
             if part.uuid and self.ptable_format == "gpt":
-                msger.debug("partition %d: set UUID to %s" % \
-                            (part.num, part.uuid))
+                logger.debug("partition %d: set UUID to %s",
+                             part.num, part.uuid)
                 exec_native_cmd("sgdisk --partition-guid=%d:%s %s" % \
                                 (part.num, part.uuid, self.path),
                                 self.native_sysroot)
 
             if part.label and self.ptable_format == "gpt":
-                msger.debug("partition %d: set name to %s" % \
-                            (part.num, part.label))
+                logger.debug("partition %d: set name to %s",
+                             part.num, part.label)
                 exec_native_cmd("parted -s %s name %d %s" % \
                                 (self.path, part.num, part.label),
                                 self.native_sysroot)
 
             if part.active:
                 flag_name = "legacy_boot" if self.ptable_format == 'gpt' else "boot"
-                msger.debug("Set '%s' flag for partition '%s' on disk '%s'" % \
-                            (flag_name, part.num, self.path))
+                logger.debug("Set '%s' flag for partition '%s' on disk '%s'",
+                             flag_name, part.num, self.path)
                 exec_native_cmd("parted -s %s set %d %s on" % \
                                 (self.path, part.num, flag_name),
                                 self.native_sysroot)
@@ -540,8 +544,8 @@ class PartitionedImage():
             # isn't necessary).
             if parted_fs_type == "fat16":
                 if self.ptable_format == 'msdos':
-                    msger.debug("Disable 'lba' flag for partition '%s' on disk '%s'" % \
-                                (part.num, self.path))
+                    logger.debug("Disable 'lba' flag for partition '%s' on disk '%s'",
+                                 part.num, self.path)
                     exec_native_cmd("parted -s %s set %d lba off" % \
                                     (self.path, part.num),
                                     self.native_sysroot)
@@ -552,7 +556,7 @@ class PartitionedImage():
             os.remove(image)
 
     def assemble(self):
-        msger.debug("Installing partitions")
+        logger.debug("Installing partitions")
 
         for part in self.partitions:
             source = part.source_file
@@ -560,10 +564,9 @@ class PartitionedImage():
                 # install source_file contents into a partition
                 sparse_copy(source, self.path, part.start * self.sector_size)
 
-                msger.debug("Installed %s in partition %d, sectors %d-%d, "
-                            "size %d sectors" % \
-                            (source, part.num, part.start,
-                             part.start + part.size_sec - 1, part.size_sec))
+                logger.debug("Installed %s in partition %d, sectors %d-%d, "
+                             "size %d sectors", source, part.num, part.start,
+                             part.start + part.size_sec - 1, part.size_sec)
 
                 partimage = self.path + '.p%d' % part.num
                 os.rename(source, partimage)
-- 
2.1.4


