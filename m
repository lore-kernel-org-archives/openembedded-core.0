Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C96C4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 08:29:05 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.13378.1707380940388178187
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 00:29:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=axS931K4;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-41008ab427fso14124085e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 00:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707380938; x=1707985738; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oe9Z2U9DcvcflSlZeeEhTxcjSjvzGiiNoR1nokMzKrI=;
        b=axS931K4Dx0rmeNta9qRhq+CKFiOYAwd4OI6h4EvPmLOMUvxzz8Dt7FBjeDm6Q87KC
         7fE4kYoHhNEcevRkbVV8Bh8jJGZL16QlVlkkhkWmKDKXZo6nJkNTwiU9hNqAxIDyt417
         BGW+2ehH6iBjaKHl7droHo+Eq5h8Gq9SPaYA/IY85m/CRB7gkozWhnJUD3yWdAgzGk/A
         VTIDAwXOmyqorJBOFoC6fQ2sL2sxK+l49kcypzppa3aA/XhqAKJZHfYtmXJMdAdGswcW
         1wnp9M7kqHYgW3ysYMcJC9D2/St92o2bjiof4qYfjHs3tkhGPNVCSwcEIlXkHh3aD1tP
         9eyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707380938; x=1707985738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oe9Z2U9DcvcflSlZeeEhTxcjSjvzGiiNoR1nokMzKrI=;
        b=CJOaub87D438eaHpR51fyEF1cjwD8CzYVzvBT6WSXYS31Tc8IxDQIrGPndh8UvU2uS
         Faquu5i8Bhab9EbgPtWeQuCwJ3vclqpl/3OlShANnNMyF8y1U5lnrL0Vvl1UZj2X38eT
         1krpR85cPKdrUaNWBo6esAz5GMVsbINTBce/b0hEEHhPF6340wKERm86E6eFMuNl6DCZ
         Fqvn3aGQzCVfegRcvBa3mzE8V8FEL5YUrr0yrSmTc2g8lamyBs2xr8WdOygHDFYQRkqo
         LCiNaGPzrLILnHEgaNiP99h3nJ78HkOJ8eMwKdbROMjVkcBTBHrKcymSE/JVSQKNDJNB
         flWw==
X-Gm-Message-State: AOJu0YzcCnCZFpiRgefsswc7jXBnV9B5fxUBW1Uyi+g7UU1vXkJC5OJk
	rvsek8xLsUXeFfq4YS+XJxKNJiX5K84xmpmA/QLPS8qDJ0bW5PqKakZyuLv2
X-Google-Smtp-Source: AGHT+IHGKvaEsxdBmWgnl82UwZHGYLfArcQybiZMk6jCJT5JX1ozKDYgHCtt31fpnGf+Hc6gX7hOJQ==
X-Received: by 2002:a05:600c:3581:b0:40f:de6a:2a27 with SMTP id p1-20020a05600c358100b0040fde6a2a27mr5730648wmq.40.1707380938422;
        Thu, 08 Feb 2024 00:28:58 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id j12-20020a05600c190c00b0040ebf603a89sm913321wmq.11.2024.02.08.00.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 00:28:58 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 6/7] oeqa/selftest/recipetool: fix for python 3.12
Date: Thu,  8 Feb 2024 09:27:32 +0100
Message-ID: <20240208082821.430510-7-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240208082821.430510-1-adrian.freihofer@siemens.com>
References: <20240208082821.430510-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 08:29:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195111

test_recipetool_create_github and test_recipetool_create_github_tarball
fail because the old meson version used by these tests cases does not
run on Python 3.12. The issue is in the dependencies.py which comes with
meson:
ERROR: build/tmp/work/recipetool-3z4osyl7/source/git/mesonbuild/
       dependencies.py:777: SyntaxWarning: invalid escape sequence '\.'

Use meson 1.3.1 (what is currently also used on master) as a reference
for these tests.

With this version of meson, recipetool creates recipes named
meson_git.bb or meson_1.3.1.bb. Since this looks more reasonable than
e.g. python3-meson_git.bb the test gets adapted.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 0c296875b23..39114c67622 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -444,14 +444,14 @@ class RecipetoolCreateTests(RecipetoolBase):
         # Basic test to see if github URL mangling works
         temprecipe = os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
-        recipefile = os.path.join(temprecipe, 'python3-meson_git.bb')
-        srcuri = 'https://github.com/mesonbuild/meson;rev=0.32.0'
+        recipefile = os.path.join(temprecipe, 'meson_git.bb')
+        srcuri = 'https://github.com/mesonbuild/meson;rev=1.3.1'
         result = runCmd(['recipetool', 'create', '-o', temprecipe, srcuri])
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
-        checkvars['LICENSE'] = set(['Apache-2.0'])
-        checkvars['SRC_URI'] = 'git://github.com/mesonbuild/meson;protocol=https;branch=master'
-        inherits = ['setuptools3']
+        checkvars['LICENSE'] = set(['Apache-2.0', 'Proprietary', 'Unknown'])
+        checkvars['SRC_URI'] = 'git://github.com/mesonbuild/meson;protocol=https;branch=1.3'
+        inherits = ['python_setuptools_build_meta']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
     def test_recipetool_create_python3_setuptools(self):
@@ -703,15 +703,15 @@ class RecipetoolCreateTests(RecipetoolBase):
         # Basic test to ensure github URL mangling doesn't apply to release tarballs
         temprecipe = os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
-        pv = '0.32.0'
-        recipefile = os.path.join(temprecipe, 'python3-meson_%s.bb' % pv)
+        pv = '1.3.1'
+        recipefile = os.path.join(temprecipe, 'meson_%s.bb' % pv)
         srcuri = 'https://github.com/mesonbuild/meson/releases/download/%s/meson-%s.tar.gz' % (pv, pv)
         result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
-        checkvars['LICENSE'] = set(['Apache-2.0'])
+        checkvars['LICENSE'] = set(['Apache-2.0', 'Proprietary', 'Unknown'])
         checkvars['SRC_URI'] = 'https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${PV}.tar.gz'
-        inherits = ['setuptools3']
+        inherits = ['python_setuptools_build_meta']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
     def _test_recipetool_create_git(self, srcuri, branch=None):
-- 
2.43.0


