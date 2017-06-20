Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 683B27804A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 18:30:11 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jun 2017 11:30:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,364,1493708400"; d="scan'208";a="1143169561"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by orsmga001.jf.intel.com with ESMTP; 20 Jun 2017 11:30:08 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Jun 2017 11:30:05 -0700
Message-Id: <193c0163d741ae348260bd83f21358066ba41764.1497983224.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1497983224.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1496423434.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<cover.1497983224.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH v3 3/3] import: new plugin to import the devtool workspace
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
X-List-Received-Date: Tue, 20 Jun 2017 18:30:12 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Takes a tar archive created by 'devtool export' and export it (untar) to
workspace. By default, the whole tar archive is imported, thus there is no
way to limit what is imported.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=10510

[YOCTO #10510]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 scripts/lib/devtool/import.py | 142 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 142 insertions(+)
 create mode 100644 scripts/lib/devtool/import.py

diff --git a/scripts/lib/devtool/import.py b/scripts/lib/devtool/import.py
new file mode 100644
index 0000000000..26084ec3b8
--- /dev/null
+++ b/scripts/lib/devtool/import.py
@@ -0,0 +1,142 @@
+# Development tool - import command plugin
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
+"""Devtool import plugin"""
+
+import os
+import tarfile
+import logging
+import re
+import json
+import fnmatch
+
+from devtool import standard, setup_tinfoil, replace_from_file
+from devtool import export
+
+logger = logging.getLogger('devtool')
+
+def devimport(args, config, basepath, workspace):
+    """Entry point for the devtool 'import' subcommand"""
+
+    if not os.path.exists(args.file):
+        logger.error('Tar archive %s does not exist. Export your workspace using "devtool export"')
+        return 1
+
+
+    tinfoil = setup_tinfoil(config_only=False, basepath=basepath)
+
+    imported = []
+    tar = tarfile.open(args.file)
+    members = tar.getmembers()
+
+    # get exported metadata so values containing paths can be automatically replaced it
+    export_workspace_path = export_workspace = None
+    try:
+        metadata = tar.getmember(export.metadata)
+        tar.extract(metadata)
+        with open(metadata.name) as fdm:
+            export_workspace_path, export_workspace = json.load(fdm)
+        os.unlink(metadata.name)
+    except KeyError as ke:
+        logger.error('The export metadata file created by "devtool export" was not found')
+        return 1
+
+    try:
+        recipe_files = [os.path.basename(recipe[0]) for recipe in tinfoil.cooker.recipecaches[''].pkg_fn.items()]
+    finally:
+        if tinfoil:
+            tinfoil.shutdown()
+
+    for member in members:
+        # do not export the metadata
+        if member.name == export.metadata:
+            continue
+
+        is_bbappend = False
+
+        # check bbappend has its corresponding recipe, if not warn continue with next tar member
+        if member.name.startswith('appends'):
+            is_bbappend = True
+            append_root,_ = os.path.splitext(os.path.basename(member.name))
+
+            # check on new recipes introduced by the export
+            for exported_recipe in export_workspace.keys():
+                if append_root.startswith(exported_recipe):
+                    break
+            else:
+                # check on current recipes
+                for recipe_file in recipe_files:
+                    if fnmatch.fnmatch(recipe_file, append_root.replace('%', '') + '*'):
+                        break
+                else:
+                    logger.warn('No recipe to append %s, skipping' % append_root)
+                    continue
+
+        # extract
+        path = os.path.join(config.workspace_path, member.name)
+        if os.path.exists(path):
+            # by default, no file overwrite is done unless -o is given by the user
+            if args.overwrite:
+                try:
+                    tar.extract(member, path=config.workspace_path)
+                except PermissionError as pe:
+                    logger.warn(pe)
+            else:
+                logger.warn('File already present. Use --overwrite/-o to overwrite it: %s' % member.name)
+                continue
+        else:
+            tar.extract(member, path=config.workspace_path)
+
+        # bbappend require extra handling
+        if is_bbappend:
+
+            # we need to get the exported PN from the exported metadata,
+            for exported_recipe in export_workspace.keys():
+                if exported_recipe in member.name:
+                    pn = exported_recipe
+                    break
+            else:
+                logger.error('Exported metadata does not correspond to data')
+
+            # Update EXTERNALSRC
+            if export_workspace_path:
+                # appends created by 'devtool modify' just need to update the workspace
+                replace_from_file(path, export_workspace_path, config.workspace_path)
+
+                # appends created by 'devtool add' need replacement of exported source tree
+                exported_srctree = export_workspace[pn]['srctree']
+                if exported_srctree:
+                    replace_from_file(path, exported_srctree, os.path.join(config.workspace_path, 'sources', pn))
+
+            # update .devtool_md5 file
+            standard._add_md5(config, pn, path)
+            if pn not in imported:
+                imported.append(pn)
+
+    tar.close()
+
+    logger.info('Imported recipes into workspace %s: %s' % (config.workspace_path, ' '.join(imported)))
+    return 0
+
+def register_commands(subparsers, context):
+    """Register devtool import subcommands"""
+    parser = subparsers.add_parser('import',
+                                   help='Import exported tar archive into workspace',
+                                   description='Import tar archive previously created by "devtool export" into workspace',
+                                   group='advanced')
+    parser.add_argument('file', metavar='FILE', help='Name of the tar archive to import')
+    parser.add_argument('--overwrite', '-o', action="store_true", help='Overwrite files when extracting')
+    parser.set_defaults(func=devimport)
-- 
2.12.0


