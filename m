Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CD96F780CB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 13:31:10 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jun 2017 06:31:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,399,1493708400"; d="scan'208";a="1187479310"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 27 Jun 2017 06:31:11 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 1616258075B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 06:31:10 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Jun 2017 16:28:39 +0300
Message-Id: <8c351e27b5e55b770f736b8570e46d26674aec1f.1498569961.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1498569961.git.ed.bartosh@linux.intel.com>
References: <cover.1498569961.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 3/5] wic: rootfs: fix rootfs path reporting
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
X-List-Received-Date: Tue, 27 Jun 2017 13:31:11 -0000

wic gets rootfs paths from partition object property
'rootfs_dir' and shows them in final report.

rootfs plugin sets this property to the temporary path,
which causes temporary paths appearing in the report.

wic includes rootfs path in the final report. When fstab needs to be
updated wic copies rootfs to a temporary location. This causes path
to the copy of rootfs to appear in the final report.

Changed the code to prevent storing temporary rootfs path
in part.rootfs_dir. This should fix the report.

Saved original rootfs path when rootfs is copied to include original
path to the report.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/imager/direct.py |  7 ++++++-
 scripts/lib/wic/plugins/source/rootfs.py | 10 ++++------
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index f707365..e90f9f9 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -62,6 +62,7 @@ class DirectPlugin(ImagerPlugin):
 
         # parse possible 'rootfs=name' items
         self.rootfs_dir = dict(rdir.split('=') for rdir in rootfs_dir.split(' '))
+        self.rootfs_dir_orig = None
         self.bootimg_dir = bootimg_dir
         self.kernel_dir = kernel_dir
         self.native_sysroot = native_sysroot
@@ -165,6 +166,7 @@ class DirectPlugin(ImagerPlugin):
         new_rootfs = self._write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
         if new_rootfs:
             # rootfs was copied to update fstab
+            self.rootfs_dir_orig = self.rootfs_dir['ROOTFS_DIR']
             self.rootfs_dir['ROOTFS_DIR'] = new_rootfs
 
         for part in self.parts:
@@ -234,11 +236,14 @@ class DirectPlugin(ImagerPlugin):
         for part in self.parts:
             if part.rootfs_dir is None:
                 continue
+            rootfs_dir = part.rootfs_dir
             if part.mountpoint == '/':
                 suffix = ':'
+                if self.rootfs_dir_orig:
+                    rootfs_dir = self.rootfs_dir_orig
             else:
                 suffix = '["%s"]:' % (part.mountpoint or part.label)
-            msg += '  ROOTFS_DIR%s%s\n' % (suffix.ljust(20), part.rootfs_dir)
+            msg += '  ROOTFS_DIR%s%s\n' % (suffix.ljust(20), rootfs_dir)
 
         msg += '  BOOTIMG_DIR:                  %s\n' % self.bootimg_dir
         msg += '  KERNEL_DIR:                   %s\n' % self.kernel_dir
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


