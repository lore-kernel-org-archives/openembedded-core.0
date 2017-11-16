Return-Path: <amanda.r.brindle@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 496C17869D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 00:20:53 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Nov 2017 16:20:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,401,1505804400"; d="scan'208";a="149923469"
Received: from arbrindl-dev.jf.intel.com ([10.7.199.57])
	by orsmga004.jf.intel.com with ESMTP; 15 Nov 2017 16:20:55 -0800
From: Amanda Brindle <amanda.r.brindle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Nov 2017 16:21:04 -0800
Message-Id: <ca3937bd8e776363d8dd58348b8f220c230222f8.1510791278.git.amanda.r.brindle@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1510791278.git.amanda.r.brindle@intel.com>
References: <cover.1510791278.git.amanda.r.brindle@intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH v2 1/1] scripts/contrib/bbvars.py: Rewrite to use tinfoil
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
X-List-Received-Date: Thu, 16 Nov 2017 00:20:53 -0000

Use tinfoil to collect all variable names globally and in each recipe.
This will capture more variable references than parsing manually.

With the use of tinfoil, this script can no longer distinguish unique
references to each variable, so it's no longer showing the count of
undocumented variables.

Removed the -m option since this script now searches through all recipes
in the configuration.

Fixes [YOCTO #2086]

Signed-off-by: Amanda Brindle <amanda.r.brindle@intel.com>
---
 scripts/contrib/bbvars.py | 140 ++++++++++++++++++++++------------------------
 1 file changed, 67 insertions(+), 73 deletions(-)

diff --git a/scripts/contrib/bbvars.py b/scripts/contrib/bbvars.py
index d8d0594..286b5a9 100755
--- a/scripts/contrib/bbvars.py
+++ b/scripts/contrib/bbvars.py
@@ -23,62 +23,38 @@ import os
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
-    print('Usage: %s -d FILENAME [-d FILENAME]* -m METADIR [-m MATADIR]*' % os.path.basename(sys.argv[0]))
+    print('Usage: %s -d FILENAME [-d FILENAME]*' % os.path.basename(sys.argv[0]))
     print('  -d FILENAME         documentation file to search')
     print('  -h, --help          display this help and exit')
-    print('  -m METADIR          meta directory to search for recipes')
     print('  -t FILENAME         documentation config file (for doc tags)')
     print('  -T                  Only display variables with doc tags (requires -t)')
 
-def recipe_bbvars(recipe):
-    ''' Return a unique set of every bbvar encountered in the recipe '''
-    prog = re.compile("[A-Z_]+")
-    vset = set()
-    try:
-        r = open(recipe)
-    except IOError as err:
-        print('WARNING: Failed to open recipe ', recipe)
-        print(err.args[1])
-
-    for line in r:
-        # Strip any comments from the line
-        line = line.rsplit('#')[0]
-        vset = vset.union(set(prog.findall(line)))
-    r.close()
-
-    bbvars = {}
-    for v in vset:
-        bbvars[v] = 1
-
-    return bbvars
-
-def collect_bbvars(metadir):
-    ''' Walk the metadir and collect the bbvars from each recipe found '''
-    bbvars = {}
-    for root,dirs,files in os.walk(metadir):
-        for name in files:
-            if name.find(".bb") >= 0:
-                for key in recipe_bbvars(os.path.join(root,name)).keys():
-                    if key in bbvars:
-                        bbvars[key] = bbvars[key] + 1
-                    else:
-                        bbvars[key] = 1
-    return bbvars
-
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
@@ -100,8 +76,7 @@ def bbvar_doctag(var, docconf):
 
 def main():
     docfiles = []
-    metadirs = []
-    bbvars = {}
+    bbvars = set()
     undocumented = []
     docconf = ""
     onlydoctags = False
@@ -124,12 +99,6 @@ def main():
             else:
                 print('ERROR: documentation file %s is not a regular file' % a)
                 sys.exit(3)
-        elif o == '-m':
-            if os.path.isdir(a):
-                metadirs.append(a)
-            else:
-                print('ERROR: meta directory %s is not a directory' % a)
-                sys.exit(4)
         elif o == "-t":
             if os.path.isfile(a):
                 docconf = a
@@ -143,43 +112,68 @@ def main():
         usage()
         sys.exit(5)
 
-    if len(metadirs) == 0:
-        print('ERROR: no metadir specified')
-        usage()
-        sys.exit(6)
-
     if onlydoctags and docconf == "":
         print('ERROR: no docconf specified')
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
+        for recipe in tinfoil.all_recipe_files(variants=False):
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


