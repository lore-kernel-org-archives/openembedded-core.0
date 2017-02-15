Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 1E63B772E4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 09:02:02 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 15 Feb 2017 01:02:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,165,1484035200"; d="scan'208";a="1094972677"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 15 Feb 2017 01:01:59 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 2E6856A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 01:00:55 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2017 10:38:29 +0200
Message-Id: <bd0da03526f5c953e08f7b995d5951233725571b.1487110279.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487110279.git.ed.bartosh@linux.intel.com>
References: <cover.1487110279.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 06/11] wic: move errors module
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
X-List-Received-Date: Wed, 15 Feb 2017 09:02:03 -0000

Moved from lib/wic/utils/ to lib/wic as this is a core module.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/{utils => }/errors.py               | 0
 scripts/lib/wic/plugin.py                           | 4 ++--
 scripts/lib/wic/plugins/imager/direct.py            | 2 +-
 scripts/lib/wic/plugins/source/bootimg-pcbios.py    | 2 +-
 scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py | 2 +-
 scripts/wic                                         | 3 +--
 6 files changed, 6 insertions(+), 7 deletions(-)
 rename scripts/lib/wic/{utils => }/errors.py (100%)

diff --git a/scripts/lib/wic/utils/errors.py b/scripts/lib/wic/errors.py
similarity index 100%
rename from scripts/lib/wic/utils/errors.py
rename to scripts/lib/wic/errors.py
diff --git a/scripts/lib/wic/plugin.py b/scripts/lib/wic/plugin.py
index 70d3377..31311ad 100644
--- a/scripts/lib/wic/plugin.py
+++ b/scripts/lib/wic/plugin.py
@@ -19,8 +19,8 @@ import os
 import sys
 import logging
 
+from wic.errors import CreatorError
 from wic import pluginbase
-from wic.utils import errors
 from wic.utils.misc import get_bitbake_var
 
 __ALL__ = ['PluginMgr', 'pluginmgr']
@@ -110,7 +110,7 @@ class PluginMgr():
         """ the return value is dict of name:class pairs """
 
         if ptype not in PLUGIN_TYPES:
-            raise errors.CreatorError('%s is not valid plugin type' % ptype)
+            raise CreatorError('%s is not valid plugin type' % ptype)
 
         plugins_dir = self._build_plugin_dir_list(self.plugin_dir, ptype)
 
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 2e2d26a..e51c8be 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -33,11 +33,11 @@ import uuid
 
 from time import strftime
 
+from wic.errors import ImageError
 from wic.filemap import sparse_copy
 from wic.ksparser import KickStart, KickStartError
 from wic.plugin import pluginmgr
 from wic.pluginbase import ImagerPlugin
-from wic.utils.errors import ImageError
 from wic.utils.misc import get_bitbake_var, exec_cmd, exec_native_cmd
 
 logger = logging.getLogger('wic')
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index 590d3d6..8f53fa2 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -29,8 +29,8 @@ import os
 import sys
 
 from wic.engine import get_custom_config
+from wic.errors import ImageError
 from wic.utils import runner
-from wic.utils.errors import ImageError
 from wic.pluginbase import SourcePlugin
 from wic.utils.misc import (exec_cmd, exec_native_cmd,
                             get_bitbake_var, BOOTDD_EXTRA_SPACE)
diff --git a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
index ed5fbdf..850aa5a 100644
--- a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
+++ b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
@@ -23,9 +23,9 @@ import os
 import re
 import sys
 
+from wic.errors import ImageError
 from wic.utils import runner
 from wic.utils.misc import get_bitbake_var, exec_cmd, exec_native_cmd
-from wic.utils.errors import ImageError
 from wic.pluginbase import SourcePlugin
 
 logger = logging.getLogger('wic')
diff --git a/scripts/wic b/scripts/wic
index f3e93da..b12c743 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -51,8 +51,8 @@ if bitbake_exe:
 else:
     bitbake_main = None
 
+from wic.errors import WicError
 from wic.utils.misc import get_bitbake_var, BB_VARS
-from wic.utils.errors import WicError
 from wic import engine
 from wic import help as hlp
 
@@ -337,4 +337,3 @@ if __name__ == "__main__":
     except WicError as err:
         logger.error(err)
         sys.exit(1)
-
-- 
2.1.4


