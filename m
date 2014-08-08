Return-Path: <tom.zanussi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7D22370A6C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 22:08:04 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 08 Aug 2014 15:07:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,827,1400050800"; d="scan'208";a="582200683"
Received: from unknown (HELO localhost) ([10.255.12.19])
	by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2014 15:07:03 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Aug 2014 17:05:54 -0500
Message-Id: <d98a30d47ade89a2de53b0fc32ead2bba46b7eeb.1407533201.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
References: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1407533201.git.tom.zanussi@linux.intel.com>
References: <cover.1407533201.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 29/35] wic: Update/rename install-related code
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
X-List-Received-Date: Fri, 08 Aug 2014 22:08:04 -0000

The wic code inherited a basic image-creation flow based on installing
packages, but wic doesn't actually install anything, so rename parts
of the code dealing with installing to something more appropriate.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/imager/direct.py                | 50 ++++++++++++-------------
 scripts/lib/mic/plugins/imager/direct_plugin.py |  2 +-
 scripts/lib/mic/utils/partitionedfs.py          | 16 ++++----
 3 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/scripts/lib/mic/imager/direct.py b/scripts/lib/mic/imager/direct.py
index 91f64d5..8d7b6ee 100644
--- a/scripts/lib/mic/imager/direct.py
+++ b/scripts/lib/mic/imager/direct.py
@@ -62,7 +62,7 @@ class DirectImageCreator(BaseImageCreator):
         """
         BaseImageCreator.__init__(self, creatoropts)
 
-        self.__instimage = None
+        self.__image = None
         self.__disks = {}
         self.__disk_format = "direct"
         self._disk_names = []
@@ -226,7 +226,7 @@ class DirectImageCreator(BaseImageCreator):
         """
         parts = self._get_parts()
 
-        self.__instimage = PartitionedMount()
+        self.__image = PartitionedMount()
 
         for p in parts:
             # as a convenience, set source to the boot partition source
@@ -250,39 +250,39 @@ class DirectImageCreator(BaseImageCreator):
 
             self._restore_fstab(fstab)
 
-            self.__instimage.add_partition(int(p.size),
-                                           p.disk,
-                                           p.mountpoint,
-                                           p.source_file,
-                                           p.fstype,
-                                           p.label,
-                                           fsopts = p.fsopts,
-                                           boot = p.active,
-                                           align = p.align,
-                                           part_type = p.part_type)
+            self.__image.add_partition(int(p.size),
+                                       p.disk,
+                                       p.mountpoint,
+                                       p.source_file,
+                                       p.fstype,
+                                       p.label,
+                                       fsopts = p.fsopts,
+                                       boot = p.active,
+                                       align = p.align,
+                                       part_type = p.part_type)
 
-        self.__instimage.layout_partitions(self._ptable_format)
+        self.__image.layout_partitions(self._ptable_format)
 
         self.__imgdir = self.workdir
-        for disk_name, disk in self.__instimage.disks.items():
+        for disk_name, disk in self.__image.disks.items():
             full_path = self._full_path(self.__imgdir, disk_name, "direct")
             msger.debug("Adding disk %s as %s with size %s bytes" \
                         % (disk_name, full_path, disk['min_size']))
             disk_obj = fs_related.DiskImage(full_path, disk['min_size'])
             self.__disks[disk_name] = disk_obj
-            self.__instimage.add_disk(disk_name, disk_obj)
+            self.__image.add_disk(disk_name, disk_obj)
 
-        self.__instimage.create()
+        self.__image.create()
 
-    def install(self):
+    def assemble(self):
         """
-        Install fs images into partitions
+        Assemble partitions into disk image(s)
         """
-        for disk_name, disk in self.__instimage.disks.items():
+        for disk_name, disk in self.__image.disks.items():
             full_path = self._full_path(self.__imgdir, disk_name, "direct")
-            msger.debug("Installing disk %s as %s with size %s bytes" \
+            msger.debug("Assembling disk %s as %s with size %s bytes" \
                         % (disk_name, full_path, disk['min_size']))
-            self.__instimage.install(full_path)
+            self.__image.assemble(full_path)
 
     def configure(self):
         """
@@ -294,7 +294,7 @@ class DirectImageCreator(BaseImageCreator):
         source_plugin = self.get_default_source_plugin()
         if source_plugin:
             self._source_methods = pluginmgr.get_source_plugin_methods(source_plugin, disk_methods)
-            for disk_name, disk in self.__instimage.disks.items():
+            for disk_name, disk in self.__image.disks.items():
                 self._source_methods["do_install_disk"](disk, disk_name, self,
                                                         self.workdir,
                                                         self.oe_builddir,
@@ -310,7 +310,7 @@ class DirectImageCreator(BaseImageCreator):
 
         parts = self._get_parts()
 
-        for disk_name, disk in self.__instimage.disks.items():
+        for disk_name, disk in self.__image.disks.items():
             full_path = self._full_path(self.__imgdir, disk_name, "direct")
             msg += '  %s\n\n' % full_path
 
@@ -355,9 +355,9 @@ class DirectImageCreator(BaseImageCreator):
         return (rootdev, root_part_uuid)
 
     def _cleanup(self):
-        if not self.__instimage is None:
+        if not self.__image is None:
             try:
-                self.__instimage.cleanup()
+                self.__image.cleanup()
             except MountError, err:
                 msger.warning("%s" % err)
 
diff --git a/scripts/lib/mic/plugins/imager/direct_plugin.py b/scripts/lib/mic/plugins/imager/direct_plugin.py
index da18b65..2cbd5d1 100644
--- a/scripts/lib/mic/plugins/imager/direct_plugin.py
+++ b/scripts/lib/mic/plugins/imager/direct_plugin.py
@@ -92,7 +92,7 @@ class DirectPlugin(ImagerPlugin):
 
         try:
             creator.create()
-            creator.install()
+            creator.assemble()
             creator.configure()
             creator.print_outimage_info()
 
diff --git a/scripts/lib/mic/utils/partitionedfs.py b/scripts/lib/mic/utils/partitionedfs.py
index 43a38a9..2f950a6 100644
--- a/scripts/lib/mic/utils/partitionedfs.py
+++ b/scripts/lib/mic/utils/partitionedfs.py
@@ -309,11 +309,11 @@ class PartitionedMount:
                 except:
                     pass
 
-    def __install_partition(self, num, source_file, start, size):
+    def __write_partition(self, num, source_file, start, size):
         """
         Install source_file contents into a partition.
         """
-        if not source_file: # nothing to install
+        if not source_file: # nothing to write
             return
 
         # Start is included in the size so need to substract one from the end.
@@ -325,7 +325,7 @@ class PartitionedMount:
         exec_cmd(dd_cmd)
 
 
-    def install(self, image_file):
+    def assemble(self, image_file):
         msger.debug("Installing partitions")
 
         self.image_file = image_file
@@ -337,12 +337,12 @@ class PartitionedMount:
                 # of the first _logical_ partition. This is why the extended
                 # partition should start one sector before the first logical
                 # partition.
-                self.__install_partition(p['num'], p['source_file'],
-                                         p['start'] - 1,
-                                         d['offset'] - p['start'])
+                self.__write_partition(p['num'], p['source_file'],
+                                       p['start'] - 1,
+                                       d['offset'] - p['start'])
 
-            self.__install_partition(p['num'], p['source_file'],
-                                     p['start'], p['size'])
+            self.__write_partition(p['num'], p['source_file'],
+                                   p['start'], p['size'])
 
     def create(self):
         for dev in self.disks.keys():
-- 
1.8.3.1


