Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 10AB376DE5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 14:20:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 01 Sep 2015 07:20:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,449,1437462000"; d="scan'208";a="795486716"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga002.jf.intel.com with ESMTP; 01 Sep 2015 07:20:18 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Sep 2015 06:13:41 +0000
Message-Id: <17c94710ca571b15a1a34ad1b2fa8f5c67231d5f.1441087651.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1441087651.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1441087651.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1441087651.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1441087651.git.leonardo.sandoval.gonzalez@linux.intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 1/2] devtool: Create a single file for the build devtool feature
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
X-List-Received-Date: Tue, 01 Sep 2015 14:20:38 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

The intention is to have a single file for each devtool feature
so devtool can grow in a modular way. In this direction, this patch creates
build.py, moving all related build features from standard.py to build.py.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 scripts/lib/devtool/build.py    | 50 +++++++++++++++++++++++++++++++++++++++++
 scripts/lib/devtool/standard.py | 22 ------------------
 2 files changed, 50 insertions(+), 22 deletions(-)
 create mode 100644 scripts/lib/devtool/build.py

diff --git a/scripts/lib/devtool/build.py b/scripts/lib/devtool/build.py
new file mode 100644
index 0000000..0f848e2
--- /dev/null
+++ b/scripts/lib/devtool/build.py
@@ -0,0 +1,50 @@
+# Development tool - build command plugin
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
+"""Devtool build plugin"""
+
+import logging
+import argparse
+from devtool import exec_build_env_command
+
+logger = logging.getLogger('devtool')
+
+def plugin_init(pluginlist):
+    """Plugin initialization"""
+    pass
+
+def build(args, config, basepath, workspace):
+    """Entry point for the devtool 'build' subcommand"""
+    import bb
+    if not args.recipename in workspace:
+        raise DevtoolError("no recipe named %s in your workspace" %
+                           args.recipename)
+    build_task = config.get('Build', 'build_task', 'populate_sysroot')
+    try:
+        exec_build_env_command(config.init_path, basepath, 'bitbake -c %s %s' % (build_task, args.recipename), watch=True)
+    except bb.process.ExecutionError as e:
+        # We've already seen the output since watch=True, so just ensure we return something to the user
+        return e.exitcode
+
+    return 0
+
+def register_commands(subparsers, context):
+    """Register devtool subcommands from this plugin"""
+    parser_build = subparsers.add_parser('build', help='Build a recipe',
+                                         description='Builds the specified recipe using bitbake',
+                                         formatter_class=argparse.ArgumentDefaultsHelpFormatter)
+    parser_build.add_argument('recipename', help='Recipe to build')
+    parser_build.set_defaults(func=build)
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index de7afd9..ad14769 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -822,22 +822,6 @@ def reset(args, config, basepath, workspace):
     return 0
 
 
-def build(args, config, basepath, workspace):
-    """Entry point for the devtool 'build' subcommand"""
-    import bb
-    if not args.recipename in workspace:
-        raise DevtoolError("no recipe named %s in your workspace" %
-                           args.recipename)
-    build_task = config.get('Build', 'build_task', 'populate_sysroot')
-    try:
-        exec_build_env_command(config.init_path, basepath, 'bitbake -c %s %s' % (build_task, args.recipename), watch=True)
-    except bb.process.ExecutionError as e:
-        # We've already seen the output since watch=True, so just ensure we return something to the user
-        return e.exitcode
-
-    return 0
-
-
 def register_commands(subparsers, context):
     """Register devtool subcommands from this plugin"""
     parser_add = subparsers.add_parser('add', help='Add a new recipe',
@@ -886,12 +870,6 @@ def register_commands(subparsers, context):
                                           formatter_class=argparse.ArgumentDefaultsHelpFormatter)
     parser_status.set_defaults(func=status)
 
-    parser_build = subparsers.add_parser('build', help='Build a recipe',
-                                         description='Builds the specified recipe using bitbake',
-                                         formatter_class=argparse.ArgumentDefaultsHelpFormatter)
-    parser_build.add_argument('recipename', help='Recipe to build')
-    parser_build.set_defaults(func=build)
-
     parser_reset = subparsers.add_parser('reset', help='Remove a recipe from your workspace',
                                          description='Removes the specified recipe from your workspace (resetting its state)',
                                          formatter_class=argparse.ArgumentDefaultsHelpFormatter)
-- 
1.8.4.5


