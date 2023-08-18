Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0719C7113C
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 14:16:52 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.12269.1692368202290937334
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 07:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DXux0MAN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F7DEFF80E;
	Fri, 18 Aug 2023 14:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692368200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nRwZosGbOu803OHlF6FaXH29ROXV8DNxsw6o62hX0O0=;
	b=DXux0MANbpy7n8Lyc4xOLEyVrR048vqh9XlmYeg8Gwi2u6RVJ5hDUj+X76rZ1TwdM4eVCi
	wnyKExf2nmT46hVq7HQoDgK/BwTm0fi9RUJSv74fJRJNASEB9lATUeUuBdRWhBaII3pber
	C4jSPsrXy7P727m1Ba1Eue+faOzAiizHb13DGHxJIXPH4T91VWYlRuALoooCgn8fA/xcwj
	3mTCeQ4Km7arKJzzPX2agMMR/BjMZ9D2aatyYgqXzS/6QrYSu7Ui2AR4nr7P93bxObv7RK
	CnE3jyv6V6ei0eRQUeb/c2i0+t1vWL+uY7+k2Layw6WQFsT3MIkqJph3aVI8mw==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH v2 3/3] oeqa/selftest/gitarchive: add tests about tags lisiting when no remote is configured
Date: Fri, 18 Aug 2023 16:17:12 +0200
Message-ID: <20230818141712.189294-4-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230818141712.189294-1-alexis.lothore@bootlin.com>
References: <20230818141712.189294-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 14:16:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186369

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Add specific tests on gitarchive for when tag listing is required but no
remote is configured in target directory: it should either succeed if valid
url is provided, or fail is url is not provided or wrong

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 .../oeqa/selftest/cases/gitarchivetests.py    | 35 +++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/gitarchivetests.py b/meta/lib/oeqa/selftest/cases/gitarchivetests.py
index 4f7acd3311d5..11b88daab860 100644
--- a/meta/lib/oeqa/selftest/cases/gitarchivetests.py
+++ b/meta/lib/oeqa/selftest/cases/gitarchivetests.py
@@ -10,6 +10,7 @@ basepath = os.path.abspath(os.path.dirname(__file__) + '/../../../../../')
 lib_path = basepath + '/scripts/lib'
 sys.path = sys.path + [lib_path]
 import oeqa.utils.gitarchive as ga
+from oeqa.utils.git import GitError
 import tempfile
 import shutil
 import scriptutils
@@ -17,7 +18,7 @@ from oeqa.selftest.case import OESelftestTestCase
 
 logger = scriptutils.logger_create('resulttool')
 
-def create_fake_repository(commit, tag_list=[]):
+def create_fake_repository(commit, tag_list=[], add_remote=True):
     """ Create a testing git directory
 
     Initialize a simple git repository with one initial commit, and as many
@@ -31,7 +32,8 @@ def create_fake_repository(commit, tag_list=[]):
     fake_data_file = "fake_data.txt"
     tempdir = tempfile.mkdtemp(prefix='fake_results.')
     repo = ga.init_git_repo(tempdir, False, False, logger)
-    repo.run_cmd(["remote", "add", "origin", "."])
+    if add_remote:
+        repo.run_cmd(["remote", "add", "origin", "."])
     with open(os.path.join(tempdir, fake_data_file), "w") as fake_data:
         fake_data.write("Fake data")
     if commit:
@@ -94,3 +96,32 @@ class GitArchiveTests(OESelftestTestCase):
         self.assertEqual(len(revs[0].tags), 2)
         self.assertEqual(revs[0].tags, ['main/10-g0f7d5df/0', 'main/10-g0f7d5df/1'])
         delete_fake_repository(path)
+
+    def test_get_tags_without_valid_remote(self):
+        url = 'git://git.yoctoproject.org/poky'
+        path, git_obj = create_fake_repository(False, None, False)
+
+        tags = ga.get_tags(git_obj, pattern="yocto-*", url=url)
+        """Test for some well established tags (released tags)"""
+        self.assertIn("yocto-4.0", tags)
+        self.assertIn("yocto-4.1", tags)
+        self.assertIn("yocto-4.2", tags)
+        delete_fake_repository(path)
+
+    def test_get_tags_without_valid_remote_neither_url(self):
+        url = 'git://git.yoctoproject.org/poky'
+        path, git_obj = create_fake_repository(False, None, False)
+
+        """Test for some well established tags (released tags)"""
+        with self.assertRaises(GitError):
+            tags = ga.get_tags(git_obj, pattern="yocto-*")
+        delete_fake_repository(path)
+
+    def test_get_tags_without_valid_remote_and_wrong_url(self):
+        url = 'git://git.foo.org/bar'
+        path, git_obj = create_fake_repository(False, None, False)
+
+        """Test for some well established tags (released tags)"""
+        with self.assertRaises(GitError):
+            tags = ga.get_tags(git_obj, pattern="yocto-*", url=url)
+        delete_fake_repository(path)
-- 
2.41.0


