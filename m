Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F7B1EE49B4
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 10:35:06 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.8321.1692786899536257438
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 03:35:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AZHKwxz+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 331F7C0009;
	Wed, 23 Aug 2023 10:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692786897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XLg3TJZFPqEZfZt3cKKHgjLIl6DkoIt+PAgIbVyerSs=;
	b=AZHKwxz+nHFfN9H8ZG+HmoLmcaSMZ4VMBgTuTD349J4l4ajxRQS6qHBeY9+hdHW02kZrOf
	54aoVQJ8CsiV2nCaz2tMuTmJI+sDF/bLLaLeMRCs/tkWItVmLqpuMW9adWwXXDUyZt7gHV
	0hDFUiZMOSvCA7+BLsXM7zuvImF1vJq6nNDJOpRWYSj8fFS3CQljOxd4acdYx1irH7B2f5
	8QkANE+SSKlAN9xss9qYcGLkWG039/Ec6GEoSggz6VxkHrdTYnkEfiSmITMF4iVlFhJcxv
	4eycoTWnBF3aeBoQEbzgfpeflxLykfh0B6aesgF6cVC+vVOZuDEycwxKy1UgsQ==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH 1/2] oeqa/utils/gitarchive: allow to pass a logger to get_tags
Date: Wed, 23 Aug 2023 12:35:19 +0200
Message-ID: <20230823103520.72792-2-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230823103520.72792-1-alexis.lothore@bootlin.com>
References: <20230823103520.72792-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 10:35:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186569

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Propagate a "log" parameter to get_tags in order to know what method is
used to retrieve existing tags

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 meta/lib/oeqa/selftest/cases/gitarchivetests.py | 13 ++++++++++---
 meta/lib/oeqa/utils/gitarchive.py               | 11 ++++++-----
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/gitarchivetests.py b/meta/lib/oeqa/selftest/cases/gitarchivetests.py
index 11b88daab860..e19fd4f28088 100644
--- a/meta/lib/oeqa/selftest/cases/gitarchivetests.py
+++ b/meta/lib/oeqa/selftest/cases/gitarchivetests.py
@@ -14,6 +14,7 @@ from oeqa.utils.git import GitError
 import tempfile
 import shutil
 import scriptutils
+import logging
 from oeqa.selftest.case import OESelftestTestCase
 
 logger = scriptutils.logger_create('resulttool')
@@ -58,6 +59,12 @@ class GitArchiveTests(OESelftestTestCase):
     TEST_COMMIT="0f7d5df"
     TEST_COMMIT_COUNT="42"
 
+    @classmethod
+    def setUpClass(cls):
+        super().setUpClass()
+        cls.log = logging.getLogger('gitarchivetests')
+        cls.log.setLevel(logging.DEBUG)
+
     def test_create_first_test_tag(self):
         path, git_obj = create_fake_repository(False)
         keywords = {'commit': self.TEST_COMMIT, 'branch': self.TEST_BRANCH, "commit_count": self.TEST_COMMIT_COUNT}
@@ -101,7 +108,7 @@ class GitArchiveTests(OESelftestTestCase):
         url = 'git://git.yoctoproject.org/poky'
         path, git_obj = create_fake_repository(False, None, False)
 
-        tags = ga.get_tags(git_obj, pattern="yocto-*", url=url)
+        tags = ga.get_tags(git_obj, self.log, pattern="yocto-*", url=url)
         """Test for some well established tags (released tags)"""
         self.assertIn("yocto-4.0", tags)
         self.assertIn("yocto-4.1", tags)
@@ -114,7 +121,7 @@ class GitArchiveTests(OESelftestTestCase):
 
         """Test for some well established tags (released tags)"""
         with self.assertRaises(GitError):
-            tags = ga.get_tags(git_obj, pattern="yocto-*")
+            tags = ga.get_tags(git_obj, self.log, pattern="yocto-*")
         delete_fake_repository(path)
 
     def test_get_tags_without_valid_remote_and_wrong_url(self):
@@ -123,5 +130,5 @@ class GitArchiveTests(OESelftestTestCase):
 
         """Test for some well established tags (released tags)"""
         with self.assertRaises(GitError):
-            tags = ga.get_tags(git_obj, pattern="yocto-*", url=url)
+            tags = ga.get_tags(git_obj, self.log, pattern="yocto-*", url=url)
         delete_fake_repository(path)
diff --git a/meta/lib/oeqa/utils/gitarchive.py b/meta/lib/oeqa/utils/gitarchive.py
index 1a28a09efef7..c15a44ce9e4c 100644
--- a/meta/lib/oeqa/utils/gitarchive.py
+++ b/meta/lib/oeqa/utils/gitarchive.py
@@ -100,7 +100,7 @@ def git_commit_data(repo, data_dir, branch, message, exclude, notes, log):
         if os.path.exists(tmp_index):
             os.unlink(tmp_index)
 
-def get_tags(repo, pattern=None, url=None):
+def get_tags(repo, log, pattern=None, url=None):
     """ Fetch remote tags from current repository
 
     A pattern can be provided to filter returned tags list
@@ -120,6 +120,7 @@ def get_tags(repo, pattern=None, url=None):
         # If it fails, retry with repository url if one is provided
         if not url:
             raise(e)
+        log.info("No remote repository configured, use provided url")
         cmd = base_cmd.copy()
         cmd.append(url)
         if pattern:
@@ -129,7 +130,7 @@ def get_tags(repo, pattern=None, url=None):
     return ["".join(d.split()[1].split('/', 2)[2:]) for d in tags_refs.splitlines()]
 
 def expand_tag_strings(repo, name_pattern, msg_subj_pattern, msg_body_pattern,
-                       url, keywords):
+                       url, log, keywords):
     """Generate tag name and message, with support for running id number"""
     keyws = keywords.copy()
     # Tag number is handled specially: if not defined, we autoincrement it
@@ -143,7 +144,7 @@ def expand_tag_strings(repo, name_pattern, msg_subj_pattern, msg_body_pattern,
         tag_re = tag_re.format(tag_number='(?P<tag_number>[0-9]{1,5})')
 
         keyws['tag_number'] = 0
-        for existing_tag in get_tags(repo, url=url):
+        for existing_tag in get_tags(repo, log, url=url):
             match = re.match(tag_re, existing_tag)
 
             if match and int(match.group('tag_number')) >= keyws['tag_number']:
@@ -171,7 +172,7 @@ def gitarchive(data_dir, git_dir, no_create, bare, commit_msg_subject, commit_ms
         tag_name, tag_msg = expand_tag_strings(data_repo, tagname,
                                                tag_msg_subject,
                                                tag_msg_body,
-                                               push, keywords)
+                                               push, log, keywords)
 
     # Commit data
     commit = git_commit_data(data_repo, data_dir, branch_name,
@@ -209,7 +210,7 @@ def get_test_runs(log, repo, tag_name, **kwargs):
 
     # Get a list of all matching tags
     tag_pattern = tag_name.format(**str_fields)
-    tags = get_tags(repo, pattern=tag_pattern)
+    tags = get_tags(repo, log, pattern=tag_pattern)
     log.debug("Found %d tags matching pattern '%s'", len(tags), tag_pattern)
 
     # Parse undefined fields from tag names
-- 
2.41.0


