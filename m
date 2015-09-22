Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AA3E876DFF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 16:22:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 22 Sep 2015 09:22:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,573,1437462000"; d="scan'208";a="810520533"
Received: from therrane-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.19.23])
	by fmsmga002.fm.intel.com with ESMTP; 22 Sep 2015 09:22:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2015 17:21:41 +0100
Message-Id: <9e57ee0b3aa45b8b6a33531b7804d92c8d7bf37a.1442934838.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 27/27] devtool: add search command
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
X-List-Received-Date: Tue, 22 Sep 2015 16:22:22 -0000

Adds a subcommand to search to find the target recipe name providing
some file or capability. This is implemented by searching on recipe
name, package name, description, package contents (file names), and
runtime file provides. For example:

$ devtool search libGL
mesa

$ devtool search X11
xextproto
libxxf86vm
xf86driproto
xf86vidmodeproto
libxfixes
xproto
libx11
...

$ devtool search /bin/sed
busybox
sed

This is particularly useful within the extensible SDK but is also made
available in devtool alongside the build system.

Note of course that because this searches pkgdata, useful results depend
upon do_packagedata(_setscene) having executed for the recipe being
searched for.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/search.py | 80 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 scripts/lib/devtool/search.py

diff --git a/scripts/lib/devtool/search.py b/scripts/lib/devtool/search.py
new file mode 100644
index 0000000..e6ae922
--- /dev/null
+++ b/scripts/lib/devtool/search.py
@@ -0,0 +1,80 @@
+# Development tool - search command plugin
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
+"""Devtool search plugin"""
+
+import os
+import bb
+import logging
+import argparse
+import re
+from devtool import setup_tinfoil, DevtoolError
+
+logger = logging.getLogger('devtool')
+
+def search(args, config, basepath, workspace):
+    """Entry point for the devtool 'search' subcommand"""
+
+    tinfoil = setup_tinfoil(config_only=True)
+    pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR', True)
+    tinfoil.shutdown()
+
+    keyword_rc = re.compile(args.keyword)
+
+    for fn in os.listdir(pkgdata_dir):
+        pfn = os.path.join(pkgdata_dir, fn)
+        if not os.path.isfile(pfn):
+            continue
+
+        packages = []
+        match = False
+        if keyword_rc.search(fn):
+            match = True
+
+        if not match:
+            with open(pfn, 'r') as f:
+                for line in f:
+                    if line.startswith('PACKAGES:'):
+                        packages = line.split(':', 1)[1].strip().split()
+
+            for pkg in packages:
+                if keyword_rc.search(pkg):
+                    match = True
+                    break
+                if os.path.exists(os.path.join(pkgdata_dir, 'runtime', pkg + '.packaged')):
+                    with open(os.path.join(pkgdata_dir, 'runtime', pkg), 'r') as f:
+                        for line in f:
+                            if ': ' in line:
+                                splitline = line.split(':', 1)
+                                key = splitline[0]
+                                value = splitline[1].strip()
+                            if key in ['PKG_%s' % pkg, 'DESCRIPTION', 'FILES_INFO'] or key.startswith('FILERPROVIDES_'):
+                                if keyword_rc.search(value):
+                                    match = True
+                                    break
+
+        if match:
+            print(fn)
+
+    return 0
+
+def register_commands(subparsers, context):
+    """Register devtool subcommands from this plugin"""
+    parser_search = subparsers.add_parser('search', help='Search available recipes',
+                                            description='Searches for available target recipes. Matches on recipe name, package name, description and installed files, and prints the recipe name on match.')
+    parser_search.add_argument('keyword', help='Keyword to search for (regular expression syntax allowed)')
+    parser_search.set_defaults(func=search)
-- 
2.1.0


