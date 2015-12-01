Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D59AF605BB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 17:50:59 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 01 Dec 2015 09:51:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,369,1444719600"; 
   d="scan'208";a="5628189"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by fmsmga004.fm.intel.com with ESMTP; 01 Dec 2015 09:51:00 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Dec 2015 09:39:01 +0000
Message-Id: <270df6cf419853a09e1f0562e1fdeead0803ddb2.1448961756.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1448961756.git.mariano.lopez@linux.intel.com>
References: <cover.1448961756.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1448961756.git.mariano.lopez@linux.intel.com>
References: <cover.1448961756.git.mariano.lopez@linux.intel.com>
Subject: [PATCHv2 3/6] wic: Allow to use a custom config for bootloaders
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
X-List-Received-Date: Tue, 01 Dec 2015 17:51:00 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This change will allow to use a user defined file as the
configuration for the bootloaders (grub, gummiboot, syslinux).

The config file is defined in the wks file with the "configfile"
option in the bootloader line.

[YOCTO #8728]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py    | 67 ++++++++++++++++------
 scripts/lib/wic/plugins/source/bootimg-pcbios.py | 72 +++++++++++++++---------
 2 files changed, 93 insertions(+), 46 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index fa63c6a..5feb79d 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -29,6 +29,7 @@ import shutil
 
 from wic import kickstart, msger
 from wic.pluginbase import SourcePlugin
+from wic.utils.misc import get_custom_config
 from wic.utils.oe.misc import exec_cmd, exec_native_cmd, get_bitbake_var, \
                               BOOTDD_EXTRA_SPACE
 
@@ -45,22 +46,37 @@ class BootimgEFIPlugin(SourcePlugin):
         """
         Create loader-specific (grub-efi) config
         """
-        options = creator.ks.handler.bootloader.appendLine
+        configfile = kickstart.get_bootloader_file(creator.ks)
+        custom_cfg = None
+        if configfile:
+            custom_cfg = get_custom_config(configfile)
+            if custom_cfg:
+                # Use a custom configuration for grub
+                grubefi_conf = custom_cfg
+                msger.debug("Using custom configuration file "
+                        "%s for grub.cfg" % configfile)
+            else:
+                msger.error("configfile is specified but failed to "
+                        "get it from %s." % configfile)
 
-        grubefi_conf = ""
-        grubefi_conf += "serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1\n"
-        grubefi_conf += "default=boot\n"
-        timeout = kickstart.get_timeout(creator.ks)
-        if not timeout:
-            timeout = 0
-        grubefi_conf += "timeout=%s\n" % timeout
-        grubefi_conf += "menuentry 'boot'{\n"
+        if not custom_cfg:
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
 
-        kernel = "/bzImage"
+            kernel = "/bzImage"
 
-        grubefi_conf += "linux %s root=%s rootwait %s\n" \
-            % (kernel, creator.rootdev, options)
-        grubefi_conf += "}\n"
+            grubefi_conf += "linux %s root=%s rootwait %s\n" \
+                % (kernel, creator.rootdev, options)
+            grubefi_conf += "}\n"
 
         msger.debug("Writing grubefi config %s/hdd/boot/EFI/BOOT/grub.cfg" \
                         % cr_workdir)
@@ -95,12 +111,27 @@ class BootimgEFIPlugin(SourcePlugin):
         cfg.write(loader_conf)
         cfg.close()
 
-        kernel = "/bzImage"
+        configfile = kickstart.get_bootloader_file(creator.ks)
+        custom_cfg = None
+        if configfile:
+            custom_cfg = get_custom_config(configfile)
+            if custom_cfg:
+                # Use a custom configuration for gummiboot
+                boot_conf = custom_cfg
+                msger.debug("Using custom configuration file "
+                        "%s for gummiboots's boot.conf" % configfile)
+            else:
+                msger.error("configfile is specified but failed to "
+                        "get it from %s." % configfile)
+
+        if not custom_cfg:
+            # Create gummiboot configuration using parameters from wks file
+            kernel = "/bzImage"
 
-        boot_conf = ""
-        boot_conf += "title boot\n"
-        boot_conf += "linux %s\n" % kernel
-        boot_conf += "options LABEL=Boot root=%s %s\n" % (creator.rootdev, options)
+            boot_conf = ""
+            boot_conf += "title boot\n"
+            boot_conf += "linux %s\n" % kernel
+            boot_conf += "options LABEL=Boot root=%s %s\n" % (creator.rootdev, options)
 
         msger.debug("Writing gummiboot config %s/hdd/boot/loader/entries/boot.conf" \
                         % cr_workdir)
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index 96ed54d..80c7dfb 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -29,6 +29,7 @@ import os
 from wic.utils.errors import ImageError
 from wic import kickstart, msger
 from wic.utils import runner
+from wic.utils.misc import get_custom_config
 from wic.pluginbase import SourcePlugin
 from wic.utils.oe.misc import exec_cmd, exec_native_cmd, \
                               get_bitbake_var, BOOTDD_EXTRA_SPACE
@@ -83,34 +84,49 @@ class BootimgPcbiosPlugin(SourcePlugin):
         install_cmd = "install -d %s" % hdddir
         exec_cmd(install_cmd)
 
-        splash = os.path.join(cr_workdir, "/hdd/boot/splash.jpg")
-        if os.path.exists(splash):
-            splashline = "menu background splash.jpg"
-        else:
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
+        configfile = kickstart.get_bootloader_file(creator.ks)
+        custom_cfg = None
+        if configfile:
+            custom_cfg = get_custom_config(configfile)
+            if custom_cfg:
+                # Use a custom configuration for grub
+                syslinux_conf = custom_cfg
+                msger.debug("Using custom configuration file "
+                        "%s for syslinux.cfg" % configfile)
+            else:
+                msger.error("configfile is specified but failed to "
+                        "get it from %s." % configfile)
+
+        if not custom_cfg:
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


