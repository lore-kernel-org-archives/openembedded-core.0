Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id F3BB1782F3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 14:25:54 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga104.jf.intel.com with ESMTP; 27 Jul 2017 07:25:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,419,1496127600"; d="scan'208";a="292218578"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 27 Jul 2017 07:25:55 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 2DF0558039A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 07:25:54 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jul 2017 17:02:42 +0300
Message-Id: <5c69fb2ba13caead5499296537b71b452330d0fd.1501162988.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1501162988.git.ed.bartosh@linux.intel.com>
References: <cover.1501162988.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v4 1/6] wic: copy rootfs directory before changing fstab
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
X-List-Received-Date: Thu, 27 Jul 2017 14:25:55 -0000

wic updates /etc/fstab on root partition if there are
valid mount points in .wks

When wic runs from bitbake this can cause incorrect results
or even breakage of other tasks working with the same rootfs
directory in parallel with do_image_wic.

Implemented copying rootfs directory to a temporary location
before updating fstab to avoid conflicts with other tasks working
with the same rootfs directory.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index f20d843..07e3f3e 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -115,12 +115,18 @@ class DirectPlugin(ImagerPlugin):
             fstab_lines = fstab.readlines()
 
         if self._update_fstab(fstab_lines, self.parts):
-            shutil.copyfile(fstab_path, fstab_path + ".orig")
+            # copy rootfs dir to workdir to update fstab
+            # as rootfs can be used by other tasks and can't be modified
+            new_rootfs = os.path.realpath(os.path.join(self.workdir, "rootfs_copy"))
+            exec_cmd("cp -a %s %s" % (image_rootfs, new_rootfs),
+                                      self.native_sysroot)
+
+            fstab_path = os.path.join(new_rootfs, 'etc/fstab')
 
             with open(fstab_path, "w") as fstab:
                 fstab.writelines(fstab_lines)
 
-            return fstab_path
+            return new_rootfs
 
     def _update_fstab(self, fstab_lines, parts):
         """Assume partition order same as in wks"""
@@ -156,7 +162,10 @@ class DirectPlugin(ImagerPlugin):
         filesystems from the artifacts directly and combine them into
         a partitioned image.
         """
-        fstab_path = self._write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
+        new_rootfs = self._write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
+        if new_rootfs:
+            # rootfs was copied to update fstab
+            self.rootfs_dir['ROOTFS_DIR'] = new_rootfs
 
         for part in self.parts:
             # get rootfs size from bitbake variable if it's not set in .ks file
@@ -172,12 +181,7 @@ class DirectPlugin(ImagerPlugin):
                     if rsize_bb:
                         part.size = int(round(float(rsize_bb)))
 
-        try:
-            self._image.prepare(self)
-        finally:
-            if fstab_path:
-                shutil.move(fstab_path + ".orig", fstab_path)
-
+        self._image.prepare(self)
         self._image.layout_partitions()
         self._image.create()
 
-- 
2.1.4


