Return-Path: <chee.yang.lee@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 0729A79D4A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 06:31:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Jun 2019 23:31:38 -0700
X-ExtLoop1: 1
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga007.jf.intel.com with ESMTP; 10 Jun 2019 23:31:38 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jun 2019 14:31:37 +0800
Message-Id: <1560234697-27013-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] wic/plugins: kernel image refer to KERNEL_IMAGETYPE
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
X-List-Received-Date: Tue, 11 Jun 2019 06:31:38 -0000

From: Chee Yang Lee <chee.yang.lee@intel.com>

replaced hardcoded kernel image with KERNEL_IMAGETYPE.
set kernel image to "bzImage" incase KERNEL_IMAGETYPE not set.

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py       | 21 +++++++++++++++------
 scripts/lib/wic/plugins/source/bootimg-pcbios.py    |  8 ++++++--
 .../lib/wic/plugins/source/isoimage-isohybrid.py    | 21 ++++++++++++++-------
 3 files changed, 35 insertions(+), 15 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 70cc1b0..d87db1f 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -71,14 +71,16 @@ class BootimgEFIPlugin(SourcePlugin):
             grubefi_conf += "timeout=%s\n" % bootloader.timeout
             grubefi_conf += "menuentry '%s'{\n" % (title if title else "boot")
 
-            kernel = "/bzImage"
+            kernel = get_bitbake_var("KERNEL_IMAGETYPE")
+            if not kernel:
+                kernel = "bzImage"
 
             label = source_params.get('label')
             label_conf = "root=%s" % creator.rootdev
             if label:
                 label_conf = "LABEL=%s" % label
 
-            grubefi_conf += "linux %s %s rootwait %s\n" \
+            grubefi_conf += "linux /%s %s rootwait %s\n" \
                 % (kernel, label_conf, bootloader.append)
 
             if initrd:
@@ -143,12 +145,15 @@ class BootimgEFIPlugin(SourcePlugin):
 
         if not custom_cfg:
             # Create systemd-boot configuration using parameters from wks file
-            kernel = "/bzImage"
+            kernel = get_bitbake_var("KERNEL_IMAGETYPE")
+            if not kernel:
+                kernel = "bzImage"
+
             title = source_params.get('title')
 
             boot_conf = ""
             boot_conf += "title %s\n" % (title if title else "boot")
-            boot_conf += "linux %s\n" % kernel
+            boot_conf += "linux /%s\n" % kernel
 
             label = source_params.get('label')
             label_conf = "LABEL=Boot root=%s" % creator.rootdev
@@ -209,8 +214,12 @@ class BootimgEFIPlugin(SourcePlugin):
 
         hdddir = "%s/hdd/boot" % cr_workdir
 
-        install_cmd = "install -m 0644 %s/bzImage %s/bzImage" % \
-            (staging_kernel_dir, hdddir)
+        kernel = get_bitbake_var("KERNEL_IMAGETYPE")
+        if not kernel:
+            kernel = "bzImage"
+
+        install_cmd = "install -m 0644 %s/%s %s/%s" % \
+            (staging_kernel_dir, kernel, hdddir, kernel)
         exec_cmd(install_cmd)
 
 
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index 6c9f54a..670d347 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -149,8 +149,12 @@ class BootimgPcbiosPlugin(SourcePlugin):
 
         hdddir = "%s/hdd/boot" % cr_workdir
 
-        cmds = ("install -m 0644 %s/bzImage %s/vmlinuz" %
-                (staging_kernel_dir, hdddir),
+        kernel = get_bitbake_var("KERNEL_IMAGETYPE")
+        if not kernel:
+            kernel = "bzImage"
+
+        cmds = ("install -m 0644 %s/%s %s/vmlinuz" %
+                (staging_kernel_dir, kernel, hdddir),
                 "install -m 444 %s/syslinux/ldlinux.sys %s/ldlinux.sys" %
                 (bootimg_dir, hdddir),
                 "install -m 0644 %s/syslinux/vesamenu.c32 %s/vesamenu.c32" %
diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index 96d07ff..74d6f14 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -70,8 +70,10 @@ class IsoImagePlugin(SourcePlugin):
         syslinux_conf += "DEFAULT boot\n"
         syslinux_conf += "LABEL boot\n"
 
-        kernel = "/bzImage"
-        syslinux_conf += "KERNEL " + kernel + "\n"
+        kernel = get_bitbake_var("KERNEL_IMAGETYPE")
+        if not kernel:
+            kernel = "bzImage"
+        syslinux_conf += "KERNEL /" + kernel + "\n"
         syslinux_conf += "APPEND initrd=/initrd LABEL=boot %s\n" \
                              % bootloader.append
 
@@ -114,9 +116,11 @@ class IsoImagePlugin(SourcePlugin):
             grubefi_conf += "\n"
             grubefi_conf += "menuentry 'boot'{\n"
 
-            kernel = "/bzImage"
+            kernel = get_bitbake_var("KERNEL_IMAGETYPE")
+            if not kernel:
+                kernel = "bzImage"
 
-            grubefi_conf += "linux %s rootwait %s\n" \
+            grubefi_conf += "linux /%s rootwait %s\n" \
                             % (kernel, bootloader.append)
             grubefi_conf += "initrd /initrd \n"
             grubefi_conf += "}\n"
@@ -268,9 +272,12 @@ class IsoImagePlugin(SourcePlugin):
         if os.path.isfile("%s/initrd.cpio.gz" % cr_workdir):
             os.remove("%s/initrd.cpio.gz" % cr_workdir)
 
-        # Install bzImage
-        install_cmd = "install -m 0644 %s/bzImage %s/bzImage" % \
-                      (kernel_dir, isodir)
+        kernel = get_bitbake_var("KERNEL_IMAGETYPE")
+        if not kernel:
+            kernel = "bzImage"
+
+        install_cmd = "install -m 0644 %s/%s %s/%s" % \
+                      (kernel_dir, kernel, isodir, kernel)
         exec_cmd(install_cmd)
 
         #Create bootloader for efi boot
-- 
2.7.4


