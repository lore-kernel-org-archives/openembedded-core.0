Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9E7D8731C2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 01:48:46 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP; 30 Aug 2016 18:48:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,259,1470726000"; 
   d="scan'208";a="2895725"
Received: from ashuvini-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.145.135])
	by fmsmga005.fm.intel.com with ESMTP; 30 Aug 2016 18:48:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Aug 2016 13:48:05 +1200
Message-Id: <88fde4c5d43e2b6ebced1462705241222fb9734a.1472607521.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1472607521.git.paul.eggleton@linux.intel.com>
References: <cover.1472607521.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1472607521.git.paul.eggleton@linux.intel.com>
References: <cover.1472607521.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] scripts: ensure tinfoil is shut down correctly
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
X-List-Received-Date: Wed, 31 Aug 2016 01:48:46 -0000

We should always shut down tinfoil when we're finished with it, either
by explicitly calling the shutdown() method or by using it as a
context manager ("with ...").

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/contrib/list-packageconfig-flags.py |  28 +--
 scripts/contrib/verify-homepage.py          |  12 +-
 scripts/devtool                             |  10 +-
 scripts/lib/devtool/build_image.py          | 124 +++++-----
 scripts/lib/devtool/deploy.py               | 141 ++++++------
 scripts/lib/devtool/runqemu.py              |   8 +-
 scripts/lib/devtool/standard.py             | 341 ++++++++++++++--------------
 scripts/lib/devtool/upgrade.py              |  85 +++----
 scripts/oe-pkgdata-util                     |   5 +-
 scripts/recipetool                          |  63 ++---
 10 files changed, 423 insertions(+), 394 deletions(-)

diff --git a/scripts/contrib/list-packageconfig-flags.py b/scripts/contrib/list-packageconfig-flags.py
index b8327e4..1af7de3 100755
--- a/scripts/contrib/list-packageconfig-flags.py
+++ b/scripts/contrib/list-packageconfig-flags.py
@@ -160,20 +160,20 @@ def main():
 
     options, args = parser.parse_args(sys.argv)
 
-    bbhandler = bb.tinfoil.Tinfoil()
-    bbhandler.prepare()
-    print("Gathering recipe data...")
-    data_dict = get_recipesdata(bbhandler, options.preferred)
-
-    if options.listtype == 'flags':
-        pkg_dict = collect_pkgs(data_dict)
-        flag_dict = collect_flags(pkg_dict)
-        display_flags(flag_dict)
-    elif options.listtype == 'recipes':
-        pkg_dict = collect_pkgs(data_dict)
-        display_pkgs(pkg_dict)
-    elif options.listtype == 'all':
-        display_all(data_dict)
+    with bb.tinfoil.Tinfoil() as bbhandler:
+        bbhandler.prepare()
+        print("Gathering recipe data...")
+        data_dict = get_recipesdata(bbhandler, options.preferred)
+
+        if options.listtype == 'flags':
+            pkg_dict = collect_pkgs(data_dict)
+            flag_dict = collect_flags(pkg_dict)
+            display_flags(flag_dict)
+        elif options.listtype == 'recipes':
+            pkg_dict = collect_pkgs(data_dict)
+            display_pkgs(pkg_dict)
+        elif options.listtype == 'all':
+            display_all(data_dict)
 
 if __name__ == "__main__":
     main()
diff --git a/scripts/contrib/verify-homepage.py b/scripts/contrib/verify-homepage.py
index 61a047c4..04917e8 100755
--- a/scripts/contrib/verify-homepage.py
+++ b/scripts/contrib/verify-homepage.py
@@ -54,9 +54,9 @@ def verifyHomepage(bbhandler):
     return count
 
 if __name__=='__main__':
-    bbhandler = bb.tinfoil.Tinfoil()
-    bbhandler.prepare()
-    logger.info("Start verifying HOMEPAGE:")
-    failcount = verifyHomepage(bbhandler)
-    logger.info("Finished verifying HOMEPAGE.")
-    logger.info("Summary: %s failed" % failcount)
+    with bb.tinfoil.Tinfoil() as bbhandler:
+        bbhandler.prepare()
+        logger.info("Start verifying HOMEPAGE:")
+        failcount = verifyHomepage(bbhandler)
+        logger.info("Finished verifying HOMEPAGE.")
+        logger.info("Summary: %s failed" % failcount)
diff --git a/scripts/devtool b/scripts/devtool
index b1274d6..91e3954 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -289,17 +289,15 @@ def main():
 
     if global_args.bbpath is None:
         tinfoil = setup_tinfoil(config_only=True, basepath=basepath)
-        global_args.bbpath = tinfoil.config_data.getVar('BBPATH', True)
-    else:
-        tinfoil = None
+        try:
+            global_args.bbpath = tinfoil.config_data.getVar('BBPATH', True)
+        finally:
+            tinfoil.shutdown()
 
     for path in [scripts_path] + global_args.bbpath.split(':'):
         pluginpath = os.path.join(path, 'lib', 'devtool')
         scriptutils.load_plugins(logger, plugins, pluginpath)
 
-    if tinfoil:
-        tinfoil.shutdown()
-
     subparsers = parser.add_subparsers(dest="subparser_name", title='subcommands', metavar='<subcommand>')
     subparsers.required = True
 
diff --git a/scripts/lib/devtool/build_image.py b/scripts/lib/devtool/build_image.py
index 14c646a..ae75511 100644
--- a/scripts/lib/devtool/build_image.py
+++ b/scripts/lib/devtool/build_image.py
@@ -86,70 +86,76 @@ def build_image_task(config, basepath, workspace, image, add_packages=None, task
                 raise
 
     tinfoil = setup_tinfoil(basepath=basepath)
-    rd = parse_recipe(config, tinfoil, image, True)
-    if not rd:
-        # Error already shown
-        return (1, None)
-    if not bb.data.inherits_class('image', rd):
-        raise TargetNotImageError()
-
-    # Get the actual filename used and strip the .bb and full path
-    target_basename = rd.getVar('FILE', True)
-    target_basename = os.path.splitext(os.path.basename(target_basename))[0]
-    config.set('SDK', 'target_basename', target_basename)
-    config.write()
-
-    appendfile = os.path.join(config.workspace_path, 'appends',
-                              '%s.bbappend' % target_basename)
-
-    outputdir = None
     try:
-        if workspace or add_packages:
-            if add_packages:
-                packages = add_packages
-            else:
-                packages = _get_packages(tinfoil, workspace, config)
-        else:
-            packages = None
-        if not task:
-            if not packages and not add_packages and workspace:
-                logger.warning('No recipes in workspace, building image %s unmodified', image)
-            elif not packages:
-                logger.warning('No packages to add, building image %s unmodified', image)
-
-        if packages or extra_append:
-            bb.utils.mkdirhier(os.path.dirname(appendfile))
-            with open(appendfile, 'w') as afile:
-                if packages:
-                    # include packages from workspace recipes into the image
-                    afile.write('IMAGE_INSTALL_append = " %s"\n' % ' '.join(packages))
-                    if not task:
-                        logger.info('Building image %s with the following '
-                                    'additional packages: %s', image, ' '.join(packages))
-                if extra_append:
-                    for line in extra_append:
-                        afile.write('%s\n' % line)
-
-        if task in ['populate_sdk', 'populate_sdk_ext']:
-            outputdir = rd.getVar('SDK_DEPLOY', True)
-        else:
-            outputdir = rd.getVar('DEPLOY_DIR_IMAGE', True)
-
-        tinfoil.shutdown()
+        rd = parse_recipe(config, tinfoil, image, True)
+        if not rd:
+            # Error already shown
+            return (1, None)
+        if not bb.data.inherits_class('image', rd):
+            raise TargetNotImageError()
+
+        # Get the actual filename used and strip the .bb and full path
+        target_basename = rd.getVar('FILE', True)
+        target_basename = os.path.splitext(os.path.basename(target_basename))[0]
+        config.set('SDK', 'target_basename', target_basename)
+        config.write()
 
-        options = ''
-        if task:
-            options += '-c %s' % task
+        appendfile = os.path.join(config.workspace_path, 'appends',
+                                '%s.bbappend' % target_basename)
 
-        # run bitbake to build image (or specified task)
+        outputdir = None
         try:
-            exec_build_env_command(config.init_path, basepath,
-                                   'bitbake %s %s' % (options, image), watch=True)
-        except ExecutionError as err:
-            return (err.exitcode, None)
+            if workspace or add_packages:
+                if add_packages:
+                    packages = add_packages
+                else:
+                    packages = _get_packages(tinfoil, workspace, config)
+            else:
+                packages = None
+            if not task:
+                if not packages and not add_packages and workspace:
+                    logger.warning('No recipes in workspace, building image %s unmodified', image)
+                elif not packages:
+                    logger.warning('No packages to add, building image %s unmodified', image)
+
+            if packages or extra_append:
+                bb.utils.mkdirhier(os.path.dirname(appendfile))
+                with open(appendfile, 'w') as afile:
+                    if packages:
+                        # include packages from workspace recipes into the image
+                        afile.write('IMAGE_INSTALL_append = " %s"\n' % ' '.join(packages))
+                        if not task:
+                            logger.info('Building image %s with the following '
+                                        'additional packages: %s', image, ' '.join(packages))
+                    if extra_append:
+                        for line in extra_append:
+                            afile.write('%s\n' % line)
+
+            if task in ['populate_sdk', 'populate_sdk_ext']:
+                outputdir = rd.getVar('SDK_DEPLOY', True)
+            else:
+                outputdir = rd.getVar('DEPLOY_DIR_IMAGE', True)
+
+            tmp_tinfoil = tinfoil
+            tinfoil = None
+            tmp_tinfoil.shutdown()
+
+            options = ''
+            if task:
+                options += '-c %s' % task
+
+            # run bitbake to build image (or specified task)
+            try:
+                exec_build_env_command(config.init_path, basepath,
+                                    'bitbake %s %s' % (options, image), watch=True)
+            except ExecutionError as err:
+                return (err.exitcode, None)
+        finally:
+            if os.path.isfile(appendfile):
+                os.unlink(appendfile)
     finally:
-        if os.path.isfile(appendfile):
-            os.unlink(appendfile)
+        if tinfoil:
+            tinfoil.shutdown()
     return (0, outputdir)
 
 
diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 66644cc..fb84f2d 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -155,83 +155,86 @@ def deploy(args, config, basepath, workspace):
 
     tinfoil = setup_tinfoil(basepath=basepath)
     try:
-        rd = oe.recipeutils.parse_recipe_simple(tinfoil.cooker, args.recipename, tinfoil.config_data)
-    except Exception as e:
-        raise DevtoolError('Exception parsing recipe %s: %s' %
-                           (args.recipename, e))
-    recipe_outdir = rd.getVar('D', True)
-    if not os.path.exists(recipe_outdir) or not os.listdir(recipe_outdir):
-        raise DevtoolError('No files to deploy - have you built the %s '
-                           'recipe? If so, the install step has not installed '
-                           'any files.' % args.recipename)
+        try:
+            rd = oe.recipeutils.parse_recipe_simple(tinfoil.cooker, args.recipename, tinfoil.config_data)
+        except Exception as e:
+            raise DevtoolError('Exception parsing recipe %s: %s' %
+                            (args.recipename, e))
+        recipe_outdir = rd.getVar('D', True)
+        if not os.path.exists(recipe_outdir) or not os.listdir(recipe_outdir):
+            raise DevtoolError('No files to deploy - have you built the %s '
+                            'recipe? If so, the install step has not installed '
+                            'any files.' % args.recipename)
 
-    filelist = []
-    ftotalsize = 0
-    for root, _, files in os.walk(recipe_outdir):
-        for fn in files:
-            # Get the size in kiB (since we'll be comparing it to the output of du -k)
-            # MUST use lstat() here not stat() or getfilesize() since we don't want to
-            # dereference symlinks
-            fsize = int(math.ceil(float(os.lstat(os.path.join(root, fn)).st_size)/1024))
-            ftotalsize += fsize
-            # The path as it would appear on the target
-            fpath = os.path.join(destdir, os.path.relpath(root, recipe_outdir), fn)
-            filelist.append((fpath, fsize))
+        filelist = []
+        ftotalsize = 0
+        for root, _, files in os.walk(recipe_outdir):
+            for fn in files:
+                # Get the size in kiB (since we'll be comparing it to the output of du -k)
+                # MUST use lstat() here not stat() or getfilesize() since we don't want to
+                # dereference symlinks
+                fsize = int(math.ceil(float(os.lstat(os.path.join(root, fn)).st_size)/1024))
+                ftotalsize += fsize
+                # The path as it would appear on the target
+                fpath = os.path.join(destdir, os.path.relpath(root, recipe_outdir), fn)
+                filelist.append((fpath, fsize))
 
-    if args.dry_run:
-        print('Files to be deployed for %s on target %s:' % (args.recipename, args.target))
-        for item, _ in filelist:
-            print('  %s' % item)
-        return 0
+        if args.dry_run:
+            print('Files to be deployed for %s on target %s:' % (args.recipename, args.target))
+            for item, _ in filelist:
+                print('  %s' % item)
+            return 0
 
 
-    extraoptions = ''
-    if args.no_host_check:
-        extraoptions += '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
-    if not args.show_status:
-        extraoptions += ' -q'
+        extraoptions = ''
+        if args.no_host_check:
+            extraoptions += '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
+        if not args.show_status:
+            extraoptions += ' -q'
 
-    # In order to delete previously deployed files and have the manifest file on
-    # the target, we write out a shell script and then copy it to the target
-    # so we can then run it (piping tar output to it).
-    # (We cannot use scp here, because it doesn't preserve symlinks.)
-    tmpdir = tempfile.mkdtemp(prefix='devtool')
-    try:
-        tmpscript = '/tmp/devtool_deploy.sh'
-        tmpfilelist = os.path.join(os.path.dirname(tmpscript), 'devtool_deploy.list')
-        shellscript = _prepare_remote_script(deploy=True,
-                                             verbose=args.show_status,
-                                             nopreserve=args.no_preserve,
-                                             nocheckspace=args.no_check_space)
-        # Write out the script to a file
-        with open(os.path.join(tmpdir, os.path.basename(tmpscript)), 'w') as f:
-            f.write(shellscript)
-        # Write out the file list
-        with open(os.path.join(tmpdir, os.path.basename(tmpfilelist)), 'w') as f:
-            f.write('%d\n' % ftotalsize)
-            for fpath, fsize in filelist:
-                f.write('%s %d\n' % (fpath, fsize))
-        # Copy them to the target
-        ret = subprocess.call("scp %s %s/* %s:%s" % (extraoptions, tmpdir, args.target, os.path.dirname(tmpscript)), shell=True)
-        if ret != 0:
-            raise DevtoolError('Failed to copy script to %s - rerun with -s to '
-                            'get a complete error message' % args.target)
-    finally:
-        shutil.rmtree(tmpdir)
+        # In order to delete previously deployed files and have the manifest file on
+        # the target, we write out a shell script and then copy it to the target
+        # so we can then run it (piping tar output to it).
+        # (We cannot use scp here, because it doesn't preserve symlinks.)
+        tmpdir = tempfile.mkdtemp(prefix='devtool')
+        try:
+            tmpscript = '/tmp/devtool_deploy.sh'
+            tmpfilelist = os.path.join(os.path.dirname(tmpscript), 'devtool_deploy.list')
+            shellscript = _prepare_remote_script(deploy=True,
+                                                verbose=args.show_status,
+                                                nopreserve=args.no_preserve,
+                                                nocheckspace=args.no_check_space)
+            # Write out the script to a file
+            with open(os.path.join(tmpdir, os.path.basename(tmpscript)), 'w') as f:
+                f.write(shellscript)
+            # Write out the file list
+            with open(os.path.join(tmpdir, os.path.basename(tmpfilelist)), 'w') as f:
+                f.write('%d\n' % ftotalsize)
+                for fpath, fsize in filelist:
+                    f.write('%s %d\n' % (fpath, fsize))
+            # Copy them to the target
+            ret = subprocess.call("scp %s %s/* %s:%s" % (extraoptions, tmpdir, args.target, os.path.dirname(tmpscript)), shell=True)
+            if ret != 0:
+                raise DevtoolError('Failed to copy script to %s - rerun with -s to '
+                                'get a complete error message' % args.target)
+        finally:
+            shutil.rmtree(tmpdir)
 
-    # Now run the script
-    ret = exec_fakeroot(rd, 'tar cf - . | ssh %s %s \'sh %s %s %s %s\'' % (extraoptions, args.target, tmpscript, args.recipename, destdir, tmpfilelist), cwd=recipe_outdir, shell=True)
-    if ret != 0:
-        raise DevtoolError('Deploy failed - rerun with -s to get a complete '
-                           'error message')
+        # Now run the script
+        ret = exec_fakeroot(rd, 'tar cf - . | ssh %s %s \'sh %s %s %s %s\'' % (extraoptions, args.target, tmpscript, args.recipename, destdir, tmpfilelist), cwd=recipe_outdir, shell=True)
+        if ret != 0:
+            raise DevtoolError('Deploy failed - rerun with -s to get a complete '
+                            'error message')
 
-    logger.info('Successfully deployed %s' % recipe_outdir)
+        logger.info('Successfully deployed %s' % recipe_outdir)
 
-    files_list = []
-    for root, _, files in os.walk(recipe_outdir):
-        for filename in files:
-            filename = os.path.relpath(os.path.join(root, filename), recipe_outdir)
-            files_list.append(os.path.join(destdir, filename))
+        files_list = []
+        for root, _, files in os.walk(recipe_outdir):
+            for filename in files:
+                filename = os.path.relpath(os.path.join(root, filename), recipe_outdir)
+                files_list.append(os.path.join(destdir, filename))
+    finally:
+        tinfoil.shutdown()
 
     return 0
 
diff --git a/scripts/lib/devtool/runqemu.py b/scripts/lib/devtool/runqemu.py
index daee7fb..303abca 100644
--- a/scripts/lib/devtool/runqemu.py
+++ b/scripts/lib/devtool/runqemu.py
@@ -30,9 +30,11 @@ def runqemu(args, config, basepath, workspace):
     """Entry point for the devtool 'runqemu' subcommand"""
 
     tinfoil = setup_tinfoil(config_only=True, basepath=basepath)
-    machine = tinfoil.config_data.getVar('MACHINE', True)
-    bindir_native = tinfoil.config_data.getVar('STAGING_BINDIR_NATIVE', True)
-    tinfoil.shutdown()
+    try:
+        machine = tinfoil.config_data.getVar('MACHINE', True)
+        bindir_native = tinfoil.config_data.getVar('STAGING_BINDIR_NATIVE', True)
+    finally:
+        tinfoil.shutdown()
 
     if not glob.glob(os.path.join(bindir_native, 'qemu-system-*')):
         raise DevtoolError('QEMU is not available within this SDK')
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 6874224..22d4748 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -221,46 +221,48 @@ def add(args, config, basepath, workspace):
         initial_rev = stdout.rstrip()
 
     tinfoil = setup_tinfoil(config_only=True, basepath=basepath)
-    rd = oe.recipeutils.parse_recipe(tinfoil.cooker, recipefile, None)
-    if not rd:
-        return 1
-
-    if args.src_subdir:
-        srctree = os.path.join(srctree, args.src_subdir)
-
-    bb.utils.mkdirhier(os.path.dirname(appendfile))
-    with open(appendfile, 'w') as f:
-        f.write('inherit externalsrc\n')
-        f.write('EXTERNALSRC = "%s"\n' % srctree)
-
-        b_is_s = use_external_build(args.same_dir, args.no_same_dir, rd)
-        if b_is_s:
-            f.write('EXTERNALSRC_BUILD = "%s"\n' % srctree)
-        if initial_rev:
-            f.write('\n# initial_rev: %s\n' % initial_rev)
-
-        if args.binary:
-            f.write('do_install_append() {\n')
-            f.write('    rm -rf ${D}/.git\n')
-            f.write('    rm -f ${D}/singletask.lock\n')
-            f.write('}\n')
-
-        if bb.data.inherits_class('npm', rd):
-            f.write('do_install_append() {\n')
-            f.write('    # Remove files added to source dir by devtool/externalsrc\n')
-            f.write('    rm -f ${NPM_INSTALLDIR}/singletask.lock\n')
-            f.write('    rm -rf ${NPM_INSTALLDIR}/.git\n')
-            f.write('    rm -rf ${NPM_INSTALLDIR}/oe-local-files\n')
-            f.write('    for symlink in ${EXTERNALSRC_SYMLINKS} ; do\n')
-            f.write('        rm -f ${NPM_INSTALLDIR}/${symlink%%:*}\n')
-            f.write('    done\n')
-            f.write('}\n')
-
-    _add_md5(config, recipename, appendfile)
+    try:
+        rd = oe.recipeutils.parse_recipe(tinfoil.cooker, recipefile, None)
+        if not rd:
+            return 1
 
-    logger.info('Recipe %s has been automatically created; further editing may be required to make it fully functional' % recipefile)
+        if args.src_subdir:
+            srctree = os.path.join(srctree, args.src_subdir)
+
+        bb.utils.mkdirhier(os.path.dirname(appendfile))
+        with open(appendfile, 'w') as f:
+            f.write('inherit externalsrc\n')
+            f.write('EXTERNALSRC = "%s"\n' % srctree)
+
+            b_is_s = use_external_build(args.same_dir, args.no_same_dir, rd)
+            if b_is_s:
+                f.write('EXTERNALSRC_BUILD = "%s"\n' % srctree)
+            if initial_rev:
+                f.write('\n# initial_rev: %s\n' % initial_rev)
+
+            if args.binary:
+                f.write('do_install_append() {\n')
+                f.write('    rm -rf ${D}/.git\n')
+                f.write('    rm -f ${D}/singletask.lock\n')
+                f.write('}\n')
+
+            if bb.data.inherits_class('npm', rd):
+                f.write('do_install_append() {\n')
+                f.write('    # Remove files added to source dir by devtool/externalsrc\n')
+                f.write('    rm -f ${NPM_INSTALLDIR}/singletask.lock\n')
+                f.write('    rm -rf ${NPM_INSTALLDIR}/.git\n')
+                f.write('    rm -rf ${NPM_INSTALLDIR}/oe-local-files\n')
+                f.write('    for symlink in ${EXTERNALSRC_SYMLINKS} ; do\n')
+                f.write('        rm -f ${NPM_INSTALLDIR}/${symlink%%:*}\n')
+                f.write('    done\n')
+                f.write('}\n')
+
+        _add_md5(config, recipename, appendfile)
+
+        logger.info('Recipe %s has been automatically created; further editing may be required to make it fully functional' % recipefile)
 
-    tinfoil.shutdown()
+    finally:
+        tinfoil.shutdown()
 
     return 0
 
@@ -352,19 +354,21 @@ def extract(args, config, basepath, workspace):
     if not tinfoil:
         # Error already shown
         return 1
+    try:
+        rd = parse_recipe(config, tinfoil, args.recipename, True)
+        if not rd:
+            return 1
 
-    rd = parse_recipe(config, tinfoil, args.recipename, True)
-    if not rd:
-        return 1
-
-    srctree = os.path.abspath(args.srctree)
-    initial_rev = _extract_source(srctree, args.keep_temp, args.branch, False, rd)
-    logger.info('Source tree extracted to %s' % srctree)
+        srctree = os.path.abspath(args.srctree)
+        initial_rev = _extract_source(srctree, args.keep_temp, args.branch, False, rd)
+        logger.info('Source tree extracted to %s' % srctree)
 
-    if initial_rev:
-        return 0
-    else:
-        return 1
+        if initial_rev:
+            return 0
+        else:
+            return 1
+    finally:
+        tinfoil.shutdown()
 
 def sync(args, config, basepath, workspace):
     """Entry point for the devtool 'sync' subcommand"""
@@ -374,19 +378,21 @@ def sync(args, config, basepath, workspace):
     if not tinfoil:
         # Error already shown
         return 1
+    try:
+        rd = parse_recipe(config, tinfoil, args.recipename, True)
+        if not rd:
+            return 1
 
-    rd = parse_recipe(config, tinfoil, args.recipename, True)
-    if not rd:
-        return 1
-
-    srctree = os.path.abspath(args.srctree)
-    initial_rev = _extract_source(srctree, args.keep_temp, args.branch, True, rd)
-    logger.info('Source tree %s synchronized' % srctree)
+        srctree = os.path.abspath(args.srctree)
+        initial_rev = _extract_source(srctree, args.keep_temp, args.branch, True, rd)
+        logger.info('Source tree %s synchronized' % srctree)
 
-    if initial_rev:
-        return 0
-    else:
-        return 1
+        if initial_rev:
+            return 0
+        else:
+            return 1
+    finally:
+        tinfoil.shutdown()
 
 class BbTaskExecutor(object):
     """Class for executing bitbake tasks for a recipe
@@ -712,109 +718,111 @@ def modify(args, config, basepath, workspace):
                            args.recipename)
 
     tinfoil = setup_tinfoil(basepath=basepath)
-    rd = parse_recipe(config, tinfoil, args.recipename, True)
-    if not rd:
-        return 1
-
-    pn = rd.getVar('PN', True)
-    if pn != args.recipename:
-        logger.info('Mapping %s to %s' % (args.recipename, pn))
-    if pn in workspace:
-        raise DevtoolError("recipe %s is already in your workspace" %
-                           pn)
-
-    if args.srctree:
-        srctree = os.path.abspath(args.srctree)
-    else:
-        srctree = get_default_srctree(config, pn)
-
-    if args.no_extract and not os.path.isdir(srctree):
-        raise DevtoolError("--no-extract specified and source path %s does "
-                           "not exist or is not a directory" %
-                           srctree)
-    if not args.no_extract:
-        tinfoil = _prep_extract_operation(config, basepath, pn, tinfoil)
-        if not tinfoil:
-            # Error already shown
+    try:
+        rd = parse_recipe(config, tinfoil, args.recipename, True)
+        if not rd:
             return 1
 
-    recipefile = rd.getVar('FILE', True)
-    appendfile = recipe_to_append(recipefile, config, args.wildcard)
-    if os.path.exists(appendfile):
-        raise DevtoolError("Another variant of recipe %s is already in your "
-                           "workspace (only one variant of a recipe can "
-                           "currently be worked on at once)"
-                           % pn)
-
-    _check_compatible_recipe(pn, rd)
+        pn = rd.getVar('PN', True)
+        if pn != args.recipename:
+            logger.info('Mapping %s to %s' % (args.recipename, pn))
+        if pn in workspace:
+            raise DevtoolError("recipe %s is already in your workspace" %
+                            pn)
 
-    initial_rev = None
-    commits = []
-    if not args.no_extract:
-        initial_rev = _extract_source(srctree, False, args.branch, False, rd)
-        if not initial_rev:
-            return 1
-        logger.info('Source tree extracted to %s' % srctree)
-        # Get list of commits since this revision
-        (stdout, _) = bb.process.run('git rev-list --reverse %s..HEAD' % initial_rev, cwd=srctree)
-        commits = stdout.split()
-    else:
-        if os.path.exists(os.path.join(srctree, '.git')):
-            # Check if it's a tree previously extracted by us
-            try:
-                (stdout, _) = bb.process.run('git branch --contains devtool-base', cwd=srctree)
-            except bb.process.ExecutionError:
-                stdout = ''
-            for line in stdout.splitlines():
-                if line.startswith('*'):
-                    (stdout, _) = bb.process.run('git rev-parse devtool-base', cwd=srctree)
-                    initial_rev = stdout.rstrip()
+        if args.srctree:
+            srctree = os.path.abspath(args.srctree)
+        else:
+            srctree = get_default_srctree(config, pn)
+
+        if args.no_extract and not os.path.isdir(srctree):
+            raise DevtoolError("--no-extract specified and source path %s does "
+                            "not exist or is not a directory" %
+                            srctree)
+        if not args.no_extract:
+            tinfoil = _prep_extract_operation(config, basepath, pn, tinfoil)
+            if not tinfoil:
+                # Error already shown
+                return 1
+
+        recipefile = rd.getVar('FILE', True)
+        appendfile = recipe_to_append(recipefile, config, args.wildcard)
+        if os.path.exists(appendfile):
+            raise DevtoolError("Another variant of recipe %s is already in your "
+                            "workspace (only one variant of a recipe can "
+                            "currently be worked on at once)"
+                            % pn)
+
+        _check_compatible_recipe(pn, rd)
+
+        initial_rev = None
+        commits = []
+        if not args.no_extract:
+            initial_rev = _extract_source(srctree, False, args.branch, False, rd)
             if not initial_rev:
-                # Otherwise, just grab the head revision
-                (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srctree)
-                initial_rev = stdout.rstrip()
-
-    # Check that recipe isn't using a shared workdir
-    s = os.path.abspath(rd.getVar('S', True))
-    workdir = os.path.abspath(rd.getVar('WORKDIR', True))
-    if s.startswith(workdir) and s != workdir and os.path.dirname(s) != workdir:
-        # Handle if S is set to a subdirectory of the source
-        srcsubdir = os.path.relpath(s, workdir).split(os.sep, 1)[1]
-        srctree = os.path.join(srctree, srcsubdir)
-
-    bb.utils.mkdirhier(os.path.dirname(appendfile))
-    with open(appendfile, 'w') as f:
-        f.write('FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n')
-        # Local files can be modified/tracked in separate subdir under srctree
-        # Mostly useful for packages with S != WORKDIR
-        f.write('FILESPATH_prepend := "%s:"\n' %
-                os.path.join(srctree, 'oe-local-files'))
-
-        f.write('\ninherit externalsrc\n')
-        f.write('# NOTE: We use pn- overrides here to avoid affecting multiple variants in the case where the recipe uses BBCLASSEXTEND\n')
-        f.write('EXTERNALSRC_pn-%s = "%s"\n' % (pn, srctree))
-
-        b_is_s = use_external_build(args.same_dir, args.no_same_dir, rd)
-        if b_is_s:
-            f.write('EXTERNALSRC_BUILD_pn-%s = "%s"\n' % (pn, srctree))
-
-        if bb.data.inherits_class('kernel', rd):
-            f.write('SRCTREECOVEREDTASKS = "do_validate_branches do_kernel_checkout '
-                    'do_fetch do_unpack do_patch do_kernel_configme do_kernel_configcheck"\n')
-            f.write('\ndo_configure_append() {\n'
-                    '    cp ${B}/.config ${S}/.config.baseline\n'
-                    '    ln -sfT ${B}/.config ${S}/.config.new\n'
-                    '}\n')
-        if initial_rev:
-            f.write('\n# initial_rev: %s\n' % initial_rev)
-            for commit in commits:
-                f.write('# commit: %s\n' % commit)
-
-    _add_md5(config, pn, appendfile)
+                return 1
+            logger.info('Source tree extracted to %s' % srctree)
+            # Get list of commits since this revision
+            (stdout, _) = bb.process.run('git rev-list --reverse %s..HEAD' % initial_rev, cwd=srctree)
+            commits = stdout.split()
+        else:
+            if os.path.exists(os.path.join(srctree, '.git')):
+                # Check if it's a tree previously extracted by us
+                try:
+                    (stdout, _) = bb.process.run('git branch --contains devtool-base', cwd=srctree)
+                except bb.process.ExecutionError:
+                    stdout = ''
+                for line in stdout.splitlines():
+                    if line.startswith('*'):
+                        (stdout, _) = bb.process.run('git rev-parse devtool-base', cwd=srctree)
+                        initial_rev = stdout.rstrip()
+                if not initial_rev:
+                    # Otherwise, just grab the head revision
+                    (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srctree)
+                    initial_rev = stdout.rstrip()
 
-    logger.info('Recipe %s now set up to build from %s' % (pn, srctree))
+        # Check that recipe isn't using a shared workdir
+        s = os.path.abspath(rd.getVar('S', True))
+        workdir = os.path.abspath(rd.getVar('WORKDIR', True))
+        if s.startswith(workdir) and s != workdir and os.path.dirname(s) != workdir:
+            # Handle if S is set to a subdirectory of the source
+            srcsubdir = os.path.relpath(s, workdir).split(os.sep, 1)[1]
+            srctree = os.path.join(srctree, srcsubdir)
+
+        bb.utils.mkdirhier(os.path.dirname(appendfile))
+        with open(appendfile, 'w') as f:
+            f.write('FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n')
+            # Local files can be modified/tracked in separate subdir under srctree
+            # Mostly useful for packages with S != WORKDIR
+            f.write('FILESPATH_prepend := "%s:"\n' %
+                    os.path.join(srctree, 'oe-local-files'))
+
+            f.write('\ninherit externalsrc\n')
+            f.write('# NOTE: We use pn- overrides here to avoid affecting multiple variants in the case where the recipe uses BBCLASSEXTEND\n')
+            f.write('EXTERNALSRC_pn-%s = "%s"\n' % (pn, srctree))
+
+            b_is_s = use_external_build(args.same_dir, args.no_same_dir, rd)
+            if b_is_s:
+                f.write('EXTERNALSRC_BUILD_pn-%s = "%s"\n' % (pn, srctree))
+
+            if bb.data.inherits_class('kernel', rd):
+                f.write('SRCTREECOVEREDTASKS = "do_validate_branches do_kernel_checkout '
+                        'do_fetch do_unpack do_patch do_kernel_configme do_kernel_configcheck"\n')
+                f.write('\ndo_configure_append() {\n'
+                        '    cp ${B}/.config ${S}/.config.baseline\n'
+                        '    ln -sfT ${B}/.config ${S}/.config.new\n'
+                        '}\n')
+            if initial_rev:
+                f.write('\n# initial_rev: %s\n' % initial_rev)
+                for commit in commits:
+                    f.write('# commit: %s\n' % commit)
+
+        _add_md5(config, pn, appendfile)
+
+        logger.info('Recipe %s now set up to build from %s' % (pn, srctree))
 
-    tinfoil.shutdown()
+    finally:
+        tinfoil.shutdown()
 
     return 0
 
@@ -1287,17 +1295,20 @@ def update_recipe(args, config, basepath, workspace):
                                'destination layer "%s"' % args.append)
 
     tinfoil = setup_tinfoil(basepath=basepath, tracking=True)
+    try:
 
-    rd = parse_recipe(config, tinfoil, args.recipename, True)
-    if not rd:
-        return 1
+        rd = parse_recipe(config, tinfoil, args.recipename, True)
+        if not rd:
+            return 1
 
-    updated = _update_recipe(args.recipename, workspace, rd, args.mode, args.append, args.wildcard_version, args.no_remove, args.initial_rev)
+        updated = _update_recipe(args.recipename, workspace, rd, args.mode, args.append, args.wildcard_version, args.no_remove, args.initial_rev)
 
-    if updated:
-        rf = rd.getVar('FILE', True)
-        if rf.startswith(config.workspace_path):
-            logger.warn('Recipe file %s has been updated but is inside the workspace - you will need to move it (and any associated files next to it) out to the desired layer before using "devtool reset" in order to keep any changes' % rf)
+        if updated:
+            rf = rd.getVar('FILE', True)
+            if rf.startswith(config.workspace_path):
+                logger.warn('Recipe file %s has been updated but is inside the workspace - you will need to move it (and any associated files next to it) out to the desired layer before using "devtool reset" in order to keep any changes' % rf)
+    finally:
+        tinfoil.shutdown()
 
     return 0
 
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index fc2f919..e3f7ca2 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -334,48 +334,51 @@ def upgrade(args, config, basepath, workspace):
         raise DevtoolError("If you specify --srcbranch/-B then you must use --srcrev/-S to specify the revision" % args.recipename)
 
     tinfoil = setup_tinfoil(basepath=basepath, tracking=True)
-    rd = parse_recipe(config, tinfoil, args.recipename, True)
-    if not rd:
-        return 1
-
-    pn = rd.getVar('PN', True)
-    if pn != args.recipename:
-        logger.info('Mapping %s to %s' % (args.recipename, pn))
-    if pn in workspace:
-        raise DevtoolError("recipe %s is already in your workspace" % pn)
-
-    if args.srctree:
-        srctree = os.path.abspath(args.srctree)
-    else:
-        srctree = standard.get_default_srctree(config, pn)
-
-    standard._check_compatible_recipe(pn, rd)
-    old_srcrev = rd.getVar('SRCREV', True)
-    if old_srcrev == 'INVALID':
-        old_srcrev = None
-    if old_srcrev and not args.srcrev:
-        raise DevtoolError("Recipe specifies a SRCREV value; you must specify a new one when upgrading")
-    if rd.getVar('PV', True) == args.version and old_srcrev == args.srcrev:
-        raise DevtoolError("Current and upgrade versions are the same version")
-
-    rf = None
     try:
-        rev1 = standard._extract_source(srctree, False, 'devtool-orig', False, rd)
-        rev2, md5, sha256 = _extract_new_source(args.version, srctree, args.no_patch,
-                                                args.srcrev, args.branch, args.keep_temp,
-                                                tinfoil, rd)
-        rf, copied = _create_new_recipe(args.version, md5, sha256, args.srcrev, args.srcbranch, config.workspace_path, tinfoil, rd)
-    except bb.process.CmdError as e:
-        _upgrade_error(e, rf, srctree)
-    except DevtoolError as e:
-        _upgrade_error(e, rf, srctree)
-    standard._add_md5(config, pn, os.path.dirname(rf))
-
-    af = _write_append(rf, srctree, args.same_dir, args.no_same_dir, rev2,
-                       copied, config.workspace_path, rd)
-    standard._add_md5(config, pn, af)
-    logger.info('Upgraded source extracted to %s' % srctree)
-    logger.info('New recipe is %s' % rf)
+        rd = parse_recipe(config, tinfoil, args.recipename, True)
+        if not rd:
+            return 1
+
+        pn = rd.getVar('PN', True)
+        if pn != args.recipename:
+            logger.info('Mapping %s to %s' % (args.recipename, pn))
+        if pn in workspace:
+            raise DevtoolError("recipe %s is already in your workspace" % pn)
+
+        if args.srctree:
+            srctree = os.path.abspath(args.srctree)
+        else:
+            srctree = standard.get_default_srctree(config, pn)
+
+        standard._check_compatible_recipe(pn, rd)
+        old_srcrev = rd.getVar('SRCREV', True)
+        if old_srcrev == 'INVALID':
+            old_srcrev = None
+        if old_srcrev and not args.srcrev:
+            raise DevtoolError("Recipe specifies a SRCREV value; you must specify a new one when upgrading")
+        if rd.getVar('PV', True) == args.version and old_srcrev == args.srcrev:
+            raise DevtoolError("Current and upgrade versions are the same version")
+
+        rf = None
+        try:
+            rev1 = standard._extract_source(srctree, False, 'devtool-orig', False, rd)
+            rev2, md5, sha256 = _extract_new_source(args.version, srctree, args.no_patch,
+                                                    args.srcrev, args.branch, args.keep_temp,
+                                                    tinfoil, rd)
+            rf, copied = _create_new_recipe(args.version, md5, sha256, args.srcrev, args.srcbranch, config.workspace_path, tinfoil, rd)
+        except bb.process.CmdError as e:
+            _upgrade_error(e, rf, srctree)
+        except DevtoolError as e:
+            _upgrade_error(e, rf, srctree)
+        standard._add_md5(config, pn, os.path.dirname(rf))
+
+        af = _write_append(rf, srctree, args.same_dir, args.no_same_dir, rev2,
+                        copied, config.workspace_path, rd)
+        standard._add_md5(config, pn, af)
+        logger.info('Upgraded source extracted to %s' % srctree)
+        logger.info('New recipe is %s' % rf)
+    finally:
+        tinfoil.shutdown()
     return 0
 
 def register_commands(subparsers, context):
diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index e4d262d..bb917b4 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -569,7 +569,10 @@ def main():
             sys.exit(1)
         logger.debug('Found bitbake path: %s' % bitbakepath)
         tinfoil = tinfoil_init()
-        args.pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR', True)
+        try:
+            args.pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR', True)
+        finally:
+            tinfoil.shutdown()
         logger.debug('Value of PKGDATA_DIR is "%s"' % args.pkgdata_dir)
         if not args.pkgdata_dir:
             logger.error('Unable to determine pkgdata directory from PKGDATA_DIR')
diff --git a/scripts/recipetool b/scripts/recipetool
index 17233d4..1052cd2 100755
--- a/scripts/recipetool
+++ b/scripts/recipetool
@@ -77,37 +77,40 @@ def main():
     scriptutils.logger_setup_color(logger, global_args.color)
 
     tinfoil = tinfoil_init(False)
-    for path in ([scripts_path] +
-                 tinfoil.config_data.getVar('BBPATH', True).split(':')):
-        pluginpath = os.path.join(path, 'lib', 'recipetool')
-        scriptutils.load_plugins(logger, plugins, pluginpath)
-
-    registered = False
-    for plugin in plugins:
-        if hasattr(plugin, 'register_commands'):
-            registered = True
-            plugin.register_commands(subparsers)
-        elif hasattr(plugin, 'register_command'):
-            # Legacy function name
-            registered = True
-            plugin.register_command(subparsers)
-        if hasattr(plugin, 'tinfoil_init'):
-            plugin.tinfoil_init(tinfoil)
-
-    if not registered:
-        logger.error("No commands registered - missing plugins?")
-        sys.exit(1)
-
-    args = parser.parse_args(unparsed_args, namespace=global_args)
-
     try:
-        if getattr(args, 'parserecipes', False):
-            tinfoil.config_data.disableTracking()
-            tinfoil.parseRecipes()
-            tinfoil.config_data.enableTracking()
-        ret = args.func(args)
-    except bb.BBHandledException:
-        ret = 1
+        for path in ([scripts_path] +
+                    tinfoil.config_data.getVar('BBPATH', True).split(':')):
+            pluginpath = os.path.join(path, 'lib', 'recipetool')
+            scriptutils.load_plugins(logger, plugins, pluginpath)
+
+        registered = False
+        for plugin in plugins:
+            if hasattr(plugin, 'register_commands'):
+                registered = True
+                plugin.register_commands(subparsers)
+            elif hasattr(plugin, 'register_command'):
+                # Legacy function name
+                registered = True
+                plugin.register_command(subparsers)
+            if hasattr(plugin, 'tinfoil_init'):
+                plugin.tinfoil_init(tinfoil)
+
+        if not registered:
+            logger.error("No commands registered - missing plugins?")
+            sys.exit(1)
+
+        args = parser.parse_args(unparsed_args, namespace=global_args)
+
+        try:
+            if getattr(args, 'parserecipes', False):
+                tinfoil.config_data.disableTracking()
+                tinfoil.parseRecipes()
+                tinfoil.config_data.enableTracking()
+            ret = args.func(args)
+        except bb.BBHandledException:
+            ret = 1
+    finally:
+        tinfoil.shutdown()
 
     return ret
 
-- 
2.5.5


