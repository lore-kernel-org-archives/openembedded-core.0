Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 91C2477312
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 14:11:34 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP; 01 Feb 2017 06:11:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; d="scan'208";a="60610456"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 01 Feb 2017 06:11:35 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id D33CF6A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 06:10:35 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2017 15:48:21 +0200
Message-Id: <6c1e740cd8999c2533a03d43de5cd3e7e18c8841.1485953483.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485953483.git.ed.bartosh@linux.intel.com>
References: <cover.1485953483.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 14/18] wic: move oe/misc.py one level up
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
X-List-Received-Date: Wed, 01 Feb 2017 14:11:34 -0000

Flattened directory structure:
   moved wic/utils/oe/misc.py -> wic/utils/misc.py

[YOCTO #10619]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py                            | 4 ++--
 scripts/lib/wic/partition.py                         | 4 ++--
 scripts/lib/wic/plugin.py                            | 2 +-
 scripts/lib/wic/plugins/imager/direct.py             | 2 +-
 scripts/lib/wic/plugins/source/bootimg-efi.py        | 4 ++--
 scripts/lib/wic/plugins/source/bootimg-partition.py  | 2 +-
 scripts/lib/wic/plugins/source/bootimg-pcbios.py     | 4 ++--
 scripts/lib/wic/plugins/source/fsimage.py            | 2 +-
 scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 2 +-
 scripts/lib/wic/plugins/source/rawcopy.py            | 2 +-
 scripts/lib/wic/plugins/source/rootfs.py             | 2 +-
 scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py  | 8 ++++----
 scripts/lib/wic/utils/{oe => }/misc.py               | 0
 scripts/lib/wic/utils/partitionedfs.py               | 2 +-
 scripts/wic                                          | 2 +-
 15 files changed, 21 insertions(+), 21 deletions(-)
 rename scripts/lib/wic/utils/{oe => }/misc.py (100%)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 4abea87..685bc88 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -33,7 +33,7 @@ import sys
 
 from wic import msger, creator
 from wic.plugin import pluginmgr
-from wic.utils.oe import misc
+from wic.utils.misc import get_bitbake_var
 
 
 def verify_build_env():
@@ -54,7 +54,7 @@ SCRIPTS_CANNED_IMAGE_DIR = "scripts/" + CANNED_IMAGE_DIR
 WIC_DIR = "wic"
 
 def build_canned_image_list(path):
-    layers_path = misc.get_bitbake_var("BBLAYERS")
+    layers_path = get_bitbake_var("BBLAYERS")
     canned_wks_layer_dirs = []
 
     if layers_path is not None:
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 094a8c3..31a0350 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -27,8 +27,8 @@
 import os
 import tempfile
 
-from wic.utils.oe.misc import msger
-from wic.utils.oe.misc import exec_cmd, exec_native_cmd, get_bitbake_var
+from wic import msger
+from wic.utils.misc import exec_cmd, exec_native_cmd, get_bitbake_var
 from wic.plugin import pluginmgr
 
 class Partition():
diff --git a/scripts/lib/wic/plugin.py b/scripts/lib/wic/plugin.py
index 306b324..6b06ed6 100644
--- a/scripts/lib/wic/plugin.py
+++ b/scripts/lib/wic/plugin.py
@@ -20,7 +20,7 @@ import os, sys
 from wic import msger
 from wic import pluginbase
 from wic.utils import errors
-from wic.utils.oe.misc import get_bitbake_var
+from wic.utils.misc import get_bitbake_var
 
 __ALL__ = ['PluginMgr', 'pluginmgr']
 
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 9cd7068..592412a 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -37,7 +37,7 @@ from wic.plugin import pluginmgr
 from wic.pluginbase import ImagerPlugin
 from wic.utils import errors
 from wic.utils.errors import CreatorError, ImageError
-from wic.utils.oe.misc import get_bitbake_var, exec_cmd, exec_native_cmd
+from wic.utils.misc import get_bitbake_var, exec_cmd, exec_native_cmd
 from wic.utils.partitionedfs import Image
 
 class DirectPlugin(ImagerPlugin):
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 28b941e..2b66a58 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -30,8 +30,8 @@ import shutil
 from wic import msger
 from wic.engine import get_custom_config
 from wic.pluginbase import SourcePlugin
-from wic.utils.oe.misc import exec_cmd, exec_native_cmd, get_bitbake_var, \
-                              BOOTDD_EXTRA_SPACE
+from wic.utils.misc import (exec_cmd, exec_native_cmd, get_bitbake_var,
+                            BOOTDD_EXTRA_SPACE)
 
 class BootimgEFIPlugin(SourcePlugin):
     """
diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
index b76c121..f94dfab 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -28,7 +28,7 @@ import re
 
 from wic import msger
 from wic.pluginbase import SourcePlugin
-from wic.utils.oe.misc import exec_cmd, get_bitbake_var
+from wic.utils.misc import exec_cmd, get_bitbake_var
 from glob import glob
 
 class BootimgPartitionPlugin(SourcePlugin):
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index 283b834..d796433 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -31,8 +31,8 @@ from wic.engine import get_custom_config
 from wic.utils import runner
 from wic.utils.errors import ImageError
 from wic.pluginbase import SourcePlugin
-from wic.utils.oe.misc import exec_cmd, exec_native_cmd, \
-                              get_bitbake_var, BOOTDD_EXTRA_SPACE
+from wic.utils.misc import (exec_cmd, exec_native_cmd,
+                            get_bitbake_var, BOOTDD_EXTRA_SPACE)
 
 class BootimgPcbiosPlugin(SourcePlugin):
     """
diff --git a/scripts/lib/wic/plugins/source/fsimage.py b/scripts/lib/wic/plugins/source/fsimage.py
index f894e89..9193892 100644
--- a/scripts/lib/wic/plugins/source/fsimage.py
+++ b/scripts/lib/wic/plugins/source/fsimage.py
@@ -19,7 +19,7 @@ import os
 
 from wic import msger
 from wic.pluginbase import SourcePlugin
-from wic.utils.oe.misc import get_bitbake_var
+from wic.utils.misc import get_bitbake_var
 
 class FSImagePlugin(SourcePlugin):
     """
diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index 4979d8e..6df3756 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -28,7 +28,7 @@ import glob
 from wic import msger
 from wic.engine import get_custom_config
 from wic.pluginbase import SourcePlugin
-from wic.utils.oe.misc import exec_cmd, exec_native_cmd, get_bitbake_var
+from wic.utils.misc import exec_cmd, exec_native_cmd, get_bitbake_var
 
 class IsoImagePlugin(SourcePlugin):
     """
diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
index 5bd22fd..79e41ca 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -19,7 +19,7 @@ import os
 
 from wic import msger
 from wic.pluginbase import SourcePlugin
-from wic.utils.oe.misc import exec_cmd, get_bitbake_var
+from wic.utils.misc import exec_cmd, get_bitbake_var
 from wic.filemap import sparse_copy
 
 class RawCopyPlugin(SourcePlugin):
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index 425da8b..891f095 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -29,7 +29,7 @@ import os
 
 from wic import msger
 from wic.pluginbase import SourcePlugin
-from wic.utils.oe.misc import get_bitbake_var
+from wic.utils.misc import get_bitbake_var
 
 class RootfsPlugin(SourcePlugin):
     """
diff --git a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
index 3d60e6f..1032019 100644
--- a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
+++ b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
@@ -22,7 +22,7 @@ import os
 from wic import msger
 from wic.utils import syslinux
 from wic.utils import runner
-from wic.utils.oe import misc
+from wic.utils.misc import get_bitbake_var, exec_cmd, exec_native_cmd
 from wic.utils.errors import ImageError
 from wic.pluginbase import SourcePlugin
 
@@ -58,7 +58,7 @@ class RootfsPlugin(SourcePlugin):
         if os.path.isdir(rootfs_dir):
             return rootfs_dir
 
-        image_rootfs_dir = misc.get_bitbake_var("IMAGE_ROOTFS", rootfs_dir)
+        image_rootfs_dir = get_bitbake_var("IMAGE_ROOTFS", rootfs_dir)
         if not os.path.isdir(image_rootfs_dir):
             msg = "No valid artifact IMAGE_ROOTFS from image named"
             msg += " %s has been found at %s, exiting.\n" % \
@@ -119,7 +119,7 @@ class RootfsPlugin(SourcePlugin):
         native_syslinux_nomtools = os.path.join(native_sysroot, "usr/bin/syslinux-nomtools")
         if not is_exe(native_syslinux_nomtools):
             msger.info("building syslinux-native...")
-            misc.exec_cmd("bitbake syslinux-native")
+            exec_cmd("bitbake syslinux-native")
         if not is_exe(native_syslinux_nomtools):
             msger.error("Couldn't find syslinux-nomtools (%s), exiting\n" %
                         native_syslinux_nomtools)
@@ -145,7 +145,7 @@ class RootfsPlugin(SourcePlugin):
 
         # install syslinux into rootfs partition
         syslinux_cmd = "syslinux-nomtools -d /boot -i %s" % part.source_file
-        misc.exec_native_cmd(syslinux_cmd, native_sysroot)
+        exec_native_cmd(syslinux_cmd, native_sysroot)
 
     @classmethod
     def do_install_disk(cls, disk, disk_name, image_creator, workdir, oe_builddir,
diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/misc.py
similarity index 100%
rename from scripts/lib/wic/utils/oe/misc.py
rename to scripts/lib/wic/utils/misc.py
diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index ed67b9a..eb4d7e6 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -21,7 +21,7 @@
 import os
 from wic import msger
 from wic.utils.errors import ImageError
-from wic.utils.oe.misc import exec_cmd, exec_native_cmd
+from wic.utils.misc import exec_cmd, exec_native_cmd
 from wic.filemap import sparse_copy
 
 # Overhead of the MBR partitioning scheme (just one sector)
diff --git a/scripts/wic b/scripts/wic
index 54cbe96..33355ee 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -51,7 +51,7 @@ if bitbake_exe:
 else:
     bitbake_main = None
 
-from wic.utils.oe.misc import get_bitbake_var, BB_VARS
+from wic.utils.misc import get_bitbake_var, BB_VARS
 from wic.utils.errors import WicError
 from wic import engine
 from wic import help as hlp
-- 
2.1.4


