Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D2F7F31E59
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 16:00:08 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.135826.1775750399688436924
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 09:00:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=J2632awi;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-488aa77a06eso16972235e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 08:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775750398; x=1776355198; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DVlFTt23UZW7nMuKmtGRGfHeZMVOI9dd39Hy0hpyIQ=;
        b=J2632awi6oUOmyNKbCie5TCc8XLMzv2gcwDfnXCGDsPDfn5kZyAtovfCNHT8v/YstU
         X2AO0W6z/AnfjvNDSLE/wkpp+ZJH/8ZU1NdZEQqnFxKtw/wMzeQikys7NtslzU3/y/+K
         tZo7zUZz9Fhjzc+eUEgD8k9B2PMPEd0K4AF3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775750398; x=1776355198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0DVlFTt23UZW7nMuKmtGRGfHeZMVOI9dd39Hy0hpyIQ=;
        b=shwFqnAXNyssWcGEeZo+cZDStDurrZBaKZ51xSPxYiLUzQdSiVGRw2EkEiTexwLK9B
         SZYa1PuN/L7JT1mlI0164GAXG6bz35H6Fx+d7Krc0FBEB3997BPRsAGZFq3RrnqFDXcu
         L+BDjpu81MxlvCvL/0FKo1vsquprEvaUtLsHKoS0xLKqj1lr5SMM5OuZvI/Qx96LEXM6
         Wf1oMh8c6KJTFNQTwhxNOKF1StWKThLFRg4+erJRWZwb1NaWR8Fh9be0Dsau+SW7dTvO
         zVOafUzZdGLTT7b54l/z/TSchxPXFkAs7QGC2g0YVkqvfjVvb6Ye47zSO6vojWec+CLZ
         BTqA==
X-Gm-Message-State: AOJu0YzgwM/0yCRHG+HrZeTra5Esk43ArJE25lgGK3zmZEvU3bNl6TiV
	JAbMUXDSOGdNTua+i1mjSfqTTsUCa8vUMgiIyBB3ngendgPuDNXwzZz059w0q6CQ7aaBr02XrsT
	d9+K2RjgfYO1p
X-Gm-Gg: AeBDiet3WHWXqRXDb0TlxUxStO6wmT5wnul3nRJd2FbfvB48jJfKJymP3DWS9mrRd5m
	kvHfCwoXm3f6rp6XeYUk/jsoV7VgDQZjxq7KcucHD8pW0ueaX7Y6yw+uv+EgrMrRBatAkGRr+EK
	aovLuNR8h1dCUUganqzjo+suOlwXuJRW8SBQ4TmBNejEYMyFipBhk5XPwul6Rko1jEi91J0PTZr
	TusWK3ccfsenHqz/tjYCTPzu9dKHIrmwT1oFc8Bmffun7y/gyOKzhj+iGJeOPhK7YXdwvQ9t9xD
	K++V6rD3SY0JhHNw9SS7S/F57Zn8TOsxj1TrTrUrWIPpKtgG39RX5tH+32QeMg9V/OWrZk11OuD
	D3Po/ghw3jmROvh98SvbzuEsCjfVmPOvUd58RzRIl9He9cxkS16KwXADPpgZLE8KQAfedY5HadS
	b2bWyag1oFQO7QDcxBoUgs4t97XY3o67KbK9Pp9k7j7WF8n71fyVDMvk8qXBxeCm6BQYnE9yFPV
	HDFol9HYXbqi3EOwM+tElpGSkTm
X-Received: by 2002:a05:6000:611:b0:439:b4dc:1e1e with SMTP id ffacd0b85a97d-43d292c75a2mr39289613f8f.29.1775750397754;
        Thu, 09 Apr 2026 08:59:57 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa003cc57ca6ff0f11d4.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:3cc5:7ca6:ff0f:11d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f13sm69149364f8f.3.2026.04.09.08.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 08:59:57 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-core ML <openembedded-core@lists.openembedded.org>
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 5/5] selftest/scripts: Update old git protocol references
Date: Thu,  9 Apr 2026 17:59:35 +0200
Message-ID: <20260409155935.2245789-5-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409155935.2245789-1-yoann.congal@smile.fr>
References: <20260409155935.2245789-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234931

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
 meta/lib/oeqa/selftest/cases/sstatetests.py                   | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
index 203f4b61c2e..bc3690a8e3d 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
@@ -11,7 +11,7 @@ SRCREV = "1a3e1343761b30750bed70e0fd688f6d3c7b3717"
 PV = "0.1+git${SRCPV}"
 PR = "r2"
 
-SRC_URI = "git://git.yoctoproject.org/dbus-wait;branch=master"
+SRC_URI = "git://git.yoctoproject.org/dbus-wait;branch=master;protocol=https"
 UPSTREAM_CHECK_COMMITS = "1"
 RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
 
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded
index 3d45fc48572..c0eda290892 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded
@@ -10,7 +10,7 @@ DEPENDS = "dbus"
 SRCREV = "6cc6077a36fe2648a5f993fe7c16c9632f946517"
 PV = "0.1+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/dbus-wait;branch=master"
+SRC_URI = "git://git.yoctoproject.org/dbus-wait;branch=master;protocol=https"
 UPSTREAM_CHECK_COMMITS = "1"
 RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
 
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index dc0fc35062e..16660d46e2e 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -517,7 +517,7 @@ class DevtoolAddTests(DevtoolBase):
     def test_devtool_add_fetch_git(self):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
-        url = 'gitsm://git.yoctoproject.org/mraa'
+        url = 'gitsm://git.yoctoproject.org/mraa;protocol=https'
         url_branch = '%s;branch=master' % url
         checkrev = 'ae127b19a50aa54255e4330ccfdd9a5d058e581d'
         testrecipe = 'mraa'
@@ -526,7 +526,7 @@ class DevtoolAddTests(DevtoolBase):
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
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 4a32af902fb..831991dee8f 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -31,7 +31,7 @@ class SStateTests(SStateBase):
         # Use dbus-wait as a local git repo we can add a commit between two builds in
         pn = 'dbus-wait'
         srcrev = '6cc6077a36fe2648a5f993fe7c16c9632f946517'
-        url = 'git://git.yoctoproject.org/dbus-wait'
+        url = 'https://git.yoctoproject.org/dbus-wait'
         result = runCmd('git clone %s noname' % url, cwd=tempdir)
         srcdir = os.path.join(tempdir, 'noname')
         result = runCmd('git reset --hard %s' % srcrev, cwd=srcdir)

