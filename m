Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CFF5FF8840
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:13 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31990.1777064226534276089
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:57:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DBwah6Zb;
 spf=pass (domain: smile.fr, ip: 209.85.221.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-43d70c30767so5360909f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064225; x=1777669025; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ziQJdy99awmPSoVob75/YcYe1zrcf8vp31dZXDYpVz0=;
        b=DBwah6ZbIL0VRrDjVWvU7VS+sbDCXwqnrrKotvjMakZ3bOx5a4oLZ/LVX/49MXBU6h
         wONgLpTTm+KMTn3luXaGqCoUjR4lIjybapXiDloGZAuisvOUcguXKZrod2dlBL2Q3DTL
         hMiWm+LM6/5lejBgEI1JiSOShePSFk62nyFsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064225; x=1777669025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ziQJdy99awmPSoVob75/YcYe1zrcf8vp31dZXDYpVz0=;
        b=g9q8xD1PnuZMVuh2eQ74eS41eGzq7D17x98kAVdM4Ci6l3S9M4mfgopMW3qEAbNRCb
         d9dH36NUTOX7LoFUGLh8Sie8p9GDibGvENbInja9n781JPEQatJye12uc2TD6VlmHxX/
         Wah+k5lng6KhbGJZbv5YPUZcYrZqCx0BxxdkICuEHIUOxLWPvCrk+7agVdPnYs+1P509
         nVAYJLDF1iQbVtILeJ4nQdBBRHG+cgYSxdEK68+S2q+TCXz9h0FN605tUGAM2uGEteME
         cwpjl1ogT2ZtiMfqoI5xSJ49G6Rma7VbUU6UJAqBrkNM35h1VEQt9edv4EIBZcxQl59v
         OBNA==
X-Gm-Message-State: AOJu0YxRrGSUo3XZbMZSkQuHdPX+mIwKZQzY4C1d+w3zsO5/a4rC1h6S
	CwAES0dWtPdxws86cZG70glXBrThvC5NLnG0gUbp8BINc4Zya5jWFltRJTlUKzFgqjEcDqPcFtd
	Kw27yvJwp/7eh
X-Gm-Gg: AeBDiesJ/Al5xi/JD388ab4gdeuYpPbZ58wkxIbn0+miX+7+dtg1kUYBOJWys0s9Iu3
	Yvc1My4DOXxZJsLTVn/oe9efQkbsMb6pM3JqPAQHG5edzsSst6OwbYTcnhryBGSjY02NFZsuAVC
	WCkld1ZyBGm4PRQIfoTvmcefy4iYs9HJ7/89AJ+bwzsyyIN2k9WQi6OWQQA6TAsmCasNXI6dP7a
	HlmLSzTT4murgUcnF5CuqBrh9wUBHA6gLr98NxsPr7bXIx90HP217jwsQkBRWDyNN79KEVXtyL8
	VHtTUV5TUqdBWTv4YMbEsHcuspR31nY5PNcy36wF2Yhvpi2vqDpqb4buOebXIxLxyu4bh/BvhfL
	AAtldHoBFdjhZnz64TqwpfaSZwIaAMYGdqZOzTslYGGYhitV6B9qSPVcd/Ex0Fhz5mWWkPW13Tt
	JbEJgvJSc6jPEWwrDELqbUH4RUACLj4ulkaQTGhUOjSrkosoLEhtzNPs7WD1LxF1RpBmmoh06dW
	iWOFvr+O44g20UZa32Pb+gbpCEiHz3SI37ro4B15BTfA67Z
X-Received: by 2002:a05:600c:a410:b0:48a:5821:6006 with SMTP id 5b1f17b1804b1-48a5821692dmr203162795e9.4.1777064224612;
        Fri, 24 Apr 2026 13:57:04 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.57.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:57:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 47/66] selftest/scripts: Update old git protocol references
Date: Fri, 24 Apr 2026 22:55:46 +0200
Message-ID: <cbb3e323b74d4351c772a9bcd553008c31a220f0.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235920

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
 .../recipes-test/devtool/devtool-upgrade-test2_git.bb         | 2 +-
 .../devtool/devtool-upgrade-test2_git.bb.upgraded             | 2 +-
 meta/lib/oeqa/selftest/cases/devtool.py                       | 4 ++--
 meta/lib/oeqa/selftest/cases/externalsrc.py                   | 2 +-
 meta/lib/oeqa/selftest/cases/gitarchivetests.py               | 2 +-
 meta/lib/oeqa/selftest/cases/sstatetests.py                   | 2 +-
 meta/lib/oeqa/selftest/cases/yoctotestresultsquerytests.py    | 2 +-
 scripts/yocto_testresults_query.py                            | 2 +-
 8 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
index 2558a22ce57..deb3dfb82e3 100644
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
index eaa8bd898da..5e3d510f29b 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded
@@ -10,7 +10,7 @@ DEPENDS = "dbus"
 SRCREV = "6cc6077a36fe2648a5f993fe7c16c9632f946517"
 PV = "0.1+git"
 
-SRC_URI = "git://git.yoctoproject.org/dbus-wait;branch=master"
+SRC_URI = "git://git.yoctoproject.org/dbus-wait;branch=master;protocol=https"
 UPSTREAM_CHECK_COMMITS = "1"
 RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
 
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 55048830bfe..d56696c10dd 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -585,7 +585,7 @@ class DevtoolAddTests(DevtoolBase):
     def test_devtool_add_fetch_git(self):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
-        url = 'gitsm://git.yoctoproject.org/mraa'
+        url = 'gitsm://git.yoctoproject.org/mraa;protocol=https'
         url_branch = '%s;branch=master' % url
         checkrev = 'ae127b19a50aa54255e4330ccfdd9a5d058e581d'
         testrecipe = 'mraa'
@@ -594,7 +594,7 @@ class DevtoolAddTests(DevtoolBase):
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake -c cleansstate %s' % testrecipe)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
-        result = runCmd('devtool add %s %s -a -f %s' % (testrecipe, srcdir, url))
+        result = runCmd('devtool add %s %s -a "%s"' % (testrecipe, srcdir, url))
         self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created: %s' % result.output)
         self.assertTrue(os.path.isfile(os.path.join(srcdir, 'imraa', 'imraa.c')), 'Unable to find imraa/imraa.c in source directory')
         # Test devtool status
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
index 71382089c12..c40adf25818 100644
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
index 4a2c425ac8d..42a481500a4 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -228,7 +228,7 @@ class SStateTests(SStateBase):
         # Use dbus-wait as a local git repo we can add a commit between two builds in
         pn = 'dbus-wait'
         srcrev = '6cc6077a36fe2648a5f993fe7c16c9632f946517'
-        url = 'git://git.yoctoproject.org/dbus-wait'
+        url = 'https://git.yoctoproject.org/dbus-wait'
         result = runCmd('git clone %s noname' % url, cwd=tempdir)
         srcdir = os.path.join(tempdir, 'noname')
         result = runCmd('git reset --hard %s' % srcrev, cwd=srcdir)
diff --git a/meta/lib/oeqa/selftest/cases/yoctotestresultsquerytests.py b/meta/lib/oeqa/selftest/cases/yoctotestresultsquerytests.py
index 312edb64319..05a7f99809e 100644
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

