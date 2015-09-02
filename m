Return-Path: <brendan.le.foll@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CF6A27702A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 20:22:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 02 Sep 2015 13:22:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,456,1437462000"; d="scan'208";a="796552787"
Received: from jupiter.iwi.intel.com ([172.28.33.51])
	by orsmga002.jf.intel.com with ESMTP; 02 Sep 2015 13:22:48 -0700
From: brendan.le.foll@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Sep 2015 21:22:56 +0100
Message-Id: <1441225376-16832-1-git-send-email-brendan.le.foll@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH v2] devtool: add package plugin that lets you create package via devtool
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
X-List-Received-Date: Wed, 02 Sep 2015 20:22:50 -0000

From: Brendan Le Foll <brendan.le.foll@intel.com>

Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com>
---
 scripts/lib/devtool/package.py | 62 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 scripts/lib/devtool/package.py

diff --git a/scripts/lib/devtool/package.py b/scripts/lib/devtool/package.py
new file mode 100644
index 0000000..bbc85b7
--- /dev/null
+++ b/scripts/lib/devtool/package.py
@@ -0,0 +1,62 @@
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
+    import re
+    import bb
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


