Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C961F766E1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 13:18:50 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 28 Apr 2016 06:18:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,546,1455004800"; d="scan'208";a="954777064"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 28 Apr 2016 06:18:06 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 139A76A4007
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 07:05:41 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Apr 2016 13:58:04 +0300
Message-Id: <774790c3233d0591850069bd6083dea3e6b7cf23.1461834510.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1461834510.git.ed.bartosh@linux.intel.com>
References: <cover.1461834510.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1461834510.git.ed.bartosh@linux.intel.com>
References: <cover.1461834510.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v2 1/8] wic: use truncate utility to create sparse files
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
X-List-Received-Date: Thu, 28 Apr 2016 13:18:50 -0000

Used truncate instead of dd to create wic images for the
following reasons:
 - dd doesn't preserve sparseness
 - truncate syntax is much more clear
 - dd requires additional calculations of the image size
   in blocks
 - the way dd was used in the code is not always correct.
   In some cases it was writing one block to the file which makes
   it not 100% sparse.

[YOCTO #9099]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/partition.py        | 20 +++++---------------
 scripts/lib/wic/utils/fs_related.py | 12 +++---------
 2 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index f40d1bc..2ee64a2 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -219,9 +219,7 @@ class Partition(object):
         msger.debug("Added %d extra blocks to %s to get to %d total blocks" % \
                     (extra_blocks, self.mountpoint, rootfs_size))
 
-        dd_cmd = "dd if=/dev/zero of=%s bs=1024 seek=%d count=0 bs=1k" % \
-            (rootfs, rootfs_size)
-        exec_cmd(dd_cmd)
+        exec_cmd("truncate %s -s %d" % (rootfs, rootfs_size * 1024))
 
         extra_imagecmd = "-i 8192"
 
@@ -254,9 +252,7 @@ class Partition(object):
         msger.debug("Added %d extra blocks to %s to get to %d total blocks" % \
                     (extra_blocks, self.mountpoint, rootfs_size))
 
-        dd_cmd = "dd if=/dev/zero of=%s bs=1024 seek=%d count=0 bs=1k" % \
-            (rootfs, rootfs_size)
-        exec_cmd(dd_cmd)
+        exec_cmd("truncate %s -s %d" % (rootfs, rootfs_size * 1024))
 
         label_str = ""
         if self.label:
@@ -319,9 +315,7 @@ class Partition(object):
         """
         Prepare an empty ext2/3/4 partition.
         """
-        dd_cmd = "dd if=/dev/zero of=%s bs=1k seek=%d count=0" % \
-            (rootfs, self.size)
-        exec_cmd(dd_cmd)
+        exec_cmd("truncate %s -s %d" % (rootfs, self.size * 1024))
 
         extra_imagecmd = "-i 8192"
 
@@ -338,9 +332,7 @@ class Partition(object):
         """
         Prepare an empty btrfs partition.
         """
-        dd_cmd = "dd if=/dev/zero of=%s bs=1k seek=%d count=0" % \
-            (rootfs, self.size)
-        exec_cmd(dd_cmd)
+        exec_cmd("truncate %s -s %d" % (rootfs, self.size * 1024))
 
         label_str = ""
         if self.label:
@@ -401,9 +393,7 @@ class Partition(object):
         """
         path = "%s/fs.%s" % (cr_workdir, self.fstype)
 
-        dd_cmd = "dd if=/dev/zero of=%s bs=1k seek=%d count=0" % \
-            (path, self.size)
-        exec_cmd(dd_cmd)
+        exec_cmd("truncate %s -s %d" % (path, self.size * 1024))
 
         import uuid
         label_str = ""
diff --git a/scripts/lib/wic/utils/fs_related.py b/scripts/lib/wic/utils/fs_related.py
index 2e74461..2658dcf 100644
--- a/scripts/lib/wic/utils/fs_related.py
+++ b/scripts/lib/wic/utils/fs_related.py
@@ -71,14 +71,8 @@ class DiskImage(Disk):
     def create(self):
         if self.device is not None:
             return
-
-        blocks = self.size / 1024
-        if self.size - blocks * 1024:
-            blocks += 1
-
-        # create disk image
-        dd_cmd = "dd if=/dev/zero of=%s bs=1024 seek=%d count=1" % \
-            (self.image_file, blocks)
-        exec_cmd(dd_cmd)
+        # create sparse disk image
+        cmd = "truncate %s -s %s" % (self.image_file, self.size)
+        exec_cmd(cmd)
 
         self.device = self.image_file
-- 
2.1.4


