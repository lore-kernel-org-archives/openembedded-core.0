Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0859BC5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 21:57:31 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.2004.1709071041295234460
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 13:57:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=p46Cu7CK;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6e55bb75c9eso242854b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 13:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709071040; x=1709675840; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NOVProOe8ziag0m+VOO0i/wYkSwjiqazMEVbiKxKklQ=;
        b=p46Cu7CKXy32hKJ2rs4hkT930SWWvPk4WYqIcUES2Gyt6LeBWTCTYEsJEHC4Qk/LVb
         89aaBgR5albILOgGfStS94x8LoqT3HteEQMN9oiKyE1ksKrSt5dqIiYi61loTolS9Il2
         1r+2zNthomBCM9ROg0oem6sHu1QY9Ecy44yXWlHntVn7InAKe3IIXgpGJtKuWpALsrpX
         MA5HOAGzbSzHGGGTVn4IGzhR9++gwp+Lc3x0EQdS8ffWwChdPvk7tF3jyHiEWBnHThd8
         bd4htmfxubjW4GAn05C8/X/MlhUTd5EqE0NA6Oj1FtjZdjiw+I2vgAdKNU3oKdkIsnTw
         Hk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071040; x=1709675840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NOVProOe8ziag0m+VOO0i/wYkSwjiqazMEVbiKxKklQ=;
        b=C2d596qXie6z3pOm7zVTRGdCtyf1LPcyi+S3xSSE50xQat0zipWXHuoR3P3pqA0wra
         48B8GeX3wNDRhDX4v2vdMLCE1UOcbnNapA2e+8idtgkg6fquJXupxXGG6d97WvpHy16a
         s0Ya8RLTDtGP13Q1ahhoz1awDRzO4771XWX3bEZHUtIVkmQytZd0SHELRxPjtYf/wwMC
         hSIxr+1ZEENLhFqtSFV3qAlJ36XM1FYQUXE3/caO/+grgyDLZ1sLreh+4eumF0aaGABF
         mHWj/h6j3Era0JOgBZSdQGdf8EM35lI8rbARNO4F61x9fefQ9cbP9s7eZCj+WxeoS6te
         CrCQ==
X-Gm-Message-State: AOJu0YyrP0DAw6n61B1nl0QFjuyVxM/ZWJgPvyhP/Hn+GjaFLskdNoy1
	l/oi7wstakT66CholRwB72WCjp4ApOvqIps1Fs4bWxlBmmKiKi1oS9fofjbVJKrtOO/QqLiBn5G
	bDVo=
X-Google-Smtp-Source: AGHT+IHB1eVQxRQC1vRW9/b1ky2QgOKVr7Qff5BPUaMNys+XVuovnShpkjDQ54PKxTO2h3+fGASHwQ==
X-Received: by 2002:a05:6a00:23d1:b0:6e4:f303:5d86 with SMTP id g17-20020a056a0023d100b006e4f3035d86mr11336165pfc.11.1709071040553;
        Tue, 27 Feb 2024 13:57:20 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n7-20020aa78a47000000b006e50bbf4e71sm4936428pfa.9.2024.02.27.13.57.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 13:57:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/16] oeqa/selftest/recipetool: downgrade meson version to not use pyproject.toml
Date: Tue, 27 Feb 2024 11:56:54 -1000
Message-Id: <24bf7bbd1fb21f84539b7a4263d76a33dbacacde.1709070850.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709070850.git.steve@sakoman.com>
References: <cover.1709070850.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 21:57:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196306

From: Ross Burton <ross.burton@arm.com>

recipetool's pyproject.toml parsing needs tomllib (python 3.11+) or
tomli (not a hard dependency), so is prone to failing depending on the
host configuration.

Downgrade the Meson release used for the checks to 0.52.1, which was the
last release before moving to pyproject.toml.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Backported from master: 6dfe573d83687e5431841f062442b54b9fa22ff3

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 29 ++++++++++++----------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index db21325155..c888770533 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -440,17 +440,19 @@ class RecipetoolCreateTests(RecipetoolBase):
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
     def test_recipetool_create_github(self):
-        # Basic test to see if github URL mangling works
+        # Basic test to see if github URL mangling works. Deliberately use an
+        # older release of Meson at present so we don't need a toml parser.
         temprecipe = os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
-        recipefile = os.path.join(temprecipe, 'meson_git.bb')
-        srcuri = 'https://github.com/mesonbuild/meson;rev=1.3.1'
-        result = runCmd(['recipetool', 'create', '-o', temprecipe, srcuri])
-        self.assertTrue(os.path.isfile(recipefile))
+        recipefile = os.path.join(temprecipe, 'python3-meson_git.bb')
+        srcuri = 'https://github.com/mesonbuild/meson;rev=0.52.1'
+        cmd = ['recipetool', 'create', '-o', temprecipe, srcuri]
+        result = runCmd(cmd)
+        self.assertTrue(os.path.isfile(recipefile), msg="recipe %s not created for command %s, output %s" % (recipefile, " ".join(cmd), result.output))
         checkvars = {}
-        checkvars['LICENSE'] = set(['Apache-2.0', 'Proprietary', 'Unknown'])
-        checkvars['SRC_URI'] = 'git://github.com/mesonbuild/meson;protocol=https;branch=1.3'
-        inherits = ['python_setuptools_build_meta']
+        checkvars['LICENSE'] = set(['Apache-2.0', "Unknown"])
+        checkvars['SRC_URI'] = 'git://github.com/mesonbuild/meson;protocol=https;branch=0.52'
+        inherits = ['setuptools3']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
     def test_recipetool_create_python3_setuptools(self):
@@ -473,18 +475,19 @@ class RecipetoolCreateTests(RecipetoolBase):
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
     def test_recipetool_create_github_tarball(self):
-        # Basic test to ensure github URL mangling doesn't apply to release tarballs
+        # Basic test to ensure github URL mangling doesn't apply to release tarballs.
+        # Deliberately use an older release of Meson at present so we don't need a toml parser.
         temprecipe = os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
-        pv = '1.3.1'
-        recipefile = os.path.join(temprecipe, 'meson_%s.bb' % pv)
+        pv = '0.52.1'
+        recipefile = os.path.join(temprecipe, 'python3-meson_%s.bb' % pv)
         srcuri = 'https://github.com/mesonbuild/meson/releases/download/%s/meson-%s.tar.gz' % (pv, pv)
         result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
-        checkvars['LICENSE'] = set(['Apache-2.0', 'Proprietary', 'Unknown'])
+        checkvars['LICENSE'] = set(['Apache-2.0'])
         checkvars['SRC_URI'] = 'https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${PV}.tar.gz'
-        inherits = ['python_setuptools_build_meta']
+        inherits = ['setuptools3']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
     def _test_recipetool_create_git(self, srcuri, branch=None):
-- 
2.34.1


