Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 00D326FFFB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 05:36:41 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 07 Mar 2016 21:36:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,555,1449561600"; d="scan'208";a="919077659"
Received: from jlee45-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.164.131])
	by fmsmga001.fm.intel.com with ESMTP; 07 Mar 2016 21:36:40 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Mar 2016 18:36:01 +1300
Message-Id: <7ed2a22ce5fda06a9857d11b775bec9a2af05779.1457415260.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1457415260.git.paul.eggleton@linux.intel.com>
References: <cover.1457415260.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1457415260.git.paul.eggleton@linux.intel.com>
References: <cover.1457415260.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/6] recipetool: create: improve mapping for autotools program macros
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
X-List-Received-Date: Tue, 08 Mar 2016 05:36:42 -0000

Make the following improvements to mapping items specified in
AC_CHECK_PROG, AC_PATH_PROG and AX_WITH_PROG to recipes/classes:

* Produce a map of native recipe -> binary for all binaries currently in
  STAGING_BINDIR_NATIVE and use this when mapping items
* Add some more entries to the class map
* Ignore autotools binaries since they are covered by the inherit of
  autotools
* Ignore coreutils-native since that would almost always be a bogus
  dependency

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py          | 22 +++++++++++++++++--
 scripts/lib/recipetool/create_buildsys.py | 36 +++++++++++++++++++++++++------
 2 files changed, 50 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 7560cdf..a77c191 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1,6 +1,6 @@
 # Recipe creation tool - create command plugin
 #
-# Copyright (C) 2014-2015 Intel Corporation
+# Copyright (C) 2014-2016 Intel Corporation
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License version 2 as
@@ -44,6 +44,7 @@ class RecipeHandler(object):
     recipelibmap = {}
     recipeheadermap = {}
     recipecmakefilemap = {}
+    recipebinmap = {}
 
     @staticmethod
     def load_libmap(d):
@@ -122,6 +123,23 @@ class RecipeHandler(object):
                         RecipeHandler.recipecmakefilemap[fn] = pn
 
     @staticmethod
+    def load_binmap(d):
+        '''Build up native binary->recipe mapping'''
+        if RecipeHandler.recipebinmap:
+            return
+        sstate_manifests = d.getVar('SSTATE_MANIFESTS', True)
+        staging_bindir_native = d.getVar('STAGING_BINDIR_NATIVE', True)
+        build_arch = d.getVar('BUILD_ARCH', True)
+        fileprefix = 'manifest-%s-' % build_arch
+        for fn in glob.glob(os.path.join(sstate_manifests, '%s*-native.populate_sysroot' % fileprefix)):
+            with open(fn, 'r') as f:
+                pn = os.path.basename(fn).rsplit('.', 1)[0][len(fileprefix):]
+                for line in f:
+                    if line.startswith(staging_bindir_native):
+                        prog = os.path.basename(line.rstrip())
+                        RecipeHandler.recipebinmap[prog] = pn
+
+    @staticmethod
     def checkfiles(path, speclist, recursive=False):
         results = []
         if recursive:
@@ -143,7 +161,7 @@ class RecipeHandler(object):
             RecipeHandler.load_libmap(d)
 
         ignorelibs = ['socket']
-        ignoredeps = ['gcc-runtime', 'glibc', 'uclibc', 'musl', 'tar-native', 'binutils-native']
+        ignoredeps = ['gcc-runtime', 'glibc', 'uclibc', 'musl', 'tar-native', 'binutils-native', 'coreutils-native']
 
         unmappedpc = []
         pcdeps = list(set(pcdeps))
diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index 909743b..f84ec3d 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -1,6 +1,6 @@
 # Recipe creation tool - create command build system handlers
 #
-# Copyright (C) 2014 Intel Corporation
+# Copyright (C) 2014-2016 Intel Corporation
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License version 2 as
@@ -404,14 +404,34 @@ class AutotoolsRecipeHandler(RecipeHandler):
         values = {}
         inherits = []
 
-        # FIXME this mapping is very thin
+        # Hardcoded map, we also use a dynamic one based on what's in the sysroot
         progmap = {'flex': 'flex-native',
                 'bison': 'bison-native',
                 'm4': 'm4-native',
                 'tar': 'tar-native',
-                'ar': 'binutils-native'}
+                'ar': 'binutils-native',
+                'ranlib': 'binutils-native',
+                'ld': 'binutils-native',
+                'strip': 'binutils-native',
+                'libtool': '',
+                'autoconf': '',
+                'autoheader': '',
+                'automake': '',
+                'uname': '',
+                'rm': '',
+                'cp': '',
+                'mv': '',
+                'find': '',
+                'awk': '',
+                'sed': '',
+                }
         progclassmap = {'gconftool-2': 'gconf',
-                'pkg-config': 'pkgconfig'}
+                'pkg-config': 'pkgconfig',
+                'python': 'pythonnative',
+                'python3': 'python3native',
+                'perl': 'perlnative',
+                'makeinfo': 'texinfo',
+                }
 
         pkg_re = re.compile('PKG_CHECK_MODULES\(\s*\[?[a-zA-Z0-9_]*\]?,\s*\[?([^,\]]*)\]?[),].*')
         pkgce_re = re.compile('PKG_CHECK_EXISTS\(\s*\[?([^,\]]*)\]?[),].*')
@@ -462,6 +482,8 @@ class AutotoolsRecipeHandler(RecipeHandler):
         deps = []
         unmapped = []
 
+        RecipeHandler.load_binmap(tinfoil.config_data)
+
         def process_macro(keyword, value):
             for handler in handlers:
                 if handler.process_macro(srctree, keyword, value, process_value, libdeps, pcdeps, deps, outlines, inherits, values):
@@ -498,10 +520,12 @@ class AutotoolsRecipeHandler(RecipeHandler):
                         if progclass:
                             inherits.append(progclass)
                         else:
-                            progdep = progmap.get(prog, None)
+                            progdep = RecipeHandler.recipebinmap.get(prog, None)
+                            if not progdep:
+                                progdep = progmap.get(prog, None)
                             if progdep:
                                 deps.append(progdep)
-                            else:
+                            elif progdep is None:
                                 if not prog.startswith('$'):
                                     unmapped.append(prog)
             elif keyword == 'AC_CHECK_LIB':
-- 
2.5.0


