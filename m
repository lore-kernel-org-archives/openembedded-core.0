Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 1EBFC73232
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 14:43:31 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 02 May 2016 07:43:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,567,1455004800"; d="scan'208";a="944477545"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 02 May 2016 07:43:32 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 850666A4007
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 08:31:06 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 May 2016 15:22:36 +0300
Message-Id: <fa143b6a440fc46d8e27738b570879bf2de47e66.1462191317.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1462191317.git.ed.bartosh@linux.intel.com>
References: <cover.1462191317.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1462191317.git.ed.bartosh@linux.intel.com>
References: <cover.1462191317.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v3 5/6] wic: implement --bmap option
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
X-List-Received-Date: Mon, 02 May 2016 14:43:32 -0000

This option enables generation of <image>.bmap file for the
result image using native bmaptool.

[YOCTO #9413]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/creator.py                      |  1 +
 scripts/lib/wic/engine.py                       | 11 ++++++++---
 scripts/lib/wic/imager/direct.py                | 23 +++++++++++++++--------
 scripts/lib/wic/plugins/imager/direct_plugin.py |  3 ++-
 scripts/wic                                     |  3 ++-
 5 files changed, 28 insertions(+), 13 deletions(-)

diff --git a/scripts/lib/wic/creator.py b/scripts/lib/wic/creator.py
index 5231297..6f4af8d 100644
--- a/scripts/lib/wic/creator.py
+++ b/scripts/lib/wic/creator.py
@@ -69,6 +69,7 @@ class Creator(object):
         optparser.add_option('', '--tmpfs', action='store_true', dest='enabletmpfs',
                              help='Setup tmpdir as tmpfs to accelerate, experimental'
                                   ' feature, use it if you have more than 4G memory')
+        optparser.add_option('', '--bmap', action='store_true', help='generate .bmap')
         return optparser
 
     def postoptparse(self, options):
diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 76b93e8..9af6eb4 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -145,7 +145,7 @@ def list_source_plugins():
 
 def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
                native_sysroot, scripts_path, image_output_dir,
-               compressor, debug):
+               compressor, bmap, debug):
     """Create image
 
     wks_file - user-defined OE kickstart file
@@ -156,6 +156,7 @@ def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
     scripts_path - absolute path to /scripts dir
     image_output_dir - dirname to create for image
     compressor - compressor utility to compress the image
+    bmap - enable generation of .bmap
 
     Normally, the values for the build artifacts values are determined
     by 'wic -e' from the output of the 'bitbake -e' command given an
@@ -186,8 +187,12 @@ def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
 
     crobj = creator.Creator()
 
-    crobj.main(["direct", native_sysroot, kernel_dir, bootimg_dir, rootfs_dir,
-                wks_file, image_output_dir, oe_builddir, compressor or ""])
+    cmdline = ["direct", native_sysroot, kernel_dir, bootimg_dir, rootfs_dir,
+                wks_file, image_output_dir, oe_builddir, compressor or ""]
+    if bmap:
+        cmdline.append('--bmap')
+
+    crobj.main(cmdline)
 
     print "\nThe image(s) were created using OE kickstart file:\n  %s" % wks_file
 
diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index 1937042..1b6272e 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -34,7 +34,7 @@ from wic.utils.partitionedfs import Image
 from wic.utils.errors import CreatorError, ImageError
 from wic.imager.baseimager import BaseImageCreator
 from wic.plugin import pluginmgr
-from wic.utils.oe.misc import exec_cmd
+from wic.utils.oe.misc import exec_cmd, exec_native_cmd
 
 disk_methods = {
     "do_install_disk":None,
@@ -52,7 +52,8 @@ class DirectImageCreator(BaseImageCreator):
     """
 
     def __init__(self, oe_builddir, image_output_dir, rootfs_dir, bootimg_dir,
-                 kernel_dir, native_sysroot, compressor, creatoropts=None):
+                 kernel_dir, native_sysroot, compressor, creatoropts=None,
+                 bmap=False):
         """
         Initialize a DirectImageCreator instance.
 
@@ -74,6 +75,7 @@ class DirectImageCreator(BaseImageCreator):
         self.kernel_dir = kernel_dir
         self.native_sysroot = native_sysroot
         self.compressor = compressor
+        self.bmap = bmap
 
     def __get_part_num(self, num, parts):
         """calculate the real partition number, accounting for partitions not
@@ -314,12 +316,17 @@ class DirectImageCreator(BaseImageCreator):
                                                         self.bootimg_dir,
                                                         self.kernel_dir,
                                                         self.native_sysroot)
-        # Compress the image
-        if self.compressor:
-            for disk_name, disk in self.__image.disks.items():
-                full_path = self._full_path(self.__imgdir, disk_name, "direct")
-                msger.debug("Compressing disk %s with %s" % \
-                            (disk_name, self.compressor))
+
+        for disk_name, disk in self.__image.disks.items():
+            full_path = self._full_path(self.__imgdir, disk_name, "direct")
+            # Generate .bmap
+            if self.bmap:
+                msger.debug("Generating bmap file for %s" % disk_name)
+                exec_native_cmd("bmaptool create %s -o %s.bmap" % (full_path, full_path),
+                                self.native_sysroot)
+            # Compress the image
+            if self.compressor:
+                msger.debug("Compressing disk %s with %s" % (disk_name, self.compressor))
                 exec_cmd("%s %s" % (self.compressor, full_path))
 
     def print_outimage_info(self):
diff --git a/scripts/lib/wic/plugins/imager/direct_plugin.py b/scripts/lib/wic/plugins/imager/direct_plugin.py
index 6d3f46c..8fe3930 100644
--- a/scripts/lib/wic/plugins/imager/direct_plugin.py
+++ b/scripts/lib/wic/plugins/imager/direct_plugin.py
@@ -86,7 +86,8 @@ class DirectPlugin(ImagerPlugin):
                                             kernel_dir,
                                             native_sysroot,
                                             compressor,
-                                            creatoropts)
+                                            creatoropts,
+                                            opts.bmap)
 
         try:
             creator.create()
diff --git a/scripts/wic b/scripts/wic
index 2286f20..c4767ce 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -114,6 +114,7 @@ def wic_create_subcommand(args, usage_str):
     parser.add_option("-c", "--compress-with", choices=("gzip", "bzip2", "xz"),
                       dest='compressor',
                       help="compress image with specified compressor")
+    parser.add_option("-m", "--bmap", action="store_true", help="generate .bmap")
     parser.add_option("-v", "--vars", dest='vars_dir',
                       help="directory with <image>.env files that store "
                            "bitbake variables")
@@ -244,7 +245,7 @@ def wic_create_subcommand(args, usage_str):
     print "Creating image(s)...\n"
     engine.wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
                       native_sysroot, scripts_path, image_output_dir,
-                      options.compressor, options.debug)
+                      options.compressor, options.bmap, options.debug)
 
 
 def wic_list_subcommand(args, usage_str):
-- 
2.1.4


