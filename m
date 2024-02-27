Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC9DC54E55
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 21:57:20 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.1943.1709071039563514129
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 13:57:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YqSMftgd;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6e46dcd8feaso1731514b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 13:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709071039; x=1709675839; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8NxQipcEdhvhYX9/1TDx27LVifFQLgX/GnCKjILzxLA=;
        b=YqSMftgdwmpYLYpw4M0ldsvE81mlC2ZdtZnrVGmioxkUd1IWr3dS0cLm40hrSgVB32
         P3wO6efmsDq4TwdIU2i2zmOI+8542jWeO/gfN3WL8Vp8unv8sP2BkFKIc0yLjZUskviw
         boKskVx7mzO9txmM1MI/Qrpyf5JLLkIQk4vzDqNuVbchcNJU8MqGbkcyV6wuEsbbJ6QI
         Iq5vzLiAwCt+fBDK7+xF8TxnPKCzqEJ5YzEu/w0JucU7KQRgiDbUnAccSadL81xXau9+
         dAymcFUzAVK/yIqeJq/x7WnZNyurJGXjiXihtNaQtZjJTphRjGXBdGgyr2LwNy1pbmNm
         447w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071039; x=1709675839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8NxQipcEdhvhYX9/1TDx27LVifFQLgX/GnCKjILzxLA=;
        b=E/XdpZuZn92MTh8Es6TjZpjwCVdILNYXV18xQpOfjL25fRHp7cejNsyle2ebKdCpBj
         +kph1cafFhnZ+a+oE1jisTvSrBUPZJhReVW58FC9F8F4o8pok8ui/bp1aDJPuFGdHrVW
         2gCQfxf8MMIE2oAlFb0ouVKollefIVlpbWhESddbCFjEAJBlKDsw7uorpC8t+0UOrn+6
         EEDL94d1G4txfhhnWmgx6tlnKDtFr4VYV2LAqRZGyAI+aYgO3+u3sRiuiefkPD00il4m
         mD/NUrGoIw2EsqRVnU16LoxZg+eH2Lrwo6Mpx2b0zVtY22VqHisLD4bpCuNeZw9AFV9h
         1BVw==
X-Gm-Message-State: AOJu0YxO9j41hvH9mWnfdV0qUJCCLeJBhZgnPhu+kHDYQFqe6/WbL9kb
	ZCMOrc43hVchytdJcTwjkStBOgdCAdOReDzxJ3rF4BN1KfwQGHannGbMlpsN1l+Ig6YK86Qfv0x
	dBCg=
X-Google-Smtp-Source: AGHT+IHkzpZWwio8fTPwW3F9R/NXaOy1vA/kG1vGlTc65jPhf1wOZqrA35BIDE/CKujVKIVsUvIf8g==
X-Received: by 2002:a05:6a00:1ac7:b0:6e4:6484:1a36 with SMTP id f7-20020a056a001ac700b006e464841a36mr12375241pfv.21.1709071038809;
        Tue, 27 Feb 2024 13:57:18 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n7-20020aa78a47000000b006e50bbf4e71sm4936428pfa.9.2024.02.27.13.57.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 13:57:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/16] oeqa/selftest/recipetool: fix for python 3.12
Date: Tue, 27 Feb 2024 11:56:53 -1000
Message-Id: <9c1a1110a317e1d64668badb13e74e474f96a7a9.1709070850.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709070850.git.steve@sakoman.com>
References: <cover.1709070850.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 21:57:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196305

From: Adrian Freihofer <adrian.freihofer@gmail.com>

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Backported from master: 7374a8a2810a6cf027bfefefe87691a3529123ff

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index db8790b57b..db21325155 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -444,13 +444,13 @@ class RecipetoolCreateTests(RecipetoolBase):
         temprecipe = os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
         recipefile = os.path.join(temprecipe, 'meson_git.bb')
-        srcuri = 'https://github.com/mesonbuild/meson;rev=0.32.0'
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
@@ -476,15 +476,15 @@ class RecipetoolCreateTests(RecipetoolBase):
         # Basic test to ensure github URL mangling doesn't apply to release tarballs
         temprecipe = os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
-        pv = '0.32.0'
+        pv = '1.3.1'
         recipefile = os.path.join(temprecipe, 'meson_%s.bb' % pv)
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
2.34.1


