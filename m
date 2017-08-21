Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0CAE877B45
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 05:41:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Aug 2017 22:41:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,407,1498546800"; d="scan'208";a="1208228404"
Received: from ssen-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.129.109])
	by fmsmga002.fm.intel.com with ESMTP; 20 Aug 2017 22:41:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Aug 2017 17:39:49 +1200
Message-Id: <816e8a5ef59dc6b59d1adc112f51fa80c183bc36.1503293342.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1503293342.git.paul.eggleton@linux.intel.com>
References: <cover.1503293342.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 10/10] recipetool: allow plugins to set LICENSE and LIC_FILES_CHKSUM
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
X-List-Received-Date: Mon, 21 Aug 2017 05:41:20 -0000

We were being a bit prescriptive in setting LICENSE and
LIC_FILES_CHKSUM. We can't always trust what's in the metadata
accompanying some source which plugins will almost always be pulling
from, however we do want to allow plugins to set the LICENSE and
LIC_FILES_CHKSUM values. Merge what we find in our license file scan
with what the plugin sends back.

Additionally, plugins can now add a "license" item to the handled list
in order to inhibit the normal LICENSE / LIC_FILES_CHKSUM handling if
they have already taken care of it completely.

Thanks to Mark Horn <mark.d.horn@intel.com> for prompting, testing and
fixing this patch.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py     | 115 +++++++++++++++++++++++------------
 scripts/lib/recipetool/create_npm.py |  44 +-------------
 2 files changed, 79 insertions(+), 80 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 40bd3c8..2601145 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -618,9 +618,10 @@ def create_recipe(args):
     # We need a blank line here so that patch_recipe_lines can rewind before the LICENSE comments
     lines_before.append('')
 
-    handled = []
-    licvalues = handle_license_vars(srctree_use, lines_before, handled, extravalues, tinfoil.config_data)
+    # We'll come back and replace this later in handle_license_vars()
+    lines_before.append('##LICENSE_PLACEHOLDER##')
 
+    handled = []
     classes = []
 
     # FIXME This is kind of a hack, we probably ought to be using bitbake to do this
@@ -751,6 +752,8 @@ def create_recipe(args):
         if name_pv and not realpv:
             realpv = name_pv
 
+    licvalues = handle_license_vars(srctree_use, lines_before, handled, extravalues, tinfoil.config_data)
+
     if not outfile:
         if not pn:
             log_error_cond('Unable to determine short program name from source tree - please specify name with -N/--name or output file name with -o/--outfile', args.devtool)
@@ -843,9 +846,6 @@ def create_recipe(args):
     outlines.extend(lines_after)
 
     if extravalues:
-        if 'LICENSE' in extravalues and not licvalues:
-            # Don't blow away 'CLOSED' value that comments say we set
-            del extravalues['LICENSE']
         _, outlines = oe.recipeutils.patch_recipe_lines(outlines, extravalues, trailing_newline=False)
 
     if args.extract_to:
@@ -889,55 +889,94 @@ def check_single_file(fn, fetchuri):
             logger.error('Fetching "%s" returned a single HTML page - check the URL is correct and functional' % fetchuri)
             sys.exit(1)
 
+def split_value(value):
+    if isinstance(value, str):
+        return value.split()
+    else:
+        return value
 
 def handle_license_vars(srctree, lines_before, handled, extravalues, d):
+    lichandled = [x for x in handled if x[0] == 'license']
+    if lichandled:
+        # Someone else has already handled the license vars, just return their value
+        return lichandled[0][1]
+
     licvalues = guess_license(srctree, d)
+    licenses = []
     lic_files_chksum = []
     lic_unknown = []
+    lines = []
     if licvalues:
-        licenses = []
         for licvalue in licvalues:
             if not licvalue[0] in licenses:
                 licenses.append(licvalue[0])
             lic_files_chksum.append('file://%s;md5=%s' % (licvalue[1], licvalue[2]))
             if licvalue[0] == 'Unknown':
                 lic_unknown.append(licvalue[1])
-        lines_before.append('# WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best guesses - it is')
-        lines_before.append('# your responsibility to verify that the values are complete and correct.')
-        if len(licvalues) > 1:
-            lines_before.append('#')
-            lines_before.append('# NOTE: multiple licenses have been detected; they have been separated with &')
-            lines_before.append('# in the LICENSE value for now since it is a reasonable assumption that all')
-            lines_before.append('# of the licenses apply. If instead there is a choice between the multiple')
-            lines_before.append('# licenses then you should change the value to separate the licenses with |')
-            lines_before.append('# instead of &. If there is any doubt, check the accompanying documentation')
-            lines_before.append('# to determine which situation is applicable.')
         if lic_unknown:
-            lines_before.append('#')
-            lines_before.append('# The following license files were not able to be identified and are')
-            lines_before.append('# represented as "Unknown" below, you will need to check them yourself:')
+            lines.append('#')
+            lines.append('# The following license files were not able to be identified and are')
+            lines.append('# represented as "Unknown" below, you will need to check them yourself:')
             for licfile in lic_unknown:
-                lines_before.append('#   %s' % licfile)
-            lines_before.append('#')
-    else:
-        lines_before.append('# Unable to find any files that looked like license statements. Check the accompanying')
-        lines_before.append('# documentation and source headers and set LICENSE and LIC_FILES_CHKSUM accordingly.')
-        lines_before.append('#')
-        lines_before.append('# NOTE: LICENSE is being set to "CLOSED" to allow you to at least start building - if')
-        lines_before.append('# this is not accurate with respect to the licensing of the software being built (it')
-        lines_before.append('# will not be in most cases) you must specify the correct value before using this')
-        lines_before.append('# recipe for anything other than initial testing/development!')
-        licenses = ['CLOSED']
-    pkg_license = extravalues.pop('LICENSE', None)
-    if pkg_license:
+                lines.append('#   %s' % licfile)
+
+    extra_license = split_value(extravalues.pop('LICENSE', []))
+    if '&' in extra_license:
+        extra_license.remove('&')
+    if extra_license:
         if licenses == ['Unknown']:
-            lines_before.append('# NOTE: The following LICENSE value was determined from the original package metadata')
-            licenses = [pkg_license]
+            licenses = extra_license
         else:
-            lines_before.append('# NOTE: Original package metadata indicates license is: %s' % pkg_license)
-    lines_before.append('LICENSE = "%s"' % ' & '.join(licenses))
-    lines_before.append('LIC_FILES_CHKSUM = "%s"' % ' \\\n                    '.join(lic_files_chksum))
-    lines_before.append('')
+            for item in extra_license:
+                if item not in licenses:
+                    licenses.append(item)
+    extra_lic_files_chksum = split_value(extravalues.pop('LIC_FILES_CHKSUM', []))
+    for item in extra_lic_files_chksum:
+        if item not in lic_files_chksum:
+            lic_files_chksum.append(item)
+
+    if lic_files_chksum:
+        # We are going to set the vars, so prepend the standard disclaimer
+        lines.insert(0, '# WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best guesses - it is')
+        lines.insert(1, '# your responsibility to verify that the values are complete and correct.')
+    else:
+        # Without LIC_FILES_CHKSUM we set LICENSE = "CLOSED" to allow the
+        # user to get started easily
+        lines.append('# Unable to find any files that looked like license statements. Check the accompanying')
+        lines.append('# documentation and source headers and set LICENSE and LIC_FILES_CHKSUM accordingly.')
+        lines.append('#')
+        lines.append('# NOTE: LICENSE is being set to "CLOSED" to allow you to at least start building - if')
+        lines.append('# this is not accurate with respect to the licensing of the software being built (it')
+        lines.append('# will not be in most cases) you must specify the correct value before using this')
+        lines.append('# recipe for anything other than initial testing/development!')
+        licenses = ['CLOSED']
+
+    if extra_license and sorted(licenses) != sorted(extra_license):
+        lines.append('# NOTE: Original package / source metadata indicates license is: %s' % ' & '.join(extra_license))
+
+    if len(licenses) > 1:
+        lines.append('#')
+        lines.append('# NOTE: multiple licenses have been detected; they have been separated with &')
+        lines.append('# in the LICENSE value for now since it is a reasonable assumption that all')
+        lines.append('# of the licenses apply. If instead there is a choice between the multiple')
+        lines.append('# licenses then you should change the value to separate the licenses with |')
+        lines.append('# instead of &. If there is any doubt, check the accompanying documentation')
+        lines.append('# to determine which situation is applicable.')
+
+    lines.append('LICENSE = "%s"' % ' & '.join(licenses))
+    lines.append('LIC_FILES_CHKSUM = "%s"' % ' \\\n                    '.join(lic_files_chksum))
+    lines.append('')
+
+    # Replace the placeholder so we get the values in the right place in the recipe file
+    try:
+        pos = lines_before.index('##LICENSE_PLACEHOLDER##')
+    except ValueError:
+        pos = -1
+    if pos == -1:
+        lines_before.extend(lines)
+    else:
+        lines_before[pos:pos+1] = lines
+
     handled.append(('license', licvalues))
     return licvalues
 
diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index 885d543..07fcf4d 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -164,37 +164,6 @@ class NpmRecipeHandler(RecipeHandler):
                 lines_before.append(line)
         return updated
 
-    def _replace_license_vars(self, srctree, lines_before, handled, extravalues, d):
-        for item in handled:
-            if isinstance(item, tuple):
-                if item[0] == 'license':
-                    del item
-                    break
-
-        calledvars = []
-        def varfunc(varname, origvalue, op, newlines):
-            if varname in ['LICENSE', 'LIC_FILES_CHKSUM']:
-                for i, e in enumerate(reversed(newlines)):
-                    if not e.startswith('#'):
-                        stop = i
-                        while stop > 0:
-                            newlines.pop()
-                            stop -= 1
-                        break
-                calledvars.append(varname)
-                if len(calledvars) > 1:
-                    # The second time around, put the new license text in
-                    insertpos = len(newlines)
-                    handle_license_vars(srctree, newlines, handled, extravalues, d)
-                return None, None, 0, True
-            return origvalue, None, 0, True
-        updated, newlines = bb.utils.edit_metadata(lines_before, ['LICENSE', 'LIC_FILES_CHKSUM'], varfunc)
-        if updated:
-            del lines_before[:]
-            lines_before.extend(newlines)
-        else:
-            raise Exception('Did not find license variables')
-
     def process(self, srctree, classes, lines_before, lines_after, handled, extravalues):
         import bb.utils
         import oe
@@ -228,10 +197,7 @@ class NpmRecipeHandler(RecipeHandler):
 
                 fetchdev = extravalues['fetchdev'] or None
                 deps, optdeps, devdeps = self.get_npm_package_dependencies(data, fetchdev)
-                updated = self._handle_dependencies(d, deps, optdeps, devdeps, lines_before, srctree)
-                if updated:
-                    # We need to redo the license stuff
-                    self._replace_license_vars(srctree, lines_before, handled, extravalues, d)
+                self._handle_dependencies(d, deps, optdeps, devdeps, lines_before, srctree)
 
                 # Shrinkwrap
                 localfilesdir = tempfile.mkdtemp(prefix='recipetool-npm')
@@ -267,13 +233,7 @@ class NpmRecipeHandler(RecipeHandler):
                     all_licenses = list(set([item.replace('_', ' ') for pkglicense in pkglicenses.values() for item in pkglicense]))
                     if '&' in all_licenses:
                         all_licenses.remove('&')
-                    # Go back and update the LICENSE value since we have a bit more
-                    # information than when that was written out (and we know all apply
-                    # vs. there being a choice, so we can join them with &)
-                    for i, line in enumerate(lines_before):
-                        if line.startswith('LICENSE = '):
-                            lines_before[i] = 'LICENSE = "%s"' % ' & '.join(all_licenses)
-                            break
+                    extravalues['LICENSE'] = ' & '.join(all_licenses)
 
                 # Need to move S setting after inherit npm
                 for i, line in enumerate(lines_before):
-- 
2.9.5


