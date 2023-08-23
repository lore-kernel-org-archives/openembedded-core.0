Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E1CFEE49A0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 10:35:06 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.8322.1692786899544084752
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 03:35:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fQPJbqT9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 875C5C0004;
	Wed, 23 Aug 2023 10:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692786897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5iQNfqb/fmznFoPFeNcZguQj1zFqX/5wlTaZV/fxMBY=;
	b=fQPJbqT9jf+aMh/S1SXHr84TEiPvYokSlZM+UW7m5o+YHKMwry00+zsYL63v4/US8yEoK7
	nv4wjvVdq/zdjPbkOSf0Vs51Rs2S+MfhQO5fW2m0Odgjvd+2iFhwzr78ZetAYEiWPX21bm
	c1bfj0NeK7P24EjYv05BPwxKM0jBPpim49dG8V0HlVOiaxaK6T4bEJ8e9/ifDrkpWy/1L8
	aD7EnSmD64Wg6P2QlKCD7amEhMtP3lMyqWfTxQLWhBqDQn45kIy5F2TdSh0sCWMmRRysbZ
	h8AH2X+HoTDAVYNowRaIXgQ3/37/ltX+SMU+IrTX9M9nLJwEpNgF52qiTcP42w==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH 2/2] oeqa/utils/gitarchive: fall back to local tags when listing existing tags
Date: Wed, 23 Aug 2023 12:35:20 +0200
Message-ID: <20230823103520.72792-3-alexis.lothore@bootlin.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186568

From: Alexis Lothoré <alexis.lothore@bootlin.com>

e9cff55e73cc has switched tag listing from bare "git tag" to "git
ls-remote" to make sure not to miss remote tags which are not fetched
locally. This mechanism first checks for configured remote repository, next
for possibly passed url, and then fails if none worked.

However there are still cases where no remote repository is
configured and no url is provided (for instance: buildperf tests use an
empty git directory to store tests). Fix those cases by putting back the
old behavior (local tags check) as last resort, with at least a warning for
future diagnostics if we still encounter tagging issues

Fixes: e9cff55e73cc ("oeqa/utils/gitarchive: fix tag computation when creating archive")
Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 .../oeqa/selftest/cases/gitarchivetests.py    | 14 ++++++-----
 meta/lib/oeqa/utils/gitarchive.py             | 25 ++++++++++++-------
 2 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/gitarchivetests.py b/meta/lib/oeqa/selftest/cases/gitarchivetests.py
index e19fd4f28088..71382089c124 100644
--- a/meta/lib/oeqa/selftest/cases/gitarchivetests.py
+++ b/meta/lib/oeqa/selftest/cases/gitarchivetests.py
@@ -115,13 +115,15 @@ class GitArchiveTests(OESelftestTestCase):
         self.assertIn("yocto-4.2", tags)
         delete_fake_repository(path)
 
-    def test_get_tags_without_valid_remote_neither_url(self):
-        url = 'git://git.yoctoproject.org/poky'
-        path, git_obj = create_fake_repository(False, None, False)
+    def test_get_tags_with_only_local_tag(self):
+        fake_tags_list=["main/10-g0f7d5df/0", "main/10-g0f7d5df/1", "foo/20-g2468f5d/0"]
+        path, git_obj = create_fake_repository(True, fake_tags_list, False)
 
-        """Test for some well established tags (released tags)"""
-        with self.assertRaises(GitError):
-            tags = ga.get_tags(git_obj, self.log, pattern="yocto-*")
+        """No remote is configured and no url is passed: get_tags must fall
+        back to local tags
+        """
+        tags = ga.get_tags(git_obj, self.log)
+        self.assertCountEqual(tags, fake_tags_list)
         delete_fake_repository(path)
 
     def test_get_tags_without_valid_remote_and_wrong_url(self):
diff --git a/meta/lib/oeqa/utils/gitarchive.py b/meta/lib/oeqa/utils/gitarchive.py
index c15a44ce9e4c..ac36ecb3a9ca 100644
--- a/meta/lib/oeqa/utils/gitarchive.py
+++ b/meta/lib/oeqa/utils/gitarchive.py
@@ -116,18 +116,25 @@ def get_tags(repo, log, pattern=None, url=None):
         cmd.append(pattern)
     try:
         tags_refs = repo.run_cmd(cmd)
+        tags = ["".join(d.split()[1].split('/', 2)[2:]) for d in tags_refs.splitlines()]
     except GitError as e:
         # If it fails, retry with repository url if one is provided
-        if not url:
-            raise(e)
-        log.info("No remote repository configured, use provided url")
-        cmd = base_cmd.copy()
-        cmd.append(url)
-        if pattern:
-            cmd.append(pattern)
-        tags_refs = repo.run_cmd(cmd)
+        if url:
+            log.info("No remote repository configured, use provided url")
+            cmd = base_cmd.copy()
+            cmd.append(url)
+            if pattern:
+                cmd.append(pattern)
+            tags_refs = repo.run_cmd(cmd)
+            tags = ["".join(d.split()[1].split('/', 2)[2:]) for d in tags_refs.splitlines()]
+        else:
+            log.warning("Read local tags only, some remote tags may be missed")
+            cmd = ["tag"]
+            if pattern:
+                cmd += ["-l", pattern]
+            tags = repo.run_cmd(cmd).splitlines()
 
-    return ["".join(d.split()[1].split('/', 2)[2:]) for d in tags_refs.splitlines()]
+    return tags
 
 def expand_tag_strings(repo, name_pattern, msg_subj_pattern, msg_body_pattern,
                        url, log, keywords):
-- 
2.41.0


