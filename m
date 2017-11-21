Return-Path: <amanda.r.brindle@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 469D17869E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 00:40:31 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Nov 2017 16:40:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,430,1505804400"; 
   d="scan'208";a="4604425"
Received: from arbrindl-dev.jf.intel.com ([10.7.199.57])
	by orsmga003.jf.intel.com with ESMTP; 20 Nov 2017 16:40:32 -0800
From: Amanda Brindle <amanda.r.brindle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Nov 2017 16:40:25 -0800
Message-Id: <20dcdcbee3f183d21a738c27010fd51bc6b02b8a.1511224677.git.amanda.r.brindle@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1511224677.git.amanda.r.brindle@intel.com>
References: <cover.1511224677.git.amanda.r.brindle@intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH v2 1/1] scripts/contrib/bbvars.py: Remove dead code
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
X-List-Received-Date: Tue, 21 Nov 2017 00:40:31 -0000

Removed the -m option since this script now searches through all
recipes in the configuration. Also removed dead code, which includes
the functions recipe_bbvars() and collect_bbvars().

Signed-off-by: Amanda Brindle <amanda.r.brindle@intel.com>
---
 scripts/contrib/bbvars.py | 52 ++---------------------------------------------
 1 file changed, 2 insertions(+), 50 deletions(-)

diff --git a/scripts/contrib/bbvars.py b/scripts/contrib/bbvars.py
index 556f652..286b5a9 100755
--- a/scripts/contrib/bbvars.py
+++ b/scripts/contrib/bbvars.py
@@ -32,48 +32,12 @@ scriptpath.add_bitbake_lib_path()
 import bb.tinfoil
 
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
 def bbvar_is_documented(var, documented_vars):
     ''' Check if variable (var) is in the list of documented variables(documented_vars) '''
     if var in documented_vars:
@@ -112,7 +76,6 @@ def bbvar_doctag(var, docconf):
 
 def main():
     docfiles = []
-    metadirs = []
     bbvars = set()
     undocumented = []
     docconf = ""
@@ -136,12 +99,6 @@ def main():
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
@@ -155,11 +112,6 @@ def main():
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
@@ -196,7 +148,7 @@ def main():
             bbvars_update(data)
 
         # Collect variables from all recipes
-        for recipe in tinfoil.all_recipe_files():
+        for recipe in tinfoil.all_recipe_files(variants=False):
             print("Checking %s" % recipe)
             for data in tinfoil.parse_recipe_file(recipe):
                 bbvars_update(data)
-- 
2.7.4


