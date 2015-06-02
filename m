Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E5883757E9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 15:56:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Jun 2015 08:56:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,540,1427785200"; d="scan'208";a="704019132"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 02 Jun 2015 08:56:02 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 3FB1A6A4005;
	Tue,  2 Jun 2015 08:55:28 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jun 2015 17:02:03 +0300
Message-Id: <1433253725-14089-6-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1433253725-14089-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1433253725-14089-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 5/7] wic: Make _ptable_format public
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
X-List-Received-Date: Tue, 02 Jun 2015 15:56:01 -0000

Names with one leasding underscore considered protected in Python.
_ptable_format is accessed outside of its class.
Made it public by removing underscore.

This pylint warning should be fixed now:
Access to a protected member _ptable_format of a client class

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index 9a7d0f5..83f9688 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -62,7 +62,7 @@ class DirectImageCreator(BaseImageCreator):
         self.__disks = {}
         self.__disk_format = "direct"
         self._disk_names = []
-        self._ptable_format = self.ks.handler.bootloader.ptable
+        self.ptable_format = self.ks.handler.bootloader.ptable
 
         self.oe_builddir = oe_builddir
         if image_output_dir:
@@ -83,7 +83,7 @@ class DirectImageCreator(BaseImageCreator):
             if n == num:
                 if  p.no_table:
                     return 0
-                if self._ptable_format == 'msdos' and realnum > 3:
+                if self.ptable_format == 'msdos' and realnum > 3:
                     # account for logical partition numbering, ex. sda5..
                     return realnum + 1
                 return realnum
@@ -276,7 +276,7 @@ class DirectImageCreator(BaseImageCreator):
 
         self._restore_fstab(fstab)
 
-        self.__image.layout_partitions(self._ptable_format)
+        self.__image.layout_partitions(self.ptable_format)
 
         self.__imgdir = self.workdir
         for disk_name, disk in self.__image.disks.items():
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 22c7b0a..400e3a2 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -61,7 +61,7 @@ class BootimgEFIPlugin(SourcePlugin):
 
         kernel = "/bzImage"
 
-        if cr._ptable_format in ('msdos', 'gpt'):
+        if cr.ptable_format in ('msdos', 'gpt'):
             rootstr = rootdev
         else:
             raise ImageError("Unsupported partition table format found")
@@ -106,7 +106,7 @@ class BootimgEFIPlugin(SourcePlugin):
 
         kernel = "/bzImage"
 
-        if cr._ptable_format in ('msdos', 'gpt'):
+        if cr.ptable_format in ('msdos', 'gpt'):
             rootstr = rootdev
         else:
             raise ImageError("Unsupported partition table format found")
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index ab62b7a..1c3c6e6 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -44,12 +44,12 @@ class BootimgPcbiosPlugin(SourcePlugin):
         disk image.  In this case, we install the MBR.
         """
         mbrfile = "%s/syslinux/" % bootimg_dir
-        if cr._ptable_format == 'msdos':
+        if cr.ptable_format == 'msdos':
             mbrfile += "mbr.bin"
-        elif cr._ptable_format == 'gpt':
+        elif cr.ptable_format == 'gpt':
             mbrfile += "gptmbr.bin"
         else:
-            msger.error("Unsupported partition table: %s" % cr._ptable_format)
+            msger.error("Unsupported partition table: %s" % cr.ptable_format)
 
         if not os.path.exists(mbrfile):
             msger.error("Couldn't find %s.  If using the -e option, do you have the right MACHINE set in local.conf?  If not, is the bootimg_dir path correct?" % mbrfile)
@@ -104,7 +104,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
         kernel = "/vmlinuz"
         syslinux_conf += "KERNEL " + kernel + "\n"
 
-        if cr._ptable_format in ('msdos', 'gpt'):
+        if cr.ptable_format in ('msdos', 'gpt'):
             rootstr = rootdev
         else:
             raise ImageError("Unsupported partition table format found")
diff --git a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
index cdd7c84..50b2213 100644
--- a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
+++ b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
@@ -101,7 +101,7 @@ class RootfsPlugin(SourcePlugin):
         syslinux_conf += "LABEL linux\n"
         syslinux_conf += "  KERNEL /boot/bzImage\n"
 
-        if image_creator._ptable_format in ('msdos', 'gpt'):
+        if image_creator.ptable_format in ('msdos', 'gpt'):
             rootstr = rootdev
         else:
             raise ImageError("Unsupported partition table format found")
@@ -170,13 +170,13 @@ class RootfsPlugin(SourcePlugin):
         disk image. In this case, we install the MBR.
         """
         mbrfile = os.path.join(native_sysroot, "usr/share/syslinux/")
-        if image_creator._ptable_format == 'msdos':
+        if image_creator.ptable_format == 'msdos':
             mbrfile += "mbr.bin"
-        elif image_creator._ptable_format == 'gpt':
+        elif image_creator.ptable_format == 'gpt':
             mbrfile += "gptmbr.bin"
         else:
             msger.error("Unsupported partition table: %s" % \
-                        image_creator._ptable_format)
+                        image_creator.ptable_format)
 
         if not os.path.exists(mbrfile):
             msger.error("Couldn't find %s. Has syslinux-native been baked?" % mbrfile)
-- 
2.1.4


