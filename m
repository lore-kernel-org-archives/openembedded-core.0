Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C045CD5BC8
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 19:33:39 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4340.1779824009952393997
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 12:33:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=UNfnIXkr;
 spf=pass (domain: baylibre.com, ip: 209.85.219.52, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8ca12973e15so149180126d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 12:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779824009; x=1780428809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HmS9x5ugKbKASDa7jIXw23cGS5L4PbHdS6hY+8XCe8=;
        b=UNfnIXkrRqLbQZO9hP8VDrVoVvUB0pseYXIk9Xw+ez0mzsXhfnp9etBv7L9tptM05Y
         gl5C9/ulMpg3wEf5aLss948z03ps+3BzdxV7nBXc6/Y42YzHOGvGcYjfd0Jx1qjremAi
         kyidVo/uIDSaT6hdOWH5LaaT61kF0rPPljx3fXClNb6bv2j7aOgRgPK3gvrCEl//dppw
         +kU/zpe99W/PLq2a7SlZ4DaDEAD227JnYJC3xdt4GBvWh1pnojl9HOkIC5wCR+xTNenE
         gN+W75Z7O6l7OT+spndDX4Jp5EHt0yyJIaAqMdST3+qUZ23lkXLxyGi5jlUSXmCn7mK7
         wyDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779824009; x=1780428809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0HmS9x5ugKbKASDa7jIXw23cGS5L4PbHdS6hY+8XCe8=;
        b=IFi1I5xvtqmWVfeJKMNa2Teau/Ky0z9XmggefxU5XLaYGHC6cAKBngkeE4wzKQu2Xg
         KCXaPnQUPkpW63b7J/WMG2kw9YqSJYsqxXUtD2u7HmHE/xZz/HjpBGTMUFzI61ZfMgWZ
         adO0RxfXYPZwewzwm1SLePbrGUq+Y8pGsYdlRPvQXGQvS/l9Kyl1V7RC+XpZc5aCBQUq
         Ndl3ZWqG5dBZqAjM+jrC39x2oPOeybZ8uDW+mjjySBkGkM1zFrln4QMI69/T5nrkw3Dt
         1l72DHCTOGZBXRlCllK44+fgvxnClI9mijWSPuo9XyfHuJN1Z4Uhf9hZVF4ZVgCRCpLp
         c5Uw==
X-Gm-Message-State: AOJu0YzW8WhtYQgV1UWUiCCgfgovv/wh8/ECDotPLAJKc4J00o312J7J
	asz65P85mhGshVIixBtAEbzv4+Qm6pAqHz3bGZN8y2rk5IN0nLGBdVBEINM9sH9zQ5XIMDiT0FS
	xCvcrq1g=
X-Gm-Gg: Acq92OH3+RWrISbp57WEl+buN2x8OvVe12S1q4/vM3scyRRCzEEXHxByuSnOEwWXaCm
	Y9C5Gbxe0KciTYxSzUO32D6pC8vwxJkTE4R4nlq1nOOIrgiiPWgVrTxIaS4qtoHooP7Gj45pVOw
	Ouv9Jm4u7pTwKI1WYfw6ds6uLCEznpLU36ngKhEcKOup7Jqeg43sxNEL9JTW11q9pSRqHdDdS1J
	lfkhpOKKQMGgp58CG5+SAMQQ5qrRuFJ4KkYO3dEI2IUiBEkAUAZKsYf2yFWKnzThBYn5LcO7CvK
	/RQNtP8LhQ2lt3qEsr6hXDUbO0Yl/QmTaSjApoodfKUMocJ427HGMELILqi2PYrx7N032mKFwJH
	OPRY2DbTXc1joJXlPROU6CZSlBLDjNLn21ISMxXZTo9PVrdOSw4NuKQabe2+5ZEvT2t/ETcDin5
	FXnTJ4kK47sDkAlZVFWZVw3K2hYA==
X-Received: by 2002:a05:6214:451d:b0:8cc:3546:2613 with SMTP id 6a1803df08f44-8cc7b69f724mr331460426d6.42.1779824008834;
        Tue, 26 May 2026 12:33:28 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:537:a9f7:1a84:f246])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cca4705c62sm62121016d6.27.2026.05.26.12.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 12:33:27 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [OE-core][PATCH 3/6] patchtest: tests: cleanup test suites
Date: Tue, 26 May 2026 15:33:14 -0400
Message-ID: <20260526193317.807459-4-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526193317.807459-1-tgamblin@baylibre.com>
References: <20260526193317.807459-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 19:33:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237621

Do a sweep of the test suites to remove redundant code, make variable
names more explicit, and fix some formatting. Some logic (such as the
bits for checking valid Upstream-Status tags) are also moved directly to
the relevant functions, instead of being left in the setup stage. This
should make maintenance easier going forward.

AI-Generated: Uses Claude Code

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/tests/base.py              |  4 ---
 meta/lib/patchtest/tests/test_mbox.py         | 10 +++---
 meta/lib/patchtest/tests/test_metadata.py     | 32 ++++++------------
 meta/lib/patchtest/tests/test_patch.py        | 33 ++++++++-----------
 .../lib/patchtest/tests/test_python_pylint.py |  8 ++---
 5 files changed, 33 insertions(+), 54 deletions(-)

diff --git a/meta/lib/patchtest/tests/base.py b/meta/lib/patchtest/tests/base.py
index 919ca136bb..8263932dda 100644
--- a/meta/lib/patchtest/tests/base.py
+++ b/meta/lib/patchtest/tests/base.py
@@ -22,10 +22,6 @@ info = logger.info
 warn = logger.warn
 error = logger.error
 
-Commit = collections.namedtuple(
-    "Commit", ["author", "subject", "commit_message", "shortlog", "payload"]
-)
-
 Commit = collections.namedtuple('Commit', ['author', 'subject', 'commit_message', 'shortlog', 'payload'])
 
 class PatchtestOEError(Exception):
diff --git a/meta/lib/patchtest/tests/test_mbox.py b/meta/lib/patchtest/tests/test_mbox.py
index 5cf02af7bd..feb87fa2ae 100644
--- a/meta/lib/patchtest/tests/test_mbox.py
+++ b/meta/lib/patchtest/tests/test_mbox.py
@@ -74,11 +74,11 @@ class TestMbox(base.Base):
             shortlog = re.sub(r'^(\[.*?\])+ ', '', commit.shortlog)
             if shortlog.startswith('Revert "'):
                 continue
-            l = len(shortlog)
-            if l > patchtest_patterns.mbox_shortlog_maxlength:
+            length = len(shortlog)
+            if length > patchtest_patterns.mbox_shortlog_maxlength:
                 self.fail(
                     "Edit shortlog so that it is %d characters or less (currently %d characters)"
-                    % (patchtest_patterns.mbox_shortlog_maxlength, l),
+                    % (patchtest_patterns.mbox_shortlog_maxlength, length),
                     commit=commit,
                 )
 
@@ -120,7 +120,7 @@ class TestMbox(base.Base):
             folders = patch.path.split('/')
             base_path = folders[0]
             for project in [self.bitbake, self.doc, self.oe, self.poky]:
-                if base_path in  project.paths:
+                if base_path in project.paths:
                     self.fail('Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists',
                               data=[('Suggested ML', '%s [%s]' % (project.listemail, project.gitrepo)),
                                     ('Patch\'s path:', patch.path)])
@@ -173,7 +173,7 @@ class TestMbox(base.Base):
         for commit in self.commits:
             if patchtest_patterns.auh_email in commit.commit_message:
                 self.fail(
-                    "Invalid author %s. Resend the series with a valid patch author"
+                    "Commit message contains AUH email address %s. Resend the series with a valid patch author"
                     % patchtest_patterns.auh_email,
                     commit=commit,
                 )
diff --git a/meta/lib/patchtest/tests/test_metadata.py b/meta/lib/patchtest/tests/test_metadata.py
index 30da8dbe60..442e80973d 100644
--- a/meta/lib/patchtest/tests/test_metadata.py
+++ b/meta/lib/patchtest/tests/test_metadata.py
@@ -8,7 +8,6 @@ import base
 import collections
 import os
 import patchtest_patterns
-import pyparsing
 from patchtest_parser import PatchtestParser
 
 # Data store commonly used to share values between pre and post-merge tests
@@ -108,39 +107,28 @@ class TestMetadata(base.Metadata):
                             ],
                         )
 
-    def pretest_src_uri_left_files(self):
-        # these tests just make sense on patches that can be merged
-        if not PatchtestParser.repo.canbemerged():
-            self.skip("Patch cannot be merged")
-        if not self.modified:
-            self.skip('No modified recipes, skipping pretest')
-
-        # get the proper metadata values
+    def _collect_src_uri(self, key_prefix):
         for pn in self.modified:
-            # we are not interested in images
             if 'core-image' in pn:
                 continue
             rd = self.tinfoil.parse_recipe(pn)
             PatchTestDataStore[
-                "%s-%s-%s" % (self.shortid(), patchtest_patterns.metadata_src_uri, pn)
+                "%s-%s-%s" % (key_prefix, patchtest_patterns.metadata_src_uri, pn)
             ] = rd.getVar(patchtest_patterns.metadata_src_uri)
 
-    def test_src_uri_left_files(self):
-        # these tests just make sense on patches that can be merged
+    def pretest_src_uri_left_files(self):
         if not PatchtestParser.repo.canbemerged():
             self.skip("Patch cannot be merged")
         if not self.modified:
             self.skip('No modified recipes, skipping pretest')
+        self._collect_src_uri(self.shortid())
 
-        # get the proper metadata values
-        for pn in self.modified:
-            # we are not interested in images
-            if 'core-image' in pn:
-                continue
-            rd = self.tinfoil.parse_recipe(pn)
-            PatchTestDataStore[
-                "%s-%s-%s" % (self.shortid(), patchtest_patterns.metadata_src_uri, pn)
-            ] = rd.getVar(patchtest_patterns.metadata_src_uri)
+    def test_src_uri_left_files(self):
+        if not PatchtestParser.repo.canbemerged():
+            self.skip("Patch cannot be merged")
+        if not self.modified:
+            self.skip('No modified recipes, skipping test')
+        self._collect_src_uri(self.shortid())
 
         for pn in self.modified:
             pretest_src_uri = PatchTestDataStore[
diff --git a/meta/lib/patchtest/tests/test_patch.py b/meta/lib/patchtest/tests/test_patch.py
index 3b33b5a199..9f1d7d2c8f 100644
--- a/meta/lib/patchtest/tests/test_patch.py
+++ b/meta/lib/patchtest/tests/test_patch.py
@@ -28,21 +28,16 @@ class TestPatch(base.Base):
     def setUp(self):
         if self.unidiff_parse_error:
             self.skip('Parse error %s' % self.unidiff_parse_error)
-
-        self.valid_status = ", ".join(patchtest_patterns.upstream_status_nonliteral_valid_status)
-        self.standard_format = "Upstream-Status: <Valid status>"
-
-        # we are just interested in series that introduce CVE patches, thus discard other
-        # possibilities: modification to current CVEs, patch directly introduced into the
-        # recipe, upgrades already including the CVE, etc.
-        new_cves = [p for p in self.patchset if p.path.endswith('.patch') and p.is_added_file]
-        if not new_cves:
+        if not TestPatch.newpatches:
             self.skip('No new CVE patches introduced')
 
     def test_upstream_status_presence_format(self):
         if not TestPatch.newpatches:
             self.skip("There are no new software patches, no reason to test Upstream-Status presence/format")
 
+        valid_status = ", ".join(patchtest_patterns.upstream_status_nonliteral_valid_status)
+        standard_format = "Upstream-Status: <Valid status>"
+
         for newpatch in TestPatch.newpatches:
             payload = newpatch.__str__()
             lines = payload.splitlines()
@@ -71,16 +66,16 @@ class TestPatch(base.Base):
                         'Upstream-Status is present only after the patch scissors. '
                         "It must be placed in the patch header before the scissors line.",
                         data=[
-                            ("Standard format", self.standard_format),
-                            ("Valid status", self.valid_status),
+                            ("Standard format", standard_format),
+                            ("Valid status", valid_status),
                         ],
                     )
                 else:
                     self.fail(
                         "Added patch file is missing Upstream-Status: <Valid status> in the commit message",
                         data=[
-                            ("Standard format", self.standard_format),
-                            ("Valid status", self.valid_status),
+                            ("Standard format", standard_format),
+                            ("Valid status", valid_status),
                         ],
                     )
 
@@ -97,8 +92,8 @@ class TestPatch(base.Base):
                         "but was found afterwards.",
                         data=[
                             ("Current", line.lstrip("+")),
-                            ("Standard format", self.standard_format),
-                            ("Valid status", self.valid_status),
+                            ("Standard format", standard_format),
+                            ("Valid status", valid_status),
                         ],
                     )
 
@@ -142,14 +137,14 @@ class TestPatch(base.Base):
                             "Upstream-Status is in incorrect format",
                             data=[
                                 ("Current", pe.pstr),
-                                ("Standard format", self.standard_format),
-                                ("Valid status", self.valid_status),
+                                ("Standard format", standard_format),
+                                ("Valid status", valid_status),
                             ],
                         )
 
     def test_signed_off_by_presence(self):
         if not TestPatch.newpatches:
-            self.skip("There are no new software patches, no reason to test %s presence" % PatchSignedOffBy.mark)
+            self.skip("There are no new software patches, no reason to test %s presence" % TestPatch.mark)
 
         for newpatch in TestPatch.newpatches:
             payload = newpatch.__str__()
@@ -162,7 +157,7 @@ class TestPatch(base.Base):
                 self.fail('A patch file has been added without a Signed-off-by tag: \'%s\'' % os.path.basename(newpatch.path))
 
     def test_cve_tag_format(self):
-        for commit in TestPatch.commits:
+        for commit in self.commits:
             if patchtest_patterns.cve.search_string(
                 commit.shortlog
             ) or patchtest_patterns.cve.search_string(commit.commit_message):
diff --git a/meta/lib/patchtest/tests/test_python_pylint.py b/meta/lib/patchtest/tests/test_python_pylint.py
index ec9129bc79..37d1de9436 100644
--- a/meta/lib/patchtest/tests/test_python_pylint.py
+++ b/meta/lib/patchtest/tests/test_python_pylint.py
@@ -47,7 +47,7 @@ class PyLint(base.Base):
         for pythonpatch in self.pythonpatches:
             # a condition checking whether a file is renamed or not
             # unidiff doesn't support this yet
-            if pythonpatch.target_file is not pythonpatch.path:
+            if pythonpatch.target_file != pythonpatch.path:
                 path = pythonpatch.target_file[2:]
             else:
                 path = pythonpatch.path
@@ -55,9 +55,9 @@ class PyLint(base.Base):
             reporter = TextReporter(pylint_output)
             lint.Run([self.pylint_options, pythonpatch.path], reporter=reporter, exit=False)
             for line in pylint_output.readlines():
-                    if not '*' in line:
-                        if line.strip():
-                            self.pylint_test[line.strip().split(' ',1)[0]] = line.strip().split(' ',1)[1]
+                if not '*' in line:
+                    if line.strip():
+                        self.pylint_test[line.strip().split(' ',1)[0]] = line.strip().split(' ',1)[1]
 
         for issue in self.pylint_test:
              if self.pylint_test[issue] not in self.pylint_pretest.values():
-- 
2.54.0


