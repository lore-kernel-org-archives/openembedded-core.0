Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id F041176D6C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 16:16:36 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 31 Aug 2015 09:16:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,442,1437462000"; d="scan'208";a="552303479"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by FMSMGA003.fm.intel.com with ESMTP; 31 Aug 2015 09:16:35 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Aug 2015 08:09:59 +0000
Message-Id: <78f6e090b70fd955dd329a14cef185ad8d5e5460.1441007355.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1441007355.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1441007355.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1441007355.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1441007355.git.leonardo.sandoval.gonzalez@linux.intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH v3 1/3] devtool: upgrade feature
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
X-List-Received-Date: Mon, 31 Aug 2015 16:16:37 -0000

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
---
 scripts/lib/devtool/standard.py |   4 +-
 scripts/lib/devtool/upgrade.py  | 356 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 359 insertions(+), 1 deletion(-)
 create mode 100644 scripts/lib/devtool/upgrade.py

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index e1c5584..a6a852d 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -205,6 +205,8 @@ def extract(args, config, basepath, workspace):
 
     srctree = os.path.abspath(args.srctree)
     initial_rev = _extract_source(srctree, args.keep_temp, args.branch, rd)
+    logger.info('Source tree extracted to %s' % srctree)
+
     if initial_rev:
         return 0
     else:
@@ -361,7 +363,6 @@ def _extract_source(srctree, keep_temp, devbranch, d):
                 bb.process.run('git checkout patches', cwd=srcsubdir)
 
         shutil.move(srcsubdir, srctree)
-        logger.info('Source tree extracted to %s' % srctree)
     finally:
         bb.logger.setLevel(origlevel)
 
@@ -450,6 +451,7 @@ def modify(args, config, basepath, workspace):
         initial_rev = _extract_source(args.srctree, False, args.branch, rd)
         if not initial_rev:
             return 1
+        logger.info('Source tree extracted to %s' % srctree)
         # Get list of commits since this revision
         (stdout, _) = bb.process.run('git rev-list --reverse %s..HEAD' % initial_rev, cwd=args.srctree)
         commits = stdout.split()
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
new file mode 100644
index 0000000..2b9580f
--- /dev/null
+++ b/scripts/lib/devtool/upgrade.py
@@ -0,0 +1,356 @@
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
+from devtool import exec_build_env_command, setup_tinfoil, DevtoolError
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
+def _fetch_source(srcuri, srcrev, destdir, tinfoil):
+    md5 = sha256 = None
+    bb.utils.mkdirhier(destdir)
+    localdata = bb.data.createCopy(tinfoil.config_data)
+    bb.data.update_data(localdata)
+    localdata.setVar('BB_STRICT_CHECKSUM', '')
+    localdata.setVar('SRCREV', srcrev)
+    olddir = os.getcwd()
+    try:
+        fetcher = bb.fetch2.Fetch([srcuri], localdata)
+        for u in fetcher.ud:
+            ud = fetcher.ud[u]
+            ud.ignore_checksums = True
+        fetcher.download()
+        fetcher.unpack(destdir)
+        for u in fetcher.ud:
+            ud = fetcher.ud[u]
+            if ud.method.recommends_checksum(ud):
+                md5 = bb.utils.md5_file(ud.localpath)
+                sha256 = bb.utils.sha256_file(ud.localpath)
+    except bb.fetch2.BBFetchException, e:
+        raise bb.build.FuncFailed(e)
+    finally:
+        os.chdir(olddir)
+    return md5, sha256
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
+                _run('mv %s %s' % (olddir, newdir))
+
+def _rename_recipe_file(pn, oldpv, newpv, path):
+    oldrecipe = "%s_%s.bb" % (pn, oldpv)
+    newrecipe = "%s_%s.bb" % (pn, newpv)
+    if os.path.isfile(os.path.join(path, oldrecipe)):
+        _run('mv %s %s' % (oldrecipe, newrecipe), cwd=path)
+    else:
+        recipe = "%s_git.bb" % pn
+        if os.path.isfile(os.path.join(path, recipe)):
+            newrecipe = recipe
+            raise DevtoolError("Original recipe not found on workspace")
+    return os.path.join(path, newrecipe)
+
+def _rename_recipe_files(pn, oldpv, newpv, path):
+    _rename_recipe_dirs(oldpv, newpv, path)
+    return _rename_recipe_file(pn, oldpv, newpv, path)
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
+def _extract_new_source(newpv, srctree, no_patch, keep_temp, tinfoil, rd):
+    """Extract sources of a recipe with a new version"""
+
+    def __run(cmd):
+        """Simple wrapper which calls _run with srctree as cwd"""
+        return _run(cmd,srctree)
+
+    crd = rd.createCopy()
+
+    pv = crd.getVar('PV', True)
+    crd.setVar('PV', newpv)
+
+    tmpdir = tempfile.mkdtemp(prefix='devtool')
+    uri, rev = _get_uri(crd)
+    md5, sha256 = _fetch_source(uri, rev, tmpdir, tinfoil)
+
+    tmpsrctree = _get_srctree(tmpdir)
+
+    scrtree = os.path.abspath(srctree)
+    __run('git checkout -b devtool-base-%s devtool-base' % newpv)
+    __run('git tag -f devtool-base-%s' % newpv)
+
+    _copy_source_code(tmpsrctree, srctree)
+
+    (stdout,_) = __run('git ls-files --modified --others --exclude-standard')
+    for f in stdout.splitlines():
+        __run('git add "%s"' % f)
+
+    __run('git commit -q -m "Initial commit from upstream at version %s" --allow-empty' % newpv)
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
+            __run('git rebase devtool-patched')
+            __run('git tag -f devtool-patched-%s' % newpv)
+        except bb.process.ExecutionError as e:
+            logger.warn('Command \'%s\' failed:\n%s' % (e.command, e.stdout))
+
+    if keep_temp:
+        logger.info('Preserving temporary directory %s' % tmpsrctree)
+    else:
+        shutil.rmtree(tmpsrctree)
+
+    return (rev, md5, sha256)
+
+def _create_new_recipe(newpv, md5, sha256, workspace, rd):
+    """Creates the new recipe under workspace"""
+    crd = rd.createCopy()
+
+    pn = crd.getVar('PN', True)
+    path = os.path.join(workspace, 'recipes', pn)
+    bb.utils.mkdirhier(path)
+    oe.recipeutils.copy_recipe_files(crd, path)
+
+    oldpv = crd.getVar('PV', True)
+    fullpath = _rename_recipe_files(pn, oldpv, newpv, path)
+
+    if _recipe_contains(fullpath, 'PV'):
+        oe.recipeutils.patch_recipe(d, fullpath, {'PV':newpv})
+
+    # Unfortunately, oe.recipeutils.path_recipe cannot update flags.
+    # once the latter feature is implemented, we should call path_recipe
+    # instead of the following function
+    _replace_checksums(fullpath, md5, sha256)
+
+    return fullpath
+
+def _check_equal_version(version, rd):
+    if rd.getVar('PV', True) == version:
+        raise DevtoolError("Current and upgrade versions are the same %s" % version)
+
+def upgrade(args, config, basepath, workspace):
+    """Entry point for the devtool 'upgrade' subcommand"""
+
+    if args.recipename in workspace:
+        raise DevtoolError("recipe %s is already in your workspace" % args.recipename)
+    if not args.version:
+        raise DevtoolError("Provide a version through the parameter --version/-V")
+
+    reason = oe.recipeutils.validate_pn(args.recipename)
+    if reason:
+        raise DevtoolError(reason)
+
+    tinfoil = setup_tinfoil()
+
+    rd = standard._parse_recipe(config, tinfoil, args.recipename, True)
+    if not rd:
+        return 1
+
+    standard._check_compatible_recipe(args.recipename, rd)
+    _check_equal_version(args.version, rd)
+
+    rf = None
+    try:
+        rev1 = standard._extract_source(args.srctree, False, args.branch, rd)
+        rev2, md5, sha256 = _extract_new_source(args.version, args.srctree, args.no_patch,
+                                                args.keep_temp, tinfoil, rd)
+        rf = _create_new_recipe(args.version, md5, sha256, config.workspace_path, rd)
+    except bb.process.CmdError as e:
+        _upgrade_error(e, rf, args.srctree)
+    except DevtoolError as e:
+        _upgrade_error(e, rf, args.srctree)
+
+    af = _write_append(rf, args.srctree, args.same_dir, args.no_same_dir, rev2,
+                       config.workspace_path, rd)
+    standard._add_md5(config, args.recipename, af)
+    logger.info('Source tree extracted to %s' % args.srctree)
+    return 0
+
+def register_commands(subparsers, context):
+    """Register devtool subcommands from this plugin"""
+    parser_upgrade = subparsers.add_parser('upgrade', help='Upgrade an existing recipe',
+                                           description='Upgrades an existing recipe',
+                                           formatter_class=argparse.ArgumentDefaultsHelpFormatter)
+    parser_upgrade.add_argument('recipename', help='Name for recipe to extract the source for')
+    parser_upgrade.add_argument('srctree', help='Path to where to extract the source tree')
+    parser_upgrade.add_argument('--version', '-V', help='Version to upgrade (PV)')
+    parser_upgrade.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout')
+    parser_upgrade.add_argument('--keep-temp', action="store_true", help='Keep temporary directory (for debugging)')
+    parser_upgrade.add_argument('--no-patch', action="store_true", help='Do not patch the new source code')
+    group = parser_upgrade.add_mutually_exclusive_group()
+    group.add_argument('--same-dir', '-s', help='Build in same directory as source', action="store_true")
+    group.add_argument('--no-same-dir', help='Force build in a separate build directory', action="store_true")
+    parser_upgrade.set_defaults(func=upgrade)
-- 
1.8.4.5


