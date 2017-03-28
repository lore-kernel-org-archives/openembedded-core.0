Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id DDBEA77AC7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 12:43:19 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 28 Mar 2017 05:43:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,236,1486454400"; d="scan'208";a="1147898395"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 28 Mar 2017 05:43:21 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id D76A96A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 05:43:13 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 15:41:02 +0300
Message-Id: <c327b9d1533a0faac6df06c01c162fae1c64f4c4.1490704390.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1490704390.git.ed.bartosh@linux.intel.com>
References: <cover.1490704390.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 5/9] wic: remove fsimage plugin
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
X-List-Received-Date: Tue, 28 Mar 2017 12:43:20 -0000

Removed fsimage plugin and prepare_rootfs_from_fs_image API as
they duplicate functionality of rawcopy plugin. Fsimage plugin makes
wic to remove the image artifact from deployment directory, which
can cause problems too.

[YOCTO #10618]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/partition.py              | 13 -------
 scripts/lib/wic/plugins/source/fsimage.py | 56 -------------------------------
 2 files changed, 69 deletions(-)
 delete mode 100644 scripts/lib/wic/plugins/source/fsimage.py

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 8e32afc..647a6fb 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -193,19 +193,6 @@ class Partition():
                            "larger (%d kB) than its allowed size %d kB" %
                            (self.mountpoint, self.size, self.fixed_size))
 
-    def prepare_rootfs_from_fs_image(self, cr_workdir, oe_builddir,
-                                     rootfs_dir):
-        """
-        Handle an already-created partition e.g. xxx.ext3
-        """
-        rootfs = oe_builddir
-        du_cmd = "du -Lbks %s" % rootfs
-        out = exec_cmd(du_cmd)
-        rootfs_size = out.split()[0]
-
-        self.size = int(rootfs_size)
-        self.source_file = rootfs
-
     def prepare_rootfs(self, cr_workdir, oe_builddir, rootfs_dir,
                        native_sysroot):
         """
diff --git a/scripts/lib/wic/plugins/source/fsimage.py b/scripts/lib/wic/plugins/source/fsimage.py
deleted file mode 100644
index f781499..0000000
--- a/scripts/lib/wic/plugins/source/fsimage.py
+++ /dev/null
@@ -1,56 +0,0 @@
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-#
-
-import logging
-import os
-
-from wic import WicError
-from wic.pluginbase import SourcePlugin
-from wic.utils.misc import get_bitbake_var
-
-logger = logging.getLogger('wic')
-
-class FSImagePlugin(SourcePlugin):
-    """
-    Add an already existing filesystem image to the partition layout.
-    """
-
-    name = 'fsimage'
-
-    @classmethod
-    def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
-                             oe_builddir, bootimg_dir, kernel_dir,
-                             rootfs_dir, native_sysroot):
-        """
-        Called to do the actual content population for a partition i.e. it
-        'prepares' the partition to be incorporated into the image.
-        """
-        if not bootimg_dir:
-            bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
-            if not bootimg_dir:
-                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
-
-        logger.debug('Bootimg dir: %s', bootimg_dir)
-
-        if 'file' not in source_params:
-            raise WicError("No file specified")
-
-        src = os.path.join(bootimg_dir, source_params['file'])
-
-
-        logger.debug('Preparing partition using image %s', src)
-        part.prepare_rootfs_from_fs_image(cr_workdir, src, "")
-- 
2.1.4


