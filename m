Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3422D6FF84
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 11:19:06 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 18 Jan 2016 03:19:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,312,1449561600"; d="scan'208";a="635439965"
Received: from stan94-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.180.176])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Jan 2016 03:19:05 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 00:18:26 +1300
Message-Id: <48b29276316f16e6a08d3c0798f9251bd51569dc.1453115842.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1453115842.git.paul.eggleton@linux.intel.com>
References: <cover.1453115842.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1453115842.git.paul.eggleton@linux.intel.com>
References: <cover.1453115842.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 01/10] recipetool: create: improve extraction of pkg-config / lib deps
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
X-List-Received-Date: Mon, 18 Jan 2016 11:19:07 -0000

* The regexes for PKG_CHECK_MODULES / AC_CHECK_LIB were a bit too strict
  and thus we were skipping some macros.
* Add support for PKG_CHECK_EXISTS
* Avoid duplicates in warning on missing pkg-config dependencies
* Ignore dependency on musl (since this may come up if it's the selected
  C library)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/recipetool.py      |  4 ++--
 scripts/lib/recipetool/create_buildsys.py | 18 ++++++++++++++----
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/recipetool.py b/meta/lib/oeqa/selftest/recipetool.py
index 4103a88..927da73 100644
--- a/meta/lib/oeqa/selftest/recipetool.py
+++ b/meta/lib/oeqa/selftest/recipetool.py
@@ -383,7 +383,7 @@ class RecipetoolTests(RecipetoolBase):
     @testcase(1194)
     def test_recipetool_create_git(self):
         # Ensure we have the right data in shlibs/pkgdata
-        bitbake('libpng pango libx11 libxext jpeg')
+        bitbake('libpng pango libx11 libxext jpeg libxsettings-client libcheck')
         # Try adding a recipe
         tempsrc = os.path.join(self.tempdir, 'srctree')
         os.makedirs(tempsrc)
@@ -397,7 +397,7 @@ class RecipetoolTests(RecipetoolBase):
         checkvars['S'] = '${WORKDIR}/git'
         checkvars['PV'] = '1.11+git${SRCPV}'
         checkvars['SRC_URI'] = srcuri
-        checkvars['DEPENDS'] = set(['libjpeg-turbo', 'libpng', 'libx11', 'libxext', 'pango'])
+        checkvars['DEPENDS'] = set(['libcheck', 'libjpeg-turbo', 'libpng', 'libx11', 'libxsettings-client', 'libxext', 'pango'])
         inherits = ['autotools', 'pkgconfig']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index 1674aba..7fedb2a 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -157,12 +157,13 @@ class AutotoolsRecipeHandler(RecipeHandler):
         progclassmap = {'gconftool-2': 'gconf',
                 'pkg-config': 'pkgconfig'}
 
-        ignoredeps = ['gcc-runtime', 'glibc', 'uclibc', 'tar-native', 'binutils-native']
+        ignoredeps = ['gcc-runtime', 'glibc', 'uclibc', 'musl', 'tar-native', 'binutils-native']
         ignorelibs = ['socket']
 
-        pkg_re = re.compile('PKG_CHECK_MODULES\(\[?[a-zA-Z0-9]*\]?, \[?([^,\]]*)[),].*')
-        lib_re = re.compile('AC_CHECK_LIB\(\[?([a-zA-Z0-9]*)\]?, .*')
-        progs_re = re.compile('_PROGS?\(\[?[a-zA-Z0-9]*\]?, \[?([^,\]]*)\]?[),].*')
+        pkg_re = re.compile('PKG_CHECK_MODULES\(\[?[a-zA-Z0-9_]*\]?, *\[?([^,\]]*)\]?[),].*')
+        pkgce_re = re.compile('PKG_CHECK_EXISTS\(\[?([^,\]]*)\]?[),].*')
+        lib_re = re.compile('AC_CHECK_LIB\(\[?([^,\]]*)\]?,.*')
+        progs_re = re.compile('_PROGS?\(\[?[a-zA-Z0-9_]*\]?, \[?([^,\]]*)\]?[),].*')
         dep_re = re.compile('([^ ><=]+)( [<>=]+ [^ ><=]+)?')
         ac_init_re = re.compile('AC_INIT\(([^,]+), *([^,]+)[,)].*')
         am_init_re = re.compile('AM_INIT_AUTOMAKE\(([^,]+), *([^,]+)[,)].*')
@@ -249,6 +250,13 @@ class AutotoolsRecipeHandler(RecipeHandler):
                     if res:
                         pcdeps.extend([x[0] for x in res])
                 inherits.append('pkgconfig')
+            elif keyword == 'PKG_CHECK_EXISTS':
+                res = pkgce_re.search(value)
+                if res:
+                    res = dep_re.findall(res.group(1))
+                    if res:
+                        pcdeps.extend([x[0] for x in res])
+                inherits.append('pkgconfig')
             elif keyword in ('AM_GNU_GETTEXT', 'AM_GLIB_GNU_GETTEXT', 'GETTEXT_PACKAGE'):
                 inherits.append('gettext')
             elif keyword in ('AC_PROG_INTLTOOL', 'IT_PROG_INTLTOOL'):
@@ -313,6 +321,7 @@ class AutotoolsRecipeHandler(RecipeHandler):
                         defines[key] = value
 
         keywords = ['PKG_CHECK_MODULES',
+                    'PKG_CHECK_EXISTS',
                     'AM_GNU_GETTEXT',
                     'AM_GLIB_GNU_GETTEXT',
                     'GETTEXT_PACKAGE',
@@ -375,6 +384,7 @@ class AutotoolsRecipeHandler(RecipeHandler):
 
         recipemap = read_pkgconfig_provides(tinfoil.config_data)
         unmapped = []
+        pcdeps = list(set(pcdeps))
         for pcdep in pcdeps:
             recipe = recipemap.get(pcdep, None)
             if recipe:
-- 
2.5.0


