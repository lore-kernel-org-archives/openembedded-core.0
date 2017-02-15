Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 418E271E4A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 09:02:27 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Feb 2017 01:02:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,165,1484035200"; d="scan'208";a="66005830"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 15 Feb 2017 01:02:03 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id DC7266A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 01:01:00 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2017 10:38:33 +0200
Message-Id: <4d159540e3f6ace4be12ff1db81832e5a50ca2a4.1487110279.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487110279.git.ed.bartosh@linux.intel.com>
References: <cover.1487110279.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 10/11] wic: raise WicError instead of ImageError and CreatorError
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
X-List-Received-Date: Wed, 15 Feb 2017 09:02:27 -0000

There is no need to raise special exceptions. Raising
WicError should be enough.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugin.py                           | 4 ++--
 scripts/lib/wic/plugins/imager/direct.py            | 6 +++---
 scripts/lib/wic/plugins/source/bootimg-pcbios.py    | 4 ++--
 scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py | 4 ++--
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/wic/plugin.py b/scripts/lib/wic/plugin.py
index 31311ad..0e98da5 100644
--- a/scripts/lib/wic/plugin.py
+++ b/scripts/lib/wic/plugin.py
@@ -19,7 +19,7 @@ import os
 import sys
 import logging
 
-from wic.errors import CreatorError
+from wic.errors import WicError
 from wic import pluginbase
 from wic.utils.misc import get_bitbake_var
 
@@ -110,7 +110,7 @@ class PluginMgr():
         """ the return value is dict of name:class pairs """
 
         if ptype not in PLUGIN_TYPES:
-            raise CreatorError('%s is not valid plugin type' % ptype)
+            raise WicError('%s is not valid plugin type' % ptype)
 
         plugins_dir = self._build_plugin_dir_list(self.plugin_dir, ptype)
 
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 9c8a230..5b20ca9 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -32,7 +32,7 @@ import uuid
 
 from time import strftime
 
-from wic.errors import ImageError, WicError
+from wic.errors import WicError
 from wic.filemap import sparse_copy
 from wic.ksparser import KickStart, KickStartError
 from wic.plugin import pluginmgr
@@ -355,8 +355,8 @@ class PartitionedImage():
                 # The --part-type can also be implemented for MBR partitions,
                 # in which case it would map to the 1-byte "partition type"
                 # filed at offset 3 of the partition entry.
-                raise ImageError("setting custom partition type is not " \
-                                 "implemented for msdos partitions")
+                raise WicError("setting custom partition type is not " \
+                               "implemented for msdos partitions")
 
             # Get the disk where the partition is located
             self.numpart += 1
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index 2ded2da..c3a0e4e 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -28,7 +28,7 @@ import logging
 import os
 
 from wic.engine import get_custom_config
-from wic.errors import ImageError, WicError
+from wic.errors import WicError
 from wic.utils import runner
 from wic.pluginbase import SourcePlugin
 from wic.utils.misc import (exec_cmd, exec_native_cmd,
@@ -71,7 +71,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
         rcode = runner.show(['dd', 'if=%s' % mbrfile,
                              'of=%s' % full_path, 'conv=notrunc'])
         if rcode != 0:
-            raise ImageError("Unable to set MBR to %s" % full_path)
+            raise WicError("Unable to set MBR to %s" % full_path)
 
     @classmethod
     def do_configure_partition(cls, part, source_params, creator, cr_workdir,
diff --git a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
index 4cc3a39..cf0eec2 100644
--- a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
+++ b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
@@ -22,7 +22,7 @@ import logging
 import os
 import re
 
-from wic.errors import ImageError, WicError
+from wic.errors import WicError
 from wic.utils import runner
 from wic.utils.misc import get_bitbake_var, exec_cmd, exec_native_cmd
 from wic.pluginbase import SourcePlugin
@@ -210,4 +210,4 @@ class RootfsPlugin(SourcePlugin):
 
         ret_code = runner.show(['dd', 'if=%s' % mbrfile, 'of=%s' % full_path, 'conv=notrunc'])
         if ret_code != 0:
-            raise ImageError("Unable to set MBR to %s" % full_path)
+            raise WicError("Unable to set MBR to %s" % full_path)
-- 
2.1.4


