Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BE8117687B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 10:39:36 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 08 Sep 2015 03:39:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,489,1437462000"; d="scan'208";a="800537232"
Received: from jdkarpin-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.5.153])
	by fmsmga002.fm.intel.com with ESMTP; 08 Sep 2015 03:39:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 11:39:09 +0100
Message-Id: <48bf710d26ae8e44d07f8d2e46be93fabab5d2d9.1441706523.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1441706523.git.paul.eggleton@linux.intel.com>
References: <cover.1441706523.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1441706523.git.paul.eggleton@linux.intel.com>
References: <cover.1441706523.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/9] devtool: add upgrade feature
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
X-List-Received-Date: Tue, 08 Sep 2015 10:39:36 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Upgrades a recipe to a particular version and downloads the source code
into a folder. User can avoid patching the source code.

These are the general steps of the upgrade function:

   - Extract current recipe source code into srctree and create a branch
   - Extract upgrade recipe source code into srctree and rebase with
     previous branch. In case the rebase is not correctly applied, source
     code will not be deleted, so user correct the patches
   - Creates the new recipe under the workspace

[YOCTO #7642]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-test/devtool/devtool-upgrade_0.1.bb    |  25 ++
 ...-exit-with-EXIT_SUCCESS-instead-of-a-magi.patch |  27 ++
 .../devtool/files/devtool-upgrade-0.1.tar.gz       | Bin 0 -> 411 bytes
 .../devtool/files/devtool-upgrade-0.2.tar.gz       | Bin 0 -> 411 bytes
 meta/lib/oeqa/selftest/devtool.py                  |  36 +++
 scripts/lib/devtool/standard.py                    |   4 +-
 scripts/lib/devtool/upgrade.py                     | 354 +++++++++++++++++++++
 7 files changed, 445 insertions(+), 1 deletion(-)
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade_0.1.bb
 create mode 100644 meta-selftest/recipes-test/devtool/files/0001-helloword.c-exit-with-EXIT_SUCCESS-instead-of-a-magi.patch
 create mode 100644 meta-selftest/recipes-test/devtool/files/devtool-upgrade-0.1.tar.gz
 create mode 100644 meta-selftest/recipes-test/devtool/files/devtool-upgrade-0.2.tar.gz
 create mode 100644 scripts/lib/devtool/upgrade.py

diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade_0.1.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade_0.1.bb
new file mode 100644
index 0000000..33ffc88
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade_0.1.bb
@@ -0,0 +1,25 @@
+#
+# This file was derived from the 'Hello World!' example recipe in the
+# Yocto Project Development Manual.
+#
+
+DESCRIPTION = "Simple helloworld application used to test the devtool upgrade feature"
+SECTION = "devtool"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+PR = "r0"
+
+SRC_URI = "file://${THISDIR}/files/${P}.tar.gz \
+           file://0001-helloword.c-exit-with-EXIT_SUCCESS-instead-of-a-magi.patch \
+           "
+
+S = "${WORKDIR}/${P}"
+
+do_compile() {
+	     ${CC} helloworld.c -o helloworld
+}
+
+do_install() {
+	     install -d ${D}${bindir}
+	     install -m 0755 helloworld ${D}${bindir}
+}
diff --git a/meta-selftest/recipes-test/devtool/files/0001-helloword.c-exit-with-EXIT_SUCCESS-instead-of-a-magi.patch b/meta-selftest/recipes-test/devtool/files/0001-helloword.c-exit-with-EXIT_SUCCESS-instead-of-a-magi.patch
new file mode 100644
index 0000000..2294a09
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/files/0001-helloword.c-exit-with-EXIT_SUCCESS-instead-of-a-magi.patch
@@ -0,0 +1,27 @@
+From 0f37affbc6e6c71687301d99d7259f1968e57c48 Mon Sep 17 00:00:00 2001
+From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
+Date: Wed, 26 Aug 2015 12:42:23 +0000
+Subject: [PATCH] helloword.c: exit with EXIT_SUCCESS instead of a magic number
+
+---
+ helloworld.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/helloworld.c b/helloworld.c
+index 71f2e46..54bf50b 100644
+--- a/helloworld.c
++++ b/helloworld.c
+@@ -1,8 +1,9 @@
+ #include <stdio.h>
++#include <stdlib.h>
+ 
+ int main(int argc, char **argv)
+ {
+     printf("Hello World!\n");
+ 
+-    return 0;
++    return EXIT_SUCCESS;
+ }
+-- 
+1.8.4.5
+
diff --git a/meta-selftest/recipes-test/devtool/files/devtool-upgrade-0.1.tar.gz b/meta-selftest/recipes-test/devtool/files/devtool-upgrade-0.1.tar.gz
new file mode 100644
index 0000000000000000000000000000000000000000..06a1c49cd9b440bba0cc16363b60d11b206895bf
GIT binary patch
literal 411
zcmV;M0c8FkiwFRs0OVBw1MSs8Z-Ous2XM}Oiq2isOzbNymALKfakpJ|X@DsSf+^rk
zmVNiNCX1Wm=7!Ojz2Bwa6WR*@r#F01t4X5bM3)};AjB|EmQ_(?gL*O5=JNsdz-fgV
z0q5({*d8hP%mF4Om}BOHL(M8cIAqms+QZakrL<W}+xu*9?n3yK%&T;s+yUq2_ZO0Z
z7X*CdQx4KKRrRF`fyV{2RmN;J+JEi2cZLqp5cc7*=dgK@LfDZ3h4ndX`oTIbTlx2;
zbci_iLYjQ!KPy!p7t6h^t}ac7{N_Fvn*XNfzw?hUOR}tZDRdTl(I4jcx&MQG{(<y;
z^IDkifs_*a|4FcL)BmXmSs(*1q#*?1i2b(xf2p2(W9T4F`EMEb9iQ^w*#Cixo&0m^
zkduVypZEXkG>@`6PRMOp#cAQq?p-&{D>7GU-n9oxPoo<W&6FnnzByU;+*g+v3vJ5J
z-Oj|mE#%R@E>}-^r#E)jWt~*D&Iuj6Z`cbELI@#*5JCtcgb+dqA%qY*jd!bMh~WSz
F005Y))ZYLA

literal 0
HcmV?d00001

diff --git a/meta-selftest/recipes-test/devtool/files/devtool-upgrade-0.2.tar.gz b/meta-selftest/recipes-test/devtool/files/devtool-upgrade-0.2.tar.gz
new file mode 100644
index 0000000000000000000000000000000000000000..9b0dcf4b6c1210f2b907ea62b62288d917effc4b
GIT binary patch
literal 411
zcmV;M0c8FkiwFQe0OVBw1MSs8Z-Ous0ASDjiq2is%-WWgLfm%txZ5tfG{BSu!4z~R
z%l`WwB#YDG=7!Ojz3)=mS1E<QCmlVQ^&~b?YzxYTuf-^eS7n~3!{uUXVSLD_=(NIs
zCuQA&-Ij4zbhuEOR~-%GTqz+tWZiDr!z_!^Sa_7S_u1Xtg>V^}m&rW7<5I%=SDuhm
zOW${y473ALvlZon20nwRVs$j!|J!r#3>~5&*+<7-qfTq3s#b8u>ptJqgF0Py@?XL<
zqK^F_O+NBJEld{WE53goRLF1cbD{a)^!>m5Bh2D7&0lhxMl}4x8b8;6UVVR0yDl6H
zm?vP+#rl5=BG}Y_rUKz<j|ME@Uf_%0mjA8jxi^Lm(v<%#)BTH2`QKRoxm4Tv&$X6N
z|4))c|GfTRCs~*-qnO+lWt8M}cJDYzR+70%vR-vz>@>U~;mlYv7(i#$cU~O=78b(K
zz3!wsE#$E}E>}-kw?B63u#L;5%?KMiZ&(WuLI@#*5JCtcgb+dqA%qY*jdwLBEfxSM
F003pq%-sM0

literal 0
HcmV?d00001

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index a6474b7..255f2c3 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -913,3 +913,39 @@ class DevtoolTests(DevtoolBase):
         # NOTE: native recipe parted-native should not be in IMAGE_INSTALL_append
         self.assertTrue('IMAGE_INSTALL_append = " mdadm"\n' in open(bbappend).readlines(),
                         'IMAGE_INSTALL_append = " mdadm" not found in %s' % bbappend)
+
+    def test_devtool_upgrade(self):
+        # Check preconditions
+        workspacedir = os.path.join(self.builddir, 'workspace')
+        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        # Check parameters
+        result = runCmd('devtool upgrade -h')
+        for param in 'recipename srctree --version -V --branch -b --keep-temp --no-patch'.split():
+            self.assertIn(param, result.output)
+        # For the moment, we are using a real recipe.
+        recipe='devtool-upgrade'
+        version='0.2'
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        # Check that recipe is not already under devtool control
+        result = runCmd('devtool status')
+        self.assertNotIn(recipe, result.output)
+        # Check upgrade. Code does not check if new PV is older or newer that current PV, so, it may be that
+        # we are downgrading instead of upgrading.
+        result = runCmd('devtool upgrade %s %s -V %s' % (recipe, tempdir, version))
+        # Check if srctree at least is populated
+        self.assertTrue(len(os.listdir(tempdir)) > 0, 'scrtree (%s) should be populated with new (%s) source code' % (tempdir, version))
+        # Check new recipe folder is present
+        self.assertTrue(os.path.exists(os.path.join(workspacedir,'recipes',recipe)), 'Recipe folder should exist')
+        # Check new recipe file is present
+        self.assertTrue(os.path.exists(os.path.join(workspacedir,'recipes',recipe,"%s_%s.bb" % (recipe,version))), 'Recipe folder should exist')
+        # Check devtool status and make sure recipe is present
+        result = runCmd('devtool status')
+        self.assertIn(recipe, result.output)
+        self.assertIn(tempdir, result.output)
+        # Check devtool reset recipe
+        result = runCmd('devtool reset %s -n' % recipe)
+        result = runCmd('devtool status')
+        self.assertNotIn(recipe, result.output)
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 6d65d57..60d81c3 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -178,6 +178,8 @@ def extract(args, config, basepath, workspace):
 
     srctree = os.path.abspath(args.srctree)
     initial_rev = _extract_source(srctree, args.keep_temp, args.branch, rd)
+    logger.info('Source tree extracted to %s' % srctree)
+
     if initial_rev:
         return 0
     else:
@@ -351,7 +353,6 @@ def _extract_source(srctree, keep_temp, devbranch, d):
                 bb.process.run('git checkout patches', cwd=srcsubdir)
 
         shutil.move(srcsubdir, srctree)
-        logger.info('Source tree extracted to %s' % srctree)
     finally:
         bb.logger.setLevel(origlevel)
 
@@ -451,6 +452,7 @@ def modify(args, config, basepath, workspace):
         initial_rev = _extract_source(args.srctree, False, args.branch, rd)
         if not initial_rev:
             return 1
+        logger.info('Source tree extracted to %s' % srctree)
         # Get list of commits since this revision
         (stdout, _) = bb.process.run('git rev-list --reverse %s..HEAD' % initial_rev, cwd=args.srctree)
         commits = stdout.split()
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
new file mode 100644
index 0000000..86443b0
--- /dev/null
+++ b/scripts/lib/devtool/upgrade.py
@@ -0,0 +1,354 @@
+# Development tool - upgrade command plugin
+#
+# Copyright (C) 2014-2015 Intel Corporation
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
+#
+"""Devtool upgrade plugin"""
+
+import os
+import sys
+import re
+import shutil
+import tempfile
+import logging
+import argparse
+import scriptutils
+import errno
+import bb
+import oe.recipeutils
+from devtool import standard
+from devtool import exec_build_env_command, setup_tinfoil, DevtoolError, parse_recipe
+
+logger = logging.getLogger('devtool')
+
+def plugin_init(pluginlist):
+    """Plugin initialization"""
+    pass
+
+def _run(cmd, cwd=''):
+    logger.debug("Running command %s> %s" % (cwd,cmd))
+    return bb.process.run('%s' % cmd, cwd=cwd)
+
+def _get_srctree(tmpdir):
+    srctree = tmpdir
+    dirs = os.listdir(tmpdir)
+    if len(dirs) == 1:
+        srctree = os.path.join(tmpdir, dirs[0])
+    return srctree
+
+def _copy_source_code(orig, dest):
+    for path in standard._ls_tree(orig):
+        dest_dir = os.path.join(dest, os.path.dirname(path))
+        bb.utils.mkdirhier(dest_dir)
+        dest_path = os.path.join(dest, path)
+        os.rename(os.path.join(orig, path), dest_path)
+
+def _get_checksums(rf):
+    import re
+    checksums = {}
+    with open(rf) as f:
+        for line in f:
+            for cs in ['md5sum', 'sha256sum']:
+                m = re.match("^SRC_URI\[%s\].*=.*\"(.*)\"" % cs, line)
+                if m:
+                    checksums[cs] = m.group(1)
+    return checksums
+
+def _replace_checksums(rf, md5, sha256):
+    if not md5 and not sha256:
+        return
+    checksums = {'md5sum':md5, 'sha256sum':sha256}
+    with open(rf + ".tmp", "w+") as tmprf:
+        with open(rf) as f:
+            for line in f:
+                m = None
+                for cs in checksums.keys():
+                    m = re.match("^SRC_URI\[%s\].*=.*\"(.*)\"" % cs, line)
+                    if m:
+                        if checksums[cs]:
+                            oldcheck = m.group(1)
+                            newcheck = checksums[cs]
+                            line = line.replace(oldcheck, newcheck)
+                        break
+                tmprf.write(line)
+    os.rename(rf + ".tmp", rf)
+
+
+def _remove_patch_dirs(recipefolder):
+    for root, dirs, files in os.walk(recipefolder):
+        for d in dirs:
+            shutil.rmtree(os.path.join(root,d))
+
+def _recipe_contains(rf, var):
+    import re
+    found = False
+    with open(rf) as f:
+        for line in f:
+            if re.match("^%s.*=.*" % var, line):
+                found = True
+                break
+    return found
+
+def _rename_recipe_dirs(oldpv, newpv, path):
+    for root, dirs, files in os.walk(path):
+        for olddir in dirs:
+            if olddir.find(oldpv) != -1:
+                newdir = olddir.replace(oldpv, newpv)
+                if olddir != newdir:
+                    _run('mv %s %s' % (olddir, newdir))
+
+def _rename_recipe_file(bpn, oldpv, newpv, path):
+    oldrecipe = "%s_%s.bb" % (bpn, oldpv)
+    newrecipe = "%s_%s.bb" % (bpn, newpv)
+    if os.path.isfile(os.path.join(path, oldrecipe)):
+        if oldrecipe != newrecipe:
+            _run('mv %s %s' % (oldrecipe, newrecipe), cwd=path)
+    else:
+        recipe = "%s_git.bb" % bpn
+        if os.path.isfile(os.path.join(path, recipe)):
+            newrecipe = recipe
+            raise DevtoolError("Original recipe not found on workspace")
+    return os.path.join(path, newrecipe)
+
+def _rename_recipe_files(bpn, oldpv, newpv, path):
+    _rename_recipe_dirs(oldpv, newpv, path)
+    return _rename_recipe_file(bpn, oldpv, newpv, path)
+
+def _use_external_build(same_dir, no_same_dir, d):
+    b_is_s = True
+    if no_same_dir:
+        logger.info('using separate build directory since --no-same-dir specified')
+        b_is_s = False
+    elif same_dir:
+        logger.info('using source tree as build directory since --same-dir specified')
+    elif bb.data.inherits_class('autotools-brokensep', d):
+        logger.info('using source tree as build directory since original recipe inherits autotools-brokensep')
+    elif d.getVar('B', True) == os.path.abspath(d.getVar('S', True)):
+        logger.info('using source tree as build directory since that is the default for this recipe')
+    else:
+        b_is_s = False
+    return b_is_s
+
+def _write_append(rc, srctree, same_dir, no_same_dir, rev, workspace, d):
+    """Writes an append file"""
+    if not os.path.exists(rc):
+        raise DevtoolError("bbappend not created because %s does not exist" % rc)
+
+    appendpath = os.path.join(workspace, 'appends')
+    if not os.path.exists(appendpath):
+        bb.utils.mkdirhier(appendpath)
+
+    brf = os.path.basename(os.path.splitext(rc)[0]) # rc basename
+
+    srctree = os.path.abspath(srctree)
+    pn = d.getVar('PN',True)
+    af = os.path.join(appendpath, '%s.bbappend' % brf)
+    with open(af, 'w') as f:
+        f.write('FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n\n')
+        f.write('inherit externalsrc\n')
+        f.write(('# NOTE: We use pn- overrides here to avoid affecting'
+                 'multiple variants in the case where the recipe uses BBCLASSEXTEND\n'))
+        f.write('EXTERNALSRC_pn-%s = "%s"\n' % (pn, srctree))
+        if _use_external_build(same_dir, no_same_dir, d):
+            f.write('EXTERNALSRC_BUILD_pn-%s = "%s"\n' % (pn, srctree))
+        if rev:
+            f.write('\n# initial_rev: %s\n' % rev)
+    return af
+
+def _cleanup_on_error(rf, srctree):
+    rfp = os.path.split(rf)[0] # recipe folder
+    rfpp = os.path.split(rfp)[0] # recipes folder
+    if os.path.exists(rfp):
+        shutil.rmtree(b)
+    if not len(os.listdir(rfpp)):
+        os.rmdir(rfpp)
+    srctree = os.path.abspath(srctree)
+    if os.path.exists(srctree):
+        shutil.rmtree(srctree)
+
+def _upgrade_error(e, rf, srctree):
+    if rf:
+        cleanup_on_error(rf, srctree)
+    logger.error(e)
+    raise DevtoolError(e)
+
+def _get_uri(rd):
+    srcuris = rd.getVar('SRC_URI', True).split()
+    if not len(srcuris):
+        raise DevtoolError('SRC_URI not found on recipe')
+    srcuri = srcuris[0] # it is assumed, URI is at first position
+    srcrev = '${AUTOREV}'
+    if '://' in srcuri:
+        # Fetch a URL
+        rev_re = re.compile(';rev=([^;]+)')
+        res = rev_re.search(srcuri)
+        if res:
+            srcrev = res.group(1)
+            srcuri = rev_re.sub('', srcuri)
+    return srcuri, srcrev
+
+def _extract_new_source(newpv, srctree, no_patch, srcrev, branch, keep_temp, tinfoil, rd):
+    """Extract sources of a recipe with a new version"""
+
+    def __run(cmd):
+        """Simple wrapper which calls _run with srctree as cwd"""
+        return _run(cmd, srctree)
+
+    crd = rd.createCopy()
+
+    pv = crd.getVar('PV', True)
+    crd.setVar('PV', newpv)
+
+    tmpsrctree = None
+    uri, rev = _get_uri(crd)
+    if srcrev:
+        rev = srcrev
+    if uri.startswith('git://'):
+        __run('git checkout %s' % rev)
+        __run('git tag -f devtool-base-new')
+        md5 = None
+        sha256 = None
+    else:
+        __run('git checkout -b devtool-%s' % newpv)
+
+        tmpdir = tempfile.mkdtemp(prefix='devtool')
+        try:
+            md5, sha256 = scriptutils.fetch_uri(tinfoil.config_data, uri, tmpdir, rev)
+        except bb.fetch2.FetchError as e:
+            raise DevtoolError(e)
+
+        tmpsrctree = _get_srctree(tmpdir)
+
+        scrtree = os.path.abspath(srctree)
+
+        _copy_source_code(tmpsrctree, srctree)
+
+        (stdout,_) = __run('git ls-files --modified --others --exclude-standard')
+        for f in stdout.splitlines():
+            __run('git add "%s"' % f)
+
+        __run('git commit -q -m "Commit of upstream changes at version %s" --allow-empty' % newpv)
+        __run('git tag -f devtool-base-%s' % newpv)
+
+    (stdout, _) = __run('git rev-parse HEAD')
+    rev = stdout.rstrip()
+
+    if no_patch:
+        patches = oe.recipeutils.get_recipe_patches(crd)
+        if len(patches):
+            logger.warn('By user choice, the following patches will NOT be applied')
+            for patch in patches:
+                logger.warn("%s" % os.path.basename(patch))
+    else:
+        try:
+            __run('git checkout devtool-patched -b %s' % branch)
+            __run('git rebase %s' % rev)
+            if uri.startswith('git://'):
+                suffix = 'new'
+            else:
+                suffix = newpv
+            __run('git tag -f devtool-patched-%s' % suffix)
+        except bb.process.ExecutionError as e:
+            logger.warn('Command \'%s\' failed:\n%s' % (e.command, e.stdout))
+
+    if tmpsrctree:
+        if keep_temp:
+            logger.info('Preserving temporary directory %s' % tmpsrctree)
+        else:
+            shutil.rmtree(tmpsrctree)
+
+    return (rev, md5, sha256)
+
+def _create_new_recipe(newpv, md5, sha256, workspace, rd):
+    """Creates the new recipe under workspace"""
+    crd = rd.createCopy()
+
+    bpn = crd.getVar('BPN', True)
+    path = os.path.join(workspace, 'recipes', bpn)
+    bb.utils.mkdirhier(path)
+    oe.recipeutils.copy_recipe_files(crd, path)
+
+    oldpv = crd.getVar('PV', True)
+    if not newpv:
+        newpv = oldpv
+    fullpath = _rename_recipe_files(bpn, oldpv, newpv, path)
+
+    if _recipe_contains(fullpath, 'PV') and newpv != oldpv:
+        oe.recipeutils.patch_recipe(d, fullpath, {'PV':newpv})
+
+    if md5 and sha256:
+        # Unfortunately, oe.recipeutils.patch_recipe cannot update flags.
+        # once the latter feature is implemented, we should call patch_recipe
+        # instead of the following function
+        _replace_checksums(fullpath, md5, sha256)
+
+    return fullpath
+
+def upgrade(args, config, basepath, workspace):
+    """Entry point for the devtool 'upgrade' subcommand"""
+
+    if args.recipename in workspace:
+        raise DevtoolError("recipe %s is already in your workspace" % args.recipename)
+    if not args.version and not args.srcrev:
+        raise DevtoolError("You must provide a version using the --version/-V option, or for recipes that fetch from an SCM such as git, the --srcrev/-S option")
+
+    reason = oe.recipeutils.validate_pn(args.recipename)
+    if reason:
+        raise DevtoolError(reason)
+
+    tinfoil = setup_tinfoil()
+
+    rd = parse_recipe(config, tinfoil, args.recipename, True)
+    if not rd:
+        return 1
+
+    standard._check_compatible_recipe(args.recipename, rd)
+    if rd.getVar('PV', True) == args.version and rd.getVar('SRCREV', True) == args.srcrev:
+        raise DevtoolError("Current and upgrade versions are the same version" % version)
+
+    rf = None
+    try:
+        rev1 = standard._extract_source(args.srctree, False, 'devtool-orig', rd)
+        rev2, md5, sha256 = _extract_new_source(args.version, args.srctree, args.no_patch,
+                                                args.srcrev, args.branch, args.keep_temp,
+                                                tinfoil, rd)
+        rf = _create_new_recipe(args.version, md5, sha256, config.workspace_path, rd)
+    except bb.process.CmdError as e:
+        _upgrade_error(e, rf, args.srctree)
+    except DevtoolError as e:
+        _upgrade_error(e, rf, args.srctree)
+    standard._add_md5(config, args.recipename, os.path.dirname(rf))
+
+    af = _write_append(rf, args.srctree, args.same_dir, args.no_same_dir, rev2,
+                       config.workspace_path, rd)
+    standard._add_md5(config, args.recipename, af)
+    logger.info('Upgraded source extracted to %s' % args.srctree)
+    return 0
+
+def register_commands(subparsers, context):
+    """Register devtool subcommands from this plugin"""
+    parser_upgrade = subparsers.add_parser('upgrade', help='Upgrade an existing recipe',
+                                           description='Upgrades an existing recipe to a new upstream version')
+    parser_upgrade.add_argument('recipename', help='Name for recipe to extract the source for')
+    parser_upgrade.add_argument('srctree', help='Path to where to extract the source tree')
+    parser_upgrade.add_argument('--version', '-V', help='Version to upgrade to (PV)')
+    parser_upgrade.add_argument('--srcrev', '-S', help='Source revision to upgrade to (if fetching from an SCM such as git)')
+    parser_upgrade.add_argument('--branch', '-b', default="devtool", help='Name for new development branch to checkout (default "%(default)s")')
+    parser_upgrade.add_argument('--no-patch', action="store_true", help='Do not apply patches from the recipe to the new source code')
+    group = parser_upgrade.add_mutually_exclusive_group()
+    group.add_argument('--same-dir', '-s', help='Build in same directory as source', action="store_true")
+    group.add_argument('--no-same-dir', help='Force build in a separate build directory', action="store_true")
+    parser_upgrade.add_argument('--keep-temp', action="store_true", help='Keep temporary directory (for debugging)')
+    parser_upgrade.set_defaults(func=upgrade)
-- 
2.1.0


