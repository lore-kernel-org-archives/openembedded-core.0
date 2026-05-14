Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70ED9CD4F3D
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 19:42:17 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19889.1778787736324363983
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 12:42:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20251104.gappssmtp.com header.s=20251104 header.b=hzLcnpUd;
 spf=pass (domain: baylibre.com, ip: 209.85.222.181, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-9118b952e2bso55631085a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 12:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778787735; x=1779392535; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uh6A7zFEEVc6hTgr/8OGaMISApWBsqt1mCd8bT9FTOI=;
        b=hzLcnpUd431lWw3RRmCSR2bfxGabtJZT4rU3tv5UWyggsOQ7nSe0LFIMvxz41gxeh7
         YaJ50Aeq2TV/iJ9hGUATTe2dF3DO9qoscyD7Qb1tPouOdFpdgyXj+4/UPMwXbHZj5Ko7
         dcsG75cc+vSFXQ+v3YwFRRqLV1EIyyhkOiZVoCsIH3iaChQseEkJWG8SfK0NvlknrKIh
         APWp85vXtnSmWCGX40i5KYItklFzTbE4aJVLVq2jPLTfjliAfquUbRJ+ADmeaiC6f5r/
         HSukvI5pFxDGkBbyPjvi70yHtJ5xBtPH2Z4BjRzV+XosM9mjCQ8ROoHoMAgqypmzGrLu
         XhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778787735; x=1779392535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uh6A7zFEEVc6hTgr/8OGaMISApWBsqt1mCd8bT9FTOI=;
        b=qQri+kXNVXhbJci+4sVVdnrzU8OX4HMGY6cbMCHbx69oRhUcnNvNrRmWQjMiS8Y5ff
         RI7m4482YuWhc5EMjQcXJC2ToRjLB9/yCVG+01aIBivtfYutPIIMLoq0vpapLFIet9nw
         l6krfYLMeNW9uUC9SsfAVjScbxuF8FYupATsF/aIu4ZhK3kUPyNTFr9OnuqdOVaQvK9q
         /Lg3zMIk8uRH9lydMjsvpYObkikOGuCLLag57naZC3nipMf9q5Deo/Ir8m3oeyxwkwNI
         aPI+5NUlkJB54svg1YAZ6OZHia1pa3OdjNZaMtt4gtkuP9JldJ6OCdUlbJFgnSqy9MOe
         mZRA==
X-Gm-Message-State: AOJu0Yz9gONbZl6j45EQY7lvi/N3MrbemHv77K2tVnP3RLDSWAVmZpkH
	kF4tofLRcDyK+Cbomopx1y7sFn1PE80nlI8f86HFlfvJIffvMFQTTDczPlJ/AqQnPRh/LjEOVIW
	XzZRpXUE=
X-Gm-Gg: Acq92OEk8JCix4QxnJWdQpTAbEopXcsIUS7n+ae/xuAqmH3+ky6LsKYn6A6LvBcHuWO
	DTlEVXZ+axNiYMvda6l/+8hJmXtlS90HPPmhnsDLcoFSVbn4uDeLGutLpG1CQEkyvFPgEAfa1AM
	nMgF5T+cozufmh0TubgiWyCvDYBi42udin+9plDDKH/+qNK0cmSs7dh8RyZDCqZgJTTcpHH6wD9
	RiUYocVfP0k5Rq29lv/tc6K5w3d5GInHo/0SnIUkToUfDNIfqd8Tm3B8wuoWlZVj9886k0A/zAP
	ri3bgeW3LR+nA6AmxBQXXP+QkJH8FcHasxWtsNsp15z4sfFqz0XfN+IDHwtVqy4C4UnVESPR7Al
	JqR5nCUumSZ4qlaSEUO21JRTD8OUYdtUKsPstbh/+MOck6fyeyrQNvyLgS3hv6bz/kky+WKOO8m
	jnS682af38mLjiQjG0IoQzLDSt+w==
X-Received: by 2002:a05:620a:1985:b0:90f:9cde:978c with SMTP id af79cd13be357-911cc3c3540mr180593785a.14.1778787735271;
        Thu, 14 May 2026 12:42:15 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:537:a9f7:1a84:f246])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910ba36e638sm329031885a.9.2026.05.14.12.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 12:42:14 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [OE-core][PATCH 03/11] patchtest: tests: cleanup test suites
Date: Thu, 14 May 2026 15:41:59 -0400
Message-ID: <20260514194207.1958325-4-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260514194207.1958325-1-tgamblin@baylibre.com>
References: <20260514194207.1958325-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 19:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237050

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
index 55d1068df3..f158f4472c 100644
--- a/meta/lib/patchtest/tests/test_mbox.py
+++ b/meta/lib/patchtest/tests/test_mbox.py
@@ -65,11 +65,11 @@ class TestMbox(base.Base):
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
 
@@ -108,7 +108,7 @@ class TestMbox(base.Base):
             folders = patch.path.split('/')
             base_path = folders[0]
             for project in [self.bitbake, self.doc, self.oe, self.poky]:
-                if base_path in  project.paths:
+                if base_path in project.paths:
                     self.fail('Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists',
                               data=[('Suggested ML', '%s [%s]' % (project.listemail, project.gitrepo)),
                                     ('Patch\'s path:', patch.path)])
@@ -161,7 +161,7 @@ class TestMbox(base.Base):
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


