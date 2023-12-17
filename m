Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1681C3DA6E
	for <webhook@archiver.kernel.org>; Sun, 17 Dec 2023 05:42:15 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.14298.1702791732448482266
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Dec 2023 21:42:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UwTI15cj;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6d099d316a8so1911203b3a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 21:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702791731; x=1703396531; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=srGB2pjIhnuT511CCQ5G2O/EjtJPA6rbKsDZTNjxCrY=;
        b=UwTI15cjoaogx0eTeEinBg322o0OLTl4yXhimegNkHsutcYnPc1gJPrGNimSeP1i6P
         +qmIBmhBouUp6EnYpLMl6mbDbq7paGEaHeWKvP6NqewFsIpdM/208Gq7PK1qOKqXtq3/
         EhADOWmEuoQdbY1VVxi0B6JqUigS82GGd/ME8xIdvj62MYYdEov1hz3fr0X78aP36jPy
         eKhSS1lOBQSLKfR3aF655g+DIYBgqmY3K8jVnxVSjVRcqLcDOi7rYi6EuGiDwjcDlsBx
         B4Iyz9elSFOZZMEZnBmBSHTsH0KWa1Vzp5FIp9Mx4PG3CnMqbtUbSpQ8U3EGmAPRx3iu
         +3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702791731; x=1703396531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=srGB2pjIhnuT511CCQ5G2O/EjtJPA6rbKsDZTNjxCrY=;
        b=fMw7H+4aZHtOJmAAdet+I+WaEMIetyaFs3ePOLBBELYPE61w1hfr50w4wqHRv3MzN4
         k4lP1wg4f4Gvvo9YxhMWNEGdO7nC/rGtxykR5BL9aelVyNiIEuvAGbfmOUPaaNJa4sQ/
         6viYY/qBG/N4eBdhr7pFzmRQl9yRgyX2w+1gs0lkhQlecuEqdDlf2xaUiebtb1rOOelv
         TLthelsy9umfy+B1WRwksNPHOS/Vaew7smpYLfZrDcgT44XFhefTl5Cm+kG9W1BaQhms
         w3O2OH2ytlg1wx7Q/wtB3hke5e3a74LKlu+3xY0XlWDYPCKYF6pfOtj0uXrEMwMsea9w
         1/TQ==
X-Gm-Message-State: AOJu0YwTNE4YDHOQFz355zacAdY4j/jSoxtNtSJ1mBcYkJdjOn0BImEw
	4IU/8X42sgyIkieO8Sph7vHOL/yrPBg=
X-Google-Smtp-Source: AGHT+IH10vlFBCbEDjhw8ThKHYrQOwGsqwMucYyg3GivucWaFeAI25G/aHyKN7GJ5Fa9rGN+KgG6UQ==
X-Received: by 2002:a05:6a00:2301:b0:6ce:ee3b:e529 with SMTP id h1-20020a056a00230100b006ceee3be529mr16414698pfh.62.1702791731420;
        Sat, 16 Dec 2023 21:42:11 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:6e3d:56d2:3c7b:de95])
        by smtp.gmail.com with ESMTPSA id f16-20020a056a001ad000b006cedd530420sm15365545pfv.52.2023.12.16.21.42.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 21:42:10 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] recipetool: add python_maturin support
Date: Sat, 16 Dec 2023 21:41:30 -0800
Message-Id: <f7b93ba5e8af9e20e80db1044837e1b5a83c0e97.1702791173.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702791173.git.tim.orling@konsulko.com>
References: <cover.1702791173.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Dec 2023 05:42:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192578

Add the new python_maturin PEP-517 backend

Add selftest for 'pydantic-core' pypi package.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py    | 29 +++++++++++++++++++
 .../lib/recipetool/create_buildsys_python.py  |  1 +
 2 files changed, 30 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index a19439d88e3..df15c80069c 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -670,6 +670,35 @@ class RecipetoolCreateTests(RecipetoolBase):
 
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
+    def test_recipetool_create_python3_pep517_maturin(self):
+        # This test require python 3.11 or above for the tomllib module
+        # or tomli module to be installed
+        try:
+            import tomllib
+        except ImportError:
+            try:
+                import tomli
+            except ImportError:
+                self.skipTest('Test requires python 3.11 or above for tomllib module or tomli module')
+
+        # Test creating python3 package from tarball (using maturin class)
+        temprecipe = os.path.join(self.tempdir, 'recipe')
+        os.makedirs(temprecipe)
+        pn = 'pydantic-core'
+        pv = '2.14.5'
+        recipefile = os.path.join(temprecipe, 'python3-%s_%s.bb' % (pn, pv))
+        srcuri = 'https://files.pythonhosted.org/packages/64/26/cffb93fe9c6b5a91c497f37fae14a4b073ecbc47fc36a9979c7aa888b245/pydantic_core-%s.tar.gz' % pv
+        result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
+        self.assertTrue(os.path.isfile(recipefile))
+        checkvars = {}
+        checkvars['HOMEPAGE'] = 'https://github.com/pydantic/pydantic-core'
+        checkvars['LICENSE'] = set(['MIT'])
+        checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=ab599c188b4a314d2856b3a55030c75c'
+        checkvars['SRC_URI[sha256sum]'] = '6d30226dfc816dd0fdf120cae611dd2215117e4f9b124af8c60ab9093b6e8e71'
+        inherits = ['python_maturin', 'pypi']
+
+        self._test_recipe_contents(recipefile, checkvars, inherits)
+
     def test_recipetool_create_github_tarball(self):
         # Basic test to ensure github URL mangling doesn't apply to release tarballs
         temprecipe = os.path.join(self.tempdir, 'recipe')
diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index a2af41fdda8..60c59034504 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -735,6 +735,7 @@ class PythonPyprojectTomlRecipeHandler(PythonRecipeHandler):
         "poetry.core.masonry.api": "python_poetry_core",
         "flit_core.buildapi": "python_flit_core",
         "hatchling.build": "python_hatchling",
+        "maturin": "python_maturin",
     }
 
     # setuptools.build_meta and flit declare project metadata into the "project" section of pyproject.toml
-- 
2.34.1


