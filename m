Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8E06C782A7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 05:41:02 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Aug 2017 22:41:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,407,1498546800"; d="scan'208";a="1208228290"
Received: from ssen-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.129.109])
	by fmsmga002.fm.intel.com with ESMTP; 20 Aug 2017 22:40:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Aug 2017 17:39:45 +1200
Message-Id: <024784eb244f5886a7f8105bfeff3a8649d263fc.1503293342.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1503293342.git.paul.eggleton@linux.intel.com>
References: <cover.1503293342.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 06/10] devtool: export: new plugin to export the devtool workspace
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
X-List-Received-Date: Mon, 21 Aug 2017 05:41:02 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

By default, exports the whole workspace (all recipes) including the source code.
User can also limit what is exported with --included/--excluded flags. As
a result of this operation, a tar archive containing only workspace metadata
and its corresponding source code is created, which can be properly imported
with 'devtool import'.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=10510

[YOCTO #10510]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/export.py | 119 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 scripts/lib/devtool/export.py

diff --git a/scripts/lib/devtool/export.py b/scripts/lib/devtool/export.py
new file mode 100644
index 0000000..13ee258
--- /dev/null
+++ b/scripts/lib/devtool/export.py
@@ -0,0 +1,119 @@
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
+import datetime
+import json
+
+logger = logging.getLogger('devtool')
+
+# output files
+default_arcname_prefix = "workspace-export"
+metadata = '.export_metadata'
+
+def export(args, config, basepath, workspace):
+    """Entry point for the devtool 'export' subcommand"""
+
+    def add_metadata(tar):
+        """Archive the workspace object"""
+        # finally store the workspace metadata
+        with open(metadata, 'w') as fd:
+            fd.write(json.dumps((config.workspace_path, workspace)))
+        tar.add(metadata)
+        os.unlink(metadata)
+
+    def add_recipe(tar, recipe, data):
+        """Archive recipe with proper arcname"""
+        # Create a map of name/arcnames
+        arcnames = []
+        for key, name in data.items():
+            if name:
+                if key == 'srctree':
+                    # all sources, no matter where are located, goes into the sources directory
+                    arcname = 'sources/%s' % recipe
+                else:
+                    arcname = name.replace(config.workspace_path, '')
+                arcnames.append((name, arcname))
+
+        for name, arcname in arcnames:
+            tar.add(name, arcname=arcname)
+
+
+    # Make sure workspace is non-empty and possible listed include/excluded recipes are in workspace
+    if not workspace:
+        logger.info('Workspace contains no recipes, nothing to export')
+        return 0
+    else:
+        for param, recipes in {'include':args.include,'exclude':args.exclude}.items():
+            for recipe in recipes:
+                if recipe not in workspace:
+                    logger.error('Recipe (%s) on %s argument not in the current workspace' % (recipe, param))
+                    return 1
+
+    name = args.file
+
+    default_name = "%s-%s.tar.gz" % (default_arcname_prefix, datetime.datetime.now().strftime('%Y%m%d%H%M%S'))
+    if not name:
+        name = default_name
+    else:
+        # if name is a directory, append the default name
+        if os.path.isdir(name):
+            name = os.path.join(name, default_name)
+
+    if os.path.exists(name) and not args.overwrite:
+        logger.error('Tar archive %s exists. Use --overwrite/-o to overwrite it')
+        return 1
+
+    # if all workspace is excluded, quit
+    if not len(set(workspace.keys()).difference(set(args.exclude))):
+        logger.warn('All recipes in workspace excluded, nothing to export')
+        return 0
+
+    exported = []
+    with tarfile.open(name, 'w:gz') as tar:
+        if args.include:
+            for recipe in args.include:
+                add_recipe(tar, recipe, workspace[recipe])
+                exported.append(recipe)
+        else:
+            for recipe, data in workspace.items():
+                if recipe not in args.exclude:
+                    add_recipe(tar, recipe, data)
+                    exported.append(recipe)
+
+        add_metadata(tar)
+
+    logger.info('Tar archive created at %s with the following recipes: %s' % (name, ', '.join(exported)))
+    return 0
+
+def register_commands(subparsers, context):
+    """Register devtool export subcommands"""
+    parser = subparsers.add_parser('export',
+                                   help='Export workspace into a tar archive',
+                                   description='Export one or more recipes from current workspace into a tar archive',
+                                   group='advanced')
+
+    parser.add_argument('--file', '-f', help='Output archive file name')
+    parser.add_argument('--overwrite', '-o', action="store_true", help='Overwrite previous export tar archive')
+    group = parser.add_mutually_exclusive_group()
+    group.add_argument('--include', '-i', nargs='+', default=[], help='Include recipes into the tar archive')
+    group.add_argument('--exclude', '-e', nargs='+', default=[], help='Exclude recipes into the tar archive')
+    parser.set_defaults(func=export)
-- 
2.9.5


