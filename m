Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3055A65CBC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 13:27:36 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id m9so73527789ige.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2016 06:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=fHWyjXN8j6a/AyA38e7faGWyZLBAXa70siP3qbXhy2o=;
	b=dXDOeiKfXZpa0Vgz0U3347/9LpfHVdyx1UWSoe62bdEZFh3KFIHW9LZBOk9Eihrdcp
	SvFNhhWxOKLDxcBAKoGb0NEtAjWMcjAdvcbQWTPN2RG7uZq2SRnMbH6bwVLyXY3hYMqT
	l2ERViYh0T6GsI3IlQfmxpvjjmqi7MyWLU6PCYPoLxnSiRku3cdEEpByH+lRqLxNAPBH
	+2em52mqBCar534241fIyovudjmNVEht1cQhhXFM7+WFpOoqvawG9xBAkncQ5m8Dq/jK
	VhFBnfTXEP3HVODw8Eiso0C63DYTBzGEQUVo9BuTtjq5MIckSpSa0z5B7W53WQeNJ42F
	wPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=fHWyjXN8j6a/AyA38e7faGWyZLBAXa70siP3qbXhy2o=;
	b=Nko8hwrbZ1JVrruBX9FKeu4Ablh5DxGJ4NBjLQ4gDq08FkxOV4dnDVtnFChjFTySSa
	ChZQ1nTwAB3cA7wFtQ32WzbvuNsgavz4cjlDr7DbL1LqSRSle/FlwUcMMQ1EdLIuySCH
	rZRUH88Y8dJGWFmN6X5Q+Xj4uxUv17USJEqepQEBuInP1R5GOm04RDj77FcNwvPUpEhk
	h/i6wiDOQz+iL8mCDvVQ0kYduQ9bAu5rsAY9p1U6hgFls2kqNA0ptECM5s6vC1X3Tssj
	PK9IC/hkKZPxYpvNyOaLqOiZR7gSuXH3lkiisEhtFqdfWLjrpy1XxU8uaFed45MkrfD+
	3I7w==
X-Gm-Message-State: AOPr4FVdmOBrQ50DFGLp3MjieYbq5zQWv9nqhihP3pJeZcuGA3fMSjB30BjWuhT1kW8vsc/y
X-Received: by 10.50.110.35 with SMTP id hx3mr20413800igb.69.1462195657269;
	Mon, 02 May 2016 06:27:37 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8DB4C.dip0.t-ipconnect.de.
	[93.232.219.76]) by smtp.gmail.com with ESMTPSA id
	69sm18286189ioo.20.2016.05.02.06.27.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 May 2016 06:27:36 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 May 2016 15:27:28 +0200
Message-Id: <7aa35001d1f45c425df9040a66f37c2a4cce473f.1462195334.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <baeb6e18d0a535ad2ac62fe4ea12515a78fce88a.1462195334.git.patrick.ohly@intel.com>
References: <baeb6e18d0a535ad2ac62fe4ea12515a78fce88a.1462195334.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1462195334.git.patrick.ohly@intel.com>
References: <cover.1462195334.git.patrick.ohly@intel.com>
Subject: [PATCH 3/3] combo-layer: implement "update with history"
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
X-List-Received-Date: Mon, 02 May 2016 13:27:37 -0000

The core idea is that all commits get imported, including merge
commits, and joined into one big merge commit that imports the changes
from the individual components into the main branch of the combined
repository.

This is done by copying the files in each commit and removing deleted
ones, instead of trying to patch the combined repository.

The advantages of doing updates in this mode are:
- works for arbitrary upstream repos, not just those which
  support conversion into a linear set of patches
- listing history shows that commits where developed
  independently in the different components, instead of
  artificially showing them as if they had been developed
  one after the after (component "aaaa" before "bbbb", then "ccc", ...)
- bisecting becomes easier: when upstream repos only ensure consistency
  when merging into their "master" branches, then those merge
  commits are good candidates for test builds also in the combined
  repo
- more data mining can be done, for example showing who merged a commit
  and when

Selecting a subset of the files is supported, albeit with a slight
different semantic for wild card matching compared to other code paths
(/ is matched by * and ?). Empty commits get skipped because typically
they are a result of filtering (but that is not checked, so
intentionally empty commits also get skipped).

Other code paths are intentionally left unchanged, to avoid
regressions. However, the downside is that some opportunities for
refactoring (in particular regarding file filtering) were ignored.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/combo-layer | 391 +++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 389 insertions(+), 2 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 9297d59..92525ca 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -28,6 +28,9 @@ import subprocess
 import tempfile
 import ConfigParser
 import re
+import copy
+import pipes
+import shutil
 from collections import OrderedDict
 from string import Template
 
@@ -653,8 +656,7 @@ def action_update(conf, args):
         action_pull(conf, ['arg0'] + components)
 
     if history:
-        logger.error("update with history not implemented yet")
-        sys.exit(1)
+        update_with_history(conf, components, revisions, repos)
     else:
         update_with_patches(conf, components, revisions, repos)
 
@@ -888,6 +890,391 @@ def action_splitpatch(conf, args):
         else:
             logger.info(patch_filename)
 
+def update_with_history(conf, components, revisions, repos):
+    '''Update all components with full history.
+
+    Works by importing all commits reachable from a component's
+    current head revision.  If those commits are rooted in an already
+    imported commit, their content gets mixed with the content of the
+    combined repo of that commit (new or modified files overwritten,
+    removed files removed).
+
+    The last commit is an artificial merge commit that merges all the
+    updated components into the combined repository.
+
+    The HEAD ref only gets updated at the very end. All intermediate work
+    happens in a worktree which will get garbage collected by git eventually
+    after a failure.
+    '''
+    # Remember current HEAD and what we need to add to it.
+    head = runcmd("git rev-parse HEAD").strip()
+    additional_heads = {}
+
+    # Track the mapping between original commit and commit in the
+    # combined repo. We do not have to distinguish between components,
+    # because commit hashes are different anyway. Often we can
+    # skip find_revs() entirely (for example, when all new commits
+    # are derived from the last imported revision).
+    #
+    # Using "head" (typically the merge commit) instead of the actual
+    # commit for the component leads to a nicer history in the combined
+    # repo.
+    old2new_revs = {}
+    for name in repos:
+        repo = conf.repos[name]
+        revision = repo['last_revision']
+        if revision:
+            old2new_revs[revision] = head
+
+    def add_p(parents):
+        '''Insert -p before each entry.'''
+        parameters = []
+        for p in parents:
+            parameters.append('-p')
+            parameters.append(p)
+        return parameters
+
+    # Do all intermediate work with a separate work dir and index,
+    # chosen via env variables (can't use "git worktree", it is too
+    # new). This is useful (no changes to current work tree unless the
+    # update succeeds) and required (otherwise we end up temporarily
+    # removing the combo-layer hooks that we currently use when
+    # importing a new component).
+    #
+    # Not cleaned up after a failure at the moment.
+    wdir = os.path.join(os.getcwd(), ".git", "combo-layer")
+    windex = wdir + ".index"
+    if os.path.isdir(wdir):
+        shutil.rmtree(wdir)
+    os.mkdir(wdir)
+    wenv = copy.deepcopy(os.environ)
+    wenv["GIT_WORK_TREE"] = wdir
+    wenv["GIT_INDEX_FILE"] = windex
+    # This one turned out to be needed in practice.
+    wenv["GIT_OBJECT_DIRECTORY"] = os.path.join(os.getcwd(), ".git", "objects")
+    wargs = {"destdir": wdir, "env": wenv}
+
+    for name in repos:
+        revision = revisions.get(name, None)
+        repo = conf.repos[name]
+        ldir = repo['local_repo_dir']
+        dest_dir = repo['dest_dir']
+        branch = repo.get('branch', "master")
+        hook = repo.get('hook', None)
+        largs = {"destdir": ldir, "env": None}
+        file_include = repo.get('file_filter', '').split()
+        file_include.sort() # make sure that short entries like '.' come first.
+        file_exclude = repo.get('file_exclude', '').split()
+
+        def include_file(file):
+            if not file_include:
+                # No explicit filter set, include file.
+                return True
+            for filter in file_include:
+                if filter == '.':
+                    # Another special case: include current directory and thus all files.
+                    return True
+                if os.path.commonprefix((filter, file)) == filter:
+                    # Included in directory or direct file match.
+                    return True
+                # Check for wildcard match *with* allowing * to match /, i.e.
+                # src/*.c does match src/foobar/*.c. That's not how it is done elsewhere
+                # when passing the filtering to "git archive", but it is unclear what
+                # the intended semantic is (the comment on file_exclude that "append a * wildcard
+                # at the end" to match the full content of a directories implies that
+                # slashes are indeed not special), so here we simply do what's easy to
+                # implement in Python.
+                logger.debug('fnmatch(%s, %s)' % (file, filter))
+                if fnmatch.fnmatchcase(file, filter):
+                    return True
+            return False
+
+        def exclude_file(file):
+            for filter in file_exclude:
+                if fnmatch.fnmatchcase(file, filter):
+                    return True
+            return False
+
+        def file_filter(files):
+            '''Clean up file list so that only included files remain.'''
+            index = 0
+            while index < len(files):
+                file = files[index]
+                if not include_file(file) or exclude_file(file):
+                    del files[index]
+                else:
+                    index += 1
+
+
+        # Generate the revision list.
+        logger.info("Analyzing commits from %s..." % name)
+        top_revision = revision or branch
+        if not check_rev_branch(name, ldir, top_revision, branch):
+            sys.exit(1)
+
+        last_revision = repo['last_revision']
+        rev_list_args = "--full-history --sparse --topo-order --reverse"
+        if not last_revision:
+            logger.info("Warning: last_revision of component %s is not set, starting from the first commit" % name)
+            rev_list_args = rev_list_args + ' ' + top_revision
+        else:
+            if not check_rev_branch(name, ldir, last_revision, branch):
+                sys.exit(1)
+            rev_list_args = "%s %s..%s" % (rev_list_args, last_revision, top_revision)
+
+            # By definition, the current HEAD contains the latest imported
+            # commit of each component. We use that as initial mapping even
+            # though the commits do not match exactly because
+            # a) it always works (in contrast to find_revs, which relies on special
+            #    commit messages)
+            # b) it is faster than find_revs, which will only be called on demand
+            #    and can be skipped entirely in most cases
+            # c) last but not least, the combined history looks nicer when all
+            #    new commits are rooted in the same merge commit
+            old2new_revs[last_revision] = head
+
+        # We care about all commits (--full-history and --sparse) and
+        # we want reconstruct the topology and thus do not care
+        # about ordering by time (--topo-order). We ask for the ones
+        # we need to import first to be listed first (--reverse).
+        revs = runcmd("git rev-list %s" % rev_list_args, **largs).split()
+        logger.debug("To be imported: %s" % revs)
+        # Now 'revs' contains all revisions reachable from the top revision.
+        # All revisions derived from the 'last_revision' definitely are new,
+        # whereas the others may or may not have been imported before. For
+        # a linear history in the component, that second set will be empty.
+        # To distinguish between them, we also get the shorter list
+        # of revisions starting at the ancestor.
+        if last_revision:
+            ancestor_revs = runcmd("git rev-list --ancestry-path %s" % rev_list_args, **largs).split()
+        else:
+            ancestor_revs = []
+        logger.debug("Ancestors: %s" % ancestor_revs)
+
+        # Now import each revision.
+        logger.info("Importing commits from %s..." % name)
+        def import_rev(rev):
+            global scanned_revs
+
+            # If it is part of the new commits, we definitely need
+            # to import it. Otherwise we need to check, we might have
+            # imported it before. If it was imported and we merely
+            # fail to find it because commit messages did not track
+            # the mapping, then we end up importing it again. So
+            # combined repos using "updating with history" really should
+            # enable the "From ... rev:" commit header modifications.
+            if rev not in ancestor_revs and rev not in old2new_revs and not scanned_revs:
+                logger.debug("Revision %s triggers log analysis." % rev)
+                find_revs(old2new_revs, head)
+                scanned_revs = True
+            new_rev = old2new_revs.get(rev, None)
+            if new_rev:
+                return new_rev
+
+            # If the commit is not in the original list of revisions
+            # to be imported, then it must be a parent of one of those
+            # commits and it was skipped during earlier imports or not
+            # found. Importing such merge commits leads to very ugly
+            # history (long cascade of merge commits which all point
+            # to to older commits) when switching from "update via
+            # patches" to "update with history".
+            #
+            # We can avoid importing merge commits if all non-merge commits
+            # reachable from it were already imported. In that case we
+            # can root the new commits in the current head revision.
+            def is_imported(prev):
+                parents = runcmd("git show --no-patch --pretty=format:%P " + prev, **largs).split()
+                if len(parents) > 1:
+                    for p in parents:
+                        if not is_imported(p):
+                            logger.debug("Must import %s because %s is not imported." % (rev, p))
+                            return False
+                    return True
+                elif prev in old2new_revs:
+                    return True
+                else:
+                    logger.debug("Must import %s because %s is not imported." % (rev, prev))
+                    return False
+            if rev not in revs and is_imported(rev):
+                old2new_revs[rev] = head
+                return head
+
+            # Need to import rev. Collect some information about it.
+            logger.debug("Importing %s" % rev)
+            (parents, author_name, author_email, author_timestamp, body) = \
+                runcmd("git show --no-patch --pretty=format:%P%x00%an%x00%ae%x00%at%x00%B " + rev, **largs).split(chr(0))
+            parents = parents.split()
+            if parents:
+                # Arbitrarily pick the first parent as base. It may or may not have
+                # been imported before. For example, if the parent is a merge commit
+                # and previously the combined repository used patching as update
+                # method, then the actual merge commit parent never was imported.
+                # To cover this, We recursively import parents.
+                parent = parents[0]
+                new_parent = import_rev(parent)
+                # Clean index and working tree. TODO: can we combine this and the
+                # next into one command with less file IO?
+                # "git reset --hard" does not work, it changes HEAD of the parent
+                # repo, which we wanted to avoid. Probably need to keep
+                # track of the rev that corresponds to the index and use apply_commit().
+                runcmd("git rm -q --ignore-unmatch -rf .", **wargs)
+                # Update index and working tree to match the parent.
+                runcmd("git checkout -q -f %s ." % new_parent, **wargs)
+            else:
+                parent = None
+                # Clean index and working tree.
+                runcmd("git rm -q --ignore-unmatch -rf .", **wargs)
+
+            # Modify index and working tree such that it mirrors the commit.
+            apply_commit(parent, rev, largs, wargs, dest_dir, file_filter=file_filter)
+
+            # Now commit.
+            new_tree = runcmd("git write-tree", **wargs).strip()
+            env = copy.deepcopy(wenv)
+            env['GIT_AUTHOR_NAME'] = author_name
+            env['GIT_AUTHOR_EMAIL'] = author_email
+            env['GIT_AUTHOR_DATE'] = author_timestamp
+            if hook:
+                # Need to turn the verbatim commit message into something resembling a patch header
+                # for the hook.
+                with tempfile.NamedTemporaryFile(delete=False) as patch:
+                    patch.write('Subject: [PATCH] ')
+                    patch.write(body)
+                    patch.write('\n---\n')
+                    patch.close()
+                    runcmd([hook, patch.name, rev, name])
+                    with open(patch.name) as f:
+                        body = f.read()[len('Subject: [PATCH] '):][:-len('\n---\n')]
+
+            # We can skip non-merge commits that did not change any files. Those are typically
+            # the result of file filtering, although they could also have been introduced
+            # intentionally upstream, in which case we drop some information here.
+            if len(parents) == 1:
+                parent_rev = import_rev(parents[0])
+                old_tree = runcmd("git show -s --pretty=format:%T " + parent_rev, **wargs).strip()
+                commit = old_tree != new_tree
+                if not commit:
+                    new_rev = parent_rev
+            else:
+                commit = True
+            if commit:
+                new_rev = runcmd("git commit-tree".split() + add_p([import_rev(p) for p in parents]) +
+                                 ["-m", body, new_tree],
+                                 env=env).strip()
+            old2new_revs[rev] = new_rev
+
+            return new_rev
+
+        if revs:
+            for rev in revs:
+                import_rev(rev)
+            # Remember how to update our current head. New components get added,
+            # updated components get the delta between current head and the updated component
+            # applied.
+            additional_heads[old2new_revs[revs[-1]]] = head if repo['last_revision'] else None
+            repo['last_revision'] = revs[-1]
+
+    # Now construct the final merge commit. We create the tree by
+    # starting with the head and applying the changes from each
+    # components imported head revision.
+    if additional_heads:
+        runcmd("git reset --hard", **wargs)
+        for rev, base in additional_heads.iteritems():
+            apply_commit(base, rev, wargs, wargs, None)
+
+        # Commit with all component branches as parents as well as the previous head.
+        logger.info("Writing final merge commit...")
+        msg = conf_commit_msg(conf, components)
+        new_tree = runcmd("git write-tree", **wargs).strip()
+        new_rev = runcmd("git commit-tree".split() +
+                         add_p([head] + additional_heads.keys()) +
+                         ["-m", msg, new_tree],
+                         **wargs).strip()
+        # And done! This is the first time we change the HEAD in the actual work tree.
+        runcmd("git reset --hard %s" % new_rev)
+
+        # Update and stage the (potentially modified)
+        # combo-layer.conf, but do not commit separately.
+        for name in repos:
+            repo = conf.repos[name]
+            rev = repo['last_revision']
+            conf.update(name, "last_revision", rev)
+        if commit_conf_file(conf, components, False):
+            # Must augment the previous commit.
+            runcmd("git commit --amend -C HEAD")
+
+
+scanned_revs = False
+def find_revs(old2new, head):
+    '''Construct mapping from original commit hash to commit hash in
+    combined repo by looking at the commit messages. Depends on the
+    "From ... rev: ..." convention.'''
+    logger.info("Analyzing log messages to find previously imported commits...")
+    num_known = len(old2new)
+    log = runcmd("git log --grep='From .* rev: [a-fA-F0-9][a-fA-F0-9]*' --pretty=format:%H%x00%B%x00 " + head).split(chr(0))
+    regex = re.compile(r'From .* rev: ([a-fA-F0-9]+)')
+    for new_rev, body in zip(*[iter(log)]* 2):
+        # Use the last one, in the unlikely case there are more than one.
+        rev = regex.findall(body)[-1]
+        if rev not in old2new:
+            old2new[rev] = new_rev.strip()
+    logger.info("Found %d additional commits, leading to: %s" % (len(old2new) - num_known, old2new))
+
+
+def apply_commit(parent, rev, largs, wargs, dest_dir, file_filter=None):
+    '''Compare revision against parent, remove files deleted in the
+    commit, re-write new or modified ones. Moves them into dest_dir.
+    Optionally filters files.
+    '''
+    if not dest_dir:
+        dest_dir = "."
+    # -r recurses into sub-directories, given is the full overview of
+    # what changed.  We do not care about copy/edits or renames, so we
+    # can disable those with --no-renames (but we still parse them,
+    # because it was not clear from git documentation whether C and M
+    # lines can still occur).
+    logger.debug("Applying changes between %s and %s in %s" % (parent, rev, largs["destdir"]))
+    delete = []
+    update = []
+    if parent:
+        # Apply delta.
+        changes = runcmd("git diff-tree --no-commit-id --no-renames --name-status -r --raw -z %s %s" % (parent, rev), **largs).split(chr(0))
+        for status, name in zip(*[iter(changes)]*2):
+            if status[0] in "ACMRT":
+                update.append(name)
+            elif status[0] in "D":
+                delete.append(name)
+            else:
+                logger.error("Unknown status %s of file %s in revision %s" % (status, name, rev))
+                sys.exit(1)
+    else:
+        # Copy all files.
+        update.extend(runcmd("git ls-tree -r --name-only -z %s" % rev, **largs).split(chr(0)))
+
+    # Include/exclude files as define in the component config.
+    # Both updated and deleted file lists get filtered, because it might happen
+    # that a file gets excluded, pulled from a different component, and then the
+    # excluded file gets deleted. In that case we must keep the copy.
+    if file_filter:
+        file_filter(update)
+        file_filter(delete)
+
+    # We export into a tar archive here and extract with tar because it is simple (no
+    # need to implement file and symlink writing ourselves) and gives us some degree
+    # of parallel IO. The downside is that we have to pass the list of files via
+    # command line parameters - hopefully there will never be too many at once.
+    if update:
+        target = os.path.join(wargs["destdir"], dest_dir)
+        if not os.path.isdir(target):
+            os.makedirs(target)
+        runcmd("git archive %s %s | tar -C %s -xf -" % (rev, ' '.join([pipes.quote(x) for x in update]), pipes.quote(target)), **largs)
+        runcmd("git add -f".split() + [os.path.join(dest_dir, x) for x in update], **wargs)
+    if delete:
+        for path in delete:
+            if dest_dir:
+                path = os.path.join(dest_dir, path)
+        runcmd("git rm -f --ignore-unmatch".split() + [os.path.join(dest_dir, x) for x in delete], **wargs)
+
 def action_error(conf, args):
     logger.info("invalid action %s" % args[0])
 
-- 
2.1.4


