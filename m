Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C4C166FF6B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2016 03:12:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 28 Jun 2016 20:12:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,544,1459839600"; d="scan'208";a="726582569"
Received: from hkao-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.158])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Jun 2016 20:12:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2016 15:12:03 +1200
Message-Id: <7c749720e8f23828d5312b040be0b0451f2fd009.1467169903.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1467169903.git.paul.eggleton@linux.intel.com>
References: <cover.1467169903.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1467169903.git.paul.eggleton@linux.intel.com>
References: <cover.1467169903.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] recipetool: create: avoid decoding errors with Python 3
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
X-List-Received-Date: Wed, 29 Jun 2016 03:12:11 -0000

We're opening source files with the default encoding (utf-8) but we
can't necessarily be sure that they are UTF-8 clean - for example,
recipetool create ftp://mama.indstate.edu/linux/tree/tree-1.7.0.tgz
prior to this patch resulted in a UnicodeDecodeError. Use the
"surrogateescape" mode to avoid this.

Fixes [YOCTO #9822].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py          |  6 +++---
 scripts/lib/recipetool/create_buildsys.py | 14 +++++++-------
 scripts/lib/recipetool/create_kernel.py   |  2 +-
 scripts/lib/recipetool/create_kmod.py     |  4 ++--
 scripts/lib/recipetool/create_npm.py      |  2 +-
 5 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 1297428..042e700 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -390,7 +390,7 @@ def create_recipe(args):
                 srcsubdir = dirlist[0]
                 srctree = os.path.join(srctree, srcsubdir)
             else:
-                with open(singleitem, 'r') as f:
+                with open(singleitem, 'r', errors='surrogateescape') as f:
                     if '<html' in f.read(100).lower():
                         logger.error('Fetching "%s" returned a single HTML page - check the URL is correct and functional' % fetchuri)
                         sys.exit(1)
@@ -840,7 +840,7 @@ def crunch_license(licfile):
     # https://github.com/FFmpeg/FFmpeg/blob/master/COPYING.LGPLv3
     crunched_md5sums['2ebfb3bb49b9a48a075cc1425e7f4129'] = 'LGPLv3'
     lictext = []
-    with open(licfile, 'r') as f:
+    with open(licfile, 'r', errors='surrogateescape') as f:
         for line in f:
             # Drop opening statements
             if copyright_re.match(line):
@@ -978,7 +978,7 @@ def convert_debian(debpath):
 
     values = {}
     depends = []
-    with open(os.path.join(debpath, 'control')) as f:
+    with open(os.path.join(debpath, 'control'), 'r', errors='surrogateescape') as f:
         indesc = False
         for line in f:
             if indesc:
diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index 78ae4bc..b54cb17 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -173,7 +173,7 @@ class CmakeRecipeHandler(RecipeHandler):
         def parse_cmake_file(fn, paths=None):
             searchpaths = (paths or []) + [os.path.dirname(fn)]
             logger.debug('Parsing file %s' % fn)
-            with open(fn, 'r') as f:
+            with open(fn, 'r', errors='surrogateescape') as f:
                 for line in f:
                     line = line.strip()
                     for handler in handlers:
@@ -354,7 +354,7 @@ class AutotoolsRecipeHandler(RecipeHandler):
             conffile = RecipeHandler.checkfiles(srctree, ['configure'])
             if conffile:
                 # Check if this is just a pre-generated autoconf configure script
-                with open(conffile[0], 'r') as f:
+                with open(conffile[0], 'r', errors='surrogateescape') as f:
                     for i in range(1, 10):
                         if 'Generated by GNU Autoconf' in f.readline():
                             autoconf = True
@@ -364,7 +364,7 @@ class AutotoolsRecipeHandler(RecipeHandler):
             # Last resort
             conffile = RecipeHandler.checkfiles(srctree, ['configure'])
             if conffile:
-                with open(conffile[0], 'r') as f:
+                with open(conffile[0], 'r', errors='surrogateescape') as f:
                     for line in f:
                         line = line.strip()
                         if line.startswith('VERSION=') or line.startswith('PACKAGE_VERSION='):
@@ -654,7 +654,7 @@ class AutotoolsRecipeHandler(RecipeHandler):
             nesting = 0
             in_keyword = ''
             partial = ''
-            with open(srcfile, 'r') as f:
+            with open(srcfile, 'r', errors='surrogateescape') as f:
                 for line in f:
                     if in_keyword:
                         partial += ' ' + line.strip()
@@ -780,7 +780,7 @@ class MakefileRecipeHandler(RecipeHandler):
             if installtarget:
                 func.append('# This is a guess; additional arguments may be required')
                 makeargs = ''
-                with open(makefile[0], 'r') as f:
+                with open(makefile[0], 'r', errors='surrogateescape') as f:
                     for i in range(1, 100):
                         if 'DESTDIR' in f.readline():
                             makeargs += " 'DESTDIR=${D}'"
@@ -809,7 +809,7 @@ class VersionFileRecipeHandler(RecipeHandler):
             version = None
             for fileitem in filelist:
                 linecount = 0
-                with open(fileitem, 'r') as f:
+                with open(fileitem, 'r', errors='surrogateescape') as f:
                     for line in f:
                         line = line.rstrip().strip('"\'')
                         linecount += 1
@@ -838,7 +838,7 @@ class SpecFileRecipeHandler(RecipeHandler):
         foundvalues = {}
         for fileitem in filelist:
             linecount = 0
-            with open(fileitem, 'r') as f:
+            with open(fileitem, 'r', errors='surrogateescape') as f:
                 for line in f:
                     for value, varname in valuemap.items():
                         if line.startswith(value + ':') and not varname in foundvalues:
diff --git a/scripts/lib/recipetool/create_kernel.py b/scripts/lib/recipetool/create_kernel.py
index c6e86bd..7dac59f 100644
--- a/scripts/lib/recipetool/create_kernel.py
+++ b/scripts/lib/recipetool/create_kernel.py
@@ -59,7 +59,7 @@ class KernelRecipeHandler(RecipeHandler):
                     kpatchlevel = -1
                     ksublevel = -1
                     kextraversion = ''
-                    with open(makefile, 'r') as f:
+                    with open(makefile, 'r', errors='surrogateescape') as f:
                         for i, line in enumerate(f):
                             if i > 10:
                                 break
diff --git a/scripts/lib/recipetool/create_kmod.py b/scripts/lib/recipetool/create_kmod.py
index fe39edb..7cf188d 100644
--- a/scripts/lib/recipetool/create_kmod.py
+++ b/scripts/lib/recipetool/create_kmod.py
@@ -53,7 +53,7 @@ class KernelModuleRecipeHandler(RecipeHandler):
                             break
                 else:
                     continue
-                with open(cfile, 'r') as f:
+                with open(cfile, 'r', errors='surrogateescape') as f:
                     for line in f:
                         if module_inc_re.match(line.strip()):
                             is_module = True
@@ -73,7 +73,7 @@ class KernelModuleRecipeHandler(RecipeHandler):
             in_install = False
             in_compile = False
             install_target = None
-            with open(makefile, 'r') as f:
+            with open(makefile, 'r', errors='surrogateescape') as f:
                 for line in f:
                     if line.startswith('install:'):
                         if not install_lines:
diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index fcc0172..e5aaa60 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -92,7 +92,7 @@ class NpmRecipeHandler(RecipeHandler):
             return False
 
         def read_package_json(fn):
-            with open(fn, 'r') as f:
+            with open(fn, 'r', errors='surrogateescape') as f:
                 return json.loads(f.read())
 
         files = RecipeHandler.checkfiles(srctree, ['package.json'])
-- 
2.5.5


