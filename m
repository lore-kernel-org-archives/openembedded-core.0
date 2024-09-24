Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9103ACF9C7B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 11:55:13 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.11911.1727178908422100646
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 04:55:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=2bJa0wdF;
 spf=pass (domain: baylibre.com, ip: 209.85.160.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4581ec0e00eso40817371cf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 04:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727178907; x=1727783707; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LIci9JddupquB8T22lZB0SGleg2Xge5/W6Fddip4FTE=;
        b=2bJa0wdFw7RXJCtnzmuz+tPXNV2dcs9uLcwcsqk43WcvIK+/urPSyp286bmzUnWka9
         2/H9iijs706ocq/q+/m4dstloxqeao2o3g8OHUzrhMWmoloFvT4ZHxkcW88Ev927BBxt
         y+/eckp29+vxxpf/HaIktraE5tIPmyX3SS0wpeDE63CAklQXH8xIvY4aG5zIr1qVHhFo
         PZJX7WS6qQ44mLaD7BGQ9lRZV1xrVAbKbD4YM7RH10cOHZ1cQsdrPmsJeXw6Sq3aIlVM
         JK2g5zMAcZq7V9rHIVcy0gtCTsyR8pMswylER4qPN8sVjXMHEbEo7+ASQXHjNcg7RuNY
         cfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727178907; x=1727783707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LIci9JddupquB8T22lZB0SGleg2Xge5/W6Fddip4FTE=;
        b=k+swMReJpgYAHT9ajU1WdECb1vCypA/bW8E1Cucqu/ymbCrF4AAVWVRsl0SBIU85jn
         USgyYxqOs0PEYUFIpcZ3WE8EBSyw3RyvrJLc4nYxC7GviPIoje0IkaLT6dzxjdQsORnn
         Ro+E+ynIb//HtLZJprGGD6OJkhcvIwpR10/hrTpv6JMZp7sv0UqcLx54TPXiVM32YtPr
         8JwqEjP8RlBo+XRz7BLhl3nyLjrofldDhJ7LUY755CM9dZAkYbEHPdZoVJgUweHHvPeC
         H62Rv3JOoKRFxYTFEpSfnj6bI7u4doTzPGVlYbUUuVVV/t1ML2YWqPiOZGQPTMAFCiZP
         b9jg==
X-Gm-Message-State: AOJu0YwoCsBsxERLPy+qMLzxweiFBOUcvEOSC/BorgVfhrPy5xUsz4Bv
	AVWo24fswmvxy6uoJ4kxUz6CTuHaIbvNcY2mBzxyWvU9TFzyRFwXvN98o2FqMWsFPEdj5dxr0eW
	rnhM=
X-Google-Smtp-Source: AGHT+IErfAbAQFJvkEntK1D54HcOglAoAmEG65X0xp+/0XtA4YCDw1jggx5x1+csx5W8v5j5QSDZbQ==
X-Received: by 2002:a05:622a:5496:b0:458:4b8b:1517 with SMTP id d75a77b69052e-45b226c770emr195231241cf.18.1727178907084;
        Tue, 24 Sep 2024 04:55:07 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b525456d3sm5553611cf.13.2024.09.24.04.55.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 04:55:06 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/6] patchtest: mbox.py: new data implementation
Date: Tue, 24 Sep 2024 07:54:59 -0400
Message-Id: <20240924115503.1599651-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240924115503.1599651-1-tgamblin@baylibre.com>
References: <20240924115503.1599651-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 11:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204852

Consolidate and improve some objects:

- absorb utils.py functionality
- repo.py: use mbox.py
- repo.py: remove some cruft
- utils.py: replace with logs.py
- utils.py: delete
- patch.py: delete
- scripts/patchtest: use logging directly
- general cleanup

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/mbox.py                | 108 ++++++++++++++++++++++
 meta/lib/patchtest/patch.py               |  43 ---------
 meta/lib/patchtest/patterns.py            |   3 -
 meta/lib/patchtest/repo.py                |  63 +++----------
 meta/lib/patchtest/tests/base.py          |   5 +-
 meta/lib/patchtest/tests/test_metadata.py |   2 +-
 meta/lib/patchtest/utils.py               |  61 ------------
 scripts/patchtest                         |  17 ++--
 8 files changed, 134 insertions(+), 168 deletions(-)
 create mode 100644 meta/lib/patchtest/mbox.py
 delete mode 100644 meta/lib/patchtest/patch.py
 delete mode 100644 meta/lib/patchtest/utils.py

diff --git a/meta/lib/patchtest/mbox.py b/meta/lib/patchtest/mbox.py
new file mode 100644
index 00000000000..1d95819b7ae
--- /dev/null
+++ b/meta/lib/patchtest/mbox.py
@@ -0,0 +1,108 @@
+#! /usr/bin/env python3
+
+# series.py
+#
+# Read a series' mbox file and get information about the patches
+# contained
+#
+# Copyright (C) 2024 BayLibre SAS
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+import email
+import re
+
+# From: https://stackoverflow.com/questions/59681461/read-a-big-mbox-file-with-python
+class MboxReader:
+    def __init__(self, filepath):
+        self.handle = open(filepath, 'rb')
+        assert self.handle.readline().startswith(b'From ')
+
+    def __enter__(self):
+        return self
+
+    def __exit__(self, exc_type, exc_value, exc_traceback):
+        self.handle.close()
+
+    def __iter__(self):
+        return iter(self.__next__())
+
+    def __next__(self):
+        lines = []
+        while True:
+            line = self.handle.readline()
+            if line == b'' or line.startswith(b'From '):
+                yield email.message_from_bytes(b''.join(lines))
+                if line == b'':
+                    break
+                lines = []
+                continue
+            lines.append(line)
+
+class Patch:
+    def __init__(self, data):
+        self.author = data['From']
+        self.to = data['To']
+        self.cc = data['Cc']
+        self.subject = data['Subject']
+        self.split_body = re.split('---', data.get_payload(), maxsplit=1)
+        self.commit_message = self.split_body[0]
+        self.diff = self.split_body[1]
+
+class PatchSeries:
+    def __init__(self, filepath):
+        with MboxReader(filepath) as mbox:
+            self.patches = [Patch(message) for message in mbox]
+
+        assert self.patches
+        self.patch_count = len(self.patches)
+        self.path = filepath
+
+        @property
+        def path(self):
+            return self.path
+
+        self.branch = self.get_branch()
+
+    def get_branch(self):
+        fullprefix = ""
+        pattern = re.compile(r"(\[.*\])", re.DOTALL)
+
+        # There should be at least one patch in the series and it should
+        # include the branch name in the subject, so parse that
+        match = pattern.search(self.patches[0].subject)
+        if match:
+            fullprefix = match.group(1)
+
+        branch, branches, valid_branches = None, [], []
+
+        if fullprefix:
+            prefix = fullprefix.strip('[]')
+            branches = [ b.strip() for b in prefix.split(',')]
+            valid_branches = [b for b in branches if PatchSeries.valid_branch(b)]
+
+        if len(valid_branches):
+            branch = valid_branches[0]
+
+        # Get the branch name excluding any brackets. If nothing was
+        # found, then assume there was no branch tag in the subject line
+        # and that the patch targets master
+        if branch is not None:
+            return branch.split(']')[0]
+        else:
+            return "master"
+
+    @staticmethod
+    def valid_branch(branch):
+        """ Check if branch is valid name """
+        lbranch = branch.lower()
+
+        invalid  = lbranch.startswith('patch') or \
+                   lbranch.startswith('rfc') or \
+                   lbranch.startswith('resend') or \
+                   re.search(r'^v\d+', lbranch) or \
+                   re.search(r'^\d+/\d+', lbranch)
+
+        return not invalid
+
diff --git a/meta/lib/patchtest/patch.py b/meta/lib/patchtest/patch.py
deleted file mode 100644
index 90faf3eeb4f..00000000000
--- a/meta/lib/patchtest/patch.py
+++ /dev/null
@@ -1,43 +0,0 @@
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
-#
-# patchtestpatch: PatchTestPatch class which abstracts a patch file
-#
-# Copyright (C) 2016 Intel Corporation
-#
-# SPDX-License-Identifier: GPL-2.0-only
-#
-
-import logging
-import utils
-
-logger = logging.getLogger('patchtest')
-
-class PatchTestPatch(object):
-    def __init__(self, path, forcereload=False):
-        self._path = path
-        self._forcereload = forcereload
-
-        self._contents = None
-        self._branch = None
-
-    @property
-    def contents(self):
-        if self._forcereload or (not self._contents):
-            logger.debug('Reading %s contents' % self._path)
-            try:
-                with open(self._path, newline='') as _f:
-                    self._contents = _f.read()
-            except IOError:
-                logger.warn("Reading the mbox %s failed" % self.resource)
-        return self._contents
-
-    @property
-    def path(self):
-        return self._path
-
-    @property
-    def branch(self):
-        if not self._branch:
-            self._branch = utils.get_branch(self._path)
-        return self._branch
diff --git a/meta/lib/patchtest/patterns.py b/meta/lib/patchtest/patterns.py
index ba97a4ffe9f..b703b0c8b99 100644
--- a/meta/lib/patchtest/patterns.py
+++ b/meta/lib/patchtest/patterns.py
@@ -10,11 +10,8 @@ import pyparsing
 colon = pyparsing.Literal(":")
 line_start = pyparsing.LineStart()
 line_end = pyparsing.LineEnd()
-at = pyparsing.Literal("@")
 lessthan = pyparsing.Literal("<")
 greaterthan = pyparsing.Literal(">")
-opensquare = pyparsing.Literal("[")
-closesquare = pyparsing.Literal("]")
 inappropriate = pyparsing.CaselessLiteral("Inappropriate")
 submitted = pyparsing.CaselessLiteral("Submitted")
 
diff --git a/meta/lib/patchtest/repo.py b/meta/lib/patchtest/repo.py
index 5f361ac5005..8ec8f68a0bc 100644
--- a/meta/lib/patchtest/repo.py
+++ b/meta/lib/patchtest/repo.py
@@ -8,40 +8,27 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
-import os
-import utils
-import logging
 import git
-from patch import PatchTestPatch
-
-logger = logging.getLogger('patchtest')
-info=logger.info
+import os
+import mbox
 
 class PatchTestRepo(object):
 
     # prefixes used for temporal branches/stashes
     prefix = 'patchtest'
 
-
     def __init__(self, patch, repodir, commit=None, branch=None):
-        self._repodir = repodir
-        self._repo = git.Repo.init(repodir)
-        self._patch = PatchTestPatch(patch)
-        self._current_branch = self._repo.active_branch.name
+        self.repodir = repodir
+        self.repo = git.Repo.init(repodir)
+        self.patch = mbox.PatchSeries(patch)
+        self.current_branch = self.repo.active_branch.name
 
         # targeted branch defined on the patch may be invalid, so make sure there
         # is a corresponding remote branch
         valid_patch_branch = None
-        if self._patch.branch in self._repo.branches:
-            valid_patch_branch = self._patch.branch
+        if self.patch.branch in self.repo.branches:
+            valid_patch_branch = self.patch.branch
             
-        # Target Branch
-        # Priority (top has highest priority):
-        #    1. branch given at cmd line
-        #    2. branch given at the patch
-        #    3. current branch
-        self._branch = branch or valid_patch_branch or self._current_branch
-
         # Target Commit
         # Priority (top has highest priority):
         #    1. commit given at cmd line
@@ -57,7 +44,7 @@ class PatchTestRepo(object):
 
         # create working branch. Use the '-B' flag so that we just
         # check out the existing one if it's there
-        self._repo.git.execute(['git', 'checkout', '-B', self._workingbranch, self._commit])
+        self.repo.git.execute(['git', 'checkout', '-B', self._workingbranch, self._commit])
 
         self._patchmerged = False
 
@@ -65,35 +52,13 @@ class PatchTestRepo(object):
         self._patchcanbemerged = True
         try:
             # Make sure to get the absolute path of the file
-            self._repo.git.execute(['git', 'apply', '--check', os.path.abspath(self._patch.path)], with_exceptions=True)
+            self.repo.git.execute(['git', 'apply', '--check', os.path.abspath(self.patch.path)], with_exceptions=True)
         except git.exc.GitCommandError as ce:
             self._patchcanbemerged = False
 
-        # for debugging purposes, print all repo parameters
-        logger.debug("Parameters")
-        logger.debug("\tRepository     : %s" % self._repodir)
-        logger.debug("\tTarget Commit    : %s" % self._commit)
-        logger.debug("\tTarget Branch    : %s" % self._branch)
-        logger.debug("\tWorking branch : %s" % self._workingbranch)
-        logger.debug("\tPatch          : %s" % self._patch)
-
-    @property
-    def patch(self):
-        return self._patch.path
-
-    @property
-    def branch(self):
-        return self._branch
-
-    @property
-    def commit(self):
-        return self._commit
-
-    @property
     def ismerged(self):
         return self._patchmerged
 
-    @property
     def canbemerged(self):
         return self._patchcanbemerged
 
@@ -103,7 +68,7 @@ class PatchTestRepo(object):
             return None
 
         try:
-            return self._repo.rev_parse(commit).hexsha
+            return self.repo.rev_parse(commit).hexsha
         except Exception as e:
             print(f"Couldn't find commit {commit} in repo")
 
@@ -111,10 +76,10 @@ class PatchTestRepo(object):
 
     def merge(self):
         if self._patchcanbemerged:
-            self._repo.git.execute(['git', 'am', '--keep-cr', os.path.abspath(self._patch.path)])
+            self.repo.git.execute(['git', 'am', '--keep-cr', os.path.abspath(self.patch.path)])
             self._patchmerged = True
 
     def clean(self):
-        self._repo.git.execute(['git', 'checkout', self._current_branch])
-        self._repo.git.execute(['git', 'branch', '-D', self._workingbranch])
+        self.repo.git.execute(['git', 'checkout', self.current_branch])
+        self.repo.git.execute(['git', 'branch', '-D', self._workingbranch])
         self._patchmerged = False
diff --git a/meta/lib/patchtest/tests/base.py b/meta/lib/patchtest/tests/base.py
index 424e61b5be2..911addb199a 100644
--- a/meta/lib/patchtest/tests/base.py
+++ b/meta/lib/patchtest/tests/base.py
@@ -37,7 +37,6 @@ class Base(unittest.TestCase):
     endcommit_messages_regex = re.compile(r'\(From \w+-\w+ rev:|(?<!\S)Signed-off-by|(?<!\S)---\n')
     patchmetadata_regex   = re.compile(r'-{3} \S+|\+{3} \S+|@{2} -\d+,\d+ \+\d+,\d+ @{2} \S+')
 
-
     @staticmethod
     def msg_to_commit(msg):
         payload = msg.get_payload()
@@ -66,13 +65,13 @@ class Base(unittest.TestCase):
     def setUpClass(cls):
 
         # General objects: mailbox.mbox and patchset
-        cls.mbox = mailbox.mbox(PatchTestInput.repo.patch)
+        cls.mbox = mailbox.mbox(PatchTestInput.repo.patch.path)
 
         # Patch may be malformed, so try parsing it
         cls.unidiff_parse_error = ''
         cls.patchset = None
         try:
-            cls.patchset = unidiff.PatchSet.from_filename(PatchTestInput.repo.patch, encoding=u'UTF-8')
+            cls.patchset = unidiff.PatchSet.from_filename(PatchTestInput.repo.patch.path, encoding=u'UTF-8')
         except unidiff.UnidiffParseError as upe:
             cls.patchset = []
             cls.unidiff_parse_error = str(upe)
diff --git a/meta/lib/patchtest/tests/test_metadata.py b/meta/lib/patchtest/tests/test_metadata.py
index 8c2305a1840..d7e5e187f64 100644
--- a/meta/lib/patchtest/tests/test_metadata.py
+++ b/meta/lib/patchtest/tests/test_metadata.py
@@ -168,7 +168,7 @@ class TestMetadata(base.Metadata):
     def test_cve_check_ignore(self):
         # Skip if we neither modified a recipe or target branches are not
         # Nanbield and newer. CVE_CHECK_IGNORE was first deprecated in Nanbield.
-        if not self.modified or PatchTestInput.repo.branch == "kirkstone" or PatchTestInput.repo.branch == "dunfell":
+        if not self.modified or PatchTestInput.repo.patch.branch == "kirkstone" or PatchTestInput.repo.patch.branch == "dunfell":
             self.skip('No modified recipes or older target branch, skipping test')
         for pn in self.modified:
             # we are not interested in images
diff --git a/meta/lib/patchtest/utils.py b/meta/lib/patchtest/utils.py
deleted file mode 100644
index 8eddf3e85fb..00000000000
--- a/meta/lib/patchtest/utils.py
+++ /dev/null
@@ -1,61 +0,0 @@
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
-#
-# utils: common methods used by the patchtest framework
-#
-# Copyright (C) 2016 Intel Corporation
-#
-# SPDX-License-Identifier: GPL-2.0-only
-#
-
-import os
-import subprocess
-import logging
-import re
-import mailbox
-
-def logger_create(name):
-    logger = logging.getLogger(name)
-    loggerhandler = logging.StreamHandler()
-    loggerhandler.setFormatter(logging.Formatter("%(message)s"))
-    logger.addHandler(loggerhandler)
-    logger.setLevel(logging.INFO)
-    return logger
-
-def valid_branch(branch):
-    """ Check if branch is valid name """
-    lbranch = branch.lower()
-
-    invalid  = lbranch.startswith('patch') or \
-               lbranch.startswith('rfc') or \
-               lbranch.startswith('resend') or \
-               re.search(r'^v\d+', lbranch) or \
-               re.search(r'^\d+/\d+', lbranch)
-
-    return not invalid
-
-def get_branch(path):
-    """ Get the branch name from mbox """
-    fullprefix = ""
-    mbox = mailbox.mbox(path)
-
-    if len(mbox):
-        subject = mbox[0]['subject']
-        if subject:
-            pattern = re.compile(r"(\[.*\])", re.DOTALL)
-            match = pattern.search(subject)
-            if match:
-                fullprefix = match.group(1)
-
-    branch, branches, valid_branches = None, [], []
-
-    if fullprefix:
-        prefix = fullprefix.strip('[]')
-        branches = [ b.strip() for b in prefix.split(',')]
-        valid_branches = [b for b in branches if valid_branch(b)]
-
-    if len(valid_branches):
-        branch = valid_branches[0]
-
-    return branch
-
diff --git a/scripts/patchtest b/scripts/patchtest
index 0be7062dc2e..3ca8c6e48fe 100755
--- a/scripts/patchtest
+++ b/scripts/patchtest
@@ -9,12 +9,12 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
-import sys
-import os
-import unittest
+import json
 import logging
+import os
+import sys
 import traceback
-import json
+import unittest
 
 # Include current path so test cases can see it
 sys.path.insert(0, os.path.dirname(os.path.realpath(__file__)))
@@ -25,13 +25,14 @@ sys.path.insert(0, os.path.join(os.path.dirname(os.path.realpath(__file__)), '..
 from data import PatchTestInput
 from repo import PatchTestRepo
 
-import utils
-logger = utils.logger_create('patchtest')
+logger = logging.getLogger("patchtest")
+loggerhandler = logging.StreamHandler()
+loggerhandler.setFormatter(logging.Formatter("%(message)s"))
+logger.addHandler(loggerhandler)
+logger.setLevel(logging.INFO)
 info = logger.info
 error = logger.error
 
-import repo
-
 def getResult(patch, mergepatch, logfile=None):
 
     class PatchTestResult(unittest.TextTestResult):
-- 
2.39.5


