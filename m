Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CC06A78320
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 11:24:24 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Jun 2017 04:24:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,338,1493708400"; d="scan'208";a="273606566"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 13 Jun 2017 04:24:25 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 5BEE158010F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 04:24:25 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 14:22:13 +0300
Message-Id: <05319040f8c0ce248b21cbd51b3b80e05edeeadc.1497348496.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1497348496.git.ed.bartosh@linux.intel.com>
References: <cover.1497348496.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 25/26] wic: implement removing directories
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
X-List-Received-Date: Tue, 13 Jun 2017 11:24:24 -0000

Added support for removing directories using mdeltree
utility to Disk.del method

[YOCTO #11283]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 6fc8bb7..2c899dd 100644
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
2.1.4


