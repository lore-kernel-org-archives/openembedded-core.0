Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EA1927317D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 11:19:13 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 18 Jan 2016 03:19:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,312,1449561600"; d="scan'208";a="635440006"
Received: from stan94-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.180.176])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Jan 2016 03:19:12 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 00:18:29 +1300
Message-Id: <d0a36438cd3ba5985217390eb40dddf24e356514.1453115842.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1453115842.git.paul.eggleton@linux.intel.com>
References: <cover.1453115842.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1453115842.git.paul.eggleton@linux.intel.com>
References: <cover.1453115842.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 04/10] recipetool: create: support additional autoconf macros from autoconf-archive
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
X-List-Received-Date: Mon, 18 Jan 2016 11:19:14 -0000

Support a number of macros from autoconf-archive when reading
configure.ac to extract dependencies.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create_buildsys.py | 95 ++++++++++++++++++++++++++++++-
 1 file changed, 94 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index c6d9bbe..127e133 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -144,6 +144,8 @@ class AutotoolsRecipeHandler(RecipeHandler):
     def extract_autotools_deps(outlines, srctree, extravalues=None, acfile=None):
         import shlex
         import oe.package
+        import json
+        import glob
 
         values = {}
         inherits = []
@@ -163,6 +165,7 @@ class AutotoolsRecipeHandler(RecipeHandler):
         pkg_re = re.compile('PKG_CHECK_MODULES\(\[?[a-zA-Z0-9_]*\]?, *\[?([^,\]]*)\]?[),].*')
         pkgce_re = re.compile('PKG_CHECK_EXISTS\(\[?([^,\]]*)\]?[),].*')
         lib_re = re.compile('AC_CHECK_LIB\(\[?([^,\]]*)\]?,.*')
+        libx_re = re.compile('AX_CHECK_LIBRARY\(\[?[^,\]]*\]?, *\[?([^,\]]*)\]?, *\[?([a-zA-Z0-9-]*)\]?,.*')
         progs_re = re.compile('_PROGS?\(\[?[a-zA-Z0-9_]*\]?, \[?([^,\]]*)\]?[),].*')
         dep_re = re.compile('([^ ><=]+)( [<>=]+ [^ ><=]+)?')
         ac_init_re = re.compile('AC_INIT\(([^,]+), *([^,]+)[,)].*')
@@ -189,6 +192,7 @@ class AutotoolsRecipeHandler(RecipeHandler):
 
         # Now turn it into a library->recipe mapping
         recipelibmap = {}
+        recipeheadermap = {}
         pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR', True)
         for libname, pkg in pkglibmap.iteritems():
             try:
@@ -203,6 +207,27 @@ class AutotoolsRecipeHandler(RecipeHandler):
                 else:
                     raise
 
+        def load_headermap():
+            if recipeheadermap:
+                return
+            includedir = tinfoil.config_data.getVar('includedir', True)
+            for pkg in glob.glob(os.path.join(pkgdata_dir, 'runtime', '*-dev')):
+                with open(os.path.join(pkgdata_dir, 'runtime', pkg)) as f:
+                    pn = None
+                    headers = []
+                    for line in f:
+                        if line.startswith('PN:'):
+                            pn = line.split(':', 1)[-1].strip()
+                        elif line.startswith('FILES_INFO:'):
+                            val = line.split(':', 1)[1].strip()
+                            dictval = json.loads(val)
+                            for fullpth in sorted(dictval):
+                                if fullpth.startswith(includedir) and fullpth.endswith('.h'):
+                                    headers.append(os.path.relpath(fullpth, includedir))
+                    if pn and headers:
+                        for header in headers:
+                            recipeheadermap[header] = pn
+
         defines = {}
         def subst_defines(value):
             newvalue = value
@@ -263,7 +288,7 @@ class AutotoolsRecipeHandler(RecipeHandler):
                 deps.append('intltool-native')
             elif keyword == 'AM_PATH_GLIB_2_0':
                 deps.append('glib-2.0')
-            elif keyword == 'AC_CHECK_PROG' or keyword == 'AC_PATH_PROG':
+            elif keyword in ('AC_CHECK_PROG', 'AC_PATH_PROG', 'AX_WITH_PROG'):
                 res = progs_re.search(value)
                 if res:
                     for prog in shlex.split(res.group(1)):
@@ -292,6 +317,26 @@ class AutotoolsRecipeHandler(RecipeHandler):
                             if libdep is None:
                                 if not lib.startswith('$'):
                                     unmappedlibs.append(lib)
+            elif keyword == 'AX_CHECK_LIBRARY':
+                res = libx_re.search(value)
+                if res:
+                    lib = res.group(2)
+                    if lib in ignorelibs:
+                        logger.debug('Ignoring library dependency %s' % lib)
+                    else:
+                        libdep = recipelibmap.get(lib, None)
+                        if libdep:
+                            deps.append(libdep)
+                        else:
+                            if libdep is None:
+                                if not lib.startswith('$'):
+                                    header = res.group(1)
+                                    load_headermap()
+                                    libdep = recipeheadermap.get(header, None)
+                                    if libdep:
+                                        deps.append(libdep)
+                                    else:
+                                        unmappedlibs.append(lib)
             elif keyword == 'AC_PATH_X':
                 deps.append('libx11')
             elif keyword in ('AX_BOOST', 'BOOST_REQUIRE'):
@@ -300,6 +345,36 @@ class AutotoolsRecipeHandler(RecipeHandler):
                 deps.append('flex-native')
             elif keyword in ('AC_PROG_YACC', 'AX_PROG_BISON'):
                 deps.append('bison-native')
+            elif keyword == 'AX_CHECK_ZLIB':
+                deps.append('zlib')
+            elif keyword in ('AX_CHECK_OPENSSL', 'AX_LIB_CRYPTO'):
+                deps.append('openssl')
+            elif keyword == 'AX_LIB_CURL':
+                deps.append('curl')
+            elif keyword == 'AX_LIB_BEECRYPT':
+                deps.append('beecrypt')
+            elif keyword == 'AX_LIB_EXPAT':
+                deps.append('expat')
+            elif keyword == 'AX_LIB_GCRYPT':
+                deps.append('libgcrypt')
+            elif keyword == 'AX_LIB_NETTLE':
+                deps.append('nettle')
+            elif keyword == 'AX_LIB_READLINE':
+                deps.append('readline')
+            elif keyword == 'AX_LIB_SQLITE3':
+                deps.append('sqlite3')
+            elif keyword == 'AX_LIB_TAGLIB':
+                deps.append('taglib')
+            elif keyword == 'AX_PKG_SWIG':
+                deps.append('swig')
+            elif keyword == 'AX_PROG_XSLTPROC':
+                deps.append('libxslt-native')
+            elif keyword == 'AX_WITH_CURSES':
+                deps.append('ncurses')
+            elif keyword == 'AX_PATH_BDB':
+                deps.append('db')
+            elif keyword == 'AX_PATH_LIB_PCRE':
+                deps.append('libpcre')
             elif keyword == 'AC_INIT':
                 if extravalues is not None:
                     res = ac_init_re.match(value)
@@ -336,7 +411,9 @@ class AutotoolsRecipeHandler(RecipeHandler):
                     'AM_PATH_GLIB_2_0',
                     'AC_CHECK_PROG',
                     'AC_PATH_PROG',
+                    'AX_WITH_PROG',
                     'AC_CHECK_LIB',
+                    'AX_CHECK_LIBRARY',
                     'AC_PATH_X',
                     'AX_BOOST',
                     'BOOST_REQUIRE',
@@ -345,6 +422,22 @@ class AutotoolsRecipeHandler(RecipeHandler):
                     'AX_PROG_FLEX',
                     'AC_PROG_YACC',
                     'AX_PROG_BISON',
+                    'AX_CHECK_ZLIB',
+                    'AX_CHECK_OPENSSL',
+                    'AX_LIB_CRYPTO',
+                    'AX_LIB_CURL',
+                    'AX_LIB_BEECRYPT',
+                    'AX_LIB_EXPAT',
+                    'AX_LIB_GCRYPT',
+                    'AX_LIB_NETTLE',
+                    'AX_LIB_READLINE'
+                    'AX_LIB_SQLITE3',
+                    'AX_LIB_TAGLIB',
+                    'AX_PKG_SWIG',
+                    'AX_PROG_XSLTPROC',
+                    'AX_WITH_CURSES',
+                    'AX_PATH_BDB',
+                    'AX_PATH_LIB_PCRE',
                     'AC_INIT',
                     'AM_INIT_AUTOMAKE',
                     'define(',
-- 
2.5.0


