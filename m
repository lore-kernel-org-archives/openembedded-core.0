Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2C648784C0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 13:21:39 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jun 2017 06:21:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,347,1493708400"; d="scan'208";a="98633542"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 16 Jun 2017 06:21:41 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id A2C19580399
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 06:21:40 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 16:19:28 +0300
Message-Id: <df7d1aaa4dd376035dda7535e3038a838abe948e.1497618833.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1497618833.git.ed.bartosh@linux.intel.com>
References: <cover.1497618833.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 2/4] wic: flatten directory structure
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
X-List-Received-Date: Fri, 16 Jun 2017 13:21:40 -0000

Moved misc.py from wic/utils/ to wic/
Removed wic/utils directory

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py                            | 2 +-
 scripts/lib/wic/{utils => }/misc.py                  | 0
 scripts/lib/wic/partition.py                         | 2 +-
 scripts/lib/wic/pluginbase.py                        | 2 +-
 scripts/lib/wic/plugins/imager/direct.py             | 2 +-
 scripts/lib/wic/plugins/source/bootimg-efi.py        | 4 ++--
 scripts/lib/wic/plugins/source/bootimg-partition.py  | 2 +-
 scripts/lib/wic/plugins/source/bootimg-pcbios.py     | 5 ++---
 scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 2 +-
 scripts/lib/wic/plugins/source/rawcopy.py            | 2 +-
 scripts/lib/wic/plugins/source/rootfs.py             | 2 +-
 scripts/lib/wic/utils/__init__.py                    | 0
 scripts/wic                                          | 2 +-
 13 files changed, 13 insertions(+), 14 deletions(-)
 rename scripts/lib/wic/{utils => }/misc.py (100%)
 delete mode 100644 scripts/lib/wic/utils/__init__.py

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 2c899dd..2dc2fd5 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -38,7 +38,7 @@ from distutils.spawn import find_executable
 from wic import WicError
 from wic.filemap import sparse_copy
 from wic.pluginbase import PluginMgr
-from wic.utils.misc import get_bitbake_var, exec_cmd
+from wic.misc import get_bitbake_var, exec_cmd
 
 logger = logging.getLogger('wic')
 
diff --git a/scripts/lib/wic/utils/misc.py b/scripts/lib/wic/misc.py
similarity index 100%
rename from scripts/lib/wic/utils/misc.py
rename to scripts/lib/wic/misc.py
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 939e667..1851c4a 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -29,7 +29,7 @@ import os
 import tempfile
 
 from wic import WicError
-from wic.utils.misc import exec_cmd, exec_native_cmd, get_bitbake_var
+from wic.misc import exec_cmd, exec_native_cmd, get_bitbake_var
 from wic.pluginbase import PluginMgr
 
 logger = logging.getLogger('wic')
diff --git a/scripts/lib/wic/pluginbase.py b/scripts/lib/wic/pluginbase.py
index fb3d179..08f9979 100644
--- a/scripts/lib/wic/pluginbase.py
+++ b/scripts/lib/wic/pluginbase.py
@@ -24,7 +24,7 @@ from collections import defaultdict
 from importlib.machinery import SourceFileLoader
 
 from wic import WicError
-from wic.utils.misc import get_bitbake_var
+from wic.misc import get_bitbake_var
 
 PLUGIN_TYPES = ["imager", "source"]
 
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index f252697..e09350b 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -36,7 +36,7 @@ from wic import WicError
 from wic.filemap import sparse_copy
 from wic.ksparser import KickStart, KickStartError
 from wic.pluginbase import PluginMgr, ImagerPlugin
-from wic.utils.misc import get_bitbake_var, exec_cmd, exec_native_cmd
+from wic.misc import get_bitbake_var, exec_cmd, exec_native_cmd
 
 logger = logging.getLogger('wic')
 
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 9879cb9..4c4f36a 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -31,8 +31,8 @@ import shutil
 from wic import WicError
 from wic.engine import get_custom_config
 from wic.pluginbase import SourcePlugin
-from wic.utils.misc import (exec_cmd, exec_native_cmd, get_bitbake_var,
-                            BOOTDD_EXTRA_SPACE)
+from wic.misc import (exec_cmd, exec_native_cmd,
+                      get_bitbake_var, BOOTDD_EXTRA_SPACE)
 
 logger = logging.getLogger('wic')
 
diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
index 13fddbd..ca074a3 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -31,7 +31,7 @@ from glob import glob
 
 from wic import WicError
 from wic.pluginbase import SourcePlugin
-from wic.utils.misc import exec_cmd, get_bitbake_var
+from wic.misc import exec_cmd, get_bitbake_var
 
 logger = logging.getLogger('wic')
 
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index 98ad88b..e3518d2 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -29,10 +29,9 @@ import os
 
 from wic import WicError
 from wic.engine import get_custom_config
-from wic.utils import runner
 from wic.pluginbase import SourcePlugin
-from wic.utils.misc import (exec_cmd, exec_native_cmd,
-                            get_bitbake_var, BOOTDD_EXTRA_SPACE)
+from wic.misc import (exec_cmd, exec_native_cmd,
+                      get_bitbake_var, BOOTDD_EXTRA_SPACE)
 
 logger = logging.getLogger('wic')
 
diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index b464263..db77113 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -29,7 +29,7 @@ import shutil
 from wic import WicError
 from wic.engine import get_custom_config
 from wic.pluginbase import SourcePlugin
-from wic.utils.misc import exec_cmd, exec_native_cmd, get_bitbake_var
+from wic.misc import exec_cmd, exec_native_cmd, get_bitbake_var
 
 logger = logging.getLogger('wic')
 
diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
index e1c4f5e..424ed26 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -20,7 +20,7 @@ import os
 
 from wic import WicError
 from wic.pluginbase import SourcePlugin
-from wic.utils.misc import exec_cmd, get_bitbake_var
+from wic.misc import exec_cmd, get_bitbake_var
 from wic.filemap import sparse_copy
 
 logger = logging.getLogger('wic')
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index 944ec5f..1b9f68b 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -34,7 +34,7 @@ from oe.path import copyhardlinktree
 
 from wic import WicError
 from wic.pluginbase import SourcePlugin
-from wic.utils.misc import get_bitbake_var, exec_cmd
+from wic.misc import get_bitbake_var, exec_cmd
 
 logger = logging.getLogger('wic')
 
diff --git a/scripts/lib/wic/utils/__init__.py b/scripts/lib/wic/utils/__init__.py
deleted file mode 100644
index e69de29..0000000
diff --git a/scripts/wic b/scripts/wic
index da14f47..81fc85d 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -56,7 +56,7 @@ else:
     bitbake_main = None
 
 from wic import WicError
-from wic.utils.misc import get_bitbake_var, BB_VARS
+from wic.misc import get_bitbake_var, BB_VARS
 from wic import engine
 from wic import help as hlp
 
-- 
2.1.4


