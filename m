Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22242C001DB
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 12:55:03 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.42034.1691758499777969986
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 11 Aug 2023 05:55:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GmPWAfz8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F348EE000E;
	Fri, 11 Aug 2023 12:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691758498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n0qhGNqlkbhqP/s39sfN9qJd9eqw12Yj/usznfkjNp0=;
	b=GmPWAfz8ltSQ51use9BgjcrU3paNySTJzR8TThYjiOW5WCCdcbaSkFfRNyYrDeUa6H8SRA
	+mPXam7/Opttbr3R8oP72llIgmzY1NY80ZKXQ6eDzblMrSlHdsoHGwS5Kq/0kgP/jGFDcQ
	7mk+ph82bi7rGtT43TJD/F4IJhylovSMHO4Lb+kL8qKVKArA4Fras7FHSd+BWoQN6Guo2c
	V5dU2KmYk+QLNsLTDWZbMcS5Ahjgi+OnAWgkfniS3mvlDc1rQEZIjWZybbOIy6LJ2y4c1X
	1KoOTh8DhFOliF68qqRJnaDRGuiEO4sBXyCh/WPqYgghaA8WlrefZxF10eM1fA==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH 1/2] oeqa/selftest: introduce gitarchive tests
Date: Fri, 11 Aug 2023 14:55:31 +0200
Message-ID: <20230811125532.9427-2-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230811125532.9427-1-alexis.lothore@bootlin.com>
References: <20230811125532.9427-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 12:55:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185839

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Add a test suite for gitarchive.py. For now, only introduce tests on
methods which needs to read existing tags

The tests rely on tmpdirs to create local, "fake" results repository in
order to allow basic git commands

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 .../oeqa/selftest/cases/gitarchivetests.py    | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/gitarchivetests.py

diff --git a/meta/lib/oeqa/selftest/cases/gitarchivetests.py b/meta/lib/oeqa/selftest/cases/gitarchivetests.py
new file mode 100644
index 000000000000..4f7acd3311d5
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/gitarchivetests.py
@@ -0,0 +1,96 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import os
+import sys
+basepath = os.path.abspath(os.path.dirname(__file__) + '/../../../../../')
+lib_path = basepath + '/scripts/lib'
+sys.path = sys.path + [lib_path]
+import oeqa.utils.gitarchive as ga
+import tempfile
+import shutil
+import scriptutils
+from oeqa.selftest.case import OESelftestTestCase
+
+logger = scriptutils.logger_create('resulttool')
+
+def create_fake_repository(commit, tag_list=[]):
+    """ Create a testing git directory
+
+    Initialize a simple git repository with one initial commit, and as many
+    tags on this commit as listed in tag_list
+    Returns both git directory path and gitarchive git object
+    If commit is true, fake data will be commited, otherwise it will stay in staging area
+    If commit is true and tag_lsit is non empty, all tags in tag_list will be
+    created on the initial commit
+    Fake remote will also be added to make git ls-remote work
+    """
+    fake_data_file = "fake_data.txt"
+    tempdir = tempfile.mkdtemp(prefix='fake_results.')
+    repo = ga.init_git_repo(tempdir, False, False, logger)
+    repo.run_cmd(["remote", "add", "origin", "."])
+    with open(os.path.join(tempdir, fake_data_file), "w") as fake_data:
+        fake_data.write("Fake data")
+    if commit:
+        repo.run_cmd(["add", fake_data_file])
+        repo.run_cmd(["commit", "-m", "\"Add fake data\""])
+        for tag in tag_list:
+            repo.run_cmd(["tag", tag])
+    
+    return tempdir, repo
+
+def delete_fake_repository(path):
+    shutil.rmtree(path)
+
+def tag_exists(git_obj, target_tag):
+    for tag in git_obj.run_cmd(["tag"]).splitlines():
+        if target_tag == tag:
+            return True
+    return False
+
+class GitArchiveTests(OESelftestTestCase):
+    TEST_BRANCH="main"
+    TEST_COMMIT="0f7d5df"
+    TEST_COMMIT_COUNT="42"
+
+    def test_create_first_test_tag(self):
+        path, git_obj = create_fake_repository(False)
+        keywords = {'commit': self.TEST_COMMIT, 'branch': self.TEST_BRANCH, "commit_count": self.TEST_COMMIT_COUNT}
+        target_tag = f"{self.TEST_BRANCH}/{self.TEST_COMMIT_COUNT}-g{self.TEST_COMMIT}/0"
+
+        ga.gitarchive(path, path, True, False,
+                              "Results of {branch}:{commit}", "branch: {branch}\ncommit: {commit}", "{branch}",
+                              False, "{branch}/{commit_count}-g{commit}/{tag_number}",
+                              'Test run #{tag_number} of {branch}:{commit}', '',
+                              [], [], False, keywords, logger)
+        self.assertTrue(tag_exists(git_obj, target_tag), msg=f"Tag {target_tag} has not been created")
+        delete_fake_repository(path)
+
+    def test_create_second_test_tag(self):
+        first_tag = f"{self.TEST_BRANCH}/{self.TEST_COMMIT_COUNT}-g{self.TEST_COMMIT}/0"
+        second_tag = f"{self.TEST_BRANCH}/{self.TEST_COMMIT_COUNT}-g{self.TEST_COMMIT}/1"
+        keywords = {'commit': self.TEST_COMMIT, 'branch': self.TEST_BRANCH, "commit_count": self.TEST_COMMIT_COUNT}
+
+        path, git_obj = create_fake_repository(True, [first_tag])
+        ga.gitarchive(path, path, True, False,
+                              "Results of {branch}:{commit}", "branch: {branch}\ncommit: {commit}", "{branch}",
+                              False, "{branch}/{commit_count}-g{commit}/{tag_number}",
+                              'Test run #{tag_number} of {branch}:{commit}', '',
+                              [], [], False, keywords, logger)
+        self.assertTrue(tag_exists(git_obj, second_tag), msg=f"Second tag {second_tag} has not been created")
+        delete_fake_repository(path)
+
+    def test_get_revs_on_branch(self):
+        fake_tags_list=["main/10-g0f7d5df/0", "main/10-g0f7d5df/1", "foo/20-g2468f5d/0"]
+        tag_name = "{branch}/{commit_number}-g{commit}/{tag_number}"
+
+        path, git_obj = create_fake_repository(True, fake_tags_list)
+        revs = ga.get_test_revs(logger, git_obj, tag_name, branch="main")
+        self.assertEqual(len(revs), 1)
+        self.assertEqual(revs[0].commit, "0f7d5df")
+        self.assertEqual(len(revs[0].tags), 2)
+        self.assertEqual(revs[0].tags, ['main/10-g0f7d5df/0', 'main/10-g0f7d5df/1'])
+        delete_fake_repository(path)
-- 
2.41.0


