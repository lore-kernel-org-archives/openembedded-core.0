Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4E560774D1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 20:43:10 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP; 27 Jan 2017 12:43:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,297,1477983600"; d="scan'208";a="58074699"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 27 Jan 2017 12:43:11 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 033956A4006
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 12:42:12 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 22:19:42 +0200
Message-Id: <6ba526215525d95242bde6323f2161e020956237.1485547221.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485547221.git.ed.bartosh@linux.intel.com>
References: <cover.1485547221.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v3 05/11] wic: Look for image artifacts in a common location
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
X-List-Received-Date: Fri, 27 Jan 2017 20:43:10 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

Rather than have each image type look for artifacts in image-specific
locations, move towards having them look for artifacts in a common
location, in this case DEPLOY_DIR_IMAGE

Use the existing deploy.bbclass to have the bootloaders put their binaries
in DEPLOY_DIR_IMAGE and then wic will find them and place them in the image

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py                      |  4 +--
 scripts/lib/wic/plugins/source/bootimg-efi.py      | 39 ++++++++++++++++------
 .../lib/wic/plugins/source/isoimage-isohybrid.py   | 18 +++++++---
 3 files changed, 45 insertions(+), 16 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index ebbb280..da68e25 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -372,8 +372,8 @@ class Wic(oeSelfTest):
 
         wicvars = set(get_bb_var('WICVARS', image).split())
         # filter out optional variables
-        wicvars = wicvars.difference(('IMAGE_BOOT_FILES', 'INITRD',
-                                      'INITRD_LIVE', 'ISODIR'))
+        wicvars = wicvars.difference(('DEPLOY_DIR_IMAGE', 'IMAGE_BOOT_FILES',
+                                      'INITRD', 'INITRD_LIVE', 'ISODIR'))
         with open(path) as envfile:
             content = dict(line.split("=", 1) for line in envfile)
             # test if variables used by wic present in the .env file
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 305e910..74a1557 100644
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
@@ -98,6 +98,19 @@ class BootimgEFIPlugin(SourcePlugin):
         loader_conf += "default boot\n"
         loader_conf += "timeout %d\n" % bootloader.timeout
 
+        initrd = source_params.get('initrd')
+
+        if initrd:
+            # obviously we need to have a common common deploy var
+            bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
+            if not bootimg_dir:
+                msger.error("Couldn't find DEPLOY_DIR_IMAGE, exiting\n")
+
+            cp_cmd = "cp %s/%s %s" % (bootimg_dir, initrd, hdddir)
+            exec_cmd(cp_cmd, True)
+        else:
+            msger.debug("Ignoring missing initrd")
+
         msger.debug("Writing systemd-boot config %s/hdd/boot/loader/loader.conf" \
                         % cr_workdir)
         cfg = open("%s/hdd/boot/loader/loader.conf" % cr_workdir, "w")
@@ -127,6 +140,9 @@ class BootimgEFIPlugin(SourcePlugin):
             boot_conf += "options LABEL=Boot root=%s %s\n" % \
                              (creator.rootdev, bootloader.append)
 
+            if initrd:
+                boot_conf += "initrd /%s\n" % initrd
+
         msger.debug("Writing systemd-boot config %s/hdd/boot/loader/entries/boot.conf" \
                         % cr_workdir)
         cfg = open("%s/hdd/boot/loader/entries/boot.conf" % cr_workdir, "w")
@@ -148,9 +164,9 @@ class BootimgEFIPlugin(SourcePlugin):
 
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
@@ -167,9 +183,9 @@ class BootimgEFIPlugin(SourcePlugin):
         In this case, prepare content for an EFI (grub) boot partition.
         """
         if not bootimg_dir:
-            bootimg_dir = get_bitbake_var("HDDDIR")
+            bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
             if not bootimg_dir:
-                msger.error("Couldn't find HDDDIR, exiting\n")
+                 msger.error("Couldn't find DEPLOY_DIR_IMAGE, exiting\n")
             # just so the result notes display it
             creator.set_bootimg_dir(bootimg_dir)
 
@@ -181,17 +197,20 @@ class BootimgEFIPlugin(SourcePlugin):
             (staging_kernel_dir, hdddir)
         exec_cmd(install_cmd)
 
+
         try:
             if source_params['loader'] == 'grub-efi':
                 shutil.copyfile("%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir,
                                 "%s/grub.cfg" % cr_workdir)
-                cp_cmd = "cp %s/EFI/BOOT/* %s/EFI/BOOT" % (bootimg_dir, hdddir)
-                exec_cmd(cp_cmd, True)
+                for mod in [x for x in os.listdir(bootimg_dir) if x.startswith("grub-efi-")]:
+                    cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (bootimg_dir, mod, hdddir, mod[9:])
+                    exec_cmd(cp_cmd, True)
                 shutil.move("%s/grub.cfg" % cr_workdir,
                             "%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir)
             elif source_params['loader'] == 'systemd-boot':
-                cp_cmd = "cp %s/EFI/BOOT/* %s/EFI/BOOT" % (bootimg_dir, hdddir)
-                exec_cmd(cp_cmd, True)
+                for mod in [x for x in os.listdir(bootimg_dir) if x.startswith("systemd-")]:
+                    cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (bootimg_dir, mod, hdddir, mod[8:])
+                    exec_cmd(cp_cmd, True)
             else:
                 msger.error("unrecognized bootimg-efi loader: %s" % source_params['loader'])
         except KeyError:
diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index a637ce5..b54a229 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -249,6 +249,7 @@ class IsoImagePlugin(SourcePlugin):
         part.rootfs_dir = rootfs_dir
 
         # Prepare rootfs.img
+        hdd_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
         img_iso_dir = get_bitbake_var("ISODIR")
         rootfs_img = "%s/rootfs.img" % img_iso_dir
         if not os.path.isfile(rootfs_img):
@@ -278,10 +279,19 @@ class IsoImagePlugin(SourcePlugin):
         if os.path.isfile(part.source_file):
             os.remove(part.source_file)
 
-        # Prepare initial ramdisk
-        initrd = "%s/initrd" % img_iso_dir
-        if not os.path.isfile(initrd):
-            initrd = cls._build_initramfs_path(rootfs_dir, cr_workdir)
+        # Support using a different initrd other than default
+        if source_params.get('initrd'):
+            initrd = source_params['initrd']
+            if not hdd_dir:
+                msger.error("Couldn't find DEPLOY_DIR_IMAGE, exiting\n")
+            cp_cmd = "cp %s/%s %s" % (hdd_dir, initrd, cr_workdir)
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
2.1.4


