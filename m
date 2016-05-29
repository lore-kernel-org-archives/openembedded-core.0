Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 1F6E077116
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 May 2016 22:21:37 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 29 May 2016 15:21:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,386,1459839600"; d="scan'208";a="976886730"
Received: from jialelim-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.139.83])
	by fmsmga001.fm.intel.com with ESMTP; 29 May 2016 15:21:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 May 2016 10:20:59 +1200
Message-Id: <c3f93de98633f764c430369a8346e4594991fdab.1464560316.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1464560316.git.paul.eggleton@linux.intel.com>
References: <cover.1464560316.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1464560316.git.paul.eggleton@linux.intel.com>
References: <cover.1464560316.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/7] recipetool: create: support extracting SUMMARY and HOMEPAGE
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
X-List-Received-Date: Sun, 29 May 2016 22:21:37 -0000

Allow plugins to set any variable value through the extravalues dict,
and use this to support extracting SUMMARY and HOMEPAGE values from spec
files included with the source; additionally translate "License:" to a
comment next to the LICENSE field (we have our own logic for setting
LICENSE, but it will often be useful to see what the spec file says if
one is present).

Also use the same mechanism for setting the same variables for node.js
modules; this was already supported but wasn't inserting the settings in
the appropriate place in the file which this will now do.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py          | 49 +++++++++++++++++--------------
 scripts/lib/recipetool/create_buildsys.py | 37 +++++++++++++++--------
 scripts/lib/recipetool/create_npm.py      |  4 +--
 3 files changed, 54 insertions(+), 36 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index aade40b..66c881a 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -331,6 +331,7 @@ def create_recipe(args):
     import bb.process
     import tempfile
     import shutil
+    import oe.recipeutils
 
     pkgarch = ""
     if args.machine:
@@ -429,7 +430,8 @@ def create_recipe(args):
     lines_before.append('# Recipe created by %s' % os.path.basename(sys.argv[0]))
     lines_before.append('# This is the basis of a recipe and may need further editing in order to be fully functional.')
     lines_before.append('# (Feel free to remove these comments when editing.)')
-    lines_before.append('#')
+    # We need a blank line here so that patch_recipe_lines can rewind before the LICENSE comments
+    lines_before.append('')
 
     licvalues = guess_license(srctree_use)
     lic_files_chksum = []
@@ -561,28 +563,28 @@ def create_recipe(args):
         handler.process(srctree_use, classes, lines_before, lines_after, handled, extravalues)
 
     extrafiles = extravalues.pop('extrafiles', {})
+    extra_pn = extravalues.pop('PN', None)
+    extra_pv = extravalues.pop('PV', None)
 
-    if not realpv:
-        realpv = extravalues.get('PV', None)
-        if realpv:
-            if not validate_pv(realpv):
-                realpv = None
-            else:
-                realpv = realpv.lower().split()[0]
-                if '_' in realpv:
-                    realpv = realpv.replace('_', '-')
-    if not pn:
-        pn = extravalues.get('PN', None)
-        if pn:
-            if pn.startswith('GNU '):
-                pn = pn[4:]
-            if ' ' in pn:
-                # Probably a descriptive identifier rather than a proper name
-                pn = None
-            else:
-                pn = pn.lower()
-                if '_' in pn:
-                    pn = pn.replace('_', '-')
+    if extra_pv and not realpv:
+        realpv = extra_pv
+        if not validate_pv(realpv):
+            realpv = None
+        else:
+            realpv = realpv.lower().split()[0]
+            if '_' in realpv:
+                realpv = realpv.replace('_', '-')
+    if extra_pn and not pn:
+        pn = extra_pn
+        if pn.startswith('GNU '):
+            pn = pn[4:]
+        if ' ' in pn:
+            # Probably a descriptive identifier rather than a proper name
+            pn = None
+        else:
+            pn = pn.lower()
+            if '_' in pn:
+                pn = pn.replace('_', '-')
 
     if not outfile:
         if not pn:
@@ -662,6 +664,9 @@ def create_recipe(args):
         outlines.append('')
     outlines.extend(lines_after)
 
+    if extravalues:
+        _, outlines = oe.recipeutils.patch_recipe_lines(outlines, extravalues, trailing_newline=False)
+
     if args.extract_to:
         scriptutils.git_convert_standalone_clone(srctree)
         if os.path.isdir(args.extract_to):
diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index f84ec3d..37d161e 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -830,22 +830,35 @@ class SpecFileRecipeHandler(RecipeHandler):
         if 'PV' in extravalues and 'PN' in extravalues:
             return
         filelist = RecipeHandler.checkfiles(srctree, ['*.spec'], recursive=True)
-        pn = None
-        pv = None
+        valuemap = {'Name': 'PN',
+                    'Version': 'PV',
+                    'Summary': 'SUMMARY',
+                    'Url': 'HOMEPAGE',
+                    'License': 'LICENSE'}
+        foundvalues = {}
         for fileitem in filelist:
             linecount = 0
             with open(fileitem, 'r') as f:
                 for line in f:
-                    if line.startswith('Name:') and not pn:
-                        pn = line.split(':')[1].strip()
-                    if line.startswith('Version:') and not pv:
-                        pv = line.split(':')[1].strip()
-            if pv or pn:
-                if pv and not 'PV' in extravalues and validate_pv(pv):
-                    extravalues['PV'] = pv
-                if pn and not 'PN' in extravalues:
-                    extravalues['PN'] = pn
-                break
+                    for value, varname in valuemap.iteritems():
+                        if line.startswith(value + ':') and not varname in foundvalues:
+                            foundvalues[varname] = line.split(':', 1)[1].strip()
+                            break
+                    if len(foundvalues) == len(valuemap):
+                        break
+        if 'PV' in foundvalues:
+            if not validate_pv(foundvalues['PV']):
+                del foundvalues['PV']
+        license = foundvalues.pop('LICENSE', None)
+        if license:
+            liccomment = '# NOTE: spec file indicates the license may be "%s"' % license
+            for i, line in enumerate(lines_before):
+                if line.startswith('LICENSE ='):
+                    lines_before.insert(i, liccomment)
+                    break
+            else:
+                lines_before.append(liccomment)
+        extravalues.update(foundvalues)
 
 def register_recipe_handlers(handlers):
     # Set priorities with some gaps so that other plugins can insert
diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index cc4fb42..ffbcb49 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -104,9 +104,9 @@ class NpmRecipeHandler(RecipeHandler):
                 classes.append('npm')
                 handled.append('buildsystem')
                 if 'description' in data:
-                    lines_before.append('SUMMARY = "%s"' % data['description'])
+                    extravalues['SUMMARY'] = data['description']
                 if 'homepage' in data:
-                    lines_before.append('HOMEPAGE = "%s"' % data['homepage'])
+                    extravalues['HOMEPAGE'] = data['homepage']
 
                 # Shrinkwrap
                 localfilesdir = tempfile.mkdtemp(prefix='recipetool-npm')
-- 
2.5.5


