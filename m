Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4DC1A72923
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 11:42:16 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 19 Dec 2014 03:42:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,606,1413270000"; d="scan'208";a="640244400"
Received: from khamid-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.31.61])
	by fmsmga001.fm.intel.com with ESMTP; 19 Dec 2014 03:42:16 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Dec 2014 11:41:54 +0000
Message-Id: <cc20698b7b40affb4403f0d482b31b33fc7e5e32.1418984743.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1418984743.git.paul.eggleton@linux.intel.com>
References: <cover.1418984743.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1418984743.git.paul.eggleton@linux.intel.com>
References: <cover.1418984743.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 12/15] scripts: add scriptutils module
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
X-List-Received-Date: Fri, 19 Dec 2014 11:42:16 -0000

Add a utility module for scripts. This is intended to provide functions
only really useful before bitbake has been found (or only of particular
interest to scripts). At the moment this includes functions for setting
up a logger and for loading plugins.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/scriptutils.py | 60 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 scripts/lib/scriptutils.py

diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
new file mode 100644
index 0000000..e786126
--- /dev/null
+++ b/scripts/lib/scriptutils.py
@@ -0,0 +1,60 @@
+# Script utility functions
+#
+# Copyright (C) 2014 Intel Corporation
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
+
+import sys
+import os
+import logging
+import glob
+
+def logger_create(name):
+    logger = logging.getLogger(name)
+    loggerhandler = logging.StreamHandler()
+    loggerhandler.setFormatter(logging.Formatter("%(levelname)s: %(message)s"))
+    logger.addHandler(loggerhandler)
+    logger.setLevel(logging.INFO)
+    return logger
+
+def logger_setup_color(logger, color='auto'):
+    from bb.msg import BBLogFormatter
+    console = logging.StreamHandler(sys.stdout)
+    formatter = BBLogFormatter("%(levelname)s: %(message)s")
+    console.setFormatter(formatter)
+    logger.handlers = [console]
+    if color == 'always' or (color=='auto' and console.stream.isatty()):
+        formatter.enable_color()
+
+
+def load_plugins(logger, plugins, pluginpath):
+    import imp
+
+    def load_plugin(name):
+        logger.debug('Loading plugin %s' % name)
+        fp, pathname, description = imp.find_module(name, [pluginpath])
+        try:
+            return imp.load_module(name, fp, pathname, description)
+        finally:
+            if fp:
+                fp.close()
+
+    logger.debug('Loading plugins from %s...' % pluginpath)
+    for fn in glob.glob(os.path.join(pluginpath, '*.py')):
+        name = os.path.splitext(os.path.basename(fn))[0]
+        if name != '__init__':
+            plugin = load_plugin(name)
+            if hasattr(plugin, 'plugin_init'):
+                plugin.plugin_init(plugins)
+                plugins.append(plugin)
-- 
1.9.3


