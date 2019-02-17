Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 563537C706
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 22:24:44 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id f14so16337850wrg.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 14:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AGL/SBMJp1jQkLmRkUfQtY+b2URzPoCHrAuwjsYbU6Q=;
	b=DlppInXFACC/YWFN6etaCmD/QepcrzTWsNq1T0qPRjuDGXP6+Mj7VxWquwcsyscbfH
	MTKaTFObN75KRBUzG6V07TkxsgNATDKV6gMIrhG8ppThl34Tk/n+/0msuYshIOURru+0
	04pFfTBihGZseftSUUPCEmduO99OAdHycJRgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AGL/SBMJp1jQkLmRkUfQtY+b2URzPoCHrAuwjsYbU6Q=;
	b=XPC15tvKNEf/wPXFsNvUbUXDQ8hnvrZN2WJB59pldN0OXXd69n+JEoFeiPCz6oArd6
	tDBFrzB9mfz+fuedlov5w/ffMEllJvjF8Bqs4HoNrO2rqFOqxxeVIzgeP1SscNRMa5bK
	Z/0LgZwNx81In9e8CveQXbIotkBkacvZK5R6o5EzguuWcKuo3iY92bMuYeVWy18LS79p
	ANNfVqpM+MkkEdiHnNYHWv3OQOE52hcsYuaHJbjQyVxbye1J+sMp5IsQcF02OQG88kYl
	aj/hNsXxL0xUfRuj0YM4yUgCo55pMvKMXLrtSkcA4vixShmSb55ovS2yRtya4zKP/Vio
	VHSA==
X-Gm-Message-State: AHQUAub7RbpeZu0vX3Hzb48wFQBUwzUxNsW3p3UmDI0lR/3FbifJMCyr
	z/8ZIvBTjpFC+VXViNNhoHhz/8u8gAs=
X-Google-Smtp-Source: AHgI3IbEaPSepv61lC9VekcD2Nc/N6TZtENVsfpM8gb1QH4dKRnZP8zr1+fjYIK9RbP/POBFJb518g==
X-Received: by 2002:a5d:6452:: with SMTP id d18mr14153002wrw.183.1550442284242;
	Sun, 17 Feb 2019 14:24:44 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p1sm6681130wrx.50.2019.02.17.14.24.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Feb 2019 14:24:43 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Feb 2019 22:24:40 +0000
Message-Id: <20190217222441.32110-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] scripts/oe-git-archive: Separate out functionality to library function
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
X-List-Received-Date: Sun, 17 Feb 2019 22:24:44 -0000
Content-Transfer-Encoding: 8bit

This turns the core of the script into a library function. Ultimately this
will let us call that code with custom 'keywords' rather than relying
on the data parsed from bitbake metadata which can't be used when archiving
historical results.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/gitarchive.py | 173 ++++++++++++++++++++++++++++++
 scripts/oe-git-archive            | 166 ++--------------------------
 2 files changed, 179 insertions(+), 160 deletions(-)
 create mode 100644 meta/lib/oeqa/utils/gitarchive.py

diff --git a/meta/lib/oeqa/utils/gitarchive.py b/meta/lib/oeqa/utils/gitarchive.py
new file mode 100644
index 00000000000..fddd608593a
--- /dev/null
+++ b/meta/lib/oeqa/utils/gitarchive.py
@@ -0,0 +1,173 @@
+#
+# Helper functions for committing data to git and pushing upstream
+#
+# Copyright (c) 2017, Intel Corporation.
+# Copyright (c) 2019, Linux Foundation
+#
+# This program is free software; you can redistribute it and/or modify it
+# under the terms and conditions of the GNU General Public License,
+# version 2, as published by the Free Software Foundation.
+#
+# This program is distributed in the hope it will be useful, but WITHOUT
+# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+# more details.
+#
+
+import os
+import re
+import sys
+from oeqa.utils.git import GitRepo, GitError
+
+class ArchiveError(Exception):
+    """Internal error handling of this script"""
+
+def format_str(string, fields):
+    """Format string using the given fields (dict)"""
+    try:
+        return string.format(**fields)
+    except KeyError as err:
+        raise ArchiveError("Unable to expand string '{}': unknown field {} "
+                           "(valid fields are: {})".format(
+                               string, err, ', '.join(sorted(fields.keys()))))
+
+
+def init_git_repo(path, no_create, bare, log):
+    """Initialize local Git repository"""
+    path = os.path.abspath(path)
+    if os.path.isfile(path):
+        raise ArchiveError("Invalid Git repo at {}: path exists but is not a "
+                           "directory".format(path))
+    if not os.path.isdir(path) or not os.listdir(path):
+        if no_create:
+            raise ArchiveError("No git repo at {}, refusing to create "
+                               "one".format(path))
+        if not os.path.isdir(path):
+            try:
+                os.mkdir(path)
+            except (FileNotFoundError, PermissionError) as err:
+                raise ArchiveError("Failed to mkdir {}: {}".format(path, err))
+        if not os.listdir(path):
+            log.info("Initializing a new Git repo at %s", path)
+            repo = GitRepo.init(path, bare)
+    try:
+        repo = GitRepo(path, is_topdir=True)
+    except GitError:
+        raise ArchiveError("Non-empty directory that is not a Git repository "
+                           "at {}\nPlease specify an existing Git repository, "
+                           "an empty directory or a non-existing directory "
+                           "path.".format(path))
+    return repo
+
+
+def git_commit_data(repo, data_dir, branch, message, exclude, notes, log):
+    """Commit data into a Git repository"""
+    log.info("Committing data into to branch %s", branch)
+    tmp_index = os.path.join(repo.git_dir, 'index.oe-git-archive')
+    try:
+        # Create new tree object from the data
+        env_update = {'GIT_INDEX_FILE': tmp_index,
+                      'GIT_WORK_TREE': os.path.abspath(data_dir)}
+        repo.run_cmd('add .', env_update)
+
+        # Remove files that are excluded
+        if exclude:
+            repo.run_cmd(['rm', '--cached'] + [f for f in exclude], env_update)
+
+        tree = repo.run_cmd('write-tree', env_update)
+
+        # Create new commit object from the tree
+        parent = repo.rev_parse(branch)
+        git_cmd = ['commit-tree', tree, '-m', message]
+        if parent:
+            git_cmd += ['-p', parent]
+        commit = repo.run_cmd(git_cmd, env_update)
+
+        # Create git notes
+        for ref, filename in notes:
+            ref = ref.format(branch_name=branch)
+            repo.run_cmd(['notes', '--ref', ref, 'add',
+                          '-F', os.path.abspath(filename), commit])
+
+        # Update branch head
+        git_cmd = ['update-ref', 'refs/heads/' + branch, commit]
+        if parent:
+            git_cmd.append(parent)
+        repo.run_cmd(git_cmd)
+
+        # Update current HEAD, if we're on branch 'branch'
+        if not repo.bare and repo.get_current_branch() == branch:
+            log.info("Updating %s HEAD to latest commit", repo.top_dir)
+            repo.run_cmd('reset --hard')
+
+        return commit
+    finally:
+        if os.path.exists(tmp_index):
+            os.unlink(tmp_index)
+
+
+def expand_tag_strings(repo, name_pattern, msg_subj_pattern, msg_body_pattern,
+                       keywords):
+    """Generate tag name and message, with support for running id number"""
+    keyws = keywords.copy()
+    # Tag number is handled specially: if not defined, we autoincrement it
+    if 'tag_number' not in keyws:
+        # Fill in all other fields than 'tag_number'
+        keyws['tag_number'] = '{tag_number}'
+        tag_re = format_str(name_pattern, keyws)
+        # Replace parentheses for proper regex matching
+        tag_re = tag_re.replace('(', '\(').replace(')', '\)') + '$'
+        # Inject regex group pattern for 'tag_number'
+        tag_re = tag_re.format(tag_number='(?P<tag_number>[0-9]{1,5})')
+
+        keyws['tag_number'] = 0
+        for existing_tag in repo.run_cmd('tag').splitlines():
+            match = re.match(tag_re, existing_tag)
+
+            if match and int(match.group('tag_number')) >= keyws['tag_number']:
+                keyws['tag_number'] = int(match.group('tag_number')) + 1
+
+    tag_name = format_str(name_pattern, keyws)
+    msg_subj= format_str(msg_subj_pattern.strip(), keyws)
+    msg_body = format_str(msg_body_pattern, keyws)
+    return tag_name, msg_subj + '\n\n' + msg_body
+
+def gitarchive(data_dir, git_dir, no_create, bare, commit_msg_subject, commit_msg_body, branch_name, no_tag, tagname, tag_msg_subject, tag_msg_body, exclude, notes, push, keywords, log):
+
+    if not os.path.isdir(data_dir):
+        raise ArchiveError("Not a directory: {}".format(data_dir))
+
+    data_repo = init_git_repo(git_dir, no_create, bare, log)
+
+    # Expand strings early in order to avoid getting into inconsistent
+    # state (e.g. no tag even if data was committed)
+    commit_msg = format_str(commit_msg_subject.strip(), keywords)
+    commit_msg += '\n\n' + format_str(commit_msg_body, keywords)
+    branch_name = format_str(branch_name, keywords)
+    tag_name = None
+    if not no_tag and tagname:
+        tag_name, tag_msg = expand_tag_strings(data_repo, tagname,
+                                               tag_msg_subject,
+                                               tag_msg_body, keywords)
+
+    # Commit data
+    commit = git_commit_data(data_repo, data_dir, branch_name,
+                             commit_msg, exclude, notes, log)
+
+    # Create tag
+    if tag_name:
+        log.info("Creating tag %s", tag_name)
+        data_repo.run_cmd(['tag', '-a', '-m', tag_msg, tag_name, commit])
+
+    # Push data to remote
+    if push:
+        cmd = ['push', '--tags']
+        # If no remote is given we push with the default settings from
+        # gitconfig
+        if push is not True:
+            notes_refs = ['refs/notes/' + ref.format(branch_name=branch_name)
+                           for ref, _ in notes]
+            cmd.extend([push, branch_name] + notes_refs)
+        log.info("Pushing data to remote")
+        data_repo.run_cmd(cmd)
+
diff --git a/scripts/oe-git-archive b/scripts/oe-git-archive
index 913291a99c6..ab1c2b9ad4c 100755
--- a/scripts/oe-git-archive
+++ b/scripts/oe-git-archive
@@ -14,16 +14,10 @@
 # more details.
 #
 import argparse
-import glob
-import json
 import logging
-import math
 import os
 import re
 import sys
-from collections import namedtuple, OrderedDict
-from datetime import datetime, timedelta, tzinfo
-from operator import attrgetter
 
 # Import oe and bitbake libs
 scripts_path = os.path.dirname(os.path.realpath(__file__))
@@ -34,128 +28,13 @@ scriptpath.add_oe_lib_path()
 
 from oeqa.utils.git import GitRepo, GitError
 from oeqa.utils.metadata import metadata_from_bb
-
+import oeqa.utils.gitarchive as gitarchive
 
 # Setup logging
 logging.basicConfig(level=logging.INFO, format="%(levelname)s: %(message)s")
 log = logging.getLogger()
 
 
-class ArchiveError(Exception):
-    """Internal error handling of this script"""
-
-
-def format_str(string, fields):
-    """Format string using the given fields (dict)"""
-    try:
-        return string.format(**fields)
-    except KeyError as err:
-        raise ArchiveError("Unable to expand string '{}': unknown field {} "
-                           "(valid fields are: {})".format(
-                               string, err, ', '.join(sorted(fields.keys()))))
-
-
-def init_git_repo(path, no_create, bare):
-    """Initialize local Git repository"""
-    path = os.path.abspath(path)
-    if os.path.isfile(path):
-        raise ArchiveError("Invalid Git repo at {}: path exists but is not a "
-                           "directory".format(path))
-    if not os.path.isdir(path) or not os.listdir(path):
-        if no_create:
-            raise ArchiveError("No git repo at {}, refusing to create "
-                               "one".format(path))
-        if not os.path.isdir(path):
-            try:
-                os.mkdir(path)
-            except (FileNotFoundError, PermissionError) as err:
-                raise ArchiveError("Failed to mkdir {}: {}".format(path, err))
-        if not os.listdir(path):
-            log.info("Initializing a new Git repo at %s", path)
-            repo = GitRepo.init(path, bare)
-    try:
-        repo = GitRepo(path, is_topdir=True)
-    except GitError:
-        raise ArchiveError("Non-empty directory that is not a Git repository "
-                           "at {}\nPlease specify an existing Git repository, "
-                           "an empty directory or a non-existing directory "
-                           "path.".format(path))
-    return repo
-
-
-def git_commit_data(repo, data_dir, branch, message, exclude, notes):
-    """Commit data into a Git repository"""
-    log.info("Committing data into to branch %s", branch)
-    tmp_index = os.path.join(repo.git_dir, 'index.oe-git-archive')
-    try:
-        # Create new tree object from the data
-        env_update = {'GIT_INDEX_FILE': tmp_index,
-                      'GIT_WORK_TREE': os.path.abspath(data_dir)}
-        repo.run_cmd('add .', env_update)
-
-        # Remove files that are excluded
-        if exclude:
-            repo.run_cmd(['rm', '--cached'] + [f for f in exclude], env_update)
-
-        tree = repo.run_cmd('write-tree', env_update)
-
-        # Create new commit object from the tree
-        parent = repo.rev_parse(branch)
-        git_cmd = ['commit-tree', tree, '-m', message]
-        if parent:
-            git_cmd += ['-p', parent]
-        commit = repo.run_cmd(git_cmd, env_update)
-
-        # Create git notes
-        for ref, filename in notes:
-            ref = ref.format(branch_name=branch)
-            repo.run_cmd(['notes', '--ref', ref, 'add',
-                          '-F', os.path.abspath(filename), commit])
-
-        # Update branch head
-        git_cmd = ['update-ref', 'refs/heads/' + branch, commit]
-        if parent:
-            git_cmd.append(parent)
-        repo.run_cmd(git_cmd)
-
-        # Update current HEAD, if we're on branch 'branch'
-        if not repo.bare and repo.get_current_branch() == branch:
-            log.info("Updating %s HEAD to latest commit", repo.top_dir)
-            repo.run_cmd('reset --hard')
-
-        return commit
-    finally:
-        if os.path.exists(tmp_index):
-            os.unlink(tmp_index)
-
-
-def expand_tag_strings(repo, name_pattern, msg_subj_pattern, msg_body_pattern,
-                       keywords):
-    """Generate tag name and message, with support for running id number"""
-    keyws = keywords.copy()
-    # Tag number is handled specially: if not defined, we autoincrement it
-    if 'tag_number' not in keyws:
-        # Fill in all other fields than 'tag_number'
-        keyws['tag_number'] = '{tag_number}'
-        tag_re = format_str(name_pattern, keyws)
-        # Replace parentheses for proper regex matching
-        tag_re = tag_re.replace('(', '\(').replace(')', '\)') + '$'
-        # Inject regex group pattern for 'tag_number'
-        tag_re = tag_re.format(tag_number='(?P<tag_number>[0-9]{1,5})')
-
-        keyws['tag_number'] = 0
-        for existing_tag in repo.run_cmd('tag').splitlines():
-            match = re.match(tag_re, existing_tag)
-
-            if match and int(match.group('tag_number')) >= keyws['tag_number']:
-                keyws['tag_number'] = int(match.group('tag_number')) + 1
-
-    tag_name = format_str(name_pattern, keyws)
-    msg_subj= format_str(msg_subj_pattern.strip(), keyws)
-    msg_body = format_str(msg_body_pattern, keyws)
-    return tag_name, msg_subj + '\n\n' + msg_body
-
-
 def parse_args(argv):
     """Parse command line arguments"""
     parser = argparse.ArgumentParser(
@@ -217,17 +96,11 @@ def get_nested(d, list_of_keys):
         return ""
 
 def main(argv=None):
-    """Script entry point"""
     args = parse_args(argv)
     if args.debug:
         log.setLevel(logging.DEBUG)
 
     try:
-        if not os.path.isdir(args.data_dir):
-            raise ArchiveError("Not a directory: {}".format(args.data_dir))
-
-        data_repo = init_git_repo(args.git_dir, args.no_create, args.bare)
-
         # Get keywords to be used in tag and branch names and messages
         metadata = metadata_from_bb()
         keywords = {'hostname': get_nested(metadata, ['hostname']),
@@ -236,39 +109,12 @@ def main(argv=None):
                     'commit_count': get_nested(metadata, ['layers', 'meta', 'commit_count']),
                     'machine': get_nested(metadata, ['config', 'MACHINE'])}
 
-        # Expand strings early in order to avoid getting into inconsistent
-        # state (e.g. no tag even if data was committed)
-        commit_msg = format_str(args.commit_msg_subject.strip(), keywords)
-        commit_msg += '\n\n' + format_str(args.commit_msg_body, keywords)
-        branch_name = format_str(args.branch_name, keywords)
-        tag_name = None
-        if not args.no_tag and args.tag_name:
-            tag_name, tag_msg = expand_tag_strings(data_repo, args.tag_name,
-                                                   args.tag_msg_subject,
-                                                   args.tag_msg_body, keywords)
-
-        # Commit data
-        commit = git_commit_data(data_repo, args.data_dir, branch_name,
-                                 commit_msg, args.exclude, args.notes)
-
-        # Create tag
-        if tag_name:
-            log.info("Creating tag %s", tag_name)
-            data_repo.run_cmd(['tag', '-a', '-m', tag_msg, tag_name, commit])
-
-        # Push data to remote
-        if args.push:
-            cmd = ['push', '--tags']
-            # If no remote is given we push with the default settings from
-            # gitconfig
-            if args.push is not True:
-                notes_refs = ['refs/notes/' + ref.format(branch_name=branch_name)
-                                for ref, _ in args.notes]
-                cmd.extend([args.push, branch_name] + notes_refs)
-            log.info("Pushing data to remote")
-            data_repo.run_cmd(cmd)
+        gitarchive.gitarchive(args.data_dir, args.git_dir, args.no_create, args.bare,
+                              args.commit_msg_subject.strip(), args.commit_msg_body, args.branch_name,
+                              args.no_tag, args.tag_name, args.tag_msg_subject, args.tag_msg_body,
+                              args.exclude, args.notes, args.push, keywords, log)
 
-    except ArchiveError as err:
+    except gitarchive.ArchiveError as err:
         log.error(str(err))
         return 1
 
-- 
2.20.1


