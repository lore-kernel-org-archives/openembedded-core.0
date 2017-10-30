Return-Path: <amanda.r.brindle@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id AEA1E71B40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Oct 2017 21:58:10 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 30 Oct 2017 14:58:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,321,1505804400"; d="scan'208";a="144025058"
Received: from arbrindl-dev.jf.intel.com ([10.7.197.61])
	by orsmga004.jf.intel.com with ESMTP; 30 Oct 2017 14:57:58 -0700
From: Amanda Brindle <amanda.r.brindle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Oct 2017 14:57:04 -0700
Message-Id: <57ca9a160975cb564d534c0672a62354d19866ef.1509400153.git.amanda.r.brindle@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1509400153.git.amanda.r.brindle@intel.com>
References: <cover.1509400153.git.amanda.r.brindle@intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 1/1] scripts/contrib/bbvars.py: Rewrite to use tinfoil
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
X-List-Received-Date: Mon, 30 Oct 2017 21:58:10 -0000

Use tinfoil to collect all variable names globally and in each recipe.

No longer show the count of variables if they are undocumented.

Fixes [YOCTO #2086]

Signed-off-by: Amanda Brindle <amanda.r.brindle@intel.com>
---
 scripts/contrib/bbvars.py | 90 ++++++++++++++++++++++++++++++++++-------------
 1 file changed, 66 insertions(+), 24 deletions(-)

diff --git a/scripts/contrib/bbvars.py b/scripts/contrib/bbvars.py
index d8d0594..556f652 100755
--- a/scripts/contrib/bbvars.py
+++ b/scripts/contrib/bbvars.py
@@ -23,6 +23,14 @@ import os
 import os.path
 import re
 
+# Set up sys.path to let us import tinfoil
+scripts_path = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
+lib_path = scripts_path + '/lib'
+sys.path.insert(0, lib_path)
+import scriptpath
+scriptpath.add_bitbake_lib_path()
+import bb.tinfoil
+
 def usage():
     print('Usage: %s -d FILENAME [-d FILENAME]* -m METADIR [-m MATADIR]*' % os.path.basename(sys.argv[0]))
     print('  -d FILENAME         documentation file to search')
@@ -66,19 +74,23 @@ def collect_bbvars(metadir):
                         bbvars[key] = 1
     return bbvars
 
-def bbvar_is_documented(var, docfiles):
-    prog = re.compile(".*($|[^A-Z_])%s([^A-Z_]|$)" % (var))
-    for doc in docfiles:
-        try:
-            f = open(doc)
-        except IOError as err:
-            print('WARNING: Failed to open doc ', doc)
-            print(err.args[1])
-        for line in f:
-            if prog.match(line):
-                return True
-        f.close()
-    return False
+def bbvar_is_documented(var, documented_vars):
+    ''' Check if variable (var) is in the list of documented variables(documented_vars) '''
+    if var in documented_vars:
+        return True
+    else:
+        return False
+
+def collect_documented_vars(docfiles):
+    ''' Walk the docfiles and collect the documented variables '''
+    documented_vars = []
+    prog = re.compile(".*($|[^A-Z_])<glossentry id=\'var-")
+    var_prog = re.compile('<glossentry id=\'var-(.*)\'>')
+    for d in docfiles:
+        with open(d) as f:
+            documented_vars += var_prog.findall(f.read())
+
+    return documented_vars
 
 def bbvar_doctag(var, docconf):
     prog = re.compile('^%s\[doc\] *= *"(.*)"' % (var))
@@ -101,7 +113,7 @@ def bbvar_doctag(var, docconf):
 def main():
     docfiles = []
     metadirs = []
-    bbvars = {}
+    bbvars = set()
     undocumented = []
     docconf = ""
     onlydoctags = False
@@ -153,33 +165,63 @@ def main():
         usage()
         sys.exit(7)
 
-    # Collect all the variable names from the recipes in the metadirs
-    for m in metadirs:
-        for key,cnt in collect_bbvars(m).items():
-            if key in bbvars:
-                bbvars[key] = bbvars[key] + cnt
+    prog = re.compile("^[^a-z]*$")
+    with bb.tinfoil.Tinfoil() as tinfoil:
+        tinfoil.prepare(config_only=False)
+        parser = bb.codeparser.PythonParser('parser', None)
+        datastore = tinfoil.config_data
+
+        def bbvars_update(data):
+            if prog.match(data):
+                bbvars.add(data)
+            if tinfoil.config_data.getVarFlag(data, 'python'):
+                try:
+                    parser.parse_python(tinfoil.config_data.getVar(data))
+                except bb.data_smart.ExpansionError:
+                    pass
+                for var in parser.references:
+                    if prog.match(var):
+                        bbvars.add(var)
             else:
-                bbvars[key] = cnt
+                try:
+                    expandedVar = datastore.expandWithRefs(datastore.getVar(data, False), data)
+                    for var in expandedVar.references:
+                        if prog.match(var):
+                            bbvars.add(var)
+                except bb.data_smart.ExpansionError:
+                    pass
+
+        # Use tinfoil to collect all the variable names globally
+        for data in datastore:
+            bbvars_update(data)
+
+        # Collect variables from all recipes
+        for recipe in tinfoil.all_recipe_files():
+            print("Checking %s" % recipe)
+            for data in tinfoil.parse_recipe_file(recipe):
+                bbvars_update(data)
+
+    documented_vars = collect_documented_vars(docfiles)
 
     # Check each var for documentation
     varlen = 0
-    for v in bbvars.keys():
+    for v in bbvars:
         if len(v) > varlen:
             varlen = len(v)
-        if not bbvar_is_documented(v, docfiles):
+        if not bbvar_is_documented(v, documented_vars):
             undocumented.append(v)
     undocumented.sort()
     varlen = varlen + 1
 
     # Report all undocumented variables
     print('Found %d undocumented bb variables (out of %d):' % (len(undocumented), len(bbvars)))
-    header = '%s%s%s' % (str("VARIABLE").ljust(varlen), str("COUNT").ljust(6), str("DOCTAG").ljust(7))
+    header = '%s%s' % (str("VARIABLE").ljust(varlen), str("DOCTAG").ljust(7))
     print(header)
     print(str("").ljust(len(header), '='))
     for v in undocumented:
         doctag = bbvar_doctag(v, docconf)
         if not onlydoctags or not doctag == "":
-            print('%s%s%s' % (v.ljust(varlen), str(bbvars[v]).ljust(6), doctag))
+            print('%s%s' % (v.ljust(varlen), doctag))
 
 
 if __name__ == "__main__":
-- 
2.7.4


