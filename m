Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B46FD77309
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 09:02:04 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Feb 2017 01:02:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,165,1484035200"; d="scan'208";a="65379983"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 15 Feb 2017 01:02:04 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id F3EFD6A4082
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 01:01:01 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2017 10:38:34 +0200
Message-Id: <f0966df2b5836a412ccc07ce512927eb1afccf02.1487110279.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487110279.git.ed.bartosh@linux.intel.com>
References: <cover.1487110279.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 11/11] wic: move WicError to lib/wic/__init__.py
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
X-List-Received-Date: Wed, 15 Feb 2017 09:02:05 -0000

Removed unused exceptions from error.py
Moved definition of WicError to lib/wic/__init__.py

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/__init__.py                        | 20 +++++++++++++++
 scripts/lib/wic/engine.py                          |  2 +-
 scripts/lib/wic/errors.py                          | 29 ----------------------
 scripts/lib/wic/partition.py                       |  2 +-
 scripts/lib/wic/plugin.py                          |  3 +--
 scripts/lib/wic/plugins/imager/direct.py           |  2 +-
 scripts/lib/wic/plugins/source/bootimg-efi.py      |  2 +-
 .../lib/wic/plugins/source/bootimg-partition.py    |  2 +-
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |  2 +-
 scripts/lib/wic/plugins/source/fsimage.py          |  2 +-
 .../lib/wic/plugins/source/isoimage-isohybrid.py   |  2 +-
 scripts/lib/wic/plugins/source/rawcopy.py          |  2 +-
 scripts/lib/wic/plugins/source/rootfs.py           |  2 +-
 .../lib/wic/plugins/source/rootfs_pcbios_ext.py    |  2 +-
 scripts/lib/wic/utils/misc.py                      |  2 +-
 scripts/lib/wic/utils/runner.py                    |  2 +-
 scripts/wic                                        |  2 +-
 17 files changed, 35 insertions(+), 45 deletions(-)
 delete mode 100644 scripts/lib/wic/errors.py

diff --git a/scripts/lib/wic/__init__.py b/scripts/lib/wic/__init__.py
index e69de29..85876b1 100644
--- a/scripts/lib/wic/__init__.py
+++ b/scripts/lib/wic/__init__.py
@@ -0,0 +1,20 @@
+#!/usr/bin/env python -tt
+#
+# Copyright (c) 2007 Red Hat, Inc.
+# Copyright (c) 2011 Intel, Inc.
+#
+# This program is free software; you can redistribute it and/or modify it
+# under the terms of the GNU General Public License as published by the Free
+# Software Foundation; version 2 of the License
+#
+# This program is distributed in the hope that it will be useful, but
+# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
+# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
+# for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc., 59
+# Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+
+class WicError(Exception):
+    pass
diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 38a68ed..c29924b 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -31,7 +31,7 @@
 import logging
 import os
 
-from wic.errors import WicError
+from wic import WicError
 from wic.plugin import pluginmgr
 from wic.utils.misc import get_bitbake_var
 
diff --git a/scripts/lib/wic/errors.py b/scripts/lib/wic/errors.py
deleted file mode 100644
index d1b514d..0000000
--- a/scripts/lib/wic/errors.py
+++ /dev/null
@@ -1,29 +0,0 @@
-#!/usr/bin/env python -tt
-#
-# Copyright (c) 2007 Red Hat, Inc.
-# Copyright (c) 2011 Intel, Inc.
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
-class WicError(Exception):
-    pass
-
-class CreatorError(WicError):
-    pass
-
-class Usage(WicError):
-    pass
-
-class ImageError(WicError):
-    pass
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index c5c439a..6a82299 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -28,7 +28,7 @@ import logging
 import os
 import tempfile
 
-from wic.errors import WicError
+from wic import WicError
 from wic.utils.misc import exec_cmd, exec_native_cmd, get_bitbake_var
 from wic.plugin import pluginmgr
 
diff --git a/scripts/lib/wic/plugin.py b/scripts/lib/wic/plugin.py
index 0e98da5..ac55ecf 100644
--- a/scripts/lib/wic/plugin.py
+++ b/scripts/lib/wic/plugin.py
@@ -19,8 +19,7 @@ import os
 import sys
 import logging
 
-from wic.errors import WicError
-from wic import pluginbase
+from wic import pluginbase, WicError
 from wic.utils.misc import get_bitbake_var
 
 __ALL__ = ['PluginMgr', 'pluginmgr']
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 5b20ca9..6d1ed8c 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -32,7 +32,7 @@ import uuid
 
 from time import strftime
 
-from wic.errors import WicError
+from wic import WicError
 from wic.filemap import sparse_copy
 from wic.ksparser import KickStart, KickStartError
 from wic.plugin import pluginmgr
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 1f018fa..2d793a5 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -28,7 +28,7 @@ import logging
 import os
 import shutil
 
-from wic.errors import WicError
+from wic import WicError
 from wic.engine import get_custom_config
 from wic.pluginbase import SourcePlugin
 from wic.utils.misc import (exec_cmd, exec_native_cmd, get_bitbake_var,
diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
index e9724a6..373e8d8 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -29,7 +29,7 @@ import re
 
 from glob import glob
 
-from wic.errors import WicError
+from wic import WicError
 from wic.pluginbase import SourcePlugin
 from wic.utils.misc import exec_cmd, get_bitbake_var
 
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index c3a0e4e..74c75a0 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -27,8 +27,8 @@
 import logging
 import os
 
+from wic import WicError
 from wic.engine import get_custom_config
-from wic.errors import WicError
 from wic.utils import runner
 from wic.pluginbase import SourcePlugin
 from wic.utils.misc import (exec_cmd, exec_native_cmd,
diff --git a/scripts/lib/wic/plugins/source/fsimage.py b/scripts/lib/wic/plugins/source/fsimage.py
index 67fc6d1..8fbe44d 100644
--- a/scripts/lib/wic/plugins/source/fsimage.py
+++ b/scripts/lib/wic/plugins/source/fsimage.py
@@ -18,7 +18,7 @@
 import logging
 import os
 
-from wic.errors import WicError
+from wic import WicError
 from wic.pluginbase import SourcePlugin
 from wic.utils.misc import get_bitbake_var
 
diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index df86acc..1ceba62 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -26,7 +26,7 @@ import os
 import re
 import shutil
 
-from wic.errors import WicError
+from wic import WicError
 from wic.engine import get_custom_config
 from wic.pluginbase import SourcePlugin
 from wic.utils.misc import exec_cmd, exec_native_cmd, get_bitbake_var
diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
index 5612809..12348ae 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -18,7 +18,7 @@
 import logging
 import os
 
-from wic.errors import WicError
+from wic import WicError
 from wic.pluginbase import SourcePlugin
 from wic.utils.misc import exec_cmd, get_bitbake_var
 from wic.filemap import sparse_copy
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index e58469a..0ae62c7 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -28,7 +28,7 @@
 import logging
 import os
 
-from wic.errors import WicError
+from wic import WicError
 from wic.pluginbase import SourcePlugin
 from wic.utils.misc import get_bitbake_var
 
diff --git a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
index cf0eec2..94f80d0 100644
--- a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
+++ b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
@@ -22,7 +22,7 @@ import logging
 import os
 import re
 
-from wic.errors import WicError
+from wic import WicError
 from wic.utils import runner
 from wic.utils.misc import get_bitbake_var, exec_cmd, exec_native_cmd
 from wic.pluginbase import SourcePlugin
diff --git a/scripts/lib/wic/utils/misc.py b/scripts/lib/wic/utils/misc.py
index 94fdab2..4b822f0 100644
--- a/scripts/lib/wic/utils/misc.py
+++ b/scripts/lib/wic/utils/misc.py
@@ -33,7 +33,7 @@ import re
 from collections import defaultdict
 from distutils import spawn
 
-from wic.errors import WicError
+from wic import WicError
 from wic.utils import runner
 
 logger = logging.getLogger('wic')
diff --git a/scripts/lib/wic/utils/runner.py b/scripts/lib/wic/utils/runner.py
index 5ede192..56d7ea3 100644
--- a/scripts/lib/wic/utils/runner.py
+++ b/scripts/lib/wic/utils/runner.py
@@ -19,7 +19,7 @@ import logging
 import os
 import subprocess
 
-from wic.errors import WicError
+from wic import WicError
 
 logger = logging.getLogger('wic')
 
diff --git a/scripts/wic b/scripts/wic
index b8be5b8..e6780a1 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -51,7 +51,7 @@ if bitbake_exe:
 else:
     bitbake_main = None
 
-from wic.errors import WicError
+from wic import WicError
 from wic.utils.misc import get_bitbake_var, BB_VARS
 from wic import engine
 from wic import help as hlp
-- 
2.1.4


