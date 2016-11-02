Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CCE3471AE2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 20:33:17 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 02 Nov 2016 13:33:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,436,1473145200"; d="scan'208";a="186903040"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 02 Nov 2016 13:33:18 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 20CA46A4082;
	Wed,  2 Nov 2016 13:32:41 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Nov 2016 22:33:07 +0200
Message-Id: <1478118787-20776-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] wic: call os.ftruncate instead of running truncate
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
X-List-Received-Date: Wed, 02 Nov 2016 20:33:17 -0000

Replaced running of truncate utility with the standard library
call os.ftruncate

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/imager/direct.py |  5 +++--
 scripts/lib/wic/partition.py     | 15 ++++++++++-----
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index edf5e5d..2bedef0 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -56,8 +56,9 @@ class DiskImage():
         if self.created:
             return
         # create sparse disk image
-        cmd = "truncate %s -s %s" % (self.device, self.size)
-        exec_cmd(cmd)
+        with open(self.device, 'w') as sparse:
+            os.ftruncate(sparse.fileno(), self.size)
+
         self.created = True
 
 class DirectImageCreator(BaseImageCreator):
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 90f65a1..89c33ab 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -217,7 +217,8 @@ class Partition():
         msger.debug("Added %d extra blocks to %s to get to %d total blocks" % \
                     (extra_blocks, self.mountpoint, rootfs_size))
 
-        exec_cmd("truncate %s -s %d" % (rootfs, rootfs_size * 1024))
+        with open(rootfs, 'w') as sparse:
+            os.ftruncate(sparse.fileno(), rootfs_size * 1024)
 
         extra_imagecmd = "-i 8192"
 
@@ -250,7 +251,8 @@ class Partition():
         msger.debug("Added %d extra blocks to %s to get to %d total blocks" % \
                     (extra_blocks, self.mountpoint, rootfs_size))
 
-        exec_cmd("truncate %s -s %d" % (rootfs, rootfs_size * 1024))
+        with open(rootfs, 'w') as sparse:
+            os.ftruncate(sparse.fileno(), rootfs_size * 1024)
 
         label_str = ""
         if self.label:
@@ -305,7 +307,8 @@ class Partition():
         """
         Prepare an empty ext2/3/4 partition.
         """
-        exec_cmd("truncate %s -s %d" % (rootfs, self.size * 1024))
+        with open(rootfs, 'w') as sparse:
+            os.ftruncate(sparse.fileno(), rootfs_size * 1024)
 
         extra_imagecmd = "-i 8192"
 
@@ -322,7 +325,8 @@ class Partition():
         """
         Prepare an empty btrfs partition.
         """
-        exec_cmd("truncate %s -s %d" % (rootfs, self.size * 1024))
+        with open(rootfs, 'w') as sparse:
+            os.ftruncate(sparse.fileno(), rootfs_size * 1024)
 
         label_str = ""
         if self.label:
@@ -383,7 +387,8 @@ class Partition():
         """
         path = "%s/fs.%s" % (cr_workdir, self.fstype)
 
-        exec_cmd("truncate %s -s %d" % (path, self.size * 1024))
+        with open(path, 'w') as sparse:
+            os.ftruncate(sparse.fileno(), self.size * 1024)
 
         import uuid
         label_str = ""
-- 
2.1.4


