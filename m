Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 86C1A73BBE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jun 2015 11:47:48 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jun 2015 04:47:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,558,1427785200"; d="scan'208";a="503213992"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Jun 2015 04:47:49 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 36D7D6A4083;
	Fri,  5 Jun 2015 04:47:15 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jun 2015 12:54:08 +0300
Message-Id: <1433498048-5468-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] wic: Move validation of --ptable option to wks parser
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
X-List-Received-Date: Fri, 05 Jun 2015 11:47:49 -0000

bootloader --ptable option has two valid choices: gpt and msdos
Moved this check to wks parser by changing option type to 'choice'.

Removed similar checks from 5 other places.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/kickstart/custom_commands/micboot.py |  3 ++-
 scripts/lib/wic/plugins/source/bootimg-efi.py        | 15 ++-------------
 scripts/lib/wic/plugins/source/bootimg-pcbios.py     |  8 ++------
 scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py  |  8 ++------
 scripts/lib/wic/utils/partitionedfs.py               |  4 ----
 5 files changed, 8 insertions(+), 30 deletions(-)

diff --git a/scripts/lib/wic/kickstart/custom_commands/micboot.py b/scripts/lib/wic/kickstart/custom_commands/micboot.py
index d162142..358b0ea 100644
--- a/scripts/lib/wic/kickstart/custom_commands/micboot.py
+++ b/scripts/lib/wic/kickstart/custom_commands/micboot.py
@@ -44,6 +44,7 @@ class Mic_Bootloader(F8_Bootloader):
     def _getParser(self):
         op = F8_Bootloader._getParser(self)
         op.add_option("--menus", dest="menus")
-        op.add_option("--ptable", dest="ptable", type="string")
+        op.add_option("--ptable", dest="ptable", choices=("msdos", "gpt"),
+                      default="msdos")
         return op
 
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 39ce9f3..d3b8468 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -60,13 +60,8 @@ class BootimgEFIPlugin(SourcePlugin):
 
         kernel = "/bzImage"
 
-        if cr.ptable_format in ('msdos', 'gpt'):
-            rootstr = cr.rootdev
-        else:
-            raise ImageError("Unsupported partition table format found")
-
         grubefi_conf += "linux %s root=%s rootwait %s\n" \
-            % (kernel, rootstr, options)
+            % (kernel, cr.rootdev, options)
         grubefi_conf += "}\n"
 
         msger.debug("Writing grubefi config %s/hdd/boot/EFI/BOOT/grub.cfg" \
@@ -104,16 +99,10 @@ class BootimgEFIPlugin(SourcePlugin):
 
         kernel = "/bzImage"
 
-        if cr.ptable_format in ('msdos', 'gpt'):
-            rootstr = cr.rootdev
-        else:
-            raise ImageError("Unsupported partition table format found")
-
         boot_conf = ""
         boot_conf += "title boot\n"
         boot_conf += "linux %s\n" % kernel
-        boot_conf += "options LABEL=Boot root=%s %s\n" \
-            % (rootstr, options)
+        boot_conf += "options LABEL=Boot root=%s %s\n" % (cr.rootdev, options)
 
         msger.debug("Writing gummiboot config %s/hdd/boot/loader/entries/boot.conf" \
                         % cr_workdir)
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index dd49480..5caffbc 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -103,12 +103,8 @@ class BootimgPcbiosPlugin(SourcePlugin):
         kernel = "/vmlinuz"
         syslinux_conf += "KERNEL " + kernel + "\n"
 
-        if cr.ptable_format in ('msdos', 'gpt'):
-            rootstr = cr.rootdev
-        else:
-            raise ImageError("Unsupported partition table format found")
-
-        syslinux_conf += "APPEND label=boot root=%s %s\n" % (rootstr, options)
+        syslinux_conf += "APPEND label=boot root=%s %s\n" % \
+                             (cr.rootdev, options)
 
         msger.debug("Writing syslinux config %s/hdd/boot/syslinux.cfg" \
                     % cr_workdir)
diff --git a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
index 90dac05..533eaa7 100644
--- a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
+++ b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
@@ -100,12 +100,8 @@ class RootfsPlugin(SourcePlugin):
         syslinux_conf += "LABEL linux\n"
         syslinux_conf += "  KERNEL /boot/bzImage\n"
 
-        if image_creator.ptable_format in ('msdos', 'gpt'):
-            rootstr = image_creator.rootdev
-        else:
-            raise ImageError("Unsupported partition table format found")
-
-        syslinux_conf += "  APPEND label=boot root=%s %s\n" % (rootstr, options)
+        syslinux_conf += "  APPEND label=boot root=%s %s\n" % \
+                             (image_creator.rootdev, options)
 
         syslinux_cfg = os.path.join(image_creator.rootfs_dir['ROOTFS_DIR'], "boot", "syslinux.cfg")
         msger.debug("Writing syslinux config %s" % syslinux_cfg)
diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index 1eb1f01..e093ec5 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -122,10 +122,6 @@ class Image(object):
 
         msger.debug("Assigning %s partitions to disks" % ptable_format)
 
-        if ptable_format not in ('msdos', 'gpt'):
-            raise ImageError("Unknown partition table format '%s', supported " \
-                             "formats are: 'msdos'" % ptable_format)
-
         if self._partitions_layed_out:
             return
 
-- 
2.1.4


