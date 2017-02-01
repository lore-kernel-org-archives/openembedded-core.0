Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 090347732E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 14:11:33 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP; 01 Feb 2017 06:11:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; d="scan'208";a="60610450"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 01 Feb 2017 06:11:34 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id BB5B26A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 06:10:34 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2017 15:48:20 +0200
Message-Id: <41582f76a91b07c34a2343f63b749637d55b943a.1485953483.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485953483.git.ed.bartosh@linux.intel.com>
References: <cover.1485953483.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 13/18] wic: move 2 APIs to wic.engine
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

Moved find_canned and get_custom_config APIs to engine module.
Removed empty wic.utils.misc module.

[YOCTO #10619]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py                          | 33 ++++++++++++-
 scripts/lib/wic/ksparser.py                        |  2 +-
 scripts/lib/wic/plugins/source/bootimg-efi.py      |  2 +-
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |  4 +-
 .../lib/wic/plugins/source/isoimage-isohybrid.py   |  2 +-
 scripts/lib/wic/utils/misc.py                      | 56 ----------------------
 6 files changed, 37 insertions(+), 62 deletions(-)
 delete mode 100644 scripts/lib/wic/utils/misc.py

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 2adef2f..4abea87 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -32,7 +32,6 @@ import os
 import sys
 
 from wic import msger, creator
-from wic.utils import misc
 from wic.plugin import pluginmgr
 from wic.utils.oe import misc
 
@@ -226,3 +225,35 @@ def wic_list(args, scripts_path):
         return True
 
     return False
+
+def find_canned(scripts_path, file_name):
+    """
+    Find a file either by its path or by name in the canned files dir.
+
+    Return None if not found
+    """
+    if os.path.exists(file_name):
+        return file_name
+
+    layers_canned_wks_dir = build_canned_image_list(scripts_path)
+    for canned_wks_dir in layers_canned_wks_dir:
+        for root, dirs, files in os.walk(canned_wks_dir):
+            for fname in files:
+                if fname == file_name:
+                    fullpath = os.path.join(canned_wks_dir, fname)
+                    return fullpath
+
+def get_custom_config(boot_file):
+    """
+    Get the custom configuration to be used for the bootloader.
+
+    Return None if the file can't be found.
+    """
+    # Get the scripts path of poky
+    scripts_path = os.path.abspath("%s/../.." % os.path.dirname(__file__))
+
+    cfg_file = find_canned(scripts_path, boot_file)
+    if cfg_file:
+        with open(cfg_file, "r") as f:
+            config = f.read()
+        return config
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 62c4902..41d3cc6 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -30,8 +30,8 @@ import shlex
 from argparse import ArgumentParser, ArgumentError, ArgumentTypeError
 
 from wic import msger
+from wic.engine import find_canned
 from wic.partition import Partition
-from wic.utils.misc import find_canned
 
 class KickStartError(Exception):
     """Custom exception."""
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 74a1557..28b941e 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -28,8 +28,8 @@ import os
 import shutil
 
 from wic import msger
+from wic.engine import get_custom_config
 from wic.pluginbase import SourcePlugin
-from wic.utils.misc import get_custom_config
 from wic.utils.oe.misc import exec_cmd, exec_native_cmd, get_bitbake_var, \
                               BOOTDD_EXTRA_SPACE
 
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index cff8aec..283b834 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -26,10 +26,10 @@
 
 import os
 
-from wic.utils.errors import ImageError
 from wic import msger
+from wic.engine import get_custom_config
 from wic.utils import runner
-from wic.utils.misc import get_custom_config
+from wic.utils.errors import ImageError
 from wic.pluginbase import SourcePlugin
 from wic.utils.oe.misc import exec_cmd, exec_native_cmd, \
                               get_bitbake_var, BOOTDD_EXTRA_SPACE
diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index bceaa84..4979d8e 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -26,8 +26,8 @@ import shutil
 import glob
 
 from wic import msger
+from wic.engine import get_custom_config
 from wic.pluginbase import SourcePlugin
-from wic.utils.misc import get_custom_config
 from wic.utils.oe.misc import exec_cmd, exec_native_cmd, get_bitbake_var
 
 class IsoImagePlugin(SourcePlugin):
diff --git a/scripts/lib/wic/utils/misc.py b/scripts/lib/wic/utils/misc.py
deleted file mode 100644
index 7d09f6f..0000000
--- a/scripts/lib/wic/utils/misc.py
+++ /dev/null
@@ -1,56 +0,0 @@
-#!/usr/bin/env python -tt
-#
-# Copyright (c) 2010, 2011 Intel Inc.
-#
-# This program is free software; you can redistribute it and/or modify it
-# under the terms of the GNU General Public License as published by the Free
-# Software Foundation; version 2 of the License
-#
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-# for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc., 59
-# Temple Place - Suite 330, Boston, MA 02111-1307, USA.
-
-import os
-import time
-import wic.engine
-
-def find_canned(scripts_path, file_name):
-    """
-    Find a file either by its path or by name in the canned files dir.
-
-    Return None if not found
-    """
-    if os.path.exists(file_name):
-        return file_name
-
-    layers_canned_wks_dir = wic.engine.build_canned_image_list(scripts_path)
-    for canned_wks_dir in layers_canned_wks_dir:
-        for root, dirs, files in os.walk(canned_wks_dir):
-            for fname in files:
-                if fname == file_name:
-                    fullpath = os.path.join(canned_wks_dir, fname)
-                    return fullpath
-
-def get_custom_config(boot_file):
-    """
-    Get the custom configuration to be used for the bootloader.
-
-    Return None if the file can't be found.
-    """
-    scripts_path = os.path.abspath(os.path.dirname(__file__))
-    # Get the scripts path of poky
-    for x in range(0, 3):
-        scripts_path = os.path.dirname(scripts_path)
-
-    cfg_file = find_canned(scripts_path, boot_file)
-    if cfg_file:
-        with open(cfg_file, "r") as f:
-            config = f.read()
-        return config
-
-    return None
-- 
2.1.4


