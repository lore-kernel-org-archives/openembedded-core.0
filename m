Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 144C9F364CA
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 22:08:46 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.144059.1775772515931481056
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 15:08:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NgveG2mX;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488c2690057so14035845e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 15:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775772514; x=1776377314; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DVlFTt23UZW7nMuKmtGRGfHeZMVOI9dd39Hy0hpyIQ=;
        b=NgveG2mX7I3XuVRJ6L1tequjsGMVbNQsj/ifLX4Zm5ecWU678buNDd/fdSE3b60MZY
         f1YEMB8B6XN3UF3oQRVNZegEyMWSTh66Qgo0q3xQuceMFnQkkcs2CpERS5N78dNoLi9u
         W/3kd00il9SUOTpuQPkJ75VXrPwa8GUq6RlLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775772514; x=1776377314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0DVlFTt23UZW7nMuKmtGRGfHeZMVOI9dd39Hy0hpyIQ=;
        b=I5kMa4ik7IPOftcuzFs6NZZHWZKBiFzNIhInBeljGi8/IlD9WqmT3xCEmquCfPOJtI
         eElFYzQBBCgNC0m1DD5CtBSEoX7vt/rgD4i8yd40k0XEjXCj6c5B4p3teGORpURfzdyj
         vovfqlkeri/z55e/bP/E+cX5+sU2ZxyOQHse9fM1VnTTQkchRz9E+K6/GIL9K1Z+p5ym
         +dpcRFZ8sU0I6mxloyIvfJnIuMe7+UXj7yCz+QwdyzorSpHXlyXHdZPhEx9hVVEeuwEo
         i/ywELpiyi6E+zuJRQPpQ9M7pdi4o1rRrH67DFnwd7TN4gFKenZnwWIC+HGNvT0q23sS
         5QkA==
X-Gm-Message-State: AOJu0YwB780M292xF3d54NyJosW3d03LzSI/NvVJZhYW4RFq4lf+I1h5
	0BeATNNNwOgfQ0EoMTlfbhve21KrpEpgDjz796z+JS+FhpbdVbKm200KSNU69K/i6vrkI+OAbRC
	Evy0VbTspkuaQ
X-Gm-Gg: AeBDievOLHw40O3xAJbVDVSW8F3xR8kbO14beq9+DtwY+Xa4yXdm3UQWVxSa4BqdUeI
	DIA2AXfdvIuubuvmymuzl55LH+8tVoskkG7oCoZP7hXu8Ba2UQZQcQ0rabPRuA+5Gz/G/lZJGdr
	JLBM3spD0JQpvLGyBD8o06WPgOya1yuEwo24qrtuITm+0lL89Qgi7WV7oVKqpmvgLNYDdIfRysW
	nL5DOcrdDiMnwRqAj8Zqjl5HREtpURGwTnwKQb9n0B5NS67y4wZnO5DsrQfjOD8+mSg0uSWQmH2
	ZckcSmONgroCN8WSsnmam4MPqLsg9+BPhP4d4cGAxhAQ+4RM6tmhVQbaKDjH2KLb1YZhGiuKx/J
	b7/13oZ4DzhYVjkcFNzsza0LMdQhZZYB1exB6SsIkSPHfCFIjW7ShEPr78KnMKLdlIqnmMAp7cO
	R1XZywPxGekyq+xoZVfQ+1IF+so+ISqR1eVoccIQ9v678YwpgO7bGRz0cI2Tr3W0HSj/deGX/oT
	YYqCngdHFD1Tfkpz7nkhLNKC4w=
X-Received: by 2002:a05:600d:2:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-488d681f36amr4217565e9.8.1775772514089;
        Thu, 09 Apr 2026 15:08:34 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d58bb830sm22123045e9.7.2026.04.09.15.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 15:08:33 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-core ML <openembedded-core@lists.openembedded.org>
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH v2 6/6] selftest/scripts: Update old git protocol references
Date: Fri, 10 Apr 2026 00:08:19 +0200
Message-ID: <20260409220819.2427583-6-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409220819.2427583-1-yoann.congal@smile.fr>
References: <20260409220819.2427583-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 22:08:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234958

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

