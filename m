Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D8738731D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 04:05:14 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2015 20:05:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,462,1444719600"; d="scan'208";a="621979357"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.148.44])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Dec 2015 20:05:14 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 17:03:16 +1300
Message-Id: <5520a7e1c09513142d2dd6fa81650d35d4b3446e.1450756556.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 23/26] recipetool: create: improve autotools support
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
X-List-Received-Date: Tue, 22 Dec 2015 04:05:15 -0000

* tar and binutils we can assume are there
* libsocket is only relevant on BSD systems, so we can ignore it.
* Detect more things implying gettext/intltool is needed
* Detect glib-2.0 requirement.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create_buildsys.py | 38 ++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index 0aff59e..1674aba 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -127,6 +127,7 @@ class AutotoolsRecipeHandler(RecipeHandler):
                                 extravalues['PN'] = pn
 
         if autoconf:
+            lines_before.append('')
             lines_before.append('# NOTE: if this software is not capable of being built in a separate build directory')
             lines_before.append('# from the source, you should replace autotools with autotools-brokensep in the')
             lines_before.append('# inherit line')
@@ -150,11 +151,14 @@ class AutotoolsRecipeHandler(RecipeHandler):
         # FIXME this mapping is very thin
         progmap = {'flex': 'flex-native',
                 'bison': 'bison-native',
-                'm4': 'm4-native'}
+                'm4': 'm4-native',
+                'tar': 'tar-native',
+                'ar': 'binutils-native'}
         progclassmap = {'gconftool-2': 'gconf',
                 'pkg-config': 'pkgconfig'}
 
-        ignoredeps = ['gcc-runtime', 'glibc', 'uclibc']
+        ignoredeps = ['gcc-runtime', 'glibc', 'uclibc', 'tar-native', 'binutils-native']
+        ignorelibs = ['socket']
 
         pkg_re = re.compile('PKG_CHECK_MODULES\(\[?[a-zA-Z0-9]*\]?, \[?([^,\]]*)[),].*')
         lib_re = re.compile('AC_CHECK_LIB\(\[?([a-zA-Z0-9]*)\]?, .*')
@@ -245,8 +249,12 @@ class AutotoolsRecipeHandler(RecipeHandler):
                     if res:
                         pcdeps.extend([x[0] for x in res])
                 inherits.append('pkgconfig')
-            elif keyword == 'AM_GNU_GETTEXT':
+            elif keyword in ('AM_GNU_GETTEXT', 'AM_GLIB_GNU_GETTEXT', 'GETTEXT_PACKAGE'):
                 inherits.append('gettext')
+            elif keyword in ('AC_PROG_INTLTOOL', 'IT_PROG_INTLTOOL'):
+                deps.append('intltool-native')
+            elif keyword == 'AM_PATH_GLIB_2_0':
+                deps.append('glib-2.0')
             elif keyword == 'AC_CHECK_PROG' or keyword == 'AC_PATH_PROG':
                 res = progs_re.search(value)
                 if res:
@@ -266,13 +274,16 @@ class AutotoolsRecipeHandler(RecipeHandler):
                 res = lib_re.search(value)
                 if res:
                     lib = res.group(1)
-                    libdep = recipelibmap.get(lib, None)
-                    if libdep:
-                        deps.append(libdep)
+                    if lib in ignorelibs:
+                        logger.debug('Ignoring library dependency %s' % lib)
                     else:
-                        if libdep is None:
-                            if not lib.startswith('$'):
-                                unmappedlibs.append(lib)
+                        libdep = recipelibmap.get(lib, None)
+                        if libdep:
+                            deps.append(libdep)
+                        else:
+                            if libdep is None:
+                                if not lib.startswith('$'):
+                                    unmappedlibs.append(lib)
             elif keyword == 'AC_PATH_X':
                 deps.append('libx11')
             elif keyword == 'AC_INIT':
@@ -303,6 +314,11 @@ class AutotoolsRecipeHandler(RecipeHandler):
 
         keywords = ['PKG_CHECK_MODULES',
                     'AM_GNU_GETTEXT',
+                    'AM_GLIB_GNU_GETTEXT',
+                    'GETTEXT_PACKAGE',
+                    'AC_PROG_INTLTOOL',
+                    'IT_PROG_INTLTOOL',
+                    'AM_PATH_GLIB_2_0',
                     'AC_CHECK_PROG',
                     'AC_PATH_PROG',
                     'AC_CHECK_LIB',
@@ -351,10 +367,10 @@ class AutotoolsRecipeHandler(RecipeHandler):
                         extravalues[k] = v.strip('"\'').rstrip('()')
 
         if unmapped:
-            outlines.append('# NOTE: the following prog dependencies are unknown, ignoring: %s' % ' '.join(unmapped))
+            outlines.append('# NOTE: the following prog dependencies are unknown, ignoring: %s' % ' '.join(list(set(unmapped))))
 
         if unmappedlibs:
-            outlines.append('# NOTE: the following library dependencies are unknown, ignoring: %s' % ' '.join(unmappedlibs))
+            outlines.append('# NOTE: the following library dependencies are unknown, ignoring: %s' % ' '.join(list(set(unmappedlibs))))
             outlines.append('#       (this is based on recipes that have previously been built and packaged)')
 
         recipemap = read_pkgconfig_provides(tinfoil.config_data)
-- 
2.5.0


