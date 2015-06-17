Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 370A773CF5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 11:26:04 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 17 Jun 2015 04:26:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,632,1427785200"; d="scan'208";a="729135785"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jun 2015 04:26:06 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 17C276A4083;
	Wed, 17 Jun 2015 04:25:28 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jun 2015 14:25:23 +0300
Message-Id: <1434540323-8308-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] wic: Code cleanup: bad-classmethod-argument
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
X-List-Received-Date: Wed, 17 Jun 2015 11:26:07 -0000

Fixed wrong name for the first argument in class methods.
Pylint complains about the issue this way:
    Class method should have 'cls' as first argument

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/pluginbase.py                       |  8 ++++----
 scripts/lib/wic/plugins/imager/direct_plugin.py     |  6 +++---
 scripts/lib/wic/plugins/source/bootimg-efi.py       | 12 ++++++------
 scripts/lib/wic/plugins/source/bootimg-partition.py |  6 +++---
 scripts/lib/wic/plugins/source/bootimg-pcbios.py    |  6 +++---
 scripts/lib/wic/plugins/source/fsimage.py           |  6 +++---
 scripts/lib/wic/plugins/source/rawcopy.py           |  6 +++---
 scripts/lib/wic/plugins/source/rootfs.py            |  4 ++--
 8 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/scripts/lib/wic/pluginbase.py b/scripts/lib/wic/pluginbase.py
index 72bcad2..50e442d 100644
--- a/scripts/lib/wic/pluginbase.py
+++ b/scripts/lib/wic/pluginbase.py
@@ -52,7 +52,7 @@ class SourcePlugin(_Plugin):
     """
 
     @classmethod
-    def do_install_disk(self, disk, disk_name, cr, workdir, oe_builddir,
+    def do_install_disk(cls, disk, disk_name, cr, workdir, oe_builddir,
                         bootimg_dir, kernel_dir, native_sysroot):
         """
         Called after all partitions have been prepared and assembled into a
@@ -62,7 +62,7 @@ class SourcePlugin(_Plugin):
         msger.debug("SourcePlugin: do_install_disk: disk: %s" % disk_name)
 
     @classmethod
-    def do_stage_partition(self, part, source_params, cr, cr_workdir,
+    def do_stage_partition(cls, part, source_params, cr, cr_workdir,
                            oe_builddir, bootimg_dir, kernel_dir,
                            native_sysroot):
         """
@@ -79,7 +79,7 @@ class SourcePlugin(_Plugin):
         msger.debug("SourcePlugin: do_stage_partition: part: %s" % part)
 
     @classmethod
-    def do_configure_partition(self, part, source_params, cr, cr_workdir,
+    def do_configure_partition(cls, part, source_params, cr, cr_workdir,
                                oe_builddir, bootimg_dir, kernel_dir,
                                native_sysroot):
         """
@@ -90,7 +90,7 @@ class SourcePlugin(_Plugin):
         msger.debug("SourcePlugin: do_configure_partition: part: %s" % part)
 
     @classmethod
-    def do_prepare_partition(self, part, source_params, cr, cr_workdir,
+    def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
                              oe_builddir, bootimg_dir, kernel_dir, rootfs_dir,
                              native_sysroot):
         """
diff --git a/scripts/lib/wic/plugins/imager/direct_plugin.py b/scripts/lib/wic/plugins/imager/direct_plugin.py
index ff974b2..07811bd 100644
--- a/scripts/lib/wic/plugins/imager/direct_plugin.py
+++ b/scripts/lib/wic/plugins/imager/direct_plugin.py
@@ -45,7 +45,7 @@ class DirectPlugin(ImagerPlugin):
     name = 'direct'
 
     @classmethod
-    def __rootfs_dir_to_dict(self, rootfs_dirs):
+    def __rootfs_dir_to_dict(cls, rootfs_dirs):
         """
         Gets a string that contain 'connection=dir' splitted by
         space and return a dict
@@ -58,7 +58,7 @@ class DirectPlugin(ImagerPlugin):
         return krootfs_dir
 
     @classmethod
-    def do_create(self, subcmd, opts, *args):
+    def do_create(cls, subcmd, opts, *args):
         """
         Create direct image, called from creator as 'direct' cmd
         """
@@ -76,7 +76,7 @@ class DirectPlugin(ImagerPlugin):
         image_output_dir = args[5]
         oe_builddir = args[6]
 
-        krootfs_dir = self.__rootfs_dir_to_dict(rootfs_dir)
+        krootfs_dir = cls.__rootfs_dir_to_dict(rootfs_dir)
 
         configmgr._ksconf = ksconf
 
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index f47fc82..903b478 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -42,7 +42,7 @@ class BootimgEFIPlugin(SourcePlugin):
     name = 'bootimg-efi'
 
     @classmethod
-    def do_configure_grubefi(self, hdddir, cr, cr_workdir):
+    def do_configure_grubefi(cls, hdddir, cr, cr_workdir):
         """
         Create loader-specific (grub-efi) config
         """
@@ -76,7 +76,7 @@ class BootimgEFIPlugin(SourcePlugin):
         cfg.close()
 
     @classmethod
-    def do_configure_gummiboot(self, hdddir, cr, cr_workdir):
+    def do_configure_gummiboot(cls, hdddir, cr, cr_workdir):
         """
         Create loader-specific (gummiboot) config
         """
@@ -117,7 +117,7 @@ class BootimgEFIPlugin(SourcePlugin):
 
 
     @classmethod
-    def do_configure_partition(self, part, source_params, cr, cr_workdir,
+    def do_configure_partition(cls, part, source_params, cr, cr_workdir,
                                oe_builddir, bootimg_dir, kernel_dir,
                                native_sysroot):
         """
@@ -132,9 +132,9 @@ class BootimgEFIPlugin(SourcePlugin):
 
         try:
             if source_params['loader'] == 'grub-efi':
-                self.do_configure_grubefi(hdddir, cr, cr_workdir)
+                cls.do_configure_grubefi(hdddir, cr, cr_workdir)
             elif source_params['loader'] == 'gummiboot':
-                self.do_configure_gummiboot(hdddir, cr, cr_workdir)
+                cls.do_configure_gummiboot(hdddir, cr, cr_workdir)
             else:
                 msger.error("unrecognized bootimg-efi loader: %s" % source_params['loader'])
         except KeyError:
@@ -142,7 +142,7 @@ class BootimgEFIPlugin(SourcePlugin):
 
 
     @classmethod
-    def do_prepare_partition(self, part, source_params, cr, cr_workdir,
+    def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
                              oe_builddir, bootimg_dir, kernel_dir,
                              rootfs_dir, native_sysroot):
         """
diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
index 9168dd0..bc2ca0f 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -40,7 +40,7 @@ class BootimgPartitionPlugin(SourcePlugin):
     name = 'bootimg-partition'
 
     @classmethod
-    def do_install_disk(self, disk, disk_name, cr, workdir, oe_builddir,
+    def do_install_disk(cls, disk, disk_name, cr, workdir, oe_builddir,
                         bootimg_dir, kernel_dir, native_sysroot):
         """
         Called after all partitions have been prepared and assembled into a
@@ -49,7 +49,7 @@ class BootimgPartitionPlugin(SourcePlugin):
         pass
 
     @classmethod
-    def do_configure_partition(self, part, source_params, cr, cr_workdir,
+    def do_configure_partition(cls, part, source_params, cr, cr_workdir,
                                oe_builddir, bootimg_dir, kernel_dir,
                                native_sysroot):
         """
@@ -60,7 +60,7 @@ class BootimgPartitionPlugin(SourcePlugin):
         pass
 
     @classmethod
-    def do_prepare_partition(self, part, source_params, cr, cr_workdir,
+    def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
                              oe_builddir, bootimg_dir, kernel_dir,
                              rootfs_dir, native_sysroot):
         """
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index bfde93a..6ca68f6 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -41,7 +41,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
     name = 'bootimg-pcbios'
 
     @classmethod
-    def do_install_disk(self, disk, disk_name, cr, workdir, oe_builddir,
+    def do_install_disk(cls, disk, disk_name, cr, workdir, oe_builddir,
                         bootimg_dir, kernel_dir, native_sysroot):
         """
         Called after all partitions have been prepared and assembled into a
@@ -68,7 +68,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
             raise ImageError("Unable to set MBR to %s" % full_path)
 
     @classmethod
-    def do_configure_partition(self, part, source_params, cr, cr_workdir,
+    def do_configure_partition(cls, part, source_params, cr, cr_workdir,
                                oe_builddir, bootimg_dir, kernel_dir,
                                native_sysroot):
         """
@@ -117,7 +117,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
         cfg.close()
 
     @classmethod
-    def do_prepare_partition(self, part, source_params, cr, cr_workdir,
+    def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
                              oe_builddir, bootimg_dir, kernel_dir,
                              rootfs_dir, native_sysroot):
         """
diff --git a/scripts/lib/wic/plugins/source/fsimage.py b/scripts/lib/wic/plugins/source/fsimage.py
index 3751ff2..98f02a1 100644
--- a/scripts/lib/wic/plugins/source/fsimage.py
+++ b/scripts/lib/wic/plugins/source/fsimage.py
@@ -29,7 +29,7 @@ class FSImagePlugin(SourcePlugin):
     name = 'fsimage'
 
     @classmethod
-    def do_install_disk(self, disk, disk_name, cr, workdir, oe_builddir,
+    def do_install_disk(cls, disk, disk_name, cr, workdir, oe_builddir,
                         bootimg_dir, kernel_dir, native_sysroot):
         """
         Called after all partitions have been prepared and assembled into a
@@ -38,7 +38,7 @@ class FSImagePlugin(SourcePlugin):
         pass
 
     @classmethod
-    def do_configure_partition(self, part, source_params, cr, cr_workdir,
+    def do_configure_partition(cls, part, source_params, cr, cr_workdir,
                                oe_builddir, bootimg_dir, kernel_dir,
                                native_sysroot):
         """
@@ -48,7 +48,7 @@ class FSImagePlugin(SourcePlugin):
         pass
 
     @classmethod
-    def do_prepare_partition(self, part, source_params, cr, cr_workdir,
+    def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
                              oe_builddir, bootimg_dir, kernel_dir,
                              rootfs_dir, native_sysroot):
         """
diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
index 848b9b7..071b2d2 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -29,7 +29,7 @@ class RawCopyPlugin(SourcePlugin):
     name = 'rawcopy'
 
     @classmethod
-    def do_install_disk(self, disk, disk_name, cr, workdir, oe_builddir,
+    def do_install_disk(cls, disk, disk_name, cr, workdir, oe_builddir,
                         bootimg_dir, kernel_dir, native_sysroot):
         """
         Called after all partitions have been prepared and assembled into a
@@ -38,7 +38,7 @@ class RawCopyPlugin(SourcePlugin):
         pass
 
     @classmethod
-    def do_configure_partition(self, part, source_params, cr, cr_workdir,
+    def do_configure_partition(cls, part, source_params, cr, cr_workdir,
                                oe_builddir, bootimg_dir, kernel_dir,
                                native_sysroot):
         """
@@ -48,7 +48,7 @@ class RawCopyPlugin(SourcePlugin):
         pass
 
     @classmethod
-    def do_prepare_partition(self, part, source_params, cr, cr_workdir,
+    def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
                              oe_builddir, bootimg_dir, kernel_dir,
                              rootfs_dir, native_sysroot):
         """
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index ca3d398..12fbf67 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -58,7 +58,7 @@ class RootfsPlugin(SourcePlugin):
         return image_rootfs_dir
 
     @classmethod
-    def do_prepare_partition(self, part, source_params, cr, cr_workdir,
+    def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
                              oe_builddir, bootimg_dir, kernel_dir,
                              krootfs_dir, native_sysroot):
         """
@@ -81,7 +81,7 @@ class RootfsPlugin(SourcePlugin):
                 msg += " or it is not a valid path, exiting"
                 msger.error(msg % part.rootfs)
 
-        real_rootfs_dir = self.__get_rootfs_dir(rootfs_dir)
+        real_rootfs_dir = cls.__get_rootfs_dir(rootfs_dir)
 
         part.set_rootfs(real_rootfs_dir)
         part.prepare_rootfs(cr_workdir, oe_builddir, real_rootfs_dir, native_sysroot)
-- 
2.1.4


