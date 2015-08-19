Return-Path: <brendan.le.foll@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D07AA75E80
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 16:33:28 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 19 Aug 2015 09:33:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,710,1432623600"; d="scan'208";a="771847819"
Received: from jupiter.iwi.intel.com ([172.28.33.51])
	by fmsmga001.fm.intel.com with ESMTP; 19 Aug 2015 09:33:28 -0700
From: brendan.le.foll@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Aug 2015 17:33:27 +0100
Message-Id: <1440002007-9895-1-git-send-email-brendan.le.foll@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] devtool: add package plugin that lets you create package via devtool
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
X-List-Received-Date: Wed, 19 Aug 2015 16:33:29 -0000

From: Brendan Le Foll <brendan.le.foll@intel.com>

Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com>
---
 scripts/lib/devtool/package.py | 63 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 scripts/lib/devtool/package.py

diff --git a/scripts/lib/devtool/package.py b/scripts/lib/devtool/package.py
new file mode 100644
index 0000000..18b9eb0
--- /dev/null
+++ b/scripts/lib/devtool/package.py
@@ -0,0 +1,63 @@
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
+        image_pkgtype = exec_build_env_command(config.init_path, basepath, 'bitbake -e %s | grep IMAGE_PKGTYPE' % (args.recipename), watch=False)
+    except bb.process.ExecutionError as e:
+        logger.error('Unable to get IMAGE_PKGTYPE for image')
+        return e.exitcode
+
+    image_pkgtype = str(image_pkgtype).split('=', 1)[1].split('"', 2)[1]
+    if image_pkgtype not in ("rpm", "ipk", "tar", "deb"):
+        logger.error('Invalid package format (%s) found' % image_pkgtype)
+        return 1
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
+    parser_package = subparsers.add_parser('package', help='Package a recipe output files')
+    parser_package.add_argument('recipename', help='Recipe to package')
+    parser_package.set_defaults(func=package)
-- 
2.5.0


