Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B411772B1E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 07:33:55 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 24 Aug 2015 00:33:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,736,1432623600"; d="scan'208";a="547344106"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Aug 2015 00:33:40 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 0DE906A4083;
	Mon, 24 Aug 2015 00:32:48 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 10:33:31 +0300
Message-Id: <8135f1072d47196f517a9c0e776e2e4a01bae2ec.1440401351.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <833fcc1026046c895ab51fdeb58ec9b24a7516ca.1440401351.git.ed.bartosh@linux.intel.com>
References: <833fcc1026046c895ab51fdeb58ec9b24a7516ca.1440401351.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440401351.git.ed.bartosh@linux.intel.com>
References: <cover.1440401351.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 2/2] devtool: implement build-image plugin
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
X-List-Received-Date: Mon, 24 Aug 2015 07:33:55 -0000

Implemented new plugin to build image from workspace packages.

Plugin creates <image>.bbappend file, adds
all workspace packages to the image using IMAGE_INSTALL_append
variable in bbappend file. After that it runs 'bitbake <image>'.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/devtool/build-image.py | 56 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 scripts/lib/devtool/build-image.py

diff --git a/scripts/lib/devtool/build-image.py b/scripts/lib/devtool/build-image.py
new file mode 100644
index 0000000..d8e7b12
--- /dev/null
+++ b/scripts/lib/devtool/build-image.py
@@ -0,0 +1,56 @@
+# Development tool - build-image plugin
+#
+# Copyright (C) 2015 Intel Corporation
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
+"""Devtool plugin containing the build-image subcommand."""
+
+import os
+import logging
+
+from bb.process import ExecutionError
+from devtool import exec_build_env_command, add_md5
+
+LOG = logging.getLogger('devtool')
+
+def plugin_init(pluginlist):
+    """Plugin initialization"""
+    pass
+
+def build_image(args, config, basepath, workspace):
+    """Entry point for the devtool 'build-image' subcommand."""
+    image = args.recipe
+    appendfile = os.path.join(config.workspace_path, 'appends',
+                              '%s.bbappend' % image)
+    with open(appendfile, 'w') as afile:
+        afile.write('IMAGE_INSTALL_append = " %s"\n' % \
+                    ' '.join(workspace.keys()))
+
+    add_md5(config, image, appendfile)
+
+    try:
+        exec_build_env_command(config.init_path, basepath,
+                               'bitbake %s' % image, watch=True)
+    except ExecutionError as err:
+        return err.exitcode
+
+    LOG.info('Successfully built %s', image)
+
+def register_commands(subparsers, context):
+    """Register devtool subcommands from the build-image plugin"""
+    parser_package = subparsers.add_parser('build-image', help='Build image')
+    parser_package.add_argument('recipe', help='Image recipe to build')
+    parser_package.set_defaults(func=build_image)
+
-- 
2.1.4


