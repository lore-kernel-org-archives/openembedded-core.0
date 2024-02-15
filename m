Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9719DC48BF5
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 22:17:25 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.4919.1708035444990423518
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 14:17:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H6deBKu2;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33b28aadb28so730320f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 14:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708035443; x=1708640243; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=takw75URpKotd/VH8XlPoU8IBBDfkdICzITwRAppyOY=;
        b=H6deBKu2D+AY9spdTt1vfj9WL5KOV2EYDqo8R5QqdSIYPLLHkVK88A81HD6uF809tx
         J2SKhCvcNFSnEEyk2VGif7Dkvp5XU19UFQhU2NA/bCADQqYol+4mhMLtn9UdcXwlhGSz
         3dkneWdMlMekyQAQqHjT6ibPR9E1YItI+md5pkegaMDMalddalU/LhqMbNrc2UaMFLkk
         /1TrU4v5ISbbpAJs+7R7q6QIv6OlX1IDRFN9cwjb0MaHwFyQttEo3aajrLEYuK2Smoj3
         hkh8L9T4XmkSTTgejzH6hLyUblei0ZB61fFwsULdyqtZACMGOJlxHenr8XKW63rG8JEm
         /w6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708035443; x=1708640243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=takw75URpKotd/VH8XlPoU8IBBDfkdICzITwRAppyOY=;
        b=tUG98UX5iM69sM//AyferLuiC6vOQqRgSKOa1MCg+TeJuft/64W45fV4Ev+nAVvD+a
         Kqg9ceNerpOc88Q2MsI+LAsEaA0cCVspbe8w3BKO9k1zFH5WNWkzvWgQLC2WANsW0uoH
         ynMwef/3TeMao3DrtVEdPU9HS1plRhoR7mmzEnuWHj81ZkEvDC7Km1Trw6Ly4n7dGgIV
         qYvXdzl0xx0/519yrkCvvMXf8EwyYFIkK7PHtQhOQbXB9AbwfOfD7u5+MEKiW2nbVVS+
         k4LAvGAP21+vwA67jWdCn5HCy2QGgdVM2wXgzirW7OvuegWA3ZUweg+hEjG/U2PsXuZs
         lFEw==
X-Gm-Message-State: AOJu0YzMU/z2CfHb//9MgUiIJuPyK6Q8qNAWRHjMo4EWBFAo/xXXUzmI
	rdpHKymPEvmiwmfo3qd1ERSBjOXyHfgvrzmCfNYnltwytOeflZenIboDCfIRO9Y=
X-Google-Smtp-Source: AGHT+IEwZA1x64/sND4FjQotZLx0zjS76FLEnOkVh1iTmfPZ9GeKzSey1sBksHl6nGiyyYWkDkyXpA==
X-Received: by 2002:a5d:564f:0:b0:33c:e0a1:126d with SMTP id j15-20020a5d564f000000b0033ce0a1126dmr1932654wrw.70.1708035443153;
        Thu, 15 Feb 2024 14:17:23 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id e5-20020a5d65c5000000b0033cda3d3916sm335334wrw.88.2024.02.15.14.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 14:17:22 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [kirkstone][PATCH 07/12] oeqa/selftest/recipetool: downgrade meson version to not use pyproject.toml
Date: Thu, 15 Feb 2024 23:13:53 +0100
Message-ID: <20240215221711.332614-8-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240215221711.332614-1-adrian.freihofer@siemens.com>
References: <20240215221711.332614-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 22:17:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195718

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
2.43.1


