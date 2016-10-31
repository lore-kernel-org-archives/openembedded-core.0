Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D8F9571A07
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 04:00:32 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP; 30 Oct 2016 21:00:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,573,1473145200"; d="scan'208";a="25576867"
Received: from mbi370x-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.185.81])
	by fmsmga005.fm.intel.com with ESMTP; 30 Oct 2016 21:00:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Oct 2016 16:59:49 +1300
Message-Id: <23804108c42712b9c36a013decb61df057b86b80.1477886344.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1477886344.git.paul.eggleton@linux.intel.com>
References: <cover.1477886344.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1477886344.git.paul.eggleton@linux.intel.com>
References: <cover.1477886344.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 7/7] devtool: add "rename" subcommand
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
X-List-Received-Date: Mon, 31 Oct 2016 04:00:33 -0000

When you run devtool add on a source tree we attempt to figure out the
correct name and version for the recipe. However, despite our best
efforts, sometimes the name and/or version we come up with isn't
correct, and the only way to remedy that up until now was to reset the
recipe, delete the source tree and start again, specifying the name this
time. To avoid this slightly painful procedure, add a "rename"
subcommand that lets you rename the recipe and/or change the version.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py |  60 +++++++++++
 scripts/lib/devtool/build.py      |   2 +-
 scripts/lib/devtool/standard.py   | 202 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 263 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 71d205c..46f5a0b 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -1349,3 +1349,63 @@ class DevtoolTests(DevtoolBase):
         files.remove(foundpatch)
         if files:
             self.fail('Unexpected file(s) copied next to bbappend: %s' % ', '.join(files))
+
+    def test_devtool_rename(self):
+        # Check preconditions
+        self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+
+        # First run devtool add
+        # We already have this recipe in OE-Core, but that doesn't matter
+        recipename = 'i2c-tools'
+        recipever = '3.1.2'
+        recipefile = os.path.join(self.workspacedir, 'recipes', recipename, '%s_%s.bb' % (recipename, recipever))
+        url = 'http://downloads.yoctoproject.org/mirror/sources/i2c-tools-%s.tar.bz2' % recipever
+        def add_recipe():
+            result = runCmd('devtool add %s' % url)
+            self.assertTrue(os.path.exists(recipefile), 'Expected recipe file not created')
+            self.assertTrue(os.path.exists(os.path.join(self.workspacedir, 'sources', recipename)), 'Source directory not created')
+            checkvars = {}
+            checkvars['S'] = None
+            checkvars['SRC_URI'] = url.replace(recipever, '${PV}')
+            self._test_recipe_contents(recipefile, checkvars, [])
+        add_recipe()
+        # Now rename it - change both name and version
+        newrecipename = 'mynewrecipe'
+        newrecipever = '456'
+        newrecipefile = os.path.join(self.workspacedir, 'recipes', newrecipename, '%s_%s.bb' % (newrecipename, newrecipever))
+        result = runCmd('devtool rename %s %s -V %s' % (recipename, newrecipename, newrecipever))
+        self.assertTrue(os.path.exists(newrecipefile), 'Recipe file not renamed')
+        self.assertFalse(os.path.exists(os.path.join(self.workspacedir, 'recipes', recipename)), 'Old recipe directory still exists')
+        newsrctree = os.path.join(self.workspacedir, 'sources', newrecipename)
+        self.assertTrue(os.path.exists(newsrctree), 'Source directory not renamed')
+        checkvars = {}
+        checkvars['S'] = '${WORKDIR}/%s-%s' % (recipename, recipever)
+        checkvars['SRC_URI'] = url
+        self._test_recipe_contents(newrecipefile, checkvars, [])
+        # Try again - change just name this time
+        result = runCmd('devtool reset -n %s' % newrecipename)
+        shutil.rmtree(newsrctree)
+        add_recipe()
+        newrecipefile = os.path.join(self.workspacedir, 'recipes', newrecipename, '%s_%s.bb' % (newrecipename, recipever))
+        result = runCmd('devtool rename %s %s' % (recipename, newrecipename))
+        self.assertTrue(os.path.exists(newrecipefile), 'Recipe file not renamed')
+        self.assertFalse(os.path.exists(os.path.join(self.workspacedir, 'recipes', recipename)), 'Old recipe directory still exists')
+        self.assertTrue(os.path.exists(os.path.join(self.workspacedir, 'sources', newrecipename)), 'Source directory not renamed')
+        checkvars = {}
+        checkvars['S'] = '${WORKDIR}/%s-${PV}' % recipename
+        checkvars['SRC_URI'] = url.replace(recipever, '${PV}')
+        self._test_recipe_contents(newrecipefile, checkvars, [])
+        # Try again - change just version this time
+        result = runCmd('devtool reset -n %s' % newrecipename)
+        shutil.rmtree(newsrctree)
+        add_recipe()
+        newrecipefile = os.path.join(self.workspacedir, 'recipes', recipename, '%s_%s.bb' % (recipename, newrecipever))
+        result = runCmd('devtool rename %s -V %s' % (recipename, newrecipever))
+        self.assertTrue(os.path.exists(newrecipefile), 'Recipe file not renamed')
+        self.assertTrue(os.path.exists(os.path.join(self.workspacedir, 'sources', recipename)), 'Source directory no longer exists')
+        checkvars = {}
+        checkvars['S'] = '${WORKDIR}/${BPN}-%s' % recipever
+        checkvars['SRC_URI'] = url
+        self._test_recipe_contents(newrecipefile, checkvars, [])
diff --git a/scripts/lib/devtool/build.py b/scripts/lib/devtool/build.py
index 6be549d..252379e 100644
--- a/scripts/lib/devtool/build.py
+++ b/scripts/lib/devtool/build.py
@@ -80,7 +80,7 @@ def register_commands(subparsers, context):
     """Register devtool subcommands from this plugin"""
     parser_build = subparsers.add_parser('build', help='Build a recipe',
                                          description='Builds the specified recipe using bitbake (up to and including %s)' % ', '.join(_get_build_tasks(context.config)),
-                                         group='working')
+                                         group='working', order=50)
     parser_build.add_argument('recipename', help='Recipe to build')
     parser_build.add_argument('-s', '--disable-parallel-make', action="store_true", help='Disable make parallelism')
     parser_build.set_defaults(func=build)
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index c15bfef..4523048 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -852,6 +852,199 @@ def modify(args, config, basepath, workspace):
 
     return 0
 
+
+def rename(args, config, basepath, workspace):
+    """Entry point for the devtool 'rename' subcommand"""
+    import bb
+    import oe.recipeutils
+
+    check_workspace_recipe(workspace, args.recipename)
+
+    if not (args.newname or args.version):
+        raise DevtoolError('You must specify a new name, a version with -V/--version, or both')
+
+    recipefile = workspace[args.recipename]['recipefile']
+    if not recipefile:
+        raise DevtoolError('devtool rename can only be used where the recipe file itself is in the workspace (e.g. after devtool add)')
+
+    if args.newname and args.newname != args.recipename:
+        reason = oe.recipeutils.validate_pn(args.newname)
+        if reason:
+            raise DevtoolError(reason)
+        newname = args.newname
+    else:
+        newname = args.recipename
+
+    append = workspace[args.recipename]['bbappend']
+    appendfn = os.path.splitext(os.path.basename(append))[0]
+    splitfn = appendfn.split('_')
+    if len(splitfn) > 1:
+        origfnver = appendfn.split('_')[1]
+    else:
+        origfnver = ''
+
+    recipefilemd5 = None
+    tinfoil = setup_tinfoil(basepath=basepath, tracking=True)
+    try:
+        rd = parse_recipe(config, tinfoil, args.recipename, True)
+        if not rd:
+            return 1
+
+        bp = rd.getVar('BP', True)
+        bpn = rd.getVar('BPN', True)
+        if newname != args.recipename:
+            localdata = rd.createCopy()
+            localdata.setVar('PN', newname)
+            newbpn = localdata.getVar('BPN', True)
+        else:
+            newbpn = bpn
+        s = rd.getVar('S', False)
+        src_uri = rd.getVar('SRC_URI', False)
+        pv = rd.getVar('PV', True)
+
+        # Correct variable values that refer to the upstream source - these
+        # values must stay the same, so if the name/version are changing then
+        # we need to fix them up
+        new_s = s
+        new_src_uri = src_uri
+        if newbpn != bpn:
+            # ${PN} here is technically almost always incorrect, but people do use it
+            new_s = new_s.replace('${BPN}', bpn)
+            new_s = new_s.replace('${PN}', bpn)
+            new_s = new_s.replace('${BP}', '%s-${PV}' % bpn)
+            new_src_uri = new_src_uri.replace('${BPN}', bpn)
+            new_src_uri = new_src_uri.replace('${PN}', bpn)
+            new_src_uri = new_src_uri.replace('${BP}', '%s-${PV}' % bpn)
+        if args.version and origfnver == pv:
+            new_s = new_s.replace('${PV}', pv)
+            new_s = new_s.replace('${BP}', '${BPN}-%s' % pv)
+            new_src_uri = new_src_uri.replace('${PV}', pv)
+            new_src_uri = new_src_uri.replace('${BP}', '${BPN}-%s' % pv)
+        patchfields = {}
+        if new_s != s:
+            patchfields['S'] = new_s
+        if new_src_uri != src_uri:
+            patchfields['SRC_URI'] = new_src_uri
+        if patchfields:
+            recipefilemd5 = bb.utils.md5_file(recipefile)
+            oe.recipeutils.patch_recipe(rd, recipefile, patchfields)
+            newrecipefilemd5 = bb.utils.md5_file(recipefile)
+    finally:
+        tinfoil.shutdown()
+
+    if args.version:
+        newver = args.version
+    else:
+        newver = origfnver
+
+    if newver:
+        newappend = '%s_%s.bbappend' % (newname, newver)
+        newfile =  '%s_%s.bb' % (newname, newver)
+    else:
+        newappend = '%s.bbappend' % newname
+        newfile = '%s.bb' % newname
+
+    oldrecipedir = os.path.dirname(recipefile)
+    newrecipedir = os.path.join(config.workspace_path, 'recipes', newname)
+    if oldrecipedir != newrecipedir:
+        bb.utils.mkdirhier(newrecipedir)
+
+    newappend = os.path.join(os.path.dirname(append), newappend)
+    newfile = os.path.join(newrecipedir, newfile)
+
+    # Rename bbappend
+    logger.info('Renaming %s to %s' % (append, newappend))
+    os.rename(append, newappend)
+    # Rename recipe file
+    logger.info('Renaming %s to %s' % (recipefile, newfile))
+    os.rename(recipefile, newfile)
+
+    # Rename source tree if it's the default path
+    appendmd5 = None
+    if not args.no_srctree:
+        srctree = workspace[args.recipename]['srctree']
+        if os.path.abspath(srctree) == os.path.join(config.workspace_path, 'sources', args.recipename):
+            newsrctree = os.path.join(config.workspace_path, 'sources', newname)
+            logger.info('Renaming %s to %s' % (srctree, newsrctree))
+            shutil.move(srctree, newsrctree)
+            # Correct any references (basically EXTERNALSRC*) in the .bbappend
+            appendmd5 = bb.utils.md5_file(newappend)
+            appendlines = []
+            with open(newappend, 'r') as f:
+                for line in f:
+                    appendlines.append(line)
+            with open(newappend, 'w') as f:
+                for line in appendlines:
+                    if srctree in line:
+                        line = line.replace(srctree, newsrctree)
+                    f.write(line)
+            newappendmd5 = bb.utils.md5_file(newappend)
+
+    bpndir = None
+    newbpndir = None
+    if newbpn != bpn:
+        bpndir = os.path.join(oldrecipedir, bpn)
+        if os.path.exists(bpndir):
+            newbpndir = os.path.join(newrecipedir, newbpn)
+            logger.info('Renaming %s to %s' % (bpndir, newbpndir))
+            shutil.move(bpndir, newbpndir)
+
+    bpdir = None
+    newbpdir = None
+    if newver != origfnver or newbpn != bpn:
+        bpdir = os.path.join(oldrecipedir, bp)
+        if os.path.exists(bpdir):
+            newbpdir = os.path.join(newrecipedir, '%s-%s' % (newbpn, newver))
+            logger.info('Renaming %s to %s' % (bpdir, newbpdir))
+            shutil.move(bpdir, newbpdir)
+
+    if oldrecipedir != newrecipedir:
+        # Move any stray files and delete the old recipe directory
+        for entry in os.listdir(oldrecipedir):
+            oldpath = os.path.join(oldrecipedir, entry)
+            newpath = os.path.join(newrecipedir, entry)
+            logger.info('Renaming %s to %s' % (oldpath, newpath))
+            shutil.move(oldpath, newpath)
+        os.rmdir(oldrecipedir)
+
+    # Now take care of entries in .devtool_md5
+    md5entries = []
+    with open(os.path.join(config.workspace_path, '.devtool_md5'), 'r') as f:
+        for line in f:
+            md5entries.append(line)
+
+    if bpndir and newbpndir:
+        relbpndir = os.path.relpath(bpndir, config.workspace_path) + '/'
+    else:
+        relbpndir = None
+    if bpdir and newbpdir:
+        relbpdir = os.path.relpath(bpdir, config.workspace_path) + '/'
+    else:
+        relbpdir = None
+
+    with open(os.path.join(config.workspace_path, '.devtool_md5'), 'w') as f:
+        for entry in md5entries:
+            splitentry = entry.rstrip().split('|')
+            if len(splitentry) > 2:
+                if splitentry[0] == args.recipename:
+                    splitentry[0] = newname
+                    if splitentry[1] == os.path.relpath(append, config.workspace_path):
+                        splitentry[1] = os.path.relpath(newappend, config.workspace_path)
+                        if appendmd5 and splitentry[2] == appendmd5:
+                            splitentry[2] = newappendmd5
+                    elif splitentry[1] == os.path.relpath(recipefile, config.workspace_path):
+                        splitentry[1] = os.path.relpath(newfile, config.workspace_path)
+                        if recipefilemd5 and splitentry[2] == recipefilemd5:
+                            splitentry[2] = newrecipefilemd5
+                    elif relbpndir and splitentry[1].startswith(relbpndir):
+                        splitentry[1] = os.path.relpath(os.path.join(newbpndir, splitentry[1][len(relbpndir):]), config.workspace_path)
+                    elif relbpdir and splitentry[1].startswith(relbpdir):
+                        splitentry[1] = os.path.relpath(os.path.join(newbpdir, splitentry[1][len(relbpdir):]), config.workspace_path)
+                    entry = '|'.join(splitentry) + '\n'
+            f.write(entry)
+    return 0
+
+
 def _get_patchset_revs(srctree, recipe_path, initial_rev=None):
     """Get initial and update rev of a recipe. These are the start point of the
     whole patchset and start point for the patches to be re-generated/updated.
@@ -1630,6 +1823,15 @@ def register_commands(subparsers, context):
     parser_sync.add_argument('--keep-temp', action="store_true", help='Keep temporary directory (for debugging)')
     parser_sync.set_defaults(func=sync)
 
+    parser_rename = subparsers.add_parser('rename', help='Rename a recipe file in the workspace',
+                                       description='Renames the recipe file for a recipe in the workspace, changing the name or version part or both, ensuring that all references within the workspace are updated at the same time. Only works when the recipe file itself is in the workspace, e.g. after devtool add. Particularly useful when devtool add did not automatically determine the correct name.',
+                                       group='working', order=10)
+    parser_rename.add_argument('recipename', help='Current name of recipe to rename')
+    parser_rename.add_argument('newname', nargs='?', help='New name for recipe (optional, not needed if you only want to change the version)')
+    parser_rename.add_argument('--version', '-V', help='Change the version (NOTE: this does not change the version fetched by the recipe, just the version in the recipe file name)')
+    parser_rename.add_argument('--no-srctree', '-s', action='store_true', help='Do not rename the source tree directory (if the default source tree path has been used) - keeping the old name may be desirable if there are internal/other external references to this path')
+    parser_rename.set_defaults(func=rename)
+
     parser_update_recipe = subparsers.add_parser('update-recipe', help='Apply changes from external source tree to recipe',
                                        description='Applies changes from external source tree to a recipe (updating/adding/removing patches as necessary, or by updating SRCREV). Note that these changes need to have been committed to the git repository in order to be recognised.',
                                        group='working', order=-90)
-- 
2.5.5


