Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20731FD5F87
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 06:46:32 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.100332.1775630786977228285
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 23:46:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RbUSUHc2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43b8e8e7432so4704481f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 23:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775630785; x=1776235585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=R0GsLTcrFzKvogfWNuwkZNvLjSFEKjEbnhoBNL0AIAY=;
        b=RbUSUHc2RY6Uz8jobA/bgBkJZY02QC8DVkVLhHpG73suArMQ6cKFBnN4VU461rpm4Q
         +dcsC+6Eqf6TQe4E99JHoxw5mjEhTQ9Tn4NjmA5dny0G0H+EYyC26l/wZQ5LjkMYOJD6
         CjEjuVEJfGdxQJeJUrRckzfNtcrpYbH7YTBXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775630785; x=1776235585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0GsLTcrFzKvogfWNuwkZNvLjSFEKjEbnhoBNL0AIAY=;
        b=RnALqZzqfuziL5YycF9ZXtVi+PDvLQdchvYagRcqpkXiIM2GFjtG48UUBTsMZIfF/b
         bra0XphvqSvMoQJ5dMpYjl41YxJfGwT5oUKCUtyGxqCHA7+sG3NXsay+sPchE0Ghp/d4
         z3+5Vchka7w8ckEhxZ004iDReoSDMYe7goIPZy1DnHzNlGX57Lh6Qlqq+Yo1Bf7raHpp
         9Bb65rS8EBOwwoocnqE/ankkGvIUO51AeGJAHI14gdGWbkRezYYSZpknCMpv/Xdaqb41
         xdEH7u91+6BUMveU3fS2jPVINa9EM5WrVYjcRB+ec2RNVTLfQ0YDvpCIaWYBr47LPiJQ
         H9Zg==
X-Gm-Message-State: AOJu0YzWaHUR4s/Nn0EnyqhoPz5OBEDyHwYsrzuMCeddZWh0Raio38Xp
	5R1BRYReAmGsGY78qXBjkQXSgOZHbdV66jrLEYv0bOivgTT/gjK9eUQFPpKpLYJjMAF+aL6nhq0
	mDDk6aVE=
X-Gm-Gg: AeBDieu+Oy6Cc01w4JCiHvWuYfdc09jBqufyPh0lJyLHZRVXAu5QD92t3XJl16l+NNp
	yX992v/Sv6y1mWC35OjGLzF/OdYBlSZaDTKPqMlYb3acJUuel8RORqyINYZPKS++9f7qIzGHLbJ
	cJ32F0CFZyQmx7RQHMjclNSynXa+a0rxNXgxD1p6zkVOrLvMf0DmfqEbQxmYnTb+g8YhBPrwgK0
	cC7aZC2drA1L3UGU5RfYe2+TA5kqtVF94lJQ1UrWTkg3EvYLxFisSKpNnk6M3FM70mCs3sS4gpe
	m471g/Lho1yEWax+hnXLYVf/jRf90Dlo14Z0hgEwIHsNcrmkiaVkvy89rX6owRzBXpb1/EnQBen
	P/d1EDe07S4PBDYHIUeVXisKBG2khVVGx5djPHrXMRb0qiDJw4mnB7goQuxMsfU2zbXcEHPUcOS
	OcqkI8mlwTnUpYC+Kjc8LZBHDmbgPNrhGmpF9ejroRYWFo00NEKCKT
X-Received: by 2002:a05:6000:40dd:b0:43d:71b:204b with SMTP id ffacd0b85a97d-43d292ebf2fmr30916452f8f.39.1775630784646;
        Tue, 07 Apr 2026 23:46:24 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3a70:3593:db41:cfe4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e6224sm56583822f8f.25.2026.04.07.23.46.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 23:46:24 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] selftest/scripts: Update old git protocol references
Date: Wed,  8 Apr 2026 07:46:23 +0100
Message-ID: <20260408064623.1343858-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 06:46:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234812

git protocol accesses to our infrastructure are currently struggling and this
has highlighted a number of places we're making those obsolete access forms.

Update them to use https instead of the git protocol since it is preferred
and more reliable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb | 2 +-
 .../recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded  | 2 +-
 meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb | 2 +-
 .../recipes-test/devtool/devtool-upgrade-test5_git.bb.upgraded  | 2 +-
 meta/lib/oeqa/selftest/cases/devtool.py                         | 2 +-
 meta/lib/oeqa/selftest/cases/externalsrc.py                     | 2 +-
 meta/lib/oeqa/selftest/cases/gitarchivetests.py                 | 2 +-
 meta/lib/oeqa/selftest/cases/sstatetests.py                     | 2 +-
 scripts/yocto_testresults_query.py                              | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
index 66d66e95e29..fdc85243787 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
@@ -11,7 +11,7 @@ SRCREV = "1a3e1343761b30750bed70e0fd688f6d3c7b3717"
 PV = "0.1+git"
 PR = "r2"
 
-SRC_URI = "git://git.yoctoproject.org/dbus-wait;branch=master"
+SRC_URI = "git://git.yoctoproject.org/dbus-wait;branch=master;protocol=https"
 UPSTREAM_CHECK_COMMITS = "1"
 RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
 
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded
index d3256ef5df8..07f7c50c775 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded
@@ -10,7 +10,7 @@ DEPENDS = "dbus"
 SRCREV = "6cc6077a36fe2648a5f993fe7c16c9632f946517"
 PV = "0.1+git"
 
-SRC_URI = "git://git.yoctoproject.org/dbus-wait;branch=master"
+SRC_URI = "git://git.yoctoproject.org/dbus-wait;branch=master;protocol=https"
 UPSTREAM_CHECK_COMMITS = "1"
 RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
 
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb
index 7e8b001a287..036a80e855f 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb
@@ -10,7 +10,7 @@ SRCREV = "132fea6e4dee56b61bcf5721c94e8b2445c6a017"
 PV = "0.1+git"
 PR = "r2"
 
-SRC_URI = "gitsm://git.yoctoproject.org/git-submodule-test;branch=master"
+SRC_URI = "gitsm://git.yoctoproject.org/git-submodule-test;branch=master;protocol=https"
 UPSTREAM_CHECK_COMMITS = "1"
 RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
 
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb.upgraded b/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb.upgraded
index 938c46b0163..a138f19071a 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb.upgraded
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb.upgraded
@@ -9,7 +9,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 SRCREV = "a2885dd7d25380d23627e7544b7bbb55014b16ee"
 PV = "0.1+git"
 
-SRC_URI = "gitsm://git.yoctoproject.org/git-submodule-test;branch=master"
+SRC_URI = "gitsm://git.yoctoproject.org/git-submodule-test;branch=master;protocol=https"
 UPSTREAM_CHECK_COMMITS = "1"
 RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
 
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 5f25c4803b3..847b2f30d9c 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -587,7 +587,7 @@ class DevtoolAddTests(DevtoolBase):
     def test_devtool_add_fetch_git(self):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
-        url = 'gitsm://git.yoctoproject.org/mraa'
+        url = 'gitsm://git.yoctoproject.org/mraa;protocol=https'
         url_branch = '%s;branch=master' % url
         checkrev = 'ae127b19a50aa54255e4330ccfdd9a5d058e581d'
         testrecipe = 'mraa'
diff --git a/meta/lib/oeqa/selftest/cases/externalsrc.py b/meta/lib/oeqa/selftest/cases/externalsrc.py
index 1d800dc82ca..c127d254e36 100644
--- a/meta/lib/oeqa/selftest/cases/externalsrc.py
+++ b/meta/lib/oeqa/selftest/cases/externalsrc.py
@@ -17,7 +17,7 @@ class ExternalSrc(OESelftestTestCase):
     #     so we check only that a recipe with externalsrc can be parsed
     def test_externalsrc_srctree_hash_files(self):
         test_recipe = "git-submodule-test"
-        git_url = "git://git.yoctoproject.org/git-submodule-test"
+        git_url = "https://git.yoctoproject.org/git-submodule-test"
         externalsrc_dir = tempfile.TemporaryDirectory(prefix="externalsrc").name
 
         self.write_config(
diff --git a/meta/lib/oeqa/selftest/cases/gitarchivetests.py b/meta/lib/oeqa/selftest/cases/gitarchivetests.py
index dcf0eb3be56..454f4bd4683 100644
--- a/meta/lib/oeqa/selftest/cases/gitarchivetests.py
+++ b/meta/lib/oeqa/selftest/cases/gitarchivetests.py
@@ -105,7 +105,7 @@ class GitArchiveTests(OESelftestTestCase):
         delete_fake_repository(path)
 
     def test_get_tags_without_valid_remote(self):
-        url = 'git://git.yoctoproject.org/poky'
+        url = 'https://git.yoctoproject.org/poky'
         path, git_obj = create_fake_repository(False, None, False)
 
         tags = ga.get_tags(git_obj, self.log, pattern="yocto-*", url=url)
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 44dd674a325..687640a4016 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -221,7 +221,7 @@ class SStateTests(SStateBase):
         # Use dbus-wait as a local git repo we can add a commit between two builds in
         pn = 'dbus-wait'
         srcrev = '6cc6077a36fe2648a5f993fe7c16c9632f946517'
-        url = 'git://git.yoctoproject.org/dbus-wait'
+        url = 'https://git.yoctoproject.org/dbus-wait'
         result = runCmd('git clone %s noname' % url, cwd=tempdir)
         srcdir = os.path.join(tempdir, 'noname')
         result = runCmd('git reset --hard %s' % srcrev, cwd=srcdir)
diff --git a/scripts/yocto_testresults_query.py b/scripts/yocto_testresults_query.py
index 521ead8473a..08bd8cbff17 100755
--- a/scripts/yocto_testresults_query.py
+++ b/scripts/yocto_testresults_query.py
@@ -21,7 +21,7 @@ script_path = os.path.dirname(os.path.realpath(__file__))
 poky_path = os.path.abspath(os.path.join(script_path, ".."))
 resulttool = os.path.abspath(os.path.join(script_path, "resulttool"))
 logger = scriptutils.logger_create(sys.argv[0])
-testresults_default_url="git://git.yoctoproject.org/yocto-testresults"
+testresults_default_url="https://git.yoctoproject.org/yocto-testresults"
 
 def create_workdir():
     workdir = tempfile.mkdtemp(prefix='yocto-testresults-query.')

