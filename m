Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8EDDD77F85
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 10:00:25 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jun 2017 03:00:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,399,1493708400"; d="scan'208";a="985646720"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 27 Jun 2017 03:00:26 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 0661E58058D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 03:00:25 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Jun 2017 12:57:36 +0300
Message-Id: <660271c11ac91d2244356009ecd4517901e1aba2.1498557396.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1498557396.git.ed.bartosh@linux.intel.com>
References: <cover.1498557396.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 2/7] wic: use correct rootfs in the report
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
X-List-Received-Date: Tue, 27 Jun 2017 10:00:25 -0000

wic includs rootfs path in the final report. When fstab needs to be
updated wic copies rootfs to a temporary location. This causes path
to the copy of rootfs to appear in the final report.

Saved original rootfs path when rootfs is copied to include original
path to the report.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

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
-- 
2.1.4


