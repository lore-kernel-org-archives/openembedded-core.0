Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 535B0607A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 19:11:31 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 29 Jun 2015 12:11:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,371,1432623600"; d="scan'208";a="719797727"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 29 Jun 2015 12:11:33 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 5C3A76A4083;
	Mon, 29 Jun 2015 12:10:53 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jun 2015 22:10:23 +0300
Message-Id: <1435605033-11509-11-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435605033-11509-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1435605033-11509-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 10/20] wic: Get rid of useless variable 'image_rootfs'
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
X-List-Received-Date: Mon, 29 Jun 2015 19:11:31 -0000

Removed useless variable 'image_rootfs' from 4 prepare_rootfs_* methods.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index 489ebe3..e3ae3ce 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -246,10 +246,7 @@ class Wic_PartData(Mic_PartData):
         """
         Prepare content for an ext2/3/4 rootfs partition.
         """
-
-        image_rootfs = rootfs_dir
-
-        du_cmd = "du -ks %s" % image_rootfs
+        du_cmd = "du -ks %s" % rootfs_dir
         out = exec_cmd(du_cmd)
         actual_rootfs_size = int(out.split()[0])
 
@@ -274,7 +271,7 @@ class Wic_PartData(Mic_PartData):
             label_str = "-L %s" % self.label
 
         mkfs_cmd = "mkfs.%s -F %s %s %s -d %s" % \
-            (self.fstype, extra_imagecmd, rootfs, label_str, image_rootfs)
+            (self.fstype, extra_imagecmd, rootfs, label_str, rootfs_dir)
         exec_native_cmd(pseudo + mkfs_cmd, native_sysroot)
 
         # get the rootfs size in the right units for kickstart (kB)
@@ -294,9 +291,7 @@ class Wic_PartData(Mic_PartData):
 
         Currently handles ext2/3/4 and btrfs.
         """
-        image_rootfs = rootfs_dir
-
-        du_cmd = "du -ks %s" % image_rootfs
+        du_cmd = "du -ks %s" % rootfs_dir
         out = exec_cmd(du_cmd)
         actual_rootfs_size = int(out.split()[0])
 
@@ -319,7 +314,7 @@ class Wic_PartData(Mic_PartData):
             label_str = "-L %s" % self.label
 
         mkfs_cmd = "mkfs.%s -b %d -r %s %s %s" % \
-            (self.fstype, rootfs_size * 1024, image_rootfs, label_str, rootfs)
+            (self.fstype, rootfs_size * 1024, rootfs_dir, label_str, rootfs)
         exec_native_cmd(pseudo + mkfs_cmd, native_sysroot)
 
         # get the rootfs size in the right units for kickstart (kB)
@@ -335,9 +330,7 @@ class Wic_PartData(Mic_PartData):
         """
         Prepare content for a vfat rootfs partition.
         """
-        image_rootfs = rootfs_dir
-
-        du_cmd = "du -bks %s" % image_rootfs
+        du_cmd = "du -bks %s" % rootfs_dir
         out = exec_cmd(du_cmd)
         blocks = int(out.split()[0])
 
@@ -365,7 +358,7 @@ class Wic_PartData(Mic_PartData):
         dosfs_cmd = "mkdosfs %s -S 512 -C %s %d" % (label_str, rootfs, blocks)
         exec_native_cmd(dosfs_cmd, native_sysroot)
 
-        mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (rootfs, image_rootfs)
+        mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (rootfs, rootfs_dir)
         exec_native_cmd(mcopy_cmd, native_sysroot)
 
         chmod_cmd = "chmod 644 %s" % rootfs
@@ -384,10 +377,8 @@ class Wic_PartData(Mic_PartData):
         """
         Prepare content for a squashfs rootfs partition.
         """
-        image_rootfs = rootfs_dir
-
         squashfs_cmd = "mksquashfs %s %s -noappend" % \
-                       (image_rootfs, rootfs)
+                       (rootfs_dir, rootfs)
         exec_native_cmd(pseudo + squashfs_cmd, native_sysroot)
 
         # get the rootfs size in the right units for kickstart (kB)
-- 
2.1.4


