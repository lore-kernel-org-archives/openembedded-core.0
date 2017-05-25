Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id CD44C7816C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 21:31:57 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 May 2017 14:31:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,393,1491289200"; d="scan'208";a="91509279"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by orsmga004.jf.intel.com with ESMTP; 25 May 2017 14:31:52 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 May 2017 14:31:48 -0700
Message-Id: <74570ed1b829c9c416cffa5547b673ea6e3ef262.1495747168.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1495747168.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1495747168.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 2/2] import: new plugin to import the devtool workspace
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

Takes a tar archive created by 'devtool export' and export it (untar) to
workspace. By default, the whole tar archive is imported, thus there is no
way to limit what is imported.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=10510

[YOCTO #10510]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 scripts/lib/devtool/import.py | 99 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 scripts/lib/devtool/import.py

diff --git a/scripts/lib/devtool/import.py b/scripts/lib/devtool/import.py
new file mode 100644
index 00000000000..ff770c321f4
--- /dev/null
+++ b/scripts/lib/devtool/import.py
@@ -0,0 +1,99 @@
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
+from devtool import standard
+
+logger = logging.getLogger('devtool')
+
+def devimport(args, config, basepath, workspace):
+    """Entry point for the devtool 'import' subcommand"""
+    if not os.path.exists(args.name):
+        logger.error('Tar archive %s does not exist. The expected archive should be created with "devtool export"')
+        return 1
+
+    # match exported workspace folders
+    prog = re.compile('recipes|appends|sources')
+
+    def get_prefix(name):
+        """Prefix the workspace path or $HOME to the member name"""
+        _prefix = ""
+        if prog.match(name):
+            _prefix = config.workspace_path + '/'
+        else:
+            if not name.startswith('/'):
+                _prefix = os.environ['HOME'] + '/'
+
+        return _prefix, _prefix + name
+
+    # include the default archiver filename if missing
+    name = args.name
+    if os.path.isdir(name):
+        if name[-1] != '/':
+            name = name + '/'
+        name = name + default_arcname
+
+    if not os.path.exists(name):
+        logger.error('Tar archive %s does not exists. Export your workspace using "devtool export"')
+        return 1
+
+    included = []
+    with tarfile.open(name) as tar:
+        for member in tar.getmembers():
+            prefix, path = get_prefix(member.name)
+            if os.path.exists(path):
+                if args.force:
+                    try:
+                        tar.extract(member, path=prefix)
+                    except PermissionError as pe:
+                        logger.warn(pe)
+                else:
+                    logger.warn('File already present, add -f to overwrite: %s' % member.name)
+            else:
+                tar.extract(member, path=prefix)
+
+            # md5 creation just for recipes or appends
+            if member.name.startswith('recipes') or member.name.startswith('appends'):
+                dirpath, recipe = os.path.split(member.name)
+                recipename = ""
+                for sep in "_ .".split():
+                    if sep in recipe:
+                        recipename = recipe.split(sep)[0]
+                        break
+                if not recipename:
+                    logger.warn('Recipe name could not be extracted from %s' % member.name)
+                    recipename = recipe
+
+                standard._add_md5(config, recipename, path)
+                if recipename not in included:
+                    included.append(recipename)
+
+    logger.info('Imported recipes into workspace %s: %s' % (config.workspace_path, included))
+
+def register_commands(subparsers, context):
+    """Register devtool import subcommands"""
+    parser = subparsers.add_parser('import',
+                                   help='Import tar archive into workspace',
+                                   description='Import previously created tar archive into the workspace',
+                                   group='advanced')
+    parser.add_argument('--name', '-n', default='workspace.tar', help='Name of the tar archive to import')
+    parser.add_argument('--force', '-f', action="store_true", help='Overwrite previous files')
+    parser.set_defaults(func=devimport)
-- 
2.12.0


