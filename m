Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id 563C060089
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Feb 2015 23:16:26 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id 7B155380; Mon,  9 Feb 2015 00:16:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 46FE232B;
	Mon,  9 Feb 2015 00:16:32 +0100 (CET)
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Tom Zanussi <tom.zanussi@linux.intel.com>
Date: Mon,  9 Feb 2015 00:16:21 +0100
Message-Id: <1423437384-21971-1-git-send-email-alexandre.belloni@free-electrons.com>
X-Mailer: git-send-email 2.1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] wic: add rawcopy source plugin
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
X-List-Received-Date: Sun, 08 Feb 2015 23:16:36 -0000

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 scripts/lib/wic/plugins/source/rawcopy.py | 77 +++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 scripts/lib/wic/plugins/source/rawcopy.py

diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
new file mode 100644
index 000000000000..b3b55fa022eb
--- /dev/null
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -0,0 +1,77 @@
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+
+import os
+import re
+
+from wic import msger
+from wic.pluginbase import SourcePlugin
+from wic.utils.oe.misc import *
+
+class RawCopyPlugin(SourcePlugin):
+    name = 'rawcopy'
+
+    @classmethod
+    def do_install_disk(self, disk, disk_name, cr, workdir, oe_builddir,
+                        bootimg_dir, kernel_dir, native_sysroot):
+        """
+        Called after all partitions have been prepared and assembled into a
+        disk image. Do nothing.
+        """
+        pass
+
+    @classmethod
+    def do_configure_partition(self, part, source_params, cr, cr_workdir,
+                               oe_builddir, bootimg_dir, kernel_dir,
+                               native_sysroot):
+        """
+        Called before do_prepare_partition(). Possibly prepare
+        configuration files of some sort.
+        """
+        pass
+
+    @classmethod
+    def do_prepare_partition(self, part, source_params, cr, cr_workdir,
+                             oe_builddir, bootimg_dir, kernel_dir,
+                             rootfs_dir, native_sysroot):
+        """
+        Called to do the actual content population for a partition i.e. it
+        'prepares' the partition to be incorporated into the image.
+        """
+        if not bootimg_dir:
+            bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
+            if not bootimg_dir:
+                msger.error("Couldn't find DEPLOY_DIR_IMAGE, exiting\n")
+
+        msger.debug('Bootimg dir: %s' % bootimg_dir)
+
+        if ('file' not in source_params):
+            msger.error("No file specified\n")
+            return
+
+        src = os.path.join(bootimg_dir, source_params['file'])
+
+        # get the size in the right units for kickstart (kB)
+        du_cmd = "du -Lbks %s" % src
+        out = exec_cmd(du_cmd)
+        filesize = out.split()[0]
+
+        if filesize > part.size:
+            part.size = filesize
+
+        part.source_file = src
+
-- 
2.1.0


