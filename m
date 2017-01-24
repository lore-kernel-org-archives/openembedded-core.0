Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2DEB27727F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 14:07:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 24 Jan 2017 06:07:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,278,1477983600"; d="scan'208";a="1086720876"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 24 Jan 2017 06:07:29 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id ACC756A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 06:06:32 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2017 15:43:53 +0200
Message-Id: <55e9f1ffb7514c12bfefb68b0018446442ec6ee0.1485264964.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485264964.git.ed.bartosh@linux.intel.com>
References: <cover.1485264964.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 5/8] wic: direct.py: get rid of names with two underscores
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
X-List-Received-Date: Tue, 24 Jan 2017 14:07:30 -0000

Attributes with two leading underscores are mangled in Python
and used mainly for avoiding name clashes with names from
subclasses. They're not needed in most of wic classes.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/imager/direct.py | 50 +++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 26 deletions(-)

diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index 6340a59..575fd95 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -99,7 +99,7 @@ class DirectImageCreator:
         self.compressor = compressor
         self.bmap = bmap
 
-    def __get_part_num(self, num, parts):
+    def _get_part_num(self, num, parts):
         """calculate the real partition number, accounting for partitions not
         in the partition table and logical partitions
         """
@@ -142,7 +142,7 @@ class DirectImageCreator:
         """Assume partition order same as in wks"""
         updated = False
         for num, part in enumerate(parts, 1):
-            pnum = self.__get_part_num(num, parts)
+            pnum = self._get_part_num(num, parts)
             if not pnum or not part.mountpoint \
                or part.mountpoint in ("/", "/boot"):
                 continue
@@ -209,7 +209,7 @@ class DirectImageCreator:
     #
     # Actual implemention
     #
-    def _create(self):
+    def create(self):
         """
         For 'wic', we already have our build artifacts - we just create
         filesystems from the artifacts directly and combine them into
@@ -217,7 +217,7 @@ class DirectImageCreator:
         """
         parts = self._get_parts()
 
-        self.__image = Image(self.native_sysroot)
+        self._image = Image(self.native_sysroot)
 
         disk_ids = {}
         for num, part in enumerate(parts, 1):
@@ -234,7 +234,7 @@ class DirectImageCreator:
                     if part.disk not in disk_ids:
                         disk_ids[part.disk] = int.from_bytes(os.urandom(4), 'little')
                     disk_id = disk_ids[part.disk]
-                    part.uuid = '%0x-%02d' % (disk_id, self.__get_part_num(num, parts))
+                    part.uuid = '%0x-%02d' % (disk_id, self._get_part_num(num, parts))
 
         fstab_path = self._write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
 
@@ -262,7 +262,7 @@ class DirectImageCreator:
                          self.bootimg_dir, self.kernel_dir, self.native_sysroot)
 
 
-            self.__image.add_partition(part.disk_size,
+            self._image.add_partition(part.disk_size,
                                        part.disk,
                                        part.mountpoint,
                                        part.source_file,
@@ -279,28 +279,27 @@ class DirectImageCreator:
         if fstab_path:
             shutil.move(fstab_path + ".orig", fstab_path)
 
-        self.__image.layout_partitions(self.ptable_format)
+        self._image.layout_partitions(self.ptable_format)
 
-        self.__imgdir = self.workdir
-        for disk_name, disk in self.__image.disks.items():
-            full_path = self._full_path(self.__imgdir, disk_name, "direct")
+        for disk_name, disk in self._image.disks.items():
+            full_path = self._full_path(self.workdir, disk_name, "direct")
             msger.debug("Adding disk %s as %s with size %s bytes" \
                         % (disk_name, full_path, disk['min_size']))
             disk_obj = DiskImage(full_path, disk['min_size'])
-            self.__disks[disk_name] = disk_obj
-            self.__image.add_disk(disk_name, disk_obj, disk_ids.get(disk_name))
+            #self._disks[disk_name] = disk_obj
+            self._image.add_disk(disk_name, disk_obj, disk_ids.get(disk_name))
 
-        self.__image.create()
+        self._image.create()
 
     def assemble(self):
         """
         Assemble partitions into disk image(s)
         """
-        for disk_name, disk in self.__image.disks.items():
-            full_path = self._full_path(self.__imgdir, disk_name, "direct")
+        for disk_name, disk in self._image.disks.items():
+            full_path = self._full_path(self.workdir, disk_name, "direct")
             msger.debug("Assembling disk %s as %s with size %s bytes" \
                         % (disk_name, full_path, disk['min_size']))
-            self.__image.assemble(full_path)
+            self._image.assemble(full_path)
 
     def finalize(self):
         """
@@ -308,12 +307,11 @@ class DirectImageCreator:
 
         For example, prepare the image to be bootable by e.g.
         creating and installing a bootloader configuration.
-
         """
         source_plugin = self.get_default_source_plugin()
         if source_plugin:
             self._source_methods = pluginmgr.get_source_plugin_methods(source_plugin, disk_methods)
-            for disk_name, disk in self.__image.disks.items():
+            for disk_name, disk in self._image.disks.items():
                 self._source_methods["do_install_disk"](disk, disk_name, self,
                                                         self.workdir,
                                                         self.oe_builddir,
@@ -321,8 +319,8 @@ class DirectImageCreator:
                                                         self.kernel_dir,
                                                         self.native_sysroot)
 
-        for disk_name, disk in self.__image.disks.items():
-            full_path = self._full_path(self.__imgdir, disk_name, "direct")
+        for disk_name, disk in self._image.disks.items():
+            full_path = self._full_path(self.workdir, disk_name, "direct")
             # Generate .bmap
             if self.bmap:
                 msger.debug("Generating bmap file for %s" % disk_name)
@@ -341,12 +339,12 @@ class DirectImageCreator:
 
         parts = self._get_parts()
 
-        for disk_name in self.__image.disks:
+        for disk_name in self._image.disks:
             extension = "direct" + {"gzip": ".gz",
                                     "bzip2": ".bz2",
                                     "xz": ".xz",
                                     "": ""}.get(self.compressor)
-            full_path = self._full_path(self.__imgdir, disk_name, extension)
+            full_path = self._full_path(self.outdir, disk_name, extension)
             msg += '  %s\n\n' % full_path
 
         msg += 'The following build artifacts were used to create the image(s):\n'
@@ -380,13 +378,13 @@ class DirectImageCreator:
                     return "PARTUUID=%s" % part.uuid
                 else:
                     suffix = 'p' if part.disk.startswith('mmcblk') else ''
-                    pnum = self.__get_part_num(num, parts)
+                    pnum = self._get_part_num(num, parts)
                     return "/dev/%s%s%-d" % (part.disk, suffix, pnum)
 
-    def _cleanup(self):
-        if not self.__image is None:
+    def cleanup(self):
+        if self._image:
             try:
-                self.__image.cleanup()
+                self._image.cleanup()
             except ImageError as err:
                 msger.warning("%s" % err)
 
-- 
2.1.4


