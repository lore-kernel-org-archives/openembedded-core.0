Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9FD5678147
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 14:47:49 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP; 25 May 2017 07:47:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,391,1491289200"; d="scan'208";a="1152731278"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 25 May 2017 07:47:50 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id AE3C4580394
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 07:47:49 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 May 2017 17:46:27 +0300
Message-Id: <2f8fc4acf196ca5353a18dfa860a13c0e1b24268.1495722660.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1495722660.git.ed.bartosh@linux.intel.com>
References: <cover.1495722660.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 10/11] wic: fully implement 'wic cp'
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
X-List-Received-Date: Thu, 25 May 2017 14:47:50 -0000

Added implementation of Disk.copy method and wic_cp
function that copies files/directories to the vfat partition
of the partitioned image.

[YOCTO #11283]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 6a4f55f..a48c4ad 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -310,6 +310,14 @@ class Disk:
                                                self._get_part_image(pnum),
                                                path))
 
+    def copy(self, src, pnum, path):
+        """Copy partition image into wic image."""
+        cmd = "{} -i {} -snop {} ::{}".format(self.mcopy,
+                                              self._get_part_image(pnum),
+                                              src, path)
+        exec_cmd(cmd)
+        self._put_part_image(pnum)
+
 def wic_ls(args, native_sysroot):
     """List contents of partitioned image or vfat partition."""
     disk = Disk(args.path.image, native_sysroot)
@@ -329,7 +337,8 @@ def wic_cp(args, native_sysroot):
     Copy local file or directory to the vfat partition of
     partitioned image.
     """
-    pass
+    disk = Disk(args.dest.image, native_sysroot)
+    disk.copy(args.src, args.dest.part, args.dest.path)
 
 def find_canned(scripts_path, file_name):
     """
-- 
2.1.4


