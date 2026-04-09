Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D414CF36B8F
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 23:11:41 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.144843.1775776299198618181
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 16:11:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SONgqdwB;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-48896199cbaso14892355e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775776297; x=1776381097; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0DVlFTt23UZW7nMuKmtGRGfHeZMVOI9dd39Hy0hpyIQ=;
        b=SONgqdwBh2bdE4H9oyzqtjp1iOGoKhMPsQQp37lwbfYN5fzcQjl9/aGIi30pHGLAFy
         w/FERjMSQL0rXaw928kpt1ZqFxlViUp2S5MF9gNzrrWk23hAZ6XEd1O3iyB4+2FE9FjC
         WCuYVy7HkOtjlnbziV7eGLPgW3Cc3de8+j94Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775776297; x=1776381097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0DVlFTt23UZW7nMuKmtGRGfHeZMVOI9dd39Hy0hpyIQ=;
        b=m1kyO9zbp7I4gE61lZbJQDDaGhMXF8GQIpDTgvRvqSWRUCY84hkM7VfAQ3yynJHWX4
         6a6e8ZaeUePyx52kQaKOKge5V84mEtsZ8Nd469KRpCfbvQPcJ5I5eQjqGLlvIulBhv/e
         E0RiNbuWegc2OLvyds9vCvoNtLsprXkqJfXBpc7M+2OAEed2LlvUK52DQb3g+pnKheTY
         EvS+j7XI1Ov5R2STEx+M32NkQbhx7yDiwB7GGuKETcZtlJzsdyd+Pu3kWznxh7Ot+NOb
         yQUYjTMV28fnm/jt0Zp5xtoDT9/HmAHjFz3B/GcKbzA1PDiFwfsra2gRNI7kasSqoTz4
         IbXg==
X-Gm-Message-State: AOJu0YyXvta1I2//uMDhv0Em0CS6f/AmK+EZhMfj3Hobi2n9KdKigbPE
	RfcEFgZCLt2TS2z8kERLd1BhpXn0hjYGVUYKwpZIhct2REVChpmxAcIV+2N+qIZVe7IybyYrefQ
	cE1h1nsG1lEwe
X-Gm-Gg: AeBDieuMR4jXAiJqi1tLMxfciRi12Qw0Yfnwc4AAR8D1//dTJINwJCv751JNwGjeJ69
	DkOiSZhFbbl0fVkG/2W9sINLx0lcEPykn3gB6EU8aT70Oatm4/XSvaEbukCOmAudz+VIU8M1lM6
	24mTOYWiThVxkx3EztZ9I8S6IGGfnSLVYN8GgaRfCZf8A6khsbzHKc46ci1ktZnutbIiu0D4yEo
	1AopLgull5amWEkLbggtzWT5ror0V+RN/HlYxyzdVkaSMtCir07WGKXUONNCUYuM2K8rWnf+mVC
	kWgYweRS8D0jA70WzBIPDbma/SrPu2ZccT2d9UhcPMcFG/BWONaO97pDB6EV2JGQMhKSHH5UF8a
	ZFQENdEd1Kl8B7EDb+8Qb/f3C14iOdjDoM03JrLdZcEeWh/37KIRcFzedIdJ0WLQOAU+bN5t/uY
	VLRClCdoqWX2P3yV3FcAYs1SaNHUh8ixOc7bLOuiZgtLaijnUfqQHmu0A/Ic64zRDLi6g+vjXWY
	ku8K0Fhk2SnEzkGmjxm44hfERsX
X-Received: by 2002:a05:600c:198c:b0:485:3fd1:9936 with SMTP id 5b1f17b1804b1-488d67b8d43mr7544405e9.5.1775776297286;
        Thu, 09 Apr 2026 16:11:37 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00af4acfc73fc9518a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:af4a:cfc7:3fc9:518a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67e685csm7708855e9.6.2026.04.09.16.11.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 16:11:36 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v4 24/30] selftest/scripts: Update old git protocol references
Date: Fri, 10 Apr 2026 01:10:24 +0200
Message-ID: <f40351639cc9b94afc590b73b57c2764a4429f4f.1775775155.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775775154.git.yoann.congal@smile.fr>
References: <cover.1775775154.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 23:11:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234983

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

