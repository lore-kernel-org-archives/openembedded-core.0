Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 761D978258
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 16:15:50 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP; 08 Jun 2017 09:15:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,315,1493708400"; d="scan'208";a="1158182937"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 08 Jun 2017 09:15:37 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 0B64A5806E6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 09:15:35 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 19:13:05 +0300
Message-Id: <0bdd12f40e7fb72416999dd2d6d1c657ffcd05ad.1496938139.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496938139.git.ed.bartosh@linux.intel.com>
References: <cover.1496938139.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 23/25] wic: implement removing files
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
X-List-Received-Date: Thu, 08 Jun 2017 16:15:50 -0000

Added implementation of Disk.del method and wic_r
function that removes files from the vfat partition
using mdel utility.

[YOCTO #11283]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 9a8055c..6fc8bb7 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -238,6 +238,7 @@ class Disk:
         self._partitions = None
         self._mdir = None
         self._mcopy = None
+        self._mdel = None
         self._partimages = {}
 
         # find parted
@@ -285,6 +286,10 @@ class Disk:
     def mcopy(self):
         return self._prop("mcopy")
 
+    @property
+    def mdel(self):
+        return self._prop("mdel")
+
     def _get_part_image(self, pnum):
         if pnum not in self.partitions:
             raise WicError("Partition %s is not in the image")
@@ -318,6 +323,14 @@ class Disk:
         exec_cmd(cmd)
         self._put_part_image(pnum)
 
+    def remove(self, pnum, path):
+        """Remove files/dirs from the partition."""
+        cmd = "{} -i {} ::{}".format(self.mdel,
+                                     self._get_part_image(pnum),
+                                     path)
+        exec_cmd(cmd)
+        self._put_part_image(pnum)
+
 def wic_ls(args, native_sysroot):
     """List contents of partitioned image or vfat partition."""
     disk = Disk(args.path.image, native_sysroot)
@@ -345,7 +358,8 @@ def wic_rm(args, native_sysroot):
     Remove files or directories from the vfat partition of
     partitioned image.
     """
-    pass
+    disk = Disk(args.path.image, native_sysroot)
+    disk.remove(args.path.part, args.path.path)
 
 def find_canned(scripts_path, file_name):
     """
-- 
2.1.4


