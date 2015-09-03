Return-Path: <brendan.le.foll@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C1FC477002
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 22:09:21 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 03 Sep 2015 15:09:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,464,1437462000"; d="scan'208";a="554831257"
Received: from jupiter.iwi.intel.com ([172.28.33.51])
	by FMSMGA003.fm.intel.com with ESMTP; 03 Sep 2015 15:09:21 -0700
From: brendan.le.foll@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Sep 2015 23:09:30 +0100
Message-Id: <1441318170-2356-1-git-send-email-brendan.le.foll@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH v3] devtool: add package plugin that lets you create package via devtool
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
X-List-Received-Date: Thu, 03 Sep 2015 22:09:21 -0000

From: Brendan Le Foll <brendan.le.foll@intel.com>

Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com>
---
 scripts/lib/devtool/package.py | 61 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 scripts/lib/devtool/package.py

diff --git a/scripts/lib/devtool/package.py b/scripts/lib/devtool/package.py
new file mode 100644
index 0000000..e9d4240
--- /dev/null
+++ b/scripts/lib/devtool/package.py
@@ -0,0 +1,61 @@
+# Development tool - package command plugin
+#
+# Copyright (C) 2014-2015 Intel Corporation
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
+"""Devtool plugin containing the package subcommands"""
+
+import os
+import subprocess
+import logging
+from bb.process import ExecutionError
+from devtool import exec_build_env_command, setup_tinfoil, DevtoolError
+
+logger = logging.getLogger('devtool')
+
+def plugin_init(pluginlist):
+    """Plugin initialization"""
+    pass
+
+def package(args, config, basepath, workspace):
+    """Entry point for the devtool 'package' subcommand"""
+    if not args.recipename in workspace:
+        raise DevtoolError("no recipe named %s in your workspace" %
+                           args.recipename)
+
+    try:
+        image_pkgtype = config.get('image_pkgtype', None)
+    except:
+        tinfoil = setup_tinfoil()
+        try:
+            tinfoil.prepare(config_only=True)
+            image_pkgtype = tinfoil.config_data.getVar('IMAGE_PKGTYPE', True)
+        finally:
+            tinfoil.shutdown()
+
+    package_task = config.get('Package', 'package_task', 'package_write_%s' % image_pkgtype)
+    try:
+        exec_build_env_command(config.init_path, basepath, 'bitbake -c %s %s' % (package_task, args.recipename), watch=True)
+    except bb.process.ExecutionError as e:
+        # We've already seen the output since watch=True, so just ensure we return something to the user
+        return e.exitcode
+    logger.info('Your packages are in %s/tmp/deploy/%s' % (basepath, image_pkgtype))
+
+    return 0
+
+def register_commands(subparsers, context):
+    """Register devtool subcommands from the package plugin"""
+    parser_package = subparsers.add_parser('package', help='Create packages for a recipe', description='Creates packages for a recipe\'s output files')
+    parser_package.add_argument('recipename', help='Recipe to package')
+    parser_package.set_defaults(func=package)
-- 
2.5.0


