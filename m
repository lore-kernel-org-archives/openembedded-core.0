Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2409B71957
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jan 2017 22:33:29 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 03 Jan 2017 14:33:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,457,1477983600"; d="scan'208";a="209315238"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by fmsmga004.fm.intel.com with ESMTP; 03 Jan 2017 14:33:29 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jan 2017 22:30:41 +0000
Message-Id: <9109ffe031aa3ec4addf92c5b8cf13b82801ae37.1482363237.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1482363237.git.alejandro.hernandez@linux.intel.com>
References: <cover.1482363237.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1482363237.git.alejandro.hernandez@linux.intel.com>
References: <cover.1482363237.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 5/6] bootimg-efi: Look for image artifacts in a common location
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
X-List-Received-Date: Tue, 03 Jan 2017 22:33:30 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

Rather than have each image type look for artifacts in image-specific
locations, move towards having them look for artifacts in a common
location, in this case DEPLOY_DIR_IMAGE/artifacts.

This currently only applies to bootimg-efi images, and only if the
oe-core image classes have been modified to generate artifacts there
(e.g. using image-live-artifacts).

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 28 +++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

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
 
-- 
2.6.6


