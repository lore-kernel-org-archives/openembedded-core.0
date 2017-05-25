Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 29A7078167
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 21:31:57 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 May 2017 14:31:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,393,1491289200"; d="scan'208";a="91509278"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by orsmga004.jf.intel.com with ESMTP; 25 May 2017 14:31:52 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 May 2017 14:31:47 -0700
Message-Id: <bf82908d95ac7a8c19e606773eb47da8c32b6e70.1495747168.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1495747168.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1495747168.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 1/2] export: new plugin to export the devtool workspace
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
X-List-Received-Date: Thu, 25 May 2017 21:31:58 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

By default, exports the whole workspace (all recipes) including the source code.
User can also limit what is exported with --included/--excluded flags. As
a result of this operation, a tar archive containing only workspace metadata
and its corresponding source code is created, which can be properly imported
with 'devtool import'.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=10510

[YOCTO #10510]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 scripts/lib/devtool/export.py | 94 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 scripts/lib/devtool/export.py

diff --git a/scripts/lib/devtool/export.py b/scripts/lib/devtool/export.py
new file mode 100644
index 00000000000..8e3ba8ca68b
--- /dev/null
+++ b/scripts/lib/devtool/export.py
@@ -0,0 +1,94 @@
+# Development tool - export command plugin
+#
+# Copyright (C) 2014-2017 Intel Corporation
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
+"""Devtool export plugin"""
+
+import os
+import argparse
+import tarfile
+import logging
+
+logger = logging.getLogger('devtool')
+default_arcname = "workspace.tar"
+
+def export(args, config, basepath, workspace):
+    """Entry point for the devtool 'export' subcommand"""
+
+    def create_arcname(name):
+        """Create arc name by removing the workspace path or $HOME prefix from name"""
+        _name = name
+        if name.startswith(config.workspace_path):
+            _name = name.replace(config.workspace_path, '')
+        else:
+            _name = name.replace(os.environ['HOME'], '')
+        return (name, _name)
+
+    def reset(tarinfo):
+        tarinfo.uname = tarinfo.gname = "nobody"
+        return tarinfo
+
+    def add(tar, value):
+        # Get  arcnames
+        arcnames = []
+        for key in ['srctree', 'bbappend', 'recipefile']:
+            if key in value and value[key]:
+                arcnames.append(create_arcname(value[key]))
+
+        # Archive
+        for name, arcname in arcnames:
+            tar.add(name, arcname=arcname, filter=reset)
+
+    # include the default archiver filename if missing
+    name = args.name
+    if os.path.isdir(name):
+        if name[-1] != '/':
+            name = name + '/'
+        name = name + default_arcname
+
+    if os.path.exists(name) and not args.force:
+        logger.error('Tar archive %s exists. Use -f to force removal')
+        return 1
+
+    included = []
+    with tarfile.open(name, "w") as tar:
+        if args.include:
+            for recipe in args.include:
+                if recipe in workspace:
+                    add(tar, workspace[recipe])
+                    included.append(recipe)
+                else:
+                    logger.warn('recipe %s not in workspace, not in archive file')
+        else:
+            for recipe, value in workspace.items():
+                if recipe not in args.exclude:
+                    add(tar, value)
+                    included.append(recipe)
+
+    logger.info('Tar archive create at %s with the following recipes: %s' % (name, included))
+
+def register_commands(subparsers, context):
+    """Register devtool export subcommands"""
+    parser = subparsers.add_parser('export',
+                                   help='Export workspace into a tar archive',
+                                   description='Export one or more recipes from current workspace into a tar archive',
+                                   group='advanced')
+
+    parser.add_argument('--name', '-n', default=default_arcname, help='Name of the tar archive')
+    parser.add_argument('--force', '-f', action="store_true", help='Overwrite previous export tar archive')
+    group = parser.add_mutually_exclusive_group()
+    group.add_argument('--include', '-i', nargs='+', default=[], help='Include the defined recipes into the tar archive')
+    group.add_argument('--exclude', '-e', nargs='+', default=[], help='Exclude the defined recipes into the tar archive')
+    parser.set_defaults(func=export)
-- 
2.12.0


