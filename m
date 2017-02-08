Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1179771C9B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 19:14:38 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 08 Feb 2017 11:14:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,348,1484035200"; d="scan'208";a="931635528"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 08 Feb 2017 11:14:38 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 647766A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 11:13:37 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Feb 2017 20:51:29 +0200
Message-Id: <8ed0c49ae2a3e9ed4f0c9a931ae8504be4f256cc.1486579259.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1486579259.git.ed.bartosh@linux.intel.com>
References: <cover.1486579259.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 5/9] wic: use the same partition object in direct and partitionedfs
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
X-List-Received-Date: Wed, 08 Feb 2017 19:14:38 -0000

Partition attributes were copied to the dictionary in partitionedfs
code, which makes the code hard to follow.

Used partition object passed from direct.py module as is in
partitionedfs.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/partition.py             |   2 +
 scripts/lib/wic/plugins/imager/direct.py |   9 +-
 scripts/lib/wic/utils/partitionedfs.py   | 158 ++++++++++++++-----------------
 3 files changed, 73 insertions(+), 96 deletions(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 69b369c..754ad75 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -38,12 +38,14 @@ class Partition():
         self.active = args.active
         self.align = args.align
         self.disk = args.disk
+        self.device = None
         self.extra_space = args.extra_space
         self.fsopts = args.fsopts
         self.fstype = args.fstype
         self.label = args.label
         self.mountpoint = args.mountpoint
         self.no_table = args.no_table
+        self.num = None
         self.overhead_factor = args.overhead_factor
         self.part_type = args.part_type
         self.rootfs_dir = args.rootfs_dir
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 71ffc36..663655a 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -237,14 +237,7 @@ class DirectPlugin(ImagerPlugin):
             part.prepare(self, self.workdir, self.oe_builddir, self.rootfs_dir,
                          self.bootimg_dir, self.kernel_dir, self.native_sysroot)
 
-
-            self._image.add_partition(part.disk_size, part.disk,
-                                      part.mountpoint, part.source_file,
-                                      part.fstype, part.label,
-                                      fsopts=part.fsopts, boot=part.active,
-                                      align=part.align, no_table=part.no_table,
-                                      part_type=part.part_type, uuid=part.uuid,
-                                      system_id=part.system_id)
+            self._image.add_partition(part)
 
         if fstab_path:
             shutil.move(fstab_path + ".orig", fstab_path)
diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index b7ab1d5..fb5c0c2 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -71,47 +71,29 @@ class Image():
                  'ptable_format': "msdos", # Partition table format
                  'identifier': None} # Disk system identifier
 
-    def add_disk(self, disk_name, disk_obj, identifier):
+    def add_disk(self, name, disk_obj, identifier):
         """ Add a disk object which have to be partitioned. More than one disk
         can be added. In case of multiple disks, disk partitions have to be
         added for each disk separately with 'add_partition()". """
 
-        self._add_disk(disk_name)
-        self.disks[disk_name]['disk'] = disk_obj
-        self.disks[disk_name]['identifier'] = identifier
+        self._add_disk(name)
+        self.disks[name]['disk'] = disk_obj
+        self.disks[name]['identifier'] = identifier
 
-    def add_partition(self, size, disk_name, mountpoint, source_file=None, fstype=None,
-                      label=None, fsopts=None, boot=False, align=None, no_table=False,
-                      part_type=None, uuid=None, system_id=None):
-        """ Add the next partition. Partitions have to be added in the
-        first-to-last order. """
-
-        ks_pnum = len(self.partitions)
+    def add_partition(self, part):
+        """
+        Add the next partition. Partitions have to be added in the
+        first-to-last order.
+        """
+        part.ks_pnum = len(self.partitions)
 
         # Converting kB to sectors for parted
-        size = size * 1024 // self.sector_size
-
-        part = {'ks_pnum': ks_pnum, # Partition number in the KS file
-                'size': size, # In sectors
-                'mountpoint': mountpoint, # Mount relative to chroot
-                'source_file': source_file, # partition contents
-                'fstype': fstype, # Filesystem type
-                'fsopts': fsopts, # Filesystem mount options
-                'label': label, # Partition label
-                'disk_name': disk_name, # physical disk name holding partition
-                'device': None, # kpartx device node for partition
-                'num': None, # Partition number
-                'boot': boot, # Bootable flag
-                'align': align, # Partition alignment
-                'no_table' : no_table, # Partition does not appear in partition table
-                'part_type' : part_type, # Partition type
-                'uuid': uuid, # Partition UUID
-                'system_id': system_id} # Partition system id
+        part.size_sec = part.disk_size * 1024 // self.sector_size
 
         assert not self._partitions_layed_out
 
         self.partitions.append(part)
-        self._add_disk(part['disk_name'])
+        self._add_disk(part.disk)
 
     def layout_partitions(self, ptable_format="msdos"):
         """ Layout the partitions, meaning calculate the position of every
@@ -129,11 +111,11 @@ class Image():
         for num in range(len(self.partitions)):
             part = self.partitions[num]
 
-            if part['disk_name'] not in self.disks:
+            if part.disk not in self.disks:
                 raise ImageError("No disk %s for partition %s" \
-                                 % (part['disk_name'], part['mountpoint']))
+                                 % (part.disk, part.mountpoint))
 
-            if ptable_format == 'msdos' and part['part_type']:
+            if ptable_format == 'msdos' and part.part_type:
                 # The --part-type can also be implemented for MBR partitions,
                 # in which case it would map to the 1-byte "partition type"
                 # filed at offset 3 of the partition entry.
@@ -141,9 +123,9 @@ class Image():
                                  "implemented for msdos partitions")
 
             # Get the disk where the partition is located
-            disk = self.disks[part['disk_name']]
+            disk = self.disks[part.disk]
             disk['numpart'] += 1
-            if not part['no_table']:
+            if not part.no_table:
                 disk['realpart'] += 1
             disk['ptable_format'] = ptable_format
 
@@ -163,50 +145,50 @@ class Image():
                     disk['offset'] += 1
 
 
-            if part['align']:
+            if part.align:
                 # If not first partition and we do have alignment set we need
                 # to align the partition.
                 # FIXME: This leaves a empty spaces to the disk. To fill the
                 # gaps we could enlargea the previous partition?
 
                 # Calc how much the alignment is off.
-                align_sectors = disk['offset'] % (part['align'] * 1024 // self.sector_size)
+                align_sectors = disk['offset'] % (part.align * 1024 // self.sector_size)
 
                 if align_sectors:
                     # If partition is not aligned as required, we need
                     # to move forward to the next alignment point
-                    align_sectors = (part['align'] * 1024 // self.sector_size) - align_sectors
+                    align_sectors = (part.align * 1024 // self.sector_size) - align_sectors
 
                     msger.debug("Realignment for %s%s with %s sectors, original"
                                 " offset %s, target alignment is %sK." %
-                                (part['disk_name'], disk['numpart'], align_sectors,
-                                 disk['offset'], part['align']))
+                                (part.disk, disk['numpart'], align_sectors,
+                                 disk['offset'], part.align))
 
                     # increase the offset so we actually start the partition on right alignment
                     disk['offset'] += align_sectors
 
-            part['start'] = disk['offset']
-            disk['offset'] += part['size']
+            part.start = disk['offset']
+            disk['offset'] += part.size_sec
 
-            part['type'] = 'primary'
-            if not part['no_table']:
-                part['num'] = disk['realpart']
+            part.type = 'primary'
+            if not part.no_table:
+                part.num = disk['realpart']
             else:
-                part['num'] = 0
+                part.num = 0
 
             if disk['ptable_format'] == "msdos":
                 # only count the partitions that are in partition table
-                if len([p for p in self.partitions if not p['no_table']]) > 4:
+                if len([p for p in self.partitions if not p.no_table]) > 4:
                     if disk['realpart'] > 3:
-                        part['type'] = 'logical'
-                        part['num'] = disk['realpart'] + 1
+                        part.type = 'logical'
+                        part.num = disk['realpart'] + 1
 
             disk['partitions'].append(num)
             msger.debug("Assigned %s to %s%d, sectors range %d-%d size %d "
                         "sectors (%d bytes)." \
-                            % (part['mountpoint'], part['disk_name'], part['num'],
-                               part['start'], disk['offset'] - 1,
-                               part['size'], part['size'] * self.sector_size))
+                            % (part.mountpoint, part.disk, part.num,
+                               part.start, disk['offset'] - 1,
+                               part.size_sec, part.size_sec * self.sector_size))
 
         # Once all the partitions have been layed out, we can calculate the
         # minumim disk sizes.
@@ -256,11 +238,11 @@ class Image():
         msger.debug("Creating partitions")
 
         for part in self.partitions:
-            if part['num'] == 0:
+            if part.num == 0:
                 continue
 
-            disk = self.disks[part['disk_name']]
-            if disk['ptable_format'] == "msdos" and part['num'] == 5:
+            disk = self.disks[part.disk]
+            if disk['ptable_format'] == "msdos" and part.num == 5:
                 # Create an extended partition (note: extended
                 # partition is described in MBR and contains all
                 # logical partitions). The logical partitions save a
@@ -273,16 +255,16 @@ class Image():
                 # add a sector at the back, so that there is enough
                 # room for all logical partitions.
                 self._create_partition(disk['disk'].device, "extended",
-                                       None, part['start'] - 1,
-                                       disk['offset'] - part['start'] + 1)
+                                       None, part.start - 1,
+                                       disk['offset'] - part.start + 1)
 
-            if part['fstype'] == "swap":
+            if part.fstype == "swap":
                 parted_fs_type = "linux-swap"
-            elif part['fstype'] == "vfat":
+            elif part.fstype == "vfat":
                 parted_fs_type = "fat32"
-            elif part['fstype'] == "msdos":
+            elif part.fstype == "msdos":
                 parted_fs_type = "fat16"
-            elif part['fstype'] == "ontrackdm6aux3":
+            elif part.fstype == "ontrackdm6aux3":
                 parted_fs_type = "ontrackdm6aux3"
             else:
                 # Type for ext2/ext3/ext4/btrfs
@@ -290,47 +272,47 @@ class Image():
 
             # Boot ROM of OMAP boards require vfat boot partition to have an
             # even number of sectors.
-            if part['mountpoint'] == "/boot" and part['fstype'] in ["vfat", "msdos"] \
-               and part['size'] % 2:
+            if part.mountpoint == "/boot" and part.fstype in ["vfat", "msdos"] \
+               and part.size_sec % 2:
                 msger.debug("Subtracting one sector from '%s' partition to " \
                             "get even number of sectors for the partition" % \
-                            part['mountpoint'])
-                part['size'] -= 1
+                            part.mountpoint)
+                part.size_sec -= 1
 
-            self._create_partition(disk['disk'].device, part['type'],
-                                   parted_fs_type, part['start'], part['size'])
+            self._create_partition(disk['disk'].device, part.type,
+                                   parted_fs_type, part.start, part.size_sec)
 
-            if part['part_type']:
+            if part.part_type:
                 msger.debug("partition %d: set type UID to %s" % \
-                            (part['num'], part['part_type']))
+                            (part.num, part.part_type))
                 exec_native_cmd("sgdisk --typecode=%d:%s %s" % \
-                                         (part['num'], part['part_type'],
+                                         (part.num, part.part_type,
                                           disk['disk'].device), self.native_sysroot)
 
-            if part['uuid'] and disk['ptable_format'] == "gpt":
+            if part.uuid and disk['ptable_format'] == "gpt":
                 msger.debug("partition %d: set UUID to %s" % \
-                            (part['num'], part['uuid']))
+                            (part.num, part.uuid))
                 exec_native_cmd("sgdisk --partition-guid=%d:%s %s" % \
-                                (part['num'], part['uuid'], disk['disk'].device),
+                                (part.num, part.uuid, disk['disk'].device),
                                 self.native_sysroot)
 
-            if part['label'] and disk['ptable_format'] == "gpt":
+            if part.label and disk['ptable_format'] == "gpt":
                 msger.debug("partition %d: set name to %s" % \
-                            (part['num'], part['label']))
+                            (part.num, part.label))
                 exec_native_cmd("parted -s %s name %d %s" % \
-                                (disk['disk'].device, part['num'], part['label']),
+                                (disk['disk'].device, part.num, part.label),
                                 self.native_sysroot)
 
-            if part['boot']:
+            if part.active:
                 flag_name = "legacy_boot" if disk['ptable_format'] == 'gpt' else "boot"
                 msger.debug("Set '%s' flag for partition '%s' on disk '%s'" % \
-                            (flag_name, part['num'], disk['disk'].device))
+                            (flag_name, part.num, disk['disk'].device))
                 exec_native_cmd("parted -s %s set %d %s on" % \
-                                (disk['disk'].device, part['num'], flag_name),
+                                (disk['disk'].device, part.num, flag_name),
                                 self.native_sysroot)
-            if part['system_id']:
+            if part.system_id:
                 exec_native_cmd("sfdisk --part-type %s %s %s" % \
-                                (disk['disk'].device, part['num'], part['system_id']),
+                                (disk['disk'].device, part.num, part.system_id),
                                 self.native_sysroot)
 
             # Parted defaults to enabling the lba flag for fat16 partitions,
@@ -339,9 +321,9 @@ class Image():
             if parted_fs_type == "fat16":
                 if disk['ptable_format'] == 'msdos':
                     msger.debug("Disable 'lba' flag for partition '%s' on disk '%s'" % \
-                                (part['num'], disk['disk'].device))
+                                (part.num, disk['disk'].device))
                     exec_native_cmd("parted -s %s set %d lba off" % \
-                                    (disk['disk'].device, part['num']),
+                                    (disk['disk'].device, part.num),
                                     self.native_sysroot)
 
     def cleanup(self):
@@ -360,16 +342,16 @@ class Image():
         msger.debug("Installing partitions")
 
         for part in self.partitions:
-            source = part['source_file']
+            source = part.source_file
             if source:
                 # install source_file contents into a partition
-                sparse_copy(source, image_file, part['start'] * self.sector_size)
+                sparse_copy(source, image_file, part.start * self.sector_size)
 
                 msger.debug("Installed %s in partition %d, sectors %d-%d, "
                             "size %d sectors" % \
-                            (source, part['num'], part['start'],
-                             part['start'] + part['size'] - 1, part['size']))
+                            (source, part.num, part.start,
+                             part.start + part.size_sec - 1, part.size_sec))
 
-                partimage = image_file + '.p%d' % part['num']
+                partimage = image_file + '.p%d' % part.num
                 os.rename(source, partimage)
                 self.partimages.append(partimage)
-- 
2.1.4


