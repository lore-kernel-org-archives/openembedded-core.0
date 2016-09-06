Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 9E6A077524
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 10:04:13 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 06 Sep 2016 03:04:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,291,1470726000"; 
   d="scan'208";a="5042799"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.181.236])
	by fmsmga006.fm.intel.com with ESMTP; 06 Sep 2016 03:04:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Sep 2016 22:03:28 +1200
Message-Id: <46ad23b18aa0ba1a7035bd3c3577f9b69cd876ff.1473155977.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1473155977.git.paul.eggleton@linux.intel.com>
References: <cover.1473155977.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1473155977.git.paul.eggleton@linux.intel.com>
References: <cover.1473155977.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 7/9] recipetool: create: allow license variable handling to be rerun
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
X-List-Received-Date: Tue, 06 Sep 2016 10:04:13 -0000

If you make adjustments to the source tree (as create_npm.py will be)
then you will need to re-run the license variable handling code at the
end so that we get all of the files that should go into
LIC_FILES_CHKSUM if nothing else. Split out the license variable
handling to a separate function in order to allow this.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 103 ++++++++++++++++++++-------------------
 1 file changed, 53 insertions(+), 50 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 89ab748..f1ce28c 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -482,51 +482,8 @@ def create_recipe(args):
     # We need a blank line here so that patch_recipe_lines can rewind before the LICENSE comments
     lines_before.append('')
 
-    licvalues = guess_license(srctree_use)
-    lic_files_chksum = []
-    lic_unknown = []
-    if licvalues:
-        licenses = []
-        for licvalue in licvalues:
-            if not licvalue[0] in licenses:
-                licenses.append(licvalue[0])
-            lic_files_chksum.append('file://%s;md5=%s' % (licvalue[1], licvalue[2]))
-            if licvalue[0] == 'Unknown':
-                lic_unknown.append(licvalue[1])
-        lines_before.append('# WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best guesses - it is')
-        lines_before.append('# your responsibility to verify that the values are complete and correct.')
-        if len(licvalues) > 1:
-            lines_before.append('#')
-            lines_before.append('# NOTE: multiple licenses have been detected; if that is correct you should separate')
-            lines_before.append('# these in the LICENSE value using & if the multiple licenses all apply, or | if there')
-            lines_before.append('# is a choice between the multiple licenses. If in doubt, check the accompanying')
-            lines_before.append('# documentation to determine which situation is applicable.')
-        if lic_unknown:
-            lines_before.append('#')
-            lines_before.append('# The following license files were not able to be identified and are')
-            lines_before.append('# represented as "Unknown" below, you will need to check them yourself:')
-            for licfile in lic_unknown:
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
-        if licenses == ['Unknown']:
-            lines_before.append('# NOTE: The following LICENSE value was determined from the original package metadata')
-            licenses = [pkg_license]
-        else:
-            lines_before.append('# NOTE: Original package metadata indicates license is: %s' % pkg_license)
-    lines_before.append('LICENSE = "%s"' % ' '.join(licenses))
-    lines_before.append('LIC_FILES_CHKSUM = "%s"' % ' \\\n                    '.join(lic_files_chksum))
-    lines_before.append('')
+    handled = []
+    licvalues = handle_license_vars(srctree_use, lines_before, handled, extravalues, tinfoil.config_data)
 
     classes = []
 
@@ -623,9 +580,6 @@ def create_recipe(args):
     handlers = [item[0] for item in handlers]
 
     # Apply the handlers
-    handled = []
-    handled.append(('license', licvalues))
-
     if args.binary:
         classes.append('bin_package')
         handled.append('buildsystem')
@@ -772,6 +726,55 @@ def create_recipe(args):
 
     return 0
 
+def handle_license_vars(srctree, lines_before, handled, extravalues, d):
+    licvalues = guess_license(srctree, d)
+    lic_files_chksum = []
+    lic_unknown = []
+    if licvalues:
+        licenses = []
+        for licvalue in licvalues:
+            if not licvalue[0] in licenses:
+                licenses.append(licvalue[0])
+            lic_files_chksum.append('file://%s;md5=%s' % (licvalue[1], licvalue[2]))
+            if licvalue[0] == 'Unknown':
+                lic_unknown.append(licvalue[1])
+        lines_before.append('# WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best guesses - it is')
+        lines_before.append('# your responsibility to verify that the values are complete and correct.')
+        if len(licvalues) > 1:
+            lines_before.append('#')
+            lines_before.append('# NOTE: multiple licenses have been detected; if that is correct you should separate')
+            lines_before.append('# these in the LICENSE value using & if the multiple licenses all apply, or | if there')
+            lines_before.append('# is a choice between the multiple licenses. If in doubt, check the accompanying')
+            lines_before.append('# documentation to determine which situation is applicable.')
+        if lic_unknown:
+            lines_before.append('#')
+            lines_before.append('# The following license files were not able to be identified and are')
+            lines_before.append('# represented as "Unknown" below, you will need to check them yourself:')
+            for licfile in lic_unknown:
+                lines_before.append('#   %s' % licfile)
+            lines_before.append('#')
+    else:
+        lines_before.append('# Unable to find any files that looked like license statements. Check the accompanying')
+        lines_before.append('# documentation and source headers and set LICENSE and LIC_FILES_CHKSUM accordingly.')
+        lines_before.append('#')
+        lines_before.append('# NOTE: LICENSE is being set to "CLOSED" to allow you to at least start building - if')
+        lines_before.append('# this is not accurate with respect to the licensing of the software being built (it')
+        lines_before.append('# will not be in most cases) you must specify the correct value before using this')
+        lines_before.append('# recipe for anything other than initial testing/development!')
+        licenses = ['CLOSED']
+    pkg_license = extravalues.pop('LICENSE', None)
+    if pkg_license:
+        if licenses == ['Unknown']:
+            lines_before.append('# NOTE: The following LICENSE value was determined from the original package metadata')
+            licenses = [pkg_license]
+        else:
+            lines_before.append('# NOTE: Original package metadata indicates license is: %s' % pkg_license)
+    lines_before.append('LICENSE = "%s"' % ' '.join(licenses))
+    lines_before.append('LIC_FILES_CHKSUM = "%s"' % ' \\\n                    '.join(lic_files_chksum))
+    lines_before.append('')
+    handled.append(('license', licvalues))
+    return licvalues
+
 def get_license_md5sums(d, static_only=False):
     import bb.utils
     md5sums = {}
@@ -892,9 +895,9 @@ def crunch_license(licfile):
     license = crunched_md5sums.get(md5val, None)
     return license, md5val, lictext
 
-def guess_license(srctree):
+def guess_license(srctree, d):
     import bb
-    md5sums = get_license_md5sums(tinfoil.config_data)
+    md5sums = get_license_md5sums(d)
 
     licenses = []
     licspecs = ['*LICEN[CS]E*', 'COPYING*', '*[Ll]icense*', 'LEGAL*', '[Ll]egal*', '*GPL*', 'README.lic*', 'COPYRIGHT*', '[Cc]opyright*']
-- 
2.5.5


