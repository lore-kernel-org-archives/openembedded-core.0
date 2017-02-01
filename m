Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 40A89772F4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 14:11:25 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 01 Feb 2017 06:11:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; d="scan'208";a="1089677367"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 01 Feb 2017 06:11:26 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id D7DB96A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 06:10:26 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2017 15:48:13 +0200
Message-Id: <325ffefb83af2ec62f7b93c22d46e10456fdb822.1485953483.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485953483.git.ed.bartosh@linux.intel.com>
References: <cover.1485953483.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 06/18] wic: improve naming in direct_plugin classes
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
X-List-Received-Date: Wed, 01 Feb 2017 14:11:26 -0000

Synchronized attribure names in DirectImageCreator and
DirectPlugin for better readability. Simplified code,
removed unneeded global variable disk_methods.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/imager/direct_plugin.py | 62 +++++++++----------------
 1 file changed, 22 insertions(+), 40 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct_plugin.py b/scripts/lib/wic/plugins/imager/direct_plugin.py
index c6df5fb..48588db 100644
--- a/scripts/lib/wic/plugins/imager/direct_plugin.py
+++ b/scripts/lib/wic/plugins/imager/direct_plugin.py
@@ -58,50 +58,33 @@ class DirectPlugin(ImagerPlugin):
         """
         Create direct image, called from creator as 'direct' cmd
         """
-        if len(args) != 8:
-            raise errors.Usage("Extra arguments given")
-
-        native_sysroot = args[0]
-        kernel_dir = args[1]
-        bootimg_dir = args[2]
-        rootfs_dir = args[3]
-
-        ksconf = args[4]
-
-        image_output_dir = args[5]
-        oe_builddir = args[6]
-        compressor = args[7]
+        native_sysroot, kernel_dir, bootimg_dir, rootfs_dir, ksconf, \
+            outdir, oe_builddir, compressor = args
 
         try:
             ksobj = KickStart(ksconf)
         except KickStartError as err:
             msger.error(str(err))
 
-        image_name = "%s-%s" % (splitext(basename(ksconf))[0],
+        name = "%s-%s" % (splitext(basename(ksconf))[0],
                           strftime("%Y%m%d%H%M"))
 
         # parse possible 'rootfs=name' items
         krootfs_dir = dict(rdir.split('=') for rdir in rootfs_dir.split(' '))
 
-        creator = DirectImageCreator(image_name, ksobj, oe_builddir,
-                                     image_output_dir, krootfs_dir,
-                                     bootimg_dir, kernel_dir, native_sysroot,
-                                     compressor, opts.bmap)
+        creator = DirectImageCreator(name, ksobj, oe_builddir, outdir,
+                                     krootfs_dir, bootimg_dir, kernel_dir,
+                                     native_sysroot, compressor, opts.bmap)
         try:
             creator.create()
             creator.assemble()
             creator.finalize()
-            creator.print_outimage_info()
-
+            creator.print_info()
         except errors.CreatorError:
             raise
         finally:
             creator.cleanup()
 
-disk_methods = {
-    "do_install_disk":None,
-}
-
 class DiskImage():
     """
     A Disk backed by a file.
@@ -134,22 +117,22 @@ class DirectImageCreator:
     media and used on actual hardware.
     """
 
-    def __init__(self, image_name, ksobj, oe_builddir, image_output_dir,
-                 rootfs_dir, bootimg_dir, kernel_dir, native_sysroot,
-                 compressor, bmap=False):
+    def __init__(self, name, ksobj, oe_builddir, outdir,
+                 rootfs_dir, bootimg_dir, kernel_dir,
+                 native_sysroot, compressor, bmap=False):
         """
         Initialize a DirectImageCreator instance.
 
         This method takes the same arguments as ImageCreator.__init__()
         """
-        self.name = image_name
-        self.outdir = image_output_dir
+        self.name = name
+        self.outdir = outdir
         self.workdir = tempfile.mktemp(prefix='wic')
         self.ks = ksobj
 
-        self.__image = None
-        self.__disks = {}
-        self.__disk_format = "direct"
+        self._image = None
+        self._disks = {}
+        self._disk_format = "direct"
         self._disk_names = []
         self.ptable_format = self.ks.bootloader.ptable
 
@@ -372,14 +355,13 @@ class DirectImageCreator:
         """
         source_plugin = self.get_default_source_plugin()
         if source_plugin:
-            self._source_methods = pluginmgr.get_source_plugin_methods(source_plugin, disk_methods)
+            name = "do_install_disk"
+            methods = pluginmgr.get_source_plugin_methods(source_plugin,
+                                                          {name: None})
             for disk_name, disk in self._image.disks.items():
-                self._source_methods["do_install_disk"](disk, disk_name, self,
-                                                        self.workdir,
-                                                        self.oe_builddir,
-                                                        self.bootimg_dir,
-                                                        self.kernel_dir,
-                                                        self.native_sysroot)
+                methods["do_install_disk"](disk, disk_name, self, self.workdir,
+                                           self.oe_builddir, self.bootimg_dir,
+                                           self.kernel_dir, self.native_sysroot)
 
         for disk_name, disk in self._image.disks.items():
             full_path = self._full_path(self.workdir, disk_name, "direct")
@@ -393,7 +375,7 @@ class DirectImageCreator:
                 msger.debug("Compressing disk %s with %s" % (disk_name, self.compressor))
                 exec_cmd("%s %s" % (self.compressor, full_path))
 
-    def print_outimage_info(self):
+    def print_info(self):
         """
         Print the image(s) and artifacts used, for the user.
         """
-- 
2.1.4


