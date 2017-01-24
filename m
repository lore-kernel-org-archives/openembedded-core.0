Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 082317723C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 14:07:27 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 24 Jan 2017 06:07:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,278,1477983600"; d="scan'208";a="217011893"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 24 Jan 2017 06:07:27 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 713E56A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 06:06:30 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2017 15:43:51 +0200
Message-Id: <78796ee0595d94a5bd09a6d79be4d4a7af0864d4.1485264964.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485264964.git.ed.bartosh@linux.intel.com>
References: <cover.1485264964.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 3/8] wic: make workdir a temporary directory
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
X-List-Received-Date: Tue, 24 Jan 2017 14:07:27 -0000

Wic used hardcoded path /var/tmp/wic/ as a work directory,
which caused conflicts if two wic instances run in parallel.

Made work directory unique and temporary. Moved results from
work directory to output directory when they're ready.

[YOCTO #10783]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/imager/direct.py | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index 825c9d7..63f1fa1 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -27,6 +27,7 @@
 import os
 import shutil
 import uuid
+import tempfile
 
 from wic import msger
 from wic.utils.oe.misc import get_bitbake_var
@@ -79,16 +80,11 @@ class DirectImageCreator:
 
         This method takes the same arguments as ImageCreator.__init__()
         """
-
         self.name = creatoropts['name']
+        self.outdir = image_output_dir
+        self.workdir = tempfile.mktemp(prefix='wic')
         self.ks = creatoropts['ks']
 
-        self.tmpdir = "/var/tmp/wic"
-        self.workdir = "/var/tmp/wic/build"
-
-        if not os.path.exists(self.tmpdir):
-            os.makedirs(self.tmpdir)
-
         self.__image = None
         self.__disks = {}
         self.__disk_format = "direct"
@@ -96,8 +92,6 @@ class DirectImageCreator:
         self.ptable_format = self.ks.bootloader.ptable
 
         self.oe_builddir = oe_builddir
-        if image_output_dir:
-            self.tmpdir = image_output_dir
         self.rootfs_dir = rootfs_dir
         self.bootimg_dir = bootimg_dir
         self.kernel_dir = kernel_dir
@@ -270,9 +264,6 @@ class DirectImageCreator:
 
         fstab_path = self._write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
 
-        shutil.rmtree(self.workdir)
-        os.mkdir(self.workdir)
-
         for part in parts:
             # get rootfs size from bitbake variable if it's not set in .ks file
             if not part.size:
@@ -425,3 +416,15 @@ class DirectImageCreator:
             except ImageError as err:
                 msger.warning("%s" % err)
 
+        # Move results to the output dir
+        if not os.path.exists(self.outdir):
+            os.makedirs(self.outdir)
+
+        for fname in os.listdir(self.workdir):
+            path = os.path.join(self.workdir, fname)
+            if os.path.isfile(path):
+                shutil.move(path, os.path.join(self.outdir, fname))
+
+        # remove work directory
+        shutil.rmtree(self.workdir, ignore_errors=True)
+
-- 
2.1.4


