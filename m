Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C5DDC25B6E
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 14:40:31 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.149467.1698158430343869224
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Oct 2023 07:40:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=IbTuc0fe;
 spf=pass (domain: baylibre.com, ip: 209.85.128.46, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4083cd3917eso36330025e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 07:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698158428; x=1698763228; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rHdX3Cq9hsw0p513sEHr6CUJF5Qu2IPBlZ8uYt17DKw=;
        b=IbTuc0feKER66bK3tx87CztJt7vxoMSMJAthAWzZ3FBsvvTl4/SFBsq36G4O62Lcjg
         ZmIVn25LPbSaqQf7wyxE5f+euJGeHwiU+1CUnnOxo+eyulFucx8LMNupZRo3oadYfJFD
         GOLF3IxYyWrznOPF4u/2HIBQPq377Xw3YdQY4jJc3YUtJeWYCYcxFHdTd4+GhX+XpbVQ
         bqQr4AVqgYN1+YIXoB0dqWUA6Lwnd/GpgWYf32VMF0PvvITqg8HJZJWHjZkM0r6If7Zc
         nijSgtXy0PKRWdqDOKkX1o91LnpFejvbOnu7WWc0wqo4kvXIj2xJg9a+kB3rHtnpXn8h
         9MWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698158428; x=1698763228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rHdX3Cq9hsw0p513sEHr6CUJF5Qu2IPBlZ8uYt17DKw=;
        b=a2Ni8UEJudaQCzlP+BOAWKzs0CWY3hR/wCB9UQx9n9WnKLFTP6VUV2D5BA/OiOZu1g
         ukW7/ILhq2wuOOCtjKeP4bykNhw+a6+DVcbysE4FigrBT0qwWSOAKMr8n5LUff2Sg7lu
         qXKfqd5hC0+o2w2z0JAVe4iaJKg4U1rbZkI7JTfY2zd3Rv8UiNvRY1aStMl1pjFHV4Ge
         P+EkN4KzIthBUslKG+VCBNOnU27IId35Fo4XgWzL2CszUKc/++qejsmrlQOv9SDglpQi
         JpS/Y2Rmy+mmOdBPDYdSc5fflhjp3vVSyINo0rfgTxAdEXXNj6FcRDFaAca/kzZZb/wS
         NDog==
X-Gm-Message-State: AOJu0YyyjMR1FcaxIgOi8Wi3lK50pR2D9KigcBNfsusmeXXrucJ0KdMB
	C/AdKIZGXS9f9QUFdoclLZ2mQ98/N0h4xn9qzjl+Ww==
X-Google-Smtp-Source: AGHT+IGRjEA1bW3bKsu90LihrhEHh3NKCkDNfMvJvXX7z2UcGln5ybQn16VJPpFKpBWTAGq6nE3pSg==
X-Received: by 2002:a05:600c:154a:b0:406:4573:81d2 with SMTP id f10-20020a05600c154a00b00406457381d2mr8985048wmg.39.1698158428160;
        Tue, 24 Oct 2023 07:40:28 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id k32-20020a05600c1ca000b00401e32b25adsm12387271wms.4.2023.10.24.07.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 07:40:27 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v3 4/4]  oeqa/selftest/recipetool: add selftest for PEP-517 recipe creation
Date: Tue, 24 Oct 2023 16:40:21 +0200
Message-ID: <20231024144022.1532605-5-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231024144022.1532605-1-jstephan@baylibre.com>
References: <20231024144022.1532605-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 14:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189652

 Add 3 tests to check the creation of PEP-517 project using the 3
 backends supported by bitbake:
  - setuptools.build_meta
  - poetry.core.masonry.api
  - flit_core.buildapi

Theses tests requires the tomllib python module, so skip theses tests
if module is not present. tomllib module is part of python starting from 3.11

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 102 +++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index d3aea74228f..8e0fc995f7e 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -474,6 +474,108 @@ class RecipetoolCreateTests(RecipetoolBase):
         inherits = ['setuptools3']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
+    def test_recipetool_create_python3_pep517_setuptools_build_meta(self):
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
+        # Test creating python3 package from tarball (using setuptools.build_meta class)
+        temprecipe = os.path.join(self.tempdir, 'recipe')
+        os.makedirs(temprecipe)
+        pn = 'webcolors'
+        pv = '1.13'
+        recipefile = os.path.join(temprecipe, 'python3-%s_%s.bb' % (pn, pv))
+        srcuri = 'https://files.pythonhosted.org/packages/a1/fb/f95560c6a5d4469d9c49e24cf1b5d4d21ffab5608251c6020a965fb7791c/%s-%s.tar.gz' % (pn, pv)
+        result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
+        self.assertTrue(os.path.isfile(recipefile))
+        checkvars = {}
+        checkvars['SUMMARY'] = 'A library for working with the color formats defined by HTML and CSS.'
+        checkvars['LICENSE'] = set(['BSD-3-Clause'])
+        checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=702b1ef12cf66832a88f24c8f2ee9c19'
+        checkvars['SRC_URI'] = 'https://files.pythonhosted.org/packages/a1/fb/f95560c6a5d4469d9c49e24cf1b5d4d21ffab5608251c6020a965fb7791c/webcolors-${PV}.tar.gz'
+        checkvars['SRC_URI[md5sum]'] = 'c9be30c5b0cf1cad32e4cbacbb2229e9'
+        checkvars['SRC_URI[sha1sum]'] = 'c90b84fb65eed9b4c9dea7f08c657bfac0e820a5'
+        checkvars['SRC_URI[sha256sum]'] = 'c225b674c83fa923be93d235330ce0300373d02885cef23238813b0d5668304a'
+        checkvars['SRC_URI[sha384sum]'] = '45652af349660f19f68d01361dd5bda287789e5ea63608f52a8cea526ac04465614db2ea236103fb8456b1fcaea96ed7'
+        checkvars['SRC_URI[sha512sum]'] = '074aaf135ac6b0025b88b731d1d6dfa4c539b4fff7195658cc58a4326bb9f0449a231685d312b4a1ec48ca535a838bfa5c680787fe0e61473a2a092c448937d0'
+        inherits = ['python_setuptools_build_meta']
+
+        self._test_recipe_contents(recipefile, checkvars, inherits)
+
+    def test_recipetool_create_python3_pep517_poetry_core_masonry_api(self):
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
+        # Test creating python3 package from tarball (using poetry.core.masonry.api class)
+        temprecipe = os.path.join(self.tempdir, 'recipe')
+        os.makedirs(temprecipe)
+        pn = 'iso8601'
+        pv = '2.1.0'
+        recipefile = os.path.join(temprecipe, 'python3-%s_%s.bb' % (pn, pv))
+        srcuri = 'https://files.pythonhosted.org/packages/b9/f3/ef59cee614d5e0accf6fd0cbba025b93b272e626ca89fb70a3e9187c5d15/%s-%s.tar.gz' % (pn, pv)
+        result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
+        self.assertTrue(os.path.isfile(recipefile))
+        checkvars = {}
+        checkvars['SUMMARY'] = 'Simple module to parse ISO 8601 dates'
+        checkvars['LICENSE'] = set(['MIT'])
+        checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=aab31f2ef7ba214a5a341eaa47a7f367'
+        checkvars['SRC_URI'] = 'https://files.pythonhosted.org/packages/b9/f3/ef59cee614d5e0accf6fd0cbba025b93b272e626ca89fb70a3e9187c5d15/iso8601-${PV}.tar.gz'
+        checkvars['SRC_URI[md5sum]'] = '6e33910eba87066b3be7fcf3d59d16b5'
+        checkvars['SRC_URI[sha1sum]'] = 'efd225b2c9fa7d9e4a1ec6ad94f3295cee982e61'
+        checkvars['SRC_URI[sha256sum]'] = '6b1d3829ee8921c4301998c909f7829fa9ed3cbdac0d3b16af2d743aed1ba8df'
+        checkvars['SRC_URI[sha384sum]'] = '255002433fe65c19adfd6b91494271b613cb25ef6a35ac77436de1e03d60cc07bf89fd716451b917f1435e4384860ef6'
+        checkvars['SRC_URI[sha512sum]'] = 'db57ab2a25ef91e3bc479c8539d27e853cf1fbf60986820b8999ae15d7e566425a1e0cfba47d0f3b23aa703db0576db368e6c110ba2a2f46c9a34e8ee3611fb7'
+        inherits = ['python_poetry_core']
+
+        self._test_recipe_contents(recipefile, checkvars, inherits)
+
+    def test_recipetool_create_python3_pep517_flit_core_buildapi(self):
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
+        # Test creating python3 package from tarball (using flit_core.buildapi class)
+        temprecipe = os.path.join(self.tempdir, 'recipe')
+        os.makedirs(temprecipe)
+        pn = 'typing-extensions'
+        pv = '4.8.0'
+        recipefile = os.path.join(temprecipe, 'python3-%s_%s.bb' % (pn, pv))
+        srcuri = 'https://files.pythonhosted.org/packages/1f/7a/8b94bb016069caa12fc9f587b28080ac33b4fbb8ca369b98bc0a4828543e/typing_extensions-%s.tar.gz' % pv
+        result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
+        self.assertTrue(os.path.isfile(recipefile))
+        checkvars = {}
+        checkvars['SUMMARY'] = 'Backported and Experimental Type Hints for Python 3.8+'
+        checkvars['LICENSE'] = set(['PSF-2.0'])
+        checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2'
+        checkvars['SRC_URI'] = 'https://files.pythonhosted.org/packages/1f/7a/8b94bb016069caa12fc9f587b28080ac33b4fbb8ca369b98bc0a4828543e/typing_extensions-${PV}.tar.gz'
+        checkvars['SRC_URI[md5sum]'] = '74bafe841fbd1c27324afdeb099babdf'
+        checkvars['SRC_URI[sha1sum]'] = 'f8bed69cbad4a57a1a67bf8a31b62b657b47f7a3'
+        checkvars['SRC_URI[sha256sum]'] = 'df8e4339e9cb77357558cbdbceca33c303714cf861d1eef15e1070055ae8b7ef'
+        checkvars['SRC_URI[sha384sum]'] = '0bd0112234134d965c6884f3c1f95d27b6ae49cfb08108101158e31dff33c2dce729331628b69818850f1acb68f6c8d0'
+        checkvars['SRC_URI[sha512sum]'] = '5fbff10e085fbf3ac2e35d08d913608d8c8bca66903435ede91cdc7776d775689a53d64f5f0615fe687c6c228ac854c8651d99eb1cb96ec61c56b7ca01fdd440'
+        inherits = ['python_flit_core']
+
+        self._test_recipe_contents(recipefile, checkvars, inherits)
+
     def test_recipetool_create_github_tarball(self):
         # Basic test to ensure github URL mangling doesn't apply to release tarballs
         temprecipe = os.path.join(self.tempdir, 'recipe')
-- 
2.42.0


