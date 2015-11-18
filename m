Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DF2E86012A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 16:37:27 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 18 Nov 2015 08:37:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,313,1444719600"; d="scan'208";a="841614482"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by fmsmga001.fm.intel.com with ESMTP; 18 Nov 2015 08:37:29 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Nov 2015 08:25:54 +0000
Message-Id: <2d04d7f11597f6e8331b293e033aef0d36ce5f02.1447834352.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1447834352.git.mariano.lopez@linux.intel.com>
References: <cover.1447834352.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1447834352.git.mariano.lopez@linux.intel.com>
References: <cover.1447834352.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 2/2] wic: Allow to use a custom config for bootloaders
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
X-List-Received-Date: Wed, 18 Nov 2015 16:37:28 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This change will allow to use a user defined file as the
configuration for the bootloaders (grub, gummiboot, syslinux).

The config file is defined in the wks file with the "configfile"
option in the bootloader line.

[YOCTO #8003]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py    | 66 ++++++++++++++++--------
 scripts/lib/wic/plugins/source/bootimg-pcbios.py | 66 ++++++++++++++----------
 2 files changed, 83 insertions(+), 49 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index fa63c6a..8fc879e 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -45,22 +45,33 @@ class BootimgEFIPlugin(SourcePlugin):
         """
         Create loader-specific (grub-efi) config
         """
-        options = creator.ks.handler.bootloader.appendLine
-
-        grubefi_conf = ""
-        grubefi_conf += "serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1\n"
-        grubefi_conf += "default=boot\n"
-        timeout = kickstart.get_timeout(creator.ks)
-        if not timeout:
-            timeout = 0
-        grubefi_conf += "timeout=%s\n" % timeout
-        grubefi_conf += "menuentry 'boot'{\n"
-
-        kernel = "/bzImage"
-
-        grubefi_conf += "linux %s root=%s rootwait %s\n" \
-            % (kernel, creator.rootdev, options)
-        grubefi_conf += "}\n"
+        configfile = kickstart.get_bootloader_file(creator.ks)
+
+        if configfile and os.path.exists(configfile):
+            # Use a custom configuration file for grub
+            msger.info("Using custom configuration file "
+                    "%s for grub.cfg" % configfile)
+            user_conf = open(configfile, "r")
+            grubefi_conf = user_conf.read()
+            user_conf.close()
+        else:
+            # Create grub configuration using parameters from wks file
+            options = creator.ks.handler.bootloader.appendLine
+
+            grubefi_conf = ""
+            grubefi_conf += "serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1\n"
+            grubefi_conf += "default=boot\n"
+            timeout = kickstart.get_timeout(creator.ks)
+            if not timeout:
+                timeout = 0
+            grubefi_conf += "timeout=%s\n" % timeout
+            grubefi_conf += "menuentry 'boot'{\n"
+
+            kernel = "/bzImage"
+
+            grubefi_conf += "linux %s root=%s rootwait %s\n" \
+                % (kernel, creator.rootdev, options)
+            grubefi_conf += "}\n"
 
         msger.debug("Writing grubefi config %s/hdd/boot/EFI/BOOT/grub.cfg" \
                         % cr_workdir)
@@ -95,12 +106,23 @@ class BootimgEFIPlugin(SourcePlugin):
         cfg.write(loader_conf)
         cfg.close()
 
-        kernel = "/bzImage"
-
-        boot_conf = ""
-        boot_conf += "title boot\n"
-        boot_conf += "linux %s\n" % kernel
-        boot_conf += "options LABEL=Boot root=%s %s\n" % (creator.rootdev, options)
+        configfile = kickstart.get_bootloader_file(creator.ks)
+
+        if configfile and os.path.exists(configfile):
+            # Use a custom configuration file for gummiboot
+            msger.info("Using custom configuration file "
+                    "%s for gummiboot's boot.conf" % configfile)
+            user_conf = open(configfile, "r")
+            boot_conf = user_conf.read()
+            user_conf.close()
+        else:
+            # Create gummiboot configuration using parameters from wks file
+            kernel = "/bzImage"
+
+            boot_conf = ""
+            boot_conf += "title boot\n"
+            boot_conf += "linux %s\n" % kernel
+            boot_conf += "options LABEL=Boot root=%s %s\n" % (creator.rootdev, options)
 
         msger.debug("Writing gummiboot config %s/hdd/boot/loader/entries/boot.conf" \
                         % cr_workdir)
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index 96ed54d..9e21572 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -83,34 +83,46 @@ class BootimgPcbiosPlugin(SourcePlugin):
         install_cmd = "install -d %s" % hdddir
         exec_cmd(install_cmd)
 
-        splash = os.path.join(cr_workdir, "/hdd/boot/splash.jpg")
-        if os.path.exists(splash):
-            splashline = "menu background splash.jpg"
+        configfile = kickstart.get_bootloader_file(creator.ks)
+
+        if configfile and os.path.exists(configfile):
+            # Use a custom configuration file for syslinux
+            msger.info("Using custom configuration file "
+                    "%s for syslinux.cfg" % configfile)
+            user_conf = open(configfile, "r")
+            syslinux_conf = user_conf.read()
+            user_conf.close()
+
         else:
-            splashline = ""
-
-        options = creator.ks.handler.bootloader.appendLine
-
-        syslinux_conf = ""
-        syslinux_conf += "PROMPT 0\n"
-        timeout = kickstart.get_timeout(creator.ks)
-        if not timeout:
-            timeout = 0
-        syslinux_conf += "TIMEOUT " + str(timeout) + "\n"
-        syslinux_conf += "\n"
-        syslinux_conf += "ALLOWOPTIONS 1\n"
-        syslinux_conf += "SERIAL 0 115200\n"
-        syslinux_conf += "\n"
-        if splashline:
-            syslinux_conf += "%s\n" % splashline
-        syslinux_conf += "DEFAULT boot\n"
-        syslinux_conf += "LABEL boot\n"
-
-        kernel = "/vmlinuz"
-        syslinux_conf += "KERNEL " + kernel + "\n"
-
-        syslinux_conf += "APPEND label=boot root=%s %s\n" % \
-                             (creator.rootdev, options)
+            # Create syslinux configuration using parameters from wks file
+            splash = os.path.join(cr_workdir, "/hdd/boot/splash.jpg")
+            if os.path.exists(splash):
+                splashline = "menu background splash.jpg"
+            else:
+                splashline = ""
+
+            options = creator.ks.handler.bootloader.appendLine
+
+            syslinux_conf = ""
+            syslinux_conf += "PROMPT 0\n"
+            timeout = kickstart.get_timeout(creator.ks)
+            if not timeout:
+                timeout = 0
+            syslinux_conf += "TIMEOUT " + str(timeout) + "\n"
+            syslinux_conf += "\n"
+            syslinux_conf += "ALLOWOPTIONS 1\n"
+            syslinux_conf += "SERIAL 0 115200\n"
+            syslinux_conf += "\n"
+            if splashline:
+                syslinux_conf += "%s\n" % splashline
+            syslinux_conf += "DEFAULT boot\n"
+            syslinux_conf += "LABEL boot\n"
+
+            kernel = "/vmlinuz"
+            syslinux_conf += "KERNEL " + kernel + "\n"
+
+            syslinux_conf += "APPEND label=boot root=%s %s\n" % \
+                                 (creator.rootdev, options)
 
         msger.debug("Writing syslinux config %s/hdd/boot/syslinux.cfg" \
                     % cr_workdir)
-- 
1.8.4.5


