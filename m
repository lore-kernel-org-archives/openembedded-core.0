Return-Path: <tom.zanussi@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BC9AB65DB3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 01:35:47 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 11 Aug 2014 18:35:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="371139765"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO localhost)
	([10.255.12.45])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Aug 2014 18:32:33 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Aug 2014 20:35:39 -0500
Message-Id: <b67452f93fa0bb7bde463e2511e78c7859bb4383.1407806939.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <e3fcfa6ac6fbbcf83a82a3e7a730f87626aea615.1407806939.git.tom.zanussi@linux.intel.com>
References: <e3fcfa6ac6fbbcf83a82a3e7a730f87626aea615.1407806939.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1407806939.git.tom.zanussi@linux.intel.com>
References: <cover.1407806939.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 5/7] wic: Add gummiboot support to bootimg-efi
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
X-List-Received-Date: Tue, 12 Aug 2014 01:35:48 -0000

Add gummiboot support to bootimg-efi, which retains the existing
grub-efi support (though requires an update to the .wks file).

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 113 +++++++++++++++++++++-----
 1 file changed, 91 insertions(+), 22 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index ea94fd2..855bbc2 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -42,19 +42,10 @@ class BootimgEFIPlugin(SourcePlugin):
     name = 'bootimg-efi'
 
     @classmethod
-    def do_configure_partition(self, source_params, part, cr, cr_workdir,
-                               oe_builddir, bootimg_dir, kernel_dir,
-                               native_sysroot):
+    def do_configure_grubefi(self, hdddir, cr, cr_workdir):
         """
-        Called before do_prepare_partition(), creates grubefi config
+        Create loader-specific (grub-efi) config
         """
-        hdddir = "%s/hdd/boot" % cr_workdir
-        rm_cmd = "rm -rf %s" % cr_workdir
-        exec_cmd(rm_cmd)
-
-        install_cmd = "install -d %s/EFI/BOOT" % hdddir
-        exec_cmd(install_cmd)
-
         splash = os.path.join(cr_workdir, "/EFI/boot/splash.jpg")
         if os.path.exists(splash):
             splashline = "menu background splash.jpg"
@@ -73,7 +64,7 @@ class BootimgEFIPlugin(SourcePlugin):
         grubefi_conf += "timeout=%s\n" % timeout
         grubefi_conf += "menuentry 'boot'{\n"
 
-        kernel = "/vmlinuz"
+        kernel = "/bzImage"
 
         if cr._ptable_format == 'msdos':
             rootstr = rootdev
@@ -93,6 +84,79 @@ class BootimgEFIPlugin(SourcePlugin):
         cfg.close()
 
     @classmethod
+    def do_configure_gummiboot(self, hdddir, cr, cr_workdir):
+        """
+        Create loader-specific (gummiboot) config
+        """
+        install_cmd = "install -d %s/loader" % hdddir
+        exec_cmd(install_cmd)
+
+        install_cmd = "install -d %s/loader/entries" % hdddir
+        exec_cmd(install_cmd)
+
+        (rootdev, root_part_uuid) = cr._get_boot_config()
+        options = cr.ks.handler.bootloader.appendLine
+
+        timeout = kickstart.get_timeout(cr.ks)
+        if not timeout:
+            timeout = 0
+
+        loader_conf = ""
+        loader_conf += "default boot\n"
+        loader_conf += "timeout %d\n" % timeout
+
+        msger.debug("Writing gummiboot config %s/hdd/boot/loader/loader.conf" \
+                        % cr_workdir)
+        cfg = open("%s/hdd/boot/loader/loader.conf" % cr_workdir, "w")
+        cfg.write(loader_conf)
+        cfg.close()
+
+        kernel = "/bzImage"
+
+        if cr._ptable_format == 'msdos':
+            rootstr = rootdev
+        else:
+            raise ImageError("Unsupported partition table format found")
+
+        boot_conf = ""
+        boot_conf += "title boot\n"
+        boot_conf += "linux %s\n" % kernel
+        boot_conf += "options LABEL=Boot root=%s %s\n" \
+            % (rootstr, options)
+
+        msger.debug("Writing gummiboot config %s/hdd/boot/loader/entries/boot.conf" \
+                        % cr_workdir)
+        cfg = open("%s/hdd/boot/loader/entries/boot.conf" % cr_workdir, "w")
+        cfg.write(boot_conf)
+        cfg.close()
+
+
+    @classmethod
+    def do_configure_partition(self, part, source_params, cr, cr_workdir,
+                               oe_builddir, bootimg_dir, kernel_dir,
+                               native_sysroot):
+        """
+        Called before do_prepare_partition(), creates loader-specific config
+        """
+        hdddir = "%s/hdd/boot" % cr_workdir
+        rm_cmd = "rm -rf %s" % cr_workdir
+        exec_cmd(rm_cmd)
+
+        install_cmd = "install -d %s/EFI/BOOT" % hdddir
+        exec_cmd(install_cmd)
+
+        try:
+            if source_params['loader'] == 'grub-efi':
+                self.do_configure_grubefi(hdddir, cr, cr_workdir)
+            elif source_params['loader'] == 'gummiboot':
+                self.do_configure_gummiboot(hdddir, cr, cr_workdir)
+            else:
+                msger.error("unrecognized bootimg-efi loader: %s" % source_params['loader'])
+        except KeyError:
+            msger.error("bootimg-efi requires a loader, none specified")
+
+
+    @classmethod
     def do_prepare_partition(self, part, source_params, cr, cr_workdir,
                              oe_builddir, bootimg_dir, kernel_dir,
                              rootfs_dir, native_sysroot):
@@ -117,14 +181,21 @@ class BootimgEFIPlugin(SourcePlugin):
             (staging_kernel_dir, hdddir)
         exec_cmd(install_cmd)
 
-        shutil.copyfile("%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir,
-                        "%s/grub.cfg" % cr_workdir)
-
-        cp_cmd = "cp %s/EFI/BOOT/* %s/EFI/BOOT" % (staging_data_dir, hdddir)
-        exec_cmd(cp_cmd, True)
-
-        shutil.move("%s/grub.cfg" % cr_workdir,
-                    "%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir)
+        try:
+            if source_params['loader'] == 'grub-efi':
+                shutil.copyfile("%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir,
+                                "%s/grub.cfg" % cr_workdir)
+                cp_cmd = "cp %s/EFI/BOOT/* %s/EFI/BOOT" % (staging_data_dir, hdddir)
+                exec_cmd(cp_cmd, True)
+                shutil.move("%s/grub.cfg" % cr_workdir,
+                            "%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir)
+            elif source_params['loader'] == 'gummiboot':
+                cp_cmd = "cp %s/EFI/BOOT/* %s/EFI/BOOT" % (staging_data_dir, hdddir)
+                exec_cmd(cp_cmd, True)
+            else:
+                msger.error("unrecognized bootimg-efi loader: %s" % source_params['loader'])
+        except KeyError:
+            msger.error("bootimg-efi requires a loader, none specified")
 
         du_cmd = "du -bks %s" % hdddir
         out = exec_cmd(du_cmd)
@@ -164,5 +235,3 @@ class BootimgEFIPlugin(SourcePlugin):
 
         part.set_size(bootimg_size)
         part.set_source_file(bootimg)
-
-
-- 
1.8.3.1


