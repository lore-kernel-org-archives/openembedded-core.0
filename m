Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E33CAEA3C4C
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:43:21 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.129246.1775731396358104080
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T6BZrDlB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488a4bc360bso4000415e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 03:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775731394; x=1776336194; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PflHmPLCma8SHImvlCG8B2JYCdpuTaVX0dVVSGqs1WM=;
        b=T6BZrDlBvMMYI/JhGgXBQSD5X0UAiTbaaN+6tlnpeRFYWLvB0otd/TgfPoWOPN5O+g
         Cy6T4iVJaCMwIDW+34scdkoyfkOfv+sOwKZiGsGIZPysmHeqEKOXsiEtK6Z+03BFc7OR
         MLCyqmYfxAyh6bibaYQNQVgmuyPqu+yP3UfMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775731394; x=1776336194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PflHmPLCma8SHImvlCG8B2JYCdpuTaVX0dVVSGqs1WM=;
        b=IMfwxmPpUVbvrBmtGlnxAEPleoB6nrW+anY8vcV6xdCVt6AcTWRaBxaPFK5N+GYJ64
         ISz0qjJWJth2EdTZJ7Z6LGVAPC41I2ERUIGNJEGyrwIcsId6bNtfI/dnXu0T7inlxJkg
         XIuIm87uV6MXSh31tzAaBHZFPKAN+Dx70bZJfJz6UAEXIs3Q06pDTHsduzMVsJ69qEsQ
         RfLXxME3aZz2p3cTGkYahuBfXwIMdcipsusTx8DXF8s/lmTAGCxJQfEmxd+VVC4D7Wbk
         t6FuHnAQ8fa37HP7+xtxNtttCH5P1v7XTq5KfQJBAi7j9y87/L9dYw+BR5sUjLWlsD+v
         QIdQ==
X-Gm-Message-State: AOJu0YxHPyRG4m1K6jD2skrIzrXwFGQuZVpP+C4gzs9oCW5Uvykld1cE
	1v0e0jwfDVg9hO7Gyd1t8FFHsnJdyS9HAc2E3Rsm2DpZxEYRqynFxEs8S2GtvO8OFtthbYHwjtt
	va8P8mUw=
X-Gm-Gg: AeBDiesJz9/tJ6Weo3jVMT7Jee5GkFFs+MgonFi3HK5BfaRlzvQJ6WvLjX31mvmrSjB
	KosadxXJSI4iG4JoIPyrrZ0S90k5uYDM6UN+1oDqDm+AEcCKBts6pLyvIEKdJB/pTRQL9KqJ5Lx
	OqxunHbZ1W4uKECifGlQWEIuVlcsuiA942fD1kOE8sH5ejWWs079V+oShdDYhj1Hv7nrLopd6QZ
	yfu6EHIfjLNZF2Wc16vk6ENd+VDx9cYm40e4tQTkp+YHL8/w68K4ZS6pDJ2JCvMKVJ9cQ1TGcUj
	nnXpSLPM0rNV1b0IQvJnT6DYhMkovqYkm500bcDegtJ4ewtGH419gVuGSWEv52Xy2uNMNXi97iL
	LGPP+paHasuCDr++QLkhB92JV/Sl4brx1Q9j5IxgHZ2dArUv1mAzV1pOy88ORbtE6llOLd4aHcR
	nSvjZVRcjN9JCgwhuHc2zkZgocj4LSaXEJGBzVxMibCZGtTdeEJ+JV
X-Received: by 2002:a05:600c:1d1d:b0:485:3af5:7e53 with SMTP id 5b1f17b1804b1-48899775e08mr328286065e9.19.1775731393920;
        Thu, 09 Apr 2026 03:43:13 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2817:f37b:c3b2:6465])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cf9e8ab4sm52101795e9.4.2026.04.09.03.43.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 03:43:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] selftest/scripts: Update old git protocol references
Date: Thu,  9 Apr 2026 11:43:11 +0100
Message-ID: <20260409104312.2783949-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 10:43:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234910

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
index 5f25c4803b3..4aafb5a4636 100644
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
@@ -596,7 +596,7 @@ class DevtoolAddTests(DevtoolBase):
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake -c cleansstate %s' % testrecipe)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
-        result = runCmd('devtool add %s %s -a -f %s' % (testrecipe, srcdir, url))
+        result = runCmd('devtool add %s %s -a "%s"' % (testrecipe, srcdir, url))
         self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created: %s' % result.output)
         self.assertTrue(os.path.isfile(os.path.join(srcdir, 'imraa', 'imraa.c')), 'Unable to find imraa/imraa.c in source directory')
         # Test devtool status
@@ -2024,7 +2024,7 @@ class DevtoolUpgradeTests(DevtoolBase):
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

