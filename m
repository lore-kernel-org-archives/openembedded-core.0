Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id 7AFF660089
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Feb 2015 22:52:03 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id 38F5D380; Sun,  8 Feb 2015 23:52:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id EEEF132B;
	Sun,  8 Feb 2015 23:52:08 +0100 (CET)
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Tom Zanussi <tom.zanussi@linux.intel.com>
Date: Sun,  8 Feb 2015 23:52:00 +0100
Message-Id: <1423435920-20498-1-git-send-email-alexandre.belloni@free-electrons.com>
X-Mailer: git-send-email 2.1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] wic: allow creation of partitions not in table
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
X-List-Received-Date: Sun, 08 Feb 2015 22:52:07 -0000

For some architectures it is necessary to reserve space on disk without
it being present in the partition table.

For example, u-boot on i.mx is placed at an offset of 1kB on the sdcard.
While it would be possible to create a partition at that offset and
place u-boot there, it would then be necessary to update the default
u-boot environment to use partition 2 on the mmc instead of partition 1.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
Changes in v2:
 - Fixed the fstab generation
 - rebased on master


 scripts/lib/image/help.py                          |  6 +++++
 scripts/lib/wic/imager/direct.py                   | 31 +++++++++++++++-------
 .../lib/wic/kickstart/custom_commands/partition.py |  6 +++++
 scripts/lib/wic/utils/partitionedfs.py             | 20 ++++++++++----
 4 files changed, 48 insertions(+), 15 deletions(-)

diff --git a/scripts/lib/image/help.py b/scripts/lib/image/help.py
index 0d8a6adfaa71..aab0b609afd5 100644
--- a/scripts/lib/image/help.py
+++ b/scripts/lib/image/help.py
@@ -737,6 +737,12 @@ DESCRIPTION
                               to start a partition on an x KBytes
                               boundary.
 
+         --no-table: This option is specific to wic. Space will be
+                     reserved for the partition and it will be
+                     populated but it will not be added to the
+                     partition table. It may be useful for
+                     bootloaders.
+
     * bootloader
 
       This command allows the user to specify various bootloader
diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index b1dc3e96f456..38d4e78e6273 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -74,6 +74,22 @@ class DirectImageCreator(BaseImageCreator):
         self.kernel_dir = kernel_dir
         self.native_sysroot = native_sysroot
 
+    def __get_part_num(self, num, parts):
+        """calculate the real partition number, accounting for partitions not
+        in the partition table and logical partitions
+        """
+        realnum = 0
+        for n, p in enumerate(parts, 1):
+            if not p.no_table:
+                realnum += 1
+            if n == num:
+                if  p.no_table:
+                    return 0
+                if self._ptable_format == 'msdos' and realnum > 3:
+                    # account for logical partition numbering, ex. sda5..
+                    return realnum + 1
+                return realnum
+
     def __write_fstab(self, image_rootfs):
         """overriden to generate fstab (temporarily) in rootfs. This is called
         from _create, make sure it doesn't get called from
@@ -98,7 +114,8 @@ class DirectImageCreator(BaseImageCreator):
     def _update_fstab(self, fstab_lines, parts):
         """Assume partition order same as in wks"""
         for num, p in enumerate(parts, 1):
-            if not p.mountpoint or p.mountpoint == "/" or p.mountpoint == "/boot":
+            pnum = self.__get_part_num(num, parts)
+            if not p.mountpoint or p.mountpoint == "/" or p.mountpoint == "/boot" or pnum == 0:
                 continue
 
             part = ''
@@ -106,11 +123,6 @@ class DirectImageCreator(BaseImageCreator):
             if p.disk.startswith('mmcblk'):
                 part = 'p'
 
-            pnum = num
-            if self._ptable_format == 'msdos' and pnum > 3:
-                # account for logical partition numbering, ex. sda5..
-                pnum += 1
-
             device_name = "/dev/" + p.disk + part + str(pnum)
 
             opts = "defaults"
@@ -262,6 +274,7 @@ class DirectImageCreator(BaseImageCreator):
                                        fsopts = p.fsopts,
                                        boot = p.active,
                                        align = p.align,
+                                       no_table = p.no_table,
                                        part_type = p.part_type)
 
         self.__image.layout_partitions(self._ptable_format)
@@ -350,10 +363,8 @@ class DirectImageCreator(BaseImageCreator):
                 if p.disk.startswith('mmcblk'):
                     part = 'p'
 
-                if self._ptable_format == 'msdos' and num > 3:
-                    rootdev = "/dev/%s%s%-d" % (p.disk, part, num + 1)
-                else:
-                    rootdev = "/dev/%s%s%-d" % (p.disk, part, num)
+                pnum = self.__get_part_num(num, parts)
+                rootdev = "/dev/%s%s%-d" % (p.disk, part, pnum)
                 root_part_uuid = p.part_type
 
         return (rootdev, root_part_uuid)
diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index 7a307065f289..9be6b0457b48 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -49,6 +49,7 @@ class Wic_PartData(Mic_PartData):
         self.source = kwargs.get("source", None)
         self.sourceparams = kwargs.get("sourceparams", None)
         self.rootfs = kwargs.get("rootfs-dir", None)
+        self.no_table = kwargs.get("no-table", False)
         self.source_file = ""
         self.size = 0
 
@@ -61,6 +62,8 @@ class Wic_PartData(Mic_PartData):
                 retval += " --sourceparams=%s" % self.sourceparams
             if self.rootfs:
                 retval += " --rootfs-dir=%s" % self.rootfs
+        if self.no_table:
+            retval += " --no-table"
 
         return retval
 
@@ -521,4 +524,7 @@ class Wic_Partition(Mic_Partition):
         # use specified rootfs path to fill the partition
         op.add_option("--rootfs-dir", type="string", action="store",
                       dest="rootfs", default=None)
+        # wether to add the partition in the partition table
+        op.add_option("--no-table", dest="no_table", action="store_true",
+                      default=False)
         return op
diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index c72bb29b027c..87d2929f6c8a 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -61,6 +61,7 @@ class Image:
         self.disks[disk_name] = \
                 { 'disk': None,     # Disk object
                   'numpart': 0,     # Number of allocate partitions
+                  'realpart': 0,    # Number of partitions in the partition table
                   'partitions': [], # Indexes to self.partitions
                   'offset': 0,      # Offset of next partition (in sectors)
                   # Minimum required disk size to fit all partitions (in bytes)
@@ -85,7 +86,7 @@ class Image:
         self.__add_disk(part['disk_name'])
 
     def add_partition(self, size, disk_name, mountpoint, source_file = None, fstype = None,
-                      label=None, fsopts = None, boot = False, align = None,
+                      label=None, fsopts = None, boot = False, align = None, no_table=False,
                       part_type = None):
         """ Add the next partition. Prtitions have to be added in the
         first-to-last order. """
@@ -109,6 +110,7 @@ class Image:
                      'num': None, # Partition number
                      'boot': boot, # Bootable flag
                      'align': align, # Partition alignment
+                     'no_table' : no_table, # Partition does not appear in partition table
                      'part_type' : part_type } # Partition type
 
             self.__add_partition(part)
@@ -147,6 +149,8 @@ class Image:
             # Get the disk where the partition is located
             d = self.disks[p['disk_name']]
             d['numpart'] += 1
+            if not p['no_table']:
+                d['realpart'] += 1
             d['ptable_format'] = ptable_format
 
             if d['numpart'] == 1:
@@ -156,7 +160,7 @@ class Image:
                 # Skip one sector required for the partitioning scheme overhead
                 d['offset'] += overhead
 
-            elif d['numpart'] > 3:
+            if d['realpart'] > 3:
                 # Reserve a sector for EBR for every logical partition
                 # before alignment is performed.
                 if ptable_format == "msdos":
@@ -189,12 +193,15 @@ class Image:
             d['offset'] += p['size']
 
             p['type'] = 'primary'
-            p['num'] = d['numpart']
+            if not p['no_table']:
+                p['num'] = d['realpart']
+            else:
+                p['num'] = 0
 
             if d['ptable_format'] == "msdos":
-                if d['numpart'] > 3:
+                if d['realpart'] > 3:
                     p['type'] = 'logical'
-                    p['num'] = d['numpart'] + 1
+                    p['num'] = d['realpart'] + 1
 
             d['partitions'].append(n)
             msger.debug("Assigned %s to %s%d, sectors range %d-%d size %d "
@@ -256,6 +263,9 @@ class Image:
         msger.debug("Creating partitions")
 
         for p in self.partitions:
+            if p['num'] == 0:
+                continue
+
             d = self.disks[p['disk_name']]
             if d['ptable_format'] == "msdos" and p['num'] == 5:
                 # Create an extended partition (note: extended
-- 
2.1.0


