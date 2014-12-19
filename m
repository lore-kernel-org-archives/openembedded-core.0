Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E052B72907
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 11:42:14 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 19 Dec 2014 03:42:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,606,1413270000"; d="scan'208";a="640244394"
Received: from khamid-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.31.61])
	by fmsmga001.fm.intel.com with ESMTP; 19 Dec 2014 03:42:14 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Dec 2014 11:41:53 +0000
Message-Id: <e57c1cdb4a8010045d47e8ffb26460f8a1a9fe83.1418984743.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1418984743.git.paul.eggleton@linux.intel.com>
References: <cover.1418984743.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1418984743.git.paul.eggleton@linux.intel.com>
References: <cover.1418984743.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 11/15] scripts/recipetool: Add a recipe auto-creation script
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
X-List-Received-Date: Fri, 19 Dec 2014 11:42:15 -0000

Add a more maintainable and flexible script for creating at least the
skeleton of a recipe based on an examination of the source tree.
Commands can be added and the creation process can be extended through
plugins.

[YOCTO #6406]

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/__init__.py        |   0
 scripts/lib/recipetool/create.py          | 413 ++++++++++++++++++++++++++++++
 scripts/lib/recipetool/create_buildsys.py | 319 +++++++++++++++++++++++
 scripts/recipetool                        |  99 +++++++
 4 files changed, 831 insertions(+)
 create mode 100644 scripts/lib/recipetool/__init__.py
 create mode 100644 scripts/lib/recipetool/create.py
 create mode 100644 scripts/lib/recipetool/create_buildsys.py
 create mode 100755 scripts/recipetool

diff --git a/scripts/lib/recipetool/__init__.py b/scripts/lib/recipetool/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
new file mode 100644
index 0000000..6dba078
--- /dev/null
+++ b/scripts/lib/recipetool/create.py
@@ -0,0 +1,413 @@
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
+    @staticmethod
+    def checkfiles(path, speclist):
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
+    lic_files_chksum = []
+    if licvalues:
+        licenses = []
+        for licvalue in licvalues:
+            if not licvalue[0] in licenses:
+                licenses.append(licvalue[0])
+            lic_files_chksum.append('file://%s;md5=%s' % (licvalue[1], licvalue[2]))
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
+        lines_before.append('#')
+        lines_before.append('# NOTE: LICENSE is being set to "CLOSED" to allow you to at least start building - if')
+        lines_before.append('# this is not accurate with respect to the licensing of the software being built (it')
+        lines_before.append('# will not be in most cases) you must specify the correct value before using this')
+        lines_before.append('# recipe for anything other than initial testing/development!')
+        licenses = ['CLOSED']
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
+def get_license_md5sums(d, static_only=False):
+    import bb.utils
+    md5sums = {}
+    if not static_only:
+        # Gather md5sums of license files in common license dir
+        commonlicdir = d.getVar('COMMON_LICENSE_DIR', True)
+        for fn in os.listdir(commonlicdir):
+            md5value = bb.utils.md5_file(os.path.join(commonlicdir, fn))
+            md5sums[md5value] = fn
+    # The following were extracted from common values in various recipes
+    # (double checking the license against the license file itself, not just
+    # the LICENSE value in the recipe)
+    md5sums['94d55d512a9ba36caa9b7df079bae19f'] = 'GPLv2'
+    md5sums['b234ee4d69f5fce4486a80fdaf4a4263'] = 'GPLv2'
+    md5sums['59530bdf33659b29e73d4adb9f9f6552'] = 'GPLv2'
+    md5sums['0636e73ff0215e8d672dc4c32c317bb3'] = 'GPLv2'
+    md5sums['eb723b61539feef013de476e68b5c50a'] = 'GPLv2'
+    md5sums['751419260aa954499f7abaabaa882bbe'] = 'GPLv2'
+    md5sums['393a5ca445f6965873eca0259a17f833'] = 'GPLv2'
+    md5sums['12f884d2ae1ff87c09e5b7ccc2c4ca7e'] = 'GPLv2'
+    md5sums['8ca43cbc842c2336e835926c2166c28b'] = 'GPLv2'
+    md5sums['ebb5c50ab7cab4baeffba14977030c07'] = 'GPLv2'
+    md5sums['c93c0550bd3173f4504b2cbd8991e50b'] = 'GPLv2'
+    md5sums['9ac2e7cff1ddaf48b6eab6028f23ef88'] = 'GPLv2'
+    md5sums['4325afd396febcb659c36b49533135d4'] = 'GPLv2'
+    md5sums['18810669f13b87348459e611d31ab760'] = 'GPLv2'
+    md5sums['d7810fab7487fb0aad327b76f1be7cd7'] = 'GPLv2' # the Linux kernel's COPYING file
+    md5sums['bbb461211a33b134d42ed5ee802b37ff'] = 'LGPLv2.1'
+    md5sums['7fbc338309ac38fefcd64b04bb903e34'] = 'LGPLv2.1'
+    md5sums['4fbd65380cdd255951079008b364516c'] = 'LGPLv2.1'
+    md5sums['2d5025d4aa3495befef8f17206a5b0a1'] = 'LGPLv2.1'
+    md5sums['fbc093901857fcd118f065f900982c24'] = 'LGPLv2.1'
+    md5sums['a6f89e2100d9b6cdffcea4f398e37343'] = 'LGPLv2.1'
+    md5sums['d8045f3b8f929c1cb29a1e3fd737b499'] = 'LGPLv2.1'
+    md5sums['fad9b3332be894bab9bc501572864b29'] = 'LGPLv2.1'
+    md5sums['3bf50002aefd002f49e7bb854063f7e7'] = 'LGPLv2'
+    md5sums['9f604d8a4f8e74f4f5140845a21b6674'] = 'LGPLv2'
+    md5sums['5f30f0716dfdd0d91eb439ebec522ec2'] = 'LGPLv2'
+    md5sums['55ca817ccb7d5b5b66355690e9abc605'] = 'LGPLv2'
+    md5sums['252890d9eee26aab7b432e8b8a616475'] = 'LGPLv2'
+    md5sums['d32239bcb673463ab874e80d47fae504'] = 'GPLv3'
+    md5sums['f27defe1e96c2e1ecd4e0c9be8967949'] = 'GPLv3'
+    md5sums['6a6a8e020838b23406c81b19c1d46df6'] = 'LGPLv3'
+    md5sums['3b83ef96387f14655fc854ddc3c6bd57'] = 'Apache-2.0'
+    md5sums['385c55653886acac3821999a3ccd17b3'] = 'Artistic-1.0 | GPL-2.0' # some perl modules
+    return md5sums
+
+def guess_license(srctree):
+    import bb
+    md5sums = get_license_md5sums(tinfoil.config_data)
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
index 0000000..6c9e0ef
--- /dev/null
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -0,0 +1,319 @@
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
+        if RecipeHandler.checkfiles(srctree, ['CMakeLists.txt']):
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
+        if RecipeHandler.checkfiles(srctree, ['SConstruct', 'Sconstruct', 'sconstruct']):
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
+        if RecipeHandler.checkfiles(srctree, ['*.pro']):
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
+        if RecipeHandler.checkfiles(srctree, ['configure.ac', 'configure.in']):
+            autoconf = True
+            values = AutotoolsRecipeHandler.extract_autotools_deps(lines_before, srctree)
+            classes.extend(values.pop('inherit', '').split())
+            for var, value in values.iteritems():
+                lines_before.append('%s = "%s"' % (var, value))
+        else:
+            conffile = RecipeHandler.checkfiles(srctree, ['configure'])
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
+    @staticmethod
+    def extract_autotools_deps(outlines, srctree, acfile=None):
+        import shlex
+        import oe.package
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
+        ignoredeps = ['gcc-runtime', 'glibc', 'uclibc']
+
+        pkg_re = re.compile('PKG_CHECK_MODULES\(\[?[a-zA-Z0-9]*\]?, \[?([^,\]]*)[),].*')
+        lib_re = re.compile('AC_CHECK_LIB\(\[?([a-zA-Z0-9]*)\]?, .*')
+        progs_re = re.compile('_PROGS?\(\[?[a-zA-Z0-9]*\]?, \[?([^,\]]*)\]?[),].*')
+        dep_re = re.compile('([^ ><=]+)( [<>=]+ [^ ><=]+)?')
+
+        # Build up lib library->package mapping
+        shlib_providers = oe.package.read_shlib_providers(tinfoil.config_data)
+        libdir = tinfoil.config_data.getVar('libdir', True)
+        base_libdir = tinfoil.config_data.getVar('base_libdir', True)
+        libpaths = list(set([base_libdir, libdir]))
+        libname_re = re.compile('^lib(.+)\.so.*$')
+        pkglibmap = {}
+        for lib, item in shlib_providers.iteritems():
+            for path, pkg in item.iteritems():
+                if path in libpaths:
+                    res = libname_re.match(lib)
+                    if res:
+                        libname = res.group(1)
+                        if not libname in pkglibmap:
+                            pkglibmap[libname] = pkg[0]
+                    else:
+                        logger.debug('unable to extract library name from %s' % lib)
+
+        # Now turn it into a library->recipe mapping
+        recipelibmap = {}
+        pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR', True)
+        for libname, pkg in pkglibmap.iteritems():
+            try:
+                with open(os.path.join(pkgdata_dir, 'runtime', pkg)) as f:
+                    for line in f:
+                        if line.startswith('PN:'):
+                            recipelibmap[libname] = line.split(':', 1)[-1].strip()
+                            break
+            except IOError as ioe:
+                if ioe.errno == 2:
+                    logger.warn('unable to find a pkgdata file for package %s' % pkg)
+                else:
+                    raise
+
+        # Since a configure.ac file is essentially a program, this is only ever going to be
+        # a hack unfortunately; but it ought to be enough of an approximation
+        if acfile:
+            srcfiles = [acfile]
+        else:
+            srcfiles = RecipeHandler.checkfiles(srctree, ['configure.ac', 'configure.in'])
+        pcdeps = []
+        deps = []
+        unmapped = []
+        unmappedlibs = []
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
+                                    if not prog.startswith('$'):
+                                        unmapped.append(prog)
+                elif 'AC_CHECK_LIB' in line:
+                    res = lib_re.search(line)
+                    if res:
+                        lib = res.group(1)
+                        libdep = recipelibmap.get(lib, None)
+                        if libdep:
+                            deps.append(libdep)
+                        else:
+                            if libdep is None:
+                                if not lib.startswith('$'):
+                                    unmappedlibs.append(lib)
+                elif 'AC_PATH_X' in line:
+                    deps.append('libx11')
+
+        if unmapped:
+            outlines.append('# NOTE: the following prog dependencies are unknown, ignoring: %s' % ' '.join(unmapped))
+
+        if unmappedlibs:
+            outlines.append('# NOTE: the following library dependencies are unknown, ignoring: %s' % ' '.join(unmappedlibs))
+            outlines.append('#       (this is based on recipes that have previously been built and packaged)')
+
+        recipemap = read_pkgconfig_provides(tinfoil.config_data)
+        unmapped = []
+        for pcdep in pcdeps:
+            recipe = recipemap.get(pcdep, None)
+            if recipe:
+                deps.append(recipe)
+            else:
+                if not pcdep.startswith('$'):
+                    unmapped.append(pcdep)
+
+        deps = set(deps).difference(set(ignoredeps))
+
+        if unmapped:
+            outlines.append('# NOTE: unable to map the following pkg-config dependencies: %s' % ' '.join(unmapped))
+            outlines.append('#       (this is based on recipes that have previously been built and packaged)')
+
+        if deps:
+            values['DEPENDS'] = ' '.join(deps)
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
+        makefile = RecipeHandler.checkfiles(srctree, ['Makefile'])
+        if makefile:
+            lines_after.append('# NOTE: this is a Makefile-only piece of software, so we cannot generate much of the')
+            lines_after.append('# recipe automatically - you will need to examine the Makefile yourself and ensure')
+            lines_after.append('# that the appropriate arguments are passed in.')
+            lines_after.append('')
+
+            scanfile = os.path.join(srctree, 'configure.scan')
+            skipscan = False
+            try:
+                stdout, stderr = bb.process.run('autoscan', cwd=srctree, shell=True)
+            except bb.process.ExecutionError as e:
+                skipscan = True
+            if scanfile and os.path.exists(scanfile):
+                values = AutotoolsRecipeHandler.extract_autotools_deps(lines_before, srctree, acfile=scanfile)
+                classes.extend(values.pop('inherit', '').split())
+                for var, value in values.iteritems():
+                    if var == 'DEPENDS':
+                        lines_before.append('# NOTE: some of these dependencies may be optional, check the Makefile and/or upstream documentation')
+                    lines_before.append('%s = "%s"' % (var, value))
+                lines_before.append('')
+                for f in ['configure.scan', 'autoscan.log']:
+                    fp = os.path.join(srctree, f)
+                    if os.path.exists(fp):
+                        os.remove(fp)
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
index 0000000..70e6b6c
--- /dev/null
+++ b/scripts/recipetool
@@ -0,0 +1,99 @@
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
+scripts_path = os.path.dirname(os.path.realpath(__file__))
+lib_path = scripts_path + '/lib'
+sys.path = sys.path + [lib_path]
+import scriptutils
+logger = scriptutils.logger_create('recipetool')
+
+plugins = []
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
+    if not os.environ.get('BUILDDIR', ''):
+        logger.error("This script can only be run after initialising the build environment (e.g. by using oe-init-build-env)")
+        sys.exit(1)
+
+    parser = argparse.ArgumentParser(description="OpenEmbedded recipe tool",
+                                     epilog="Use %(prog)s <command> --help to get help on a specific command")
+    parser.add_argument('-d', '--debug', help='Enable debug output', action='store_true')
+    parser.add_argument('-q', '--quiet', help='Print only errors', action='store_true')
+    parser.add_argument('--color', help='Colorize output', choices=['auto', 'always', 'never'], default='auto')
+    subparsers = parser.add_subparsers()
+
+    scriptutils.load_plugins(logger, plugins, os.path.join(scripts_path, 'lib', 'recipetool'))
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
+    scriptutils.logger_setup_color(logger, args.color)
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


