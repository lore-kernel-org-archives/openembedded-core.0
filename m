Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1EC317820C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 16:41:10 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Jun 2017 09:41:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,281,1496127600"; d="scan'208";a="873115063"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by FMSMGA003.fm.intel.com with ESMTP; 29 Jun 2017 09:41:09 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Jun 2017 09:40:52 -0700
Message-Id: <cdf705fd2dab5736cca759eadf83789d8166d081.1498754105.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1498754105.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1497983224.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<cover.1498754105.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH v4 4/4] import: new plugin to import the devtool workspace
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
X-List-Received-Date: Thu, 29 Jun 2017 16:41:11 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Takes a tar archive created by 'devtool export' and export it (untar) to
workspace. By default, the whole tar archive is imported, thus there is no
way to limit what is imported.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=10510

[YOCTO #10510]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 scripts/lib/devtool/import.py | 150 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 150 insertions(+)
 create mode 100644 scripts/lib/devtool/import.py

diff --git a/scripts/lib/devtool/import.py b/scripts/lib/devtool/import.py
new file mode 100644
index 0000000000..21eb90820b
--- /dev/null
+++ b/scripts/lib/devtool/import.py
@@ -0,0 +1,150 @@
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
+import collections
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
+    def get_pn(name):
+        """ Returns the filename of a workspace recipe/append"""
+        metadata = name.split('/')[-1]
+        fn, _ = os.path.splitext(metadata)
+        return fn
+
+    if not os.path.exists(args.file):
+        logger.error('Tar archive %s does not exist. Export your workspace using "devtool export"' % args.file)
+        return 1
+
+    tar = tarfile.open(args.file)
+
+    # Get exported metadata
+    export_workspace_path = export_workspace = None
+    try:
+        metadata = tar.getmember(export.metadata)
+    except KeyError as ke:
+        logger.error('The export metadata file created by "devtool export" was not found')
+        logger.error('The devtool import plugin can only be used to import tar archives created by devtool export')
+        return 1
+
+    tar.extract(metadata)
+    with open(metadata.name) as fdm:
+        export_workspace_path, export_workspace = json.load(fdm)
+    os.unlink(metadata.name)
+
+    members = tar.getmembers()
+
+    # Get appends and recipes from the exported archive, these
+    # will be needed to find out those appends without corresponding
+    # recipe pair
+    append_fns, recipe_fns = set(), set()
+    for member in members:
+        if member.name.startswith('appends'):
+            append_fns.add(get_pn(member.name))
+        elif member.name.startswith('recipes'):
+            recipe_fns.add(get_pn(member.name))
+
+    # Setup tinfoil, get required data and shutdown
+    tinfoil = setup_tinfoil(config_only=False, basepath=basepath)
+    try:
+        current_fns = [os.path.basename(recipe[0]) for recipe in tinfoil.cooker.recipecaches[''].pkg_fn.items()]
+    finally:
+        tinfoil.shutdown()
+
+    # Find those appends that do not have recipes in current metadata
+    non_importables = []
+    for fn in append_fns - recipe_fns:
+        # Check on current metadata (covering those layers indicated in bblayers.conf)
+        for current_fn in current_fns:
+            if fnmatch.fnmatch(current_fn, '*' + fn.replace('%', '') + '*'):
+                break
+        else:
+            non_importables.append(fn)
+            logger.warn('No recipe to append %s.bbapppend, skipping' % fn)
+
+    # Extract
+    imported = []
+    for member in members:
+        if member.name == export.metadata:
+            continue
+
+        for nonimp in non_importables:
+            pn = nonimp.split('_')[0]
+            # do not extract data from non-importable recipes or metadata
+            if member.name.startswith('appends/%s' % nonimp) or \
+               member.name.startswith('recipes/%s' % nonimp) or \
+               member.name.startswith('sources/%s' % pn):
+               break
+        else:
+            path = os.path.join(config.workspace_path, member.name)
+            if os.path.exists(path):
+                # by default, no file overwrite is done unless -o is given by the user
+                if args.overwrite:
+                    try:
+                        tar.extract(member, path=config.workspace_path)
+                    except PermissionError as pe:
+                        logger.warn(pe)
+                else:
+                    logger.warn('File already present. Use --overwrite/-o to overwrite it: %s' % member.name)
+                    continue
+            else:
+                tar.extract(member, path=config.workspace_path)
+
+            # Update EXTERNALSRC and the devtool md5 file
+            if member.name.startswith('appends'):
+                if export_workspace_path:
+                    # appends created by 'devtool modify' just need to update the workspace
+                    replace_from_file(path, export_workspace_path, config.workspace_path)
+
+                    # appends created by 'devtool add' need replacement of exported source tree
+                    pn = get_pn(member.name).split('_')[0]
+                    exported_srctree = export_workspace[pn]['srctree']
+                    if exported_srctree:
+                        replace_from_file(path, exported_srctree, os.path.join(config.workspace_path, 'sources', pn))
+
+                standard._add_md5(config, pn, path)
+                imported.append(pn)
+
+    tar.close()
+
+    if  imported:
+        logger.info('Imported recipes into workspace %s: %s' % (config.workspace_path, ', '.join(imported)))
+    else:
+        logger.warn('No recipes imported into the workspace')
+
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


