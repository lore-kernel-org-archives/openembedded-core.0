Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 48427782FC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 14:26:06 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jul 2017 07:26:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,419,1496127600"; d="scan'208";a="292218742"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 27 Jul 2017 07:26:08 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id ACC575809DF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 07:26:07 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jul 2017 17:02:44 +0300
Message-Id: <8698a63e95e1f82a4e5cba928015e8a3bc5db950.1501162988.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1501162988.git.ed.bartosh@linux.intel.com>
References: <cover.1501162988.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v4 3/6] wic: rootfs: fix rootfs path reporting
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
X-List-Received-Date: Thu, 27 Jul 2017 14:26:07 -0000

wic gets rootfs paths from partition object property
'rootfs_dir' and shows them in final report.

rootfs plugin sets this property to the temporary path,
which causes temporary paths appearing in the report.

Changed the code to prevent storing temporary rootfs path
in part.rootfs_dir. This should fix the report.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/source/rootfs.py | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index c08f760..e438158 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -81,8 +81,9 @@ class RootfsPlugin(SourcePlugin):
                 raise WicError("Couldn't find --rootfs-dir=%s connection or "
                                "it is not a valid path, exiting" % part.rootfs_dir)
 
-        real_rootfs_dir = cls.__get_rootfs_dir(rootfs_dir)
+        part.rootfs_dir = cls.__get_rootfs_dir(rootfs_dir)
 
+        new_rootfs = None
         # Handle excluded paths.
         if part.exclude_path is not None:
             # We need a new rootfs directory we can delete files from. Copy to
@@ -92,9 +93,7 @@ class RootfsPlugin(SourcePlugin):
             if os.path.lexists(new_rootfs):
                 shutil.rmtree(os.path.join(new_rootfs))
 
-            copyhardlinktree(real_rootfs_dir, new_rootfs)
-
-            real_rootfs_dir = new_rootfs
+            copyhardlinktree(part.rootfs_dir, new_rootfs)
 
             for orig_path in part.exclude_path:
                 path = orig_path
@@ -123,6 +122,5 @@ class RootfsPlugin(SourcePlugin):
                     # Delete whole directory.
                     shutil.rmtree(full_path)
 
-        part.rootfs_dir = real_rootfs_dir
         part.prepare_rootfs(cr_workdir, oe_builddir,
-                            real_rootfs_dir, native_sysroot)
+                            new_rootfs or part.rootfs_dir, native_sysroot)
-- 
2.1.4


