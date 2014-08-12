Return-Path: <tom.zanussi@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 73DCA65E14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 01:35:44 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Aug 2014 18:35:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,846,1400050800"; d="scan'208";a="586753772"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO localhost)
	([10.255.12.45])
	by orsmga002.jf.intel.com with ESMTP; 11 Aug 2014 18:35:45 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Aug 2014 20:35:37 -0500
Message-Id: <d32ac08b42a7030f7545cae5491ee217d0396392.1407806939.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <e3fcfa6ac6fbbcf83a82a3e7a730f87626aea615.1407806939.git.tom.zanussi@linux.intel.com>
References: <e3fcfa6ac6fbbcf83a82a3e7a730f87626aea615.1407806939.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1407806939.git.tom.zanussi@linux.intel.com>
References: <cover.1407806939.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 3/7] wic: Add sourceparam param to partition plugin methods
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
X-List-Received-Date: Tue, 12 Aug 2014 01:35:44 -0000

The sourceparam param allows source plugins to be parameterized
generically (via --sourceparams="key=val[,key=val], implemented
previously).

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/wic/kickstart/custom_commands/partition.py |  6 +++---
 scripts/lib/wic/pluginbase.py                          | 15 +++++++++------
 scripts/lib/wic/plugins/source/bootimg-efi.py          | 10 ++++++----
 scripts/lib/wic/plugins/source/bootimg-pcbios.py       | 10 ++++++----
 scripts/lib/wic/plugins/source/rootfs.py               |  5 +++--
 5 files changed, 27 insertions(+), 19 deletions(-)

diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index 3920adb..76cf7a9 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -143,16 +143,16 @@ class Wic_PartData(Mic_PartData):
             msger.error("The '%s' --source specified for %s doesn't exist.\n\tSee 'wic list source-plugins' for a list of available --sources.\n\tSee 'wic help source-plugins' for details on adding a new source plugin." % (self.source, self.mountpoint))
 
         self._source_methods = pluginmgr.get_source_plugin_methods(self.source, partition_methods)
-        self._source_methods["do_configure_partition"](self, cr, cr_workdir,
+        self._source_methods["do_configure_partition"](self, None, cr, cr_workdir,
                                                        oe_builddir,
                                                        bootimg_dir,
                                                        kernel_dir,
                                                        native_sysroot)
-        self._source_methods["do_stage_partition"](self, cr, cr_workdir,
+        self._source_methods["do_stage_partition"](self, None, cr, cr_workdir,
                                                    oe_builddir,
                                                    bootimg_dir, kernel_dir,
                                                    native_sysroot)
-        self._source_methods["do_prepare_partition"](self, cr, cr_workdir,
+        self._source_methods["do_prepare_partition"](self, None, cr, cr_workdir,
                                                      oe_builddir,
                                                      bootimg_dir, kernel_dir, rootfs_dir,
                                                      native_sysroot)
diff --git a/scripts/lib/wic/pluginbase.py b/scripts/lib/wic/pluginbase.py
index 06f318f..b8b3a46 100644
--- a/scripts/lib/wic/pluginbase.py
+++ b/scripts/lib/wic/pluginbase.py
@@ -64,8 +64,9 @@ class SourcePlugin(_Plugin):
         msger.debug("SourcePlugin: do_install_disk: disk: %s" % disk_name)
 
     @classmethod
-    def do_stage_partition(self, part, cr, workdir, oe_builddir, bootimg_dir,
-                           kernel_dir, native_sysroot):
+    def do_stage_partition(self, part, source_params, cr, cr_workdir,
+                           oe_builddir, bootimg_dir, kernel_dir,
+                           native_sysroot):
         """
         Special content staging hook called before do_prepare_partition(),
         normally empty.
@@ -80,8 +81,9 @@ class SourcePlugin(_Plugin):
         msger.debug("SourcePlugin: do_stage_partition: part: %s" % part)
 
     @classmethod
-    def do_configure_partition(self, part, cr, cr_workdir, oe_builddir,
-                               bootimg_dir, kernel_dir, native_sysroot):
+    def do_configure_partition(self, part, source_params, cr, cr_workdir,
+                               oe_builddir, bootimg_dir, kernel_dir,
+                               native_sysroot):
         """
         Called before do_prepare_partition(), typically used to create
         custom configuration files for a partition, for example
@@ -90,8 +92,9 @@ class SourcePlugin(_Plugin):
         msger.debug("SourcePlugin: do_configure_partition: part: %s" % part)
 
     @classmethod
-    def do_prepare_partition(self, part, cr, cr_workdir, oe_builddir, bootimg_dir,
-                             kernel_dir, rootfs_dir, native_sysroot):
+    def do_prepare_partition(self, part, source_params, cr, cr_workdir,
+                             oe_builddir, bootimg_dir, kernel_dir, rootfs_dir,
+                             native_sysroot):
         """
         Called to do the actual content population for a partition i.e. it
         'prepares' the partition to be incorporated into the image.
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 53f1782..ea94fd2 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -42,8 +42,9 @@ class BootimgEFIPlugin(SourcePlugin):
     name = 'bootimg-efi'
 
     @classmethod
-    def do_configure_partition(self, part, cr, cr_workdir, oe_builddir,
-                               bootimg_dir, kernel_dir, native_sysroot):
+    def do_configure_partition(self, source_params, part, cr, cr_workdir,
+                               oe_builddir, bootimg_dir, kernel_dir,
+                               native_sysroot):
         """
         Called before do_prepare_partition(), creates grubefi config
         """
@@ -92,8 +93,9 @@ class BootimgEFIPlugin(SourcePlugin):
         cfg.close()
 
     @classmethod
-    def do_prepare_partition(self, part, cr, cr_workdir, oe_builddir, bootimg_dir,
-                             kernel_dir, rootfs_dir, native_sysroot):
+    def do_prepare_partition(self, part, source_params, cr, cr_workdir,
+                             oe_builddir, bootimg_dir, kernel_dir,
+                             rootfs_dir, native_sysroot):
         """
         Called to do the actual content population for a partition i.e. it
         'prepares' the partition to be incorporated into the image.
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index bd2225e..aceed20 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -65,8 +65,9 @@ class BootimgPcbiosPlugin(SourcePlugin):
             raise ImageError("Unable to set MBR to %s" % full_path)
 
     @classmethod
-    def do_configure_partition(self, part, cr, cr_workdir, oe_builddir,
-                               bootimg_dir, kernel_dir, native_sysroot):
+    def do_configure_partition(self, part, source_params, cr, cr_workdir,
+                               oe_builddir, bootimg_dir, kernel_dir,
+                               native_sysroot):
         """
         Called before do_prepare_partition(), creates syslinux config
         """
@@ -118,8 +119,9 @@ class BootimgPcbiosPlugin(SourcePlugin):
         cfg.close()
 
     @classmethod
-    def do_prepare_partition(self, part, cr, cr_workdir, oe_builddir, bootimg_dir,
-                             kernel_dir, rootfs_dir, native_sysroot):
+    def do_prepare_partition(self, part, source_params, cr, cr_workdir,
+                             oe_builddir, bootimg_dir, kernel_dir,
+                             rootfs_dir, native_sysroot):
         """
         Called to do the actual content population for a partition i.e. it
         'prepares' the partition to be incorporated into the image.
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index 919e97e..a432a18 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -62,8 +62,9 @@ class RootfsPlugin(SourcePlugin):
         return image_rootfs_dir
 
     @classmethod
-    def do_prepare_partition(self, part, cr, cr_workdir, oe_builddir, bootimg_dir,
-                             kernel_dir, krootfs_dir, native_sysroot):
+    def do_prepare_partition(self, part, source_params, cr, cr_workdir,
+                             oe_builddir, bootimg_dir, kernel_dir,
+                             krootfs_dir, native_sysroot):
         """
         Called to do the actual content population for a partition i.e. it
         'prepares' the partition to be incorporated into the image.
-- 
1.8.3.1


