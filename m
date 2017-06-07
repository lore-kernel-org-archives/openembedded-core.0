Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 448B2780FA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 10:26:18 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP; 07 Jun 2017 03:26:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,310,1493708400"; d="scan'208";a="111438519"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 07 Jun 2017 03:26:20 -0700
Received: from ed.fi.intel.com (ed.fi.intel.com [10.237.72.179])
	by linux.intel.com (Postfix) with ESMTP id 22C225802EB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 03:26:18 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jun 2017 13:25:29 +0300
Message-Id: <6402f7839c34a56fddb82979eca3436c19523b6e.1496830884.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1496830884.git.ed.bartosh@linux.intel.com>
References: <cover.1496830884.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 5/6] wic: implement removing directories
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
X-List-Received-Date: Wed, 07 Jun 2017 10:26:18 -0000

Added support for removing directories using mdeltree
utility to Disk.del method

[YOCTO #11283]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 6fc8bb72c3..2c899dd386 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -239,6 +239,7 @@ class Disk:
         self._mdir = None
         self._mcopy = None
         self._mdel = None
+        self._mdeltree = None
         self._partimages = {}
 
         # find parted
@@ -290,6 +291,10 @@ class Disk:
     def mdel(self):
         return self._prop("mdel")
 
+    @property
+    def mdeltree(self):
+        return self._prop("mdeltree")
+
     def _get_part_image(self, pnum):
         if pnum not in self.partitions:
             raise WicError("Partition %s is not in the image")
@@ -325,10 +330,19 @@ class Disk:
 
     def remove(self, pnum, path):
         """Remove files/dirs from the partition."""
-        cmd = "{} -i {} ::{}".format(self.mdel,
-                                     self._get_part_image(pnum),
-                                     path)
-        exec_cmd(cmd)
+        partimg = self._get_part_image(pnum)
+        cmd = "{} -i {} ::{}".format(self.mdel, partimg, path)
+        try:
+            exec_cmd(cmd)
+        except WicError as err:
+            if "not found" in str(err) or "non empty" in str(err):
+                # mdel outputs 'File ... not found' or 'directory .. non empty"
+                # try to use mdeltree as path could be a directory
+                cmd = "{} -i {} ::{}".format(self.mdeltree,
+                                             partimg, path)
+                exec_cmd(cmd)
+            else:
+                raise err
         self._put_part_image(pnum)
 
 def wic_ls(args, native_sysroot):
-- 
2.12.0


