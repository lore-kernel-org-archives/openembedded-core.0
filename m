Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5ED9A78049
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 11:55:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Sep 2017 04:55:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,480,1498546800"; d="scan'208";a="1169243877"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 05 Sep 2017 04:55:35 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id BB68B5809EF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 04:55:34 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Sep 2017 14:54:36 +0300
Message-Id: <b763c997c886ea8c69e0698bf095ebc0101bc9dd.1504611134.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <cover.1504611134.git.ed.bartosh@linux.intel.com>
References: <cover.1504611134.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 1/7] wic: implement ext fs support for 'wic ls'
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
X-List-Received-Date: Tue, 05 Sep 2017 11:55:34 -0000

Implemented listing directory contents for ext file
system using debugfs tool.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index eafc6c783ec..c6a63f2080a 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -234,7 +234,7 @@ def wic_list(args, scripts_path):
 
 
 class Disk:
-    def __init__(self, imagepath, native_sysroot, fstypes=('fat',)):
+    def __init__(self, imagepath, native_sysroot, fstypes=('fat', 'ext')):
         self.imagepath = imagepath
         self.native_sysroot = native_sysroot
         self.fstypes = fstypes
@@ -280,7 +280,7 @@ class Disk:
     def __getattr__(self, name):
         """Get path to the executable in a lazy way."""
         if name in ("mdir", "mcopy", "mdel", "mdeltree", "sfdisk", "e2fsck",
-                    "resize2fs", "mkswap", "mkdosfs"):
+                    "resize2fs", "mkswap", "mkdosfs", "debugfs"):
             aname = "_%s" % name
             if aname not in self.__dict__:
                 setattr(self, aname, find_executable(name, self.paths))
@@ -314,9 +314,14 @@ class Disk:
                     seek=self.partitions[pnum].start)
 
     def dir(self, pnum, path):
-        return exec_cmd("{} -i {} ::{}".format(self.mdir,
-                                               self._get_part_image(pnum),
-                                               path))
+        if self.partitions[pnum].fstype.startswith('ext'):
+            return exec_cmd("{} {} -R 'ls -l {}'".format(self.debugfs,
+                                                         self._get_part_image(pnum),
+                                                         path), as_shell=True)
+        else: # fat
+            return exec_cmd("{} -i {} ::{}".format(self.mdir,
+                                                   self._get_part_image(pnum),
+                                                   path))
 
     def copy(self, src, pnum, path):
         """Copy partition image into wic image."""
-- 
2.13.5


