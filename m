Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E86CF9C79
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 11:55:13 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web10.11956.1727178912655011125
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 04:55:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=b01RGCpM;
 spf=pass (domain: baylibre.com, ip: 209.85.219.174, mailfrom: tgamblin@baylibre.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e1a9e4fa5aaso4813773276.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 04:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727178911; x=1727783711; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UA8bd5v5UhPJutJbve16W3wVyBZ6CD+Z3skJV94ZkDY=;
        b=b01RGCpMYYLyvm/b7khxDUII1L/hyvI+iUSKfEU7LcgBuzJx8fj7KZskUZ+O43OHtn
         +HeUj0voPz81Lis8442cGtpmyy5FVj6nDDCUiRxyNQNMMiAKIk3l8YzSxxDEataBicIY
         K4XrowCpHwtPOSZ9wmDwlDwIzWPs99X3+GEb9XdL6mo2SveQbYY/jaujWjvu+p5exHT5
         nTgc0vSqf1IfSRSRjQqbxiv+5162OgQaA+wbgyL5tOY0uCbGL6gWT3JOq/8EMphgcvGC
         FNYw3HmJ4CrJ3TROw8BcgD9MuYUC5cN4kRwyDXmfjg/7JN+PKJzW7N6dWSgjMI55St2q
         9d+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727178911; x=1727783711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UA8bd5v5UhPJutJbve16W3wVyBZ6CD+Z3skJV94ZkDY=;
        b=vXw3hVuF4G2/JRHlzVIkyoVwORon9y05dRt4x7jFXgGau5avA/I/ncSfHhY5U5QrdA
         /6Kg9FEKqDs3wh42wg6jkaHlM29ZTFHasJhi2RWehQQZWic85sMhws3W6zyACjyMLRqF
         aNEHQ1zVBloeApb5af3yM//MEd2UAoBpc8r6rjsykVaMchgiAtO+a+/zifecGdxUpKIk
         wZqAStMSHD5hiKazVubZMALGdlPwStirGKx2OwD37Qbxu26iOIz0KVbJcEX1Cd881PN7
         +XyXM0t3x7xQPyqlBppUBex/v7+yR98NwKEk6aCtmSrDVbwYiYmlwrnuzT5U37AEc5gf
         bxOg==
X-Gm-Message-State: AOJu0YwbRXNIVBdkF+PpcFoFrFBCc0Gnmn2j82zQfxl4RDXS9MCYZcxE
	5eoTJtibxfPn43fuCed0/FXkvhfovefcTcCct+6nUOxgrWOFVY5eamL4Ug/DVcwMgQIujgFnjR4
	+dak=
X-Google-Smtp-Source: AGHT+IGIiaUkbFRsEEDLq18NSKxfdVrntMUq1IQPw5JfV9AJjzMpMNlhNNPfHhnCTtySzIusO7nccA==
X-Received: by 2002:a05:6902:2b8e:b0:e13:c854:2a2 with SMTP id 3f1490d57ef6-e2250c290ddmr12515505276.11.1727178910031;
        Tue, 24 Sep 2024 04:55:10 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b525456d3sm5553611cf.13.2024.09.24.04.55.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 04:55:09 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 6/6] patchtest: use black to format libraries
Date: Tue, 24 Sep 2024 07:55:03 -0400
Message-Id: <20240924115503.1599651-7-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240924115503.1599651-1-tgamblin@baylibre.com>
References: <20240924115503.1599651-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 11:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204856

Black makes things easier to read.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/mbox.py                    |  44 +++---
 meta/lib/patchtest/patchtest_parser.py        | 106 ++++++++-----
 meta/lib/patchtest/patchtest_patterns.py      |  84 ++++++----
 meta/lib/patchtest/repo.py                    |  32 ++--
 meta/lib/patchtest/selftest/selftest          |  92 ++++++++---
 meta/lib/patchtest/tests/base.py              |  86 ++++++-----
 meta/lib/patchtest/tests/test_mbox.py         | 144 +++++++++++++-----
 meta/lib/patchtest/tests/test_metadata.py     |  94 ++++++++----
 meta/lib/patchtest/tests/test_patch.py        |  39 +++--
 .../lib/patchtest/tests/test_python_pylint.py |  45 ++++--
 scripts/patchtest                             | 113 +++++++++-----
 scripts/patchtest-get-branch                  |  54 ++++---
 scripts/patchtest-send-results                |  66 +++++---
 13 files changed, 660 insertions(+), 339 deletions(-)

diff --git a/meta/lib/patchtest/mbox.py b/meta/lib/patchtest/mbox.py
index 1d95819b7ae..aad07356f1f 100644
--- a/meta/lib/patchtest/mbox.py
+++ b/meta/lib/patchtest/mbox.py
@@ -13,11 +13,12 @@
 import email
 import re
 
+
 # From: https://stackoverflow.com/questions/59681461/read-a-big-mbox-file-with-python
 class MboxReader:
     def __init__(self, filepath):
-        self.handle = open(filepath, 'rb')
-        assert self.handle.readline().startswith(b'From ')
+        self.handle = open(filepath, "rb")
+        assert self.handle.readline().startswith(b"From ")
 
     def __enter__(self):
         return self
@@ -32,24 +33,26 @@ class MboxReader:
         lines = []
         while True:
             line = self.handle.readline()
-            if line == b'' or line.startswith(b'From '):
-                yield email.message_from_bytes(b''.join(lines))
-                if line == b'':
+            if line == b"" or line.startswith(b"From "):
+                yield email.message_from_bytes(b"".join(lines))
+                if line == b"":
                     break
                 lines = []
                 continue
             lines.append(line)
 
+
 class Patch:
     def __init__(self, data):
-        self.author = data['From']
-        self.to = data['To']
-        self.cc = data['Cc']
-        self.subject = data['Subject']
-        self.split_body = re.split('---', data.get_payload(), maxsplit=1)
+        self.author = data["From"]
+        self.to = data["To"]
+        self.cc = data["Cc"]
+        self.subject = data["Subject"]
+        self.split_body = re.split("---", data.get_payload(), maxsplit=1)
         self.commit_message = self.split_body[0]
         self.diff = self.split_body[1]
 
+
 class PatchSeries:
     def __init__(self, filepath):
         with MboxReader(filepath) as mbox:
@@ -78,8 +81,8 @@ class PatchSeries:
         branch, branches, valid_branches = None, [], []
 
         if fullprefix:
-            prefix = fullprefix.strip('[]')
-            branches = [ b.strip() for b in prefix.split(',')]
+            prefix = fullprefix.strip("[]")
+            branches = [b.strip() for b in prefix.split(",")]
             valid_branches = [b for b in branches if PatchSeries.valid_branch(b)]
 
         if len(valid_branches):
@@ -89,20 +92,21 @@ class PatchSeries:
         # found, then assume there was no branch tag in the subject line
         # and that the patch targets master
         if branch is not None:
-            return branch.split(']')[0]
+            return branch.split("]")[0]
         else:
             return "master"
 
     @staticmethod
     def valid_branch(branch):
-        """ Check if branch is valid name """
+        """Check if branch is valid name"""
         lbranch = branch.lower()
 
-        invalid  = lbranch.startswith('patch') or \
-                   lbranch.startswith('rfc') or \
-                   lbranch.startswith('resend') or \
-                   re.search(r'^v\d+', lbranch) or \
-                   re.search(r'^\d+/\d+', lbranch)
+        invalid = (
+            lbranch.startswith("patch")
+            or lbranch.startswith("rfc")
+            or lbranch.startswith("resend")
+            or re.search(r"^v\d+", lbranch)
+            or re.search(r"^\d+/\d+", lbranch)
+        )
 
         return not invalid
-
diff --git a/meta/lib/patchtest/patchtest_parser.py b/meta/lib/patchtest/patchtest_parser.py
index 2a11cb76c23..f1fef143245 100644
--- a/meta/lib/patchtest/patchtest_parser.py
+++ b/meta/lib/patchtest/patchtest_parser.py
@@ -19,6 +19,7 @@ import argparse
 default_testdir = os.path.abspath(os.path.dirname(__file__) + "/tests")
 default_repodir = os.path.abspath(os.path.dirname(__file__) + "/../../..")
 
+
 class PatchtestParser(object):
     """Abstract the patchtest argument parser"""
 
@@ -33,46 +34,69 @@ class PatchtestParser(object):
 
         target_patch_group = parser.add_mutually_exclusive_group(required=True)
 
-        target_patch_group.add_argument('--patch', metavar='PATCH', dest='patch_path',
-                            help='The patch to be tested')
-
-        target_patch_group.add_argument('--directory', metavar='DIRECTORY', dest='patch_path',
-                            help='The directory containing patches to be tested')
-
-        parser.add_argument('--repodir', metavar='REPO',
-                            default=default_repodir,
-                            help="Name of the repository where patch is merged")
-
-        parser.add_argument('--testdir', metavar='TESTDIR',
-                            default=default_testdir,
-                            help="Directory where test cases are located")
-
-        parser.add_argument('--top-level-directory', '-t',
-                            dest='topdir',
-                            default=None,
-                            help="Top level directory of project (defaults to start directory)")
-
-        parser.add_argument('--pattern', '-p',
-                            dest='pattern',
-                            default='test*.py',
-                            help="Pattern to match test files")
-
-        parser.add_argument('--base-branch', '-b',
-                            dest='basebranch',
-                            help="Branch name used by patchtest to branch from. By default, it uses the current one.")
-
-        parser.add_argument('--base-commit', '-c',
-                            dest='basecommit',
-                            help="Commit ID used by patchtest to branch from. By default, it uses HEAD.")
-
-        parser.add_argument('--debug', '-d',
-                            action='store_true',
-                            help='Enable debug output')
-
-        parser.add_argument('--log-results', 
-                            action='store_true', 
-                            help='Enable logging to a file matching the target patch name with ".testresult" appended')
-
+        target_patch_group.add_argument(
+            "--patch", metavar="PATCH", dest="patch_path", help="The patch to be tested"
+        )
+
+        target_patch_group.add_argument(
+            "--directory",
+            metavar="DIRECTORY",
+            dest="patch_path",
+            help="The directory containing patches to be tested",
+        )
+
+        parser.add_argument(
+            "--repodir",
+            metavar="REPO",
+            default=default_repodir,
+            help="Name of the repository where patch is merged",
+        )
+
+        parser.add_argument(
+            "--testdir",
+            metavar="TESTDIR",
+            default=default_testdir,
+            help="Directory where test cases are located",
+        )
+
+        parser.add_argument(
+            "--top-level-directory",
+            "-t",
+            dest="topdir",
+            default=None,
+            help="Top level directory of project (defaults to start directory)",
+        )
+
+        parser.add_argument(
+            "--pattern",
+            "-p",
+            dest="pattern",
+            default="test*.py",
+            help="Pattern to match test files",
+        )
+
+        parser.add_argument(
+            "--base-branch",
+            "-b",
+            dest="basebranch",
+            help="Branch name used by patchtest to branch from. By default, it uses the current one.",
+        )
+
+        parser.add_argument(
+            "--base-commit",
+            "-c",
+            dest="basecommit",
+            help="Commit ID used by patchtest to branch from. By default, it uses HEAD.",
+        )
+
+        parser.add_argument(
+            "--debug", "-d", action="store_true", help="Enable debug output"
+        )
+
+        parser.add_argument(
+            "--log-results",
+            action="store_true",
+            help='Enable logging to a file matching the target patch name with ".testresult" appended',
+        )
 
         return parser
-
diff --git a/meta/lib/patchtest/patchtest_patterns.py b/meta/lib/patchtest/patchtest_patterns.py
index 8c2e192fc9f..f332a070e5d 100644
--- a/meta/lib/patchtest/patchtest_patterns.py
+++ b/meta/lib/patchtest/patchtest_patterns.py
@@ -17,23 +17,23 @@ inappropriate = pyparsing.CaselessLiteral("Inappropriate")
 submitted = pyparsing.CaselessLiteral("Submitted")
 
 # word related
-nestexpr = pyparsing.nestedExpr(opener='[', closer=']')
+nestexpr = pyparsing.nestedExpr(opener="[", closer="]")
 inappropriateinfo = pyparsing.Literal("Inappropriate") + nestexpr
 submittedinfo = pyparsing.Literal("Submitted") + nestexpr
 word = pyparsing.Word(pyparsing.alphas)
-worddot = pyparsing.Word(pyparsing.alphas+".")
+worddot = pyparsing.Word(pyparsing.alphas + ".")
 
 # metadata
 
-metadata_lic = 'LICENSE'
-invalid_license = 'PATCHTESTINVALID'
-metadata_chksum = 'LIC_FILES_CHKSUM'
-license_var  = 'LICENSE'
-closed   = 'CLOSED'
-lictag_re  = pyparsing.AtLineStart("License-Update:")
+metadata_lic = "LICENSE"
+invalid_license = "PATCHTESTINVALID"
+metadata_chksum = "LIC_FILES_CHKSUM"
+license_var = "LICENSE"
+closed = "CLOSED"
+lictag_re = pyparsing.AtLineStart("License-Update:")
 lic_chksum_added = pyparsing.AtLineStart("+" + metadata_chksum)
 lic_chksum_removed = pyparsing.AtLineStart("-" + metadata_chksum)
-add_mark = pyparsing.Regex('\\+ ')
+add_mark = pyparsing.Regex("\\+ ")
 patch_max_line_length = 200
 metadata_src_uri = "SRC_URI"
 metadata_summary = "SUMMARY"
@@ -42,20 +42,20 @@ cve_status_var = "CVE_STATUS"
 endcommit_messages_regex = re.compile(
     r"\(From \w+-\w+ rev:|(?<!\S)Signed-off-by|(?<!\S)---\n"
 )
-patchmetadata_regex = re.compile(
-    r"-{3} \S+|\+{3} \S+|@{2} -\d+,\d+ \+\d+,\d+ @{2} \S+"
-)
+patchmetadata_regex = re.compile(r"-{3} \S+|\+{3} \S+|@{2} -\d+,\d+ \+\d+,\d+ @{2} \S+")
 
 # mbox
-auh_email = 'auh@yoctoproject.org'
+auh_email = "auh@yoctoproject.org"
 
-invalid_submitters = [pyparsing.Regex("^Upgrade Helper.+"),
-            pyparsing.Regex(auh_email),
-            pyparsing.Regex("uh@not\.set"),
-            pyparsing.Regex("\S+@example\.com")]
+invalid_submitters = [
+    pyparsing.Regex("^Upgrade Helper.+"),
+    pyparsing.Regex(auh_email),
+    pyparsing.Regex("uh@not\.set"),
+    pyparsing.Regex("\S+@example\.com"),
+]
 
-mbox_bugzilla = pyparsing.Regex('\[\s?YOCTO.*\]')
-mbox_bugzilla_validation = pyparsing.Regex('\[(\s?YOCTO\s?#\s?(\d+)\s?,?)+\]')
+mbox_bugzilla = pyparsing.Regex("\[\s?YOCTO.*\]")
+mbox_bugzilla_validation = pyparsing.Regex("\[(\s?YOCTO\s?#\s?(\d+)\s?,?)+\]")
 mbox_revert_shortlog_regex = pyparsing.Regex('Revert\s+".*"')
 mbox_shortlog_maxlength = 90
 
@@ -67,30 +67,56 @@ upstream_status_regex = pyparsing.AtLineStart("+" + "Upstream-Status")
 
 # shortlog
 
-shortlog_target = pyparsing.OneOrMore(pyparsing.Word(pyparsing.printables.replace(':','')))
+shortlog_target = pyparsing.OneOrMore(
+    pyparsing.Word(pyparsing.printables.replace(":", ""))
+)
 shortlog_summary = pyparsing.OneOrMore(pyparsing.Word(pyparsing.printables))
 shortlog = line_start + shortlog_target + colon + shortlog_summary + line_end
 
 # signed-off-bys
 
-email_pattern = pyparsing.Regex(r"(?P<user>[A-Za-z0-9._%+-]+)@(?P<hostname>[A-Za-z0-9.-]+)\.(?P<domain>[A-Za-z]{2,})")
+email_pattern = pyparsing.Regex(
+    r"(?P<user>[A-Za-z0-9._%+-]+)@(?P<hostname>[A-Za-z0-9.-]+)\.(?P<domain>[A-Za-z]{2,})"
+)
 
 signed_off_by_prefix = pyparsing.Literal("Signed-off-by:")
-signed_off_by_name = pyparsing.Regex('\S+.*(?= <)')
+signed_off_by_name = pyparsing.Regex("\S+.*(?= <)")
 signed_off_by_email = lessthan + email_pattern + greaterthan
-signed_off_by = pyparsing.AtLineStart(signed_off_by_prefix + signed_off_by_name + signed_off_by_email)
-patch_signed_off_by = pyparsing.AtLineStart("+" + signed_off_by_prefix + signed_off_by_name + signed_off_by_email)
+signed_off_by = pyparsing.AtLineStart(
+    signed_off_by_prefix + signed_off_by_name + signed_off_by_email
+)
+patch_signed_off_by = pyparsing.AtLineStart(
+    "+" + signed_off_by_prefix + signed_off_by_name + signed_off_by_email
+)
 
 # upstream-status
 
-upstream_status_literal_valid_status = ["Pending", "Backport", "Denied", "Inappropriate", "Submitted"]
-upstream_status_nonliteral_valid_status = ["Pending", "Backport", "Denied", "Inappropriate [reason]", "Submitted [where]"]
+upstream_status_literal_valid_status = [
+    "Pending",
+    "Backport",
+    "Denied",
+    "Inappropriate",
+    "Submitted",
+]
+upstream_status_nonliteral_valid_status = [
+    "Pending",
+    "Backport",
+    "Denied",
+    "Inappropriate [reason]",
+    "Submitted [where]",
+]
 
 upstream_status_valid_status = pyparsing.Or(
     [pyparsing.Literal(status) for status in upstream_status_literal_valid_status]
 )
 
 upstream_status_prefix = pyparsing.Literal("Upstream-Status")
-upstream_status = line_start + upstream_status_prefix + colon + upstream_status_valid_status
-upstream_status_inappropriate_info = line_start + upstream_status_prefix + colon + inappropriateinfo
-upstream_status_submitted_info = line_start + upstream_status_prefix + colon + submittedinfo
+upstream_status = (
+    line_start + upstream_status_prefix + colon + upstream_status_valid_status
+)
+upstream_status_inappropriate_info = (
+    line_start + upstream_status_prefix + colon + inappropriateinfo
+)
+upstream_status_submitted_info = (
+    line_start + upstream_status_prefix + colon + submittedinfo
+)
diff --git a/meta/lib/patchtest/repo.py b/meta/lib/patchtest/repo.py
index 8ec8f68a0bc..89ef2c2a5a4 100644
--- a/meta/lib/patchtest/repo.py
+++ b/meta/lib/patchtest/repo.py
@@ -12,10 +12,11 @@ import git
 import os
 import mbox
 
+
 class PatchTestRepo(object):
 
     # prefixes used for temporal branches/stashes
-    prefix = 'patchtest'
+    prefix = "patchtest"
 
     def __init__(self, patch, repodir, commit=None, branch=None):
         self.repodir = repodir
@@ -28,23 +29,27 @@ class PatchTestRepo(object):
         valid_patch_branch = None
         if self.patch.branch in self.repo.branches:
             valid_patch_branch = self.patch.branch
-            
+
         # Target Commit
         # Priority (top has highest priority):
         #    1. commit given at cmd line
         #    2. branch given at cmd line
         #    3. branch given at the patch
         #    3. current HEAD
-        self._commit = self._get_commitid(commit) or \
-          self._get_commitid(branch) or \
-          self._get_commitid(valid_patch_branch) or \
-          self._get_commitid('HEAD')
+        self._commit = (
+            self._get_commitid(commit)
+            or self._get_commitid(branch)
+            or self._get_commitid(valid_patch_branch)
+            or self._get_commitid("HEAD")
+        )
 
         self._workingbranch = "%s_%s" % (PatchTestRepo.prefix, os.getpid())
 
         # create working branch. Use the '-B' flag so that we just
         # check out the existing one if it's there
-        self.repo.git.execute(['git', 'checkout', '-B', self._workingbranch, self._commit])
+        self.repo.git.execute(
+            ["git", "checkout", "-B", self._workingbranch, self._commit]
+        )
 
         self._patchmerged = False
 
@@ -52,7 +57,10 @@ class PatchTestRepo(object):
         self._patchcanbemerged = True
         try:
             # Make sure to get the absolute path of the file
-            self.repo.git.execute(['git', 'apply', '--check', os.path.abspath(self.patch.path)], with_exceptions=True)
+            self.repo.git.execute(
+                ["git", "apply", "--check", os.path.abspath(self.patch.path)],
+                with_exceptions=True,
+            )
         except git.exc.GitCommandError as ce:
             self._patchcanbemerged = False
 
@@ -76,10 +84,12 @@ class PatchTestRepo(object):
 
     def merge(self):
         if self._patchcanbemerged:
-            self.repo.git.execute(['git', 'am', '--keep-cr', os.path.abspath(self.patch.path)])
+            self.repo.git.execute(
+                ["git", "am", "--keep-cr", os.path.abspath(self.patch.path)]
+            )
             self._patchmerged = True
 
     def clean(self):
-        self.repo.git.execute(['git', 'checkout', self.current_branch])
-        self.repo.git.execute(['git', 'branch', '-D', self._workingbranch])
+        self.repo.git.execute(["git", "checkout", self.current_branch])
+        self.repo.git.execute(["git", "branch", "-D", self._workingbranch])
         self._patchmerged = False
diff --git a/meta/lib/patchtest/selftest/selftest b/meta/lib/patchtest/selftest/selftest
index 6fad50ce616..9df6ecf7c68 100755
--- a/meta/lib/patchtest/selftest/selftest
+++ b/meta/lib/patchtest/selftest/selftest
@@ -11,18 +11,33 @@ import subprocess
 import sys
 
 currentdir = os.path.dirname(os.path.abspath(__file__))
-patchesdir = os.path.join(currentdir, 'files')
-topdir     = os.path.dirname(currentdir)
-parentdir  = os.path.dirname(topdir)
+patchesdir = os.path.join(currentdir, "files")
+topdir = os.path.dirname(currentdir)
+parentdir = os.path.dirname(topdir)
 
 # path to the repo root
 repodir = os.path.dirname(os.path.dirname(parentdir))
 
-def print_results(passcount, failcount, skipcount, xpasscount, xfailcount, xskipcount, errorcount):
-    total = passcount + skipcount + failcount + xpasscount + xfailcount + xskipcount + errorcount
-    print("============================================================================")
+
+def print_results(
+    passcount, failcount, skipcount, xpasscount, xfailcount, xskipcount, errorcount
+):
+    total = (
+        passcount
+        + skipcount
+        + failcount
+        + xpasscount
+        + xfailcount
+        + xskipcount
+        + errorcount
+    )
+    print(
+        "============================================================================"
+    )
     print("Testsuite summary for %s" % os.path.basename(topdir))
-    print("============================================================================")
+    print(
+        "============================================================================"
+    )
     print("# TOTAL: %s" % str(total))
     print("# XPASS: %s" % str(xpasscount))
     print("# XFAIL: %s" % str(xfailcount))
@@ -31,19 +46,29 @@ def print_results(passcount, failcount, skipcount, xpasscount, xfailcount, xskip
     print("# FAIL: %s" % str(failcount))
     print("# SKIP: %s" % str(skipcount))
     print("# ERROR: %s" % str(errorcount))
-    print("============================================================================")
+    print(
+        "============================================================================"
+    )
+
 
 # Once the tests are in oe-core, we can remove the testdir param and use os.path.dirname to get relative paths
 def test(root, patch):
     res = True
     patchpath = os.path.abspath(os.path.join(root, patch))
-    
-    cmd     = 'patchtest --repodir %s --testdir %s/tests --patch %s' % (repodir, topdir, patchpath)
-    results = subprocess.check_output(cmd, stderr=subprocess.STDOUT, universal_newlines=True, shell=True)
+
+    cmd = "patchtest --repodir %s --testdir %s/tests --patch %s" % (
+        repodir,
+        topdir,
+        patchpath,
+    )
+    results = subprocess.check_output(
+        cmd, stderr=subprocess.STDOUT, universal_newlines=True, shell=True
+    )
 
     return results
 
-if __name__ == '__main__':
+
+if __name__ == "__main__":
     passcount = 0
     failcount = 0
     skipcount = 0
@@ -53,31 +78,47 @@ if __name__ == '__main__':
     errorcount = 0
 
     results = None
-        
+
     for root, dirs, patches in os.walk(patchesdir):
         for patch in patches:
             results = test(root, patch)
 
-            a = patch.split('.')
+            a = patch.split(".")
             klass, testname = a[0], a[1]
             expected_result = a[-1]
-            testid          = ".%s.%s" % (klass,testname)
+            testid = ".%s.%s" % (klass, testname)
 
             for resultline in results.splitlines():
                 if testid in resultline:
-                    result, _ = resultline.split(':', 1)
+                    result, _ = resultline.split(":", 1)
 
                     if expected_result.upper() == "FAIL" and result.upper() == "FAIL":
                         xfailcount = xfailcount + 1
-                        print("XFAIL: %s (file: %s)" % (testid.strip("."), os.path.basename(patch)))
+                        print(
+                            "XFAIL: %s (file: %s)"
+                            % (testid.strip("."), os.path.basename(patch))
+                        )
                     elif expected_result.upper() == "PASS" and result.upper() == "PASS":
                         xpasscount = xpasscount + 1
-                        print("XPASS: %s (file: %s)" % (testid.strip("."), os.path.basename(patch)))
+                        print(
+                            "XPASS: %s (file: %s)"
+                            % (testid.strip("."), os.path.basename(patch))
+                        )
                     elif expected_result.upper() == "SKIP" and result.upper() == "SKIP":
                         xskipcount = xskipcount + 1
-                        print("XSKIP: %s (file: %s)" % (testid.strip("."), os.path.basename(patch)))
+                        print(
+                            "XSKIP: %s (file: %s)"
+                            % (testid.strip("."), os.path.basename(patch))
+                        )
                     else:
-                        print("%s: %s (%s)" % (result.upper(), testid.strip("."), os.path.basename(patch)))
+                        print(
+                            "%s: %s (%s)"
+                            % (
+                                result.upper(),
+                                testid.strip("."),
+                                os.path.basename(patch),
+                            )
+                        )
                         if result.upper() == "PASS":
                             passcount = passcount + 1
                         elif result.upper() == "FAIL":
@@ -85,10 +126,15 @@ if __name__ == '__main__':
                         elif result.upper() == "SKIP":
                             skipcount = skipcount + 1
                         else:
-                            print("Bad result on test %s against %s" % (testid.strip("."), os.path.basename(patch)))
+                            print(
+                                "Bad result on test %s against %s"
+                                % (testid.strip("."), os.path.basename(patch))
+                            )
                             errorcount = errorcount + 1
                     break
             else:
-                print ("No test for=%s" % patch)
+                print("No test for=%s" % patch)
 
-    print_results(passcount, failcount, skipcount, xpasscount, xfailcount, xskipcount, errorcount)
+    print_results(
+        passcount, failcount, skipcount, xpasscount, xfailcount, xskipcount, errorcount
+    )
diff --git a/meta/lib/patchtest/tests/base.py b/meta/lib/patchtest/tests/base.py
index 919ca136bb4..a0e29e7f53c 100644
--- a/meta/lib/patchtest/tests/base.py
+++ b/meta/lib/patchtest/tests/base.py
@@ -26,40 +26,43 @@ Commit = collections.namedtuple(
     "Commit", ["author", "subject", "commit_message", "shortlog", "payload"]
 )
 
-Commit = collections.namedtuple('Commit', ['author', 'subject', 'commit_message', 'shortlog', 'payload'])
 
 class PatchtestOEError(Exception):
     """Exception for handling patchtest-oe errors"""
+
     def __init__(self, message, exitcode=1):
         super().__init__(message)
         self.exitcode = exitcode
 
+
 class Base(unittest.TestCase):
     # if unit test fails, fail message will throw at least the following JSON: {"id": <testid>}
 
     @staticmethod
     def msg_to_commit(msg):
         payload = msg.get_payload()
-        return Commit(subject=msg['subject'].replace('\n', ' ').replace('  ', ' '),
-                      author=msg.get('From'),
-                      shortlog=Base.shortlog(msg['subject']),
-                      commit_message=Base.commit_message(payload),
-                      payload=payload)
+        return Commit(
+            subject=msg["subject"].replace("\n", " ").replace("  ", " "),
+            author=msg.get("From"),
+            shortlog=Base.shortlog(msg["subject"]),
+            commit_message=Base.commit_message(payload),
+            payload=payload,
+        )
 
     @staticmethod
     def commit_message(payload):
         commit_message = payload.__str__()
         match = patchtest_patterns.endcommit_messages_regex.search(payload)
         if match:
-            commit_message = payload[:match.start()]
+            commit_message = payload[: match.start()]
         return commit_message
 
     @staticmethod
     def shortlog(shlog):
         # remove possible prefix (between brackets) before colon
-        start = shlog.find(']', 0, shlog.find(':'))
+        start = shlog.find("]", 0, shlog.find(":"))
         # remove also newlines and spaces at both sides
-        return shlog[start + 1:].replace('\n', '').strip()
+        return shlog[start + 1 :].replace("\n", "").strip()
 
     @classmethod
     def setUpClass(cls):
@@ -68,7 +71,7 @@ class Base(unittest.TestCase):
         cls.mbox = mailbox.mbox(PatchtestParser.repo.patch.path)
 
         # Patch may be malformed, so try parsing it
-        cls.unidiff_parse_error = ''
+        cls.unidiff_parse_error = ""
         cls.patchset = None
         try:
             cls.patchset = unidiff.PatchSet.from_filename(
@@ -81,7 +84,7 @@ class Base(unittest.TestCase):
         # Easy to iterate list of commits
         cls.commits = []
         for msg in cls.mbox:
-            if msg['subject'] and msg.get_payload():
+            if msg["subject"] and msg.get_payload():
                 cls.commits.append(Base.msg_to_commit(msg))
 
         cls.setUpClassLocal()
@@ -99,38 +102,36 @@ class Base(unittest.TestCase):
         pass
 
     def fail(self, issue, fix=None, commit=None, data=None):
-        """ Convert to a JSON string failure data"""
-        value = {'id': self.id(),
-                 'issue': issue}
+        """Convert to a JSON string failure data"""
+        value = {"id": self.id(), "issue": issue}
 
         if fix:
-            value['fix'] = fix
+            value["fix"] = fix
         if commit:
-            value['commit'] = {'subject': commit.subject,
-                               'shortlog': commit.shortlog}
+            value["commit"] = {"subject": commit.subject, "shortlog": commit.shortlog}
 
         # extend return value with other useful info
         if data:
-            value['data'] = data
+            value["data"] = data
 
         return super(Base, self).fail(json.dumps(value))
 
     def skip(self, issue, data=None):
-        """ Convert the skip string to JSON"""
-        value = {'id': self.id(),
-                 'issue': issue}
+        """Convert the skip string to JSON"""
+        value = {"id": self.id(), "issue": issue}
 
         # extend return value with other useful info
         if data:
-            value['data'] = data
+            value["data"] = data
 
         return super(Base, self).skipTest(json.dumps(value))
 
     def shortid(self):
-        return self.id().split('.')[-1]
+        return self.id().split(".")[-1]
 
     def __str__(self):
-        return json.dumps({'id': self.id()})
+        return json.dumps({"id": self.id()})
+
 
 class Metadata(Base):
     @classmethod
@@ -154,19 +155,20 @@ class Metadata(Base):
             if scripts_path not in sys.path:
                 sys.path.insert(0, scripts_path)
             import scriptpath
+
             scriptpath.add_bitbake_lib_path()
             import bb.tinfoil
         except ImportError:
-            raise PatchtestOEError('Could not import tinfoil module')
+            raise PatchtestOEError("Could not import tinfoil module")
 
         orig_cwd = os.path.abspath(os.curdir)
 
         # Load tinfoil
         tinfoil = None
         try:
-            builddir = os.environ.get('BUILDDIR')
+            builddir = os.environ.get("BUILDDIR")
             if not builddir:
-                logger.warn('Bitbake environment not loaded?')
+                logger.warn("Bitbake environment not loaded?")
                 return tinfoil
             os.chdir(builddir)
             tinfoil = bb.tinfoil.Tinfoil()
@@ -174,7 +176,9 @@ class Metadata(Base):
         except bb.tinfoil.TinfoilUIException as te:
             if tinfoil:
                 tinfoil.shutdown()
-            raise PatchtestOEError('Could not prepare properly tinfoil (TinfoilUIException)')
+            raise PatchtestOEError(
+                "Could not prepare properly tinfoil (TinfoilUIException)"
+            )
         except Exception as e:
             if tinfoil:
                 tinfoil.shutdown()
@@ -194,7 +198,7 @@ class Metadata(Base):
             pn_native = None
             for _path, _pn in data:
                 if path in _path:
-                    if 'native' in _pn:
+                    if "native" in _pn:
                         # store the native PN but look for the non-native one first
                         pn_native = _pn
                     else:
@@ -208,9 +212,9 @@ class Metadata(Base):
                 # on renames (usually upgrades), we need to check (FILE) base names
                 # because the unidiff library does not provided the new filename, just the modified one
                 # and tinfoil datastore, once the patch is merged, will contain the new filename
-                path_basename = path.split('_')[0]
+                path_basename = path.split("_")[0]
                 for _path, _pn in data:
-                    _path_basename = _path.split('_')[0]
+                    _path_basename = _path.split("_")[0]
                     if path_basename == _path_basename:
                         pn = _pn
             return pn
@@ -223,7 +227,11 @@ class Metadata(Base):
 
         # get metadata filename additions, modification and removals
         for patch in patchset:
-            if patch.path.endswith('.bb') or patch.path.endswith('.bbappend') or patch.path.endswith('.inc'):
+            if (
+                patch.path.endswith(".bb")
+                or patch.path.endswith(".bbappend")
+                or patch.path.endswith(".inc")
+            ):
                 if patch.is_added_file:
                     added_paths.append(
                         os.path.join(
@@ -243,10 +251,14 @@ class Metadata(Base):
                         )
                     )
 
-        data = cls.tinfoil.cooker.recipecaches[''].pkg_fn.items()
+        data = cls.tinfoil.cooker.recipecaches[""].pkg_fn.items()
 
-        added = [find_pn(data,path) for path in added_paths]
-        modified = [find_pn(data,path) for path in modified_paths]
-        removed = [find_pn(data,path) for path in removed_paths]
+        added = [find_pn(data, path) for path in added_paths]
+        modified = [find_pn(data, path) for path in modified_paths]
+        removed = [find_pn(data, path) for path in removed_paths]
 
-        return [a for a in added if a], [m for m in modified if m], [r for r in removed if r]
+        return (
+            [a for a in added if a],
+            [m for m in modified if m],
+            [r for r in removed if r],
+        )
diff --git a/meta/lib/patchtest/tests/test_mbox.py b/meta/lib/patchtest/tests/test_mbox.py
index c0f9970686a..22e4001613f 100644
--- a/meta/lib/patchtest/tests/test_mbox.py
+++ b/meta/lib/patchtest/tests/test_mbox.py
@@ -12,40 +12,73 @@ import re
 import subprocess
 from patchtest_parser import PatchtestParser
 
+
 def headlog():
     output = subprocess.check_output(
         "cd %s; git log --pretty='%%h#%%aN#%%cD:#%%s' -1" % PatchtestParser.repodir,
         universal_newlines=True,
-        shell=True
-        )
-    return output.split('#')
+        shell=True,
+    )
+    return output.split("#")
+
 
 class TestMbox(base.Base):
 
     # base paths of main yocto project sub-projects
     paths = {
-        'oe-core': ['meta-selftest', 'meta-skeleton', 'meta', 'scripts'],
-        'bitbake': ['bitbake'],
-        'documentation': ['documentation'],
-        'poky': ['meta-poky','meta-yocto-bsp'],
-        'oe': ['meta-gpe', 'meta-gnome', 'meta-efl', 'meta-networking', 'meta-multimedia','meta-initramfs', 'meta-ruby', 'contrib', 'meta-xfce', 'meta-filesystems', 'meta-perl', 'meta-webserver', 'meta-systemd', 'meta-oe', 'meta-python']
-        }
-
-    # scripts folder is a mix of oe-core and poky, most is oe-core code except:
-    poky_scripts = ['scripts/yocto-bsp', 'scripts/yocto-kernel', 'scripts/yocto-layer', 'scripts/lib/bsp']
-
-    Project = collections.namedtuple('Project', ['name', 'listemail', 'gitrepo', 'paths'])
-
-    bitbake = Project(name='Bitbake', listemail='bitbake-devel@lists.openembedded.org', gitrepo='http://git.openembedded.org/bitbake/', paths=paths['bitbake'])
-    doc     = Project(name='Documentantion', listemail='yocto@yoctoproject.org', gitrepo='http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/', paths=paths['documentation'])
-    poky    = Project(name='Poky', listemail='poky@yoctoproject.org', gitrepo='http://git.yoctoproject.org/cgit/cgit.cgi/poky/', paths=paths['poky'])
-    oe      = Project(name='oe', listemail='openembedded-devel@lists.openembedded.org', gitrepo='http://git.openembedded.org/meta-openembedded/', paths=paths['oe'])
-
+        "oe-core": ["meta-selftest", "meta-skeleton", "meta", "scripts"],
+        "bitbake": ["bitbake"],
+        "documentation": ["documentation"],
+        "poky": ["meta-poky", "meta-yocto-bsp"],
+        "oe": [
+            "meta-filesystems",
+            "meta-gnome",
+            "meta-initramfs",
+            "meta-multimedia",
+            "meta-networking",
+            "meta-oe",
+            "meta-perl",
+            "meta-python",
+            "meta-webserver",
+            "meta-xfce",
+        ],
+    }
+
+    Project = collections.namedtuple(
+        "Project", ["name", "listemail", "gitrepo", "paths"]
+    )
+
+    bitbake = Project(
+        name="Bitbake",
+        listemail="bitbake-devel@lists.openembedded.org",
+        gitrepo="http://git.openembedded.org/bitbake/",
+        paths=paths["bitbake"],
+    )
+    doc = Project(
+        name="Documentantion",
+        listemail="yocto@yoctoproject.org",
+        gitrepo="http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/",
+        paths=paths["documentation"],
+    )
+    poky = Project(
+        name="Poky",
+        listemail="poky@yoctoproject.org",
+        gitrepo="http://git.yoctoproject.org/cgit/cgit.cgi/poky/",
+        paths=paths["poky"],
+    )
+    oe = Project(
+        name="oe",
+        listemail="openembedded-devel@lists.openembedded.org",
+        gitrepo="http://git.openembedded.org/meta-openembedded/",
+        paths=paths["oe"],
+    )
 
     def test_signed_off_by_presence(self):
         for commit in self.commits:
             # skip those patches that revert older commits, these do not required the tag presence
-            if patchtest_patterns.mbox_revert_shortlog_regex.search_string(commit.shortlog):
+            if patchtest_patterns.mbox_revert_shortlog_regex.search_string(
+                commit.shortlog
+            ):
                 continue
             if not patchtest_patterns.signed_off_by.search_string(commit.payload):
                 self.fail(
@@ -57,7 +90,7 @@ class TestMbox(base.Base):
         for commit in self.commits:
             shortlog = commit.shortlog
             if not shortlog.strip():
-                self.skip('Empty shortlog, no reason to execute shortlog format test')
+                self.skip("Empty shortlog, no reason to execute shortlog format test")
             else:
                 # no reason to re-check on revert shortlogs
                 if shortlog.startswith('Revert "'):
@@ -65,13 +98,15 @@ class TestMbox(base.Base):
                 try:
                     patchtest_patterns.shortlog.parseString(shortlog)
                 except pyparsing.ParseException as pe:
-                    self.fail('Commit shortlog (first line of commit message) should follow the format "<target>: <summary>"',
-                              commit=commit)
+                    self.fail(
+                        'Commit shortlog (first line of commit message) should follow the format "<target>: <summary>"',
+                        commit=commit,
+                    )
 
     def test_shortlog_length(self):
         for commit in self.commits:
             # no reason to re-check on revert shortlogs
-            shortlog = re.sub('^(\[.*?\])+ ', '', commit.shortlog)
+            shortlog = re.sub("^(\[.*?\])+ ", "", commit.shortlog)
             if shortlog.startswith('Revert "'):
                 continue
             l = len(shortlog)
@@ -113,38 +148,63 @@ class TestMbox(base.Base):
         for commit in self.commits:
             match = project_regex.search_string(commit.subject)
             if match:
-                self.fail('Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists',
-                          commit=commit)
+                self.fail(
+                    "Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists",
+                    commit=commit,
+                )
 
         for patch in self.patchset:
-            folders = patch.path.split('/')
+            folders = patch.path.split("/")
             base_path = folders[0]
             for project in [self.bitbake, self.doc, self.oe, self.poky]:
-                if base_path in  project.paths:
-                    self.fail('Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists',
-                              data=[('Suggested ML', '%s [%s]' % (project.listemail, project.gitrepo)),
-                                    ('Patch\'s path:', patch.path)])
+                if base_path in project.paths:
+                    self.fail(
+                        "Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists",
+                        data=[
+                            (
+                                "Suggested ML",
+                                "%s [%s]" % (project.listemail, project.gitrepo),
+                            ),
+                            ("Patch's path:", patch.path),
+                        ],
+                    )
 
             # check for poky's scripts code
-            if base_path.startswith('scripts'):
+            if base_path.startswith("scripts"):
                 for poky_file in self.poky_scripts:
                     if patch.path.startswith(poky_file):
-                        self.fail('Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists',
-                                  data=[('Suggested ML', '%s [%s]' % (self.poky.listemail, self.poky.gitrepo)),('Patch\'s path:', patch.path)])
+                        self.fail(
+                            "Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists",
+                            data=[
+                                (
+                                    "Suggested ML",
+                                    "%s [%s]"
+                                    % (self.poky.listemail, self.poky.gitrepo),
+                                ),
+                                ("Patch's path:", patch.path),
+                            ],
+                        )
 
     def test_mbox_format(self):
         if self.unidiff_parse_error:
-            self.fail('Series has malformed diff lines. Create the series again using git-format-patch and ensure it applies using git am',
-                      data=[('Diff line',self.unidiff_parse_error)])
+            self.fail(
+                "Series has malformed diff lines. Create the series again using git-format-patch and ensure it applies using git am",
+                data=[("Diff line", self.unidiff_parse_error)],
+            )
 
     def test_commit_message_presence(self):
         for commit in self.commits:
             if not commit.commit_message.strip():
-                self.fail('Please include a commit message on your patch explaining the change', commit=commit)
+                self.fail(
+                    "Please include a commit message on your patch explaining the change",
+                    commit=commit,
+                )
 
     def test_bugzilla_entry_format(self):
         for commit in self.commits:
-            if not patchtest_patterns.mbox_bugzilla.search_string(commit.commit_message):
+            if not patchtest_patterns.mbox_bugzilla.search_string(
+                commit.commit_message
+            ):
                 self.skip("No bug ID found")
             elif not patchtest_patterns.mbox_bugzilla_validation.search_string(
                 commit.commit_message
@@ -158,7 +218,11 @@ class TestMbox(base.Base):
         for commit in self.commits:
             for invalid in patchtest_patterns.invalid_submitters:
                 if invalid.search_string(commit.author):
-                    self.fail('Invalid author %s. Resend the series with a valid patch author' % commit.author, commit=commit)
+                    self.fail(
+                        "Invalid author %s. Resend the series with a valid patch author"
+                        % commit.author,
+                        commit=commit,
+                    )
 
     def test_non_auh_upgrade(self):
         for commit in self.commits:
diff --git a/meta/lib/patchtest/tests/test_metadata.py b/meta/lib/patchtest/tests/test_metadata.py
index 2dee80b0023..b6b62a65884 100644
--- a/meta/lib/patchtest/tests/test_metadata.py
+++ b/meta/lib/patchtest/tests/test_metadata.py
@@ -14,19 +14,20 @@ from patchtest_parser import PatchtestParser
 # Data store commonly used to share values between pre and post-merge tests
 PatchTestDataStore = collections.defaultdict(str)
 
+
 class TestMetadata(base.Metadata):
 
     def test_license_presence(self):
         if not self.added:
-            self.skip('No added recipes, skipping test')
+            self.skip("No added recipes, skipping test")
 
         # TODO: this is a workaround so we can parse the recipe not
         # containing the LICENSE var: add some default license instead
         # of INVALID into auto.conf, then remove this line at the end
-        auto_conf = os.path.join(os.environ.get('BUILDDIR'), 'conf', 'auto.conf')
-        open_flag = 'w'
+        auto_conf = os.path.join(os.environ.get("BUILDDIR"), "conf", "auto.conf")
+        open_flag = "w"
         if os.path.exists(auto_conf):
-            open_flag = 'a'
+            open_flag = "a"
         with open(auto_conf, open_flag) as fd:
             for pn in self.added:
                 fd.write('LICENSE ??= "%s"\n' % patchtest_patterns.invalid_license)
@@ -40,43 +41,44 @@ class TestMetadata(base.Metadata):
                 break
 
         # remove auto.conf line or the file itself
-        if open_flag == 'w':
+        if open_flag == "w":
             os.remove(auto_conf)
         else:
-            fd = open(auto_conf, 'r')
+            fd = open(auto_conf, "r")
             lines = fd.readlines()
             fd.close()
-            with open(auto_conf, 'w') as fd:
-                fd.write(''.join(lines[:-1]))
+            with open(auto_conf, "w") as fd:
+                fd.write("".join(lines[:-1]))
 
         if no_license:
-            self.fail('Recipe does not have the LICENSE field set.')
+            self.fail("Recipe does not have the LICENSE field set.")
 
     def test_lic_files_chksum_presence(self):
         if not self.added:
-            self.skip('No added recipes, skipping test')
+            self.skip("No added recipes, skipping test")
 
         for pn in self.added:
             rd = self.tinfoil.parse_recipe(pn)
-            pathname = rd.getVar('FILE')
+            pathname = rd.getVar("FILE")
             # we are not interested in images
-            if '/images/' in pathname:
+            if "/images/" in pathname:
                 continue
             lic_files_chksum = rd.getVar(patchtest_patterns.metadata_chksum)
             if rd.getVar(patchtest_patterns.license_var) == patchtest_patterns.closed:
                 continue
             if not lic_files_chksum:
                 self.fail(
-                    "%s is missing in newly added recipe" % patchtest_patterns.metadata_chksum
+                    "%s is missing in newly added recipe"
+                    % patchtest_patterns.metadata_chksum
                 )
 
     def test_lic_files_chksum_modified_not_mentioned(self):
         if not self.modified:
-            self.skip('No modified recipes, skipping test')
+            self.skip("No modified recipes, skipping test")
 
         for patch in self.patchset:
             # for the moment, we are just interested in metadata
-            if patch.path.endswith('.patch'):
+            if patch.path.endswith(".patch"):
                 continue
             payload = str(patch)
             if patchtest_patterns.lic_chksum_added.search_string(
@@ -84,15 +86,19 @@ class TestMetadata(base.Metadata):
             ) or patchtest_patterns.lic_chksum_removed.search_string(payload):
                 # if any patch on the series contain reference on the metadata, fail
                 for commit in self.commits:
-                    if patchtest_patterns.lictag_re.search_string(commit.commit_message):
+                    if patchtest_patterns.lictag_re.search_string(
+                        commit.commit_message
+                    ):
                         break
                 else:
-                    self.fail('LIC_FILES_CHKSUM changed without "License-Update:" tag and description in commit message')
+                    self.fail(
+                        'LIC_FILES_CHKSUM changed without "License-Update:" tag and description in commit message'
+                    )
 
     def test_max_line_length(self):
         for patch in self.patchset:
             # for the moment, we are just interested in metadata
-            if patch.path.endswith('.patch'):
+            if patch.path.endswith(".patch"):
                 continue
             payload = str(patch)
             for line in payload.splitlines():
@@ -101,7 +107,10 @@ class TestMetadata(base.Metadata):
                     if current_line_length > patchtest_patterns.patch_max_line_length:
                         self.fail(
                             "Patch line too long (current length %s, maximum is %s)"
-                            % (current_line_length, patchtest_patterns.patch_max_line_length),
+                            % (
+                                current_line_length,
+                                patchtest_patterns.patch_max_line_length,
+                            ),
                             data=[
                                 ("Patch", patch.path),
                                 ("Line", "%s ..." % line[0:80]),
@@ -113,12 +122,12 @@ class TestMetadata(base.Metadata):
         if not PatchtestParser.repo.canbemerged:
             self.skip("Patch cannot be merged")
         if not self.modified:
-            self.skip('No modified recipes, skipping pretest')
+            self.skip("No modified recipes, skipping pretest")
 
         # get the proper metadata values
         for pn in self.modified:
             # we are not interested in images
-            if 'core-image' in pn:
+            if "core-image" in pn:
                 continue
             rd = self.tinfoil.parse_recipe(pn)
             PatchTestDataStore[
@@ -130,12 +139,12 @@ class TestMetadata(base.Metadata):
         if not PatchtestParser.repo.canbemerged:
             self.skip("Patch cannot be merged")
         if not self.modified:
-            self.skip('No modified recipes, skipping pretest')
+            self.skip("No modified recipes, skipping pretest")
 
         # get the proper metadata values
         for pn in self.modified:
             # we are not interested in images
-            if 'core-image' in pn:
+            if "core-image" in pn:
                 continue
             rd = self.tinfoil.parse_recipe(pn)
             PatchTestDataStore[
@@ -144,14 +153,27 @@ class TestMetadata(base.Metadata):
 
         for pn in self.modified:
             pretest_src_uri = PatchTestDataStore[
-                "pre%s-%s-%s" % (self.shortid(), patchtest_patterns.metadata_src_uri, pn)
+                "pre%s-%s-%s"
+                % (self.shortid(), patchtest_patterns.metadata_src_uri, pn)
             ].split()
             test_src_uri = PatchTestDataStore[
                 "%s-%s-%s" % (self.shortid(), patchtest_patterns.metadata_src_uri, pn)
             ].split()
 
-            pretest_files = set([os.path.basename(patch) for patch in pretest_src_uri if patch.startswith('file://')])
-            test_files    = set([os.path.basename(patch) for patch in test_src_uri    if patch.startswith('file://')])
+            pretest_files = set(
+                [
+                    os.path.basename(patch)
+                    for patch in pretest_src_uri
+                    if patch.startswith("file://")
+                ]
+            )
+            test_files = set(
+                [
+                    os.path.basename(patch)
+                    for patch in test_src_uri
+                    if patch.startswith("file://")
+                ]
+            )
 
             # check if files were removed
             if len(test_files) < len(pretest_files):
@@ -169,16 +191,18 @@ class TestMetadata(base.Metadata):
                 # TODO: we are not taking into account  renames, so test may raise false positives
                 not_removed = filesremoved_from_usr_uri - filesremoved_from_patchset
                 if not_removed:
-                    self.fail('Patches not removed from tree. Remove them and amend the submitted mbox',
-                              data=[('Patch', f) for f in not_removed])
+                    self.fail(
+                        "Patches not removed from tree. Remove them and amend the submitted mbox",
+                        data=[("Patch", f) for f in not_removed],
+                    )
 
     def test_summary_presence(self):
         if not self.added:
-            self.skip('No added recipes, skipping test')
+            self.skip("No added recipes, skipping test")
 
         for pn in self.added:
             # we are not interested in images
-            if 'core-image' in pn:
+            if "core-image" in pn:
                 continue
             rd = self.tinfoil.parse_recipe(pn)
             summary = rd.getVar(patchtest_patterns.metadata_summary)
@@ -186,7 +210,8 @@ class TestMetadata(base.Metadata):
             # "${PN} version ${PN}-${PR}" is the default, so fail if default
             if summary.startswith("%s version" % pn):
                 self.fail(
-                    "%s is missing in newly added recipe" % patchtest_patterns.metadata_summary
+                    "%s is missing in newly added recipe"
+                    % patchtest_patterns.metadata_summary
                 )
 
     def test_cve_check_ignore(self):
@@ -200,7 +225,7 @@ class TestMetadata(base.Metadata):
             self.skip("No modified recipes or older target branch, skipping test")
         for pn in self.modified:
             # we are not interested in images
-            if 'core-image' in pn:
+            if "core-image" in pn:
                 continue
             rd = self.tinfoil.parse_recipe(pn)
             cve_check_ignore = rd.getVar(patchtest_patterns.cve_check_ignore_var)
@@ -208,5 +233,8 @@ class TestMetadata(base.Metadata):
             if cve_check_ignore is not None:
                 self.fail(
                     "%s is deprecated and should be replaced by %s"
-                    % (patchtest_patterns.cve_check_ignore_var, patchtest_patterns.cve_status_var)
+                    % (
+                        patchtest_patterns.cve_check_ignore_var,
+                        patchtest_patterns.cve_status_var,
+                    )
                 )
diff --git a/meta/lib/patchtest/tests/test_patch.py b/meta/lib/patchtest/tests/test_patch.py
index d08b8a50192..6f4799e3ead 100644
--- a/meta/lib/patchtest/tests/test_patch.py
+++ b/meta/lib/patchtest/tests/test_patch.py
@@ -10,6 +10,7 @@ import os
 import patchtest_patterns
 import pyparsing
 
+
 class TestPatch(base.Base):
 
     @classmethod
@@ -17,7 +18,7 @@ class TestPatch(base.Base):
         cls.newpatches = []
         # get just those relevant patches: new software patches
         for patch in cls.patchset:
-            if patch.path.endswith('.patch') and patch.is_added_file:
+            if patch.path.endswith(".patch") and patch.is_added_file:
                 cls.newpatches.append(patch)
 
         cls.mark = str(patchtest_patterns.signed_off_by_prefix).strip('"')
@@ -27,21 +28,27 @@ class TestPatch(base.Base):
 
     def setUp(self):
         if self.unidiff_parse_error:
-            self.skip('Parse error %s' % self.unidiff_parse_error)
+            self.skip("Parse error %s" % self.unidiff_parse_error)
 
-        self.valid_status = ", ".join(patchtest_patterns.upstream_status_nonliteral_valid_status)
+        self.valid_status = ", ".join(
+            patchtest_patterns.upstream_status_nonliteral_valid_status
+        )
         self.standard_format = "Upstream-Status: <Valid status>"
 
         # we are just interested in series that introduce CVE patches, thus discard other
         # possibilities: modification to current CVEs, patch directly introduced into the
         # recipe, upgrades already including the CVE, etc.
-        new_cves = [p for p in self.patchset if p.path.endswith('.patch') and p.is_added_file]
+        new_cves = [
+            p for p in self.patchset if p.path.endswith(".patch") and p.is_added_file
+        ]
         if not new_cves:
-            self.skip('No new CVE patches introduced')
+            self.skip("No new CVE patches introduced")
 
     def test_upstream_status_presence_format(self):
         if not TestPatch.newpatches:
-            self.skip("There are no new software patches, no reason to test Upstream-Status presence/format")
+            self.skip(
+                "There are no new software patches, no reason to test Upstream-Status presence/format"
+            )
 
         for newpatch in TestPatch.newpatches:
             payload = newpatch.__str__()
@@ -91,7 +98,9 @@ class TestPatch(base.Base):
                             )
                     else:
                         try:
-                            patchtest_patterns.upstream_status.parseString(line.lstrip("+"))
+                            patchtest_patterns.upstream_status.parseString(
+                                line.lstrip("+")
+                            )
                         except pyparsing.ParseException as pe:
                             self.fail(
                                 "Upstream-Status is in incorrect format",
@@ -104,7 +113,10 @@ class TestPatch(base.Base):
 
     def test_signed_off_by_presence(self):
         if not TestPatch.newpatches:
-            self.skip("There are no new software patches, no reason to test %s presence" % PatchSignedOffBy.mark)
+            self.skip(
+                "There are no new software patches, no reason to test %s presence"
+                % PatchSignedOffBy.mark
+            )
 
         for newpatch in TestPatch.newpatches:
             payload = newpatch.__str__()
@@ -114,7 +126,10 @@ class TestPatch(base.Base):
                 if TestPatch.prog.search_string(payload):
                     break
             else:
-                self.fail('A patch file has been added without a Signed-off-by tag: \'%s\'' % os.path.basename(newpatch.path))
+                self.fail(
+                    "A patch file has been added without a Signed-off-by tag: '%s'"
+                    % os.path.basename(newpatch.path)
+                )
 
     def test_cve_tag_format(self):
         for commit in TestPatch.commits:
@@ -127,5 +142,7 @@ class TestPatch(base.Base):
                         tag_found = True
                         break
                 if not tag_found:
-                    self.fail('Missing or incorrectly formatted CVE tag in patch file. Correct or include the CVE tag in the patch with format: "CVE: CVE-YYYY-XXXX"',
-                              commit=commit)
+                    self.fail(
+                        'Missing or incorrectly formatted CVE tag in patch file. Correct or include the CVE tag in the patch with format: "CVE: CVE-YYYY-XXXX"',
+                        commit=commit,
+                    )
diff --git a/meta/lib/patchtest/tests/test_python_pylint.py b/meta/lib/patchtest/tests/test_python_pylint.py
index ec9129bc796..11b5c84fa03 100644
--- a/meta/lib/patchtest/tests/test_python_pylint.py
+++ b/meta/lib/patchtest/tests/test_python_pylint.py
@@ -12,9 +12,9 @@ import pylint.lint as lint
 
 
 class PyLint(base.Base):
-    pythonpatches  = []
+    pythonpatches = []
     pylint_pretest = {}
-    pylint_test    = {}
+    pylint_test = {}
     pylint_options = " -E --disable='E0611, E1101, F0401, E0602' --msg-template='L:{line} F:{module} I:{msg}'"
 
     @classmethod
@@ -22,26 +22,32 @@ class PyLint(base.Base):
         # get just those patches touching python files
         cls.pythonpatches = []
         for patch in cls.patchset:
-            if patch.path.endswith('.py'):
+            if patch.path.endswith(".py"):
                 if not patch.is_removed_file:
                     cls.pythonpatches.append(patch)
 
     def setUp(self):
         if self.unidiff_parse_error:
-            self.skip('Python-unidiff parse error')
+            self.skip("Python-unidiff parse error")
         if not PyLint.pythonpatches:
-            self.skip('No python related patches, skipping test')
+            self.skip("No python related patches, skipping test")
 
     def pretest_pylint(self):
         for pythonpatch in self.pythonpatches:
             if pythonpatch.is_modified_file:
                 pylint_output = StringIO()
                 reporter = TextReporter(pylint_output)
-                lint.Run([self.pylint_options, pythonpatch.path], reporter=reporter, exit=False)
+                lint.Run(
+                    [self.pylint_options, pythonpatch.path],
+                    reporter=reporter,
+                    exit=False,
+                )
                 for line in pylint_output.readlines():
-                    if not '*' in line:
+                    if not "*" in line:
                         if line.strip():
-                            self.pylint_pretest[line.strip().split(' ',1)[0]] = line.strip().split(' ',1)[1]
+                            self.pylint_pretest[line.strip().split(" ", 1)[0]] = (
+                                line.strip().split(" ", 1)[1]
+                            )
 
     def test_pylint(self):
         for pythonpatch in self.pythonpatches:
@@ -53,13 +59,22 @@ class PyLint(base.Base):
                 path = pythonpatch.path
             pylint_output = StringIO()
             reporter = TextReporter(pylint_output)
-            lint.Run([self.pylint_options, pythonpatch.path], reporter=reporter, exit=False)
+            lint.Run(
+                [self.pylint_options, pythonpatch.path], reporter=reporter, exit=False
+            )
             for line in pylint_output.readlines():
-                    if not '*' in line:
-                        if line.strip():
-                            self.pylint_test[line.strip().split(' ',1)[0]] = line.strip().split(' ',1)[1]
+                if not "*" in line:
+                    if line.strip():
+                        self.pylint_test[line.strip().split(" ", 1)[0]] = (
+                            line.strip().split(" ", 1)[1]
+                        )
 
         for issue in self.pylint_test:
-             if self.pylint_test[issue] not in self.pylint_pretest.values():
-                 self.fail('Errors in your Python code were encountered. Please check your code with a linter and resubmit',
-                           data=[('Output', 'Please, fix the listed issues:'), ('', issue + ' ' + self.pylint_test[issue])])
+            if self.pylint_test[issue] not in self.pylint_pretest.values():
+                self.fail(
+                    "Errors in your Python code were encountered. Please check your code with a linter and resubmit",
+                    data=[
+                        ("Output", "Please, fix the listed issues:"),
+                        ("", issue + " " + self.pylint_test[issue]),
+                    ],
+                )
diff --git a/scripts/patchtest b/scripts/patchtest
index 9218db232a7..99ce2f79131 100755
--- a/scripts/patchtest
+++ b/scripts/patchtest
@@ -20,7 +20,10 @@ import unittest
 sys.path.insert(0, os.path.dirname(os.path.realpath(__file__)))
 
 # Include patchtest library
-sys.path.insert(0, os.path.join(os.path.dirname(os.path.realpath(__file__)), '../meta/lib/patchtest'))
+sys.path.insert(
+    0,
+    os.path.join(os.path.dirname(os.path.realpath(__file__)), "../meta/lib/patchtest"),
+)
 
 from patchtest_parser import PatchtestParser
 from repo import PatchTestRepo
@@ -33,16 +36,18 @@ logger.setLevel(logging.INFO)
 info = logger.info
 error = logger.error
 
+
 def getResult(patch, mergepatch, logfile=None):
 
     class PatchTestResult(unittest.TextTestResult):
-        """ Patchtest TextTestResult """
-        shouldStop  = True
+        """Patchtest TextTestResult"""
+
+        shouldStop = True
         longMessage = False
 
-        success     = 'PASS'
-        fail        = 'FAIL'
-        skip        = 'SKIP'
+        success = "PASS"
+        fail = "FAIL"
+        skip = "SKIP"
 
         def startTestRun(self):
             # let's create the repo already, it can be used later on
@@ -53,9 +58,9 @@ def getResult(patch, mergepatch, logfile=None):
                 "patch": patch,
             }
 
-            self.repo_error    = False
-            self.test_error    = False
-            self.test_failure  = False
+            self.repo_error = False
+            self.test_error = False
+            self.test_failure = False
 
             try:
                 self.repo = PatchtestParser.repo = PatchTestRepo(**repoargs)
@@ -74,39 +79,58 @@ def getResult(patch, mergepatch, logfile=None):
             logger.error(traceback.print_exc())
 
         def addFailure(self, test, err):
-            test_description = test.id().split('.')[-1].replace('_', ' ').replace("cve", "CVE").replace("signed off by",
-            "Signed-off-by").replace("upstream status",
-            "Upstream-Status").replace("non auh",
-            "non-AUH").replace("presence format", "presence")
+            test_description = (
+                test.id()
+                .split(".")[-1]
+                .replace("_", " ")
+                .replace("cve", "CVE")
+                .replace("signed off by", "Signed-off-by")
+                .replace("upstream status", "Upstream-Status")
+                .replace("non auh", "non-AUH")
+                .replace("presence format", "presence")
+            )
             self.test_failure = True
-            fail_str = '{}: {}: {} ({})'.format(self.fail,
-            test_description, json.loads(str(err[1]))["issue"],
-            test.id())
+            fail_str = "{}: {}: {} ({})".format(
+                self.fail, test_description, json.loads(str(err[1]))["issue"], test.id()
+            )
             print(fail_str)
             if logfile:
                 with open(logfile, "a") as f:
                     f.write(fail_str + "\n")
 
         def addSuccess(self, test):
-            test_description = test.id().split('.')[-1].replace('_', ' ').replace("cve", "CVE").replace("signed off by",
-            "Signed-off-by").replace("upstream status",
-            "Upstream-Status").replace("non auh",
-            "non-AUH").replace("presence format", "presence")
-            success_str = '{}: {} ({})'.format(self.success,
-            test_description, test.id())
+            test_description = (
+                test.id()
+                .split(".")[-1]
+                .replace("_", " ")
+                .replace("cve", "CVE")
+                .replace("signed off by", "Signed-off-by")
+                .replace("upstream status", "Upstream-Status")
+                .replace("non auh", "non-AUH")
+                .replace("presence format", "presence")
+            )
+            success_str = "{}: {} ({})".format(
+                self.success, test_description, test.id()
+            )
             print(success_str)
             if logfile:
                 with open(logfile, "a") as f:
                     f.write(success_str + "\n")
 
         def addSkip(self, test, reason):
-            test_description = test.id().split('.')[-1].replace('_', ' ').replace("cve", "CVE").replace("signed off by",
-            "Signed-off-by").replace("upstream status",
-            "Upstream-Status").replace("non auh",
-            "non-AUH").replace("presence format", "presence")
-            skip_str = '{}: {}: {} ({})'.format(self.skip,
-            test_description, json.loads(str(reason))["issue"],
-            test.id())
+            test_description = (
+                test.id()
+                .split(".")[-1]
+                .replace("_", " ")
+                .replace("cve", "CVE")
+                .replace("signed off by", "Signed-off-by")
+                .replace("upstream status", "Upstream-Status")
+                .replace("non auh", "non-AUH")
+                .replace("presence format", "presence")
+            )
+            skip_str = "{}: {}: {} ({})".format(
+                self.skip, test_description, json.loads(str(reason))["issue"], test.id()
+            )
             print(skip_str)
             if logfile:
                 with open(logfile, "a") as f:
@@ -122,6 +146,7 @@ def getResult(patch, mergepatch, logfile=None):
 
     return PatchTestResult
 
+
 def _runner(resultklass, prefix=None):
     # load test with the corresponding prefix
     loader = unittest.TestLoader()
@@ -145,29 +170,31 @@ def _runner(resultklass, prefix=None):
         result = runner.run(suite)
     except:
         logger.error(traceback.print_exc())
-        logger.error('patchtest: something went wrong')
+        logger.error("patchtest: something went wrong")
         return 1
     if result.test_failure or result.test_error:
-        return 1 
+        return 1
 
     return 0
 
+
 def run(patch, logfile=None):
-    """ Load, setup and run pre and post-merge tests """
+    """Load, setup and run pre and post-merge tests"""
     # Get the result class and install the control-c handler
     unittest.installHandler()
 
     # run pre-merge tests, meaning those methods with 'pretest' as prefix
     premerge_resultklass = getResult(patch, False, logfile)
-    premerge_result = _runner(premerge_resultklass, 'pretest')
+    premerge_result = _runner(premerge_resultklass, "pretest")
 
     # run post-merge tests, meaning those methods with 'test' as prefix
     postmerge_resultklass = getResult(patch, True, logfile)
-    postmerge_result = _runner(postmerge_resultklass, 'test')
+    postmerge_result = _runner(postmerge_resultklass, "test")
 
     print_result_message(premerge_result, postmerge_result)
     return premerge_result or postmerge_result
 
+
 def print_result_message(preresult, postresult):
     print("----------------------------------------------------------------------\n")
     if preresult == 2 and postresult == 2:
@@ -182,6 +209,7 @@ def print_result_message(preresult, postresult):
         logger.info("OK: patchtest: All patchtests passed")
     print("----------------------------------------------------------------------\n")
 
+
 def main():
     tmp_patch = False
     patch_path = PatchtestParser.patch_path
@@ -192,20 +220,25 @@ def main():
     git_status = os.popen("(cd %s && git status)" % PatchtestParser.repodir).read()
     status_matches = ["Changes not staged for commit", "Changes to be committed"]
     if any([match in git_status for match in status_matches]):
-        logger.error("patchtest: there are uncommitted changes in the target repo that would be overwritten. Please commit or restore them before running patchtest")
+        logger.error(
+            "patchtest: there are uncommitted changes in the target repo that would be overwritten. Please commit or restore them before running patchtest"
+        )
         return 1
 
     if os.path.isdir(patch_path):
-        patch_list = [os.path.join(patch_path, filename) for filename in sorted(os.listdir(patch_path))]
+        patch_list = [
+            os.path.join(patch_path, filename)
+            for filename in sorted(os.listdir(patch_path))
+        ]
     else:
         patch_list = [patch_path]
 
     for patch in patch_list:
         if os.path.getsize(patch) == 0:
-            logger.error('patchtest: patch is empty')
+            logger.error("patchtest: patch is empty")
             return 1
 
-        logger.info('Testing patch %s' % patch)
+        logger.info("Testing patch %s" % patch)
 
         if log_results:
             log_path = patch + ".testresult"
@@ -221,7 +254,8 @@ def main():
             if tmp_patch:
                 os.remove(patch)
 
-if __name__ == '__main__':
+
+if __name__ == "__main__":
     ret = 1
 
     # Parse the command line arguments and store it on the PatchtestParser namespace
@@ -239,6 +273,7 @@ if __name__ == '__main__':
         ret = main()
     except Exception:
         import traceback
+
         traceback.print_exc(5)
 
     sys.exit(ret)
diff --git a/scripts/patchtest-get-branch b/scripts/patchtest-get-branch
index c6e242f8b68..7ddb79cbb5a 100755
--- a/scripts/patchtest-get-branch
+++ b/scripts/patchtest-get-branch
@@ -18,16 +18,17 @@ import git
 
 re_prefix = re.compile(r"(\[.*\])", re.DOTALL)
 
+
 def get_branch(filepath_repo, filepath_mbox, default_branch):
     branch = None
 
     # get all remotes branches
-    gitbranches = git.Git(filepath_repo).branch('-a').splitlines()
+    gitbranches = git.Git(filepath_repo).branch("-a").splitlines()
 
     # from gitbranches, just get the names
-    branches = [b.split('/')[-1] for b in gitbranches]
+    branches = [b.split("/")[-1] for b in gitbranches]
 
-    subject = ' '.join(mailbox.mbox(filepath_mbox)[0]['subject'].splitlines())
+    subject = " ".join(mailbox.mbox(filepath_mbox)[0]["subject"].splitlines())
 
     # we expect that patches will have somewhere between one and three
     # consecutive sets of square brackets with tokens inside, e.g.:
@@ -42,23 +43,23 @@ def get_branch(filepath_repo, filepath_mbox, default_branch):
     # Or they may contain both:
     # [PATCH v2 3/4]
     # In any case, we want mprefix to contain all of these tokens so
-    # that we can search for branch names within them. 
-    mprefix = re.findall(r'\[.*?\]', subject)
+    # that we can search for branch names within them.
+    mprefix = re.findall(r"\[.*?\]", subject)
     found_branch = None
     if mprefix:
         # Iterate over the tokens and compare against the branch list to
         # figure out which one the patch is targeting
         for token in mprefix:
-             stripped = token.lower().strip('[]')
-             if default_branch in stripped:
-                 found_branch = default_branch
-                 break
-             else:
-                 for branch in branches:
-                     # ignore branches named "core"
-                     if branch != "core" and stripped.rfind(branch) != -1:
-                         found_branch = token.split(' ')[0].strip('[]')
-                         break
+            stripped = token.lower().strip("[]")
+            if default_branch in stripped:
+                found_branch = default_branch
+                break
+            else:
+                for branch in branches:
+                    # ignore branches named "core"
+                    if branch != "core" and stripped.rfind(branch) != -1:
+                        found_branch = token.split(" ")[0].strip("[]")
+                        break
 
     # if there's no mprefix content or no known branches were found in
     # the tokens, assume the target is master
@@ -67,15 +68,26 @@ def get_branch(filepath_repo, filepath_mbox, default_branch):
 
     return (subject, found_branch)
 
-if __name__ == '__main__':
+
+if __name__ == "__main__":
 
     parser = argparse.ArgumentParser()
-    parser.add_argument('repo', metavar='REPO', help='Main repository')
-    parser.add_argument('mbox', metavar='MBOX', help='mbox filename')
-    parser.add_argument('--default-branch', metavar='DEFAULT_BRANCH', default='master', help='Use this branch if no one is found')
-    parser.add_argument('--separator', '-s', metavar='SEPARATOR', default=' ', help='Char separator for output data')
+    parser.add_argument("repo", metavar="REPO", help="Main repository")
+    parser.add_argument("mbox", metavar="MBOX", help="mbox filename")
+    parser.add_argument(
+        "--default-branch",
+        metavar="DEFAULT_BRANCH",
+        default="master",
+        help="Use this branch if no one is found",
+    )
+    parser.add_argument(
+        "--separator",
+        "-s",
+        metavar="SEPARATOR",
+        default=" ",
+        help="Char separator for output data",
+    )
     args = parser.parse_args()
 
     subject, branch = get_branch(args.repo, args.mbox, args.default_branch)
     print("branch: %s" % branch)
-
diff --git a/scripts/patchtest-send-results b/scripts/patchtest-send-results
index 8a3dadbd111..875388bf842 100755
--- a/scripts/patchtest-send-results
+++ b/scripts/patchtest-send-results
@@ -10,7 +10,7 @@
 # Copyright (C) 2023 BayLibre Inc.
 #
 # SPDX-License-Identifier: GPL-2.0-only
-# 
+#
 
 import argparse
 import boto3
@@ -33,19 +33,36 @@ under 'Yocto Project Subprojects'). For more information on specific
 failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
 you!"""
 
-def has_a_failed_test(raw_results):
-    return any(raw_result.split(':')[0] == "FAIL" for raw_result in raw_results.splitlines())
 
-parser = argparse.ArgumentParser(description="Send patchtest results to a submitter for a given patch")
-parser.add_argument("-p", "--patch", dest="patch", required=True, help="The patch file to summarize")
-parser.add_argument("-d", "--debug", dest="debug", required=False, action='store_true', help="Print raw email headers and content, but don't actually send it")
+def has_a_failed_test(raw_results):
+    return any(
+        raw_result.split(":")[0] == "FAIL" for raw_result in raw_results.splitlines()
+    )
+
+
+parser = argparse.ArgumentParser(
+    description="Send patchtest results to a submitter for a given patch"
+)
+parser.add_argument(
+    "-p", "--patch", dest="patch", required=True, help="The patch file to summarize"
+)
+parser.add_argument(
+    "-d",
+    "--debug",
+    dest="debug",
+    required=False,
+    action="store_true",
+    help="Print raw email headers and content, but don't actually send it",
+)
 args = parser.parse_args()
 
 if not os.path.exists(args.patch):
     print(f"Patch '{args.patch}' not found - did you provide the right path?")
     sys.exit(1)
 elif not os.path.exists(args.patch + ".testresult"):
-    print(f"Found patch '{args.patch}' but '{args.patch}.testresult' was not present. Have you run patchtest on the patch?")
+    print(
+        f"Found patch '{args.patch}' but '{args.patch}.testresult' was not present. Have you run patchtest on the patch?"
+    )
     sys.exit(1)
 
 result_file = args.patch + ".testresult"
@@ -57,17 +74,17 @@ with open(result_file, "r") as f:
 # we know these patch files will only contain a single patch, so only
 # worry about the first element for getting the subject
 mbox = mailbox.mbox(args.patch)
-mbox_subject = mbox[0]['subject']
+mbox_subject = mbox[0]["subject"]
 subject_line = f"Patchtest results for {mbox_subject}"
 
 # extract the submitter email address and use it as the reply address
 # for the results
-reply_address = mbox[0]['from']
+reply_address = mbox[0]["from"]
 
 # extract the message ID and use that as the in-reply-to address
 # TODO: This will need to change again when patchtest can handle a whole
 # series at once
-in_reply_to = mbox[0]['Message-ID']
+in_reply_to = mbox[0]["Message-ID"]
 
 # the address the results email is sent from
 from_address = "patchtest@automation.yoctoproject.org"
@@ -77,24 +94,35 @@ cc_address = "openembedded-core@lists.openembedded.org"
 
 if has_a_failed_test(testresult):
     reply_contents = None
-    if len(max(open(result_file, 'r'), key=len)) > 220:
+    if len(max(open(result_file, "r"), key=len)) > 220:
         warning = "Tests failed for the patch, but the results log could not be processed due to excessive result line length."
         reply_contents = greeting + warning + suggestions
     else:
         reply_contents = greeting + testresult + suggestions
 
-    ses_client = boto3.client('ses', region_name='us-west-2')
+    ses_client = boto3.client("ses", region_name="us-west-2")
 
     # Construct the headers for the email. We only want to reply
     # directly to the tested patch, so make In-Reply-To and References
     # the same value.
-    raw_data = 'From: ' + from_address + '\nTo: ' + reply_address + \
-        '\nCC: ' + cc_address + '\nSubject:' + subject_line + \
-        '\nIn-Reply-To:' + in_reply_to + \
-        '\nReferences:' + in_reply_to + \
-        '\nMIME-Version: 1.0" + \
-        "\nContent-type: Multipart/Mixed;boundary="NextPart"\n\n--NextPart\nContent-Type: text/plain\n\n' + \
-        reply_contents + '\n\n--NextPart'
+    raw_data = (
+        "From: "
+        + from_address
+        + "\nTo: "
+        + reply_address
+        + "\nCC: "
+        + cc_address
+        + "\nSubject:"
+        + subject_line
+        + "\nIn-Reply-To:"
+        + in_reply_to
+        + "\nReferences:"
+        + in_reply_to
+        + '\nMIME-Version: 1.0" + \
+        "\nContent-type: Multipart/Mixed;boundary="NextPart"\n\n--NextPart\nContent-Type: text/plain\n\n'
+        + reply_contents
+        + "\n\n--NextPart"
+    )
 
     if args.debug:
         print(f"RawMessage: \n\n{raw_data}")
-- 
2.39.5


