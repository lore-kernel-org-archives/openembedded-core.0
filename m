Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF7CF8809C
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:53 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7730.1776322122940233739
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0ZDhIZvG;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so101084625e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322121; x=1776926921; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQ+oTPOH9/tKMRLEMfTumVffv5c6sMHBTGnRX0018Kk=;
        b=0ZDhIZvGM+RWRh80lsvqTKEib46s+Brn16qHTlAddJ39Duf9KVe9ocCcC1rKRqA0+G
         M/tl0fvxhzH0A5haVVpGLmMFUB/IzaP570NvZRuRgLUhMFM7vm/mmr4NeKunpPP3rDsO
         ThwUTQLT45DDoNdJze6DXzBfQ3ItGSL1uFe1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322121; x=1776926921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qQ+oTPOH9/tKMRLEMfTumVffv5c6sMHBTGnRX0018Kk=;
        b=eLXpVm1bS0paN6kqBMZXsdegZikeOquM22k5TFPH/I/ovCEjAu0RfsGl2wjARax5vz
         uk/hn+h0ovmtqPCr+905I65JhrhVpc7ojJ6RH2xVq+2uOT+Y6c5dDq1j8LunpU/wP/UN
         9dQNqjvDMr6OaZmch4Ml2RJsegmfAB58zXGN/S7M7m01Wn9ijOHIfRla8PaJ08MCGtpu
         LtUFA9UkX71aKU1a5pqpGesiExiKPO6mWVY+EXOPl+Lq96Y+HMdVS8l0rbfB/cnvqoKH
         BKFgsqX3scNXtB4Zn4uwgEwPy22tLjkn4QTv7kIYVS4E4jnRex1TttevJTNszx66BkiN
         BBnw==
X-Gm-Message-State: AOJu0Yz3B2k9ZV3f/NaHqh/Oq1a/XdGRTvw3QgDdcjGKLRtCPFP/JAH5
	1l/0L0tkBIMOS/CZ1Z6idoyeprQ4K6qzt1fNAGsPVWRLx7HMzR+EvSafmalCcdTE/DX8WnMKhxH
	Sr6U1G1s0wRyB
X-Gm-Gg: AeBDietMUYKq1CeZLL+RX6b1CgfgStIYNpTO83T7+RxmXa5YXGnYV86nOpPfsIdhu4a
	SrKvSPj2gPm5qyhVq4Ad86Op6yDKNf6ISLXPbUW2venlBi9F//mgWRfqDqvFeTjlpHlvamFcNS1
	rgQ/FmdMCcKfplCJqVzGSOj7NOQkeD8PKjplLUuzq7/VFCvD/dDyfY9axy5S4TmyYWjGoIEW79w
	9zBfZTog+s66yFoIhDXUrqFwtUsmXLlxmatvkFmpyJiVfwHJsE9zsjhyjwV/r9oIMIu1mF/NXc0
	MkNzgydXSb3ud/tUohY2fKZKCrTVKxxwbBFILKfqy0jlOdMdKG6sLGDSnzxXF48eJnQlWTedWmf
	xk6wQYST6Sclsl8OAl6zecpDkyoO84iNlWg0bCWG78CtywLFGrwhZWCKmFM83DXBknOziRdyCYH
	Cu0AKfjxLaD4BqudR2CuyMI7X5jg2dfftD3YOSJGeR/4a9Cmcy1KzJ6N2Nszdaal66WXJmKtffP
	QhlzUGG4yP26tE3e7s599g9bkvg2Y35IXHsWw==
X-Received: by 2002:a05:600c:64cd:b0:487:21c7:2885 with SMTP id 5b1f17b1804b1-488d67df57dmr342808645e9.5.1776322120867;
        Wed, 15 Apr 2026 23:48:40 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:40 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 34/47] selftest/scripts: Update old git protocol references
Date: Thu, 16 Apr 2026 08:47:35 +0200
Message-ID: <4825bf044255dfff2d2ce5b288aff006ec5dd584.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235376

From: Richard Purdie <richard.purdie@linuxfoundation.org>

git protocol accesses to our infrastructure are currently struggling and this
has highlighted a number of places we're making those obsolete access forms.

Update them to use https instead of the git protocol since it is preferred
and more reliable.

The devtool test needed quoting to handle the ';' in the url. The -f option
to devtool also shows a deprecation warning so remove that.

There were internal references to git protocol urls inside the nested git
submodules test report, which means those repos need updating to use
new git revisions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1ceba42623c5187d2f5a100d6a523abcdc75d34e)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../recipes-test/devtool/devtool-upgrade-test2_git.bb       | 2 +-
 .../devtool/devtool-upgrade-test2_git.bb.upgraded           | 2 +-
 .../recipes-test/devtool/devtool-upgrade-test5_git.bb       | 4 ++--
 .../devtool/devtool-upgrade-test5_git.bb.upgraded           | 4 ++--
 meta/lib/oeqa/selftest/cases/devtool.py                     | 6 +++---
 meta/lib/oeqa/selftest/cases/externalsrc.py                 | 2 +-
 meta/lib/oeqa/selftest/cases/gitarchivetests.py             | 2 +-
 meta/lib/oeqa/selftest/cases/sstatetests.py                 | 2 +-
 meta/lib/oeqa/selftest/cases/yoctotestresultsquerytests.py  | 2 +-
 scripts/yocto_testresults_query.py                          | 2 +-
 10 files changed, 14 insertions(+), 14 deletions(-)

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
index 7e8b001a287..f2a1358c8aa 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb
@@ -6,11 +6,11 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 INHIBIT_DEFAULT_DEPS = "1"
 
 # Note: this is intentionally not the latest version in the original .bb
-SRCREV = "132fea6e4dee56b61bcf5721c94e8b2445c6a017"
+SRCREV = "f280847494763cdcf71197557a81ba7d8a6bce42"
 PV = "0.1+git"
 PR = "r2"
 
-SRC_URI = "gitsm://git.yoctoproject.org/git-submodule-test;branch=master"
+SRC_URI = "gitsm://git.yoctoproject.org/git-submodule-test;branch=master;protocol=https"
 UPSTREAM_CHECK_COMMITS = "1"
 RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
 
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb.upgraded b/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb.upgraded
index 938c46b0163..aa0d72f0ed1 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb.upgraded
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb.upgraded
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 INHIBIT_DEFAULT_DEPS = "1"
 
 # Note: this is intentionally not the latest version in the original .bb
-SRCREV = "a2885dd7d25380d23627e7544b7bbb55014b16ee"
+SRCREV = "0a60d6af95d22b4c50446559cd41942a8acd2d57"
 PV = "0.1+git"
 
-SRC_URI = "gitsm://git.yoctoproject.org/git-submodule-test;branch=master"
+SRC_URI = "gitsm://git.yoctoproject.org/git-submodule-test;branch=master;protocol=https"
 UPSTREAM_CHECK_COMMITS = "1"
 RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
 
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index c7bd1831a9c..73a79b21041 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -584,7 +584,7 @@ class DevtoolAddTests(DevtoolBase):
     def test_devtool_add_fetch_git(self):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
-        url = 'gitsm://git.yoctoproject.org/mraa'
+        url = 'gitsm://git.yoctoproject.org/mraa;protocol=https'
         url_branch = '%s;branch=master' % url
         checkrev = 'ae127b19a50aa54255e4330ccfdd9a5d058e581d'
         testrecipe = 'mraa'
@@ -593,7 +593,7 @@ class DevtoolAddTests(DevtoolBase):
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake -c cleansstate %s' % testrecipe)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
-        result = runCmd('devtool add %s %s -a -f %s' % (testrecipe, srcdir, url))
+        result = runCmd('devtool add %s %s -a "%s"' % (testrecipe, srcdir, url))
         self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created: %s' % result.output)
         self.assertTrue(os.path.isfile(os.path.join(srcdir, 'imraa', 'imraa.c')), 'Unable to find imraa/imraa.c in source directory')
         # Test devtool status
@@ -1996,7 +1996,7 @@ class DevtoolUpgradeTests(DevtoolBase):
         self._test_devtool_upgrade_git_by_recipe('devtool-upgrade-test2', '6cc6077a36fe2648a5f993fe7c16c9632f946517')
 
     def test_devtool_upgrade_gitsm(self):
-        self._test_devtool_upgrade_git_by_recipe('devtool-upgrade-test5', 'a2885dd7d25380d23627e7544b7bbb55014b16ee')
+        self._test_devtool_upgrade_git_by_recipe('devtool-upgrade-test5', '0a60d6af95d22b4c50446559cd41942a8acd2d57')
 
     def test_devtool_upgrade_drop_md5sum(self):
         # Check preconditions
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
diff --git a/meta/lib/oeqa/selftest/cases/yoctotestresultsquerytests.py b/meta/lib/oeqa/selftest/cases/yoctotestresultsquerytests.py
index b1015d60efe..be062cf7839 100644
--- a/meta/lib/oeqa/selftest/cases/yoctotestresultsquerytests.py
+++ b/meta/lib/oeqa/selftest/cases/yoctotestresultsquerytests.py
@@ -36,4 +36,4 @@ class TestResultsQueryTests(OESelftestTestCase):
             shutil.rmtree(workdir, ignore_errors=True)
             self.fail(f"Can not execute git commands in {workdir}")
         shutil.rmtree(workdir)
-        self.assertEqual(url, "git://git.yoctoproject.org/yocto-testresults")
+        self.assertEqual(url, "https://git.yoctoproject.org/yocto-testresults")
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

