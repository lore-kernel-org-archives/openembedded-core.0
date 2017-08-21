Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2529C7823B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 05:41:11 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Aug 2017 22:41:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,407,1498546800"; d="scan'208";a="1208228352"
Received: from ssen-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.129.109])
	by fmsmga002.fm.intel.com with ESMTP; 20 Aug 2017 22:41:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Aug 2017 17:39:47 +1200
Message-Id: <d0f0ccec67f2a5efa928ff6e83551f4dec22a1ff.1503293342.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1503293342.git.paul.eggleton@linux.intel.com>
References: <cover.1503293342.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 08/10] devtool: import: new plugin to import the devtool workspace
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
X-List-Received-Date: Mon, 21 Aug 2017 05:41:11 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Takes a tar archive created by 'devtool export' and imports (untars) it
into the workspace. Currently the whole tar archive is imported, there
is no way to limit what is imported.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=10510

[YOCTO #10510]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/__init__.py |  36 ++++++++++
 scripts/lib/devtool/import.py   | 144 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 180 insertions(+)
 create mode 100644 scripts/lib/devtool/import.py

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index b231e46..14170cb 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -261,3 +261,39 @@ def get_bbclassextend_targets(recipefile, pn):
                 targets.append('%s-%s' % (pn, variant))
     return targets
 
+def replace_from_file(path, old, new):
+    """Replace strings on a file"""
+
+    def read_file(path):
+        data = None
+        with open(path) as f:
+            data = f.read()
+        return data
+
+    def write_file(path, data):
+        if data is None:
+            return
+        wdata = data.rstrip() + "\n"
+        with open(path, "w") as f:
+            f.write(wdata)
+
+    # In case old is None, return immediately
+    if old is None:
+        return
+    try:
+        rdata = read_file(path)
+    except IOError as e:
+        # if file does not exit, just quit, otherwise raise an exception
+        if e.errno == errno.ENOENT:
+            return
+        else:
+            raise
+
+    old_contents = rdata.splitlines()
+    new_contents = []
+    for old_content in old_contents:
+        try:
+            new_contents.append(old_content.replace(old, new))
+        except ValueError:
+            pass
+    write_file(path, "\n".join(new_contents))
diff --git a/scripts/lib/devtool/import.py b/scripts/lib/devtool/import.py
new file mode 100644
index 0000000..c13a180
--- /dev/null
+++ b/scripts/lib/devtool/import.py
@@ -0,0 +1,144 @@
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
+from devtool import standard, setup_tinfoil, replace_from_file, DevtoolError
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
+        raise DevtoolError('Tar archive %s does not exist. Export your workspace using "devtool export"' % args.file)
+
+    with tarfile.open(args.file) as tar:
+        # Get exported metadata
+        export_workspace_path = export_workspace = None
+        try:
+            metadata = tar.getmember(export.metadata)
+        except KeyError as ke:
+            raise DevtoolError('The export metadata file created by "devtool export" was not found. "devtool import" can only be used to import tar archives created by "devtool export".')
+
+        tar.extract(metadata)
+        with open(metadata.name) as fdm:
+            export_workspace_path, export_workspace = json.load(fdm)
+        os.unlink(metadata.name)
+
+        members = tar.getmembers()
+
+        # Get appends and recipes from the exported archive, these
+        # will be needed to find out those appends without corresponding
+        # recipe pair
+        append_fns, recipe_fns = set(), set()
+        for member in members:
+            if member.name.startswith('appends'):
+                append_fns.add(get_pn(member.name))
+            elif member.name.startswith('recipes'):
+                recipe_fns.add(get_pn(member.name))
+
+        # Setup tinfoil, get required data and shutdown
+        tinfoil = setup_tinfoil(config_only=False, basepath=basepath)
+        try:
+            current_fns = [os.path.basename(recipe[0]) for recipe in tinfoil.cooker.recipecaches[''].pkg_fn.items()]
+        finally:
+            tinfoil.shutdown()
+
+        # Find those appends that do not have recipes in current metadata
+        non_importables = []
+        for fn in append_fns - recipe_fns:
+            # Check on current metadata (covering those layers indicated in bblayers.conf)
+            for current_fn in current_fns:
+                if fnmatch.fnmatch(current_fn, '*' + fn.replace('%', '') + '*'):
+                    break
+            else:
+                non_importables.append(fn)
+                logger.warn('No recipe to append %s.bbapppend, skipping' % fn)
+
+        # Extract
+        imported = []
+        for member in members:
+            if member.name == export.metadata:
+                continue
+
+            for nonimp in non_importables:
+                pn = nonimp.split('_')[0]
+                # do not extract data from non-importable recipes or metadata
+                if member.name.startswith('appends/%s' % nonimp) or \
+                        member.name.startswith('recipes/%s' % nonimp) or \
+                        member.name.startswith('sources/%s' % pn):
+                    break
+            else:
+                path = os.path.join(config.workspace_path, member.name)
+                if os.path.exists(path):
+                    # by default, no file overwrite is done unless -o is given by the user
+                    if args.overwrite:
+                        try:
+                            tar.extract(member, path=config.workspace_path)
+                        except PermissionError as pe:
+                            logger.warn(pe)
+                    else:
+                        logger.warn('File already present. Use --overwrite/-o to overwrite it: %s' % member.name)
+                        continue
+                else:
+                    tar.extract(member, path=config.workspace_path)
+
+                # Update EXTERNALSRC and the devtool md5 file
+                if member.name.startswith('appends'):
+                    if export_workspace_path:
+                        # appends created by 'devtool modify' just need to update the workspace
+                        replace_from_file(path, export_workspace_path, config.workspace_path)
+
+                        # appends created by 'devtool add' need replacement of exported source tree
+                        pn = get_pn(member.name).split('_')[0]
+                        exported_srctree = export_workspace[pn]['srctree']
+                        if exported_srctree:
+                            replace_from_file(path, exported_srctree, os.path.join(config.workspace_path, 'sources', pn))
+
+                    standard._add_md5(config, pn, path)
+                    imported.append(pn)
+
+    if imported:
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
2.9.5


