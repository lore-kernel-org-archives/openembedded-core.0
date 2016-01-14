Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1981E731C9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 14:14:57 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Jan 2016 06:14:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,294,1449561600"; d="scan'208";a="893132076"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 14 Jan 2016 06:14:58 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 9C5506A4002
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 07:02:54 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jan 2016 14:12:56 +0200
Message-Id: <aa6e98c51e792e36035bf59031b1e341c40c739a.1452766193.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1452766193.git.ed.bartosh@linux.intel.com>
References: <cover.1452766193.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1452766193.git.ed.bartosh@linux.intel.com>
References: <cover.1452766193.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 6/9] wic: get rid of get_timeout getter
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
X-List-Received-Date: Thu, 14 Jan 2016 14:14:58 -0000

Used bootloader.timeout instead of kickstart.get_timeout getter.

Accessing attributes instead of getting them with getters is
more pythonic, shorter and readable. It also more consistent as
most of partition and bootloader attributes are used this way.

This change also takes care of appendLine bootloader attribute:
it's renamed to bootloader.append attribute provided by new parser.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py        | 18 ++++++------------
 scripts/lib/wic/plugins/source/bootimg-pcbios.py     |  9 ++-------
 scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 16 +++++++---------
 scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py  |  5 +----
 4 files changed, 16 insertions(+), 32 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 556586f..35afa30 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -66,16 +66,13 @@ class BootimgEFIPlugin(SourcePlugin):
             grubefi_conf = ""
             grubefi_conf += "serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1\n"
             grubefi_conf += "default=boot\n"
-            timeout = kickstart.get_timeout(creator.ks)
-            if not timeout:
-                timeout = 0
-            grubefi_conf += "timeout=%s\n" % timeout
+            grubefi_conf += "timeout=%s\n" % bootloader.timeout
             grubefi_conf += "menuentry 'boot'{\n"
 
             kernel = "/bzImage"
 
             grubefi_conf += "linux %s root=%s rootwait %s\n" \
-                % (kernel, creator.rootdev, options)
+                % (kernel, creator.rootdev, bootloader.append)
             grubefi_conf += "}\n"
 
         msger.debug("Writing grubefi config %s/hdd/boot/EFI/BOOT/grub.cfg" \
@@ -95,15 +92,11 @@ class BootimgEFIPlugin(SourcePlugin):
         install_cmd = "install -d %s/loader/entries" % hdddir
         exec_cmd(install_cmd)
 
-        options = creator.ks.handler.bootloader.appendLine
-
-        timeout = kickstart.get_timeout(creator.ks)
-        if not timeout:
-            timeout = 0
+        bootloader = creator.ks.bootloader
 
         loader_conf = ""
         loader_conf += "default boot\n"
-        loader_conf += "timeout %d\n" % timeout
+        loader_conf += "timeout %d\n" % bootloader.timeout
 
         msger.debug("Writing gummiboot config %s/hdd/boot/loader/loader.conf" \
                         % cr_workdir)
@@ -131,7 +124,8 @@ class BootimgEFIPlugin(SourcePlugin):
             boot_conf = ""
             boot_conf += "title boot\n"
             boot_conf += "linux %s\n" % kernel
-            boot_conf += "options LABEL=Boot root=%s %s\n" % (creator.rootdev, options)
+            boot_conf += "options LABEL=Boot root=%s %s\n" % \
+                             (creator.rootdev, bootloader.append)
 
         msger.debug("Writing gummiboot config %s/hdd/boot/loader/entries/boot.conf" \
                         % cr_workdir)
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index 80c7dfb..255684b 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -105,14 +105,9 @@ class BootimgPcbiosPlugin(SourcePlugin):
             else:
                 splashline = ""
 
-            options = creator.ks.handler.bootloader.appendLine
-
             syslinux_conf = ""
             syslinux_conf += "PROMPT 0\n"
-            timeout = kickstart.get_timeout(creator.ks)
-            if not timeout:
-                timeout = 0
-            syslinux_conf += "TIMEOUT " + str(timeout) + "\n"
+            syslinux_conf += "TIMEOUT " + str(bootloader.timeout) + "\n"
             syslinux_conf += "\n"
             syslinux_conf += "ALLOWOPTIONS 1\n"
             syslinux_conf += "SERIAL 0 115200\n"
@@ -126,7 +121,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
             syslinux_conf += "KERNEL " + kernel + "\n"
 
             syslinux_conf += "APPEND label=boot root=%s %s\n" % \
-                                 (creator.rootdev, options)
+                             (creator.rootdev, bootloader.append)
 
         msger.debug("Writing syslinux config %s/hdd/boot/syslinux.cfg" \
                     % cr_workdir)
diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index 9472d8a..9ad0bc7 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -64,13 +64,11 @@ class IsoImagePlugin(SourcePlugin):
         else:
             splashline = ""
 
-        options = creator.ks.handler.bootloader.appendLine
-
-        timeout = kickstart.get_timeout(creator.ks, 10)
+        bootloader = creator.ks.bootloader
 
         syslinux_conf = ""
         syslinux_conf += "PROMPT 0\n"
-        syslinux_conf += "TIMEOUT %s \n" % timeout
+        syslinux_conf += "TIMEOUT %s \n" % (bootloader.timeout or 10)
         syslinux_conf += "\n"
         syslinux_conf += "ALLOWOPTIONS 1\n"
         syslinux_conf += "SERIAL 0 115200\n"
@@ -82,7 +80,8 @@ class IsoImagePlugin(SourcePlugin):
 
         kernel = "/bzImage"
         syslinux_conf += "KERNEL " + kernel + "\n"
-        syslinux_conf += "APPEND initrd=/initrd LABEL=boot %s\n" % options
+        syslinux_conf += "APPEND initrd=/initrd LABEL=boot %s\n" \
+                             % bootloader.append
 
         msger.debug("Writing syslinux config %s/ISO/isolinux/isolinux.cfg" \
                     % cr_workdir)
@@ -100,14 +99,13 @@ class IsoImagePlugin(SourcePlugin):
         else:
             splashline = ""
 
-        options = creator.ks.handler.bootloader.appendLine
+        bootloader = creator.ks.bootloader
 
         grubefi_conf = ""
         grubefi_conf += "serial --unit=0 --speed=115200 --word=8 "
         grubefi_conf += "--parity=no --stop=1\n"
         grubefi_conf += "default=boot\n"
-        timeout = kickstart.get_timeout(creator.ks, 10)
-        grubefi_conf += "timeout=%s\n" % timeout
+        grubefi_conf += "timeout=%s\n" % (bootloader.timeout or 10)
         grubefi_conf += "\n"
         grubefi_conf += "search --set=root --label %s " % part.label
         grubefi_conf += "\n"
@@ -116,7 +114,7 @@ class IsoImagePlugin(SourcePlugin):
         kernel = "/bzImage"
 
         grubefi_conf += "linux %s rootwait %s\n" \
-            % (kernel, options)
+            % (kernel, bootloader.append)
         grubefi_conf += "initrd /initrd \n"
         grubefi_conf += "}\n"
 
diff --git a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
index 4280ff7..bdf1b54 100644
--- a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
+++ b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
@@ -83,10 +83,7 @@ class RootfsPlugin(SourcePlugin):
         syslinux_conf = ""
         syslinux_conf += "PROMPT 0\n"
 
-        timeout = kickstart.get_timeout(image_creator.ks)
-        if not timeout:
-            timeout = 0
-        syslinux_conf += "TIMEOUT " + str(timeout) + "\n"
+        syslinux_conf += "TIMEOUT " + str(bootloader.timeout) + "\n"
         syslinux_conf += "ALLOWOPTIONS 1\n"
 
         # Derive SERIAL... line from from kernel boot parameters
-- 
2.1.4


