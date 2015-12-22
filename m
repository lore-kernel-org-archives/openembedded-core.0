Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E3ED57318B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 04:04:37 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2015 20:04:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,462,1444719600"; d="scan'208";a="621979021"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.148.44])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Dec 2015 20:04:34 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 17:03:02 +1300
Message-Id: <cb9857bda6f813aec1d28ab41a93e0c61a90b727.1450756555.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 09/26] recipetool: create: support extracting name and version from build scripts
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
X-List-Received-Date: Tue, 22 Dec 2015 04:04:38 -0000

Some build systems (notably autotools) support declaring the name and
version of the program being built; since we need those for the recipe
we can attempt to extract them. It's a little fuzzy as they are often
omitted or may not be appropriately formatted for our purposes, but it
does work on a reasonable number of software packages to be useful.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py                |   2 +-
 meta/lib/oeqa/selftest/recipetool.py             |   2 +-
 scripts/lib/recipetool/create.py                 | 130 ++++++++---
 scripts/lib/recipetool/create_buildsys.py        | 282 +++++++++++++++++++----
 scripts/lib/recipetool/create_buildsys_python.py |   2 +-
 5 files changed, 344 insertions(+), 74 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 0a44ae7..8faea93 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -279,7 +279,7 @@ class DevtoolTests(DevtoolBase):
         self.assertIn('_git.bb', recipefile, 'Recipe file incorrectly named')
         checkvars = {}
         checkvars['S'] = '${WORKDIR}/git'
-        checkvars['PV'] = '1.0+git${SRCPV}'
+        checkvars['PV'] = '1.11+git${SRCPV}'
         checkvars['SRC_URI'] = url
         checkvars['SRCREV'] = '${AUTOREV}'
         self._test_recipe_contents(recipefile, checkvars, [])
diff --git a/meta/lib/oeqa/selftest/recipetool.py b/meta/lib/oeqa/selftest/recipetool.py
index b1f1d2ab..bbfce7c 100644
--- a/meta/lib/oeqa/selftest/recipetool.py
+++ b/meta/lib/oeqa/selftest/recipetool.py
@@ -395,7 +395,7 @@ class RecipetoolTests(RecipetoolBase):
         checkvars['LICENSE'] = 'LGPLv2.1'
         checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34'
         checkvars['S'] = '${WORKDIR}/git'
-        checkvars['PV'] = '1.0+git${SRCPV}'
+        checkvars['PV'] = '1.11+git${SRCPV}'
         checkvars['SRC_URI'] = srcuri
         checkvars['DEPENDS'] = 'libpng pango libx11 libxext jpeg'
         inherits = ['autotools', 'pkgconfig']
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 5c249ab..6c7b9fd 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -41,10 +41,17 @@ def tinfoil_init(instance):
 
 class RecipeHandler():
     @staticmethod
-    def checkfiles(path, speclist):
+    def checkfiles(path, speclist, recursive=False):
         results = []
-        for spec in speclist:
-            results.extend(glob.glob(os.path.join(path, spec)))
+        if recursive:
+            for root, _, files in os.walk(path):
+                for fn in files:
+                    for spec in speclist:
+                        if fnmatch.fnmatch(fn, spec):
+                            results.append(os.path.join(root, fn))
+        else:
+            for spec in speclist:
+                results.extend(glob.glob(os.path.join(path, spec)))
         return results
 
     def genfunction(self, outlines, funcname, content, python=False, forcespace=False):
@@ -70,10 +77,14 @@ class RecipeHandler():
         outlines.append('}')
         outlines.append('')
 
-    def process(self, srctree, classes, lines_before, lines_after, handled):
+    def process(self, srctree, classes, lines_before, lines_after, handled, extravalues):
         return False
 
 
+def validate_pv(pv):
+    if not pv or '_version' in pv.lower() or pv[0] not in '0123456789':
+        return False
+    return True
 
 def supports_srcrev(uri):
     localdata = bb.data.createCopy(tinfoil.config_data)
@@ -152,7 +163,12 @@ def create_recipe(args):
         srcuri = ''
         srctree = args.source
 
-    outfile = args.outfile
+    if args.outfile and os.path.isdir(args.outfile):
+        outfile = None
+        outdir = args.outfile
+    else:
+        outfile = args.outfile
+        outdir = None
     if outfile and outfile != '-':
         if os.path.exists(outfile):
             logger.error('Output file %s already exists' % outfile)
@@ -196,28 +212,29 @@ def create_recipe(args):
     lines_before.append('')
 
     # FIXME This is kind of a hack, we probably ought to be using bitbake to do this
-    # we'd also want a way to automatically set outfile based upon auto-detecting these values from the source if possible
-    recipefn = os.path.splitext(os.path.basename(outfile))[0]
-    fnsplit = recipefn.split('_')
-    if len(fnsplit) > 1:
-        pn = fnsplit[0]
-        pv = fnsplit[1]
-    else:
-        pn = recipefn
-        pv = None
+    pn = None
+    pv = None
+    if outfile:
+        recipefn = os.path.splitext(os.path.basename(outfile))[0]
+        fnsplit = recipefn.split('_')
+        if len(fnsplit) > 1:
+            pn = fnsplit[0]
+            pv = fnsplit[1]
+        else:
+            pn = recipefn
 
     if args.version:
         pv = args.version
 
+    if args.name:
+        pn = args.name
+
     if pv and pv not in 'git svn hg'.split():
         realpv = pv
     else:
         realpv = None
 
-    if srcuri:
-        if realpv:
-            srcuri = srcuri.replace(realpv, '${PV}')
-    else:
+    if not srcuri:
         lines_before.append('# No information for SRC_URI yet (only an external source tree was specified)')
     lines_before.append('SRC_URI = "%s"' % srcuri)
     (md5value, sha256value) = checksums
@@ -232,13 +249,7 @@ def create_recipe(args):
         lines_before.append('SRCREV = "%s"' % srcrev)
     lines_before.append('')
 
-    if srcsubdir and pv:
-        if srcsubdir == "%s-%s" % (pn, pv):
-            # This would be the default, so we don't need to set S in the recipe
-            srcsubdir = ''
     if srcsubdir:
-        if pv and pv not in 'git svn hg'.split():
-            srcsubdir = srcsubdir.replace(pv, '${PV}')
         lines_before.append('S = "${WORKDIR}/%s"' % srcsubdir)
         lines_before.append('')
 
@@ -276,8 +287,74 @@ def create_recipe(args):
         classes.append('bin_package')
         handled.append('buildsystem')
 
+    extravalues = {}
     for handler in handlers:
-        handler.process(srctree, classes, lines_before, lines_after, handled)
+        handler.process(srctree, classes, lines_before, lines_after, handled, extravalues)
+
+    if not realpv:
+        realpv = extravalues.get('PV', None)
+        if realpv:
+            if not validate_pv(realpv):
+                realpv = None
+            else:
+                realpv = realpv.lower().split()[0]
+                if '_' in realpv:
+                    realpv = realpv.replace('_', '-')
+    if not pn:
+        pn = extravalues.get('PN', None)
+        if pn:
+            if pn.startswith('GNU '):
+                pn = pn[4:]
+            if ' ' in pn:
+                # Probably a descriptive identifier rather than a proper name
+                pn = None
+            else:
+                pn = pn.lower()
+                if '_' in pn:
+                    pn = pn.replace('_', '-')
+
+    if not outfile:
+        if not pn:
+            logger.error('Unable to determine short program name from source tree - please specify name with -N/--name or output file name with -o/--outfile')
+            # devtool looks for this specific exit code, so don't change it
+            sys.exit(15)
+        else:
+            if srcuri and srcuri.startswith(('git://', 'hg://', 'svn://')):
+                outfile = '%s_%s.bb' % (pn, srcuri.split(':', 1)[0])
+            elif realpv:
+                outfile = '%s_%s.bb' % (pn, realpv)
+            else:
+                outfile = '%s.bb' % pn
+            if outdir:
+                outfile = os.path.join(outdir, outfile)
+            # We need to check this again
+            if os.path.exists(outfile):
+                logger.error('Output file %s already exists' % outfile)
+                sys.exit(1)
+
+    lines = lines_before
+    lines_before = []
+    skipblank = True
+    for line in lines:
+        if skipblank:
+            skipblank = False
+            if not line:
+                continue
+        if line.startswith('S = '):
+            if realpv and pv not in 'git svn hg'.split():
+                line = line.replace(realpv, '${PV}')
+            if pn:
+                line = line.replace(pn, '${BPN}')
+            if line == 'S = "${WORKDIR}/${BPN}-${PV}"':
+                skipblank = True
+                continue
+        elif line.startswith('SRC_URI = '):
+            if realpv:
+                line = line.replace(realpv, '${PV}')
+        elif line.startswith('PV = '):
+            if realpv:
+                line = re.sub('"[^+]*\+', '"%s+' % realpv, line)
+        lines_before.append(line)
 
     outlines = []
     outlines.extend(lines_before)
@@ -469,9 +546,10 @@ def register_commands(subparsers):
                                           help='Create a new recipe',
                                           description='Creates a new recipe from a source tree')
     parser_create.add_argument('source', help='Path or URL to source')
-    parser_create.add_argument('-o', '--outfile', help='Specify filename for recipe to create', required=True)
+    parser_create.add_argument('-o', '--outfile', help='Specify filename for recipe to create')
     parser_create.add_argument('-m', '--machine', help='Make recipe machine-specific as opposed to architecture-specific', action='store_true')
     parser_create.add_argument('-x', '--extract-to', metavar='EXTRACTPATH', help='Assuming source is a URL, fetch it and extract it to the directory specified as %(metavar)s')
+    parser_create.add_argument('-N', '--name', help='Name to use within recipe (PN)')
     parser_create.add_argument('-V', '--version', help='Version to use within recipe (PV)')
     parser_create.add_argument('-b', '--binary', help='Treat the source tree as something that should be installed verbatim (no compilation, same directory structure)', action='store_true')
     parser_create.set_defaults(func=create_recipe)
diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index 931ef3b..0aff59e 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -17,7 +17,7 @@
 
 import re
 import logging
-from recipetool.create import RecipeHandler, read_pkgconfig_provides
+from recipetool.create import RecipeHandler, read_pkgconfig_provides, validate_pv
 
 logger = logging.getLogger('recipetool')
 
@@ -27,13 +27,17 @@ def tinfoil_init(instance):
     global tinfoil
     tinfoil = instance
 
+
 class CmakeRecipeHandler(RecipeHandler):
-    def process(self, srctree, classes, lines_before, lines_after, handled):
+    def process(self, srctree, classes, lines_before, lines_after, handled, extravalues):
         if 'buildsystem' in handled:
             return False
 
         if RecipeHandler.checkfiles(srctree, ['CMakeLists.txt']):
             classes.append('cmake')
+            values = CmakeRecipeHandler.extract_cmake_deps(lines_before, srctree, extravalues)
+            for var, value in values.iteritems():
+                lines_before.append('%s = "%s"' % (var, value))
             lines_after.append('# Specify any options you want to pass to cmake using EXTRA_OECMAKE:')
             lines_after.append('EXTRA_OECMAKE = ""')
             lines_after.append('')
@@ -41,8 +45,26 @@ class CmakeRecipeHandler(RecipeHandler):
             return True
         return False
 
+    @staticmethod
+    def extract_cmake_deps(outlines, srctree, extravalues, cmakelistsfile=None):
+        values = {}
+
+        if cmakelistsfile:
+            srcfiles = [cmakelistsfile]
+        else:
+            srcfiles = RecipeHandler.checkfiles(srctree, ['CMakeLists.txt'])
+
+        proj_re = re.compile('project\(([^)]*)\)', re.IGNORECASE)
+        with open(srcfiles[0], 'r') as f:
+            for line in f:
+                res = proj_re.match(line.strip())
+                if res:
+                    extravalues['PN'] = res.group(1).split()[0]
+
+        return values
+
 class SconsRecipeHandler(RecipeHandler):
-    def process(self, srctree, classes, lines_before, lines_after, handled):
+    def process(self, srctree, classes, lines_before, lines_after, handled, extravalues):
         if 'buildsystem' in handled:
             return False
 
@@ -56,7 +78,7 @@ class SconsRecipeHandler(RecipeHandler):
         return False
 
 class QmakeRecipeHandler(RecipeHandler):
-    def process(self, srctree, classes, lines_before, lines_after, handled):
+    def process(self, srctree, classes, lines_before, lines_after, handled, extravalues):
         if 'buildsystem' in handled:
             return False
 
@@ -67,14 +89,14 @@ class QmakeRecipeHandler(RecipeHandler):
         return False
 
 class AutotoolsRecipeHandler(RecipeHandler):
-    def process(self, srctree, classes, lines_before, lines_after, handled):
+    def process(self, srctree, classes, lines_before, lines_after, handled, extravalues):
         if 'buildsystem' in handled:
             return False
 
         autoconf = False
         if RecipeHandler.checkfiles(srctree, ['configure.ac', 'configure.in']):
             autoconf = True
-            values = AutotoolsRecipeHandler.extract_autotools_deps(lines_before, srctree)
+            values = AutotoolsRecipeHandler.extract_autotools_deps(lines_before, srctree, extravalues)
             classes.extend(values.pop('inherit', '').split())
             for var, value in values.iteritems():
                 lines_before.append('%s = "%s"' % (var, value))
@@ -88,6 +110,22 @@ class AutotoolsRecipeHandler(RecipeHandler):
                             autoconf = True
                             break
 
+        if autoconf and not ('PV' in extravalues and 'PN' in extravalues):
+            # Last resort
+            conffile = RecipeHandler.checkfiles(srctree, ['configure'])
+            if conffile:
+                with open(conffile[0], 'r') as f:
+                    for line in f:
+                        line = line.strip()
+                        if line.startswith('VERSION=') or line.startswith('PACKAGE_VERSION='):
+                            pv = line.split('=')[1].strip('"\'')
+                            if pv and not 'PV' in extravalues and validate_pv(pv):
+                                extravalues['PV'] = pv
+                        elif line.startswith('PACKAGE_NAME=') or line.startswith('PACKAGE='):
+                            pn = line.split('=')[1].strip('"\'')
+                            if pn and not 'PN' in extravalues:
+                                extravalues['PN'] = pn
+
         if autoconf:
             lines_before.append('# NOTE: if this software is not capable of being built in a separate build directory')
             lines_before.append('# from the source, you should replace autotools with autotools-brokensep in the')
@@ -102,7 +140,7 @@ class AutotoolsRecipeHandler(RecipeHandler):
         return False
 
     @staticmethod
-    def extract_autotools_deps(outlines, srctree, acfile=None):
+    def extract_autotools_deps(outlines, srctree, extravalues=None, acfile=None):
         import shlex
         import oe.package
 
@@ -122,6 +160,9 @@ class AutotoolsRecipeHandler(RecipeHandler):
         lib_re = re.compile('AC_CHECK_LIB\(\[?([a-zA-Z0-9]*)\]?, .*')
         progs_re = re.compile('_PROGS?\(\[?[a-zA-Z0-9]*\]?, \[?([^,\]]*)\]?[),].*')
         dep_re = re.compile('([^ ><=]+)( [<>=]+ [^ ><=]+)?')
+        ac_init_re = re.compile('AC_INIT\(([^,]+), *([^,]+)[,)].*')
+        am_init_re = re.compile('AM_INIT_AUTOMAKE\(([^,]+), *([^,]+)[,)].*')
+        define_re = re.compile(' *(m4_)?define\(([^,]+), *([^,]+)\)')
 
         # Build up lib library->package mapping
         shlib_providers = oe.package.read_shlib_providers(tinfoil.config_data)
@@ -157,55 +198,157 @@ class AutotoolsRecipeHandler(RecipeHandler):
                 else:
                     raise
 
+        defines = {}
+        def subst_defines(value):
+            newvalue = value
+            for define, defval in defines.iteritems():
+                newvalue = newvalue.replace(define, defval)
+            if newvalue != value:
+                return subst_defines(newvalue)
+            return value
+
+        def process_value(value):
+            value = value.replace('[', '').replace(']', '')
+            if value.startswith('m4_esyscmd(') or value.startswith('m4_esyscmd_s('):
+                cmd = subst_defines(value[value.index('(')+1:-1])
+                try:
+                    if '|' in cmd:
+                        cmd = 'set -o pipefail; ' + cmd
+                    stdout, _ = bb.process.run(cmd, cwd=srctree, shell=True)
+                    ret = stdout.rstrip()
+                except bb.process.ExecutionError as e:
+                    ret = ''
+            elif value.startswith('m4_'):
+                return None
+            ret = subst_defines(value)
+            if ret:
+                ret = ret.strip('"\'')
+            return ret
+
         # Since a configure.ac file is essentially a program, this is only ever going to be
         # a hack unfortunately; but it ought to be enough of an approximation
         if acfile:
             srcfiles = [acfile]
         else:
-            srcfiles = RecipeHandler.checkfiles(srctree, ['configure.ac', 'configure.in'])
+            srcfiles = RecipeHandler.checkfiles(srctree, ['acinclude.m4', 'configure.ac', 'configure.in'])
+
         pcdeps = []
         deps = []
         unmapped = []
         unmappedlibs = []
-        with open(srcfiles[0], 'r') as f:
-            for line in f:
-                if 'PKG_CHECK_MODULES' in line:
-                    res = pkg_re.search(line)
-                    if res:
-                        res = dep_re.findall(res.group(1))
-                        if res:
-                            pcdeps.extend([x[0] for x in res])
-                    inherits.append('pkgconfig')
-                if line.lstrip().startswith('AM_GNU_GETTEXT'):
-                    inherits.append('gettext')
-                elif 'AC_CHECK_PROG' in line or 'AC_PATH_PROG' in line:
-                    res = progs_re.search(line)
+
+        def process_macro(keyword, value):
+            if keyword == 'PKG_CHECK_MODULES':
+                res = pkg_re.search(value)
+                if res:
+                    res = dep_re.findall(res.group(1))
                     if res:
-                        for prog in shlex.split(res.group(1)):
-                            prog = prog.split()[0]
-                            progclass = progclassmap.get(prog, None)
-                            if progclass:
-                                inherits.append(progclass)
+                        pcdeps.extend([x[0] for x in res])
+                inherits.append('pkgconfig')
+            elif keyword == 'AM_GNU_GETTEXT':
+                inherits.append('gettext')
+            elif keyword == 'AC_CHECK_PROG' or keyword == 'AC_PATH_PROG':
+                res = progs_re.search(value)
+                if res:
+                    for prog in shlex.split(res.group(1)):
+                        prog = prog.split()[0]
+                        progclass = progclassmap.get(prog, None)
+                        if progclass:
+                            inherits.append(progclass)
+                        else:
+                            progdep = progmap.get(prog, None)
+                            if progdep:
+                                deps.append(progdep)
                             else:
-                                progdep = progmap.get(prog, None)
-                                if progdep:
-                                    deps.append(progdep)
-                                else:
-                                    if not prog.startswith('$'):
-                                        unmapped.append(prog)
-                elif 'AC_CHECK_LIB' in line:
-                    res = lib_re.search(line)
+                                if not prog.startswith('$'):
+                                    unmapped.append(prog)
+            elif keyword == 'AC_CHECK_LIB':
+                res = lib_re.search(value)
+                if res:
+                    lib = res.group(1)
+                    libdep = recipelibmap.get(lib, None)
+                    if libdep:
+                        deps.append(libdep)
+                    else:
+                        if libdep is None:
+                            if not lib.startswith('$'):
+                                unmappedlibs.append(lib)
+            elif keyword == 'AC_PATH_X':
+                deps.append('libx11')
+            elif keyword == 'AC_INIT':
+                if extravalues is not None:
+                    res = ac_init_re.match(value)
                     if res:
-                        lib = res.group(1)
-                        libdep = recipelibmap.get(lib, None)
-                        if libdep:
-                            deps.append(libdep)
-                        else:
-                            if libdep is None:
-                                if not lib.startswith('$'):
-                                    unmappedlibs.append(lib)
-                elif 'AC_PATH_X' in line:
-                    deps.append('libx11')
+                        extravalues['PN'] = process_value(res.group(1))
+                        pv = process_value(res.group(2))
+                        if validate_pv(pv):
+                            extravalues['PV'] = pv
+            elif keyword == 'AM_INIT_AUTOMAKE':
+                if extravalues is not None:
+                    if 'PN' not in extravalues:
+                        res = am_init_re.match(value)
+                        if res:
+                            if res.group(1) != 'AC_PACKAGE_NAME':
+                                extravalues['PN'] = process_value(res.group(1))
+                            pv = process_value(res.group(2))
+                            if validate_pv(pv):
+                                extravalues['PV'] = pv
+            elif keyword == 'define(':
+                res = define_re.match(value)
+                if res:
+                    key = res.group(2).strip('[]')
+                    value = process_value(res.group(3))
+                    if value is not None:
+                        defines[key] = value
+
+        keywords = ['PKG_CHECK_MODULES',
+                    'AM_GNU_GETTEXT',
+                    'AC_CHECK_PROG',
+                    'AC_PATH_PROG',
+                    'AC_CHECK_LIB',
+                    'AC_PATH_X',
+                    'AC_INIT',
+                    'AM_INIT_AUTOMAKE',
+                    'define(',
+                    ]
+        for srcfile in srcfiles:
+            nesting = 0
+            in_keyword = ''
+            partial = ''
+            with open(srcfile, 'r') as f:
+                for line in f:
+                    if in_keyword:
+                        partial += ' ' + line.strip()
+                        if partial.endswith('\\'):
+                            partial = partial[:-1]
+                        nesting = nesting + line.count('(') - line.count(')')
+                        if nesting == 0:
+                            process_macro(in_keyword, partial)
+                            partial = ''
+                            in_keyword = ''
+                    else:
+                        for keyword in keywords:
+                            if keyword in line:
+                                nesting = line.count('(') - line.count(')')
+                                if nesting > 0:
+                                    partial = line.strip()
+                                    if partial.endswith('\\'):
+                                        partial = partial[:-1]
+                                    in_keyword = keyword
+                                else:
+                                    process_macro(keyword, line.strip())
+                                break
+
+            if in_keyword:
+                process_macro(in_keyword, partial)
+
+        if extravalues:
+            for k,v in extravalues.items():
+                if v:
+                    if v.startswith('$') or v.startswith('@') or v.startswith('%'):
+                        del extravalues[k]
+                    else:
+                        extravalues[k] = v.strip('"\'').rstrip('()')
 
         if unmapped:
             outlines.append('# NOTE: the following prog dependencies are unknown, ignoring: %s' % ' '.join(unmapped))
@@ -240,7 +383,7 @@ class AutotoolsRecipeHandler(RecipeHandler):
 
 
 class MakefileRecipeHandler(RecipeHandler):
-    def process(self, srctree, classes, lines_before, lines_after, handled):
+    def process(self, srctree, classes, lines_before, lines_after, handled, extravalues):
         if 'buildsystem' in handled:
             return False
 
@@ -307,6 +450,53 @@ class MakefileRecipeHandler(RecipeHandler):
             self.genfunction(lines_after, 'do_install', ['# Specify install commands here'])
 
 
+class VersionFileRecipeHandler(RecipeHandler):
+    def process(self, srctree, classes, lines_before, lines_after, handled, extravalues):
+        if 'PV' not in extravalues:
+            # Look for a VERSION or version file containing a single line consisting
+            # only of a version number
+            filelist = RecipeHandler.checkfiles(srctree, ['VERSION', 'version'])
+            version = None
+            for fileitem in filelist:
+                linecount = 0
+                with open(fileitem, 'r') as f:
+                    for line in f:
+                        line = line.rstrip().strip('"\'')
+                        linecount += 1
+                        if line:
+                            if linecount > 1:
+                                version = None
+                                break
+                            else:
+                                if validate_pv(line):
+                                    version = line
+                if version:
+                    extravalues['PV'] = version
+                    break
+
+
+class SpecFileRecipeHandler(RecipeHandler):
+    def process(self, srctree, classes, lines_before, lines_after, handled, extravalues):
+        if 'PV' in extravalues and 'PN' in extravalues:
+            return
+        filelist = RecipeHandler.checkfiles(srctree, ['*.spec'], recursive=True)
+        pn = None
+        pv = None
+        for fileitem in filelist:
+            linecount = 0
+            with open(fileitem, 'r') as f:
+                for line in f:
+                    if line.startswith('Name:') and not pn:
+                        pn = line.split(':')[1].strip()
+                    if line.startswith('Version:') and not pv:
+                        pv = line.split(':')[1].strip()
+            if pv or pn:
+                if pv and not 'PV' in extravalues and validate_pv(pv):
+                    extravalues['PV'] = pv
+                if pn and not 'PN' in extravalues:
+                    extravalues['PN'] = pn
+                break
+
 def register_recipe_handlers(handlers):
     # These are in a specific order so that the right one is detected first
     handlers.append(CmakeRecipeHandler())
@@ -314,3 +504,5 @@ def register_recipe_handlers(handlers):
     handlers.append(SconsRecipeHandler())
     handlers.append(QmakeRecipeHandler())
     handlers.append(MakefileRecipeHandler())
+    handlers.append((VersionFileRecipeHandler(), -1))
+    handlers.append((SpecFileRecipeHandler(), -1))
diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index 266c423..4d65c96 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -159,7 +159,7 @@ class PythonRecipeHandler(RecipeHandler):
     def __init__(self):
         pass
 
-    def process(self, srctree, classes, lines_before, lines_after, handled):
+    def process(self, srctree, classes, lines_before, lines_after, handled, extravalues):
         if 'buildsystem' in handled:
             return False
 
-- 
2.5.0


