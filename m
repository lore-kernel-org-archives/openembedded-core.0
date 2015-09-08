Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 941F07687B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 10:39:44 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 08 Sep 2015 03:39:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,489,1437462000"; d="scan'208";a="800537276"
Received: from jdkarpin-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.5.153])
	by fmsmga002.fm.intel.com with ESMTP; 08 Sep 2015 03:39:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 11:39:14 +0100
Message-Id: <404951ccfe6e270c20a0ab0ff9c7a173638bb7aa.1441706523.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1441706523.git.paul.eggleton@linux.intel.com>
References: <cover.1441706523.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1441706523.git.paul.eggleton@linux.intel.com>
References: <cover.1441706523.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 8/9] devtool: add package plugin that lets you create package via devtool
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
X-List-Received-Date: Tue, 08 Sep 2015 10:39:44 -0000

From: Brendan Le Foll <brendan.le.foll@intel.com>

Enables creating packages using devtool within the extensible SDK. (This
is only enabled within the extensible SDK because it provides no
advantage over just running bitbake directly there).

Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/package.py | 61 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 scripts/lib/devtool/package.py

diff --git a/scripts/lib/devtool/package.py b/scripts/lib/devtool/package.py
new file mode 100644
index 0000000..3a7a36b
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
+    image_pkgtype = config.get('Package', 'image_pkgtype', '')
+    if not image_pkgtype:
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
+    if context.fixed_setup:
+        parser_package = subparsers.add_parser('package', help='Build packages for a recipe', description='Builds packages for a recipe\'s output files')
+        parser_package.add_argument('recipename', help='Recipe to package')
+        parser_package.set_defaults(func=package)
-- 
2.1.0


