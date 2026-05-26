Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 684E4CD5BB1
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 19:33:39 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4346.1779824017189066236
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 12:33:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=X1Wf5ETD;
 spf=pass (domain: baylibre.com, ip: 209.85.222.172, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-9102e90bcbeso1133842285a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 12:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779824016; x=1780428816; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kD5tf2eJUjl3Ip+QSmOLOroF/BAi7xUhsy1nf8vyCp4=;
        b=X1Wf5ETDokZMtiuCHA+yyLZz5E63HxtB4usYeWCBPNKKZibiT/QnMpC+6M7ChN/a5s
         3e6oMUtNVtx62xq1tHJdINbNLpD/dtlMNgyfUfzlP58wGsYqTYsBxCeboKBOQ+svAmip
         ruDGklG0RqbMPRQZPJM5A1vVKqnzFhGurU8u+HHHQdjWOYGldTHkj7Gr3R/6B1n6bJ7Z
         YPhwAv0C0MiCJ9NVVZepKjwLvU6VpV0FwthLW+45SWYDnjL8+J+cr7fJZAIm1rG6nAiH
         8tl4R50r1rlYdwL1/XBhRzT5jFPkVpege0ijQfviFgv2LCn4KFWsCtOFggVktHHkovt5
         7nKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779824016; x=1780428816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kD5tf2eJUjl3Ip+QSmOLOroF/BAi7xUhsy1nf8vyCp4=;
        b=nVBJXegTB3mJRuOyeOIVUAaZTK2/upk3vahFSQFNWBSwTEl8GkvbzNGpfWdupVjeLX
         iqMGeYyfDem6gI+4SQtihXDaTDIgks3HWPT1ZSHxXb+hHDpayxMbPwbjvkXPx+ujznKE
         zrjvZAi2LyOLLYWz1Rr71tDtd5xg/OycAWILPxvQwV6AF8xny2xQ3O4PuMhXXwSM9z2x
         mrOfksog5KFdmW43WbMxKEbY3rA3zV3EjkU/3uPvzIR8fVM8TrC+pjR5RCr3uJ15uGBm
         +ey67QvMUDjIg4wT+v3a7DZHMupUQjnh9Pp6M8g1hddhHGH3LqKKMDXgGihg40JYY3h1
         LGvA==
X-Gm-Message-State: AOJu0YzW1kc5/PhNiLlavzYhXxGtONNX6s01wEqzfswdFhliKaH14hqy
	A2+Z4gGaOcmH8bFQyimEEuXlgDyeqhXCtSB6Pe0FHl/dz7lCfcIM1j4zRfXswncWmq3iaHFRYcg
	hT7Cjxr8=
X-Gm-Gg: Acq92OFp7ugKIR2E6qbxsfDjHgy41I7u3CWofzTeCD5H7q0Tx98+oPX5PCrdXGy+ypu
	xT1Gb3oUPJkUoJ1bx/ZmX7ohq6XVP6Xzhzb8KkzijjkY8Uj6ZWZGFCVH1S1L8Ed//WWwtbhTzCt
	GHp1II2EXNWiNjw1sCZoxbkYxBNoTnVyTEEXXts6yPLvKF9bWR+odYqeM4xSnPYH3O9rzwNfV+2
	1hPUsE4NqSdiJIPikT7F1THEzaZjBkeSo0F7jZdpXFMa0r5uebKonBgjt9srt6ixaip8fknhh0Y
	HFHVw6sHVSBfN6W2odwciOYuQo04xUnSVRUK8cbhaFQQF6NKqDDXbcTHAW/Cv3s+y6jC+1SapM4
	x4NAI9utoucSQgTg5JOPp8n8a2WLEepcidvqUsNXdXWdcll7wqDXKnM4Wabj/uMqBEq5jzM4Hxm
	RmA2JrQfRoERoMNbD123xoOltWKCbjC3Wk4v/C
X-Received: by 2002:a05:620a:8393:b0:910:4023:4fca with SMTP id af79cd13be357-914b492de5emr2874033385a.18.1779824016232;
        Tue, 26 May 2026 12:33:36 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:537:a9f7:1a84:f246])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f87cd9fcsm285264985a.25.2026.05.26.12.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 12:33:34 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [OE-core][PATCH 6/6] patchtest: tests: test_metadata: cleanup
Date: Tue, 26 May 2026 15:33:17 -0400
Message-ID: <20260526193317.807459-7-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526193317.807459-1-tgamblin@baylibre.com>
References: <20260526193317.807459-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 19:33:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237624

- Use the new _getvar() version
- Replace usage of "pn" as a variable with the more explicit "path"
- Fix some vague comments and typos

AI-Generated: Uses Claude Code

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/tests/test_metadata.py | 62 ++++++++++-------------
 1 file changed, 28 insertions(+), 34 deletions(-)

diff --git a/meta/lib/patchtest/tests/test_metadata.py b/meta/lib/patchtest/tests/test_metadata.py
index 442e80973d..f180309991 100644
--- a/meta/lib/patchtest/tests/test_metadata.py
+++ b/meta/lib/patchtest/tests/test_metadata.py
@@ -19,32 +19,28 @@ class TestMetadata(base.Metadata):
         if not self.added:
             self.skip('No added recipes, skipping test')
 
-        # TODO: this is a workaround so we can parse the recipe not
-        # containing the LICENSE var: add some default license instead
-        # of INVALID into auto.conf, then remove this line at the end
+        # workaround: set a default license so tinfoil can parse recipes
+        # that don't have LICENSE set yet
         auto_conf = os.path.join(os.environ.get('BUILDDIR'), 'conf', 'auto.conf')
         open_flag = 'w'
         if os.path.exists(auto_conf):
             open_flag = 'a'
         with open(auto_conf, open_flag) as fd:
-            for pn in self.added:
+            for path in self.added:
                 fd.write('LICENSE ??= "%s"\n' % patchtest_patterns.invalid_license)
 
         no_license = False
-        for pn in self.added:
-            rd = self.tinfoil.parse_recipe(pn)
-            license = rd.getVar(patchtest_patterns.metadata_lic)
-            if license == patchtest_patterns.invalid_license:
+        for path in self.added:
+            license = self._getvar(path, patchtest_patterns.metadata_lic)
+            if not license or license == patchtest_patterns.invalid_license:
                 no_license = True
                 break
 
-        # remove auto.conf line or the file itself
         if open_flag == 'w':
             os.remove(auto_conf)
         else:
-            fd = open(auto_conf, 'r')
-            lines = fd.readlines()
-            fd.close()
+            with open(auto_conf, 'r') as fd:
+                lines = fd.readlines()
             with open(auto_conf, 'w') as fd:
                 fd.write(''.join(lines[:-1]))
 
@@ -55,14 +51,13 @@ class TestMetadata(base.Metadata):
         if not self.added:
             self.skip('No added recipes, skipping test')
 
-        for pn in self.added:
-            rd = self.tinfoil.parse_recipe(pn)
-            pathname = rd.getVar('FILE')
+        for path in self.added:
+            pathname = self._getvar(path, 'FILE') or path
             # we are not interested in images
             if '/images/' in pathname:
                 continue
-            lic_files_chksum = rd.getVar(patchtest_patterns.metadata_chksum)
-            if rd.getVar(patchtest_patterns.license_var) == patchtest_patterns.closed:
+            lic_files_chksum = self._getvar(path, patchtest_patterns.metadata_chksum)
+            if self._getvar(path, patchtest_patterns.license_var) == patchtest_patterns.closed:
                 continue
             if not lic_files_chksum:
                 self.fail(
@@ -108,13 +103,13 @@ class TestMetadata(base.Metadata):
                         )
 
     def _collect_src_uri(self, key_prefix):
-        for pn in self.modified:
-            if 'core-image' in pn:
+        for path in self.modified:
+            if 'core-image' in os.path.basename(path):
                 continue
-            rd = self.tinfoil.parse_recipe(pn)
+            src_uri = self._getvar(path, patchtest_patterns.metadata_src_uri)
             PatchTestDataStore[
-                "%s-%s-%s" % (key_prefix, patchtest_patterns.metadata_src_uri, pn)
-            ] = rd.getVar(patchtest_patterns.metadata_src_uri)
+                "%s-%s-%s" % (key_prefix, patchtest_patterns.metadata_src_uri, path)
+            ] = src_uri or ''
 
     def pretest_src_uri_left_files(self):
         if not PatchtestParser.repo.canbemerged():
@@ -130,12 +125,12 @@ class TestMetadata(base.Metadata):
             self.skip('No modified recipes, skipping test')
         self._collect_src_uri(self.shortid())
 
-        for pn in self.modified:
+        for path in self.modified:
             pretest_src_uri = PatchTestDataStore[
-                "pre%s-%s-%s" % (self.shortid(), patchtest_patterns.metadata_src_uri, pn)
+                "pre%s-%s-%s" % (self.shortid(), patchtest_patterns.metadata_src_uri, path)
             ].split()
             test_src_uri = PatchTestDataStore[
-                "%s-%s-%s" % (self.shortid(), patchtest_patterns.metadata_src_uri, pn)
+                "%s-%s-%s" % (self.shortid(), patchtest_patterns.metadata_src_uri, path)
             ].split()
 
             pretest_files = set([os.path.basename(patch.split(';')[0]) for patch in pretest_src_uri if patch.startswith('file://')])
@@ -154,7 +149,7 @@ class TestMetadata(base.Metadata):
                 filesremoved_from_usr_uri = pretest_files - test_files
 
                 # finally, get those patches removed at SRC_URI and not removed from the patchset
-                # TODO: we are not taking into account  renames, so test may raise false positives
+                # TODO: we are not taking into account renames, so test may raise false positives
                 not_removed = filesremoved_from_usr_uri - filesremoved_from_patchset
                 if not_removed:
                     self.fail('Patches not removed from tree. Remove them and amend the submitted mbox',
@@ -164,15 +159,15 @@ class TestMetadata(base.Metadata):
         if not self.added:
             self.skip('No added recipes, skipping test')
 
-        for pn in self.added:
+        for path in self.added:
+            pn = os.path.basename(path).split('_')[0]
             # we are not interested in images
             if 'core-image' in pn:
                 continue
-            rd = self.tinfoil.parse_recipe(pn)
-            summary = rd.getVar(patchtest_patterns.metadata_summary)
+            summary = self._getvar(path, patchtest_patterns.metadata_summary)
 
             # "${PN} version ${PN}-${PR}" is the default, so fail if default
-            if summary.startswith("%s version" % pn):
+            if not summary or summary.startswith("%s version" % pn):
                 self.fail(
                     "%s is missing in newly added recipe" % patchtest_patterns.metadata_summary
                 )
@@ -186,12 +181,11 @@ class TestMetadata(base.Metadata):
             or PatchtestParser.repo.patch.branch == "dunfell"
         ):
             self.skip("No modified recipes or older target branch, skipping test")
-        for pn in self.modified:
+        for path in self.modified:
             # we are not interested in images
-            if 'core-image' in pn:
+            if 'core-image' in os.path.basename(path):
                 continue
-            rd = self.tinfoil.parse_recipe(pn)
-            cve_check_ignore = rd.getVar(patchtest_patterns.cve_check_ignore_var)
+            cve_check_ignore = self._getvar(path, patchtest_patterns.cve_check_ignore_var)
 
             if cve_check_ignore is not None:
                 self.fail(
-- 
2.54.0


