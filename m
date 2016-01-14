Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C25F56FF7B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 14:14:52 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 14 Jan 2016 06:14:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,294,1449561600"; d="scan'208";a="29293982"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 14 Jan 2016 06:14:35 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id C51326A4002
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 07:02:30 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jan 2016 14:12:55 +0200
Message-Id: <e6b1fa3be9f3ee113ff5637f06cc3d4ea4133ee1.1452766193.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1452766193.git.ed.bartosh@linux.intel.com>
References: <cover.1452766193.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1452766193.git.ed.bartosh@linux.intel.com>
References: <cover.1452766193.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 5/9] wic: adjust code for new data structure
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
X-List-Received-Date: Thu, 14 Jan 2016 14:14:54 -0000

New data structure is less nested than old one.
Adjusted bootloader and partitions fields:
self.ks.handler.bootloader -> self.ks.bootoader
self.ks.handler.partitions -> self.ks.partitions

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/imager/baseimager.py                |  2 +-
 scripts/lib/wic/imager/direct.py                    | 16 ++++++++--------
 scripts/lib/wic/plugins/source/bootimg-efi.py       |  2 +-
 scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py |  4 ++--
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/scripts/lib/wic/imager/baseimager.py b/scripts/lib/wic/imager/baseimager.py
index acbe948..760cf8a 100644
--- a/scripts/lib/wic/imager/baseimager.py
+++ b/scripts/lib/wic/imager/baseimager.py
@@ -85,7 +85,7 @@ class BaseImageCreator(object):
         # No ks provided when called by convertor, so skip the dependency check
         if self.ks:
             # If we have btrfs partition we need to check necessary tools
-            for part in self.ks.handler.partition.partitions:
+            for part in self.ks.partitions:
                 if part.fstype and part.fstype == "btrfs":
                     self._dep_checks.append("mkfs.btrfs")
                     break
diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index f89c42c..25bab89 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -64,7 +64,7 @@ class DirectImageCreator(BaseImageCreator):
         self.__disks = {}
         self.__disk_format = "direct"
         self._disk_names = []
-        self.ptable_format = self.ks.handler.bootloader.ptable
+        self.ptable_format = self.ks.bootloader.ptable
 
         self.oe_builddir = oe_builddir
         if image_output_dir:
@@ -151,12 +151,12 @@ class DirectImageCreator(BaseImageCreator):
                                "please check your kickstart setting.")
 
         # Set a default partition if no partition is given out
-        if not self.ks.handler.partition.partitions:
+        if not self.ks.partitions:
             partstr = "part / --size 1900 --ondisk sda --fstype=ext3"
             args = partstr.split()
-            part = self.ks.handler.partition.parse(args[1:])
-            if part not in self.ks.handler.partition.partitions:
-                self.ks.handler.partition.partitions.append(part)
+            part = self.ks.parse(args[1:])
+            if part not in self.ks.partitions:
+                self.ks.partitions.append(part)
 
         # partitions list from kickstart file
         return kickstart.get_partitions(self.ks)
@@ -206,7 +206,7 @@ class DirectImageCreator(BaseImageCreator):
         bootloader object, the default can be explicitly set using the
         --source bootloader param.
         """
-        return self.ks.handler.bootloader.source
+        return self.ks.bootloader.source
 
     #
     # Actual implemention
@@ -224,8 +224,8 @@ class DirectImageCreator(BaseImageCreator):
         for part in parts:
             # as a convenience, set source to the boot partition source
             # instead of forcing it to be set via bootloader --source
-            if not self.ks.handler.bootloader.source and part.mountpoint == "/boot":
-                self.ks.handler.bootloader.source = part.source
+            if not self.ks.bootloader.source and part.mountpoint == "/boot":
+                self.ks.bootloader.source = part.source
 
         fstab_path = self._write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
 
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 5feb79d..556586f 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -61,7 +61,7 @@ class BootimgEFIPlugin(SourcePlugin):
 
         if not custom_cfg:
             # Create grub configuration using parameters from wks file
-            options = creator.ks.handler.bootloader.appendLine
+            bootloader = creator.ks.bootloader
 
             grubefi_conf = ""
             grubefi_conf += "serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1\n"
diff --git a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
index 76e7b03..4280ff7 100644
--- a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
+++ b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
@@ -78,7 +78,7 @@ class RootfsPlugin(SourcePlugin):
 
         Called before do_prepare_partition()
         """
-        options = image_creator.ks.handler.bootloader.appendLine
+        bootloader = image_creator.ks.bootloader
 
         syslinux_conf = ""
         syslinux_conf += "PROMPT 0\n"
@@ -97,7 +97,7 @@ class RootfsPlugin(SourcePlugin):
         syslinux_conf += "  KERNEL /boot/bzImage\n"
 
         syslinux_conf += "  APPEND label=boot root=%s %s\n" % \
-                             (image_creator.rootdev, options)
+                             (image_creator.rootdev, bootloader.append)
 
         syslinux_cfg = os.path.join(image_creator.rootfs_dir['ROOTFS_DIR'], "boot", "syslinux.cfg")
         msger.debug("Writing syslinux config %s" % syslinux_cfg)
-- 
2.1.4


