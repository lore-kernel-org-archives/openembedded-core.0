Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3A398757B4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jun 2015 09:06:44 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jun 2015 02:06:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,557,1427785200"; d="scan'208";a="705793651"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 05 Jun 2015 02:06:26 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 686126A4083;
	Fri,  5 Jun 2015 02:05:51 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jun 2015 10:12:20 +0300
Message-Id: <1433488349-4178-7-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1433488349-4178-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1433488349-4178-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 4/9] wic: refactored getting root device name
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
X-List-Received-Date: Fri, 05 Jun 2015 09:06:45 -0000

Replaced DirectImageCreator._get_boot_config private method
with a 'rootdev' property.
Simplified the code and API.
Used 'uuid' property instead of incorrectly used 'part_type'.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index 83f9688..36150c9 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -346,27 +346,23 @@ class DirectImageCreator(BaseImageCreator):
 
         msger.info(msg)
 
-    def _get_boot_config(self):
+    @property
+    def rootdev(self):
         """
-        Return the rootdev/root_part_uuid (if specified by
-        --part-type)
+        Get root device name to use as a 'root' parameter
+        in kernel command line.
 
         Assume partition order same as in wks
         """
-        rootdev = None
-        root_part_uuid = None
         parts = self._get_parts()
-        for num, p in enumerate(parts, 1):
-            if p.mountpoint == "/":
-                part = ''
-                if p.disk.startswith('mmcblk'):
-                    part = 'p'
-
-                pnum = self.__get_part_num(num, parts)
-                rootdev = "/dev/%s%s%-d" % (p.disk, part, pnum)
-                root_part_uuid = p.part_type
-
-        return (rootdev, root_part_uuid)
+        for num, part in enumerate(parts, 1):
+            if part.mountpoint == "/":
+                if part.uuid:
+                    return "PARTUUID=%s" % part.uuid
+                else:
+                    suffix = 'p' if part.disk.startswith('mmcblk') else ''
+                    pnum = self.__get_part_num(num, parts)
+                    return "/dev/%s%s%-d" % (part.disk, suffix, pnum)
 
     def _cleanup(self):
         if not self.__image is None:
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 400e3a2..39ce9f3 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -47,7 +47,6 @@ class BootimgEFIPlugin(SourcePlugin):
         else:
             splashline = ""
 
-        (rootdev, root_part_uuid) = cr._get_boot_config()
         options = cr.ks.handler.bootloader.appendLine
 
         grubefi_conf = ""
@@ -62,7 +61,7 @@ class BootimgEFIPlugin(SourcePlugin):
         kernel = "/bzImage"
 
         if cr.ptable_format in ('msdos', 'gpt'):
-            rootstr = rootdev
+            rootstr = cr.rootdev
         else:
             raise ImageError("Unsupported partition table format found")
 
@@ -87,7 +86,6 @@ class BootimgEFIPlugin(SourcePlugin):
         install_cmd = "install -d %s/loader/entries" % hdddir
         exec_cmd(install_cmd)
 
-        (rootdev, root_part_uuid) = cr._get_boot_config()
         options = cr.ks.handler.bootloader.appendLine
 
         timeout = kickstart.get_timeout(cr.ks)
@@ -107,7 +105,7 @@ class BootimgEFIPlugin(SourcePlugin):
         kernel = "/bzImage"
 
         if cr.ptable_format in ('msdos', 'gpt'):
-            rootstr = rootdev
+            rootstr = cr.rootdev
         else:
             raise ImageError("Unsupported partition table format found")
 
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index 1c3c6e6..dd49480 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -83,7 +83,6 @@ class BootimgPcbiosPlugin(SourcePlugin):
         else:
             splashline = ""
 
-        (rootdev, root_part_uuid) = cr._get_boot_config()
         options = cr.ks.handler.bootloader.appendLine
 
         syslinux_conf = ""
@@ -105,7 +104,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
         syslinux_conf += "KERNEL " + kernel + "\n"
 
         if cr.ptable_format in ('msdos', 'gpt'):
-            rootstr = rootdev
+            rootstr = cr.rootdev
         else:
             raise ImageError("Unsupported partition table format found")
 
diff --git a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
index 50b2213..90dac05 100644
--- a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
+++ b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
@@ -82,7 +82,6 @@ class RootfsPlugin(SourcePlugin):
 
         Called before do_prepare_partition()
         """
-        rootdev = image_creator._get_boot_config()[0]
         options = image_creator.ks.handler.bootloader.appendLine
 
         syslinux_conf = ""
@@ -102,7 +101,7 @@ class RootfsPlugin(SourcePlugin):
         syslinux_conf += "  KERNEL /boot/bzImage\n"
 
         if image_creator.ptable_format in ('msdos', 'gpt'):
-            rootstr = rootdev
+            rootstr = image_creator.rootdev
         else:
             raise ImageError("Unsupported partition table format found")
 
-- 
2.1.4


