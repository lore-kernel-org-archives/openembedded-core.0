Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 63EFB7728D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 11:49:14 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Feb 2016 03:49:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,520,1449561600"; d="scan'208";a="897369274"
Received: from gtan23-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.165.53])
	by orsmga001.jf.intel.com with ESMTP; 29 Feb 2016 03:49:13 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Mar 2016 00:48:26 +1300
Message-Id: <3ea2ed54332075568452b3c86e4bd1a7cff3bf5b.1456746435.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456746435.git.paul.eggleton@linux.intel.com>
References: <cover.1456746435.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1456746435.git.paul.eggleton@linux.intel.com>
References: <cover.1456746435.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/4] recipetool: create: add basic support for new npm fetcher/class
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
X-List-Received-Date: Mon, 29 Feb 2016 11:49:14 -0000

Add detection for npm modules and support for extracting the name and
version from package.json as is usually part of an npm module contents.

Note: this will likely only produce a buildable recipe if you use an
npm:// URL; simply pointing to a node.js source repository isn't going
to fetch the module's dependencies. It also doesn't set up the
shrinkwrap/lockdown automatically, so there is some room for improvement
later.

Implements [YOCTO #8690].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create_npm.py | 48 ++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 scripts/lib/recipetool/create_npm.py

diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
new file mode 100644
index 0000000..0e33cc9
--- /dev/null
+++ b/scripts/lib/recipetool/create_npm.py
@@ -0,0 +1,48 @@
+# Recipe creation tool - node.js NPM module support plugin
+#
+# Copyright (C) 2016 Intel Corporation
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
+import logging
+import json
+from recipetool.create import RecipeHandler
+
+logger = logging.getLogger('recipetool')
+
+
+class NpmRecipeHandler(RecipeHandler):
+    def process(self, srctree, classes, lines_before, lines_after, handled, extravalues):
+        if 'buildsystem' in handled:
+            return False
+
+        files = RecipeHandler.checkfiles(srctree, ['package.json'])
+        if files:
+            with open(files[0], 'r') as f:
+                data = json.loads(f.read())
+            if 'name' in data and 'version' in data:
+                extravalues['PN'] = data['name']
+                extravalues['PV'] = data['version']
+                classes.append('npm')
+                handled.append('buildsystem')
+                if 'description' in data:
+                    lines_before.append('SUMMARY = "%s"' % data['description'])
+                if 'homepage' in data:
+                    lines_before.append('HOMEPAGE = "%s"' % data['homepage'])
+                return True
+
+        return False
+
+def register_recipe_handlers(handlers):
+    handlers.append((NpmRecipeHandler(), 60))
-- 
2.5.0


