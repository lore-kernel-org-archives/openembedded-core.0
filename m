Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4E404772F6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 14:11:39 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 01 Feb 2017 06:11:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; d="scan'208";a="928967477"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 01 Feb 2017 06:11:39 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 60B016A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 06:10:40 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2017 15:48:25 +0200
Message-Id: <7d75fd29296a9c411881b4288bff2e02cb145a25.1485953483.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485953483.git.ed.bartosh@linux.intel.com>
References: <cover.1485953483.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 18/18] wic: remove syslinux.py
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
X-List-Received-Date: Wed, 01 Feb 2017 14:11:39 -0000

This module contains singe function serial_console_form_kargs, which
is used only by rootfs_pcbios_ext plugin. Moved it there and removed
syslinux module to make it easy to find and mainain plugin code.

[YOCTO #10619]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 .../lib/wic/plugins/source/rootfs_pcbios_ext.py    | 38 +++++++++++++-
 scripts/lib/wic/utils/syslinux.py                  | 58 ----------------------
 2 files changed, 37 insertions(+), 59 deletions(-)
 delete mode 100644 scripts/lib/wic/utils/syslinux.py

diff --git a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
index 1032019..bd6fd6c 100644
--- a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
+++ b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
@@ -19,13 +19,49 @@
 #
 
 import os
+import re
+
 from wic import msger
-from wic.utils import syslinux
 from wic.utils import runner
 from wic.utils.misc import get_bitbake_var, exec_cmd, exec_native_cmd
 from wic.utils.errors import ImageError
 from wic.pluginbase import SourcePlugin
 
+def serial_console_form_kargs(kernel_args):
+    """
+    Create SERIAL... line from kernel parameters
+
+    syslinux needs a line SERIAL port [baudrate [flowcontrol]]
+    in the syslinux.cfg file. The config line is generated based
+    on kernel boot parameters. The the parameters of the first
+    ttyS console are considered for syslinux config.
+    @param kernel_args kernel command line
+    @return line for syslinux config file e.g. "SERIAL 0 115200"
+    """
+    syslinux_conf = ""
+    for param in kernel_args.split():
+        param_match = re.match("console=ttyS([0-9]+),?([0-9]*)([noe]?)([0-9]?)(r?)", param)
+        if param_match:
+            syslinux_conf += "SERIAL " + param_match.group(1)
+            # baudrate
+            if param_match.group(2):
+                syslinux_conf += " " + param_match.group(2)
+            # parity
+            if param_match.group(3) and param_match.group(3) != 'n':
+                msger.warning("syslinux does not support parity for console. {} is ignored."
+                              .format(param_match.group(3)))
+            # number of bits
+            if param_match.group(4) and param_match.group(4) != '8':
+                msger.warning("syslinux supports 8 bit console configuration only. {} is ignored."
+                              .format(param_match.group(4)))
+            # flow control
+            if param_match.group(5) and param_match.group(5) != '':
+                msger.warning("syslinux console flowcontrol configuration. {} is ignored."
+                              .format(param_match.group(5)))
+            break
+
+    return syslinux_conf
+
 
 # pylint: disable=no-init
 class RootfsPlugin(SourcePlugin):
diff --git a/scripts/lib/wic/utils/syslinux.py b/scripts/lib/wic/utils/syslinux.py
deleted file mode 100644
index aace286..0000000
--- a/scripts/lib/wic/utils/syslinux.py
+++ /dev/null
@@ -1,58 +0,0 @@
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
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
-#
-# AUTHOR
-# Adrian Freihofer <adrian.freihofer (at] neratec.com>
-
-
-import re
-from wic import msger
-
-
-def serial_console_form_kargs(kernel_args):
-    """
-    Create SERIAL... line from kernel parameters
-
-    syslinux needs a line SERIAL port [baudrate [flowcontrol]]
-    in the syslinux.cfg file. The config line is generated based
-    on kernel boot parameters. The the parameters of the first
-    ttyS console are considered for syslinux config.
-    @param kernel_args kernel command line
-    @return line for syslinux config file e.g. "SERIAL 0 115200"
-    """
-    syslinux_conf = ""
-    for param in kernel_args.split():
-        param_match = re.match("console=ttyS([0-9]+),?([0-9]*)([noe]?)([0-9]?)(r?)", param)
-        if param_match:
-            syslinux_conf += "SERIAL " + param_match.group(1)
-            # baudrate
-            if param_match.group(2):
-                syslinux_conf += " " + param_match.group(2)
-            # parity
-            if param_match.group(3) and param_match.group(3) != 'n':
-                msger.warning("syslinux does not support parity for console. {} is ignored."
-                              .format(param_match.group(3)))
-            # number of bits
-            if param_match.group(4) and param_match.group(4) != '8':
-                msger.warning("syslinux supports 8 bit console configuration only. {} is ignored."
-                              .format(param_match.group(4)))
-            # flow control
-            if param_match.group(5) and param_match.group(5) != '':
-                msger.warning("syslinux console flowcontrol configuration. {} is ignored."
-                              .format(param_match.group(5)))
-            break
-
-    return syslinux_conf
-- 
2.1.4


