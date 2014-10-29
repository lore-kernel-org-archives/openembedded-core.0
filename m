Return-Path: <tom.zanussi@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 321F871479
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 22:04:54 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 29 Oct 2014 15:04:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,280,1413270000"; d="scan'208";a="613702452"
Received: from enewy-mobl1.amr.corp.intel.com (HELO localhost) ([10.254.56.8])
	by fmsmga001.fm.intel.com with ESMTP; 29 Oct 2014 15:04:45 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: philip@balister.org, maciej.borzecki@open-rnd.pl,
	openembedded-core@lists.openembedded.org
Date: Wed, 29 Oct 2014 17:04:23 -0500
Message-Id: <5e045c34d048703e00197f57b78c6e22ab655cc5.1414618765.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <92a50f084bc31cb2824d01435737b85be99f0d1d.1414618765.git.tom.zanussi@linux.intel.com>
References: <92a50f084bc31cb2824d01435737b85be99f0d1d.1414618765.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1414618765.git.tom.zanussi@linux.intel.com>
References: <cover.1414618765.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 5/6] wic: Remove special-case bootimg_dir
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
X-List-Received-Date: Wed, 29 Oct 2014 22:04:57 -0000

The first iterations of wic very shortsightedly catered to two
specific use-cases and added special-purpose params for those cases so
that they could be directly given their corresponding boot artifacts.
(hdddir and staging_data_dir).

As more use-cases are added, it becomes rather obvious that such a
scheme doens't scale, and additionally causes confusion for plugin
writers.

This removes those special cases and states explicitly in the help
text that plugins are responsible for locating their own boot
artifacts.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/image/engine.py                      | 37 ++++++------------------
 scripts/lib/image/help.py                        |  2 +-
 scripts/lib/wic/imager/direct.py                 |  5 +---
 scripts/lib/wic/plugins/imager/direct_plugin.py  | 20 +++++--------
 scripts/lib/wic/plugins/source/bootimg-efi.py    |  5 ++--
 scripts/lib/wic/plugins/source/bootimg-pcbios.py |  3 +-
 scripts/wic                                      | 12 ++++----
 7 files changed, 27 insertions(+), 57 deletions(-)

diff --git a/scripts/lib/image/engine.py b/scripts/lib/image/engine.py
index f1df8b4..e794545 100644
--- a/scripts/lib/image/engine.py
+++ b/scripts/lib/image/engine.py
@@ -67,7 +67,7 @@ def find_artifacts(image_name):
     """
     bitbake_env_lines = get_bitbake_env_lines()
 
-    rootfs_dir = kernel_dir = hdddir = staging_data_dir = native_sysroot = ""
+    rootfs_dir = kernel_dir = bootimg_dir = native_sysroot = ""
 
     for line in bitbake_env_lines.split('\n'):
         if (get_line_val(line, "IMAGE_ROOTFS")):
@@ -76,17 +76,11 @@ def find_artifacts(image_name):
         if (get_line_val(line, "STAGING_KERNEL_DIR")):
             kernel_dir = get_line_val(line, "STAGING_KERNEL_DIR")
             continue
-        if (get_line_val(line, "HDDDIR")):
-            hdddir = get_line_val(line, "HDDDIR")
-            continue
-        if (get_line_val(line, "STAGING_DATADIR")):
-            staging_data_dir = get_line_val(line, "STAGING_DATADIR")
-            continue
         if (get_line_val(line, "STAGING_DIR_NATIVE")):
             native_sysroot = get_line_val(line, "STAGING_DIR_NATIVE")
             continue
 
-    return (rootfs_dir, kernel_dir, hdddir, staging_data_dir, native_sysroot)
+    return (rootfs_dir, kernel_dir, bootimg_dir, native_sysroot)
 
 
 CANNED_IMAGE_DIR = "lib/image/canned-wks" # relative to scripts
@@ -185,18 +179,15 @@ def list_source_plugins():
 
 
 def wic_create(args, wks_file, rootfs_dir, bootimg_dir, kernel_dir,
-               native_sysroot, hdddir, staging_data_dir, scripts_path,
-               image_output_dir, debug, properties_file, properties=None):
-    """
-    Create image
+               native_sysroot, scripts_path, image_output_dir, debug,
+               properties_file, properties=None):
+    """Create image
 
     wks_file - user-defined OE kickstart file
     rootfs_dir - absolute path to the build's /rootfs dir
     bootimg_dir - absolute path to the build's boot artifacts directory
     kernel_dir - absolute path to the build's kernel directory
     native_sysroot - absolute path to the build's native sysroots dir
-    hdddir - absolute path to the build's HDDDIR dir
-    staging_data_dir - absolute path to the build's STAGING_DATA_DIR dir
     scripts_path - absolute path to /scripts dir
     image_output_dir - dirname to create for image
     properties_file - use values from this file if nonempty i.e no prompting
@@ -211,22 +202,14 @@ def wic_create(args, wks_file, rootfs_dir, bootimg_dir, kernel_dir,
     rootfs_dir:        IMAGE_ROOTFS
     kernel_dir:        STAGING_KERNEL_DIR
     native_sysroot:    STAGING_DIR_NATIVE
-    hdddir:            HDDDIR
-    staging_data_dir:  STAGING_DATA_DIR
 
-    In the above case, bootimg_dir remains unset and the image
-    creation code determines which of the passed-in directories to
-    use.
+    In the above case, bootimg_dir remains unset and the
+    plugin-specific image creation code is responsible for finding the
+    bootimg artifacts.
 
     In the case where the values are passed in explicitly i.e 'wic -e'
     is not used but rather the individual 'wic' options are used to
-    explicitly specify these values, hdddir and staging_data_dir will
-    be unset, but bootimg_dir must be explicit i.e. explicitly set to
-    either hdddir or staging_data_dir, depending on the image being
-    generated.  The other values (rootfs_dir, kernel_dir, and
-    native_sysroot) correspond to the same values found above via
-    'bitbake -e').
-
+    explicitly specify these values.
     """
     try:
         oe_builddir = os.environ["BUILDDIR"]
@@ -242,8 +225,6 @@ def wic_create(args, wks_file, rootfs_dir, bootimg_dir, kernel_dir,
     direct_args.insert(0, bootimg_dir)
     direct_args.insert(0, kernel_dir)
     direct_args.insert(0, native_sysroot)
-    direct_args.insert(0, hdddir)
-    direct_args.insert(0, staging_data_dir)
     direct_args.insert(0, "direct")
 
     if debug:
diff --git a/scripts/lib/image/help.py b/scripts/lib/image/help.py
index 0963532..6b74f57 100644
--- a/scripts/lib/image/help.py
+++ b/scripts/lib/image/help.py
@@ -189,7 +189,7 @@ DESCRIPTION
     -r:        IMAGE_ROOTFS
     -k:        STAGING_KERNEL_DIR
     -n:        STAGING_DIR_NATIVE
-    -b:        HDDDIR and STAGING_DATA_DIR (handlers decide which to use)
+    -b:        empty (plugin-specific handlers must determine this)
 
     If 'wic -e' is not used, the user needs to select the appropriate
     value for -b (as well as -r, -k, and -n).
diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index 5b12856..6b2ab33 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -52,8 +52,7 @@ class DirectImageCreator(BaseImageCreator):
     """
 
     def __init__(self, oe_builddir, image_output_dir, rootfs_dir, bootimg_dir,
-                 kernel_dir, native_sysroot, hdddir, staging_data_dir,
-                 creatoropts=None):
+                 kernel_dir, native_sysroot, creatoropts=None):
         """
         Initialize a DirectImageCreator instance.
 
@@ -74,8 +73,6 @@ class DirectImageCreator(BaseImageCreator):
         self.bootimg_dir = bootimg_dir
         self.kernel_dir = kernel_dir
         self.native_sysroot = native_sysroot
-        self.hdddir = hdddir
-        self.staging_data_dir = staging_data_dir
 
     def __write_fstab(self, image_rootfs):
         """overriden to generate fstab (temporarily) in rootfs. This is called
diff --git a/scripts/lib/wic/plugins/imager/direct_plugin.py b/scripts/lib/wic/plugins/imager/direct_plugin.py
index dabd6fc..5601c3f 100644
--- a/scripts/lib/wic/plugins/imager/direct_plugin.py
+++ b/scripts/lib/wic/plugins/imager/direct_plugin.py
@@ -58,21 +58,19 @@ class DirectPlugin(ImagerPlugin):
         """
         Create direct image, called from creator as 'direct' cmd
         """
-        if len(args) != 9:
+        if len(args) != 7:
             raise errors.Usage("Extra arguments given")
 
-        staging_data_dir = args[0]
-        hdddir = args[1]
-        native_sysroot = args[2]
-        kernel_dir = args[3]
-        bootimg_dir = args[4]
-        rootfs_dir = args[5]
+        native_sysroot = args[0]
+        kernel_dir = args[1]
+        bootimg_dir = args[2]
+        rootfs_dir = args[3]
 
         creatoropts = configmgr.create
-        ksconf = args[6]
+        ksconf = args[4]
 
-        image_output_dir = args[7]
-        oe_builddir = args[8]
+        image_output_dir = args[5]
+        oe_builddir = args[6]
 
         krootfs_dir = self.__rootfs_dir_to_dict(rootfs_dir)
 
@@ -84,8 +82,6 @@ class DirectPlugin(ImagerPlugin):
                                             bootimg_dir,
                                             kernel_dir,
                                             native_sysroot,
-                                            hdddir,
-                                            staging_data_dir,
                                             creatoropts)
 
         try:
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 855bbc2..e4067b6 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -173,7 +173,6 @@ class BootimgEFIPlugin(SourcePlugin):
             cr.set_bootimg_dir(bootimg_dir)
 
         staging_kernel_dir = kernel_dir
-        staging_data_dir = bootimg_dir
 
         hdddir = "%s/hdd/boot" % cr_workdir
 
@@ -185,12 +184,12 @@ class BootimgEFIPlugin(SourcePlugin):
             if source_params['loader'] == 'grub-efi':
                 shutil.copyfile("%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir,
                                 "%s/grub.cfg" % cr_workdir)
-                cp_cmd = "cp %s/EFI/BOOT/* %s/EFI/BOOT" % (staging_data_dir, hdddir)
+                cp_cmd = "cp %s/EFI/BOOT/* %s/EFI/BOOT" % (bootimg_dir, hdddir)
                 exec_cmd(cp_cmd, True)
                 shutil.move("%s/grub.cfg" % cr_workdir,
                             "%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir)
             elif source_params['loader'] == 'gummiboot':
-                cp_cmd = "cp %s/EFI/BOOT/* %s/EFI/BOOT" % (staging_data_dir, hdddir)
+                cp_cmd = "cp %s/EFI/BOOT/* %s/EFI/BOOT" % (bootimg_dir, hdddir)
                 exec_cmd(cp_cmd, True)
             else:
                 msger.error("unrecognized bootimg-efi loader: %s" % source_params['loader'])
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index 6057bab..8a1aca1 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -144,7 +144,6 @@ class BootimgPcbiosPlugin(SourcePlugin):
             cr.set_bootimg_dir(bootimg_dir)
 
         staging_kernel_dir = kernel_dir
-        staging_data_dir = bootimg_dir
 
         hdddir = "%s/hdd/boot" % cr_workdir
 
@@ -153,7 +152,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
         exec_cmd(install_cmd)
 
         install_cmd = "install -m 444 %s/syslinux/ldlinux.sys %s/ldlinux.sys" \
-            % (staging_data_dir, hdddir)
+            % (bootimg_dir, hdddir)
         exec_cmd(install_cmd)
 
         du_cmd = "du -bks %s" % hdddir
diff --git a/scripts/wic b/scripts/wic
index 15cc9b3..e7df60f 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -131,11 +131,11 @@ def wic_create_subcommand(args, usage_str):
         sys.exit(1)
     set_bitbake_env_lines(bitbake_env_lines)
 
-    bootimg_dir = staging_data_dir = hdddir = ""
+    bootimg_dir = ""
 
     if options.image_name:
-        (rootfs_dir, kernel_dir, hdddir, staging_data_dir, native_sysroot) = \
-            find_artifacts(options.image_name)
+        (rootfs_dir, kernel_dir, bootimg_dir, native_sysroot) \
+            = find_artifacts(options.image_name)
 
     wks_file = args[0]
 
@@ -172,8 +172,6 @@ def wic_create_subcommand(args, usage_str):
         not_found = not_found_dir = ""
         if not os.path.isdir(rootfs_dir):
             (not_found, not_found_dir) = ("rootfs-dir", rootfs_dir)
-        elif not os.path.isdir(hdddir) and not os.path.isdir(staging_data_dir):
-            (not_found, not_found_dir) = ("bootimg-dir", bootimg_dir)
         elif not os.path.isdir(kernel_dir):
             (not_found, not_found_dir) = ("kernel-dir", kernel_dir)
         elif not os.path.isdir(native_sysroot):
@@ -197,8 +195,8 @@ def wic_create_subcommand(args, usage_str):
     rootfs_dir = rootfs_dir_to_args(krootfs_dir)
 
     wic_create(args, wks_file, rootfs_dir, bootimg_dir, kernel_dir,
-               native_sysroot, hdddir, staging_data_dir, scripts_path,
-               image_output_dir, options.debug, options.properties_file)
+               native_sysroot, scripts_path, image_output_dir,
+               options.debug, options.properties_file)
 
 
 def wic_list_subcommand(args, usage_str):
-- 
1.9.3


