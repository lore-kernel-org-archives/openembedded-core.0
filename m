Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD1CC54793
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 19:40:52 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.461.1708544447552707206
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Feb 2024 11:40:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D8TsPfRi;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-33d4c11bd34so2772077f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 11:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708544445; x=1709149245; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=suLHWl9GSRGMw4awROsfkgEvzIn5iBeK/oebUguDTTE=;
        b=D8TsPfRi+8gjs1TgUFQ0XZXDWYlxn2u1TqmyqXRRF10cvRVi93Xp+RjPck1jKZjWNc
         TTNTaftF+lw7vS5mihD1QGqdLWxKCnzsgQvLaGnIF2eiawZoBeb6QLUcWcSakcKcTtaG
         c+HtZCFnJEVyLwUmVyFVgSQd+B+2u0drxLGXM0OKEhPBZt0YpzoCcIfxRjkAOw8phyFU
         S3k4fMN3SmH57E+8X7Aj8P1iqMq4myQTXtblt7FTob8hSnesimCkWLhcgfVYjJPFk3WW
         FqC2gaFm71eNvfA7q1JPVVBpFj/R7HirPcpdBi59xSyWeROyWeMhyeSSE/tRyc+ttgX/
         AFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708544445; x=1709149245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=suLHWl9GSRGMw4awROsfkgEvzIn5iBeK/oebUguDTTE=;
        b=KER1IimhFqGAMa4TBkMncSShkb1+4cf1RBONEfmzPoqBvpKjI7lx18QYjOjH0hSZqA
         GLmi5hh/sGveIKzxMYuUD64OFxkzPfT7/Umybev/orazfZh6eH5F4jzXwoIjoU6ByNe1
         ps5Wsbn0DABoiqon9jpQbpqteKHoFED82voz/1yLCS8yElxPSmQEvdqVLSmowqEODEM6
         W8eRftIWLibQ1Tgo8rvOlcNDnCDmbMQxJK2ZNddGQr1r/Cc+NTQ42Jd6RDiXTJGCNe4u
         Ai3gtPen06hCjgtgKyvu8OeoC10Aj06OdivKY78w7CagkHoct01DXbc7KguZTfWXvl52
         eDgA==
X-Gm-Message-State: AOJu0YzM4oypBeU53PiCiLy3lIzAaKP6hXp7vK3zyfWUGdrHKR/43qeV
	f4q4BeANcXFH1j1pp3y7ywsrvs4rolFaNDwHrwk4rxLCXoAFo61MSmADZeVT
X-Google-Smtp-Source: AGHT+IF9A4sUI3z/YAAADmcJ+C+7nPXjvQhw4X0hou+/EQQVOZbuH7+anj+O7jI08WRHInVNPuPp+Q==
X-Received: by 2002:a05:6000:d84:b0:33d:2a1e:99fb with SMTP id dv4-20020a0560000d8400b0033d2a1e99fbmr12299665wrb.57.1708544445554;
        Wed, 21 Feb 2024 11:40:45 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id h5-20020a05600016c500b0033d60cba289sm8764686wrf.68.2024.02.21.11.40.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 11:40:44 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH v2 06/13] oeqa/selftest/recipetool: fix for python 3.12
Date: Wed, 21 Feb 2024 20:36:58 +0100
Message-ID: <20240221194036.1804463-7-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240221194036.1804463-1-adrian.freihofer@siemens.com>
References: <20240221194036.1804463-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 19:40:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195990

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
2.43.1


