Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3171471F1B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 13:30:16 +0000 (UTC)
Received: by igbhn18 with SMTP id hn18so831999igb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 06:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=JNW5hsevQxHY7dymgW2Seie9IlU1ol9GWdBt/4TKBhI=;
	b=mpiLrM0FOfCPSd9BKu2/N9zvUYXIL8V9gjdEbYQ1JT2IyUpXqerxtpNxJpfMIWRGAZ
	zFrLcwD0b9c27hZOQuXfz/xEJKeQ8gaRx2zPNg1x7SjPCIqFg8QiZOrEyrKz30t3SPkO
	hHcn9EOWy7Xl/tHQrN3VNqMbtzMa+zEV56B53CYpmr1N2ODBlLXD6gi5Mj7MVR5T7vz1
	MLtqAoCzBZc1u2ymyK6u808EAvbdb39FZ/u4ef6kp/AILhP1ZA3MqFZQ5+Yl+24ho0R3
	dOSz4FBqqEKZH/P4a9Y60O0a4WaawRwWcU6Q4KXJdKO0JDVbETakVmiRhY54XFXlR1wZ
	KTbw==
X-Gm-Message-State: ALoCoQmwAAahe0DcBhyWIctoEeJc0R164n1fNyz+Y0stJYEyNdua+VnZuO5OdhfBUgiHdqYqT/l0
X-Received: by 10.107.163.65 with SMTP id m62mr48601788ioe.40.1426253418177;
	Fri, 13 Mar 2015 06:30:18 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p5DE8C8C2.dip0.t-ipconnect.de.
	[93.232.200.194])
	by mx.google.com with ESMTPSA id h15sm1257487ioh.27.2015.03.13.06.30.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Mar 2015 06:30:17 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Fri, 13 Mar 2015 14:29:35 +0100
Message-Id: <169fcd4d9b597c08236587323c09424e3a5d905d.1426252888.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <a9fe203d338f966d5afe631bd7956ee8232a6bf4.1426252888.git.patrick.ohly@intel.com>
References: <a9fe203d338f966d5afe631bd7956ee8232a6bf4.1426252888.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1426252888.git.patrick.ohly@intel.com>
References: <cover.1426252888.git.patrick.ohly@intel.com>
Subject: [PATCH 06/11] combo-layer: init with full history
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
X-List-Received-Date: Fri, 13 Mar 2015 13:30:18 -0000

The new --history parameter enables a new mode in "combo-layer init"
where it copies the entire history of the components into the new
combined repository. This also imports merge commits.

Moving into a destination directory and applying commit hooks
is done via "git filter-branch" of the upstream branch. File
filtering uses the same code as before and just applies it
to that filtered branch to create the final commit which
then gets merged into the master branch of the new repository.

When multiple components are involved, they all get merged
into a single commit with an octopus merge. This depends
on a common ancestor, which is grafted onto the filtered
branches via .git/info/grafts.

These grafts are currently left in place. However, they do not get
pushed, so the local view on the entire history (all branches rooted
in the initial, empty commit, temporarily diverging and then
converging) is not the same as what others will see (branches starting
independently and converging). Perhaps "git replace" should be used
instead.

The final commit needs to be done manually, as before. A commit
message with some tracking information is ready for use as-is. This
information should be sufficient to implement also "combo-layer
update" using this approach, if desired. The advantage would be that
merge commits with conflict resolution would not longer break
the update.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/combo-layer | 187 ++++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 174 insertions(+), 13 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 8ed9be8..d11274e 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -25,6 +25,7 @@ import os, sys
 import optparse
 import logging
 import subprocess
+import tempfile
 import ConfigParser
 import re
 from collections import OrderedDict
@@ -190,6 +191,11 @@ def action_init(conf, args):
             subprocess.check_call("git clone %s %s" % (conf.repos[name]['src_uri'], ldir), shell=True)
     if not os.path.exists(".git"):
         runcmd("git init")
+        if conf.history:
+            # Need a common ref for all trees.
+            runcmd('git commit -m "initial empty commit" --allow-empty')
+            startrev = runcmd('git rev-parse master').strip()
+
         for name in conf.repos:
             repo = conf.repos[name]
             ldir = repo['local_repo_dir']
@@ -205,6 +211,25 @@ def action_init(conf, args):
                 lastrev = None
                 initialrev = branch
                 logger.info("Copying data from %s..." % name)
+            # Sanity check initialrev and turn it into hash (required for copying history,
+            # because resolving a name ref only works in the component repo).
+            rev = runcmd('git rev-parse %s' % initialrev, ldir).strip()
+            if rev != initialrev:
+                try:
+                    refs = runcmd('git show-ref -s %s' % initialrev, ldir).split('\n')
+                    if len(set(refs)) > 1:
+                        # Happens for example when configured to track
+                        # "master" and there is a refs/heads/master. The
+                        # traditional behavior from "git archive" (preserved
+                        # here) it to choose the first one. This might not be
+                        # intended, so at least warn about it.
+                        logger.warn("%s: initial revision '%s' not unique, picking result of rev-parse = %s" %
+                                    (name, initialrev, refs[0]))
+                        initialrev = rev
+                except:
+                    # show-ref fails for hashes. Skip the sanity warning in that case.
+                    pass
+                initialrev = rev
             dest_dir = repo['dest_dir']
             if dest_dir and dest_dir != ".":
                 extract_dir = os.path.join(os.getcwd(), dest_dir)
@@ -213,22 +238,155 @@ def action_init(conf, args):
             else:
                 extract_dir = os.getcwd()
             file_filter = repo.get('file_filter', "")
-            files = runcmd("git archive %s | tar -x -v -C %s %s" % (initialrev, extract_dir, file_filter), ldir)
             exclude_patterns = repo.get('file_exclude', '').split()
-            if exclude_patterns:
-                # Implement file removal by letting tar create the
-                # file and then deleting it in the file system
-                # again. Uses the list of files created by tar (easier
-                # than walking the tree).
-                for file in files.split('\n'):
-                    for pattern in exclude_patterns:
-                        if fnmatch.fnmatch(file, pattern):
-                            os.unlink(os.path.join(extract_dir, file))
-                            break
+            def copy_selected_files(initialrev, extract_dir, file_filter, exclude_patterns, ldir,
+                                    subdir=""):
+                # When working inside a filtered branch which had the
+                # files already moved, we need to prepend the
+                # subdirectory to all filters, otherwise they would
+                # not match.
+                if subdir:
+                    file_filter = ' '.join([subdir + '/' + x for x in file_filter.split()])
+                    exclude_patterns = [subdir + '/' + x for x in exclude_patterns]
+                # To handle both cases, we cd into the target
+                # directory and optionally tell tar to strip the path
+                # prefix when the files were already moved.
+                subdir_components = len(os.path.normpath(subdir).split(os.path.sep)) if subdir else 0
+                strip=('--strip-components=%d' % subdir_components) if subdir else ''
+                # TODO: file_filter wild cards do not work (and haven't worked before either), because
+                # a) GNU tar requires a --wildcards parameter before turning on wild card matching.
+                # b) The semantic is not as intendend (src/*.c also matches src/foo/bar.c,
+                #    in contrast to the other use of file_filter as parameter of "git archive"
+                #    where it only matches .c files directly in src).
+                files = runcmd("git archive %s %s | tar -x -v %s -C %s %s" %
+                               (initialrev, subdir,
+                                strip, extract_dir, file_filter),
+                               ldir)
+                if exclude_patterns:
+                    # Implement file removal by letting tar create the
+                    # file and then deleting it in the file system
+                    # again. Uses the list of files created by tar (easier
+                    # than walking the tree).
+                    for file in files.split('\n'):
+                        for pattern in exclude_patterns:
+                            if fnmatch.fnmatch(file, pattern):
+                                os.unlink(os.path.join(*([extract_dir] + ['..'] * subdir_components + [file])))
+                                break
+
+            if not conf.history:
+                copy_selected_files(initialrev, extract_dir, file_filter, exclude_patterns, ldir)
+            else:
+                # First fetch remote history into local repository.
+                # We need a ref for that, so ensure that there is one.
+                refname = "combo-layer-init-%s" % name
+                runcmd("git branch -f %s %s" % (refname, initialrev), ldir)
+                runcmd("git fetch %s %s" % (ldir, refname))
+                runcmd("git branch -D %s" % refname, ldir)
+                # Make that the head revision.
+                runcmd("git checkout -b %s %s" % (name, initialrev))
+                # Optional: rewrite history to change commit messages or to move files.
+                if 'hook' in repo or dest_dir and dest_dir != ".":
+                    filter_branch = ['git', 'filter-branch', '--force']
+                    with tempfile.NamedTemporaryFile() as hookwrapper:
+                        if 'hook' in repo:
+                            # Create a shell script wrapper around the original hook that
+                            # can be used by git filter-branch. Hook may or may not have
+                            # an absolute path.
+                            hook = repo['hook']
+                            hook = os.path.join(os.path.dirname(conf.conffile), '..', hook)
+                            # The wrappers turns the commit message
+                            # from stdin into a fake patch header.
+                            # This is good enough for changing Subject
+                            # and commit msg body with normal
+                            # combo-layer hooks.
+                            hookwrapper.write('''set -e
+tmpname=$(mktemp)
+trap "rm $tmpname" EXIT
+echo -n 'Subject: [PATCH] ' >>$tmpname
+cat >>$tmpname
+if ! [ $(tail -c 1 $tmpname | od -A n -t x1) == '0a' ]; then
+    echo >>$tmpname
+fi
+echo '---' >>$tmpname
+%s $tmpname $GIT_COMMIT %s
+tail -c +18 $tmpname | head -c -4
+''' % (hook, name))
+                            hookwrapper.flush()
+                            filter_branch.extend(['--msg-filter', 'bash %s' % hookwrapper.name])
+                        if dest_dir and dest_dir != ".":
+                            parent = os.path.dirname(dest_dir)
+                            if not parent:
+                                parent = '.'
+                            # May run outside of the current directory, so do not assume that .git exists.
+                            filter_branch.extend(['--tree-filter', 'mkdir -p .git/tmptree && mv $(ls -1 -a | grep -v -e ^.git$ -e ^.$ -e ^..$) .git/tmptree && mkdir -p %s && mv .git/tmptree %s' % (parent, dest_dir)])
+                        filter_branch.append('HEAD')
+                        runcmd(filter_branch)
+                        runcmd('git update-ref -d refs/original/refs/heads/%s' % name)
+                repo['rewritten_revision'] = runcmd('git rev-parse HEAD').strip()
+                repo['stripped_revision'] = repo['rewritten_revision']
+                # Optional filter files: remove everything and re-populate using the normal filtering code.
+                # Override any potential .gitignore.
+                if file_filter or exclude_patterns:
+                    runcmd('git rm -rf .')
+                    if not os.path.exists(extract_dir):
+                        os.makedirs(extract_dir)
+                    copy_selected_files('HEAD', extract_dir, file_filter, exclude_patterns, '.',
+                                        subdir=dest_dir if dest_dir and dest_dir != '.' else '')
+                    runcmd('git add --all --force .')
+                    if runcmd('git status --porcelain'):
+                        # Something to commit.
+                        runcmd(['git', 'commit', '-m',
+                                '''%s: select file subset
+
+Files from the component repository were chosen based on
+the following filters:
+file_filter = %s
+file_exclude = %s''' % (name, file_filter or '<empty>', repo.get('file_exclude', '<empty>'))])
+                        repo['stripped_revision'] = runcmd('git rev-parse HEAD').strip()
+
             if not lastrev:
-                lastrev = runcmd("git rev-parse %s" % initialrev, ldir).strip()
+                lastrev = runcmd('git rev-parse %s' % initialrev, ldir).strip()
                 conf.update(name, "last_revision", lastrev, initmode=True)
-        runcmd("git add .")
+
+        if not conf.history:
+            runcmd("git add .")
+        else:
+            # Create Octopus merge commit according to http://stackoverflow.com/questions/10874149/git-octopus-merge-with-unrelated-repositoies
+            runcmd('git checkout master')
+            merge = ['git', 'merge', '--no-commit']
+            with open('.git/info/grafts', 'w') as grafts:
+                grafts.write('%s\n' % startrev)
+                for name in conf.repos:
+                    repo = conf.repos[name]
+                    # Use branch created earlier.
+                    merge.append(name)
+                    for start in runcmd('git log --pretty=format:%%H --max-parents=0 %s' % name).split('\n'):
+                        grafts.write('%s %s\n' % (start, startrev))
+            try:
+                runcmd(merge)
+            except Exception, error:
+                logger.info('''Merging component repository history failed, perhaps because of merge conflicts.
+It may be possible to commit anyway after resolving these conflicts.
+
+%s''' % error)
+            # Create MERGE_HEAD and MERGE_MSG. "git merge" itself
+            # does not create MERGE_HEAD in case of a (harmless) failure,
+            # and we want certain auto-generated information in the
+            # commit message for future reference and/or automation.
+            with open('.git/MERGE_HEAD', 'w') as head:
+                with open('.git/MERGE_MSG', 'w') as msg:
+                    msg.write('repo: initial import of components\n\n')
+                    # head.write('%s\n' % startrev)
+                    for name in conf.repos:
+                        repo = conf.repos[name]
+                        # <upstream ref> <rewritten ref> <rewritten + files removed>
+                        msg.write('combo-layer-%s: %s %s %s\n' % (name,
+                                                                  repo['last_revision'],
+                                                                  repo['rewritten_revision'],
+                                                                  repo['stripped_revision']))
+                        rev = runcmd('git rev-parse %s' % name).strip()
+                        head.write('%s\n' % rev)
+
         if conf.localconffile:
             localadded = True
             try:
@@ -631,6 +789,9 @@ Action:
     parser.add_option("-n", "--no-pull", help = "skip pulling component repos during update",
                action = "store_true", dest = "nopull", default = False)
 
+    parser.add_option("-H", "--history", help = "import full history of components during init",
+                      action = "store_true", default = False)
+
     options, args = parser.parse_args(sys.argv)
 
     # Dispatch to action handler
-- 
2.1.4


