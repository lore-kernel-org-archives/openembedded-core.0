Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77603C61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 11:08:37 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.16831.1700651311732210099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 03:08:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=2QpiM+8x;
 spf=pass (domain: baylibre.com, ip: 209.85.208.46, mailfrom: jstephan@baylibre.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-548f35e6a4bso2943672a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 03:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700651309; x=1701256109; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oG1t3oFhlmINHSvmNbMR4Q2ibaWAGvKYp/Rl3YOhbI=;
        b=2QpiM+8xQu0/1BqnOenrFdZ/z48O9amwHh/ryhaavuWem0VTUpjXtuec7oFkj8afLR
         SHTtUPXWLNOTPSf0uIEDuYMfDqbYXN3UTxiS2tJj2nOjjnuQ/+NS4TeGXxgZJ9Z440P9
         jsh6biXviQyLchsjB9ecUA6XyDSy0EbF9QiEmsUujLhk8D6C6a36c13I2UhiUiDQ8UoS
         DsagUlbAH/6FYPo6XYtyAmvrcmWdUJRYbvrhnDafALTUR/6TXX4+Tdws966fUgPn3Pgu
         O6yHMJQg+Y3RE56afaoEDZSF2AJ4SQWfYftTmaapqlHd4byT/X9u2fZNsZzsDc85FYBz
         PecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700651309; x=1701256109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7oG1t3oFhlmINHSvmNbMR4Q2ibaWAGvKYp/Rl3YOhbI=;
        b=Z4yLlJ0d8PxE4OWFfPiVNm6o2xQX2KIvuCij0Q+Ni9dT1CIANNLc6YKHR2WClYAwR7
         4lE7XMk9wHoecg9YtlEW/A6pyFjPgfiZX1jXlYxE2FShRlFWI4QGbgdOFgsUeO7kWcfh
         +OWBNFF1D4ImF7Qa8eypkS6bFs36m1ezj34VWvXmuUuMs5MQQhipvG6tcUJYY7uDcs4y
         xsjDeOK71OaBT1h1Yy9vJcNoZNRnzV6yxn5UDV3TF1SDgxxkFhrMnSpmXv13wPn6VO3I
         cLXmX8XLxVh1k8SJsOMbwc0uf8wV8q8NC30Brla8qOSM96KDNoukWI0dzzEtWnSL4iw1
         55SQ==
X-Gm-Message-State: AOJu0YykO5t0m5JWmeLOGkj1fnCmw3/UGTbugGveua/kIoRZY7hN85Jt
	EMLaHmUhbqYZWBZh/uQBiKDoT9XLEJS1WBjF2HKZ4g==
X-Google-Smtp-Source: AGHT+IEnKmXMFV0OdCDRtGSPdZNsCFxqdJwJRQ1Qdb06KkGBdgUnWDo1YzJDwtFaDGW/trY2z2Ptzg==
X-Received: by 2002:aa7:d603:0:b0:548:636f:398 with SMTP id c3-20020aa7d603000000b00548636f0398mr1527488edr.27.1700651309249;
        Wed, 22 Nov 2023 03:08:29 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id o23-20020aa7c7d7000000b0053e88c4d004sm5790713eds.66.2023.11.22.03.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 03:08:28 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 4/6] devtool: add support for git submodules
Date: Wed, 22 Nov 2023 12:08:16 +0100
Message-ID: <20231122110818.932618-5-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122110818.932618-1-jstephan@baylibre.com>
References: <20231122110818.932618-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 11:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191064

Adding the support of submodules required a lot of changes on the
internal data structures:
* initial_rev/startcommit used as a starting point for looking at new
  / updated commits was replaced by a dictionary where the keys are the
  submodule name ("." for main repo) and the values are the
  initial_rev/startcommit

* the extractPatches function now extracts patch for the main repo and
  for all submodules and stores them in a hierarchical way describing the
    submodule path

* store initial_rev/commit also for all submodules inside the recipe
  bbappend file

* _export_patches now returns dictionaries that contains the 'patchdir'
  parameter (if any). This parameter is used to add the correct
  'patchdir=' parameter on the recipe

Also, recipe can extract a secondary git tree inside the workdir.

By default, at the end of the do_patch function, there is a hook in
devtool that commits everything that was modified to have a clean
repository. It uses the command: "git add .; git commit ..."

The issue here is that, it adds the secondary git tree as a submodule
but in a wrong way. Doing "git add <git dir>" declares a submodule but do
not adds a url associated to it, and all following "git submodule foreach"
commands will fail.

So detect that a git tree was extracted inside S and correctly add it
using "git submodule add <url> <path>", so that it will be considered as a
regular git submodule

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/lib/oe/patch.py             |  64 ++++----
 meta/lib/oe/recipeutils.py       |  27 ++--
 scripts/lib/devtool/__init__.py  |  21 +++
 scripts/lib/devtool/standard.py  | 269 +++++++++++++++++++------------
 scripts/lib/devtool/upgrade.py   |  51 +++---
 scripts/lib/recipetool/append.py |   4 +-
 6 files changed, 270 insertions(+), 166 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index ff9afc9df9f..36157c72478 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -461,41 +461,43 @@ class GitApplyTree(PatchTree):
         return (tmpfile, cmd)
 
     @staticmethod
-    def extractPatches(tree, startcommit, outdir, paths=None):
+    def extractPatches(tree, startcommits, outdir, paths=None):
         import tempfile
         import shutil
         tempdir = tempfile.mkdtemp(prefix='oepatch')
         try:
-            shellcmd = ["git", "format-patch", "--no-signature", "--no-numbered", startcommit, "-o", tempdir]
-            if paths:
-                shellcmd.append('--')
-                shellcmd.extend(paths)
-            out = runcmd(["sh", "-c", " ".join(shellcmd)], tree)
-            if out:
-                for srcfile in out.split():
-                    for encoding in ['utf-8', 'latin-1']:
-                        patchlines = []
-                        outfile = None
-                        try:
-                            with open(srcfile, 'r', encoding=encoding) as f:
-                                for line in f:
-                                    if line.startswith(GitApplyTree.patch_line_prefix):
-                                        outfile = line.split()[-1].strip()
-                                        continue
-                                    if line.startswith(GitApplyTree.ignore_commit_prefix):
-                                        continue
-                                    patchlines.append(line)
-                        except UnicodeDecodeError:
-                            continue
-                        break
-                    else:
-                        raise PatchError('Unable to find a character encoding to decode %s' % srcfile)
-
-                    if not outfile:
-                        outfile = os.path.basename(srcfile)
-                    with open(os.path.join(outdir, outfile), 'w') as of:
-                        for line in patchlines:
-                            of.write(line)
+            for name, rev in startcommits.items():
+                shellcmd = ["git", "format-patch", "--no-signature", "--no-numbered", rev, "-o", tempdir]
+                if paths:
+                    shellcmd.append('--')
+                    shellcmd.extend(paths)
+                out = runcmd(["sh", "-c", " ".join(shellcmd)], os.path.join(tree, name))
+                if out:
+                    for srcfile in out.split():
+                        for encoding in ['utf-8', 'latin-1']:
+                            patchlines = []
+                            outfile = None
+                            try:
+                                with open(srcfile, 'r', encoding=encoding) as f:
+                                    for line in f:
+                                        if line.startswith(GitApplyTree.patch_line_prefix):
+                                            outfile = line.split()[-1].strip()
+                                            continue
+                                        if line.startswith(GitApplyTree.ignore_commit_prefix):
+                                            continue
+                                        patchlines.append(line)
+                            except UnicodeDecodeError:
+                                continue
+                            break
+                        else:
+                            raise PatchError('Unable to find a character encoding to decode %s' % srcfile)
+
+                        if not outfile:
+                            outfile = os.path.basename(srcfile)
+                        bb.utils.mkdirhier(os.path.join(outdir, name))
+                        with open(os.path.join(outdir, name, outfile), 'w') as of:
+                            for line in patchlines:
+                                of.write(line)
         finally:
             shutil.rmtree(tempdir)
 
diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 3336db8ab06..58776f4a9a7 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -672,11 +672,11 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
         destlayerdir: base directory of the layer to place the bbappend in
             (subdirectory path from there will be determined automatically)
         srcfiles: dict of source files to add to SRC_URI, where the value
-            is the full path to the file to be added, and the value is the
-            original filename as it would appear in SRC_URI or None if it
-            isn't already present. You may pass None for this parameter if
-            you simply want to specify your own content via the extralines
-            parameter.
+            is the full path to the file to be added, and the value is a
+            dict with 'path' key containing the original filename as it
+            would appear in SRC_URI or None if it isn't already present.
+            You may pass None for this parameter if you simply want to specify
+            your own content via the extralines parameter.
         install: dict mapping entries in srcfiles to a tuple of two elements:
             install path (*without* ${D} prefix) and permission value (as a
             string, e.g. '0644').
@@ -763,10 +763,9 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
     copyfiles = {}
     if srcfiles:
         instfunclines = []
-        for i, (newfile, origsrcfile) in enumerate(srcfiles.items()):
-            srcfile = origsrcfile
+        for i, (newfile, param) in enumerate(srcfiles.items()):
             srcurientry = None
-            if not srcfile:
+            if not 'path' in param or not param['path']:
                 srcfile = os.path.basename(newfile)
                 srcurientry = 'file://%s' % srcfile
                 if params and params[i]:
@@ -778,7 +777,10 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
                         appendline('SRC_URI:append%s' % appendoverride, '=', ' ' + srcurientry)
                     else:
                         appendline('SRC_URI', '+=', srcurientry)
-            copyfiles[newfile] = srcfile
+                param['path'] = srcfile
+            else:
+                srcfile = param['path']
+            copyfiles[newfile] = param
             if install:
                 institem = install.pop(newfile, None)
                 if institem:
@@ -901,7 +903,12 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
             outdir = redirect_output
         else:
             outdir = appenddir
-        for newfile, srcfile in copyfiles.items():
+        for newfile, param in copyfiles.items():
+            srcfile = param['path']
+            patchdir = param.get('patchdir', ".")
+
+            if patchdir != ".":
+                newfile = os.path.join(os.path.split(newfile)[0], patchdir, os.path.split(newfile)[1])
             filedest = os.path.join(outdir, destsubdir, os.path.basename(srcfile))
             if os.path.abspath(newfile) != os.path.abspath(filedest):
                 if newfile.startswith(tempfile.gettempdir()):
diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index e9e88a55336..b4f998a5bc4 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -233,6 +233,27 @@ def setup_git_repo(repodir, version, devbranch, basetag='devtool-base', d=None):
     bb.process.run('git checkout -b %s' % devbranch, cwd=repodir)
     bb.process.run('git tag -f %s' % basetag, cwd=repodir)
 
+    # if recipe unpacks another git repo inside S, we need to declare it as a regular git submodule now,
+    # so we will be able to tag branches on it and extract patches when doing finish/update on the recipe
+    stdout, _ = bb.process.run("git status --porcelain", cwd=repodir)
+    found = False
+    for line in stdout.splitlines():
+        if line.endswith("/"):
+            new_dir = line.split()[1]
+            for root, dirs, files in os.walk(os.path.join(repodir, new_dir)):
+                if ".git" in dirs + files:
+                    (stdout, _) = bb.process.run('git remote', cwd=root)
+                    remote = stdout.splitlines()[0]
+                    (stdout, _) = bb.process.run('git remote get-url %s' % remote, cwd=root)
+                    remote_url = stdout.splitlines()[0]
+                    logger.error(os.path.relpath(os.path.join(root, ".."), root))
+                    bb.process.run('git submodule add %s %s' % (remote_url, os.path.relpath(root, os.path.join(root, ".."))), cwd=os.path.join(root, ".."))
+                    found = True
+                if found:
+                    useroptions = []
+                    oe.patch.GitApplyTree.gitCommandUserOptions(useroptions, d=d)
+                    bb.process.run('git %s commit -m "Adding additionnal submodule from SRC_URI\n\n%s"' % (' '.join(useroptions), oe.patch.GitApplyTree.ignore_commit_prefix), cwd=os.path.join(root, ".."))
+                    found = False
     if os.path.exists(os.path.join(repodir, '.gitmodules')):
         bb.process.run('git submodule foreach --recursive  "git tag -f %s"' % basetag, cwd=repodir)
 
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 55fa38ccfb8..ad6e3462795 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -234,10 +234,14 @@ def add(args, config, basepath, workspace):
         if args.fetchuri and not args.no_git:
             setup_git_repo(srctree, args.version, 'devtool', d=tinfoil.config_data)
 
-        initial_rev = None
+        initial_rev = {}
         if os.path.exists(os.path.join(srctree, '.git')):
             (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srctree)
-            initial_rev = stdout.rstrip()
+            initial_rev["."] = stdout.rstrip()
+            (stdout, _) = bb.process.run('git submodule --quiet foreach --recursive  \'echo `git rev-parse HEAD` $PWD\'', cwd=srctree)
+            for line in stdout.splitlines():
+                (rev, submodule) = line.split()
+                initial_rev[os.path.relpath(submodule, srctree)] = rev
 
         if args.src_subdir:
             srctree = os.path.join(srctree, args.src_subdir)
@@ -251,7 +255,8 @@ def add(args, config, basepath, workspace):
             if b_is_s:
                 f.write('EXTERNALSRC_BUILD = "%s"\n' % srctree)
             if initial_rev:
-                f.write('\n# initial_rev: %s\n' % initial_rev)
+                for key, value in initial_rev.items():
+                    f.write('\n# initial_rev %s: %s\n' % (key, value))
 
             if args.binary:
                 f.write('do_install:append() {\n')
@@ -823,8 +828,8 @@ def modify(args, config, basepath, workspace):
 
         _check_compatible_recipe(pn, rd)
 
-        initial_rev = None
-        commits = []
+        initial_revs = {}
+        commits = {}
         check_commits = False
 
         if bb.data.inherits_class('kernel-yocto', rd):
@@ -880,15 +885,23 @@ def modify(args, config, basepath, workspace):
                 args.no_extract = True
 
         if not args.no_extract:
-            initial_rev, _ = _extract_source(srctree, args.keep_temp, args.branch, False, config, basepath, workspace, args.fixed_setup, rd, tinfoil, no_overrides=args.no_overrides)
-            if not initial_rev:
+            initial_revs["."], _ = _extract_source(srctree, args.keep_temp, args.branch, False, config, basepath, workspace, args.fixed_setup, rd, tinfoil, no_overrides=args.no_overrides)
+            if not initial_revs["."]:
                 return 1
             logger.info('Source tree extracted to %s' % srctree)
+
             if os.path.exists(os.path.join(srctree, '.git')):
                 # Get list of commits since this revision
-                (stdout, _) = bb.process.run('git rev-list --reverse %s..HEAD' % initial_rev, cwd=srctree)
-                commits = stdout.split()
+                (stdout, _) = bb.process.run('git rev-list --reverse %s..HEAD' % initial_revs["."], cwd=srctree)
+                commits["."] = stdout.split()
                 check_commits = True
+                (stdout, _) = bb.process.run('git submodule --quiet foreach --recursive  \'echo `git rev-parse devtool-base` $PWD\'', cwd=srctree)
+                for line in stdout.splitlines():
+                    (rev, submodule_path) = line.split()
+                    submodule = os.path.relpath(submodule_path, srctree)
+                    initial_revs[submodule] = rev
+                    (stdout, _) = bb.process.run('git rev-list --reverse devtool-base..HEAD', cwd=submodule_path)
+                    commits[submodule] = stdout.split()
         else:
             if os.path.exists(os.path.join(srctree, '.git')):
                 # Check if it's a tree previously extracted by us. This is done
@@ -905,11 +918,11 @@ def modify(args, config, basepath, workspace):
                 for line in stdout.splitlines():
                     if line.startswith('*'):
                         (stdout, _) = bb.process.run('git rev-parse devtool-base', cwd=srctree)
-                        initial_rev = stdout.rstrip()
-                if not initial_rev:
+                        initial_revs["."] = stdout.rstrip()
+                if not initial_revs["."]:
                     # Otherwise, just grab the head revision
                     (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srctree)
-                    initial_rev = stdout.rstrip()
+                    initial_revs["."] = stdout.rstrip()
 
         branch_patches = {}
         if check_commits:
@@ -976,10 +989,11 @@ def modify(args, config, basepath, workspace):
                 '        ln -sfT ${KCONFIG_CONFIG_ROOTDIR}/.config ${S}/.config.new\n'
                 '    fi\n'
                 '}\n')
-            if initial_rev:
-                f.write('\n# initial_rev: %s\n' % initial_rev)
-                for commit in commits:
-                    f.write('# commit: %s\n' % commit)
+            if initial_revs:
+                for name, rev in initial_revs.items():
+                        f.write('\n# initial_rev %s: %s\n' % (name, rev))
+                        for commit in commits[name]:
+                            f.write('# commit %s: %s\n' % (name, commit))
             if branch_patches:
                 for branch in branch_patches:
                     if branch == args.branch:
@@ -1202,44 +1216,56 @@ def _get_patchset_revs(srctree, recipe_path, initial_rev=None, force_patch_refre
     branchname = stdout.rstrip()
 
     # Parse initial rev from recipe if not specified
-    commits = []
+    commits = {}
     patches = []
+    initial_revs = {}
     with open(recipe_path, 'r') as f:
         for line in f:
-            if line.startswith('# initial_rev:'):
-                if not initial_rev:
-                    initial_rev = line.split(':')[-1].strip()
-            elif line.startswith('# commit:') and not force_patch_refresh:
-                commits.append(line.split(':')[-1].strip())
-            elif line.startswith('# patches_%s:' % branchname):
-                patches = line.split(':')[-1].strip().split(',')
-
-    update_rev = initial_rev
-    changed_revs = None
-    if initial_rev:
+            pattern = r'^#\s.*\s(.*):\s([0-9a-fA-F]+)$'
+            match = re.search(pattern, line)
+            if match:
+                name = match.group(1)
+                rev = match.group(2)
+                if line.startswith('# initial_rev'):
+                    if not (name == "." and initial_rev):
+                        initial_revs[name] = rev
+                elif line.startswith('# commit') and not force_patch_refresh:
+                    if name not in commits:
+                        commits[name] = [rev]
+                    else:
+                        commits[name].append(rev)
+                elif line.startswith('# patches_%s:' % branchname):
+                    patches = line.split(':')[-1].strip().split(',')
+
+    update_revs = dict(initial_revs)
+    changed_revs = {}
+    for name, rev in initial_revs.items():
         # Find first actually changed revision
         stdout, _ = bb.process.run('git rev-list --reverse %s..HEAD' %
-                                   initial_rev, cwd=srctree)
+                                   rev, cwd=os.path.join(srctree, name))
         newcommits = stdout.split()
-        for i in range(min(len(commits), len(newcommits))):
-            if newcommits[i] == commits[i]:
-                update_rev = commits[i]
+        if name in commits:
+            for i in range(min(len(commits[name]), len(newcommits))):
+                if newcommits[i] == commits[name][i]:
+                    update_revs[name] = commits[name][i]
 
         try:
             stdout, _ = bb.process.run('git cherry devtool-patched',
-                                        cwd=srctree)
+                                        cwd=os.path.join(srctree, name))
         except bb.process.ExecutionError as err:
             stdout = None
 
         if stdout is not None and not force_patch_refresh:
-            changed_revs = []
             for line in stdout.splitlines():
                 if line.startswith('+ '):
                     rev = line.split()[1]
                     if rev in newcommits:
-                        changed_revs.append(rev)
+                        if name not in changed_revs:
+                            changed_revs[name] = [rev]
+                        else:
+                            changed_revs[name].append(rev)
 
-    return initial_rev, update_rev, changed_revs, patches
+    return initial_revs, update_revs, changed_revs, patches
 
 def _remove_file_entries(srcuri, filelist):
     """Remove file:// entries from SRC_URI"""
@@ -1294,14 +1320,17 @@ def _remove_source_files(append, files, destpath, no_report_remove=False, dry_ru
                         raise
 
 
-def _export_patches(srctree, rd, start_rev, destdir, changed_revs=None):
+def _export_patches(srctree, rd, start_revs, destdir, changed_revs=None):
     """Export patches from srctree to given location.
        Returns three-tuple of dicts:
          1. updated - patches that already exist in SRCURI
          2. added - new patches that don't exist in SRCURI
          3  removed - patches that exist in SRCURI but not in exported patches
-      In each dict the key is the 'basepath' of the URI and value is the
-      absolute path to the existing file in recipe space (if any).
+       In each dict the key is the 'basepath' of the URI and value is:
+         - for updated and added dicts, a dict with 2 optionnal keys:
+            - 'path': the absolute path to the existing file in recipe space (if any)
+            - 'patchdir': the directory in wich the patch should be applied (if any)
+         - for removed dict, the absolute path to the existing file in recipe space
     """
     import oe.recipeutils
     from oe.patch import GitApplyTree
@@ -1315,54 +1344,60 @@ def _export_patches(srctree, rd, start_rev, destdir, changed_revs=None):
 
     # Generate patches from Git, exclude local files directory
     patch_pathspec = _git_exclude_path(srctree, 'oe-local-files')
-    GitApplyTree.extractPatches(srctree, start_rev, destdir, patch_pathspec)
-
-    new_patches = sorted(os.listdir(destdir))
-    for new_patch in new_patches:
-        # Strip numbering from patch names. If it's a git sequence named patch,
-        # the numbers might not match up since we are starting from a different
-        # revision This does assume that people are using unique shortlog
-        # values, but they ought to be anyway...
-        new_basename = seqpatch_re.match(new_patch).group(2)
-        match_name = None
-        for old_patch in existing_patches:
-            old_basename = seqpatch_re.match(old_patch).group(2)
-            old_basename_splitext = os.path.splitext(old_basename)
-            if old_basename.endswith(('.gz', '.bz2', '.Z')) and old_basename_splitext[0] == new_basename:
-                old_patch_noext = os.path.splitext(old_patch)[0]
-                match_name = old_patch_noext
-                break
-            elif new_basename == old_basename:
-                match_name = old_patch
-                break
-        if match_name:
-            # Rename patch files
-            if new_patch != match_name:
-                bb.utils.rename(os.path.join(destdir, new_patch),
-                          os.path.join(destdir, match_name))
-            # Need to pop it off the list now before checking changed_revs
-            oldpath = existing_patches.pop(old_patch)
-            if changed_revs is not None:
-                # Avoid updating patches that have not actually changed
-                with open(os.path.join(destdir, match_name), 'r') as f:
-                    firstlineitems = f.readline().split()
-                    # Looking for "From <hash>" line
-                    if len(firstlineitems) > 1 and len(firstlineitems[1]) == 40:
-                        if not firstlineitems[1] in changed_revs:
-                            continue
-            # Recompress if necessary
-            if oldpath.endswith(('.gz', '.Z')):
-                bb.process.run(['gzip', match_name], cwd=destdir)
-                if oldpath.endswith('.gz'):
-                    match_name += '.gz'
-                else:
-                    match_name += '.Z'
-            elif oldpath.endswith('.bz2'):
-                bb.process.run(['bzip2', match_name], cwd=destdir)
-                match_name += '.bz2'
-            updated[match_name] = oldpath
-        else:
-            added[new_patch] = None
+    GitApplyTree.extractPatches(srctree, start_revs, destdir, patch_pathspec)
+    for dirpath, dirnames, filenames in os.walk(destdir):
+        new_patches = filenames
+        reldirpath = os.path.relpath(dirpath, destdir)
+        for new_patch in new_patches:
+            # Strip numbering from patch names. If it's a git sequence named patch,
+            # the numbers might not match up since we are starting from a different
+            # revision This does assume that people are using unique shortlog
+            # values, but they ought to be anyway...
+            new_basename = seqpatch_re.match(new_patch).group(2)
+            match_name = None
+            for old_patch in existing_patches:
+                old_basename = seqpatch_re.match(old_patch).group(2)
+                old_basename_splitext = os.path.splitext(old_basename)
+                if old_basename.endswith(('.gz', '.bz2', '.Z')) and old_basename_splitext[0] == new_basename:
+                    old_patch_noext = os.path.splitext(old_patch)[0]
+                    match_name = old_patch_noext
+                    break
+                elif new_basename == old_basename:
+                    match_name = old_patch
+                    break
+            if match_name:
+                # Rename patch files
+                if new_patch != match_name:
+                    bb.utils.rename(os.path.join(destdir, new_patch),
+                              os.path.join(destdir, match_name))
+                # Need to pop it off the list now before checking changed_revs
+                oldpath = existing_patches.pop(old_patch)
+                if changed_revs is not None and dirpath in changed_revs:
+                    # Avoid updating patches that have not actually changed
+                    with open(os.path.join(dirpath, match_name), 'r') as f:
+                        firstlineitems = f.readline().split()
+                        # Looking for "From <hash>" line
+                        if len(firstlineitems) > 1 and len(firstlineitems[1]) == 40:
+                            if not firstlineitems[1] in changed_revs[dirpath]:
+                                continue
+                # Recompress if necessary
+                if oldpath.endswith(('.gz', '.Z')):
+                    bb.process.run(['gzip', match_name], cwd=destdir)
+                    if oldpath.endswith('.gz'):
+                        match_name += '.gz'
+                    else:
+                        match_name += '.Z'
+                elif oldpath.endswith('.bz2'):
+                    bb.process.run(['bzip2', match_name], cwd=destdir)
+                    match_name += '.bz2'
+                updated[match_name] = {'path' : oldpath}
+                if reldirpath != ".":
+                    updated[match_name]['patchdir'] = reldirpath
+            else:
+                added[new_patch] = {}
+                if reldirpath != ".":
+                    added[new_patch]['patchdir'] = reldirpath
+
     return (updated, added, existing_patches)
 
 
@@ -1534,6 +1569,7 @@ def _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerdir, wi
     old_srcrev = rd.getVar('SRCREV') or ''
     if old_srcrev == "INVALID":
             raise DevtoolError('Update mode srcrev is only valid for recipe fetched from an SCM repository')
+    old_srcrev = {'.': old_srcrev}
 
     # Get HEAD revision
     try:
@@ -1566,7 +1602,7 @@ def _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerdir, wi
             logger.debug('Patches: update %s, new %s, delete %s' % (dict(upd_p), dict(new_p), dict(del_p)))
 
             # Remove deleted local files and "overlapping" patches
-            remove_files = list(del_f.values()) + list(upd_p.values()) + list(del_p.values())
+            remove_files = list(del_f.values()) + [value["path"] for value in upd_p.values() if "path" in value] + [value["path"] for value in del_p.values() if "path" in value]
             if remove_files:
                 removedentries = _remove_file_entries(srcuri, remove_files)[0]
                 update_srcuri = True
@@ -1635,15 +1671,15 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
     else:
         patchdir_params = {'patchdir': relpatchdir}
 
-    def srcuri_entry(basepath):
+    def srcuri_entry(basepath, patchdir_params):
         if patchdir_params:
             paramstr = ';' + ';'.join('%s=%s' % (k,v) for k,v in patchdir_params.items())
         else:
             paramstr = ''
         return 'file://%s%s' % (basepath, paramstr)
 
-    initial_rev, update_rev, changed_revs, filter_patches = _get_patchset_revs(srctree, append, initial_rev, force_patch_refresh)
-    if not initial_rev:
+    initial_revs, update_revs, changed_revs, filter_patches = _get_patchset_revs(srctree, append, initial_rev, force_patch_refresh)
+    if not initial_revs:
         raise DevtoolError('Unable to find initial revision - please specify '
                            'it with --initial-rev')
 
@@ -1661,11 +1697,11 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
 
         # Get updated patches from source tree
         patches_dir = tempfile.mkdtemp(dir=tempdir)
-        upd_p, new_p, _ = _export_patches(srctree, rd, update_rev,
+        upd_p, new_p, _ = _export_patches(srctree, rd, update_revs,
                                           patches_dir, changed_revs)
         # Get all patches from source tree and check if any should be removed
         all_patches_dir = tempfile.mkdtemp(dir=tempdir)
-        _, _, del_p = _export_patches(srctree, rd, initial_rev,
+        _, _, del_p = _export_patches(srctree, rd, initial_revs,
                                       all_patches_dir)
         logger.debug('Pre-filtering: update: %s, new: %s' % (dict(upd_p), dict(new_p)))
         if filter_patches:
@@ -1680,18 +1716,31 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
         updaterecipe = False
         destpath = None
         srcuri = (rd.getVar('SRC_URI', False) or '').split()
+
         if appendlayerdir:
             files = OrderedDict((os.path.join(local_files_dir, key), val) for
                          key, val in list(upd_f.items()) + list(new_f.items()))
             files.update(OrderedDict((os.path.join(patches_dir, key), val) for
                               key, val in list(upd_p.items()) + list(new_p.items())))
+
+            params = []
+            for file, param in files.items():
+                patchdir_param = dict(patchdir_params)
+                patchdir = param.get('patchdir', ".")
+                if patchdir != "." :
+                    if patchdir_param:
+                       patchdir_param['patchdir'] += patchdir
+                    else:
+                        patchdir_param['patchdir'] = patchdir
+                params.append(patchdir_param)
+
             if files or remove_files:
                 removevalues = None
                 if remove_files:
                     removedentries, remaining = _remove_file_entries(
                                                     srcuri, remove_files)
                     if removedentries or remaining:
-                        remaining = [srcuri_entry(os.path.basename(item)) for
+                        remaining = [srcuri_entry(os.path.basename(item), patchdir_params) for
                                      item in remaining]
                         removevalues = {'SRC_URI': removedentries + remaining}
                 appendfile, destpath = oe.recipeutils.bbappend_recipe(
@@ -1699,7 +1748,7 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
                                 wildcardver=wildcard_version,
                                 removevalues=removevalues,
                                 redirect_output=dry_run_outdir,
-                                params=[patchdir_params] * len(files))
+                                params=params)
             else:
                 logger.info('No patches or local source files needed updating')
         else:
@@ -1716,14 +1765,22 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
                     _move_file(os.path.join(local_files_dir, basepath), path,
                                dry_run_outdir=dry_run_outdir, base_outdir=recipedir)
                 updatefiles = True
-            for basepath, path in upd_p.items():
-                patchfn = os.path.join(patches_dir, basepath)
+            for basepath, param in upd_p.items():
+                path = param['path']
+                patchdir = param.get('patchdir', ".")
+                if patchdir != "." :
+                    patchdir_param = dict(patchdir_params)
+                    if patchdir_param:
+                       patchdir_param['patchdir'] += patchdir
+                    else:
+                        patchdir_param['patchdir'] = patchdir
+                patchfn = os.path.join(patches_dir, patchdir, basepath)
                 if os.path.dirname(path) + '/' == dl_dir:
                     # This is a a downloaded patch file - we now need to
                     # replace the entry in SRC_URI with our local version
                     logger.info('Replacing remote patch %s with updated local version' % basepath)
                     path = os.path.join(files_dir, basepath)
-                    _replace_srcuri_entry(srcuri, basepath, srcuri_entry(basepath))
+                    _replace_srcuri_entry(srcuri, basepath, srcuri_entry(basepath, patchdir_param))
                     updaterecipe = True
                 else:
                     logger.info('Updating patch %s%s' % (basepath, dry_run_suffix))
@@ -1737,15 +1794,23 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
                            os.path.join(files_dir, basepath),
                            dry_run_outdir=dry_run_outdir,
                            base_outdir=recipedir)
-                srcuri.append(srcuri_entry(basepath))
+                srcuri.append(srcuri_entry(basepath, patchdir_params))
                 updaterecipe = True
-            for basepath, path in new_p.items():
+            for basepath, param in new_p.items():
+                patchdir = param.get('patchdir', ".")
                 logger.info('Adding new patch %s%s' % (basepath, dry_run_suffix))
-                _move_file(os.path.join(patches_dir, basepath),
+                _move_file(os.path.join(patches_dir, patchdir, basepath),
                            os.path.join(files_dir, basepath),
                            dry_run_outdir=dry_run_outdir,
                            base_outdir=recipedir)
-                srcuri.append(srcuri_entry(basepath))
+                params = dict(patchdir_params)
+                if patchdir != "." :
+                    if params:
+                       params['patchdir'] += patchdir
+                    else:
+                        params['patchdir'] = patchdir
+
+                srcuri.append(srcuri_entry(basepath, params))
                 updaterecipe = True
             # Update recipe, if needed
             if _remove_file_entries(srcuri, remove_files)[0]:
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 9cd50be3a25..10827a762b4 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -90,7 +90,7 @@ def _rename_recipe_files(oldrecipe, bpn, oldpv, newpv, path):
     _rename_recipe_dirs(oldpv, newpv, path)
     return _rename_recipe_file(oldrecipe, bpn, oldpv, newpv, path)
 
-def _write_append(rc, srctreebase, srctree, same_dir, no_same_dir, rev, copied, workspace, d):
+def _write_append(rc, srctreebase, srctree, same_dir, no_same_dir, revs, copied, workspace, d):
     """Writes an append file"""
     if not os.path.exists(rc):
         raise DevtoolError("bbappend not created because %s does not exist" % rc)
@@ -119,8 +119,9 @@ def _write_append(rc, srctreebase, srctree, same_dir, no_same_dir, rev, copied,
         if b_is_s:
             f.write('EXTERNALSRC_BUILD:pn-%s = "%s"\n' % (pn, srctree))
         f.write('\n')
-        if rev:
-            f.write('# initial_rev: %s\n' % rev)
+        if revs:
+            for name, rev in revs.items():
+                f.write('# initial_rev %s: %s\n' % (name, rev))
         if copied:
             f.write('# original_path: %s\n' % os.path.dirname(d.getVar('FILE')))
             f.write('# original_files: %s\n' % ' '.join(copied))
@@ -182,10 +183,15 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
     uri, rev = _get_uri(crd)
     if srcrev:
         rev = srcrev
+    paths = [srctree]
     if uri.startswith('git://') or uri.startswith('gitsm://'):
         __run('git fetch')
         __run('git checkout %s' % rev)
         __run('git tag -f devtool-base-new')
+        __run('git submodule update --recursive')
+        __run('git submodule foreach \'git tag -f devtool-base-new\'')
+        (stdout, _) = __run('git submodule --quiet foreach \'echo $sm_path\'')
+        paths += [os.path.join(srctree, p) for p in stdout.splitlines()]
         md5 = None
         sha256 = None
         _, _, _, _, _, params = bb.fetch2.decodeurl(uri)
@@ -256,29 +262,32 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
         __run('git %s commit -q -m "Commit of upstream changes at version %s" --allow-empty' % (' '.join(useroptions), newpv))
         __run('git tag -f devtool-base-%s' % newpv)
 
-    (stdout, _) = __run('git rev-parse HEAD')
-    rev = stdout.rstrip()
+    revs = {}
+    for path in paths:
+        (stdout, _) = _run('git rev-parse HEAD', cwd=path)
+        revs[os.path.relpath(path,srctree)] = stdout.rstrip()
 
     if no_patch:
         patches = oe.recipeutils.get_recipe_patches(crd)
         if patches:
             logger.warning('By user choice, the following patches will NOT be applied to the new source tree:\n  %s' % '\n  '.join([os.path.basename(patch) for patch in patches]))
     else:
-        __run('git checkout devtool-patched -b %s' % branch)
-        (stdout, _) = __run('git branch --list devtool-override-*')
-        branches_to_rebase = [branch] + stdout.split()
-        for b in branches_to_rebase:
-            logger.info("Rebasing {} onto {}".format(b, rev))
-            __run('git checkout %s' % b)
-            try:
-                __run('git rebase %s' % rev)
-            except bb.process.ExecutionError as e:
-                if 'conflict' in e.stdout:
-                    logger.warning('Command \'%s\' failed:\n%s\n\nYou will need to resolve conflicts in order to complete the upgrade.' % (e.command, e.stdout.rstrip()))
-                    __run('git rebase --abort')
-                else:
-                    logger.warning('Command \'%s\' failed:\n%s' % (e.command, e.stdout))
-        __run('git checkout %s' % branch)
+        for path in paths:
+            _run('git checkout devtool-patched -b %s' % branch, cwd=path)
+            (stdout, _) = _run('git branch --list devtool-override-*', cwd=path)
+            branches_to_rebase = [branch] + stdout.split()
+            for b in branches_to_rebase:
+                logger.info("Rebasing {} onto {}".format(b, revs[os.path.relpath(path,srctree)]))
+                _run('git checkout %s' % b, cwd=path)
+                try:
+                    _run('git rebase %s' % revs[os.path.relpath(path, srctree)], cwd=path)
+                except bb.process.ExecutionError as e:
+                    if 'conflict' in e.stdout:
+                        logger.warning('Command \'%s\' failed:\n%s\n\nYou will need to resolve conflicts in order to complete the upgrade.' % (e.command, e.stdout.rstrip()))
+                        _run('git rebase --abort', cwd=path)
+                    else:
+                        logger.warning('Command \'%s\' failed:\n%s' % (e.command, e.stdout))
+            _run('git checkout %s' % branch, cwd=path)
 
     if tmpsrctree:
         if keep_temp:
@@ -288,7 +297,7 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
             if tmpdir != tmpsrctree:
                 shutil.rmtree(tmpdir)
 
-    return (rev, md5, sha256, srcbranch, srcsubdir_rel)
+    return (revs, md5, sha256, srcbranch, srcsubdir_rel)
 
 def _add_license_diff_to_recipe(path, diff):
     notice_text = """# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index 9dbb1cc4b5a..4b6a7112c2b 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -299,7 +299,7 @@ def appendfile(args):
                 if st.st_mode & stat.S_IXUSR:
                     perms = '0755'
             install = {args.newfile: (args.targetpath, perms)}
-        oe.recipeutils.bbappend_recipe(rd, args.destlayer, {args.newfile: sourcepath}, install, wildcardver=args.wildcard_version, machine=args.machine)
+        oe.recipeutils.bbappend_recipe(rd, args.destlayer, {args.newfile: {'path' : sourcepath}}, install, wildcardver=args.wildcard_version, machine=args.machine)
         tinfoil.modified_files()
         return 0
     else:
@@ -353,7 +353,7 @@ def appendsrc(args, files, rd, extralines=None):
                 logger.warning('{0!r} is already in SRC_URI, not adding'.format(source_uri))
         else:
             extralines.append('SRC_URI += {0}'.format(source_uri))
-        copyfiles[newfile] = srcfile
+        copyfiles[newfile] = {'path' : srcfile}
 
     oe.recipeutils.bbappend_recipe(rd, args.destlayer, copyfiles, None, wildcardver=args.wildcard_version, machine=args.machine, extralines=extralines)
     tinfoil.modified_files()
-- 
2.42.0


