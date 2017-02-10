Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B738671ABF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 15:28:40 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Feb 2017 07:28:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,142,1484035200"; d="scan'208";a="223735378"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 10 Feb 2017 07:28:40 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 151C36A4080
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 07:27:38 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2017 17:05:37 +0200
Message-Id: <eb604b1856a61595c202a38525d6c8e2c17f3d3c.1486738307.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1486738307.git.ed.bartosh@linux.intel.com>
References: <cover.1486738307.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 01/13] wic: move disk operations to PartitionImage class
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
X-List-Received-Date: Fri, 10 Feb 2017 15:28:40 -0000

Disk operations were spread over DirectPlugin, DiskImage and Image
code making the code hard to understand.

Renamed Image class to PartitionedImage.
Removed DiskImage class.
Moved disk operations to PartitionedImage.

There was an implicit support for multiple disks: if different devices
were specified in .wks file (e.g. --ondisk sda and --ondisk sdb), wic
would theoretically generate multiple images. This is quite confusing
option and the code supporting it was broken for a long time. The same
effect (multiple output images) can be achieved in obvious and clear
way - by using multiple .wks files.

This functionality was removed. PartitionedImage works only with
one image. This makes the code less complex and easier to maintain.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/imager/direct.py           |  97 ++++-------
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |   2 +-
 .../lib/wic/plugins/source/isoimage-isohybrid.py   |  10 +-
 .../lib/wic/plugins/source/rootfs_pcbios_ext.py    |   4 +-
 scripts/lib/wic/utils/partitionedfs.py             | 194 ++++++++-------------
 5 files changed, 111 insertions(+), 196 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index a9144e2..fefe88e 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -36,25 +36,8 @@ from wic.plugin import pluginmgr
 from wic.pluginbase import ImagerPlugin
 from wic.utils.errors import CreatorError, ImageError
 from wic.utils.misc import get_bitbake_var, exec_cmd, exec_native_cmd
-from wic.utils.partitionedfs import Image
+from wic.utils.partitionedfs import PartitionedImage
 
-class DiskImage():
-    """
-    A Disk backed by a file.
-    """
-    def __init__(self, device, size):
-        self.size = size
-        self.device = device
-        self.created = False
-
-    def create(self):
-        if self.created:
-            return
-        # create sparse disk image
-        with open(self.device, 'w') as sparse:
-            os.ftruncate(sparse.fileno(), self.size)
-
-        self.created = True
 
 class DirectPlugin(ImagerPlugin):
     """
@@ -189,9 +172,10 @@ class DirectPlugin(ImagerPlugin):
         filesystems from the artifacts directly and combine them into
         a partitioned image.
         """
-        self._image = Image(self.native_sysroot)
+        image_path = self._full_path(self.workdir, self.parts[0].disk, "direct")
+        self._image = PartitionedImage(image_path, self.ptable_format,
+                                       self.native_sysroot)
 
-        disk_ids = {}
         for num, part in enumerate(self.parts, 1):
             # as a convenience, set source to the boot partition source
             # instead of forcing it to be set via bootloader --source
@@ -203,10 +187,8 @@ class DirectPlugin(ImagerPlugin):
                 if self.ptable_format == 'gpt':
                     part.uuid = str(uuid.uuid4())
                 else: # msdos partition table
-                    if part.disk not in disk_ids:
-                        disk_ids[part.disk] = int.from_bytes(os.urandom(4), 'little')
-                    disk_id = disk_ids[part.disk]
-                    part.uuid = '%0x-%02d' % (disk_id, self._get_part_num(num, self.parts))
+                    part.uuid = '%0x-%02d' % (self._image.identifier,
+                                              self._get_part_num(num, self.parts))
 
         fstab_path = self._write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
 
@@ -225,11 +207,6 @@ class DirectPlugin(ImagerPlugin):
                         part.size = int(round(float(rsize_bb)))
             # need to create the filesystems in order to get their
             # sizes before we can add them and do the layout.
-            # Image.create() actually calls __format_disks() to create
-            # the disk images and carve out the partitions, then
-            # self.assemble() calls Image.assemble() which calls
-            # __write_partitition() for each partition to dd the fs
-            # into the partitions.
             part.prepare(self, self.workdir, self.oe_builddir, self.rootfs_dir,
                          self.bootimg_dir, self.kernel_dir, self.native_sysroot)
 
@@ -238,26 +215,14 @@ class DirectPlugin(ImagerPlugin):
         if fstab_path:
             shutil.move(fstab_path + ".orig", fstab_path)
 
-        self._image.layout_partitions(self.ptable_format)
-
-        for disk_name, disk in self._image.disks.items():
-            full_path = self._full_path(self.workdir, disk_name, "direct")
-            msger.debug("Adding disk %s as %s with size %s bytes" \
-                        % (disk_name, full_path, disk['min_size']))
-            disk_obj = DiskImage(full_path, disk['min_size'])
-            self._image.add_disk(disk_name, disk_obj, disk_ids.get(disk_name))
-
+        self._image.layout_partitions()
         self._image.create()
 
     def assemble(self):
         """
-        Assemble partitions into disk image(s)
+        Assemble partitions into disk image
         """
-        for disk_name, disk in self._image.disks.items():
-            full_path = self._full_path(self.workdir, disk_name, "direct")
-            msger.debug("Assembling disk %s as %s with size %s bytes" \
-                        % (disk_name, full_path, disk['min_size']))
-            self._image.assemble(full_path)
+        self._image.assemble()
 
     def finalize(self):
         """
@@ -267,26 +232,25 @@ class DirectPlugin(ImagerPlugin):
         creating and installing a bootloader configuration.
         """
         source_plugin = self.ks.bootloader.source
+        disk_name = self.parts[0].disk
         if source_plugin:
             name = "do_install_disk"
             methods = pluginmgr.get_source_plugin_methods(source_plugin,
                                                           {name: None})
-            for disk_name, disk in self._image.disks.items():
-                methods["do_install_disk"](disk, disk_name, self, self.workdir,
-                                           self.oe_builddir, self.bootimg_dir,
-                                           self.kernel_dir, self.native_sysroot)
-
-        for disk_name, disk in self._image.disks.items():
-            full_path = self._full_path(self.workdir, disk_name, "direct")
-            # Generate .bmap
-            if self.bmap:
-                msger.debug("Generating bmap file for %s" % disk_name)
-                exec_native_cmd("bmaptool create %s -o %s.bmap" % (full_path, full_path),
-                                self.native_sysroot)
-            # Compress the image
-            if self.compressor:
-                msger.debug("Compressing disk %s with %s" % (disk_name, self.compressor))
-                exec_cmd("%s %s" % (self.compressor, full_path))
+            methods["do_install_disk"](self._image, disk_name, self, self.workdir,
+                                       self.oe_builddir, self.bootimg_dir,
+                                       self.kernel_dir, self.native_sysroot)
+
+        full_path = self._image.path
+        # Generate .bmap
+        if self.bmap:
+            msger.debug("Generating bmap file for %s" % disk_name)
+            exec_native_cmd("bmaptool create %s -o %s.bmap" % (full_path, full_path),
+                            self.native_sysroot)
+        # Compress the image
+        if self.compressor:
+            msger.debug("Compressing disk %s with %s" % (disk_name, self.compressor))
+            exec_cmd("%s %s" % (self.compressor, full_path))
 
     def print_info(self):
         """
@@ -294,13 +258,12 @@ class DirectPlugin(ImagerPlugin):
         """
         msg = "The new image(s) can be found here:\n"
 
-        for disk_name in self._image.disks:
-            extension = "direct" + {"gzip": ".gz",
-                                    "bzip2": ".bz2",
-                                    "xz": ".xz",
-                                    None: ""}.get(self.compressor)
-            full_path = self._full_path(self.outdir, disk_name, extension)
-            msg += '  %s\n\n' % full_path
+        extension = "direct" + {"gzip": ".gz",
+                                "bzip2": ".bz2",
+                                "xz": ".xz",
+                                None: ""}.get(self.compressor)
+        full_path = self._full_path(self.outdir, self.parts[0].disk, extension)
+        msg += '  %s\n\n' % full_path
 
         msg += 'The following build artifacts were used to create the image(s):\n'
         for part in self.parts:
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index 4b9b265..0be2b78 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -63,7 +63,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
 
         full_path = creator._full_path(workdir, disk_name, "direct")
         msger.debug("Installing MBR on disk %s as %s with size %s bytes" \
-                    % (disk_name, full_path, disk['min_size']))
+                    % (disk_name, full_path, disk.min_size))
 
         rcode = runner.show(['dd', 'if=%s' % mbrfile,
                              'of=%s' % full_path, 'conv=notrunc'])
diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index ca28bc0..fb34235 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -473,13 +473,12 @@ class IsoImagePlugin(SourcePlugin):
         utility for booting via BIOS from disk storage devices.
         """
 
+        iso_img = "%s.p1" % disk.path
         full_path = creator._full_path(workdir, disk_name, "direct")
-        iso_img = "%s.p1" % full_path
         full_path_iso = creator._full_path(workdir, disk_name, "iso")
 
         isohybrid_cmd = "isohybrid -u %s" % iso_img
-        msger.debug("running command: %s" % \
-                    isohybrid_cmd)
+        msger.debug("running command: %s" % isohybrid_cmd)
         exec_native_cmd(isohybrid_cmd, native_sysroot)
 
         # Replace the image created by direct plugin with the one created by
@@ -487,9 +486,6 @@ class IsoImagePlugin(SourcePlugin):
         # mkisofs has a very specific MBR is system area of the ISO image, and
         # direct plugin adds and configures an another MBR.
         msger.debug("Replaceing the image created by direct plugin\n")
-        os.remove(full_path)
+        os.remove(disk.path)
         shutil.copy2(iso_img, full_path_iso)
         shutil.copy2(full_path_iso, full_path)
-
-        # Remove temporary ISO file
-        os.remove(iso_img)
diff --git a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
index cb1da93..9e79a13 100644
--- a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
+++ b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
@@ -204,9 +204,9 @@ class RootfsPlugin(SourcePlugin):
         if not os.path.exists(mbrfile):
             msger.error("Couldn't find %s. Has syslinux-native been baked?" % mbrfile)
 
-        full_path = disk['disk'].device
+        full_path = disk.path
         msger.debug("Installing MBR on disk %s as %s with size %s bytes" \
-                    % (disk_name, full_path, disk['min_size']))
+                    % (disk_name, full_path, disk.min_size))
 
         ret_code = runner.show(['dd', 'if=%s' % mbrfile, 'of=%s' % full_path, 'conv=notrunc'])
         if ret_code != 0:
diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index 5397bb7..cdf8f08 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -19,6 +19,7 @@
 # Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 
 import os
+
 from wic import msger
 from wic.utils.errors import ImageError
 from wic.utils.misc import exec_native_cmd
@@ -33,50 +34,28 @@ GPT_OVERHEAD = 34
 # Size of a sector in bytes
 SECTOR_SIZE = 512
 
-class Image():
+class PartitionedImage():
     """
-    Generic base object for an image.
-
-    An Image is a container for a set of DiskImages and associated
-    partitions.
+    Partitioned image in a file.
     """
-    def __init__(self, native_sysroot=None):
-        self.disks = {}
+
+    def __init__(self, path, ptable_format, native_sysroot=None):
+        self.path = path  # Path to the image file
+        self.numpart = 0  # Number of allocated partitions
+        self.realpart = 0 # Number of partitions in the partition table
+        self.offset = 0   # Offset of next partition (in sectors)
+        self.min_size = 0 # Minimum required disk size to fit
+                          # all partitions (in bytes)
+        self.ptable_format = ptable_format  # Partition table format
+        # Disk system identifier
+        self.identifier = int.from_bytes(os.urandom(4), 'little')
+
         self.partitions = []
         self.partimages = []
         # Size of a sector used in calculations
         self.sector_size = SECTOR_SIZE
         self.native_sysroot = native_sysroot
 
-    def _add_disk(self, disk_name):
-        """ Add a disk 'disk_name' to the internal list of disks. Note,
-        'disk_name' is the name of the disk in the target system
-        (e.g., sdb). """
-
-        if disk_name in self.disks:
-            # We already have this disk
-            return
-
-        self.disks[disk_name] = \
-                {'disk': None,     # Disk object
-                 'numpart': 0,     # Number of allocate partitions
-                 'realpart': 0,    # Number of partitions in the partition table
-                 'partitions': [], # Indexes to self.partitions
-                 'offset': 0,      # Offset of next partition (in sectors)
-                 # Minimum required disk size to fit all partitions (in bytes)
-                 'min_size': 0,
-                 'ptable_format': "msdos", # Partition table format
-                 'identifier': None} # Disk system identifier
-
-    def add_disk(self, name, disk_obj, identifier):
-        """ Add a disk object which have to be partitioned. More than one disk
-        can be added. In case of multiple disks, disk partitions have to be
-        added for each disk separately with 'add_partition()". """
-
-        self._add_disk(name)
-        self.disks[name]['disk'] = disk_obj
-        self.disks[name]['identifier'] = identifier
-
     def add_partition(self, part):
         """
         Add the next partition. Partitions have to be added in the
@@ -88,24 +67,19 @@ class Image():
         part.size_sec = part.disk_size * 1024 // self.sector_size
 
         self.partitions.append(part)
-        self._add_disk(part.disk)
 
-    def layout_partitions(self, ptable_format="msdos"):
+    def layout_partitions(self):
         """ Layout the partitions, meaning calculate the position of every
         partition on the disk. The 'ptable_format' parameter defines the
         partition table format and may be "msdos". """
 
-        msger.debug("Assigning %s partitions to disks" % ptable_format)
+        msger.debug("Assigning %s partitions to disks" % self.ptable_format)
 
         # Go through partitions in the order they are added in .ks file
         for num in range(len(self.partitions)):
             part = self.partitions[num]
 
-            if part.disk not in self.disks:
-                raise ImageError("No disk %s for partition %s" \
-                                 % (part.disk, part.mountpoint))
-
-            if ptable_format == 'msdos' and part.part_type:
+            if self.ptable_format == 'msdos' and part.part_type:
                 # The --part-type can also be implemented for MBR partitions,
                 # in which case it would map to the 1-byte "partition type"
                 # filed at offset 3 of the partition entry.
@@ -113,27 +87,24 @@ class Image():
                                  "implemented for msdos partitions")
 
             # Get the disk where the partition is located
-            disk = self.disks[part.disk]
-            disk['numpart'] += 1
+            self.numpart += 1
             if not part.no_table:
-                disk['realpart'] += 1
-            disk['ptable_format'] = ptable_format
+                self.realpart += 1
 
-            if disk['numpart'] == 1:
-                if ptable_format == "msdos":
+            if self.numpart == 1:
+                if self.ptable_format == "msdos":
                     overhead = MBR_OVERHEAD
-                elif ptable_format == "gpt":
+                elif self.ptable_format == "gpt":
                     overhead = GPT_OVERHEAD
 
                 # Skip one sector required for the partitioning scheme overhead
-                disk['offset'] += overhead
+                self.offset += overhead
 
-            if disk['realpart'] > 3:
+            if self.realpart > 3:
                 # Reserve a sector for EBR for every logical partition
                 # before alignment is performed.
-                if ptable_format == "msdos":
-                    disk['offset'] += 1
-
+                if self.ptable_format == "msdos":
+                    self.offset += 1
 
             if part.align:
                 # If not first partition and we do have alignment set we need
@@ -142,7 +113,7 @@ class Image():
                 # gaps we could enlargea the previous partition?
 
                 # Calc how much the alignment is off.
-                align_sectors = disk['offset'] % (part.align * 1024 // self.sector_size)
+                align_sectors = self.offset % (part.align * 1024 // self.sector_size)
 
                 if align_sectors:
                     # If partition is not aligned as required, we need
@@ -151,43 +122,41 @@ class Image():
 
                     msger.debug("Realignment for %s%s with %s sectors, original"
                                 " offset %s, target alignment is %sK." %
-                                (part.disk, disk['numpart'], align_sectors,
-                                 disk['offset'], part.align))
+                                (part.disk, self.numpart, align_sectors,
+                                 self.offset, part.align))
 
                     # increase the offset so we actually start the partition on right alignment
-                    disk['offset'] += align_sectors
+                    self.offset += align_sectors
 
-            part.start = disk['offset']
-            disk['offset'] += part.size_sec
+            part.start = self.offset
+            self.offset += part.size_sec
 
             part.type = 'primary'
             if not part.no_table:
-                part.num = disk['realpart']
+                part.num = self.realpart
             else:
                 part.num = 0
 
-            if disk['ptable_format'] == "msdos":
+            if self.ptable_format == "msdos":
                 # only count the partitions that are in partition table
                 if len([p for p in self.partitions if not p.no_table]) > 4:
-                    if disk['realpart'] > 3:
+                    if self.realpart > 3:
                         part.type = 'logical'
-                        part.num = disk['realpart'] + 1
+                        part.num = self.realpart + 1
 
-            disk['partitions'].append(num)
             msger.debug("Assigned %s to %s%d, sectors range %d-%d size %d "
                         "sectors (%d bytes)." \
                             % (part.mountpoint, part.disk, part.num,
-                               part.start, disk['offset'] - 1,
+                               part.start, self.offset - 1,
                                part.size_sec, part.size_sec * self.sector_size))
 
         # Once all the partitions have been layed out, we can calculate the
-        # minumim disk sizes.
-        for disk in self.disks.values():
-            disk['min_size'] = disk['offset']
-            if disk['ptable_format'] == "gpt":
-                disk['min_size'] += GPT_OVERHEAD
+        # minumim disk size
+        self.min_size = self.offset
+        if self.ptable_format == "gpt":
+            self.min_size += GPT_OVERHEAD
 
-            disk['min_size'] *= self.sector_size
+        self.min_size *= self.sector_size
 
     def _create_partition(self, device, parttype, fstype, start, size):
         """ Create a partition on an image described by the 'device' object. """
@@ -205,23 +174,18 @@ class Image():
         return exec_native_cmd(cmd, self.native_sysroot)
 
     def create(self):
-        for dev in self.disks:
-            disk = self.disks[dev]
-            disk['disk'].create()
-
-        for dev in self.disks:
-            disk = self.disks[dev]
-            msger.debug("Initializing partition table for %s" % \
-                        (disk['disk'].device))
-            exec_native_cmd("parted -s %s mklabel %s" % \
-                            (disk['disk'].device, disk['ptable_format']),
-                            self.native_sysroot)
-
-            if disk['identifier']:
-                msger.debug("Set disk identifier %x" % disk['identifier'])
-                with open(disk['disk'].device, 'r+b') as img:
-                    img.seek(0x1B8)
-                    img.write(disk['identifier'].to_bytes(4, 'little'))
+        msger.debug("Creating sparse file %s" % self.path)
+        with open(self.path, 'w') as sparse:
+            os.ftruncate(sparse.fileno(), self.min_size)
+
+        msger.debug("Initializing partition table for %s" % self.path)
+        exec_native_cmd("parted -s %s mklabel %s" %
+                        (self.path, self.ptable_format), self.native_sysroot)
+
+        msger.debug("Set disk identifier %x" % self.identifier)
+        with open(self.path, 'r+b') as img:
+            img.seek(0x1B8)
+            img.write(self.identifier.to_bytes(4, 'little'))
 
         msger.debug("Creating partitions")
 
@@ -229,8 +193,7 @@ class Image():
             if part.num == 0:
                 continue
 
-            disk = self.disks[part.disk]
-            if disk['ptable_format'] == "msdos" and part.num == 5:
+            if self.ptable_format == "msdos" and part.num == 5:
                 # Create an extended partition (note: extended
                 # partition is described in MBR and contains all
                 # logical partitions). The logical partitions save a
@@ -242,9 +205,9 @@ class Image():
                 # starts a sector before the first logical partition,
                 # add a sector at the back, so that there is enough
                 # room for all logical partitions.
-                self._create_partition(disk['disk'].device, "extended",
+                self._create_partition(self.path, "extended",
                                        None, part.start - 1,
-                                       disk['offset'] - part.start + 1)
+                                       self.offset - part.start + 1)
 
             if part.fstype == "swap":
                 parted_fs_type = "linux-swap"
@@ -267,7 +230,7 @@ class Image():
                             part.mountpoint)
                 part.size_sec -= 1
 
-            self._create_partition(disk['disk'].device, part.type,
+            self._create_partition(self.path, part.type,
                                    parted_fs_type, part.start, part.size_sec)
 
             if part.part_type:
@@ -275,71 +238,64 @@ class Image():
                             (part.num, part.part_type))
                 exec_native_cmd("sgdisk --typecode=%d:%s %s" % \
                                          (part.num, part.part_type,
-                                          disk['disk'].device), self.native_sysroot)
+                                          self.path), self.native_sysroot)
 
-            if part.uuid and disk['ptable_format'] == "gpt":
+            if part.uuid and self.ptable_format == "gpt":
                 msger.debug("partition %d: set UUID to %s" % \
                             (part.num, part.uuid))
                 exec_native_cmd("sgdisk --partition-guid=%d:%s %s" % \
-                                (part.num, part.uuid, disk['disk'].device),
+                                (part.num, part.uuid, self.path),
                                 self.native_sysroot)
 
-            if part.label and disk['ptable_format'] == "gpt":
+            if part.label and self.ptable_format == "gpt":
                 msger.debug("partition %d: set name to %s" % \
                             (part.num, part.label))
                 exec_native_cmd("parted -s %s name %d %s" % \
-                                (disk['disk'].device, part.num, part.label),
+                                (self.path, part.num, part.label),
                                 self.native_sysroot)
 
             if part.active:
-                flag_name = "legacy_boot" if disk['ptable_format'] == 'gpt' else "boot"
+                flag_name = "legacy_boot" if self.ptable_format == 'gpt' else "boot"
                 msger.debug("Set '%s' flag for partition '%s' on disk '%s'" % \
-                            (flag_name, part.num, disk['disk'].device))
+                            (flag_name, part.num, self.path))
                 exec_native_cmd("parted -s %s set %d %s on" % \
-                                (disk['disk'].device, part.num, flag_name),
+                                (self.path, part.num, flag_name),
                                 self.native_sysroot)
             if part.system_id:
                 exec_native_cmd("sfdisk --part-type %s %s %s" % \
-                                (disk['disk'].device, part.num, part.system_id),
+                                (self.path, part.num, part.system_id),
                                 self.native_sysroot)
 
             # Parted defaults to enabling the lba flag for fat16 partitions,
             # which causes compatibility issues with some firmware (and really
             # isn't necessary).
             if parted_fs_type == "fat16":
-                if disk['ptable_format'] == 'msdos':
+                if self.ptable_format == 'msdos':
                     msger.debug("Disable 'lba' flag for partition '%s' on disk '%s'" % \
-                                (part.num, disk['disk'].device))
+                                (part.num, self.path))
                     exec_native_cmd("parted -s %s set %d lba off" % \
-                                    (disk['disk'].device, part.num),
+                                    (self.path, part.num),
                                     self.native_sysroot)
 
     def cleanup(self):
-        if self.disks:
-            for dev in self.disks:
-                disk = self.disks[dev]
-                if hasattr(disk['disk'], 'cleanup'):
-                    disk['disk'].cleanup()
-
         # remove partition images
         for image in self.partimages:
-            if os.path.isfile(image):
-                os.remove(image)
+            os.remove(image)
 
-    def assemble(self, image_file):
+    def assemble(self):
         msger.debug("Installing partitions")
 
         for part in self.partitions:
             source = part.source_file
             if source:
                 # install source_file contents into a partition
-                sparse_copy(source, image_file, part.start * self.sector_size)
+                sparse_copy(source, self.path, part.start * self.sector_size)
 
                 msger.debug("Installed %s in partition %d, sectors %d-%d, "
                             "size %d sectors" % \
                             (source, part.num, part.start,
                              part.start + part.size_sec - 1, part.size_sec))
 
-                partimage = image_file + '.p%d' % part.num
+                partimage = self.path + '.p%d' % part.num
                 os.rename(source, partimage)
                 self.partimages.append(partimage)
-- 
2.1.4


