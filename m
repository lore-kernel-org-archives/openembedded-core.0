Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 6BC8378543
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 01:56:54 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 08 Nov 2017 17:56:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,367,1505804400"; d="scan'208";a="171401072"
Received: from skanwarx-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.73.22])
	by orsmga005.jf.intel.com with ESMTP; 08 Nov 2017 17:56:53 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Nov 2017 14:55:15 +1300
Message-Id: <89f94a910ca76fb2487e308060c5edf1ddfd77c7.1510192329.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1510192329.git.paul.eggleton@linux.intel.com>
References: <cover.1510192329.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 14/24] devtool: upgrade: handle recipes that use named SRC_URI checksums
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
X-List-Received-Date: Thu, 09 Nov 2017 01:56:54 -0000

devtool upgrade did not properly handle setting SRC_URI checksums for
recipes that use named SRC_URI entries and also use those names in the
SRC_URI checksums. A further complication was where the name contained
an expression that changed with the version e.g. ${PV} (probably quite
rare, but the dnsmasq recipe in meta-networking is currently one such
recipe.) All of these are now handled properly.

Additionally, drop the _get_checksums() function that wasn't being
called from anywhere in the code.

Note that this now turns nowrap_vars in recipeutils.py to be a list of
regexes, hence things such as [ and ] need to be appropriately escaped.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/recipeutils.py     | 13 +++++++++--
 scripts/lib/devtool/upgrade.py | 53 +++++++++++++++++++++++++++++++-----------
 2 files changed, 51 insertions(+), 15 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index cab8e40..cab94b1 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -22,7 +22,7 @@ from collections import OrderedDict, defaultdict
 # Help us to find places to insert values
 recipe_progression = ['SUMMARY', 'DESCRIPTION', 'HOMEPAGE', 'BUGTRACKER', 'SECTION', 'LICENSE', 'LICENSE_FLAGS', 'LIC_FILES_CHKSUM', 'PROVIDES', 'DEPENDS', 'PR', 'PV', 'SRCREV', 'SRCPV', 'SRC_URI', 'S', 'do_fetch()', 'do_unpack()', 'do_patch()', 'EXTRA_OECONF', 'EXTRA_OECMAKE', 'EXTRA_OESCONS', 'do_configure()', 'EXTRA_OEMAKE', 'do_compile()', 'do_install()', 'do_populate_sysroot()', 'INITSCRIPT', 'USERADD', 'GROUPADD', 'PACKAGES', 'FILES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RPROVIDES', 'RREPLACES', 'RCONFLICTS', 'ALLOW_EMPTY', 'populate_packages()', 'do_package()', 'do_deploy()']
 # Variables that sometimes are a bit long but shouldn't be wrapped
-nowrap_vars = ['SUMMARY', 'HOMEPAGE', 'BUGTRACKER', 'SRC_URI[md5sum]', 'SRC_URI[sha256sum]']
+nowrap_vars = ['SUMMARY', 'HOMEPAGE', 'BUGTRACKER', 'SRC_URI\[(.+\.)?md5sum\]', 'SRC_URI\[(.+\.)?sha256sum\]']
 list_vars = ['SRC_URI', 'LIC_FILES_CHKSUM']
 meta_vars = ['SUMMARY', 'DESCRIPTION', 'HOMEPAGE', 'BUGTRACKER', 'SECTION']
 
@@ -142,6 +142,10 @@ def patch_recipe_lines(fromlines, values, trailing_newline=True):
     else:
         newline = ''
 
+    nowrap_vars_res = []
+    for item in nowrap_vars:
+        nowrap_vars_res.append(re.compile('^%s$' % item))
+
     recipe_progression_res = []
     recipe_progression_restrs = []
     for item in recipe_progression:
@@ -174,7 +178,12 @@ def patch_recipe_lines(fromlines, values, trailing_newline=True):
             return
         rawtext = '%s = "%s"%s' % (name, values[name], newline)
         addlines = []
-        if name in nowrap_vars:
+        nowrap = False
+        for nowrap_re in nowrap_vars_res:
+            if nowrap_re.match(name):
+                nowrap = True
+                break
+        if nowrap:
             addlines.append(rawtext)
         elif name in list_vars:
             splitvalue = split_var_value(values[name], assignment=False)
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index ab7acd1..6d51958 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -55,17 +55,6 @@ def _copy_source_code(orig, dest):
         dest_path = os.path.join(dest, path)
         shutil.move(os.path.join(orig, path), dest_path)
 
-def _get_checksums(rf):
-    import re
-    checksums = {}
-    with open(rf) as f:
-        for line in f:
-            for cs in ['md5sum', 'sha256sum']:
-                m = re.match("^SRC_URI\[%s\].*=.*\"(.*)\"" % cs, line)
-                if m:
-                    checksums[cs] = m.group(1)
-    return checksums
-
 def _remove_patch_dirs(recipefolder):
     for root, dirs, files in os.walk(recipefolder):
         for d in dirs:
@@ -353,9 +342,47 @@ def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, workspace, tinfoil
 
     newvalues['PR'] = None
 
+    # Work out which SRC_URI entries have changed in case the entry uses a name
+    crd = rd.createCopy()
+    crd.setVar('PV', newpv)
+    for var, value in newvalues.items():
+        crd.setVar(var, value)
+    old_src_uri = (rd.getVar('SRC_URI') or '').split()
+    new_src_uri = (crd.getVar('SRC_URI') or '').split()
+    newnames = []
+    addnames = []
+    for newentry in new_src_uri:
+        _, _, _, _, _, params = bb.fetch2.decodeurl(newentry)
+        if 'name' in params:
+            newnames.append(params['name'])
+            if newentry not in old_src_uri:
+                addnames.append(params['name'])
+    # Find what's been set in the original recipe
+    oldnames = []
+    noname = False
+    for varflag in rd.getVarFlags('SRC_URI'):
+        if varflag.endswith(('.md5sum', '.sha256sum')):
+            name = varflag.rsplit('.', 1)[0]
+            if name not in oldnames:
+                oldnames.append(name)
+        elif varflag in ['md5sum', 'sha256sum']:
+            noname = True
+    # Even if SRC_URI has named entries it doesn't have to actually use the name
+    if noname and addnames and addnames[0] not in oldnames:
+        addnames = []
+    # Drop any old names (the name actually might include ${PV})
+    for name in oldnames:
+        if name not in newnames:
+            newvalues['SRC_URI[%s.md5sum]' % name] = None
+            newvalues['SRC_URI[%s.sha256sum]' % name] = None
+
     if md5 and sha256:
-        newvalues['SRC_URI[md5sum]'] = md5
-        newvalues['SRC_URI[sha256sum]'] = sha256
+        if addnames:
+            nameprefix = '%s.' % addnames[0]
+        else:
+            nameprefix = ''
+        newvalues['SRC_URI[%smd5sum]' % nameprefix] = md5
+        newvalues['SRC_URI[%ssha256sum]' % nameprefix] = sha256
 
     rd = tinfoil.parse_recipe_file(fullpath, False)
     oe.recipeutils.patch_recipe(rd, fullpath, newvalues)
-- 
2.9.5


