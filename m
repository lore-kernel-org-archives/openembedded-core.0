Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 77B71731BA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 04:04:40 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2015 20:04:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,462,1444719600"; d="scan'208";a="621979046"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.148.44])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Dec 2015 20:04:38 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 17:03:03 +1300
Message-Id: <8005ae5d9db0799b15cb5dbf969e5471d154fcd3.1450756555.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 10/26] recipetool: create: basic extraction of name/version from filename
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
X-List-Received-Date: Tue, 22 Dec 2015 04:04:40 -0000

Often the filename (e.g. source tarball) contains the name and version
of the software it contains.

(This isn't intended to be exhaustive, just to catch the common case.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 15 ++++++++-------
 scripts/lib/recipetool/create.py  | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 8faea93..7af82df 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -232,15 +232,16 @@ class DevtoolTests(DevtoolBase):
         self.assertIn(srcdir, result.output)
         # Check recipe
         recipefile = get_bb_var('FILE', testrecipe)
-        self.assertIn('%s.bb' % testrecipe, recipefile, 'Recipe file incorrectly named')
+        self.assertIn('%s_%s.bb' % (testrecipe, testver), recipefile, 'Recipe file incorrectly named')
         checkvars = {}
-        checkvars['S'] = '${WORKDIR}/MarkupSafe-%s' % testver
-        checkvars['SRC_URI'] = url
+        checkvars['S'] = '${WORKDIR}/MarkupSafe-${PV}'
+        checkvars['SRC_URI'] = url.replace(testver, '${PV}')
         self._test_recipe_contents(recipefile, checkvars, [])
         # Try with version specified
         result = runCmd('devtool reset -n %s' % testrecipe)
         shutil.rmtree(srcdir)
-        result = runCmd('devtool add %s %s -f %s -V %s' % (testrecipe, srcdir, url, testver))
+        fakever = '1.9'
+        result = runCmd('devtool add %s %s -f %s -V %s' % (testrecipe, srcdir, url, fakever))
         self.assertTrue(os.path.isfile(os.path.join(srcdir, 'setup.py')), 'Unable to find setup.py in source directory')
         # Test devtool status
         result = runCmd('devtool status')
@@ -248,10 +249,10 @@ class DevtoolTests(DevtoolBase):
         self.assertIn(srcdir, result.output)
         # Check recipe
         recipefile = get_bb_var('FILE', testrecipe)
-        self.assertIn('%s_%s.bb' % (testrecipe, testver), recipefile, 'Recipe file incorrectly named')
+        self.assertIn('%s_%s.bb' % (testrecipe, fakever), recipefile, 'Recipe file incorrectly named')
         checkvars = {}
-        checkvars['S'] = '${WORKDIR}/MarkupSafe-${PV}'
-        checkvars['SRC_URI'] = url.replace(testver, '${PV}')
+        checkvars['S'] = '${WORKDIR}/MarkupSafe-%s' % testver
+        checkvars['SRC_URI'] = url
         self._test_recipe_contents(recipefile, checkvars, [])
 
     @testcase(1161)
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 6c7b9fd..4887604 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -86,6 +86,27 @@ def validate_pv(pv):
         return False
     return True
 
+def determine_from_filename(srcfile):
+    """Determine name and version from a filename"""
+    part = ''
+    if '.tar.' in srcfile:
+        namepart = srcfile.split('.tar.')[0]
+    else:
+        namepart = os.path.splitext(srcfile)[0]
+    splitval = namepart.rsplit('_', 1)
+    if len(splitval) == 1:
+        splitval = namepart.rsplit('-', 1)
+    pn = splitval[0].replace('_', '-')
+    if len(splitval) > 1:
+        if splitval[1][0] in '0123456789':
+            pv = splitval[1]
+        else:
+            pn = '-'.join(splitval).replace('_', '-')
+            pv = None
+    else:
+        pv = None
+    return (pn, pv)
+
 def supports_srcrev(uri):
     localdata = bb.data.createCopy(tinfoil.config_data)
     # This is a bit sad, but if you don't have this set there can be some
@@ -234,6 +255,17 @@ def create_recipe(args):
     else:
         realpv = None
 
+    if srcuri and not realpv or not pn:
+        parseres = urlparse.urlparse(srcuri)
+        if parseres.path:
+            srcfile = os.path.basename(parseres.path)
+            name_pn, name_pv = determine_from_filename(srcfile)
+            logger.debug('Determined from filename: name = "%s", version = "%s"' % (name_pn, name_pv))
+            if name_pn and not pn:
+                pn = name_pn
+            if name_pv and not realpv:
+                realpv = name_pv
+
     if not srcuri:
         lines_before.append('# No information for SRC_URI yet (only an external source tree was specified)')
     lines_before.append('SRC_URI = "%s"' % srcuri)
-- 
2.5.0


