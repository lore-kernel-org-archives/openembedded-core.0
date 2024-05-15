Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B9EEC27C43
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 11:56:32 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.12950.1715774186914206690
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 04:56:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UlDRS5ai;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4200ee78f33so32675015e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 04:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1715774185; x=1716378985; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MGtcrcCxOy71To0hsp2v8EltcSX/6JBrBkp+Xc0p484=;
        b=UlDRS5aiO25pl9W6xkYXQ1v2ZurrYFEZuFBXrKk/KdNPK5AT1H38MopYTfJbw/htZo
         I496X77p0j/+ZFUZJszdl5OX1HS57N50/fbWg8p0XG28ZcCELH10woPI9dcHxQ2wV0kI
         0I9JMy5LBymAumnq1W18MhI0QH8rFPAtc7Lqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715774185; x=1716378985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MGtcrcCxOy71To0hsp2v8EltcSX/6JBrBkp+Xc0p484=;
        b=uy1uWRs2TKgdKaJEJyTHs4/+HESb8oBKrtLwy8gYH98ZqYgC0R5QXqMxjvR2E0WgJn
         Kp2RfilkeFss9ThSVW0DUSSzKZUQA+EuDlYgruxAtKEtg/PY7hCDc3NeMA/C9qa0Lwig
         ukQFVQ/yobZ+xFi59w2EQ1AK5IdakHpJs3H01huHQkdvKSFKasd4SaCYW+wzHtPvtq78
         yRvWILePLAooGyKFZfs8DWbzyl+YzydBoMBGoweeG2rFB/mxf/8o0hLjZFVbpJCXsXsR
         iixBFzZ48tlLOt0RIDHZDHSU3tKeCCQth3mEJ9h+z8AZ+V0khPhyL+SbzVIVyeYd6cYV
         Ow3g==
X-Gm-Message-State: AOJu0YwBQXCs7wgZ4znAOLNJBxm6b/dZSc8O9CAzGzXM6j0UM81Ew2Da
	I4I3mB1JR7J3ZQ0fUrU1SbLwXDWi0pV+OPQuY/nRYLXkwO0CLtwd/LocEvdUcsFg09f96e+vJMP
	PCRg=
X-Google-Smtp-Source: AGHT+IFk9ppZSAiPS0KFVvRm0vvY+gGM+tu6VqIwQhr2Td+JOGkKL3YGzh3c8nlMOMPYwX7oDiugRA==
X-Received: by 2002:a05:600c:5250:b0:420:1670:d606 with SMTP id 5b1f17b1804b1-4201670d93amr62820685e9.16.1715774184871;
        Wed, 15 May 2024 04:56:24 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:13b6:dedd:c8fc:b915])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce2449sm232555825e9.16.2024.05.15.04.56.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 04:56:24 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/10] devtool: Drop oe-local-files and simplify
Date: Wed, 15 May 2024 12:56:14 +0100
Message-Id: <20240515115620.420558-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240515115620.420558-1-richard.purdie@linuxfoundation.org>
References: <20240515115620.420558-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 11:56:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199280

The only real reason for oe-local-files was to support S = WORKDIR. With changes to
drop support for that, it makes sense to simplify devtool and to try and make both
the code and the processes/workflows simpler.

This patch drops support for S = WORKDIR, removes oe-local-files and then updates
the test cases to match this new situation.

At the code level, we assume we can always now track code changes using git and
that things committed into git are handled as patches (as before) but delta against
HEAD is saved as specific file level changes to the recipe.

One test is disabled as it is no longer approproate. It is being keped until we can
make WORKDIR != UNPACKDIR at which point it should be revisited.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../devtool/devtool-test-localonly.bb         |   3 +
 meta/classes-recipe/kernel-yocto.bbclass      |   2 -
 meta/classes/devtool-source.bbclass           |  74 +------
 meta/lib/oeqa/selftest/cases/devtool.py       |  38 ++--
 scripts/lib/devtool/standard.py               | 194 ++++++------------
 5 files changed, 89 insertions(+), 222 deletions(-)

diff --git a/meta-selftest/recipes-test/devtool/devtool-test-localonly.bb b/meta-selftest/recipes-test/devtool/devtool-test-localonly.bb
index e767619879a..446c51f09b5 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-localonly.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-test-localonly.bb
@@ -6,5 +6,8 @@ SRC_URI = "file://file1 \
 
 SRC_URI:append:class-native = " file://file3"
 
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
+
 EXCLUDE_FROM_WORLD = "1"
 BBCLASSEXTEND = "native"
diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index c4ed3f1ca2e..e8ff7311c32 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -234,8 +234,6 @@ do_kernel_metadata() {
 	for f in ${feat_dirs}; do
 		if [ -d "${UNPACKDIR}/$f/kernel-meta" ]; then
 			includes="$includes -I${UNPACKDIR}/$f/kernel-meta"
-		elif [ -d "${UNPACKDIR}/../oe-local-files/$f" ]; then
-			includes="$includes -I${UNPACKDIR}/../oe-local-files/$f"
 	        elif [ -d "${UNPACKDIR}/$f" ]; then
 			includes="$includes -I${UNPACKDIR}/$f"
 		fi
diff --git a/meta/classes/devtool-source.bbclass b/meta/classes/devtool-source.bbclass
index 4158c20c7e8..3e24800dcb0 100644
--- a/meta/classes/devtool-source.bbclass
+++ b/meta/classes/devtool-source.bbclass
@@ -26,8 +26,6 @@
 
 
 DEVTOOL_TEMPDIR ?= ""
-DEVTOOL_PATCH_SRCDIR = "${DEVTOOL_TEMPDIR}/patchworkdir"
-
 
 python() {
     tempdir = d.getVar('DEVTOOL_TEMPDIR')
@@ -60,7 +58,6 @@ python() {
     else:
         unpacktask = 'do_unpack'
     d.appendVarFlag(unpacktask, 'postfuncs', ' devtool_post_unpack')
-    d.prependVarFlag('do_patch', 'prefuncs', ' devtool_pre_patch')
     d.appendVarFlag('do_patch', 'postfuncs', ' devtool_post_patch')
 
     # NOTE: in order for the patch stuff to be fully functional,
@@ -79,67 +76,23 @@ python devtool_post_unpack() {
 
     tempdir = d.getVar('DEVTOOL_TEMPDIR')
     workdir = d.getVar('WORKDIR')
+    unpackdir = d.getVar('UNPACKDIR')
     srcsubdir = d.getVar('S')
 
-    def _move_file(src, dst):
-        """Move a file. Creates all the directory components of destination path."""
-        dst_d = os.path.dirname(dst)
-        if dst_d:
-            bb.utils.mkdirhier(dst_d)
-        shutil.move(src, dst)
-
-    def _ls_tree(directory):
-        """Recursive listing of files in a directory"""
-        ret = []
-        for root, dirs, files in os.walk(directory):
-            ret.extend([os.path.relpath(os.path.join(root, fname), directory) for
-                        fname in files])
-        return ret
-
-    is_kernel_yocto = bb.data.inherits_class('kernel-yocto', d)
-    # Move local source files into separate subdir
-    recipe_patches = [os.path.basename(patch) for patch in
-                        oe.recipeutils.get_recipe_patches(d)]
+    # Add locally copied files to gitignore as we add back to the metadata directly
     local_files = oe.recipeutils.get_recipe_local_files(d)
-
-    if is_kernel_yocto:
-        for key in [f for f in local_files if f.endswith('scc')]:
-            with open(local_files[key], 'r') as sccfile:
-                for l in sccfile:
-                    line = l.split()
-                    if line and line[0] in ('kconf', 'patch'):
-                        cfg = os.path.join(os.path.dirname(local_files[key]), line[-1])
-                        if cfg not in local_files.values():
-                            local_files[line[-1]] = cfg
-                            shutil.copy2(cfg, workdir)
-
-    # Ignore local files with subdir={BP}
     srcabspath = os.path.abspath(srcsubdir)
     local_files = [fname for fname in local_files if
-                    os.path.exists(os.path.join(workdir, fname)) and
-                    (srcabspath == workdir or not
-                    os.path.join(workdir, fname).startswith(srcabspath +
-                        os.sep))]
+                    os.path.exists(os.path.join(unpackdir, fname)) and
+                    srcabspath == unpackdir]
     if local_files:
-        for fname in local_files:
-            _move_file(os.path.join(workdir, fname),
-                        os.path.join(tempdir, 'oe-local-files', fname))
-        with open(os.path.join(tempdir, 'oe-local-files', '.gitignore'),
-                    'w') as f:
-            f.write('# Ignore local files, by default. Remove this file '
-                    'if you want to commit the directory to Git\n*\n')
-
-    if srcsubdir == workdir:
-        # Find non-patch non-local sources that were "unpacked" to srctree
-        # directory
-        src_files = [fname for fname in _ls_tree(workdir) if
-                        os.path.basename(fname) not in recipe_patches]
-        srcsubdir = d.getVar('DEVTOOL_PATCH_SRCDIR')
-        # Move source files to S
-        for path in src_files:
-            _move_file(os.path.join(workdir, path),
-                        os.path.join(srcsubdir, path))
-    elif os.path.dirname(srcsubdir) != workdir:
+        with open(os.path.join(tempdir, '.gitignore'), 'a+') as f:
+            f.write('# Ignore local files, by default. Remove following lines'
+                    'if you want to commit the directory to Git\n')
+            for fname in local_files:
+                f.write('%s\n' % fname)
+
+    if os.path.dirname(srcsubdir) != workdir:
         # Handle if S is set to a subdirectory of the source
         srcsubdir = os.path.join(workdir, os.path.relpath(srcsubdir, workdir).split(os.sep)[0])
 
@@ -164,11 +117,6 @@ python devtool_post_unpack() {
         f.write(srcsubdir)
 }
 
-python devtool_pre_patch() {
-    if d.getVar('S') == d.getVar('WORKDIR'):
-        d.setVar('S', '${DEVTOOL_PATCH_SRCDIR}')
-}
-
 python devtool_post_patch() {
     import shutil
     tempdir = d.getVar('DEVTOOL_TEMPDIR')
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 8ce1c65a388..c8bf7d9e445 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -879,13 +879,8 @@ class DevtoolModifyTests(DevtoolBase):
         self.add_command_to_tearDown('bitbake -c clean %s' % testrecipe)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
-        srcfile = os.path.join(tempdir, 'oe-local-files/share/dot.bashrc')
-        srclink = os.path.join(tempdir, 'share/dot.bashrc')
+        srcfile = os.path.join(tempdir, 'share/dot.bashrc')
         self.assertExists(srcfile, 'Extracted source could not be found')
-        if os.path.islink(srclink) and os.path.exists(srclink) and os.path.samefile(srcfile, srclink):
-            correct_symlink = True
-        self.assertTrue(correct_symlink, 'Source symlink to oe-local-files is broken')
-
         matches = glob.glob(os.path.join(self.workspacedir, 'appends', '%s_*.bbappend' % testrecipe))
         self.assertTrue(matches, 'bbappend not created')
         # Test devtool status
@@ -1278,7 +1273,7 @@ class DevtoolUpdateTests(DevtoolBase):
         with open(bbappendfile, 'r') as f:
             self.assertEqual(expectedlines, f.readlines())
         # Drop new commit and check patch gets deleted
-        result = runCmd('git reset HEAD^', cwd=tempsrcdir)
+        result = runCmd('git reset HEAD^ --hard', cwd=tempsrcdir)
         result = runCmd('devtool update-recipe %s -a %s' % (testrecipe, templayerdir))
         self.assertNotExists(patchfile, 'Patch file not deleted')
         expectedlines2 = ['FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"\n',
@@ -1287,6 +1282,7 @@ class DevtoolUpdateTests(DevtoolBase):
             self.assertEqual(expectedlines2, f.readlines())
         # Put commit back and check we can run it if layer isn't in bblayers.conf
         os.remove(bbappendfile)
+        result = runCmd("sed 's!\\(#define VERSION\\W*\"[^\"]*\\)\"!\\1-custom\"!' -i ReadMe.c", cwd=tempsrcdir)
         result = runCmd('git commit -a -m "Add our custom version"', cwd=tempsrcdir)
         result = runCmd('bitbake-layers remove-layer %s' % templayerdir, cwd=self.builddir)
         result = runCmd('devtool update-recipe %s -a %s' % (testrecipe, templayerdir))
@@ -1361,7 +1357,7 @@ class DevtoolUpdateTests(DevtoolBase):
         with open(bbappendfile, 'r') as f:
             self.assertEqual(expectedlines, set(f.readlines()))
         # Drop new commit and check SRCREV changes
-        result = runCmd('git reset HEAD^', cwd=tempsrcdir)
+        result = runCmd('git reset HEAD^ --hard', cwd=tempsrcdir)
         result = runCmd('devtool update-recipe -m srcrev %s -a %s' % (testrecipe, templayerdir))
         self.assertNotExists(os.path.join(appenddir, testrecipe), 'Patch directory should not be created')
         result = runCmd('git rev-parse HEAD', cwd=tempsrcdir)
@@ -1373,6 +1369,7 @@ class DevtoolUpdateTests(DevtoolBase):
             self.assertEqual(expectedlines, set(f.readlines()))
         # Put commit back and check we can run it if layer isn't in bblayers.conf
         os.remove(bbappendfile)
+        result = runCmd('echo "# Additional line" >> Makefile.am', cwd=tempsrcdir)
         result = runCmd('git commit -a -m "Change the Makefile"', cwd=tempsrcdir)
         result = runCmd('bitbake-layers remove-layer %s' % templayerdir, cwd=self.builddir)
         result = runCmd('devtool update-recipe -m srcrev %s -a %s' % (testrecipe, templayerdir))
@@ -1404,11 +1401,12 @@ class DevtoolUpdateTests(DevtoolBase):
         # Try building just to ensure we haven't broken that
         bitbake("%s" % testrecipe)
         # Edit / commit local source
-        runCmd('echo "/* Foobar */" >> oe-local-files/makedevs.c', cwd=tempdir)
-        runCmd('echo "Foo" > oe-local-files/new-local', cwd=tempdir)
+        runCmd('echo "/* Foobar */" >> makedevs.c', cwd=tempdir)
+        runCmd('echo "Foo" > new-local', cwd=tempdir)
         runCmd('echo "Bar" > new-file', cwd=tempdir)
         runCmd('git add new-file', cwd=tempdir)
         runCmd('git commit -m "Add new file"', cwd=tempdir)
+        runCmd('git add new-local', cwd=tempdir)
         runCmd('devtool update-recipe %s' % testrecipe)
         expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
                            (' M', '.*/makedevs/makedevs.c$'),
@@ -1434,8 +1432,8 @@ class DevtoolUpdateTests(DevtoolBase):
         self.assertExists(local_file, 'File makedevs.c not created')
         self.assertExists(patchfile, 'File new_local not created')
 
-    def test_devtool_update_recipe_local_files_2(self):
-        """Check local source files support when oe-local-files is in Git"""
+    def _test_devtool_update_recipe_local_files_2(self):
+        """Check local source files support when editing local files in Git"""
         testrecipe = 'devtool-test-local'
         recipefile = get_bb_var('FILE', testrecipe)
         recipedir = os.path.dirname(recipefile)
@@ -1450,17 +1448,13 @@ class DevtoolUpdateTests(DevtoolBase):
         result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
         # Check git repo
         self._check_src_repo(tempdir)
-        # Add oe-local-files to Git
-        runCmd('rm oe-local-files/.gitignore', cwd=tempdir)
-        runCmd('git add oe-local-files', cwd=tempdir)
-        runCmd('git commit -m "Add local sources"', cwd=tempdir)
         # Edit / commit local sources
-        runCmd('echo "# Foobar" >> oe-local-files/file1', cwd=tempdir)
+        runCmd('echo "# Foobar" >> file1', cwd=tempdir)
         runCmd('git commit -am "Edit existing file"', cwd=tempdir)
-        runCmd('git rm oe-local-files/file2', cwd=tempdir)
+        runCmd('git rm file2', cwd=tempdir)
         runCmd('git commit -m"Remove file"', cwd=tempdir)
-        runCmd('echo "Foo" > oe-local-files/new-local', cwd=tempdir)
-        runCmd('git add oe-local-files/new-local', cwd=tempdir)
+        runCmd('echo "Foo" > new-local', cwd=tempdir)
+        runCmd('git add new-local', cwd=tempdir)
         runCmd('git commit -m "Add new local file"', cwd=tempdir)
         runCmd('echo "Gar" > new-file', cwd=tempdir)
         runCmd('git add new-file', cwd=tempdir)
@@ -1469,7 +1463,7 @@ class DevtoolUpdateTests(DevtoolBase):
                                      os.path.dirname(recipefile))
         # Checkout unmodified file to working copy -> devtool should still pick
         # the modified version from HEAD
-        runCmd('git checkout HEAD^ -- oe-local-files/file1', cwd=tempdir)
+        runCmd('git checkout HEAD^ -- file1', cwd=tempdir)
         runCmd('devtool update-recipe %s' % testrecipe)
         expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
                            (' M', '.*/file1$'),
@@ -1544,7 +1538,7 @@ class DevtoolUpdateTests(DevtoolBase):
         # (don't bother with cleaning the recipe on teardown, we won't be building it)
         result = runCmd('devtool modify %s' % testrecipe)
         # Modify one file
-        runCmd('echo "Another line" >> file2', cwd=os.path.join(self.workspacedir, 'sources', testrecipe, 'oe-local-files'))
+        runCmd('echo "Another line" >> file2', cwd=os.path.join(self.workspacedir, 'sources', testrecipe))
         self.add_command_to_tearDown('cd %s; rm %s/*; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(recipefile)))
         result = runCmd('devtool update-recipe %s' % testrecipe)
         expected_status = [(' M', '.*/%s/file2$' % testrecipe)]
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 05161942b7c..1d0fe137887 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -387,6 +387,19 @@ def _git_ls_tree(repodir, treeish='HEAD', recursive=False):
                 ret[split[3]] = split[0:3]
     return ret
 
+def _git_modified(repodir):
+    """List the difference between HEAD and the index"""
+    import bb
+    cmd = ['git', 'status', '--porcelain']
+    out, _ = bb.process.run(cmd, cwd=repodir)
+    ret = []
+    if out:
+        for line in out.split("\n"):
+            if line and not line.startswith('??'):
+                ret.append(line[3:])
+    return ret
+
+
 def _git_exclude_path(srctree, path):
     """Return pathspec (list of paths) that excludes certain path"""
     # NOTE: "Filtering out" files/paths in this way is not entirely reliable -
@@ -460,32 +473,6 @@ def sync(args, config, basepath, workspace):
     finally:
         tinfoil.shutdown()
 
-def symlink_oelocal_files_srctree(rd, srctree):
-    import oe.patch
-    if os.path.abspath(rd.getVar('S')) == os.path.abspath(rd.getVar('WORKDIR')):
-        # If recipe extracts to ${WORKDIR}, symlink the files into the srctree
-        # (otherwise the recipe won't build as expected)
-        local_files_dir = os.path.join(srctree, 'oe-local-files')
-        addfiles = []
-        for root, _, files in os.walk(local_files_dir):
-            relpth = os.path.relpath(root, local_files_dir)
-            if relpth != '.':
-                bb.utils.mkdirhier(os.path.join(srctree, relpth))
-            for fn in files:
-                if fn == '.gitignore':
-                    continue
-                destpth = os.path.join(srctree, relpth, fn)
-                if os.path.exists(destpth):
-                    os.unlink(destpth)
-                if relpth != '.':
-                    back_relpth = os.path.relpath(local_files_dir, root)
-                    os.symlink('%s/oe-local-files/%s/%s' % (back_relpth, relpth, fn), destpth)
-                else:
-                    os.symlink('oe-local-files/%s' % fn, destpth)
-                addfiles.append(os.path.join(relpth, fn))
-        if addfiles:
-            oe.patch.GitApplyTree.commitIgnored("Add local file symlinks", dir=srctree, files=addfiles, d=rd)
-
 def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, workspace, fixed_setup, d, tinfoil, no_overrides=False):
     """Extract sources of a recipe"""
     import oe.recipeutils
@@ -657,9 +644,6 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
             elif not os.path.exists(workshareddir):
                 oe.path.copyhardlinktree(srcsubdir, workshareddir)
 
-        tempdir_localdir = os.path.join(tempdir, 'oe-local-files')
-        srctree_localdir = os.path.join(srctree, 'oe-local-files')
-
         if sync:
             try:
                 logger.info('Backing up current %s branch as branch: %s.bak' % (devbranch, devbranch))
@@ -674,29 +658,8 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
             except bb.process.ExecutionError as e:
                 raise DevtoolError("Error when syncing source files to local checkout: %s" % str(e))
 
-            # Move the oe-local-files directory to srctree.
-            # As oe-local-files is not part of the constructed git tree,
-            # removing it directly during the synchronization might surprise
-            # the user.  Instead, we move it to oe-local-files.bak and remind
-            # the user in the log message.
-            if os.path.exists(srctree_localdir + '.bak'):
-                shutil.rmtree(srctree_localdir + '.bak')
-
-            if os.path.exists(srctree_localdir):
-                logger.info('Backing up current local file directory %s' % srctree_localdir)
-                shutil.move(srctree_localdir, srctree_localdir + '.bak')
-
-            if os.path.exists(tempdir_localdir):
-                logger.info('Syncing local source files to srctree...')
-                shutil.copytree(tempdir_localdir, srctree_localdir)
         else:
-            # Move oe-local-files directory to srctree
-            if os.path.exists(tempdir_localdir):
-                logger.info('Adding local source files to srctree...')
-                shutil.move(tempdir_localdir, srcsubdir)
-
             shutil.move(srcsubdir, srctree)
-            symlink_oelocal_files_srctree(d, srctree)
 
         if is_kernel_yocto:
             logger.info('Copying kernel config to srctree')
@@ -852,34 +815,22 @@ def modify(args, config, basepath, workspace):
             if (os.path.exists(srcdir) and os.listdir(srcdir)) and (kernelVersion in staging_kerVer and staging_kbranch == kbranch):
                 oe.path.copyhardlinktree(srcdir, srctree)
                 workdir = rd.getVar('WORKDIR')
+                unpackdir = rd.getVar('UNPACKDIR')
                 srcsubdir = rd.getVar('S')
                 localfilesdir = os.path.join(srctree, 'oe-local-files')
-                # Move local source files into separate subdir
-                recipe_patches = [os.path.basename(patch) for patch in oe.recipeutils.get_recipe_patches(rd)]
-                local_files = oe.recipeutils.get_recipe_local_files(rd)
 
-                for key in local_files.copy():
-                    if key.endswith('scc'):
-                        sccfile = open(local_files[key], 'r')
-                        for l in sccfile:
-                            line = l.split()
-                            if line and line[0] in ('kconf', 'patch'):
-                                cfg = os.path.join(os.path.dirname(local_files[key]), line[-1])
-                                if not cfg in local_files.values():
-                                    local_files[line[-1]] = cfg
-                                    shutil.copy2(cfg, workdir)
-                        sccfile.close()
-
-                # Ignore local files with subdir={BP}
+                # Add locally copied files to gitignore as we add back to the metadata directly
+                local_files = oe.recipeutils.get_recipe_local_files(rd)
                 srcabspath = os.path.abspath(srcsubdir)
-                local_files = [fname for fname in local_files if os.path.exists(os.path.join(workdir, fname)) and  (srcabspath == workdir or not  os.path.join(workdir, fname).startswith(srcabspath + os.sep))]
+                local_files = [fname for fname in local_files if
+                               os.path.exists(os.path.join(unpackdir, fname)) and
+                               srcabspath == unpackdir]
                 if local_files:
-                    for fname in local_files:
-                        _move_file(os.path.join(workdir, fname), os.path.join(srctree, 'oe-local-files', fname))
-                    with open(os.path.join(srctree, 'oe-local-files', '.gitignore'), 'w') as f:
-                        f.write('# Ignore local files, by default. Remove this file if you want to commit the directory to Git\n*\n')
-
-                symlink_oelocal_files_srctree(rd, srctree)
+                    with open(os.path.join(srctree, '.gitignore'), 'a+') as f:
+                        f.write('# Ignore local files, by default. Remove following lines'
+                                'if you want to commit the directory to Git\n')
+                        for fname in local_files:
+                            f.write('%s\n' % fname)
 
                 task = 'do_configure'
                 res = tinfoil.build_targets(pn, task, handle_events=True)
@@ -1478,6 +1429,7 @@ def _export_local_files(srctree, rd, destdir, srctreebase):
     # Instead they are directly copied over the original source files (in
     # recipe space).
     existing_files = oe.recipeutils.get_recipe_local_files(rd)
+
     new_set = None
     updated = OrderedDict()
     added = OrderedDict()
@@ -1494,24 +1446,28 @@ def _export_local_files(srctree, rd, destdir, srctreebase):
     if branchname.startswith(override_branch_prefix):
         return (updated, added, removed)
 
-    local_files_dir = os.path.join(srctreebase, 'oe-local-files')
-    git_files = _git_ls_tree(srctree)
-    if 'oe-local-files' in git_files:
-        # If tracked by Git, take the files from srctree HEAD. First get
-        # the tree object of the directory
-        tmp_index = os.path.join(srctree, '.git', 'index.tmp.devtool')
-        tree = git_files['oe-local-files'][2]
-        bb.process.run(['git', 'checkout', tree, '--', '.'], cwd=srctree,
-                        env=dict(os.environ, GIT_WORK_TREE=destdir,
-                                 GIT_INDEX_FILE=tmp_index))
-        new_set = list(_git_ls_tree(srctree, tree, True).keys())
-    elif os.path.isdir(local_files_dir):
-        # If not tracked by Git, just copy from working copy
-        new_set = _ls_tree(local_files_dir)
-        bb.process.run(['cp', '-ax',
-                        os.path.join(local_files_dir, '.'), destdir])
-    else:
-        new_set = []
+    files = _git_modified(srctree)
+        #if not files:
+        #    files = _ls_tree(srctree)
+    for f in files:
+        fullfile = os.path.join(srctree, f)
+        if os.path.exists(os.path.join(fullfile, ".git")):
+            # submodules handled elsewhere
+            continue
+        if f not in existing_files:
+            added[f] = {}
+            if os.path.isdir(os.path.join(srctree, f)):
+                shutil.copytree(fullfile, os.path.join(destdir, f))
+            else:
+                shutil.copy2(fullfile, os.path.join(destdir, f))
+        elif not os.path.exists(fullfile):
+            removed[f] = existing_files[f]
+        elif f in existing_files:
+            updated[f] = {'path' : existing_files[f]}
+            if os.path.isdir(os.path.join(srctree, f)):
+                shutil.copytree(fullfile, os.path.join(destdir, f))
+            else:
+                shutil.copy2(fullfile, os.path.join(destdir, f))
 
     # Special handling for kernel config
     if bb.data.inherits_class('kernel-yocto', rd):
@@ -1519,17 +1475,14 @@ def _export_local_files(srctree, rd, destdir, srctreebase):
         fragment_path = os.path.join(destdir, fragment_fn)
         if _create_kconfig_diff(srctree, rd, fragment_path):
             if os.path.exists(fragment_path):
-                if fragment_fn not in new_set:
-                    new_set.append(fragment_fn)
-                # Copy fragment to local-files
-                if os.path.isdir(local_files_dir):
-                    shutil.copy2(fragment_path, local_files_dir)
+                if fragment_fn in removed:
+                    del removed[fragment_fn]
+                if fragment_fn not in updated and fragment_fn not in added:
+                    added[fragment_fn] = {}
             else:
-                if fragment_fn in new_set:
-                    new_set.remove(fragment_fn)
-                # Remove fragment from local-files
-                if os.path.exists(os.path.join(local_files_dir, fragment_fn)):
-                    os.unlink(os.path.join(local_files_dir, fragment_fn))
+                if fragment_fn in updated:
+                    revoved[fragment_fn] = updated[fragment_fn]
+                    del updated[fragment_fn]
 
     # Special handling for cml1, ccmake, etc bbclasses that generated
     # configuration fragment files that are consumed as source files
@@ -1537,42 +1490,13 @@ def _export_local_files(srctree, rd, destdir, srctreebase):
         if bb.data.inherits_class(frag_class, rd):
             srcpath = os.path.join(rd.getVar('WORKDIR'), frag_name)
             if os.path.exists(srcpath):
-                if frag_name not in new_set:
-                    new_set.append(frag_name)
+                if frag_name in removed:
+                    del removed[frag_name]
+                if frag_name not in updated:
+                    added[frag_name] = {}
                 # copy fragment into destdir
                 shutil.copy2(srcpath, destdir)
-                # copy fragment into local files if exists
-                if os.path.isdir(local_files_dir):
-                    shutil.copy2(srcpath, local_files_dir)
-
-    if new_set is not None:
-        for fname in new_set:
-            if fname in existing_files:
-                origpath = existing_files.pop(fname)
-                workpath = os.path.join(local_files_dir, fname)
-                if not filecmp.cmp(origpath, workpath):
-                    updated[fname] = {'path' : origpath}
-            elif fname != '.gitignore':
-                added[fname] = {}
-
-        workdir = rd.getVar('WORKDIR')
-        s = rd.getVar('S')
-        if not s.endswith(os.sep):
-            s += os.sep
-
-        if workdir != s:
-            # Handle files where subdir= was specified
-            for fname in list(existing_files.keys()):
-                # FIXME handle both subdir starting with BP and not?
-                fworkpath = os.path.join(workdir, fname)
-                if fworkpath.startswith(s):
-                    fpath = os.path.join(srctree, os.path.relpath(fworkpath, s))
-                    if os.path.exists(fpath):
-                        origpath = existing_files.pop(fname)
-                        if not filecmp.cmp(origpath, fpath):
-                            updated[fpath] = {'path' : origpath}
-
-        removed = existing_files
+
     return (updated, added, removed)
 
 
-- 
2.40.1


