Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 40CD76E682
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 02:11:15 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 22 Nov 2015 18:11:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,334,1444719600"; d="scan'208";a="692213538"
Received: from echoo1-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.170.181])
	by orsmga003.jf.intel.com with ESMTP; 22 Nov 2015 18:11:10 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 15:09:36 +1300
Message-Id: <9487f4cc17af4fba0ee0314243a37956b4e8a189.1448244474.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1448244474.git.paul.eggleton@linux.intel.com>
References: <cover.1448244474.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1448244474.git.paul.eggleton@linux.intel.com>
References: <cover.1448244474.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 17/18] recipetool: add setvar subcommand
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
X-List-Received-Date: Mon, 23 Nov 2015 02:11:15 -0000

Add a recipetool subcommand "setvar" to set a variable in a file. This
uses our existing logic such that it doesn't matter if the variable is
already set in the recipe, if it's set in the recipe or some inc file,
and if the variable is not currently set that the line setting the
variable gets inserted in the right place in the file.

Implements [YOCTO #7676].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/setvar.py | 75 ++++++++++++++++++++++++++++++++++++++++
 scripts/recipetool               |  4 ++-
 2 files changed, 78 insertions(+), 1 deletion(-)
 create mode 100644 scripts/lib/recipetool/setvar.py

diff --git a/scripts/lib/recipetool/setvar.py b/scripts/lib/recipetool/setvar.py
new file mode 100644
index 0000000..18e3281
--- /dev/null
+++ b/scripts/lib/recipetool/setvar.py
@@ -0,0 +1,75 @@
+# Recipe creation tool - set variable plugin
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
+import sys
+import os
+import argparse
+import glob
+import fnmatch
+import re
+import logging
+import scriptutils
+
+logger = logging.getLogger('recipetool')
+
+tinfoil = None
+plugins = None
+
+def tinfoil_init(instance):
+    global tinfoil
+    tinfoil = instance
+
+def setvar(args):
+    import oe.recipeutils
+
+    if args.delete:
+        if args.value:
+            logger.error('-D/--delete and specifying a value are mutually exclusive')
+            return 1
+        value = None
+    else:
+        if args.value is None:
+            logger.error('You must specify a value if not using -D/--delete')
+            return 1
+        value = args.value
+    varvalues = {args.varname: value}
+
+    if args.recipe_only:
+        patches = [oe.recipeutils.patch_recipe_file(args.recipefile, varvalues, patch=args.patch)]
+    else:
+        rd = oe.recipeutils.parse_recipe(args.recipefile, None, tinfoil.config_data)
+        if not rd:
+            return 1
+        patches = oe.recipeutils.patch_recipe(rd, args.recipefile, varvalues, patch=args.patch)
+    if args.patch:
+        for patch in patches:
+            for line in patch:
+                sys.stdout.write(line)
+    return 0
+
+
+def register_command(subparsers):
+    parser_setvar = subparsers.add_parser('setvar',
+                                          help='Set a variable within a recipe',
+                                          description='Adds/updates the value a variable is set to in a recipe')
+    parser_setvar.add_argument('recipefile', help='Recipe file to update')
+    parser_setvar.add_argument('varname', help='Variable name to set')
+    parser_setvar.add_argument('value', nargs='?', help='New value to set the variable to')
+    parser_setvar.add_argument('--recipe-only', '-r', help='Do not set variable in any include file if present', action='store_true')
+    parser_setvar.add_argument('--patch', '-p', help='Create a patch to make the change instead of modifying the recipe', action='store_true')
+    parser_setvar.add_argument('--delete', '-D', help='Delete the specified value instead of setting it', action='store_true')
+    parser_setvar.set_defaults(func=setvar)
diff --git a/scripts/recipetool b/scripts/recipetool
index 87fb35e..4af0bfb 100755
--- a/scripts/recipetool
+++ b/scripts/recipetool
@@ -34,7 +34,7 @@ plugins = []
 def tinfoil_init(parserecipes):
     import bb.tinfoil
     import logging
-    tinfoil = bb.tinfoil.Tinfoil()
+    tinfoil = bb.tinfoil.Tinfoil(tracking=True)
     tinfoil.prepare(not parserecipes)
     tinfoil.logger.setLevel(logger.getEffectiveLevel())
     return tinfoil
@@ -96,7 +96,9 @@ def main():
 
     try:
         if getattr(args, 'parserecipes', False):
+            tinfoil.config_data.disableTracking()
             tinfoil.parseRecipes()
+            tinfoil.config_data.enableTracking()
         ret = args.func(args)
     except bb.BBHandledException:
         ret = 1
-- 
2.1.0


