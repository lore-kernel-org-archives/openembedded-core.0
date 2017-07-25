Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DE49C7830D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 11:49:39 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Jul 2017 04:49:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,411,1496127600"; d="scan'208";a="131606386"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 25 Jul 2017 04:49:40 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 3A00B5808F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 04:49:40 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jul 2017 14:26:36 +0300
Message-Id: <4223ea7fa1b9ce25bc8ef82aa3fa090a27ab0bf2.1500981812.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1500981812.git.ed.bartosh@linux.intel.com>
References: <cover.1500981812.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v3 1/6] wic: copy rootfs directory before changing fstab
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
X-List-Received-Date: Tue, 25 Jul 2017 11:49:40 -0000

wic updates /etc/fstab on root partition if there are
valid mount points in .wks

When wic runs from bitbake this can cause incorrect results
or even breakage of other tasks working with the same rootfs
directory in parallel with do_image_wic.

Implemented copying rootfs directory to a temporary location
using copyhardlinktree before updating fstab to avoid conflicts with
other tasks working with the same rootfs directory.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index f20d843..4f441c1 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -32,6 +32,8 @@ import uuid
 
 from time import strftime
 
+from oe.path import copyhardlinktree
+
 from wic import WicError
 from wic.filemap import sparse_copy
 from wic.ksparser import KickStart, KickStartError
@@ -115,12 +117,18 @@ class DirectPlugin(ImagerPlugin):
             fstab_lines = fstab.readlines()
 
         if self._update_fstab(fstab_lines, self.parts):
-            shutil.copyfile(fstab_path, fstab_path + ".orig")
+            # copy rootfs dir to workdir to update fstab
+            # as rootfs can be used by other tasks and can't be modified
+            new_rootfs = os.path.realpath(os.path.join(self.workdir, "rootfs_copy"))
+            copyhardlinktree(image_rootfs, new_rootfs)
+            fstab_path = os.path.join(new_rootfs, 'etc/fstab')
+
+            os.unlink(fstab_path)
 
             with open(fstab_path, "w") as fstab:
                 fstab.writelines(fstab_lines)
 
-            return fstab_path
+            return new_rootfs
 
     def _update_fstab(self, fstab_lines, parts):
         """Assume partition order same as in wks"""
@@ -156,7 +164,10 @@ class DirectPlugin(ImagerPlugin):
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
@@ -172,12 +183,7 @@ class DirectPlugin(ImagerPlugin):
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


