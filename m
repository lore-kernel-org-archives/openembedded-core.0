Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 810F671AE4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 19:58:23 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP; 11 Jan 2017 11:58:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="807758387"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Jan 2017 11:58:23 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jan 2017 19:55:19 +0000
Message-Id: <5c8a8c1b782d7a2fa7c89da07cf55bca6b3e445b.1484164023.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1484164023.git.alejandro.hernandez@linux.intel.com>
References: <cover.1484164023.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1484164023.git.alejandro.hernandez@linux.intel.com>
References: <cover.1484164023.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH v2 2/7] wic: Look for image artifacts in a common location
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
X-List-Received-Date: Wed, 11 Jan 2017 19:58:23 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

Rather than have each image type look for artifacts in image-specific
locations, move towards having them look for artifacts in a common
location, in this case DEPLOY_DIR_IMAGE/artifacts.

This only applies if the oe-core image classes have been modified to
generate artifacts there (e.g. using image-live-artifacts).

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 meta/classes/image_types.bbclass                   |  2 +-
 meta/lib/oeqa/selftest/wic.py                      |  2 +-
 scripts/lib/wic/plugins/source/bootimg-efi.py      | 28 +++++++++++++++++-----
 .../lib/wic/plugins/source/isoimage-isohybrid.py   | 21 ++++++++++------
 4 files changed, 38 insertions(+), 15 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index b9359b2..a66210f 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -371,4 +371,4 @@ IMAGE_TYPES_MASKED ?= ""
 
 # The WICVARS variable is used to define list of bitbake variables used in wic code
 # variables from this list is written to <image>.env file
-WICVARS ?= "BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE HDDDIR IMAGE_BASENAME IMAGE_BOOT_FILES IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD ISODIR MACHINE_ARCH ROOTFS_SIZE STAGING_DATADIR STAGING_DIR_NATIVE STAGING_LIBDIR TARGET_SYS"
+WICVARS ?= "BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE IMAGE_BASENAME IMAGE_BOOT_FILES IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD ISODIR MACHINE_ARCH ROOTFS_SIZE STAGING_DATADIR STAGING_DIR_NATIVE STAGING_LIBDIR TARGET_SYS"
diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 49bbfe3..cda6261 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -350,7 +350,7 @@ class Wic(oeSelfTest):
 
         wicvars = set(get_bb_var('WICVARS', image).split())
         # filter out optional variables
-        wicvars = wicvars.difference(('HDDDIR', 'IMAGE_BOOT_FILES',
+        wicvars = wicvars.difference(('DEPLOY_DIR_IMAGE', 'IMAGE_BOOT_FILES',
                                       'INITRD', 'ISODIR'))
         with open(path) as envfile:
             content = dict(line.split("=", 1) for line in envfile)
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 305e910..2c16a0f 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -42,7 +42,7 @@ class BootimgEFIPlugin(SourcePlugin):
     name = 'bootimg-efi'
 
     @classmethod
-    def do_configure_grubefi(cls, hdddir, creator, cr_workdir):
+    def do_configure_grubefi(cls, hdddir, creator, cr_workdir, source_params):
         """
         Create loader-specific (grub-efi) config
         """
@@ -82,7 +82,7 @@ class BootimgEFIPlugin(SourcePlugin):
         cfg.close()
 
     @classmethod
-    def do_configure_systemdboot(cls, hdddir, creator, cr_workdir):
+    def do_configure_systemdboot(cls, hdddir, creator, cr_workdir, source_params):
         """
         Create loader-specific systemd-boot/gummiboot config
         """
@@ -98,6 +98,18 @@ class BootimgEFIPlugin(SourcePlugin):
         loader_conf += "default boot\n"
         loader_conf += "timeout %d\n" % bootloader.timeout
 
+        initrd = ""
+
+        if source_params['initrd']:
+	    initrd = source_params['initrd']
+            # obviously we need to have a common common deploy var
+            bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
+            if not bootimg_dir:
+                msger.error("Couldn't find DEPLOY_DIR_IMAGE, exiting\n")
+
+            cp_cmd = "cp %s/%s %s" % (bootimg_dir, initrd, hdddir)
+            exec_cmd(cp_cmd, True)
+
         msger.debug("Writing systemd-boot config %s/hdd/boot/loader/loader.conf" \
                         % cr_workdir)
         cfg = open("%s/hdd/boot/loader/loader.conf" % cr_workdir, "w")
@@ -127,6 +139,9 @@ class BootimgEFIPlugin(SourcePlugin):
             boot_conf += "options LABEL=Boot root=%s %s\n" % \
                              (creator.rootdev, bootloader.append)
 
+           if initrd:
+                boot_conf += "initrd /%s\n" % initrd
+
         msger.debug("Writing systemd-boot config %s/hdd/boot/loader/entries/boot.conf" \
                         % cr_workdir)
         cfg = open("%s/hdd/boot/loader/entries/boot.conf" % cr_workdir, "w")
@@ -148,9 +163,9 @@ class BootimgEFIPlugin(SourcePlugin):
 
         try:
             if source_params['loader'] == 'grub-efi':
-                cls.do_configure_grubefi(hdddir, creator, cr_workdir)
+                cls.do_configure_grubefi(hdddir, creator, cr_workdir, source_params)
             elif source_params['loader'] == 'systemd-boot':
-                cls.do_configure_systemdboot(hdddir, creator, cr_workdir)
+                cls.do_configure_systemdboot(hdddir, creator, cr_workdir, source_params)
             else:
                 msger.error("unrecognized bootimg-efi loader: %s" % source_params['loader'])
         except KeyError:
@@ -167,9 +182,10 @@ class BootimgEFIPlugin(SourcePlugin):
         In this case, prepare content for an EFI (grub) boot partition.
         """
         if not bootimg_dir:
-            bootimg_dir = get_bitbake_var("HDDDIR")
+	    bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
             if not bootimg_dir:
-                msger.error("Couldn't find HDDDIR, exiting\n")
+                 msger.error("Couldn't find DEPLOY_DIR_IMAGE, exiting\n")
+            bootimg_dir += "/artifacts"
             # just so the result notes display it
             creator.set_bootimg_dir(bootimg_dir)
 
diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index 3858fd4..6e64ce9 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -298,7 +298,7 @@ class IsoImagePlugin(SourcePlugin):
         part.rootfs_dir = rootfs_dir
 
         # Prepare rootfs.img
-        hdd_dir = get_bitbake_var("HDDDIR")
+        hdd_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
         img_iso_dir = get_bitbake_var("ISODIR")
 
         rootfs_img = "%s/rootfs.img" % hdd_dir
@@ -331,12 +331,19 @@ class IsoImagePlugin(SourcePlugin):
         if os.path.isfile(part.source_file):
             os.remove(part.source_file)
 
-        # Prepare initial ramdisk
-        initrd = "%s/initrd" % hdd_dir
-        if not os.path.isfile(initrd):
-            initrd = "%s/initrd" % img_iso_dir
-        if not os.path.isfile(initrd):
-            initrd = cls._build_initramfs_path(rootfs_dir, cr_workdir)
+        # Support using a different initrd other than default
+        if source_params['initrd']:
+	    initrd = source_params['initrd']
+	    if not hdd_dir:
+		    msger.error("Couldn't find DEPLOY_DIR_IMAGE, exiting\n")
+	    cp_cmd = "cp %s/%s %s" % (hdd_dir, initrd, cr_workdir)
+        else:
+            # Prepare initial ramdisk
+            initrd = "%s/initrd" % hdd_dir
+            if not os.path.isfile(initrd):
+                initrd = "%s/initrd" % img_iso_dir
+            if not os.path.isfile(initrd):
+                initrd = cls._build_initramfs_path(rootfs_dir, cr_workdir)
 
         install_cmd = "install -m 0644 %s %s/initrd" \
             % (initrd, isodir)
-- 
2.6.6


