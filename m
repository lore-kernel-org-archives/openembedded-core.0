Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79BF9CF9C7A
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 11:55:13 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.11953.1727178910221624103
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 04:55:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=YrQSlL9i;
 spf=pass (domain: baylibre.com, ip: 209.85.160.178, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4581d15c3e3so47011791cf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 04:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727178909; x=1727783709; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rwkstVmFq9n4xoIBFyKzluSFW5CVna4lAxfTgtzJJOY=;
        b=YrQSlL9iks+dewlkOpHO5wB6LGLRP8IuFuwbCeiofWw/57au02QA1x3NnUZmi1LeHG
         lwouz7hnxv0fNKrHVPhsoActHesjy1YyhTW45Oz+qJxnL1OAWjOkuCZOWo5nsea2uMim
         85WdX6qtioVkxMnvUERkUd7D87NPKFTgUU8yY26xdZv43VhM/VF6jaHXSQ/upWXdGAcf
         /2XPFMexx0SvM1OSle/D9Q9o0Md+0mkoErb8ZEY3pplWN5GzG/k/wFfnc6ja88QKzSo+
         udiDGScYWuWshkNhZ+jAD8Ed20NfXtPC7R1GqzomLL0HhdfufEsy0R8m53AUUtfsooUd
         3IPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727178909; x=1727783709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rwkstVmFq9n4xoIBFyKzluSFW5CVna4lAxfTgtzJJOY=;
        b=uuO3vHuxvTAa0RfTDrs0uYEA3DnSp30iNjSlLryi5oZjBsmPEZ5ZerLCGn+xzrowrY
         LXf1w2eo7xeX7dNIYKmpu+7TnydqsYCSmPV5FgCU22e82LGd68fQSuPoM2mr4Dag1CO0
         ewiG3AO0wDTUzdUsxs4sPIEofP0FmbdQdPt349GukAxTuaeJ8JoAQsAAz9tz5ixPcHUc
         d8eie72KWMwX9aGe1NbvoNXlS8JK4UNgF+gjgwAZ/1quZgQp5I5bDXiUZoiTdGgstk1Q
         oQRNBMS7NHY/xuySn11qXtgQi82p9RPGjrZfJFW0M91zlEdjpI72fAdt/EydmBQdEWLk
         iBLw==
X-Gm-Message-State: AOJu0YxYjz4XHqwH5MUWUeyFbyHKDDRc8R5qyxX9QsW1IRABUYScHaY9
	bnR9hhha+xlPhTR2G+SOGonYOxmXgxvRBVWpPIu7NeHDL1cNZItWWcoXKKFnMTWh9mrmpRPOZ51
	17WU=
X-Google-Smtp-Source: AGHT+IHXyWM4cDjSJ6v+VkXdbN6vey8EFk389VPOWcYYfX0HgaZvgEAOQr1NVRHpaCZRZQhsHuvVPA==
X-Received: by 2002:ac8:7e81:0:b0:458:34df:1e5d with SMTP id d75a77b69052e-45b2053f751mr257156791cf.39.1727178908571;
        Tue, 24 Sep 2024 04:55:08 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b525456d3sm5553611cf.13.2024.09.24.04.55.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 04:55:08 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 4/6] patchtest: simplify, rename modules
Date: Tue, 24 Sep 2024 07:55:01 -0400
Message-Id: <20240924115503.1599651-5-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240924115503.1599651-1-tgamblin@baylibre.com>
References: <20240924115503.1599651-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 11:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204854

- simplify base.py, data.py
- move some leftover regex patterns to patterns.py
- remove pyparsing path logic, since this is no longer needed
- rename PatchTestInput class to PatchtestParser
- data.py: rename to patchtest_parser.py
- patterns.py: rename to patchtest_patterns.py
- move PatchTestDataStore to test_metadata.py since that's the only
  place it's used
- remove unused logger code

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../{data.py => patchtest_parser.py}          | 10 +-
 .../{patterns.py => patchtest_patterns.py}    | 15 ++-
 meta/lib/patchtest/tests/base.py              | 48 ++++++----
 meta/lib/patchtest/tests/test_mbox.py         | 69 +++++++++-----
 meta/lib/patchtest/tests/test_metadata.py     | 91 ++++++++++++------
 meta/lib/patchtest/tests/test_patch.py        | 95 +++++++++++++------
 .../lib/patchtest/tests/test_python_pylint.py |  3 +-
 scripts/patchtest                             | 34 ++++---
 8 files changed, 234 insertions(+), 131 deletions(-)
 rename meta/lib/patchtest/{data.py => patchtest_parser.py} (92%)
 rename meta/lib/patchtest/{patterns.py => patchtest_patterns.py} (90%)

diff --git a/meta/lib/patchtest/data.py b/meta/lib/patchtest/patchtest_parser.py
similarity index 92%
rename from meta/lib/patchtest/data.py
rename to meta/lib/patchtest/patchtest_parser.py
index 356259921da..2a11cb76c23 100644
--- a/meta/lib/patchtest/data.py
+++ b/meta/lib/patchtest/patchtest_parser.py
@@ -15,19 +15,11 @@
 
 import os
 import argparse
-import collections
-import logging
-
-logger=logging.getLogger('patchtest')
-info=logger.info
 
 default_testdir = os.path.abspath(os.path.dirname(__file__) + "/tests")
 default_repodir = os.path.abspath(os.path.dirname(__file__) + "/../../..")
 
-# Data store commonly used to share values between pre and post-merge tests
-PatchTestDataStore = collections.defaultdict(str)
-
-class PatchTestInput(object):
+class PatchtestParser(object):
     """Abstract the patchtest argument parser"""
 
     @classmethod
diff --git a/meta/lib/patchtest/patterns.py b/meta/lib/patchtest/patchtest_patterns.py
similarity index 90%
rename from meta/lib/patchtest/patterns.py
rename to meta/lib/patchtest/patchtest_patterns.py
index b703b0c8b99..8c2e192fc9f 100644
--- a/meta/lib/patchtest/patterns.py
+++ b/meta/lib/patchtest/patchtest_patterns.py
@@ -5,6 +5,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 import pyparsing
+import re
 
 # general
 colon = pyparsing.Literal(":")
@@ -34,10 +35,16 @@ lic_chksum_added = pyparsing.AtLineStart("+" + metadata_chksum)
 lic_chksum_removed = pyparsing.AtLineStart("-" + metadata_chksum)
 add_mark = pyparsing.Regex('\\+ ')
 patch_max_line_length = 200
-metadata_src_uri  = 'SRC_URI'
-metadata_summary = 'SUMMARY'
-cve_check_ignore_var = 'CVE_CHECK_IGNORE'
-cve_status_var = 'CVE_STATUS'
+metadata_src_uri = "SRC_URI"
+metadata_summary = "SUMMARY"
+cve_check_ignore_var = "CVE_CHECK_IGNORE"
+cve_status_var = "CVE_STATUS"
+endcommit_messages_regex = re.compile(
+    r"\(From \w+-\w+ rev:|(?<!\S)Signed-off-by|(?<!\S)---\n"
+)
+patchmetadata_regex = re.compile(
+    r"-{3} \S+|\+{3} \S+|@{2} -\d+,\d+ \+\d+,\d+ @{2} \S+"
+)
 
 # mbox
 auh_email = 'auh@yoctoproject.org'
diff --git a/meta/lib/patchtest/tests/base.py b/meta/lib/patchtest/tests/base.py
index 911addb199a..919ca136bb4 100644
--- a/meta/lib/patchtest/tests/base.py
+++ b/meta/lib/patchtest/tests/base.py
@@ -8,20 +8,23 @@ import unittest
 import logging
 import json
 import unidiff
-from data import PatchTestInput
+from patchtest_parser import PatchtestParser
 import mailbox
+import patchtest_patterns
 import collections
 import sys
 import os
 import re
 
-sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'pyparsing'))
+logger = logging.getLogger("patchtest")
+debug = logger.debug
+info = logger.info
+warn = logger.warn
+error = logger.error
 
-logger = logging.getLogger('patchtest')
-debug=logger.debug
-info=logger.info
-warn=logger.warn
-error=logger.error
+Commit = collections.namedtuple(
+    "Commit", ["author", "subject", "commit_message", "shortlog", "payload"]
+)
 
 Commit = collections.namedtuple('Commit', ['author', 'subject', 'commit_message', 'shortlog', 'payload'])
 
@@ -34,9 +37,6 @@ class PatchtestOEError(Exception):
 class Base(unittest.TestCase):
     # if unit test fails, fail message will throw at least the following JSON: {"id": <testid>}
 
-    endcommit_messages_regex = re.compile(r'\(From \w+-\w+ rev:|(?<!\S)Signed-off-by|(?<!\S)---\n')
-    patchmetadata_regex   = re.compile(r'-{3} \S+|\+{3} \S+|@{2} -\d+,\d+ \+\d+,\d+ @{2} \S+')
-
     @staticmethod
     def msg_to_commit(msg):
         payload = msg.get_payload()
@@ -49,7 +49,7 @@ class Base(unittest.TestCase):
     @staticmethod
     def commit_message(payload):
         commit_message = payload.__str__()
-        match = Base.endcommit_messages_regex.search(payload)
+        match = patchtest_patterns.endcommit_messages_regex.search(payload)
         if match:
             commit_message = payload[:match.start()]
         return commit_message
@@ -65,13 +65,15 @@ class Base(unittest.TestCase):
     def setUpClass(cls):
 
         # General objects: mailbox.mbox and patchset
-        cls.mbox = mailbox.mbox(PatchTestInput.repo.patch.path)
+        cls.mbox = mailbox.mbox(PatchtestParser.repo.patch.path)
 
         # Patch may be malformed, so try parsing it
         cls.unidiff_parse_error = ''
         cls.patchset = None
         try:
-            cls.patchset = unidiff.PatchSet.from_filename(PatchTestInput.repo.patch.path, encoding=u'UTF-8')
+            cls.patchset = unidiff.PatchSet.from_filename(
+                PatchtestParser.repo.patch.path, encoding="UTF-8"
+            )
         except unidiff.UnidiffParseError as upe:
             cls.patchset = []
             cls.unidiff_parse_error = str(upe)
@@ -148,7 +150,7 @@ class Metadata(Base):
 
         # import relevant libraries
         try:
-            scripts_path = os.path.join(PatchTestInput.repodir, 'scripts', 'lib')
+            scripts_path = os.path.join(PatchtestParser.repodir, "scripts", "lib")
             if scripts_path not in sys.path:
                 sys.path.insert(0, scripts_path)
             import scriptpath
@@ -223,11 +225,23 @@ class Metadata(Base):
         for patch in patchset:
             if patch.path.endswith('.bb') or patch.path.endswith('.bbappend') or patch.path.endswith('.inc'):
                 if patch.is_added_file:
-                    added_paths.append(os.path.join(os.path.abspath(PatchTestInput.repodir), patch.path))
+                    added_paths.append(
+                        os.path.join(
+                            os.path.abspath(PatchtestParser.repodir), patch.path
+                        )
+                    )
                 elif patch.is_modified_file:
-                    modified_paths.append(os.path.join(os.path.abspath(PatchTestInput.repodir), patch.path))
+                    modified_paths.append(
+                        os.path.join(
+                            os.path.abspath(PatchtestParser.repodir), patch.path
+                        )
+                    )
                 elif patch.is_removed_file:
-                    removed_paths.append(os.path.join(os.path.abspath(PatchTestInput.repodir), patch.path))
+                    removed_paths.append(
+                        os.path.join(
+                            os.path.abspath(PatchtestParser.repodir), patch.path
+                        )
+                    )
 
         data = cls.tinfoil.cooker.recipecaches[''].pkg_fn.items()
 
diff --git a/meta/lib/patchtest/tests/test_mbox.py b/meta/lib/patchtest/tests/test_mbox.py
index 895ffde42b0..c0f9970686a 100644
--- a/meta/lib/patchtest/tests/test_mbox.py
+++ b/meta/lib/patchtest/tests/test_mbox.py
@@ -6,15 +6,15 @@
 
 import base
 import collections
-import patterns
+import patchtest_patterns
 import pyparsing
 import re
 import subprocess
-from data import PatchTestInput
+from patchtest_parser import PatchtestParser
 
 def headlog():
     output = subprocess.check_output(
-        "cd %s; git log --pretty='%%h#%%aN#%%cD:#%%s' -1" % PatchTestInput.repodir,
+        "cd %s; git log --pretty='%%h#%%aN#%%cD:#%%s' -1" % PatchtestParser.repodir,
         universal_newlines=True,
         shell=True
         )
@@ -45,11 +45,13 @@ class TestMbox(base.Base):
     def test_signed_off_by_presence(self):
         for commit in self.commits:
             # skip those patches that revert older commits, these do not required the tag presence
-            if patterns.mbox_revert_shortlog_regex.search_string(commit.shortlog):
+            if patchtest_patterns.mbox_revert_shortlog_regex.search_string(commit.shortlog):
                 continue
-            if not patterns.signed_off_by.search_string(commit.payload):
-                self.fail('Mbox is missing Signed-off-by. Add it manually or with "git commit --amend -s"',
-                          commit=commit)
+            if not patchtest_patterns.signed_off_by.search_string(commit.payload):
+                self.fail(
+                    'Mbox is missing Signed-off-by. Add it manually or with "git commit --amend -s"',
+                    commit=commit,
+                )
 
     def test_shortlog_format(self):
         for commit in self.commits:
@@ -61,7 +63,7 @@ class TestMbox(base.Base):
                 if shortlog.startswith('Revert "'):
                     continue
                 try:
-                    patterns.shortlog.parseString(shortlog)
+                    patchtest_patterns.shortlog.parseString(shortlog)
                 except pyparsing.ParseException as pe:
                     self.fail('Commit shortlog (first line of commit message) should follow the format "<target>: <summary>"',
                               commit=commit)
@@ -73,22 +75,34 @@ class TestMbox(base.Base):
             if shortlog.startswith('Revert "'):
                 continue
             l = len(shortlog)
-            if l > patterns.mbox_shortlog_maxlength:
-                self.fail('Edit shortlog so that it is %d characters or less (currently %d characters)' % (patterns.mbox_shortlog_maxlength, l),
-                          commit=commit)
+            if l > patchtest_patterns.mbox_shortlog_maxlength:
+                self.fail(
+                    "Edit shortlog so that it is %d characters or less (currently %d characters)"
+                    % (patchtest_patterns.mbox_shortlog_maxlength, l),
+                    commit=commit,
+                )
 
     def test_series_merge_on_head(self):
         self.skip("Merge test is disabled for now")
-        if PatchTestInput.repo.patch.branch != "master":
+        if PatchtestParser.repo.patch.branch != "master":
             self.skip(
                 "Skipping merge test since patch is not intended"
                 " for master branch. Target detected is %s"
-                % PatchTestInput.repo.patch.branch
+                % PatchtestParser.repo.patch.branch
             )
-        if not PatchTestInput.repo.canbemerged:
+        if not PatchtestParser.repo.canbemerged:
             commithash, author, date, shortlog = headlog()
-            self.fail('Series does not apply on top of target branch %s' % PatchTestInput.repo.branch,
-                      data=[('Targeted branch', '%s (currently at %s)' % (PatchTestInput.repo.branch, commithash))])
+            self.fail(
+                "Series does not apply on top of target branch %s"
+                % PatchtestParser.repo.patch.branch,
+                data=[
+                    (
+                        "Targeted branch",
+                        "%s (currently at %s)"
+                        % (PatchtestParser.repo.patch.branch, commithash),
+                    )
+                ],
+            )
 
     def test_target_mailing_list(self):
         """Check for other targeted projects"""
@@ -129,19 +143,28 @@ class TestMbox(base.Base):
                 self.fail('Please include a commit message on your patch explaining the change', commit=commit)
 
     def test_bugzilla_entry_format(self):
-        for commit in TestMbox.commits:
-            if not patterns.mbox_bugzilla.search_string(commit.commit_message):
+        for commit in self.commits:
+            if not patchtest_patterns.mbox_bugzilla.search_string(commit.commit_message):
                 self.skip("No bug ID found")
-            elif not patterns.mbox_bugzilla_validation.search_string(commit.commit_message):
-                self.fail('Bugzilla issue ID is not correctly formatted - specify it with format: "[YOCTO #<bugzilla ID>]"', commit=commit)
+            elif not patchtest_patterns.mbox_bugzilla_validation.search_string(
+                commit.commit_message
+            ):
+                self.fail(
+                    'Bugzilla issue ID is not correctly formatted - specify it with format: "[YOCTO #<bugzilla ID>]"',
+                    commit=commit,
+                )
 
     def test_author_valid(self):
         for commit in self.commits:
-            for invalid in patterns.invalid_submitters:
+            for invalid in patchtest_patterns.invalid_submitters:
                 if invalid.search_string(commit.author):
                     self.fail('Invalid author %s. Resend the series with a valid patch author' % commit.author, commit=commit)
 
     def test_non_auh_upgrade(self):
         for commit in self.commits:
-            if patterns.auh_email in commit.commit_message:
-                self.fail('Invalid author %s. Resend the series with a valid patch author' % patterns.auh_email, commit=commit)
+            if patchtest_patterns.auh_email in commit.commit_message:
+                self.fail(
+                    "Invalid author %s. Resend the series with a valid patch author"
+                    % patchtest_patterns.auh_email,
+                    commit=commit,
+                )
diff --git a/meta/lib/patchtest/tests/test_metadata.py b/meta/lib/patchtest/tests/test_metadata.py
index d7e5e187f64..2dee80b0023 100644
--- a/meta/lib/patchtest/tests/test_metadata.py
+++ b/meta/lib/patchtest/tests/test_metadata.py
@@ -5,10 +5,14 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 import base
+import collections
 import os
-import patterns
+import patchtest_patterns
 import pyparsing
-from data import PatchTestInput, PatchTestDataStore
+from patchtest_parser import PatchtestParser
+
+# Data store commonly used to share values between pre and post-merge tests
+PatchTestDataStore = collections.defaultdict(str)
 
 class TestMetadata(base.Metadata):
 
@@ -25,13 +29,13 @@ class TestMetadata(base.Metadata):
             open_flag = 'a'
         with open(auto_conf, open_flag) as fd:
             for pn in self.added:
-                fd.write('LICENSE ??= "%s"\n' % patterns.invalid_license)
+                fd.write('LICENSE ??= "%s"\n' % patchtest_patterns.invalid_license)
 
         no_license = False
         for pn in self.added:
             rd = self.tinfoil.parse_recipe(pn)
-            license = rd.getVar(patterns.metadata_lic)
-            if license == patterns.invalid_license:
+            license = rd.getVar(patchtest_patterns.metadata_lic)
+            if license == patchtest_patterns.invalid_license:
                 no_license = True
                 break
 
@@ -58,11 +62,13 @@ class TestMetadata(base.Metadata):
             # we are not interested in images
             if '/images/' in pathname:
                 continue
-            lic_files_chksum = rd.getVar(patterns.metadata_chksum)
-            if rd.getVar(patterns.license_var) == patterns.closed:
+            lic_files_chksum = rd.getVar(patchtest_patterns.metadata_chksum)
+            if rd.getVar(patchtest_patterns.license_var) == patchtest_patterns.closed:
                 continue
             if not lic_files_chksum:
-                self.fail('%s is missing in newly added recipe' % patterns.metadata_chksum)
+                self.fail(
+                    "%s is missing in newly added recipe" % patchtest_patterns.metadata_chksum
+                )
 
     def test_lic_files_chksum_modified_not_mentioned(self):
         if not self.modified:
@@ -73,11 +79,13 @@ class TestMetadata(base.Metadata):
             if patch.path.endswith('.patch'):
                 continue
             payload = str(patch)
-            if (patterns.lic_chksum_added.search_string(payload) or patterns.lic_chksum_removed.search_string(payload)):
+            if patchtest_patterns.lic_chksum_added.search_string(
+                payload
+            ) or patchtest_patterns.lic_chksum_removed.search_string(payload):
                 # if any patch on the series contain reference on the metadata, fail
                 for commit in self.commits:
-                    if patterns.lictag_re.search_string(commit.commit_message):
-                       break
+                    if patchtest_patterns.lictag_re.search_string(commit.commit_message):
+                        break
                 else:
                     self.fail('LIC_FILES_CHKSUM changed without "License-Update:" tag and description in commit message')
 
@@ -88,16 +96,22 @@ class TestMetadata(base.Metadata):
                 continue
             payload = str(patch)
             for line in payload.splitlines():
-                if patterns.add_mark.search_string(line):
+                if patchtest_patterns.add_mark.search_string(line):
                     current_line_length = len(line[1:])
-                    if current_line_length > patterns.patch_max_line_length:
-                        self.fail('Patch line too long (current length %s, maximum is %s)' % (current_line_length, patterns.patch_max_line_length),
-                                  data=[('Patch', patch.path), ('Line', '%s ...' % line[0:80])])
+                    if current_line_length > patchtest_patterns.patch_max_line_length:
+                        self.fail(
+                            "Patch line too long (current length %s, maximum is %s)"
+                            % (current_line_length, patchtest_patterns.patch_max_line_length),
+                            data=[
+                                ("Patch", patch.path),
+                                ("Line", "%s ..." % line[0:80]),
+                            ],
+                        )
 
     def pretest_src_uri_left_files(self):
         # these tests just make sense on patches that can be merged
-        if not PatchTestInput.repo.canbemerged:
-            self.skip('Patch cannot be merged')
+        if not PatchtestParser.repo.canbemerged:
+            self.skip("Patch cannot be merged")
         if not self.modified:
             self.skip('No modified recipes, skipping pretest')
 
@@ -107,12 +121,14 @@ class TestMetadata(base.Metadata):
             if 'core-image' in pn:
                 continue
             rd = self.tinfoil.parse_recipe(pn)
-            PatchTestDataStore['%s-%s-%s' % (self.shortid(), patterns.metadata_src_uri, pn)] = rd.getVar(patterns.metadata_src_uri)
+            PatchTestDataStore[
+                "%s-%s-%s" % (self.shortid(), patchtest_patterns.metadata_src_uri, pn)
+            ] = rd.getVar(patchtest_patterns.metadata_src_uri)
 
     def test_src_uri_left_files(self):
         # these tests just make sense on patches that can be merged
-        if not PatchTestInput.repo.canbemerged:
-            self.skip('Patch cannot be merged')
+        if not PatchtestParser.repo.canbemerged:
+            self.skip("Patch cannot be merged")
         if not self.modified:
             self.skip('No modified recipes, skipping pretest')
 
@@ -122,11 +138,17 @@ class TestMetadata(base.Metadata):
             if 'core-image' in pn:
                 continue
             rd = self.tinfoil.parse_recipe(pn)
-            PatchTestDataStore['%s-%s-%s' % (self.shortid(), patterns.metadata_src_uri, pn)] = rd.getVar(patterns.metadata_src_uri)
+            PatchTestDataStore[
+                "%s-%s-%s" % (self.shortid(), patchtest_patterns.metadata_src_uri, pn)
+            ] = rd.getVar(patchtest_patterns.metadata_src_uri)
 
         for pn in self.modified:
-            pretest_src_uri = PatchTestDataStore['pre%s-%s-%s' % (self.shortid(), patterns.metadata_src_uri, pn)].split()
-            test_src_uri    = PatchTestDataStore['%s-%s-%s' % (self.shortid(), patterns.metadata_src_uri, pn)].split()
+            pretest_src_uri = PatchTestDataStore[
+                "pre%s-%s-%s" % (self.shortid(), patchtest_patterns.metadata_src_uri, pn)
+            ].split()
+            test_src_uri = PatchTestDataStore[
+                "%s-%s-%s" % (self.shortid(), patchtest_patterns.metadata_src_uri, pn)
+            ].split()
 
             pretest_files = set([os.path.basename(patch) for patch in pretest_src_uri if patch.startswith('file://')])
             test_files    = set([os.path.basename(patch) for patch in test_src_uri    if patch.startswith('file://')])
@@ -159,23 +181,32 @@ class TestMetadata(base.Metadata):
             if 'core-image' in pn:
                 continue
             rd = self.tinfoil.parse_recipe(pn)
-            summary = rd.getVar(patterns.metadata_summary)
+            summary = rd.getVar(patchtest_patterns.metadata_summary)
 
             # "${PN} version ${PN}-${PR}" is the default, so fail if default
-            if summary.startswith('%s version' % pn):
-                self.fail('%s is missing in newly added recipe' % patterns.metadata_summary)
+            if summary.startswith("%s version" % pn):
+                self.fail(
+                    "%s is missing in newly added recipe" % patchtest_patterns.metadata_summary
+                )
 
     def test_cve_check_ignore(self):
         # Skip if we neither modified a recipe or target branches are not
         # Nanbield and newer. CVE_CHECK_IGNORE was first deprecated in Nanbield.
-        if not self.modified or PatchTestInput.repo.patch.branch == "kirkstone" or PatchTestInput.repo.patch.branch == "dunfell":
-            self.skip('No modified recipes or older target branch, skipping test')
+        if (
+            not self.modified
+            or PatchtestParser.repo.patch.branch == "kirkstone"
+            or PatchtestParser.repo.patch.branch == "dunfell"
+        ):
+            self.skip("No modified recipes or older target branch, skipping test")
         for pn in self.modified:
             # we are not interested in images
             if 'core-image' in pn:
                 continue
             rd = self.tinfoil.parse_recipe(pn)
-            cve_check_ignore = rd.getVar(patterns.cve_check_ignore_var)
+            cve_check_ignore = rd.getVar(patchtest_patterns.cve_check_ignore_var)
 
             if cve_check_ignore is not None:
-                self.fail('%s is deprecated and should be replaced by %s' % (patterns.cve_check_ignore_var, patterns.cve_status_var))
+                self.fail(
+                    "%s is deprecated and should be replaced by %s"
+                    % (patchtest_patterns.cve_check_ignore_var, patchtest_patterns.cve_status_var)
+                )
diff --git a/meta/lib/patchtest/tests/test_patch.py b/meta/lib/patchtest/tests/test_patch.py
index d856b216f09..d08b8a50192 100644
--- a/meta/lib/patchtest/tests/test_patch.py
+++ b/meta/lib/patchtest/tests/test_patch.py
@@ -7,7 +7,7 @@
 
 import base
 import os
-import patterns
+import patchtest_patterns
 import pyparsing
 
 class TestPatch(base.Base):
@@ -20,17 +20,17 @@ class TestPatch(base.Base):
             if patch.path.endswith('.patch') and patch.is_added_file:
                 cls.newpatches.append(patch)
 
-        cls.mark = str(patterns.signed_off_by_prefix).strip('"')
+        cls.mark = str(patchtest_patterns.signed_off_by_prefix).strip('"')
 
         # match PatchSignedOffBy.mark with '+' preceding it
-        cls.prog = patterns.patch_signed_off_by
+        cls.prog = patchtest_patterns.patch_signed_off_by
 
     def setUp(self):
         if self.unidiff_parse_error:
             self.skip('Parse error %s' % self.unidiff_parse_error)
 
-        self.valid_status    = ', '.join(patterns.upstream_status_nonliteral_valid_status)
-        self.standard_format = 'Upstream-Status: <Valid status>'
+        self.valid_status = ", ".join(patchtest_patterns.upstream_status_nonliteral_valid_status)
+        self.standard_format = "Upstream-Status: <Valid status>"
 
         # we are just interested in series that introduce CVE patches, thus discard other
         # possibilities: modification to current CVEs, patch directly introduced into the
@@ -45,31 +45,62 @@ class TestPatch(base.Base):
 
         for newpatch in TestPatch.newpatches:
             payload = newpatch.__str__()
-            if not patterns.upstream_status_regex.search_string(payload):
-                self.fail('Added patch file is missing Upstream-Status: <Valid status> in the commit message',
-                          data=[('Standard format', self.standard_format), ('Valid status', self.valid_status)])
+            if not patchtest_patterns.upstream_status_regex.search_string(payload):
+                self.fail(
+                    "Added patch file is missing Upstream-Status: <Valid status> in the commit message",
+                    data=[
+                        ("Standard format", self.standard_format),
+                        ("Valid status", self.valid_status),
+                    ],
+                )
             for line in payload.splitlines():
-                if self.patchmetadata_regex.match(line):
+                if patchtest_patterns.patchmetadata_regex.match(line):
                     continue
-                if patterns.upstream_status_regex.search_string(line):
-                        if patterns.inappropriate.searchString(line):
-                            try:
-                                patterns.upstream_status_inappropriate_info.parseString(line.lstrip('+'))
-                            except pyparsing.ParseException as pe:
-                                self.fail('Upstream-Status is Inappropriate, but no reason was provided',
-                                          data=[('Current', pe.pstr), ('Standard format', 'Upstream-Status: Inappropriate [reason]')])
-                        elif patterns.submitted.searchString(line):
-                            try:
-                                patterns.upstream_status_submitted_info.parseString(line.lstrip('+'))
-                            except pyparsing.ParseException as pe:
-                                self.fail('Upstream-Status is Submitted, but it is not mentioned where',
-                                          data=[('Current', pe.pstr), ('Standard format', 'Upstream-Status: Submitted [where]')])
-                        else:
-                            try:
-                                patterns.upstream_status.parseString(line.lstrip('+'))
-                            except pyparsing.ParseException as pe:
-                                self.fail('Upstream-Status is in incorrect format',
-                                          data=[('Current', pe.pstr), ('Standard format', self.standard_format), ('Valid status', self.valid_status)])
+                if patchtest_patterns.upstream_status_regex.search_string(line):
+                    if patchtest_patterns.inappropriate.searchString(line):
+                        try:
+                            patchtest_patterns.upstream_status_inappropriate_info.parseString(
+                                line.lstrip("+")
+                            )
+                        except pyparsing.ParseException as pe:
+                            self.fail(
+                                "Upstream-Status is Inappropriate, but no reason was provided",
+                                data=[
+                                    ("Current", pe.pstr),
+                                    (
+                                        "Standard format",
+                                        "Upstream-Status: Inappropriate [reason]",
+                                    ),
+                                ],
+                            )
+                    elif patchtest_patterns.submitted.searchString(line):
+                        try:
+                            patchtest_patterns.upstream_status_submitted_info.parseString(
+                                line.lstrip("+")
+                            )
+                        except pyparsing.ParseException as pe:
+                            self.fail(
+                                "Upstream-Status is Submitted, but it is not mentioned where",
+                                data=[
+                                    ("Current", pe.pstr),
+                                    (
+                                        "Standard format",
+                                        "Upstream-Status: Submitted [where]",
+                                    ),
+                                ],
+                            )
+                    else:
+                        try:
+                            patchtest_patterns.upstream_status.parseString(line.lstrip("+"))
+                        except pyparsing.ParseException as pe:
+                            self.fail(
+                                "Upstream-Status is in incorrect format",
+                                data=[
+                                    ("Current", pe.pstr),
+                                    ("Standard format", self.standard_format),
+                                    ("Valid status", self.valid_status),
+                                ],
+                            )
 
     def test_signed_off_by_presence(self):
         if not TestPatch.newpatches:
@@ -78,7 +109,7 @@ class TestPatch(base.Base):
         for newpatch in TestPatch.newpatches:
             payload = newpatch.__str__()
             for line in payload.splitlines():
-                if self.patchmetadata_regex.match(line):
+                if patchtest_patterns.patchmetadata_regex.match(line):
                     continue
                 if TestPatch.prog.search_string(payload):
                     break
@@ -87,10 +118,12 @@ class TestPatch(base.Base):
 
     def test_cve_tag_format(self):
         for commit in TestPatch.commits:
-            if patterns.cve.search_string(commit.shortlog) or patterns.cve.search_string(commit.commit_message):
+            if patchtest_patterns.cve.search_string(
+                commit.shortlog
+            ) or patchtest_patterns.cve.search_string(commit.commit_message):
                 tag_found = False
                 for line in commit.payload.splitlines():
-                    if patterns.cve_payload_tag.search_string(line):
+                    if patchtest_patterns.cve_payload_tag.search_string(line):
                         tag_found = True
                         break
                 if not tag_found:
diff --git a/meta/lib/patchtest/tests/test_python_pylint.py b/meta/lib/patchtest/tests/test_python_pylint.py
index b03fd6f4f65..ec9129bc796 100644
--- a/meta/lib/patchtest/tests/test_python_pylint.py
+++ b/meta/lib/patchtest/tests/test_python_pylint.py
@@ -5,9 +5,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 import base
-import patterns
 from io import StringIO
-from data import PatchTestInput
+from patchtest_parser import PatchtestParser
 from pylint.reporters.text import TextReporter
 import pylint.lint as lint
 
diff --git a/scripts/patchtest b/scripts/patchtest
index 3ca8c6e48fe..278fc4e6e09 100755
--- a/scripts/patchtest
+++ b/scripts/patchtest
@@ -22,7 +22,7 @@ sys.path.insert(0, os.path.dirname(os.path.realpath(__file__)))
 # Include patchtest library
 sys.path.insert(0, os.path.join(os.path.dirname(os.path.realpath(__file__)), '../meta/lib/patchtest'))
 
-from data import PatchTestInput
+from patchtest_parser import PatchtestParser
 from repo import PatchTestRepo
 
 logger = logging.getLogger("patchtest")
@@ -47,10 +47,10 @@ def getResult(patch, mergepatch, logfile=None):
         def startTestRun(self):
             # let's create the repo already, it can be used later on
             repoargs = {
-                'repodir': PatchTestInput.repodir,
-                'commit' : PatchTestInput.basecommit,
-                'branch' : PatchTestInput.basebranch,
-                'patch'  : patch,
+                "repodir": PatchtestParser.repodir,
+                "commit": PatchtestParser.basecommit,
+                "branch": PatchtestParser.basebranch,
+                "patch": patch,
             }
 
             self.repo_error    = False
@@ -58,7 +58,7 @@ def getResult(patch, mergepatch, logfile=None):
             self.test_failure  = False
 
             try:
-                self.repo = PatchTestInput.repo = PatchTestRepo(**repoargs)
+                self.repo = PatchtestParser.repo = PatchTestRepo(**repoargs)
             except:
                 logger.error(traceback.print_exc())
                 self.repo_error = True
@@ -129,7 +129,11 @@ def _runner(resultklass, prefix=None):
         loader.testMethodPrefix = prefix
 
     # create the suite with discovered tests and the corresponding runner
-    suite = loader.discover(start_dir=PatchTestInput.testdir, pattern=PatchTestInput.pattern, top_level_dir=PatchTestInput.topdir)
+    suite = loader.discover(
+        start_dir=PatchtestParser.testdir,
+        pattern=PatchtestParser.pattern,
+        top_level_dir=PatchtestParser.topdir,
+    )
     ntc = suite.countTestCases()
 
     # if there are no test cases, just quit
@@ -173,12 +177,12 @@ def run(patch, logfile=None):
 
 def main():
     tmp_patch = False
-    patch_path = PatchTestInput.patch_path
-    log_results = PatchTestInput.log_results
+    patch_path = PatchtestParser.patch_path
+    log_results = PatchtestParser.log_results
     log_path = None
     patch_list = None
 
-    git_status = os.popen("(cd %s && git status)" % PatchTestInput.repodir).read()
+    git_status = os.popen("(cd %s && git status)" % PatchtestParser.repodir).read()
     status_matches = ["Changes not staged for commit", "Changes to be committed"]
     if any([match in git_status for match in status_matches]):
         logger.error("patchtest: there are uncommitted changes in the target repo that would be overwritten. Please commit or restore them before running patchtest")
@@ -213,16 +217,16 @@ def main():
 if __name__ == '__main__':
     ret = 1
 
-    # Parse the command line arguments and store it on the PatchTestInput namespace
-    PatchTestInput.set_namespace()
+    # Parse the command line arguments and store it on the PatchtestParser namespace
+    PatchtestParser.set_namespace()
 
     # set debugging level
-    if PatchTestInput.debug:
+    if PatchtestParser.debug:
         logger.setLevel(logging.DEBUG)
 
     # if topdir not define, default it to testdir
-    if not PatchTestInput.topdir:
-        PatchTestInput.topdir = PatchTestInput.testdir
+    if not PatchtestParser.topdir:
+        PatchtestParser.topdir = PatchtestParser.testdir
 
     try:
         ret = main()
-- 
2.39.5


