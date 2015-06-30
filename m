Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E976475C54
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 08:52:57 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 Jun 2015 01:52:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,376,1432623600"; d="scan'208";a="755700462"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 30 Jun 2015 01:52:59 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id B953A6A4005;
	Tue, 30 Jun 2015 01:52:19 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jun 2015 11:51:42 +0300
Message-Id: <1435654312-18177-11-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435654312-18177-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1435654312-18177-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v2 10/20] wic: Get rid of useless variable 'image_rootfs'
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
X-List-Received-Date: Tue, 30 Jun 2015 08:52:58 -0000

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


