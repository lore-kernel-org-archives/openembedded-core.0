Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 09D5E741E3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 15:15:19 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 18 May 2015 08:15:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,453,1427785200"; d="scan'208";a="731190786"
Received: from jmcmill1-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.0.158])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2015 08:15:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2015 16:15:07 +0100
Message-Id: <ef803717e7fde8e8e4af425ca79f0eb8047e8aa9.1431961859.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1431961859.git.paul.eggleton@linux.intel.com>
References: <cover.1431961859.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1431961859.git.paul.eggleton@linux.intel.com>
References: <cover.1431961859.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/5] recipetool: add appendfile subcommand
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
X-List-Received-Date: Mon, 18 May 2015 15:15:19 -0000

Locating which recipe provides a file in an image that you want to
modify and then figuring out how to bbappend the recipe in order to
replace it can be a tedious process. Thus, add a new appendfile
subcommand to recipetool, providing the ability to create a bbappend
file to add/replace any file in the target system. Without the -r
option, it will search for the recipe packaging the specified file
(using pkgdata from previously built recipes). The bbappend will be
created at the appropriate path within the specified layer directory
(which may or may not be in your bblayers.conf) or if one already exists
it will be updated appropriately.

Fairly extensive oe-selftest tests are also provided.

Implements [YOCTO #6447].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-test/recipetool/files/add-file.patch   |   8 +
 meta-selftest/recipes-test/recipetool/files/file1  |   2 +
 .../recipes-test/recipetool/files/installscript.sh |   3 +
 .../recipetool/files/selftest-replaceme-inst-func  |   1 +
 .../files/selftest-replaceme-inst-globfile         |   1 +
 .../files/selftest-replaceme-inst-todir-globfile   |   1 +
 .../recipetool/files/selftest-replaceme-orig       |   1 +
 .../files/selftest-replaceme-src-globfile          |   1 +
 .../recipetool/files/selftest-replaceme-todir      |   1 +
 .../recipetool/files/subdir/fileinsubdir           |   1 +
 .../recipetool/selftest-recipetool-appendfile.bb   |  42 +++
 meta/lib/oe/patch.py                               |  63 ++++
 meta/lib/oe/recipeutils.py                         | 328 ++++++++++++++++++-
 meta/lib/oeqa/selftest/devtool.py                  |  31 +-
 meta/lib/oeqa/selftest/recipetool.py               | 313 +++++++++++++++++-
 meta/lib/oeqa/utils/commands.py                    |  11 +
 scripts/lib/recipetool/append.py                   | 360 +++++++++++++++++++++
 scripts/recipetool                                 |   6 +-
 18 files changed, 1167 insertions(+), 7 deletions(-)
 create mode 100644 meta-selftest/recipes-test/recipetool/files/add-file.patch
 create mode 100644 meta-selftest/recipes-test/recipetool/files/file1
 create mode 100644 meta-selftest/recipes-test/recipetool/files/installscript.sh
 create mode 100644 meta-selftest/recipes-test/recipetool/files/selftest-replaceme-inst-func
 create mode 100644 meta-selftest/recipes-test/recipetool/files/selftest-replaceme-inst-globfile
 create mode 100644 meta-selftest/recipes-test/recipetool/files/selftest-replaceme-inst-todir-globfile
 create mode 100644 meta-selftest/recipes-test/recipetool/files/selftest-replaceme-orig
 create mode 100644 meta-selftest/recipes-test/recipetool/files/selftest-replaceme-src-globfile
 create mode 100644 meta-selftest/recipes-test/recipetool/files/selftest-replaceme-todir
 create mode 100644 meta-selftest/recipes-test/recipetool/files/subdir/fileinsubdir
 create mode 100644 meta-selftest/recipes-test/recipetool/selftest-recipetool-appendfile.bb
 create mode 100644 scripts/lib/recipetool/append.py

diff --git a/meta-selftest/recipes-test/recipetool/files/add-file.patch b/meta-selftest/recipes-test/recipetool/files/add-file.patch
new file mode 100644
index 0000000..bdc99c9
--- /dev/null
+++ b/meta-selftest/recipes-test/recipetool/files/add-file.patch
@@ -0,0 +1,8 @@
+diff --git a/file2 b/file2
+new file mode 100644
+index 0000000..049b42e
+--- /dev/null
++++ b/file2
+@@ -0,0 +1,2 @@
++Test file 2
++456
diff --git a/meta-selftest/recipes-test/recipetool/files/file1 b/meta-selftest/recipes-test/recipetool/files/file1
new file mode 100644
index 0000000..7571aa7
--- /dev/null
+++ b/meta-selftest/recipes-test/recipetool/files/file1
@@ -0,0 +1,2 @@
+First test file
+123
diff --git a/meta-selftest/recipes-test/recipetool/files/installscript.sh b/meta-selftest/recipes-test/recipetool/files/installscript.sh
new file mode 100644
index 0000000..9de30d6
--- /dev/null
+++ b/meta-selftest/recipes-test/recipetool/files/installscript.sh
@@ -0,0 +1,3 @@
+#!/bin/sh
+echo "Third file" > $1/selftest-replaceme-scripted
+
diff --git a/meta-selftest/recipes-test/recipetool/files/selftest-replaceme-inst-func b/meta-selftest/recipes-test/recipetool/files/selftest-replaceme-inst-func
new file mode 100644
index 0000000..2802bb3
--- /dev/null
+++ b/meta-selftest/recipes-test/recipetool/files/selftest-replaceme-inst-func
@@ -0,0 +1 @@
+A file installed by a function called by do_install
diff --git a/meta-selftest/recipes-test/recipetool/files/selftest-replaceme-inst-globfile b/meta-selftest/recipes-test/recipetool/files/selftest-replaceme-inst-globfile
new file mode 100644
index 0000000..996298b
--- /dev/null
+++ b/meta-selftest/recipes-test/recipetool/files/selftest-replaceme-inst-globfile
@@ -0,0 +1 @@
+A file matched by a glob in do_install
diff --git a/meta-selftest/recipes-test/recipetool/files/selftest-replaceme-inst-todir-globfile b/meta-selftest/recipes-test/recipetool/files/selftest-replaceme-inst-todir-globfile
new file mode 100644
index 0000000..585ae3e
--- /dev/null
+++ b/meta-selftest/recipes-test/recipetool/files/selftest-replaceme-inst-todir-globfile
@@ -0,0 +1 @@
+A file matched by a glob in do_install to a directory
diff --git a/meta-selftest/recipes-test/recipetool/files/selftest-replaceme-orig b/meta-selftest/recipes-test/recipetool/files/selftest-replaceme-orig
new file mode 100644
index 0000000..593d6a0
--- /dev/null
+++ b/meta-selftest/recipes-test/recipetool/files/selftest-replaceme-orig
@@ -0,0 +1 @@
+Straight through with same nam
diff --git a/meta-selftest/recipes-test/recipetool/files/selftest-replaceme-src-globfile b/meta-selftest/recipes-test/recipetool/files/selftest-replaceme-src-globfile
new file mode 100644
index 0000000..1e20a2b
--- /dev/null
+++ b/meta-selftest/recipes-test/recipetool/files/selftest-replaceme-src-globfile
@@ -0,0 +1 @@
+A file matched by a glob in SRC_URI
diff --git a/meta-selftest/recipes-test/recipetool/files/selftest-replaceme-todir b/meta-selftest/recipes-test/recipetool/files/selftest-replaceme-todir
new file mode 100644
index 0000000..85bd5eb
--- /dev/null
+++ b/meta-selftest/recipes-test/recipetool/files/selftest-replaceme-todir
@@ -0,0 +1 @@
+File in SRC_URI installed just to directory path
diff --git a/meta-selftest/recipes-test/recipetool/files/subdir/fileinsubdir b/meta-selftest/recipes-test/recipetool/files/subdir/fileinsubdir
new file mode 100644
index 0000000..d516b49
--- /dev/null
+++ b/meta-selftest/recipes-test/recipetool/files/subdir/fileinsubdir
@@ -0,0 +1 @@
+A file in a subdirectory
diff --git a/meta-selftest/recipes-test/recipetool/selftest-recipetool-appendfile.bb b/meta-selftest/recipes-test/recipetool/selftest-recipetool-appendfile.bb
new file mode 100644
index 0000000..7d0a040
--- /dev/null
+++ b/meta-selftest/recipes-test/recipetool/selftest-recipetool-appendfile.bb
@@ -0,0 +1,42 @@
+SUMMARY = "Test recipe for recipetool appendfile"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+SRC_URI = "file://installscript.sh \
+           file://selftest-replaceme-orig \
+           file://selftest-replaceme-todir \
+           file://file1 \
+           file://add-file.patch \
+           file://subdir \
+           file://selftest-replaceme-src-glob* \
+           file://selftest-replaceme-inst-globfile \
+           file://selftest-replaceme-inst-todir-globfile \
+           file://selftest-replaceme-inst-func"
+
+install_extrafunc() {
+	install -m 0644 ${WORKDIR}/selftest-replaceme-inst-func ${D}${datadir}/selftest-replaceme-inst-func
+}
+
+do_install() {
+	install -d ${D}${datadir}/
+	install -m 0644 ${WORKDIR}/selftest-replaceme-orig ${D}${datadir}/selftest-replaceme-orig
+	install -m 0644 ${WORKDIR}/selftest-replaceme-todir ${D}${datadir}
+	install -m 0644 ${WORKDIR}/file1 ${D}${datadir}/selftest-replaceme-renamed
+	install -m 0644 ${WORKDIR}/subdir/fileinsubdir ${D}${datadir}/selftest-replaceme-subdir
+	install -m 0644 ${WORKDIR}/selftest-replaceme-src-globfile ${D}${datadir}/selftest-replaceme-src-globfile
+	cp ${WORKDIR}/selftest-replaceme-inst-glob* ${D}${datadir}/selftest-replaceme-inst-globfile
+	cp ${WORKDIR}/selftest-replaceme-inst-todir-glob* ${D}${datadir}
+	install -d ${D}${sysconfdir}
+	install -m 0644 ${S}/file2 ${D}${sysconfdir}/selftest-replaceme-patched
+	sh ${WORKDIR}/installscript.sh ${D}${datadir}
+	install_extrafunc
+}
+
+pkg_postinst_${PN} () {
+	echo "Test file installed by postinst" > $D${datadir}/selftest-replaceme-postinst
+}
+
+FILES_${PN} += "${datadir}"
+
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index e1f1c53..afb0013 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -92,6 +92,69 @@ class PatchSet(object):
     def Refresh(self, remote = None, all = None):
         raise NotImplementedError()
 
+    @staticmethod
+    def getPatchedFiles(patchfile, striplevel, srcdir=None):
+        """
+        Read a patch file and determine which files it will modify.
+        Params:
+            patchfile: the patch file to read
+            striplevel: the strip level at which the patch is going to be applied
+            srcdir: optional path to join onto the patched file paths
+        Returns:
+            A list of tuples of file path and change mode ('A' for add,
+            'D' for delete or 'M' for modify)
+        """
+
+        def patchedpath(patchline):
+            filepth = patchline.split()[1]
+            if filepth.endswith('/dev/null'):
+                return '/dev/null'
+            filesplit = filepth.split(os.sep)
+            if striplevel > len(filesplit):
+                bb.error('Patch %s has invalid strip level %d' % (patchfile, striplevel))
+                return None
+            return os.sep.join(filesplit[striplevel:])
+
+        copiedmode = False
+        filelist = []
+        with open(patchfile) as f:
+            for line in f:
+                if line.startswith('--- '):
+                    patchpth = patchedpath(line)
+                    if not patchpth:
+                        break
+                    if copiedmode:
+                        addedfile = patchpth
+                    else:
+                        removedfile = patchpth
+                elif line.startswith('+++ '):
+                    addedfile = patchedpath(line)
+                    if not addedfile:
+                        break
+                elif line.startswith('*** '):
+                    copiedmode = True
+                    removedfile = patchedpath(line)
+                    if not removedfile:
+                        break
+                else:
+                    removedfile = None
+                    addedfile = None
+
+                if addedfile and removedfile:
+                    if removedfile == '/dev/null':
+                        mode = 'A'
+                    elif addedfile == '/dev/null':
+                        mode = 'D'
+                    else:
+                        mode = 'M'
+                    if srcdir:
+                        fullpath = os.path.abspath(os.path.join(srcdir, addedfile))
+                    else:
+                        fullpath = addedfile
+                    filelist.append((fullpath, mode))
+
+        return filelist
+
 
 class PatchTree(PatchSet):
     def __init__(self, dir, d):
diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 0689fb0..f05b6c0 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -2,7 +2,7 @@
 #
 # Some code borrowed from the OE layer index
 #
-# Copyright (C) 2013-2014 Intel Corporation
+# Copyright (C) 2013-2015 Intel Corporation
 #
 
 import sys
@@ -14,6 +14,7 @@ import difflib
 import utils
 import shutil
 import re
+import fnmatch
 from collections import OrderedDict, defaultdict
 
 
@@ -289,6 +290,27 @@ def get_recipe_patches(d):
     return patchfiles
 
 
+def get_recipe_patched_files(d):
+    """
+    Get the list of patches for a recipe along with the files each patch modifies.
+    Params:
+        d: the datastore for the recipe
+    Returns:
+        a dict mapping patch file path to a list of tuples of changed files and
+        change mode ('A' for add, 'D' for delete or 'M' for modify)
+    """
+    import oe.patch
+    # Execute src_patches() defined in patch.bbclass - this works since that class
+    # is inherited globally
+    patches = bb.utils.exec_flat_python_func('src_patches', d)
+    patchedfiles = {}
+    for patch in patches:
+        _, _, patchfile, _, _, parm = bb.fetch.decodeurl(patch)
+        striplevel = int(parm['striplevel'])
+        patchedfiles[patchfile] = oe.patch.PatchSet.getPatchedFiles(patchfile, striplevel, os.path.join(d.getVar('S', True), parm.get('patchdir', '')))
+    return patchedfiles
+
+
 def validate_pn(pn):
     """Perform validation on a recipe name (PN) for a new recipe."""
     reserved_names = ['forcevariable', 'append', 'prepend', 'remove']
@@ -300,3 +322,307 @@ def validate_pn(pn):
         return 'Recipe name "%s" is invalid: names starting with "pn-" are reserved' % pn
     return ''
 
+
+def get_bbappend_path(d, destlayerdir, wildcardver=False):
+    """Determine how a bbappend for a recipe should be named and located within another layer"""
+
+    import bb.cookerdata
+
+    destlayerdir = os.path.abspath(destlayerdir)
+    recipefile = d.getVar('FILE', True)
+    recipefn = os.path.splitext(os.path.basename(recipefile))[0]
+    if wildcardver and '_' in recipefn:
+        recipefn = recipefn.split('_', 1)[0] + '_%'
+    appendfn = recipefn + '.bbappend'
+
+    # Parse the specified layer's layer.conf file directly, in case the layer isn't in bblayers.conf
+    confdata = d.createCopy()
+    confdata.setVar('BBFILES', '')
+    confdata.setVar('LAYERDIR', destlayerdir)
+    destlayerconf = os.path.join(destlayerdir, "conf", "layer.conf")
+    confdata = bb.cookerdata.parse_config_file(destlayerconf, confdata)
+
+    origlayerdir = find_layerdir(recipefile)
+    if not origlayerdir:
+        return (None, False)
+    # Now join this to the path where the bbappend is going and check if it is covered by BBFILES
+    appendpath = os.path.join(destlayerdir, os.path.relpath(os.path.dirname(recipefile), origlayerdir), appendfn)
+    closepath = ''
+    pathok = True
+    for bbfilespec in confdata.getVar('BBFILES', True).split():
+        if fnmatch.fnmatchcase(appendpath, bbfilespec):
+            # Our append path works, we're done
+            break
+        elif bbfilespec.startswith(destlayerdir) and fnmatch.fnmatchcase('test.bbappend', os.path.basename(bbfilespec)):
+            # Try to find the longest matching path
+            if len(bbfilespec) > len(closepath):
+                closepath = bbfilespec
+    else:
+        # Unfortunately the bbappend layer and the original recipe's layer don't have the same structure
+        if closepath:
+            # bbappend layer's layer.conf at least has a spec that picks up .bbappend files
+            # Now we just need to substitute out any wildcards
+            appendsubdir = os.path.relpath(os.path.dirname(closepath), destlayerdir)
+            if 'recipes-*' in appendsubdir:
+                # Try to copy this part from the original recipe path
+                res = re.search('/recipes-[^/]+/', recipefile)
+                if res:
+                    appendsubdir = appendsubdir.replace('/recipes-*/', res.group(0))
+            # This is crude, but we have to do something
+            appendsubdir = appendsubdir.replace('*', recipefn.split('_')[0])
+            appendsubdir = appendsubdir.replace('?', 'a')
+            appendpath = os.path.join(destlayerdir, appendsubdir, appendfn)
+        else:
+            pathok = False
+    return (appendpath, pathok)
+
+
+def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False, machine=None, extralines=None, removevalues=None):
+    """
+    Writes a bbappend file for a recipe
+    Parameters:
+        rd: data dictionary for the recipe
+        destlayerdir: base directory of the layer to place the bbappend in
+            (subdirectory path from there will be determined automatically)
+        srcfiles: dict of source files to add to SRC_URI, where the value
+            is the full path to the file to be added, and the value is the
+            original filename as it would appear in SRC_URI or None if it
+            isn't already present. You may pass None for this parameter if
+            you simply want to specify your own content via the extralines
+            parameter.
+        install: dict mapping entries in srcfiles to a tuple of two elements:
+            install path (*without* ${D} prefix) and permission value (as a
+            string, e.g. '0644').
+        wildcardver: True to use a % wildcard in the bbappend filename, or
+            False to make the bbappend specific to the recipe version.
+        machine:
+            If specified, make the changes in the bbappend specific to this
+            machine. This will also cause PACKAGE_ARCH = "${MACHINE_ARCH}"
+            to be added to the bbappend.
+        extralines:
+            Extra lines to add to the bbappend. This may be a dict of name
+            value pairs, or simply a list of the lines.
+        removevalues:
+            Variable values to remove - a dict of names/values.
+    """
+
+    if not removevalues:
+        removevalues = {}
+
+    # Determine how the bbappend should be named
+    appendpath, pathok = get_bbappend_path(rd, destlayerdir, wildcardver)
+    if not appendpath:
+        bb.error('Unable to determine layer directory containing %s' % recipefile)
+        return (None, None)
+    if not pathok:
+        bb.warn('Unable to determine correct subdirectory path for bbappend file - check that what %s adds to BBFILES also matches .bbappend files. Using %s for now, but until you fix this the bbappend will not be applied.' % (os.path.join(destlayerdir, 'conf', 'layer.conf'), os.path.dirname(appendpath)))
+
+    appenddir = os.path.dirname(appendpath)
+    bb.utils.mkdirhier(appenddir)
+
+    # FIXME check if the bbappend doesn't get overridden by a higher priority layer?
+
+    layerdirs = [os.path.abspath(layerdir) for layerdir in rd.getVar('BBLAYERS', True).split()]
+    if not os.path.abspath(destlayerdir) in layerdirs:
+        bb.warn('Specified layer is not currently enabled in bblayers.conf, you will need to add it before this bbappend will be active')
+
+    bbappendlines = []
+    if extralines:
+        if isinstance(extralines, dict):
+            for name, value in extralines.iteritems():
+                bbappendlines.append((name, '=', value))
+        else:
+            # Do our best to split it
+            for line in extralines:
+                if line[-1] == '\n':
+                    line = line[:-1]
+                splitline = line.split(maxsplit=2)
+                if len(splitline) == 3:
+                    bbappendlines.append(tuple(splitline))
+                else:
+                    raise Exception('Invalid extralines value passed')
+
+    def popline(varname):
+        for i in xrange(0, len(bbappendlines)):
+            if bbappendlines[i][0] == varname:
+                line = bbappendlines.pop(i)
+                return line
+        return None
+
+    def appendline(varname, op, value):
+        for i in xrange(0, len(bbappendlines)):
+            item = bbappendlines[i]
+            if item[0] == varname:
+                bbappendlines[i] = (item[0], item[1], item[2] + ' ' + value)
+                break
+        else:
+            bbappendlines.append((varname, op, value))
+
+    destsubdir = rd.getVar('PN', True)
+    if srcfiles:
+        bbappendlines.append(('FILESEXTRAPATHS_prepend', ':=', '${THISDIR}/${PN}:'))
+
+    appendoverride = ''
+    if machine:
+        bbappendlines.append(('PACKAGE_ARCH', '=', '${MACHINE_ARCH}'))
+        appendoverride = '_%s' % machine
+    copyfiles = {}
+    if srcfiles:
+        instfunclines = []
+        for newfile, origsrcfile in srcfiles.iteritems():
+            srcfile = origsrcfile
+            srcurientry = None
+            if not srcfile:
+                srcfile = os.path.basename(newfile)
+                srcurientry = 'file://%s' % srcfile
+                # Double-check it's not there already
+                # FIXME do we care if the entry is added by another bbappend that might go away?
+                if not srcurientry in rd.getVar('SRC_URI', True).split():
+                    if machine:
+                        appendline('SRC_URI_append%s' % appendoverride, '=', ' ' + srcurientry)
+                    else:
+                        appendline('SRC_URI', '+=', srcurientry)
+            copyfiles[newfile] = srcfile
+            if install:
+                institem = install.pop(newfile, None)
+                if institem:
+                    (destpath, perms) = institem
+                    instdestpath = replace_dir_vars(destpath, rd)
+                    instdirline = 'install -d ${D}%s' % os.path.dirname(instdestpath)
+                    if not instdirline in instfunclines:
+                        instfunclines.append(instdirline)
+                    instfunclines.append('install -m %s ${WORKDIR}/%s ${D}%s' % (perms, os.path.basename(srcfile), instdestpath))
+        if instfunclines:
+            bbappendlines.append(('do_install_append%s()' % appendoverride, '', instfunclines))
+
+    bb.note('Writing append file %s' % appendpath)
+
+    if os.path.exists(appendpath):
+        # Work around lack of nonlocal in python 2
+        extvars = {'destsubdir': destsubdir}
+
+        def appendfile_varfunc(varname, origvalue, op, newlines):
+            if varname == 'FILESEXTRAPATHS_prepend':
+                if origvalue.startswith('${THISDIR}/'):
+                    popline('FILESEXTRAPATHS_prepend')
+                    extvars['destsubdir'] = rd.expand(origvalue.split('${THISDIR}/', 1)[1].rstrip(':'))
+            elif varname == 'PACKAGE_ARCH':
+                if machine:
+                    popline('PACKAGE_ARCH')
+                    return (machine, None, 4, False)
+            elif varname.startswith('do_install_append'):
+                func = popline(varname)
+                if func:
+                    instfunclines = [line.strip() for line in origvalue.strip('\n').splitlines()]
+                    for line in func[2]:
+                        if not line in instfunclines:
+                            instfunclines.append(line)
+                    return (instfunclines, None, 4, False)
+            else:
+                splitval = origvalue.split()
+                changed = False
+                removevar = varname
+                if varname in ['SRC_URI', 'SRC_URI_append%s' % appendoverride]:
+                    removevar = 'SRC_URI'
+                    line = popline(varname)
+                    if line:
+                        if line[2] not in splitval:
+                            splitval.append(line[2])
+                            changed = True
+                else:
+                    line = popline(varname)
+                    if line:
+                        splitval = [line[2]]
+                        changed = True
+
+                if removevar in removevalues:
+                    remove = removevalues[removevar]
+                    if isinstance(remove, basestring):
+                        if remove in splitval:
+                            splitval.remove(remove)
+                            changed = True
+                    else:
+                        for removeitem in remove:
+                            if removeitem in splitval:
+                                splitval.remove(removeitem)
+                                changed = True
+
+                if changed:
+                    newvalue = splitval
+                    if len(newvalue) == 1:
+                        # Ensure it's written out as one line
+                        if '_append' in varname:
+                            newvalue = ' ' + newvalue[0]
+                        else:
+                            newvalue = newvalue[0]
+                    if not newvalue and (op in ['+=', '.='] or '_append' in varname):
+                        # There's no point appending nothing
+                        newvalue = None
+                    if varname.endswith('()'):
+                        indent = 4
+                    else:
+                        indent = -1
+                    return (newvalue, None, indent, True)
+            return (origvalue, None, 4, False)
+
+        varnames = [item[0] for item in bbappendlines]
+        if removevalues:
+            varnames.extend(removevalues.keys())
+
+        with open(appendpath, 'r') as f:
+            (updated, newlines) = bb.utils.edit_metadata(f, varnames, appendfile_varfunc)
+
+        destsubdir = extvars['destsubdir']
+    else:
+        updated = False
+        newlines = []
+
+    if bbappendlines:
+        for line in bbappendlines:
+            if line[0].endswith('()'):
+                newlines.append('%s {\n    %s\n}\n' % (line[0], '\n    '.join(line[2])))
+            else:
+                newlines.append('%s %s "%s"\n\n' % line)
+        updated = True
+
+    if updated:
+        with open(appendpath, 'w') as f:
+            f.writelines(newlines)
+
+    if copyfiles:
+        if machine:
+            destsubdir = os.path.join(destsubdir, machine)
+        for newfile, srcfile in copyfiles.iteritems():
+            filedest = os.path.join(appenddir, destsubdir, os.path.basename(srcfile))
+            if os.path.abspath(newfile) != os.path.abspath(filedest):
+                bb.note('Copying %s to %s' % (newfile, filedest))
+                bb.utils.mkdirhier(os.path.dirname(filedest))
+                shutil.copyfile(newfile, filedest)
+
+    return (appendpath, os.path.join(appenddir, destsubdir))
+
+
+def find_layerdir(fn):
+    """ Figure out relative path to base of layer for a file (e.g. a recipe)"""
+    pth = os.path.dirname(fn)
+    layerdir = ''
+    while pth:
+        if os.path.exists(os.path.join(pth, 'conf', 'layer.conf')):
+            layerdir = pth
+            break
+        pth = os.path.dirname(pth)
+    return layerdir
+
+
+def replace_dir_vars(path, d):
+    """Replace common directory paths with appropriate variable references (e.g. /etc becomes ${sysconfdir})"""
+    dirvars = {}
+    for var in d:
+        if var.endswith('dir') and var.lower() == var:
+            value = d.getVar(var, True)
+            if value.startswith('/') and not '\n' in value:
+                dirvars[value] = var
+    for dirpath in sorted(dirvars.keys(), reverse=True):
+        path = path.replace(dirpath, '${%s}' % dirvars[dirpath])
+    return path
+
diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index f4571c4..ad10af5 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -8,7 +8,7 @@ import glob
 
 import oeqa.utils.ftools as ftools
 from oeqa.selftest.base import oeSelfTest
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer
 from oeqa.utils.decorators import testcase
 
 class DevtoolBase(oeSelfTest):
@@ -31,6 +31,35 @@ class DevtoolBase(oeSelfTest):
         for inherit in checkinherits:
             self.assertIn(inherit, inherits, 'Missing inherit of %s' % inherit)
 
+    def _check_bbappend(self, testrecipe, recipefile, appenddir):
+        result = runCmd('bitbake-layers show-appends', cwd=self.builddir)
+        resultlines = result.output.splitlines()
+        inrecipe = False
+        bbappends = []
+        bbappendfile = None
+        for line in resultlines:
+            if inrecipe:
+                if line.startswith(' '):
+                    bbappends.append(line.strip())
+                else:
+                    break
+            elif line == '%s:' % os.path.basename(recipefile):
+                inrecipe = True
+        self.assertLessEqual(len(bbappends), 2, '%s recipe is being bbappended by another layer - bbappends found:\n  %s' % (testrecipe, '\n  '.join(bbappends)))
+        for bbappend in bbappends:
+            if bbappend.startswith(appenddir):
+                bbappendfile = bbappend
+                break
+        else:
+            self.assertTrue(False, 'bbappend for recipe %s does not seem to be created in test layer' % testrecipe)
+        return bbappendfile
+
+    def _create_temp_layer(self, templayerdir, addlayer, templayername, priority=999, recipepathspec='recipes-*/*'):
+        create_temp_layer(templayerdir, templayername, priority, recipepathspec)
+        if addlayer:
+            self.add_command_to_tearDown('bitbake-layers remove-layer %s || true' % templayerdir)
+            result = runCmd('bitbake-layers add-layer %s' % templayerdir, cwd=self.builddir)
+
 
 class DevtoolTests(DevtoolBase):
 
diff --git a/meta/lib/oeqa/selftest/recipetool.py b/meta/lib/oeqa/selftest/recipetool.py
index 832fb7b..f3ad493 100644
--- a/meta/lib/oeqa/selftest/recipetool.py
+++ b/meta/lib/oeqa/selftest/recipetool.py
@@ -6,16 +6,326 @@ import tempfile
 
 import oeqa.utils.ftools as ftools
 from oeqa.selftest.base import oeSelfTest
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer
 from oeqa.utils.decorators import testcase
 from oeqa.selftest.devtool import DevtoolBase
 
 
+templayerdir = ''
+
+def setUpModule():
+    global templayerdir
+    templayerdir = tempfile.mkdtemp(prefix='recipetoolqa')
+    create_temp_layer(templayerdir, 'selftestrecipetool')
+    result = runCmd('bitbake-layers add-layer %s' % templayerdir)
+    # Ensure we have the right data in shlibs/pkgdata
+    logger = logging.getLogger("selftest")
+    logger.info('Running bitbake to generate pkgdata')
+    bitbake('base-files coreutils busybox selftest-recipetool-appendfile')
+
+def tearDownModule():
+    runCmd('bitbake-layers remove-layer %s' % templayerdir, ignore_status=True)
+    runCmd('rm -rf %s' % templayerdir)
+    # Shouldn't leave any traces of this artificial recipe behind
+    bitbake('-c cleansstate selftest-recipetool-appendfile')
+
+
 class RecipetoolTests(DevtoolBase):
 
     def setUpLocal(self):
         self.tempdir = tempfile.mkdtemp(prefix='recipetoolqa')
         self.track_for_cleanup(self.tempdir)
+        self.testfile = os.path.join(self.tempdir, 'testfile')
+        with open(self.testfile, 'w') as f:
+            f.write('Test file\n')
+
+    def tearDownLocal(self):
+        runCmd('rm -rf %s/recipes-*' % templayerdir)
+
+    def _try_recipetool_appendfile(self, testrecipe, destfile, newfile, options, expectedlines, expectedfiles):
+        result = runCmd('recipetool appendfile %s %s %s %s' % (templayerdir, destfile, newfile, options))
+        self.assertNotIn('Traceback', result.output)
+        # Check the bbappend was created and applies properly
+        recipefile = get_bb_var('FILE', testrecipe)
+        bbappendfile = self._check_bbappend(testrecipe, recipefile, templayerdir)
+        # Check the bbappend contents
+        with open(bbappendfile, 'r') as f:
+            self.assertEqual(expectedlines, f.readlines())
+        # Check file was copied
+        filesdir = os.path.join(os.path.dirname(bbappendfile), testrecipe)
+        for expectedfile in expectedfiles:
+            self.assertTrue(os.path.isfile(os.path.join(filesdir, expectedfile)), 'Expected file %s to be copied next to bbappend, but it wasn\'t' % expectedfile)
+        # Check no other files created
+        createdfiles = []
+        for root, _, files in os.walk(filesdir):
+            for f in files:
+                createdfiles.append(os.path.relpath(os.path.join(root, f), filesdir))
+        self.assertTrue(sorted(createdfiles), sorted(expectedfiles))
+        return bbappendfile, result.output
+
+    def _try_recipetool_appendfile_fail(self, destfile, newfile, checkerror):
+        cmd = 'recipetool appendfile %s %s %s' % (templayerdir, destfile, newfile)
+        result = runCmd(cmd, ignore_status=True)
+        self.assertNotEqual(result.status, 0, 'Command "%s" should have failed but didn\'t' % cmd)
+        self.assertNotIn('Traceback', result.output)
+        for errorstr in checkerror:
+            self.assertIn(errorstr, result.output)
+
+
+    def test_recipetool_appendfile_basic(self):
+        # Basic test
+        expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
+                        '\n']
+        _, output = self._try_recipetool_appendfile('base-files', '/etc/motd', self.testfile, '', expectedlines, ['motd'])
+        self.assertNotIn('WARNING: ', output)
+
+    def test_recipetool_appendfile_invalid(self):
+        # Test some commands that should error
+        self._try_recipetool_appendfile_fail('/etc/passwd', self.testfile, ['ERROR: /etc/passwd cannot be handled by this tool', 'useradd', 'extrausers'])
+        self._try_recipetool_appendfile_fail('/etc/timestamp', self.testfile, ['ERROR: /etc/timestamp cannot be handled by this tool'])
+        self._try_recipetool_appendfile_fail('/dev/console', self.testfile, ['ERROR: /dev/console cannot be handled by this tool'])
+
+    def test_recipetool_appendfile_alternatives(self):
+        # Now try with a file we know should be an alternative
+        # (this is very much a fake example, but one we know is reliably an alternative)
+        self._try_recipetool_appendfile_fail('/bin/ls', self.testfile, ['ERROR: File /bin/ls is an alternative possibly provided by the following recipes:', 'coreutils', 'busybox'])
+        corebase = get_bb_var('COREBASE')
+        # Need a test file - should be executable
+        testfile2 = os.path.join(corebase, 'oe-init-build-env')
+        testfile2name = os.path.basename(testfile2)
+        expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
+                         '\n',
+                         'SRC_URI += "file://%s"\n' % testfile2name,
+                         '\n',
+                         'do_install_append() {\n',
+                         '    install -d ${D}${base_bindir}\n',
+                         '    install -m 0755 ${WORKDIR}/%s ${D}${base_bindir}/ls\n' % testfile2name,
+                         '}\n']
+        self._try_recipetool_appendfile('coreutils', '/bin/ls', testfile2, '-r coreutils', expectedlines, [testfile2name])
+        # Now try bbappending the same file again, contents should not change
+        bbappendfile, _ = self._try_recipetool_appendfile('coreutils', '/bin/ls', self.testfile, '-r coreutils', expectedlines, [testfile2name])
+        # But file should have
+        copiedfile = os.path.join(os.path.dirname(bbappendfile), 'coreutils', testfile2name)
+        result = runCmd('diff -q %s %s' % (testfile2, copiedfile), ignore_status=True)
+        self.assertNotEqual(result.status, 0, 'New file should have been copied but was not')
+
+    def test_recipetool_appendfile_binary(self):
+        # Try appending a binary file
+        result = runCmd('recipetool appendfile %s /bin/ls /bin/ls -r coreutils' % templayerdir)
+        self.assertIn('WARNING: ', result.output)
+        self.assertIn('is a binary', result.output)
+
+    def test_recipetool_appendfile_add(self):
+        corebase = get_bb_var('COREBASE')
+        # Try arbitrary file add to a recipe
+        expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
+                         '\n',
+                         'SRC_URI += "file://testfile"\n',
+                         '\n',
+                         'do_install_append() {\n',
+                         '    install -d ${D}${datadir}\n',
+                         '    install -m 0644 ${WORKDIR}/testfile ${D}${datadir}/something\n',
+                         '}\n']
+        self._try_recipetool_appendfile('netbase', '/usr/share/something', self.testfile, '-r netbase', expectedlines, ['testfile'])
+        # Try adding another file, this time where the source file is executable
+        # (so we're testing that, plus modifying an existing bbappend)
+        testfile2 = os.path.join(corebase, 'oe-init-build-env')
+        testfile2name = os.path.basename(testfile2)
+        expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
+                         '\n',
+                         'SRC_URI += "file://testfile \\\n',
+                         '            file://%s \\\n' % testfile2name,
+                         '            "\n',
+                         '\n',
+                         'do_install_append() {\n',
+                         '    install -d ${D}${datadir}\n',
+                         '    install -m 0644 ${WORKDIR}/testfile ${D}${datadir}/something\n',
+                         '    install -m 0755 ${WORKDIR}/%s ${D}${datadir}/scriptname\n' % testfile2name,
+                         '}\n']
+        self._try_recipetool_appendfile('netbase', '/usr/share/scriptname', testfile2, '-r netbase', expectedlines, ['testfile', testfile2name])
+
+    def test_recipetool_appendfile_add_bindir(self):
+        # Try arbitrary file add to a recipe, this time to a location such that should be installed as executable
+        expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
+                         '\n',
+                         'SRC_URI += "file://testfile"\n',
+                         '\n',
+                         'do_install_append() {\n',
+                         '    install -d ${D}${bindir}\n',
+                         '    install -m 0755 ${WORKDIR}/testfile ${D}${bindir}/selftest-recipetool-testbin\n',
+                         '}\n']
+        _, output = self._try_recipetool_appendfile('netbase', '/usr/bin/selftest-recipetool-testbin', self.testfile, '-r netbase', expectedlines, ['testfile'])
+        self.assertNotIn('WARNING: ', output)
+
+    def test_recipetool_appendfile_add_machine(self):
+        # Try arbitrary file add to a recipe, this time to a location such that should be installed as executable
+        expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
+                         '\n',
+                         'PACKAGE_ARCH = "${MACHINE_ARCH}"\n',
+                         '\n',
+                         'SRC_URI_append_mymachine = " file://testfile"\n',
+                         '\n',
+                         'do_install_append_mymachine() {\n',
+                         '    install -d ${D}${datadir}\n',
+                         '    install -m 0644 ${WORKDIR}/testfile ${D}${datadir}/something\n',
+                         '}\n']
+        _, output = self._try_recipetool_appendfile('netbase', '/usr/share/something', self.testfile, '-r netbase -m mymachine', expectedlines, ['mymachine/testfile'])
+        self.assertNotIn('WARNING: ', output)
+
+    def test_recipetool_appendfile_orig(self):
+        # A file that's in SRC_URI and in do_install with the same name
+        expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
+                         '\n']
+        _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-orig', self.testfile, '', expectedlines, ['selftest-replaceme-orig'])
+        self.assertNotIn('WARNING: ', output)
+
+    def test_recipetool_appendfile_todir(self):
+        # A file that's in SRC_URI and in do_install with destination directory rather than file
+        expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
+                         '\n']
+        _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-todir', self.testfile, '', expectedlines, ['selftest-replaceme-todir'])
+        self.assertNotIn('WARNING: ', output)
+
+    def test_recipetool_appendfile_renamed(self):
+        # A file that's in SRC_URI with a different name to the destination file
+        expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
+                         '\n']
+        _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-renamed', self.testfile, '', expectedlines, ['file1'])
+        self.assertNotIn('WARNING: ', output)
+
+    def test_recipetool_appendfile_subdir(self):
+        # A file that's in SRC_URI in a subdir
+        expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
+                         '\n',
+                         'SRC_URI += "file://testfile"\n',
+                         '\n',
+                         'do_install_append() {\n',
+                         '    install -d ${D}${datadir}\n',
+                         '    install -m 0644 ${WORKDIR}/testfile ${D}${datadir}/selftest-replaceme-subdir\n',
+                         '}\n']
+        _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-subdir', self.testfile, '', expectedlines, ['testfile'])
+        self.assertNotIn('WARNING: ', output)
+
+    def test_recipetool_appendfile_src_glob(self):
+        # A file that's in SRC_URI as a glob
+        expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
+                         '\n',
+                         'SRC_URI += "file://testfile"\n',
+                         '\n',
+                         'do_install_append() {\n',
+                         '    install -d ${D}${datadir}\n',
+                         '    install -m 0644 ${WORKDIR}/testfile ${D}${datadir}/selftest-replaceme-src-globfile\n',
+                         '}\n']
+        _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-src-globfile', self.testfile, '', expectedlines, ['testfile'])
+        self.assertNotIn('WARNING: ', output)
+
+    def test_recipetool_appendfile_inst_glob(self):
+        # A file that's in do_install as a glob
+        expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
+                         '\n']
+        _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-inst-globfile', self.testfile, '', expectedlines, ['selftest-replaceme-inst-globfile'])
+        self.assertNotIn('WARNING: ', output)
+
+    def test_recipetool_appendfile_inst_todir_glob(self):
+        # A file that's in do_install as a glob with destination as a directory
+        expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
+                         '\n']
+        _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-inst-todir-globfile', self.testfile, '', expectedlines, ['selftest-replaceme-inst-todir-globfile'])
+        self.assertNotIn('WARNING: ', output)
+
+    def test_recipetool_appendfile_patch(self):
+        # A file that's added by a patch in SRC_URI
+        expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
+                         '\n',
+                         'SRC_URI += "file://testfile"\n',
+                         '\n',
+                         'do_install_append() {\n',
+                         '    install -d ${D}${sysconfdir}\n',
+                         '    install -m 0644 ${WORKDIR}/testfile ${D}${sysconfdir}/selftest-replaceme-patched\n',
+                         '}\n']
+        _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/etc/selftest-replaceme-patched', self.testfile, '', expectedlines, ['testfile'])
+        for line in output.splitlines():
+            if line.startswith('WARNING: '):
+                self.assertIn('add-file.patch', line, 'Unexpected warning found in output:\n%s' % line)
+                break
+        else:
+            self.assertTrue(False, 'Patch warning not found in output:\n%s' % output)
+
+    def test_recipetool_appendfile_script(self):
+        # Now, a file that's in SRC_URI but installed by a script (so no mention in do_install)
+        expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
+                         '\n',
+                         'SRC_URI += "file://testfile"\n',
+                         '\n',
+                         'do_install_append() {\n',
+                         '    install -d ${D}${datadir}\n',
+                         '    install -m 0644 ${WORKDIR}/testfile ${D}${datadir}/selftest-replaceme-scripted\n',
+                         '}\n']
+        _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-scripted', self.testfile, '', expectedlines, ['testfile'])
+        self.assertNotIn('WARNING: ', output)
+
+    def test_recipetool_appendfile_inst_func(self):
+        # A file that's installed from a function called by do_install
+        expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
+                         '\n']
+        _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-inst-func', self.testfile, '', expectedlines, ['selftest-replaceme-inst-func'])
+        self.assertNotIn('WARNING: ', output)
+
+    def test_recipetool_appendfile_postinstall(self):
+        # A file that's created by a postinstall script (and explicitly mentioned in it)
+        # First try without specifying recipe
+        self._try_recipetool_appendfile_fail('/usr/share/selftest-replaceme-postinst', self.testfile, ['File /usr/share/selftest-replaceme-postinst may be written out in a pre/postinstall script of the following recipes:', 'selftest-recipetool-appendfile'])
+        # Now specify recipe
+        expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
+                         '\n',
+                         'SRC_URI += "file://testfile"\n',
+                         '\n',
+                         'do_install_append() {\n',
+                         '    install -d ${D}${datadir}\n',
+                         '    install -m 0644 ${WORKDIR}/testfile ${D}${datadir}/selftest-replaceme-postinst\n',
+                         '}\n']
+        _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-postinst', self.testfile, '-r selftest-recipetool-appendfile', expectedlines, ['testfile'])
+
+    def test_recipetool_appendfile_extlayer(self):
+        # Try creating a bbappend in a layer that's not in bblayers.conf and has a different structure
+        exttemplayerdir = os.path.join(self.tempdir, 'extlayer')
+        self._create_temp_layer(exttemplayerdir, False, 'oeselftestextlayer', recipepathspec='metadata/recipes/recipes-*/*')
+        result = runCmd('recipetool appendfile %s /usr/share/selftest-replaceme-orig %s' % (exttemplayerdir, self.testfile))
+        self.assertNotIn('Traceback', result.output)
+        createdfiles = []
+        for root, _, files in os.walk(exttemplayerdir):
+            for f in files:
+                createdfiles.append(os.path.relpath(os.path.join(root, f), exttemplayerdir))
+        createdfiles.remove('conf/layer.conf')
+        expectedfiles = ['metadata/recipes/recipes-test/selftest-recipetool-appendfile/selftest-recipetool-appendfile.bbappend',
+                         'metadata/recipes/recipes-test/selftest-recipetool-appendfile/selftest-recipetool-appendfile/selftest-replaceme-orig']
+        self.assertEqual(sorted(createdfiles), sorted(expectedfiles))
+
+    def test_recipetool_appendfile_wildcard(self):
+
+        def try_appendfile_wc(options):
+            result = runCmd('recipetool appendfile %s /etc/profile %s %s' % (templayerdir, self.testfile, options))
+            self.assertNotIn('Traceback', result.output)
+            bbappendfile = None
+            for root, _, files in os.walk(templayerdir):
+                for f in files:
+                    if f.endswith('.bbappend'):
+                        bbappendfile = f
+                        break
+            if not bbappendfile:
+                self.assertTrue(False, 'No bbappend file created')
+            runCmd('rm -rf %s/recipes-*' % templayerdir)
+            return bbappendfile
+
+        # Check without wildcard option
+        recipefn = os.path.basename(get_bb_var('FILE', 'base-files'))
+        filename = try_appendfile_wc('')
+        self.assertEqual(filename, recipefn.replace('.bb', '.bbappend'))
+        # Now check with wildcard option
+        filename = try_appendfile_wc('-w')
+        self.assertEqual(filename, recipefn.split('_')[0] + '_%.bbappend')
+
+
 
     def test_recipetool_create(self):
         # Try adding a recipe
@@ -52,4 +362,3 @@ class RecipetoolTests(DevtoolBase):
         checkvars['DEPENDS'] = 'libpng pango libx11 libxext jpeg'
         inherits = ['autotools', 'pkgconfig']
         self._test_recipe_contents(recipefile, checkvars, inherits)
-
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 663e4e7..dc8a983 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -162,3 +162,14 @@ def get_test_layer():
             testlayer = l
             break
     return testlayer
+
+def create_temp_layer(templayerdir, templayername, priority=999, recipepathspec='recipes-*/*'):
+    os.makedirs(os.path.join(templayerdir, 'conf'))
+    with open(os.path.join(templayerdir, 'conf', 'layer.conf'), 'w') as f:
+        f.write('BBPATH .= ":${LAYERDIR}"\n')
+        f.write('BBFILES += "${LAYERDIR}/%s/*.bb \\' % recipepathspec)
+        f.write('            ${LAYERDIR}/%s/*.bbappend"\n' % recipepathspec)
+        f.write('BBFILE_COLLECTIONS += "%s"\n' % templayername)
+        f.write('BBFILE_PATTERN_%s = "^${LAYERDIR}/"\n' % templayername)
+        f.write('BBFILE_PRIORITY_%s = "%d"\n' % (templayername, priority))
+        f.write('BBFILE_PATTERN_IGNORE_EMPTY_%s = "1"\n' % templayername)
diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
new file mode 100644
index 0000000..39117c1
--- /dev/null
+++ b/scripts/lib/recipetool/append.py
@@ -0,0 +1,360 @@
+# Recipe creation tool - append plugin
+#
+# Copyright (C) 2015 Intel Corporation
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
+import subprocess
+import logging
+import stat
+import shutil
+import scriptutils
+import errno
+from collections import defaultdict
+
+logger = logging.getLogger('recipetool')
+
+tinfoil = None
+
+def plugin_init(pluginlist):
+    # Don't need to do anything here right now, but plugins must have this function defined
+    pass
+
+def tinfoil_init(instance):
+    global tinfoil
+    tinfoil = instance
+
+
+# FIXME guessing when we don't have pkgdata?
+# FIXME mode to create patch rather than directly substitute
+
+class InvalidTargetFileError(Exception):
+    pass
+
+def find_target_file(targetpath, d, pkglist=None):
+    """Find the recipe installing the specified target path, optionally limited to a select list of packages"""
+    import json
+
+    pkgdata_dir = d.getVar('PKGDATA_DIR', True)
+
+    # The mix between /etc and ${sysconfdir} here may look odd, but it is just
+    # being consistent with usage elsewhere
+    invalidtargets = {'${sysconfdir}/version': '${sysconfdir}/version is written out at image creation time',
+                      '/etc/timestamp': '/etc/timestamp is written out at image creation time',
+                      '/dev/*': '/dev is handled by udev (or equivalent) and the kernel (devtmpfs)',
+                      '/etc/passwd': '/etc/passwd should be managed through the useradd and extrausers classes',
+                      '/etc/group': '/etc/group should be managed through the useradd and extrausers classes',
+                      '/etc/shadow': '/etc/shadow should be managed through the useradd and extrausers classes',
+                      '/etc/gshadow': '/etc/gshadow should be managed through the useradd and extrausers classes',
+                      '${sysconfdir}/hostname': '${sysconfdir}/hostname contents should be set by setting hostname_pn-base-files = "value" in configuration',}
+
+    for pthspec, message in invalidtargets.iteritems():
+        if fnmatch.fnmatchcase(targetpath, d.expand(pthspec)):
+            raise InvalidTargetFileError(d.expand(message))
+
+    targetpath_re = re.compile(r'\s+(\$D)?%s(\s|$)' % targetpath)
+
+    recipes = defaultdict(list)
+    for root, dirs, files in os.walk(os.path.join(pkgdata_dir, 'runtime')):
+        if pkglist:
+            filelist = pkglist
+        else:
+            filelist = files
+        for fn in filelist:
+            pkgdatafile = os.path.join(root, fn)
+            if pkglist and not os.path.exists(pkgdatafile):
+                continue
+            with open(pkgdatafile, 'r') as f:
+                pn = ''
+                # This does assume that PN comes before other values, but that's a fairly safe assumption
+                for line in f:
+                    if line.startswith('PN:'):
+                        pn = line.split(':', 1)[1].strip()
+                    elif line.startswith('FILES_INFO:'):
+                        val = line.split(':', 1)[1].strip()
+                        dictval = json.loads(val)
+                        for fullpth in dictval.keys():
+                            if fnmatch.fnmatchcase(fullpth, targetpath):
+                                recipes[targetpath].append(pn)
+                    elif line.startswith('pkg_preinst_') or line.startswith('pkg_postinst_'):
+                        scriptval = line.split(':', 1)[1].strip().decode('string_escape')
+                        if 'update-alternatives --install %s ' % targetpath in scriptval:
+                            recipes[targetpath].append('?%s' % pn)
+                        elif targetpath_re.search(scriptval):
+                            recipes[targetpath].append('!%s' % pn)
+    return recipes
+
+def _get_recipe_file(cooker, pn):
+    import oe.recipeutils
+    recipefile = oe.recipeutils.pn_to_recipe(cooker, pn)
+    if not recipefile:
+        skipreasons = oe.recipeutils.get_unavailable_reasons(cooker, pn)
+        if skipreasons:
+            logger.error('\n'.join(skipreasons))
+        else:
+            logger.error("Unable to find any recipe file matching %s" % pn)
+    return recipefile
+
+def _parse_recipe(pn, tinfoil):
+    import oe.recipeutils
+    recipefile = _get_recipe_file(tinfoil.cooker, pn)
+    if not recipefile:
+        # Error already logged
+        return None
+    append_files = tinfoil.cooker.collection.get_file_appends(recipefile)
+    rd = oe.recipeutils.parse_recipe(recipefile, append_files,
+                                    tinfoil.config_data)
+    return rd
+
+def determine_file_source(targetpath, rd):
+    """Assuming we know a file came from a specific recipe, figure out exactly where it came from"""
+    import oe.recipeutils
+
+    # See if it's in do_install for the recipe
+    workdir = rd.getVar('WORKDIR', True)
+    src_uri = rd.getVar('SRC_URI', True)
+    srcfile = ''
+    modpatches = []
+    elements = check_do_install(rd, targetpath)
+    if elements:
+        logger.debug('do_install line:\n%s' % ' '.join(elements))
+        srcpath = get_source_path(elements)
+        logger.debug('source path: %s' % srcpath)
+        if not srcpath.startswith('/'):
+            # Handle non-absolute path
+            srcpath = os.path.abspath(os.path.join(rd.getVarFlag('do_install', 'dirs', True).split()[-1], srcpath))
+        if srcpath.startswith(workdir):
+            # OK, now we have the source file name, look for it in SRC_URI
+            workdirfile = os.path.relpath(srcpath, workdir)
+            # FIXME this is where we ought to have some code in the fetcher, because this is naive
+            for item in src_uri.split():
+                localpath = bb.fetch2.localpath(item, rd)
+                # Source path specified in do_install might be a glob
+                if fnmatch.fnmatch(os.path.basename(localpath), workdirfile):
+                    srcfile = 'file://%s' % localpath
+                elif '/' in workdirfile:
+                    if item == 'file://%s' % workdirfile:
+                        srcfile = 'file://%s' % localpath
+
+        # Check patches
+        srcpatches = []
+        patchedfiles = oe.recipeutils.get_recipe_patched_files(rd)
+        for patch, filelist in patchedfiles.iteritems():
+            for fileitem in filelist:
+                if fileitem[0] == srcpath:
+                    srcpatches.append((patch, fileitem[1]))
+        if srcpatches:
+            addpatch = None
+            for patch in srcpatches:
+                if patch[1] == 'A':
+                    addpatch = patch[0]
+                else:
+                    modpatches.append(patch[0])
+            if addpatch:
+                srcfile = 'patch://%s' % addpatch
+
+    return (srcfile, elements, modpatches)
+
+def get_source_path(cmdelements):
+    """Find the source path specified within a command"""
+    command = cmdelements[0]
+    if command in ['install', 'cp']:
+        helptext = subprocess.check_output('LC_ALL=C %s --help' % command, shell=True)
+        argopts = ''
+        argopt_line_re = re.compile('^-([a-zA-Z0-9]), --[a-z-]+=')
+        for line in helptext.splitlines():
+            line = line.lstrip()
+            res = argopt_line_re.search(line)
+            if res:
+                argopts += res.group(1)
+        if not argopts:
+            # Fallback
+            if command == 'install':
+                argopts = 'gmoSt'
+            elif command == 'cp':
+                argopts = 't'
+            else:
+                raise Exception('No fallback arguments for command %s' % command)
+
+        skipnext = False
+        for elem in cmdelements[1:-1]:
+            if elem.startswith('-'):
+                if len(elem) > 1 and elem[1] in argopts:
+                    skipnext = True
+                continue
+            if skipnext:
+                skipnext = False
+                continue
+            return elem
+    else:
+        raise Exception('get_source_path: no handling for command "%s"')
+
+def get_func_deps(func, d):
+    """Find the function dependencies of a shell function"""
+    deps = bb.codeparser.ShellParser(func, logger).parse_shell(d.getVar(func, True))
+    deps |= set((d.getVarFlag(func, "vardeps", True) or "").split())
+    funcdeps = []
+    for dep in deps:
+        if d.getVarFlag(dep, 'func', True):
+            funcdeps.append(dep)
+    return funcdeps
+
+def check_do_install(rd, targetpath):
+    """Look at do_install for a command that installs/copies the specified target path"""
+    instpath = os.path.abspath(os.path.join(rd.getVar('D', True), targetpath.lstrip('/')))
+    do_install = rd.getVar('do_install', True)
+    # Handle where do_install calls other functions (somewhat crudely, but good enough for this purpose)
+    deps = get_func_deps('do_install', rd)
+    for dep in deps:
+        do_install = do_install.replace(dep, rd.getVar(dep, True))
+
+    # Look backwards through do_install as we want to catch where a later line (perhaps
+    # from a bbappend) is writing over the top
+    for line in reversed(do_install.splitlines()):
+        line = line.strip()
+        if (line.startswith('install ') and ' -m' in line) or line.startswith('cp '):
+            elements = line.split()
+            destpath = os.path.abspath(elements[-1])
+            if destpath == instpath:
+                return elements
+            elif destpath.rstrip('/') == os.path.dirname(instpath):
+                # FIXME this doesn't take recursive copy into account; unsure if it's practical to do so
+                srcpath = get_source_path(elements)
+                if fnmatch.fnmatchcase(os.path.basename(instpath), os.path.basename(srcpath)):
+                    return elements
+    return None
+
+
+def appendfile(args):
+    import oe.recipeutils
+
+    if not args.targetpath.startswith('/'):
+        logger.error('Target path should start with /')
+        return 2
+
+    if os.path.isdir(args.newfile):
+        logger.error('Specified new file "%s" is a directory' % args.newfile)
+        return 2
+
+    if not os.path.exists(args.destlayer):
+        logger.error('Destination layer directory "%s" does not exist' % args.destlayer)
+        return 2
+    if not os.path.exists(os.path.join(args.destlayer, 'conf', 'layer.conf')):
+        logger.error('conf/layer.conf not found in destination layer "%s"' % args.destlayer)
+        return 2
+
+    stdout = ''
+    try:
+        (stdout, _) = bb.process.run('LANG=C file -E -b %s' % args.newfile, shell=True)
+    except bb.process.ExecutionError as err:
+        logger.debug('file command returned error: %s' % err)
+        pass
+    if stdout:
+        logger.debug('file command output: %s' % stdout.rstrip())
+        if ('executable' in stdout and not 'shell script' in stdout) or 'shared object' in stdout:
+            logger.warn('This file looks like it is a binary or otherwise the output of compilation. If it is, you should consider building it properly instead of substituting a binary file directly.')
+
+    if args.recipe:
+        recipes = {args.targetpath: [args.recipe],}
+    else:
+        try:
+            recipes = find_target_file(args.targetpath, tinfoil.config_data)
+        except InvalidTargetFileError as e:
+            logger.error('%s cannot be handled by this tool: %s' % (args.targetpath, e))
+            return 1
+        if not recipes:
+            logger.error('Unable to find any package producing path %s - this may be because the recipe packaging it has not been built yet' % args.targetpath)
+            return 1
+
+    alternative_pns = []
+    postinst_pns = []
+
+    selectpn = None
+    for targetpath, pnlist in recipes.iteritems():
+        for pn in pnlist:
+            if pn.startswith('?'):
+                alternative_pns.append(pn[1:])
+            elif pn.startswith('!'):
+                postinst_pns.append(pn[1:])
+            else:
+                selectpn = pn
+
+    if not selectpn and len(alternative_pns) == 1:
+        selectpn = alternative_pns[0]
+        logger.error('File %s is an alternative possibly provided by recipe %s but seemingly no other, selecting it by default - you should double check other recipes' % (args.targetpath, selectpn))
+
+    if selectpn:
+        logger.debug('Selecting recipe %s for file %s' % (selectpn, args.targetpath))
+        if postinst_pns:
+            logger.warn('%s be modified by postinstall scripts for the following recipes:\n  %s\nThis may or may not be an issue depending on what modifications these postinstall scripts make.' % (args.targetpath, '\n  '.join(postinst_pns)))
+        rd = _parse_recipe(selectpn, tinfoil)
+        if not rd:
+            # Error message already shown
+            return 1
+        sourcefile, instelements, modpatches = determine_file_source(args.targetpath, rd)
+        sourcepath = None
+        if sourcefile:
+            sourcetype, sourcepath = sourcefile.split('://', 1)
+            logger.debug('Original source file is %s (%s)' % (sourcepath, sourcetype))
+            if sourcetype == 'patch':
+                logger.warn('File %s is added by the patch %s - you may need to remove or replace this patch in order to replace the file.' % (args.targetpath, sourcepath))
+                sourcepath = None
+        else:
+            logger.debug('Unable to determine source file, proceeding anyway')
+        if modpatches:
+            logger.warn('File %s is modified by the following patches:\n  %s' % (args.targetpath, '\n  '.join(modpatches)))
+
+        if instelements and sourcepath:
+            install = None
+        else:
+            # Auto-determine permissions
+            # Check destination
+            binpaths = '${bindir}:${sbindir}:${base_bindir}:${base_sbindir}:${libexecdir}:${sysconfdir}/init.d'
+            perms = '0644'
+            if os.path.abspath(os.path.dirname(args.targetpath)) in rd.expand(binpaths).split(':'):
+                # File is going into a directory normally reserved for executables, so it should be executable
+                perms = '0755'
+            else:
+                # Check source
+                st = os.stat(args.newfile)
+                if st.st_mode & stat.S_IXUSR:
+                    perms = '0755'
+            install = {args.newfile: (args.targetpath, perms)}
+        oe.recipeutils.bbappend_recipe(rd, args.destlayer, {args.newfile: sourcepath}, install, wildcardver=args.wildcard_version, machine=args.machine)
+        return 0
+    else:
+        if alternative_pns:
+            logger.error('File %s is an alternative possibly provided by the following recipes:\n  %s\nPlease select recipe with -r/--recipe' % (targetpath, '\n  '.join(alternative_pns)))
+        elif postinst_pns:
+            logger.error('File %s may be written out in a pre/postinstall script of the following recipes:\n  %s\nPlease select recipe with -r/--recipe' % (targetpath, '\n  '.join(postinst_pns)))
+        return 3
+
+
+def register_command(subparsers):
+    parser_appendfile = subparsers.add_parser('appendfile',
+                                                    help='Create a bbappend to replace a file',
+                                                    description='')
+    parser_appendfile.add_argument('destlayer', help='Destination layer to write the bbappend to')
+    parser_appendfile.add_argument('targetpath', help='Path within the image to the file to be replaced')
+    parser_appendfile.add_argument('newfile', help='Custom file to replace it with')
+    parser_appendfile.add_argument('-r', '--recipe', help='Override recipe to apply to (default is to find which recipe already packages it)')
+    parser_appendfile.add_argument('-m', '--machine', help='Make bbappend changes specific to a machine only', metavar='MACHINE')
+    parser_appendfile.add_argument('-w', '--wildcard-version', help='Use wildcard to make the bbappend apply to any recipe version', action='store_true')
+    parser_appendfile.set_defaults(func=appendfile, parserecipes=True)
diff --git a/scripts/recipetool b/scripts/recipetool
index b7d3ee8..c68bef4 100755
--- a/scripts/recipetool
+++ b/scripts/recipetool
@@ -31,11 +31,11 @@ logger = scriptutils.logger_create('recipetool')
 
 plugins = []
 
-def tinfoil_init():
+def tinfoil_init(parserecipes):
     import bb.tinfoil
     import logging
     tinfoil = bb.tinfoil.Tinfoil()
-    tinfoil.prepare(True)
+    tinfoil.prepare(not parserecipes)
 
     for plugin in plugins:
         if hasattr(plugin, 'tinfoil_init'):
@@ -82,7 +82,7 @@ def main():
 
     scriptutils.logger_setup_color(logger, args.color)
 
-    tinfoil_init()
+    tinfoil_init(getattr(args, 'parserecipes', False))
 
     ret = args.func(args)
 
-- 
2.1.0


