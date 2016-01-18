Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id F2C8373177
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 11:19:26 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 18 Jan 2016 03:19:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,312,1449561600"; d="scan'208";a="635440102"
Received: from stan94-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.180.176])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Jan 2016 03:19:23 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 00:18:33 +1300
Message-Id: <3ea28fde6e7790afab44f61009b64d273c3d9994.1453115842.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1453115842.git.paul.eggleton@linux.intel.com>
References: <cover.1453115842.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1453115842.git.paul.eggleton@linux.intel.com>
References: <cover.1453115842.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 08/10] recipetool: create: add basic support for extracting dependencies from cmake
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
X-List-Received-Date: Mon, 18 Jan 2016 11:19:27 -0000

Add support for extracting dependencies from CMakeLists.txt. There's
still a bunch of things missing that are outside the scope of OE-Core
and we still lack a proper extension mechanism, but this is a good
start.

This also adds an oe-selftest test to exercise the new code a bit.

Implements [YOCTO #7635].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/recipetool.py      |  17 +++
 scripts/lib/recipetool/create.py          |   3 +
 scripts/lib/recipetool/create_buildsys.py | 177 +++++++++++++++++++++++++++++-
 3 files changed, 191 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/recipetool.py b/meta/lib/oeqa/selftest/recipetool.py
index 927da73..b4d33bc 100644
--- a/meta/lib/oeqa/selftest/recipetool.py
+++ b/meta/lib/oeqa/selftest/recipetool.py
@@ -422,6 +422,23 @@ class RecipetoolTests(RecipetoolBase):
         inherits = ['autotools']
         self._test_recipe_contents(os.path.join(temprecipe, dirlist[0]), checkvars, inherits)
 
+    def test_recipetool_create_cmake(self):
+        # Try adding a recipe
+        temprecipe = os.path.join(self.tempdir, 'recipe')
+        os.makedirs(temprecipe)
+        recipefile = os.path.join(temprecipe, 'navit_0.5.0.bb')
+        srcuri = 'http://downloads.sourceforge.net/project/navit/v0.5.0/navit-0.5.0.tar.gz'
+        result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
+        self.assertTrue(os.path.isfile(recipefile))
+        checkvars = {}
+        checkvars['LICENSE'] = set(['Unknown', 'GPLv2', 'LGPLv2'])
+        checkvars['SRC_URI'] = 'http://downloads.sourceforge.net/project/navit/v${PV}/navit-${PV}.tar.gz'
+        checkvars['SRC_URI[md5sum]'] = '242f398e979a6b8c0f3c802b63435b68'
+        checkvars['SRC_URI[sha256sum]'] = '13353481d7fc01a4f64e385dda460b51496366bba0fd2cc85a89a0747910e94d'
+        checkvars['DEPENDS'] = set(['freetype', 'zlib', 'openssl', 'glib-2.0', 'virtual/libgl', 'virtual/egl', 'gtk+', 'libpng', 'libsdl', 'freeglut', 'dbus-glib'])
+        inherits = ['cmake', 'python-dir', 'gettext', 'pkgconfig']
+        self._test_recipe_contents(recipefile, checkvars, inherits)
+
 class RecipetoolAppendsrcBase(RecipetoolBase):
     def _try_recipetool_appendsrcfile(self, testrecipe, newfile, destfile, options, expectedlines, expectedfiles):
         cmd = 'recipetool appendsrcfile %s %s %s %s %s' % (options, self.templayerdir, testrecipe, newfile, destfile)
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 1601a7f..ad6bf7b 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -558,6 +558,8 @@ def create_recipe(args):
     outlines = []
     outlines.extend(lines_before)
     if classes:
+        if outlines[-1] and not outlines[-1].startswith('#'):
+            outlines.append('')
         outlines.append('inherit %s' % ' '.join(classes))
         outlines.append('')
     outlines.extend(lines_after)
@@ -627,6 +629,7 @@ def get_license_md5sums(d, static_only=False):
     md5sums['5f30f0716dfdd0d91eb439ebec522ec2'] = 'LGPLv2'
     md5sums['55ca817ccb7d5b5b66355690e9abc605'] = 'LGPLv2'
     md5sums['252890d9eee26aab7b432e8b8a616475'] = 'LGPLv2'
+    md5sums['3214f080875748938ba060314b4f727d'] = 'LGPLv2'
     md5sums['d32239bcb673463ab874e80d47fae504'] = 'GPLv3'
     md5sums['f27defe1e96c2e1ecd4e0c9be8967949'] = 'GPLv3'
     md5sums['6a6a8e020838b23406c81b19c1d46df6'] = 'LGPLv3'
diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index 40659d1..6afb5de 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -36,6 +36,7 @@ class CmakeRecipeHandler(RecipeHandler):
         if RecipeHandler.checkfiles(srctree, ['CMakeLists.txt']):
             classes.append('cmake')
             values = CmakeRecipeHandler.extract_cmake_deps(lines_before, srctree, extravalues)
+            classes.extend(values.pop('inherit', '').split())
             for var, value in values.iteritems():
                 lines_before.append('%s = "%s"' % (var, value))
             lines_after.append('# Specify any options you want to pass to cmake using EXTRA_OECMAKE:')
@@ -48,18 +49,182 @@ class CmakeRecipeHandler(RecipeHandler):
     @staticmethod
     def extract_cmake_deps(outlines, srctree, extravalues, cmakelistsfile=None):
         values = {}
+        inherits = []
 
         if cmakelistsfile:
             srcfiles = [cmakelistsfile]
         else:
             srcfiles = RecipeHandler.checkfiles(srctree, ['CMakeLists.txt'])
 
-        proj_re = re.compile('project\(([^)]*)\)', re.IGNORECASE)
-        with open(srcfiles[0], 'r') as f:
-            for line in f:
-                res = proj_re.match(line.strip())
-                if res:
-                    extravalues['PN'] = res.group(1).split()[0]
+        # Note that some of these are non-standard, but probably better to
+        # be able to map them anyway if we see them
+        cmake_pkgmap = {'alsa': 'alsa-lib',
+                        'aspell': 'aspell',
+                        'atk': 'atk',
+                        'bison': 'bison-native',
+                        'boost': 'boost',
+                        'bzip2': 'bzip2',
+                        'cairo': 'cairo',
+                        'cups': 'cups',
+                        'curl': 'curl',
+                        'curses': 'ncurses',
+                        'cvs': 'cvs',
+                        'drm': 'libdrm',
+                        'dbus': 'dbus',
+                        'dbusglib': 'dbus-glib',
+                        'egl': 'virtual/egl',
+                        'expat': 'expat',
+                        'flex': 'flex-native',
+                        'fontconfig': 'fontconfig',
+                        'freetype': 'freetype',
+                        'gettext': '',
+                        'git': '',
+                        'gio': 'glib-2.0',
+                        'giounix': 'glib-2.0',
+                        'glew': 'glew',
+                        'glib': 'glib-2.0',
+                        'glib2': 'glib-2.0',
+                        'glu': 'libglu',
+                        'glut': 'freeglut',
+                        'gobject': 'glib-2.0',
+                        'gperf': 'gperf-native',
+                        'gnutls': 'gnutls',
+                        'gtk2': 'gtk+',
+                        'gtk3': 'gtk+3',
+                        'gtk': 'gtk+3',
+                        'harfbuzz': 'harfbuzz',
+                        'icu': 'icu',
+                        'intl': 'virtual/libintl',
+                        'jpeg': 'jpeg',
+                        'libarchive': 'libarchive',
+                        'libiconv': 'virtual/libiconv',
+                        'liblzma': 'xz',
+                        'libxml2': 'libxml2',
+                        'libxslt': 'libxslt',
+                        'opengl': 'virtual/libgl',
+                        'openmp': '',
+                        'openssl': 'openssl',
+                        'pango': 'pango',
+                        'perl': '',
+                        'perllibs': '',
+                        'pkgconfig': '',
+                        'png': 'libpng',
+                        'pthread': '',
+                        'pythoninterp': '',
+                        'pythonlibs': '',
+                        'ruby': 'ruby-native',
+                        'sdl': 'libsdl',
+                        'sdl2': 'libsdl2',
+                        'subversion': 'subversion-native',
+                        'swig': 'swig-native',
+                        'tcl': 'tcl-native',
+                        'threads': '',
+                        'tiff': 'tiff',
+                        'wget': 'wget',
+                        'x11': 'libx11',
+                        'xcb': 'libxcb',
+                        'xext': 'libxext',
+                        'xfixes': 'libxfixes',
+                        'zlib': 'zlib',
+                        }
+
+        pcdeps = []
+        libdeps = []
+        deps = []
+        unmappedpkgs = []
+
+        proj_re = re.compile('project\s*\(([^)]*)\)', re.IGNORECASE)
+        pkgcm_re = re.compile('pkg_check_modules\s*\(\s*[a-zA-Z0-9-_]+\s*(REQUIRED)?\s+([^)\s]+)\s*\)', re.IGNORECASE)
+        pkgsm_re = re.compile('pkg_search_module\s*\(\s*[a-zA-Z0-9-_]+\s*(REQUIRED)?((\s+[^)\s]+)+)\s*\)', re.IGNORECASE)
+        findpackage_re = re.compile('find_package\s*\(\s*([a-zA-Z0-9-_]+)\s*.*', re.IGNORECASE)
+        checklib_re = re.compile('check_library_exists\s*\(\s*([^\s)]+)\s*.*', re.IGNORECASE)
+        include_re = re.compile('include\s*\(\s*([^)\s]*)\s*\)', re.IGNORECASE)
+        subdir_re = re.compile('add_subdirectory\s*\(\s*([^)\s]*)\s*([^)\s]*)\s*\)', re.IGNORECASE)
+        dep_re = re.compile('([^ ><=]+)( *[<>=]+ *[^ ><=]+)?')
+
+        def parse_cmake_file(fn, paths=None):
+            searchpaths = (paths or []) + [os.path.dirname(fn)]
+            logger.debug('Parsing file %s' % fn)
+            with open(fn, 'r') as f:
+                for line in f:
+                    line = line.strip()
+                    res = include_re.match(line)
+                    if res:
+                        includefn = bb.utils.which(':'.join(searchpaths), res.group(1))
+                        if includefn:
+                            parse_cmake_file(includefn, searchpaths)
+                        else:
+                            logger.debug('Unable to recurse into include file %s' % res.group(1))
+                        continue
+                    res = subdir_re.match(line)
+                    if res:
+                        subdirfn = os.path.join(os.path.dirname(fn), res.group(1), 'CMakeLists.txt')
+                        if os.path.exists(subdirfn):
+                            parse_cmake_file(subdirfn, searchpaths)
+                        else:
+                            logger.debug('Unable to recurse into subdirectory file %s' % subdirfn)
+                        continue
+                    res = proj_re.match(line)
+                    if res:
+                        extravalues['PN'] = res.group(1).split()[0]
+                        continue
+                    res = pkgcm_re.match(line)
+                    if res:
+                        res = dep_re.findall(res.group(2))
+                        if res:
+                            pcdeps.extend([x[0] for x in res])
+                        inherits.append('pkgconfig')
+                        continue
+                    res = pkgsm_re.match(line)
+                    if res:
+                        res = dep_re.findall(res.group(2))
+                        if res:
+                            # Note: appending a tuple here!
+                            item = tuple((x[0] for x in res))
+                            if len(item) == 1:
+                                item = item[0]
+                            pcdeps.append(item)
+                        inherits.append('pkgconfig')
+                        continue
+                    res = findpackage_re.match(line)
+                    if res:
+                        origpkg = res.group(1)
+                        pkg = origpkg.lower()
+                        if pkg == 'gettext':
+                            inherits.append('gettext')
+                        elif pkg == 'perl':
+                            inherits.append('perlnative')
+                        elif pkg == 'pkgconfig':
+                            inherits.append('pkgconfig')
+                        elif pkg == 'pythoninterp':
+                            inherits.append('pythonnative')
+                        elif pkg == 'pythonlibs':
+                            inherits.append('python-dir')
+                        else:
+                            dep = cmake_pkgmap.get(pkg, None)
+                            if dep:
+                                deps.append(dep)
+                            elif dep is None:
+                                unmappedpkgs.append(origpkg)
+                        continue
+                    res = checklib_re.match(line)
+                    if res:
+                        lib = res.group(1)
+                        if not lib.startswith('$'):
+                            libdeps.append(lib)
+                    if line.lower().startswith('useswig'):
+                        deps.append('swig-native')
+                        continue
+
+        parse_cmake_file(srcfiles[0])
+
+        if unmappedpkgs:
+            outlines.append('# NOTE: unable to map the following CMake package dependencies: %s' % ' '.join(unmappedpkgs))
+
+        RecipeHandler.handle_depends(libdeps, pcdeps, deps, outlines, values, tinfoil.config_data)
+
+        if inherits:
+            values['inherit'] = ' '.join(list(set(inherits)))
 
         return values
 
-- 
2.5.0


