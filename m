Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8833E77FFE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 17:21:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jun 2017 10:21:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,286,1493708400"; d="scan'208";a="1137380658"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 02 Jun 2017 10:21:57 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 1ED895806E1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 10:21:50 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Jun 2017 20:20:03 +0300
Message-Id: <61ef18fd4cafa4385ac37012ef6535285a396c19.1496423753.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496423753.git.ed.bartosh@linux.intel.com>
References: <cover.1496423753.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 4/6] wic: implement removing files
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
X-List-Received-Date: Fri, 02 Jun 2017 17:21:55 -0000

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


