Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A3465722E1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 17:29:53 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 Nov 2014 09:29:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,456,1413270000"; d="scan'208";a="637908746"
Received: from ksperera-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.204])
	by fmsmga002.fm.intel.com with ESMTP; 25 Nov 2014 09:29:51 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Nov 2014 17:28:44 +0000
Message-Id: <14fac098d7a51b211dd435dc40a956e1a6b87c0c.1416934753.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1416934753.git.paul.eggleton@linux.intel.com>
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1416934753.git.paul.eggleton@linux.intel.com>
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
Subject: [RFC PATCH 4/7] scripts/recipetool: Add a recipe auto-creation script
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
X-List-Received-Date: Tue, 25 Nov 2014 17:29:55 -0000

Add a more maintainable and flexible script for creating at least the
skeleton of a recipe based on an examination of the source tree.
Commands can be added and the creation process can be extended through
plugins.

[YOCTO #6406]

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/__init__.py        |   0
 scripts/lib/recipetool/create.py          | 375 ++++++++++++++++++++++++++++++
 scripts/lib/recipetool/create_buildsys.py | 234 +++++++++++++++++++
 scripts/recipetool                        | 124 ++++++++++
 4 files changed, 733 insertions(+)
 create mode 100644 scripts/lib/recipetool/__init__.py
 create mode 100644 scripts/lib/recipetool/create.py
 create mode 100644 scripts/lib/recipetool/create_buildsys.py
 create mode 100755 scripts/recipetool

diff --git a/scripts/lib/recipetool/__init__.py b/scripts/lib/recipetool/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
new file mode 100644
index 0000000..07b33a8
--- /dev/null
+++ b/scripts/lib/recipetool/create.py
@@ -0,0 +1,375 @@
+# Recipe creation tool - create command plugin
+#
+# Copyright (C) 2014 Intel Corporation
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+
+import sys
+import os
+import argparse
+import glob
+import fnmatch
+import re
+import logging
+
+logger = logging.getLogger('recipetool')
+
+tinfoil = None
+plugins = None
+
+def plugin_init(pluginlist):
+    # Take a reference to the list so we can use it later
+    global plugins
+    plugins = pluginlist
+
+def tinfoil_init(instance):
+    global tinfoil
+    tinfoil = instance
+
+class RecipeHandler():
+    def checkfiles(self, path, speclist):
+        results = []
+        for spec in speclist:
+            results.extend(glob.glob(os.path.join(path, spec)))
+        return results
+
+    def genfunction(self, outlines, funcname, content):
+        outlines.append('%s () {' % funcname)
+        for line in content:
+            outlines.append('\t%s' % line)
+        outlines.append('}')
+        outlines.append('')
+
+    def process(self, srctree, classes, lines_before, lines_after, handled):
+        return False
+
+
+
+def fetch_source(uri, destdir):
+    import bb.data
+    bb.utils.mkdirhier(destdir)
+    localdata = bb.data.createCopy(tinfoil.config_data)
+    bb.data.update_data(localdata)
+    localdata.setVar('BB_STRICT_CHECKSUM', '')
+    localdata.setVar('SRCREV', '${AUTOREV}')
+    ret = (None, None)
+    olddir = os.getcwd()
+    try:
+        fetcher = bb.fetch2.Fetch([uri], localdata)
+        for u in fetcher.ud:
+            ud = fetcher.ud[u]
+            ud.ignore_checksums = True
+        fetcher.download()
+        fetcher.unpack(destdir)
+        for u in fetcher.ud:
+            ud = fetcher.ud[u]
+            if ud.method.recommends_checksum(ud):
+                md5value = bb.utils.md5_file(ud.localpath)
+                sha256value = bb.utils.sha256_file(ud.localpath)
+                ret = (md5value, sha256value)
+    except bb.fetch2.BBFetchException, e:
+        raise bb.build.FuncFailed(e)
+    finally:
+        os.chdir(olddir)
+    return ret
+
+def supports_srcrev(uri):
+    localdata = bb.data.createCopy(tinfoil.config_data)
+    bb.data.update_data(localdata)
+    fetcher = bb.fetch2.Fetch([uri], localdata)
+    urldata = fetcher.ud
+    for u in urldata:
+        if urldata[u].method.supports_srcrev():
+            return True
+    return False
+
+def create_recipe(args):
+    import bb.process
+    import tempfile
+    import shutil
+
+    pkgarch = ""
+    if args.machine:
+        pkgarch = "${MACHINE_ARCH}"
+
+    checksums = (None, None)
+    tempsrc = ''
+    srcsubdir = ''
+    if '://' in args.source:
+        # Fetch a URL
+        srcuri = args.source
+        if args.externalsrc:
+            srctree = args.externalsrc
+        else:
+            tempsrc = tempfile.mkdtemp(prefix='recipetool-')
+            srctree = tempsrc
+        logger.info('Fetching %s...' % srcuri)
+        checksums = fetch_source(args.source, srctree)
+        dirlist = os.listdir(srctree)
+        if 'git.indirectionsymlink' in dirlist:
+            dirlist.remove('git.indirectionsymlink')
+        if len(dirlist) == 1 and os.path.isdir(os.path.join(srctree, dirlist[0])):
+            # We unpacked a single directory, so we should use that
+            srcsubdir = dirlist[0]
+            srctree = os.path.join(srctree, srcsubdir)
+    else:
+        # Assume we're pointing to an existing source tree
+        if args.externalsrc:
+            logger.error('externalsrc cannot be specified if source is a directory')
+            sys.exit(1)
+        if not os.path.isdir(args.source):
+            logger.error('Invalid source directory %s' % args.source)
+            sys.exit(1)
+        srcuri = ''
+        srctree = args.source
+
+    outfile = args.outfile
+    if outfile and outfile != '-':
+        if os.path.exists(outfile):
+            logger.error('Output file %s already exists' % outfile)
+            sys.exit(1)
+
+    lines_before = []
+    lines_after = []
+
+    lines_before.append('# Recipe created by %s' % os.path.basename(sys.argv[0]))
+    lines_before.append('# This is the basis of a recipe and may need further editing in order to be fully functional.')
+    lines_before.append('# (Feel free to remove these comments when editing.)')
+    lines_before.append('#')
+
+    licvalues = guess_license(srctree)
+    licenses = []
+    lic_files_chksum = []
+    for licvalue in licvalues:
+        if not licvalue[0] in licenses:
+            licenses.append(licvalue[0])
+        lic_files_chksum.append('file://%s;md5=%s' % (licvalue[1], licvalue[2]))
+    if licvalues:
+        lines_before.append('# WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best guesses - it is')
+        lines_before.append('# your responsibility to verify that the values are complete and correct.')
+        if len(licvalues) > 1:
+            lines_before.append('#')
+            lines_before.append('# NOTE: multiple licenses have been detected; if that is correct you should separate')
+            lines_before.append('# these in the LICENSE value using & if the multiple licenses all apply, or | if there')
+            lines_before.append('# is a choice between the multiple licenses. If in doubt, check the accompanying')
+            lines_before.append('# documentation to determine which situation is applicable.')
+    else:
+        lines_before.append('# Unable to find any files that looked like license statements. Check the accompanying')
+        lines_before.append('# documentation and source headers and set LICENSE and LIC_FILES_CHKSUM accordingly.')
+    lines_before.append('LICENSE = "%s"' % ' '.join(licenses))
+    lines_before.append('LIC_FILES_CHKSUM = "%s"' % ' \\\n                    '.join(lic_files_chksum))
+    lines_before.append('')
+
+    # FIXME This is kind of a hack, we probably ought to be using bitbake to do this
+    # we'd also want a way to automatically set outfile based upon auto-detecting these values from the source if possible
+    recipefn = os.path.splitext(os.path.basename(outfile))[0]
+    fnsplit = recipefn.split('_')
+    if len(fnsplit) > 1:
+        pn = fnsplit[0]
+        pv = fnsplit[1]
+    else:
+        pn = recipefn
+        pv = None
+
+    if srcuri:
+        if pv and pv not in 'git svn hg'.split():
+            srcuri = srcuri.replace(pv, '${PV}')
+    else:
+        lines_before.append('# No information for SRC_URI yet (only an external source tree was specified)')
+    lines_before.append('SRC_URI = "%s"' % srcuri)
+    (md5value, sha256value) = checksums
+    if md5value:
+        lines_before.append('SRC_URI[md5sum] = "%s"' % md5value)
+    if sha256value:
+        lines_before.append('SRC_URI[sha256sum] = "%s"' % sha256value)
+    if srcuri and supports_srcrev(srcuri):
+        lines_before.append('')
+        lines_before.append('# Modify these as desired')
+        lines_before.append('PV = "1.0+git${SRCPV}"')
+        lines_before.append('SRCREV = "${AUTOREV}"')
+    lines_before.append('')
+
+    if srcsubdir and pv:
+        if srcsubdir == "%s-%s" % (pn, pv):
+            # This would be the default, so we don't need to set S in the recipe
+            srcsubdir = ''
+    if srcsubdir:
+        lines_before.append('S = "${WORKDIR}/%s"' % srcsubdir)
+        lines_before.append('')
+
+    if pkgarch:
+        lines_after.append('PACKAGE_ARCH = "%s"' % pkgarch)
+        lines_after.append('')
+
+    # Find all plugins that want to register handlers
+    handlers = []
+    for plugin in plugins:
+        if hasattr(plugin, 'register_recipe_handlers'):
+            plugin.register_recipe_handlers(handlers)
+
+    # Apply the handlers
+    classes = []
+    handled = []
+    for handler in handlers:
+        handler.process(srctree, classes, lines_before, lines_after, handled)
+
+    outlines = []
+    outlines.extend(lines_before)
+    if classes:
+        outlines.append('inherit %s' % ' '.join(classes))
+        outlines.append('')
+    outlines.extend(lines_after)
+
+    if outfile == '-':
+        sys.stdout.write('\n'.join(outlines) + '\n')
+    else:
+        with open(outfile, 'w') as f:
+            f.write('\n'.join(outlines) + '\n')
+        logger.info('Recipe %s has been created; further editing may be required to make it fully functional' % outfile)
+
+    if tempsrc:
+        shutil.rmtree(tempsrc)
+
+    return 0
+
+
+def guess_license(srctree):
+    import bb
+    # Gather md5sums of license files in common license dir
+    #commonlicdir = os.path.abspath(os.path.join(os.path.basename(__file__), '../meta/files/common-licenses'))
+    commonlicdir = tinfoil.config_data.getVar('COMMON_LICENSE_DIR', True)
+    md5sums = {}
+    for fn in os.listdir(commonlicdir):
+        md5value = bb.utils.md5_file(os.path.join(commonlicdir, fn))
+        md5sums[md5value] = fn
+    # FIXME we probably want more common values of this as well
+    md5sums['94d55d512a9ba36caa9b7df079bae19f'] = 'GPLv2'
+    md5sums['b234ee4d69f5fce4486a80fdaf4a4263'] = 'GPLv2'
+    md5sums['59530bdf33659b29e73d4adb9f9f6552'] = 'GPLv2'
+    md5sums['bbb461211a33b134d42ed5ee802b37ff'] = 'LGPLv2.1'
+    md5sums['7fbc338309ac38fefcd64b04bb903e34'] = 'LGPLv2.1'
+    md5sums['d32239bcb673463ab874e80d47fae504'] = 'GPLv3'
+    md5sums['6a6a8e020838b23406c81b19c1d46df6'] = 'LGPLv3'
+    md5sums['9f604d8a4f8e74f4f5140845a21b6674'] = 'LGPLv2'
+
+    licenses = []
+    licspecs = ['LICENSE*', 'COPYING*', '*[Ll]icense*', 'LICENCE*', 'LEGAL*', '[Ll]egal*', '*GPL*', 'README.lic*', 'COPYRIGHT*', '[Cc]opyright*']
+    licfiles = []
+    for root, dirs, files in os.walk(srctree):
+        for fn in files:
+            for spec in licspecs:
+                if fnmatch.fnmatch(fn, spec):
+                    licfiles.append(os.path.join(root, fn))
+    for licfile in licfiles:
+        md5value = bb.utils.md5_file(licfile)
+        license = md5sums.get(md5value, 'Unknown')
+        licenses.append((license, os.path.relpath(licfile, srctree), md5value))
+
+    # FIXME should we grab at least one source file with a license header and add that too?
+
+    return licenses
+
+def read_pkgconfig_provides(d):
+    pkgdatadir = d.getVar('PKGDATA_DIR', True)
+    pkgmap = {}
+    for fn in glob.glob(os.path.join(pkgdatadir, 'shlibs2', '*.pclist')):
+        with open(fn, 'r') as f:
+            for line in f:
+                pkgmap[os.path.basename(line.rstrip())] = os.path.splitext(os.path.basename(fn))[0]
+    recipemap = {}
+    for pc, pkg in pkgmap.iteritems():
+        pkgdatafile = os.path.join(pkgdatadir, 'runtime', pkg)
+        if os.path.exists(pkgdatafile):
+            with open(pkgdatafile, 'r') as f:
+                for line in f:
+                    if line.startswith('PN: '):
+                        recipemap[pc] = line.split(':', 1)[1].strip()
+    return recipemap
+
+def convert_pkginfo(pkginfofile):
+    values = {}
+    with open(pkginfofile, 'r') as f:
+        indesc = False
+        for line in f:
+            if indesc:
+                if line.strip():
+                    values['DESCRIPTION'] += ' ' + line.strip()
+                else:
+                    indesc = False
+            else:
+                splitline = line.split(': ', 1)
+                key = line[0]
+                value = line[1]
+                if key == 'LICENSE':
+                    for dep in value.split(','):
+                        dep = dep.split()[0]
+                        mapped = depmap.get(dep, '')
+                        if mapped:
+                            depends.append(mapped)
+                elif key == 'License':
+                    values['LICENSE'] = value
+                elif key == 'Summary':
+                    values['SUMMARY'] = value
+                elif key == 'Description':
+                    values['DESCRIPTION'] = value
+                    indesc = True
+    return values
+
+def convert_debian(debpath):
+    # FIXME extend this mapping - perhaps use distro_alias.inc?
+    depmap = {'libz-dev': 'zlib'}
+
+    values = {}
+    depends = []
+    with open(os.path.join(debpath, 'control')) as f:
+        indesc = False
+        for line in f:
+            if indesc:
+                if line.strip():
+                    if line.startswith(' This package contains'):
+                        indesc = False
+                    else:
+                        values['DESCRIPTION'] += ' ' + line.strip()
+                else:
+                    indesc = False
+            else:
+                splitline = line.split(':', 1)
+                key = line[0]
+                value = line[1]
+                if key == 'Build-Depends':
+                    for dep in value.split(','):
+                        dep = dep.split()[0]
+                        mapped = depmap.get(dep, '')
+                        if mapped:
+                            depends.append(mapped)
+                elif key == 'Section':
+                    values['SECTION'] = value
+                elif key == 'Description':
+                    values['SUMMARY'] = value
+                    indesc = True
+
+    if depends:
+        values['DEPENDS'] = ' '.join(depends)
+
+    return values
+
+
+def register_command(subparsers):
+    parser_create = subparsers.add_parser('create', help='Create a new recipe')
+    parser_create.add_argument('source', help='Path or URL to source')
+    parser_create.add_argument('-o', '--outfile', help='Full path and filename to recipe to add', required=True)
+    parser_create.add_argument('-m', '--machine', help='Make recipe machine-specific as opposed to architecture-specific', action='store_true')
+    parser_create.add_argument('-x', '--externalsrc', help='Assuming source is a URL, fetch it and extract it to the specified directory')
+    parser_create.set_defaults(func=create_recipe)
+
diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
new file mode 100644
index 0000000..98fd7f8
--- /dev/null
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -0,0 +1,234 @@
+# Recipe creation tool - create command build system handlers
+#
+# Copyright (C) 2014 Intel Corporation
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+
+import re
+import logging
+from recipetool.create import RecipeHandler, read_pkgconfig_provides
+
+logger = logging.getLogger('recipetool')
+
+tinfoil = None
+
+def tinfoil_init(instance):
+    global tinfoil
+    tinfoil = instance
+
+class CmakeRecipeHandler(RecipeHandler):
+    def process(self, srctree, classes, lines_before, lines_after, handled):
+        if 'buildsystem' in handled:
+            return False
+
+        if self.checkfiles(srctree, ['CMakeLists.txt']):
+            classes.append('cmake')
+            lines_after.append('# Specify any options you want to pass to cmake using EXTRA_OECMAKE:')
+            lines_after.append('EXTRA_OECMAKE = ""')
+            lines_after.append('')
+            handled.append('buildsystem')
+            return True
+        return False
+
+class SconsRecipeHandler(RecipeHandler):
+    def process(self, srctree, classes, lines_before, lines_after, handled):
+        if 'buildsystem' in handled:
+            return False
+
+        if self.checkfiles(srctree, ['SConstruct', 'Sconstruct', 'sconstruct']):
+            classes.append('scons')
+            lines_after.append('# Specify any options you want to pass to scons using EXTRA_OESCONS:')
+            lines_after.append('EXTRA_OESCONS = ""')
+            lines_after.append('')
+            handled.append('buildsystem')
+            return True
+        return False
+
+class QmakeRecipeHandler(RecipeHandler):
+    def process(self, srctree, classes, lines_before, lines_after, handled):
+        if 'buildsystem' in handled:
+            return False
+
+        if self.checkfiles(srctree, ['*.pro']):
+            classes.append('qmake2')
+            handled.append('buildsystem')
+            return True
+        return False
+
+class AutotoolsRecipeHandler(RecipeHandler):
+    def process(self, srctree, classes, lines_before, lines_after, handled):
+        if 'buildsystem' in handled:
+            return False
+
+        autoconf = False
+        if self.checkfiles(srctree, ['configure.ac', 'configure.in']):
+            autoconf = True
+            values = self._extract_autotools_deps(lines_before, srctree)
+            classes.extend(values.pop('inherit', '').split())
+            for var, value in values.iteritems():
+                lines_before.append('%s = "%s"' % (var, value))
+        else:
+            conffile = self.checkfiles(srctree, ['configure'])
+            if conffile:
+                # Check if this is just a pre-generated autoconf configure script
+                with open(conffile[0], 'r') as f:
+                    for i in range(1, 10):
+                        if 'Generated by GNU Autoconf' in f.readline():
+                            autoconf = True
+                            break
+
+        if autoconf:
+            lines_before.append('# NOTE: if this software is not capable of being built in a separate build directory')
+            lines_before.append('# from the source, you should replace autotools with autotools-brokensep in the')
+            lines_before.append('# inherit line')
+            classes.append('autotools')
+            lines_after.append('# Specify any options you want to pass to the configure script using EXTRA_OECONF:')
+            lines_after.append('EXTRA_OECONF = ""')
+            lines_after.append('')
+            handled.append('buildsystem')
+            return True
+
+        return False
+
+    def _extract_autotools_deps(self, outlines, srctree):
+        import shlex
+
+        values = {}
+        inherits = []
+
+        # FIXME this mapping is very thin
+        progmap = {'flex': 'flex-native',
+                'bison': 'bison-native',
+                'm4': 'm4-native'}
+        progclassmap = {'gconftool-2': 'gconf',
+                'pkg-config': 'pkgconfig'}
+
+        pkg_re = re.compile('PKG_CHECK_MODULES\(\[?[a-zA-Z0-9]*\]?, \[?([^,\]]*)[),].*')
+        progs_re = re.compile('_PROGS?\(\[?[a-zA-Z0-9]*\]?, \[?([^,\]]*)\]?[),].*')
+        dep_re = re.compile('([^ ><=]+)( [<>=]+ [^ ><=]+)?')
+
+        # Since a configure.ac file is essentially a program, this is only ever going to be
+        # a hack unfortunately; but it ought to be enough of an approximation
+        srcfiles = self.checkfiles(srctree, ['configure.ac', 'configure.in'])
+        pcdeps = []
+        deps = []
+        unmapped = []
+        with open(srcfiles[0], 'r') as f:
+            for line in f:
+                if 'PKG_CHECK_MODULES' in line:
+                    res = pkg_re.search(line)
+                    if res:
+                        res = dep_re.findall(res.group(1))
+                        if res:
+                            pcdeps.extend([x[0] for x in res])
+                    inherits.append('pkgconfig')
+                if line.lstrip().startswith('AM_GNU_GETTEXT'):
+                    inherits.append('gettext')
+                elif 'AC_CHECK_PROG' in line or 'AC_PATH_PROG' in line:
+                    res = progs_re.search(line)
+                    if res:
+                        for prog in shlex.split(res.group(1)):
+                            prog = prog.split()[0]
+                            progclass = progclassmap.get(prog, None)
+                            if progclass:
+                                inherits.append(progclass)
+                            else:
+                                progdep = progmap.get(prog, None)
+                                if progdep:
+                                    deps.append(progdep)
+                                else:
+                                    unmapped.append(prog)
+
+        if unmapped:
+            outlines.append('# NOTE: the following prog dependencies are unknown, ignoring: %s' % ' '.join(unmapped))
+
+        recipemap = read_pkgconfig_provides(tinfoil.config_data)
+        unmapped = []
+        for pcdep in pcdeps:
+            recipe = recipemap.get(pcdep, None)
+            if recipe:
+                deps.append(recipe)
+            else:
+                unmapped.append(pcdep)
+
+        if unmapped:
+            outlines.append('# WARNING: unable to map the following pkg-config dependencies: %s' % ' '.join(unmapped))
+        if deps:
+            values['DEPENDS'] = ' '.join(list(set(deps)))
+
+        if inherits:
+            values['inherit'] = ' '.join(list(set(inherits)))
+
+        return values
+
+
+class MakefileRecipeHandler(RecipeHandler):
+    def process(self, srctree, classes, lines_before, lines_after, handled):
+        if 'buildsystem' in handled:
+            return False
+
+        makefile = self.checkfiles(srctree, ['Makefile'])
+        if makefile:
+            lines_after.append('# NOTE: this is a Makefile-only piece of software, so we cannot generate much of the')
+            lines_after.append('# recipe automatically - you will need to examine the Makefile yourself and ensure')
+            lines_after.append('# that the appropriate arguments are passed in.')
+            lines_after.append('')
+
+            self.genfunction(lines_after, 'do_configure', ['# Specify any needed configure commands here'])
+
+            func = []
+            func.append('# You will almost certainly need to add additional arguments here')
+            func.append('oe_runmake')
+            self.genfunction(lines_after, 'do_compile', func)
+
+            installtarget = True
+            try:
+                stdout, stderr = bb.process.run('make -qn install', cwd=srctree, shell=True)
+            except bb.process.ExecutionError as e:
+                if e.exitcode != 1:
+                    installtarget = False
+            func = []
+            if installtarget:
+                func.append('# This is a guess; additional arguments may be required')
+                makeargs = ''
+                with open(makefile[0], 'r') as f:
+                    for i in range(1, 100):
+                        if 'DESTDIR' in f.readline():
+                            makeargs += " 'DESTDIR=${D}'"
+                            break
+                func.append('oe_runmake install%s' % makeargs)
+            else:
+                func.append('# NOTE: unable to determine what to put here - there is a Makefile but no')
+                func.append('# target named "install", so you will need to define this yourself')
+            self.genfunction(lines_after, 'do_install', func)
+
+            handled.append('buildsystem')
+        else:
+            lines_after.append('# NOTE: no Makefile found, unable to determine what needs to be done')
+            lines_after.append('')
+            self.genfunction(lines_after, 'do_configure', ['# Specify any needed configure commands here'])
+            self.genfunction(lines_after, 'do_compile', ['# Specify compilation commands here'])
+            self.genfunction(lines_after, 'do_install', ['# Specify install commands here'])
+
+
+def plugin_init(pluginlist):
+    pass
+
+def register_recipe_handlers(handlers):
+    # These are in a specific order so that the right one is detected first
+    handlers.append(CmakeRecipeHandler())
+    handlers.append(AutotoolsRecipeHandler())
+    handlers.append(SconsRecipeHandler())
+    handlers.append(QmakeRecipeHandler())
+    handlers.append(MakefileRecipeHandler())
diff --git a/scripts/recipetool b/scripts/recipetool
new file mode 100755
index 0000000..0e2f527
--- /dev/null
+++ b/scripts/recipetool
@@ -0,0 +1,124 @@
+#!/usr/bin/env python
+
+# Recipe creation tool
+#
+# Copyright (C) 2014 Intel Corporation
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+
+import sys
+import os
+import argparse
+import glob
+import logging
+
+def logger_create(name):
+    logger = logging.getLogger(name)
+    loggerhandler = logging.StreamHandler()
+    loggerhandler.setFormatter(logging.Formatter("%(levelname)s: %(message)s"))
+    logger.addHandler(loggerhandler)
+    logger.setLevel(logging.INFO)
+    return logger
+logger = logger_create('recipetool')
+
+plugins = []
+
+def load_plugins(pluginpath):
+    global plugins
+
+    def load_plugin(name):
+        logger.debug('Loading plugin %s' % name)
+        fp, pathname, description = imp.find_module(name, [pluginpath])
+        try:
+            return imp.load_module(name, fp, pathname, description)
+        finally:
+            if fp:
+                fp.close()
+
+    logger.debug('Loading plugins from %s...' % pluginpath)
+    import imp
+    for fn in glob.glob(os.path.join(pluginpath, '*.py')):
+        name = os.path.splitext(os.path.basename(fn))[0]
+        if name != '__init__':
+            plugin = load_plugin(name)
+            if hasattr(plugin, 'plugin_init'):
+                plugin.plugin_init(plugins)
+                plugins.append(plugin)
+
+def tinfoil_init():
+    import bb.tinfoil
+    import logging
+    tinfoil = bb.tinfoil.Tinfoil()
+    tinfoil.prepare(True)
+
+    for plugin in plugins:
+        if hasattr(plugin, 'tinfoil_init'):
+            plugin.tinfoil_init(tinfoil)
+    tinfoil.logger.setLevel(logging.WARNING)
+
+def main():
+
+    scripts_path = os.path.abspath(os.path.dirname(os.path.abspath(sys.argv[0])))
+    lib_path = scripts_path + '/lib'
+    sys.path = sys.path + [lib_path]
+
+    if not os.environ.get('BUILDDIR', ''):
+        logger.error("This script can only be run after initialising the build environment (e.g. by using oe-init-build-env)")
+        sys.exit(1)
+
+    parser = argparse.ArgumentParser(description="Recipe tool")
+    parser.add_argument('-d', '--debug', help='Enable debug output', action='store_true')
+    parser.add_argument('-q', '--quiet', help='Print only errors', action='store_true')
+    subparsers = parser.add_subparsers()
+
+    load_plugins(os.path.join(os.path.dirname(__file__), 'lib', 'recipetool'))
+    registered = False
+    for plugin in plugins:
+        if hasattr(plugin, 'register_command'):
+            registered = True
+            plugin.register_command(subparsers)
+
+    if not registered:
+        logger.error("No commands registered - missing plugins?")
+        sys.exit(1)
+
+    args = parser.parse_args()
+
+    if args.debug:
+        logger.setLevel(logging.DEBUG)
+    elif args.quiet:
+        logger.setLevel(logging.ERROR)
+
+    import scriptpath
+    bitbakepath = scriptpath.add_bitbake_lib_path()
+    if not bitbakepath:
+        logger.error("Unable to find bitbake by searching parent directory of this script or PATH")
+        sys.exit(1)
+    logger.debug('Found bitbake path: %s' % bitbakepath)
+
+    tinfoil_init()
+
+    ret = args.func(args)
+
+    return ret
+
+
+if __name__ == "__main__":
+    try:
+        ret = main()
+    except Exception:
+        ret = 1
+        import traceback
+        traceback.print_exc(5)
+    sys.exit(ret)
-- 
1.9.3


