Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id A1A7078212
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 12:46:03 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Jul 2017 05:46:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,359,1496127600"; d="scan'208";a="1151510574"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 14 Jul 2017 05:46:05 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id B2E525803B9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 05:46:04 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Jul 2017 15:33:06 +0300
Message-Id: <d370fb6012a3c8dbc586360264c8415d44e08a85.1500035131.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1500035131.git.ed.bartosh@linux.intel.com>
References: <cover.1500035131.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 7/8] wic: isoimage-isohybrid: use grub-efi from deploy dir
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
X-List-Received-Date: Fri, 14 Jul 2017 12:46:03 -0000

isoimage-isohybrid plugin tries to build grub-efi in its working
directory if it can't find efi binary. Wic should avoid doing anything
in working directories of other recipes. It should use artifacts from
the image deployment directory instead.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 .../lib/wic/plugins/source/isoimage-isohybrid.py   | 75 +++++++---------------
 1 file changed, 23 insertions(+), 52 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index ece4b0c..d6bd3bf 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -95,7 +95,7 @@ class IsoImagePlugin(SourcePlugin):
             cfg.write(syslinux_conf)
 
     @classmethod
-    def do_configure_grubefi(cls, part, creator, cr_workdir):
+    def do_configure_grubefi(cls, part, creator, target_dir):
         """
         Create loader-specific (grub-efi) config
         """
@@ -109,7 +109,7 @@ class IsoImagePlugin(SourcePlugin):
                 raise WicError("configfile is specified "
                                "but failed to get it from %s", configfile)
         else:
-            splash = os.path.join(cr_workdir, "EFI/boot/splash.jpg")
+            splash = os.path.join(target_dir, "splash.jpg")
             if os.path.exists(splash):
                 splashline = "menu background splash.jpg"
             else:
@@ -137,9 +137,10 @@ class IsoImagePlugin(SourcePlugin):
             if splashline:
                 grubefi_conf += "%s\n" % splashline
 
-        logger.debug("Writing grubefi config %s/EFI/BOOT/grub.cfg", cr_workdir)
+        cfg_path = os.path.join(target_dir, "grub.cfg")
+        logger.debug("Writing grubefi config %s", cfg_path)
 
-        with open("%s/EFI/BOOT/grub.cfg" % cr_workdir, "w") as cfg:
+        with open(cfg_path, "w") as cfg:
             cfg.write(grubefi_conf)
 
     @staticmethod
@@ -313,20 +314,13 @@ class IsoImagePlugin(SourcePlugin):
 
         #Create bootloader for efi boot
         try:
-            if source_params['loader'] == 'grub-efi':
-                # Builds grub.cfg if ISODIR didn't exist or
-                # didn't contains grub.cfg
-                bootimg_dir = img_iso_dir
-                if not os.path.exists("%s/EFI/BOOT" % bootimg_dir):
-                    bootimg_dir = "%s/bootimg" % cr_workdir
-                    if os.path.exists(bootimg_dir):
-                        shutil.rmtree(bootimg_dir)
-                    install_cmd = "install -d %s/EFI/BOOT" % bootimg_dir
-                    exec_cmd(install_cmd)
-
-                if not os.path.isfile("%s/EFI/BOOT/boot.cfg" % bootimg_dir):
-                    cls.do_configure_grubefi(part, creator, bootimg_dir)
+            target_dir = "%s/EFI/BOOT" % isodir
+            if os.path.exists(target_dir):
+                shutil.rmtree(target_dir)
+
+            os.makedirs(target_dir)
 
+            if source_params['loader'] == 'grub-efi':
                 # Builds bootx64.efi/bootia32.efi if ISODIR didn't exist or
                 # didn't contains it
                 target_arch = get_bitbake_var("TARGET_SYS")
@@ -334,37 +328,23 @@ class IsoImagePlugin(SourcePlugin):
                     raise WicError("Coludn't find target architecture")
 
                 if re.match("x86_64", target_arch):
-                    grub_target = 'x86_64-efi'
-                    grub_image = "bootx64.efi"
+                    grub_image = "grub-efi-bootx64.efi"
                 elif re.match('i.86', target_arch):
-                    grub_target = 'i386-efi'
-                    grub_image = "bootia32.efi"
+                    grub_image = "grub-efi-bootia32.efi"
                 else:
                     raise WicError("grub-efi is incompatible with target %s" %
                                    target_arch)
 
-                if not os.path.isfile("%s/EFI/BOOT/%s" \
-                                % (bootimg_dir, grub_image)):
-                    grub_path = get_bitbake_var("STAGING_LIBDIR")
-                    if not grub_path:
-                        raise WicError("Couldn't find STAGING_LIBDIR, exiting.")
-
-                    grub_core = "%s/grub/%s" % (grub_path, grub_target)
-                    if not os.path.exists(grub_core):
-                        raise WicError("Please build grub-efi first")
-
-                    grub_cmd = "grub-mkimage -p '/EFI/BOOT' "
-                    grub_cmd += "-d %s "  % grub_core
-                    grub_cmd += "-O %s -o %s/EFI/BOOT/%s " \
-                                % (grub_target, bootimg_dir, grub_image)
-                    grub_cmd += "part_gpt part_msdos ntfs ntfscomp fat ext2 "
-                    grub_cmd += "normal chain boot configfile linux multiboot "
-                    grub_cmd += "search efi_gop efi_uga font gfxterm gfxmenu "
-                    grub_cmd += "terminal minicmd test iorw loadenv echo help "
-                    grub_cmd += "reboot serial terminfo iso9660 loopback tar "
-                    grub_cmd += "memdisk ls search_fs_uuid udf btrfs xfs lvm "
-                    grub_cmd += "reiserfs ata "
-                    exec_native_cmd(grub_cmd, native_sysroot)
+                grub_target = os.path.join(target_dir, grub_image)
+                if not os.path.isfile(grub_target):
+                    grub_src = os.path.join(deploy_dir, grub_image)
+                    if not os.path.exists(grub_src):
+                        raise WicError("Grub loader %s is not found in %s. "
+                                       "Please build grub-efi first" % (grub_image, deploy_dir))
+                    shutil.copy(grub_src, grub_target)
+
+                if not os.path.isfile(os.path.join(target_dir, "boot.cfg")):
+                    cls.do_configure_grubefi(part, creator, target_dir)
 
             else:
                 raise WicError("unrecognized bootimg-efi loader: %s" %
@@ -372,15 +352,6 @@ class IsoImagePlugin(SourcePlugin):
         except KeyError:
             raise WicError("bootimg-efi requires a loader, none specified")
 
-        if os.path.exists("%s/EFI/BOOT" % isodir):
-            shutil.rmtree("%s/EFI/BOOT" % isodir)
-
-        shutil.copytree(bootimg_dir+"/EFI/BOOT", isodir+"/EFI/BOOT")
-
-        # If exists, remove cr_workdir/bootimg temporary folder
-        if os.path.exists("%s/bootimg" % cr_workdir):
-            shutil.rmtree("%s/bootimg" % cr_workdir)
-
         # Create efi.img that contains bootloader files for EFI booting
         # if ISODIR didn't exist or didn't contains it
         if os.path.isfile("%s/efi.img" % img_iso_dir):
-- 
2.1.4


