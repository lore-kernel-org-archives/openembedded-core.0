Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A86CECDB474
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 19:45:12 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.178235.1697485502840832428
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 12:45:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=HKhoXNpL;
 spf=pass (domain: baylibre.com, ip: 209.85.160.174, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-41b513e4a22so18131121cf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 12:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697485501; x=1698090301; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mqEl0fVQoUJt2UGKsmdZXCeXvZ5Yku3sH+zOO4gkeEs=;
        b=HKhoXNpLpLy1b59fAaO5154K1xmmaILXXjzLnY4cZOhFxqXQDR9FEmrk+Vt8It++C5
         6zdy2B6vgU/uAEHPznn5ZFGaD2YCX2WROFiolAyeS3T7yreT1BxDtIrWhk0sJpBNfKz8
         Pf19F8jhKolwikPv+87gx+hTdr/mmTPIuiXcYu+6ILgjJRo6lcfKi/vMX5kKU+jr0M7L
         g5l/Rio1VKY03bm7ViFUACpT6NAVH3HlHtlm9sHZFOd13YtqgAaSmxxzPP0gv2TKGr96
         i4PtyxwH3X4p+qCukhmCYl+uNrt23lmW3NH03tW+0ROLNiC96/c11gNbQZjoS1KPhgBZ
         QEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697485501; x=1698090301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mqEl0fVQoUJt2UGKsmdZXCeXvZ5Yku3sH+zOO4gkeEs=;
        b=fzx3Lx35kitzlDD5EAGDPeSwkme2viTaE4y7zOs3H27dfSXjCqqwbTZjZ6CCs29g2C
         l2QI2ujV2FCcUOJ46itBGizpxMWfGb+Kmi1VfYu0ozLQ95H99tqA/2sYfmvEe1ojsBre
         qlGtAcMfOTQw0oFCG3a8mGhbb07rA06Vmci2SWfLat//qt8Sqrl+PufyepPZbYtjW5uL
         w46Xd4ZaVxOyS4Xcz6kLPdt5exz4GEWNpjcJjS6OZdjDE9kMuTgw3EtOYQEATRR+8RNW
         HAEf4BwA20nZv+Ltu7UPlgmjjV2puH12iH3CBiwV0FDEwBP8S8Fj/+L2fWcShboq8AQd
         9zbA==
X-Gm-Message-State: AOJu0YwmwQRnhUH2liEt2Re11lglH8nlWkn7X71Bg0eydP7hXyHhTuXx
	4+nBSeBEbSguXHDS7y5WEeP7gq59Xo0f3t8p5GUkLQ==
X-Google-Smtp-Source: AGHT+IHHq1JizEuyPofw4loHd//As/xc6BeSrS8HjpW0SA45UIUnozSb64+XdtLADxhqTjVoTRGi0A==
X-Received: by 2002:ac8:7d91:0:b0:419:82fa:7102 with SMTP id c17-20020ac87d91000000b0041982fa7102mr370151qtd.38.1697485501345;
        Mon, 16 Oct 2023 12:45:01 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id l22-20020ac87256000000b004033c3948f9sm6733qtp.42.2023.10.16.12.45.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 12:45:00 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/4] patchtest: add supporting modules
Date: Mon, 16 Oct 2023 15:44:56 -0400
Message-ID: <20231016194458.2243201-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231016194458.2243201-1-tgamblin@baylibre.com>
References: <20231016194458.2243201-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 19:45:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189311

Add modules that support core patchtest functionality to
meta/lib/patchtest. These include classes and functions for handling
repository and patch objects, parsing the patchtest CLI arguments, and
other utilities.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/data.py  |  95 ++++++++++++++++++
 meta/lib/patchtest/patch.py |  73 ++++++++++++++
 meta/lib/patchtest/repo.py  | 185 ++++++++++++++++++++++++++++++++++++
 meta/lib/patchtest/utils.py | 179 ++++++++++++++++++++++++++++++++++
 4 files changed, 532 insertions(+)
 create mode 100644 meta/lib/patchtest/data.py
 create mode 100644 meta/lib/patchtest/patch.py
 create mode 100644 meta/lib/patchtest/repo.py
 create mode 100644 meta/lib/patchtest/utils.py

diff --git a/meta/lib/patchtest/data.py b/meta/lib/patchtest/data.py
new file mode 100644
index 00000000000..b661dd64796
--- /dev/null
+++ b/meta/lib/patchtest/data.py
@@ -0,0 +1,95 @@
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# patchtestdata: module used to share command line arguments between
+#                patchtest & test suite and a data store between test cases
+#
+# Copyright (C) 2016 Intel Corporation
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
+# Author: Leo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
+#
+# NOTE: Strictly speaking, unit test should be isolated from outside,
+#       but patchtest test suites uses command line input data and
+#       pretest and test test cases may use the datastore defined
+#       on this module
+
+import os
+import argparse
+import collections
+import tempfile
+import logging
+
+logger=logging.getLogger('patchtest')
+info=logger.info
+
+# Data store commonly used to share values between pre and post-merge tests
+PatchTestDataStore = collections.defaultdict(str)
+
+class PatchTestInput(object):
+    """Abstract the patchtest argument parser"""
+
+    @classmethod
+    def set_namespace(cls):
+        parser = cls.get_parser()
+        parser.parse_args(namespace=cls)
+
+    @classmethod
+    def get_parser(cls):
+        parser = argparse.ArgumentParser()
+
+        target_patch_group = parser.add_mutually_exclusive_group(required=True)
+
+        target_patch_group.add_argument('--patch', metavar='PATCH', dest='patch_path',
+                            help='The patch to be tested')
+
+        target_patch_group.add_argument('--directory', metavar='DIRECTORY', dest='patch_path',
+                            help='The directory containing patches to be tested')
+
+        parser.add_argument('repodir', metavar='REPO',
+                            help="Name of the repository where patch is merged")
+
+        parser.add_argument('startdir', metavar='TESTDIR',
+                            help="Directory where test cases are located")
+
+        parser.add_argument('--top-level-directory', '-t',
+                            dest='topdir',
+                            default=None,
+                            help="Top level directory of project (defaults to start directory)")
+
+        parser.add_argument('--pattern', '-p',
+                            dest='pattern',
+                            default='test*.py',
+                            help="Pattern to match test files")
+
+        parser.add_argument('--base-branch', '-b',
+                            dest='basebranch',
+                            help="Branch name used by patchtest to branch from. By default, it uses the current one.")
+
+        parser.add_argument('--base-commit', '-c',
+                            dest='basecommit',
+                            help="Commit ID used by patchtest to branch from. By default, it uses HEAD.")
+
+        parser.add_argument('--debug', '-d',
+                            action='store_true',
+                            help='Enable debug output')
+
+        parser.add_argument('--log-results', 
+                            action='store_true', 
+                            help='Enable logging to a file matching the target patch name with ".testresult" appended')
+
+
+        return parser
+
diff --git a/meta/lib/patchtest/patch.py b/meta/lib/patchtest/patch.py
new file mode 100644
index 00000000000..c0e7d579eba
--- /dev/null
+++ b/meta/lib/patchtest/patch.py
@@ -0,0 +1,73 @@
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# patchtestpatch: PatchTestPatch class which abstracts a patch file
+#
+# Copyright (C) 2016 Intel Corporation
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
+
+import logging
+import utils
+
+logger = logging.getLogger('patchtest')
+
+class PatchTestPatch(object):
+    MERGE_STATUS_INVALID = 'INVALID'
+    MERGE_STATUS_NOT_MERGED = 'NOTMERGED'
+    MERGE_STATUS_MERGED_SUCCESSFULL = 'PASS'
+    MERGE_STATUS_MERGED_FAIL = 'FAIL'
+    MERGE_STATUS = (MERGE_STATUS_INVALID,
+                    MERGE_STATUS_NOT_MERGED,
+                    MERGE_STATUS_MERGED_SUCCESSFULL,
+                    MERGE_STATUS_MERGED_FAIL)
+
+    def __init__(self, path, forcereload=False):
+        self._path = path
+        self._forcereload = forcereload
+
+        self._contents = None
+        self._branch = None
+        self._merge_status = PatchTestPatch.MERGE_STATUS_NOT_MERGED
+
+    @property
+    def contents(self):
+        if self._forcereload or (not self._contents):
+            logger.debug('Reading %s contents' % self._path)
+            try:
+                with open(self._path, newline='') as _f:
+                    self._contents = _f.read()
+            except IOError:
+                logger.warn("Reading the mbox %s failed" % self.resource)
+        return self._contents
+
+    @property
+    def path(self):
+        return self._path
+
+    @property
+    def branch(self):
+        if not self._branch:
+            self._branch = utils.get_branch(self._path)
+        return self._branch
+
+    def setmergestatus(self, status):
+        self._merge_status = status
+
+    def getmergestatus(self):
+        return self._merge_status
+
+    merge_status = property(getmergestatus, setmergestatus)
+
diff --git a/meta/lib/patchtest/repo.py b/meta/lib/patchtest/repo.py
new file mode 100644
index 00000000000..5c85c65ffb8
--- /dev/null
+++ b/meta/lib/patchtest/repo.py
@@ -0,0 +1,185 @@
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# patchtestrepo: PatchTestRepo class used mainly to control a git repo from patchtest
+#
+# Copyright (C) 2016 Intel Corporation
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
+import os
+import utils
+import logging
+import json
+from patch import PatchTestPatch
+
+logger = logging.getLogger('patchtest')
+info=logger.info
+
+class PatchTestRepo(object):
+
+    # prefixes used for temporal branches/stashes
+    prefix = 'patchtest'
+
+    def __init__(self, patch, repodir, commit=None, branch=None):
+        self._repodir = repodir
+        self._patch = PatchTestPatch(patch)
+        self._current_branch = self._get_current_branch()
+
+        # targeted branch defined on the patch may be invalid, so make sure there
+        # is a corresponding remote branch
+        valid_patch_branch = None
+        if self._patch.branch in self.upstream_branches():
+            valid_patch_branch = self._patch.branch
+            
+        # Target Branch
+        # Priority (top has highest priority):
+        #    1. branch given at cmd line
+        #    2. branch given at the patch
+        #    3. current branch
+        self._branch = branch or valid_patch_branch or self._current_branch
+
+        # Target Commit
+        # Priority (top has highest priority):
+        #    1. commit given at cmd line
+        #    2. branch given at cmd line
+        #    3. branch given at the patch
+        #    3. current HEAD
+        self._commit = self._get_commitid(commit) or \
+          self._get_commitid(branch) or \
+          self._get_commitid(valid_patch_branch) or \
+          self._get_commitid('HEAD')
+
+        self._workingbranch = "%s_%s" % (PatchTestRepo.prefix, os.getpid())
+
+        # create working branch
+        self._exec({'cmd': ['git', 'checkout', '-b', self._workingbranch, self._commit]})
+
+        self._patchmerged = False
+
+        # Check if patch can be merged using git-am
+        self._patchcanbemerged = True
+        try:
+            self._exec({'cmd': ['git', 'am', '--keep-cr'], 'input': self._patch.contents})
+        except utils.CmdException as ce:
+            self._exec({'cmd': ['git', 'am', '--abort']})
+            self._patchcanbemerged = False
+        finally:
+            # if patch was applied, remove it
+            if self._patchcanbemerged:
+                self._exec({'cmd':['git', 'reset', '--hard', self._commit]})
+
+        # for debugging purposes, print all repo parameters
+        logger.debug("Parameters")
+        logger.debug("\tRepository     : %s" % self._repodir)
+        logger.debug("\tTarget Commit    : %s" % self._commit)
+        logger.debug("\tTarget Branch    : %s" % self._branch)
+        logger.debug("\tWorking branch : %s" % self._workingbranch)
+        logger.debug("\tPatch          : %s" % self._patch)
+
+    @property
+    def patch(self):
+        return self._patch.path
+
+    @property
+    def branch(self):
+        return self._branch
+
+    @property
+    def commit(self):
+        return self._commit
+
+    @property
+    def ismerged(self):
+        return self._patchmerged
+
+    @property
+    def canbemerged(self):
+        return self._patchcanbemerged
+
+    def _exec(self, cmds):
+        _cmds = []
+        if isinstance(cmds, dict):
+            _cmds.append(cmds)
+        elif isinstance(cmds, list):
+            _cmds = cmds
+        else:
+            raise utils.CmdException({'cmd':str(cmds)})
+
+        results = []
+        cmdfailure = False
+        try:
+            results = utils.exec_cmds(_cmds, self._repodir)
+        except utils.CmdException as ce:
+            cmdfailure = True
+            raise ce
+        finally:
+            if cmdfailure:
+                for cmd in _cmds:
+                    logger.debug("CMD: %s" % ' '.join(cmd['cmd']))
+            else:
+                for result in results:
+                    cmd, rc, stdout, stderr = ' '.join(result['cmd']), result['returncode'], result['stdout'], result['stderr']
+                    logger.debug("CMD: %s RCODE: %s STDOUT: %s STDERR: %s" % (cmd, rc, stdout, stderr))
+
+        return results
+
+    def _get_current_branch(self, commit='HEAD'):
+        cmd = {'cmd':['git', 'rev-parse', '--abbrev-ref', commit]}
+        cb = self._exec(cmd)[0]['stdout']
+        if cb == commit:
+            logger.warning('You may be detached so patchtest will checkout to master after execution')
+            cb = 'master'
+        return cb
+
+    def _get_commitid(self, commit):
+
+        if not commit:
+            return None
+
+        try:
+            cmd = {'cmd':['git', 'rev-parse', '--short', commit]}
+            return self._exec(cmd)[0]['stdout']
+        except utils.CmdException as ce:
+            # try getting the commit under any remotes
+            cmd = {'cmd':['git', 'remote']}
+            remotes = self._exec(cmd)[0]['stdout']
+            for remote in remotes.splitlines():
+                cmd = {'cmd':['git', 'rev-parse', '--short', '%s/%s' % (remote, commit)]}
+                try:
+                    return self._exec(cmd)[0]['stdout']
+                except utils.CmdException:
+                    pass
+
+        return None
+
+    def upstream_branches(self):
+        cmd = {'cmd':['git', 'branch', '--remotes']}
+        remote_branches = self._exec(cmd)[0]['stdout']
+
+        # just get the names, without the remote name
+        branches = set(branch.split('/')[-1] for branch in remote_branches.splitlines())
+        return branches
+
+    def merge(self):
+        if self._patchcanbemerged:
+            self._exec({'cmd': ['git', 'am', '--keep-cr'],
+                        'input': self._patch.contents,
+                        'updateenv': {'PTRESOURCE':self._patch.path}})
+            self._patchmerged = True
+
+    def clean(self):
+        self._exec({'cmd':['git', 'checkout', '%s' % self._current_branch]})
+        self._exec({'cmd':['git', 'branch', '-D', self._workingbranch]})
+        self._patchmerged = False
diff --git a/meta/lib/patchtest/utils.py b/meta/lib/patchtest/utils.py
new file mode 100644
index 00000000000..23428ae1c5e
--- /dev/null
+++ b/meta/lib/patchtest/utils.py
@@ -0,0 +1,179 @@
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# utils: common methods used by the patchtest framework
+#
+# Copyright (C) 2016 Intel Corporation
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
+import os
+import subprocess
+import logging
+import sys
+import re
+import mailbox
+
+class CmdException(Exception):
+    """ Simple exception class where its attributes are the ones passed when instantiated """
+    def __init__(self, cmd):
+        self._cmd = cmd
+    def __getattr__(self, name):
+        value = None
+        if self._cmd.has_key(name):
+            value = self._cmd[name]
+        return value
+
+def exec_cmd(cmd, cwd, ignore_error=False, input=None, strip=True, updateenv={}):
+    """
+         Input:
+
+            cmd: dict containing the following keys:
+
+                cmd : the command itself as an array of strings
+                ignore_error: if False, no exception is raised
+                strip: indicates if strip is done on the output (stdout and stderr)
+                input: input data to the command (stdin)
+                updateenv: environment variables to be appended to the current
+                process environment variables
+
+            NOTE: keys 'ignore_error' and 'input' are optional; if not included,
+            the defaults are the ones specify in the arguments
+            cwd: directory where commands are executed
+            ignore_error: raise CmdException if command fails to execute and
+            this value is False
+            input: input data (stdin) for the command
+
+         Output: dict containing the following keys:
+
+             cmd: the same as input
+             ignore_error: the same as input
+             strip: the same as input
+             input: the same as input
+             stdout: Standard output after command's execution
+             stderr: Standard error after command's execution
+             returncode: Return code after command's execution
+
+    """
+    cmddefaults = {
+        'cmd':'',
+        'ignore_error':ignore_error,
+        'strip':strip,
+        'input':input,
+        'updateenv':updateenv,
+    }
+
+    # update input values if necessary
+    cmddefaults.update(cmd)
+
+    _cmd = cmddefaults
+
+    if not _cmd['cmd']:
+        raise CmdException({'cmd':None, 'stderr':'no command given'})
+
+    # update the environment
+    env = os.environ
+    env.update(_cmd['updateenv'])
+
+    _command = [e for e in _cmd['cmd']]
+    p = subprocess.Popen(_command,
+                         stdin=subprocess.PIPE,
+                         stdout=subprocess.PIPE,
+                         stderr=subprocess.PIPE,
+                         universal_newlines=True,
+                         cwd=cwd,
+                         env=env)
+
+    # execute the command and strip output
+    (_stdout, _stderr) = p.communicate(_cmd['input'])
+    if _cmd['strip']:
+        _stdout, _stderr = map(str.strip, [_stdout, _stderr])
+
+    # generate the result
+    result = _cmd
+    result.update({'cmd':_command,'stdout':_stdout,'stderr':_stderr,'returncode':p.returncode})
+
+    # launch exception if necessary
+    if not _cmd['ignore_error'] and p.returncode:
+        raise CmdException(result)
+
+    return result
+
+def exec_cmds(cmds, cwd):
+    """ Executes commands
+
+         Input:
+             cmds: Array of commands
+             cwd: directory where commands are executed
+
+         Output: Array of output commands
+    """
+    results = []
+    _cmds = cmds
+
+    for cmd in _cmds:
+        result = exec_cmd(cmd, cwd)
+        results.append(result)
+
+    return results
+
+def logger_create(name):
+    logger = logging.getLogger(name)
+    loggerhandler = logging.StreamHandler()
+    loggerhandler.setFormatter(logging.Formatter("%(message)s"))
+    logger.addHandler(loggerhandler)
+    logger.setLevel(logging.INFO)
+    return logger
+
+def get_subject_prefix(path):
+    prefix = ""
+    mbox = mailbox.mbox(path)
+
+    if len(mbox):
+        subject = mbox[0]['subject']
+        if subject:
+            pattern = re.compile("(\[.*\])", re.DOTALL)
+            match = pattern.search(subject)
+            if match:
+                prefix = match.group(1)
+
+    return prefix
+
+def valid_branch(branch):
+    """ Check if branch is valid name """
+    lbranch = branch.lower()
+
+    invalid  = lbranch.startswith('patch') or \
+               lbranch.startswith('rfc') or \
+               lbranch.startswith('resend') or \
+               re.search('^v\d+', lbranch) or \
+               re.search('^\d+/\d+', lbranch)
+
+    return not invalid
+
+def get_branch(path):
+    """ Get the branch name from mbox """
+    fullprefix = get_subject_prefix(path)
+    branch, branches, valid_branches = None, [], []
+
+    if fullprefix:
+        prefix = fullprefix.strip('[]')
+        branches = [ b.strip() for b in prefix.split(',')]
+        valid_branches = [b for b in branches if valid_branch(b)]
+
+    if len(valid_branches):
+        branch = valid_branches[0]
+
+    return branch
+
-- 
2.41.0


