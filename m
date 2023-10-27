Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E6EC25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 16:12:27 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.11047.1698423142118739808
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Oct 2023 09:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DXHMesez;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1c9daca2b85so16324085ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Oct 2023 09:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698423141; x=1699027941; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8pEeKz/Xg4ADRqq8ssLxF9L5qGvJXcQvhOCvIhb8a68=;
        b=DXHMeseznxdyDDQvHuqvUYgEGmvmAxyOPtQ5gVhp99jctXQ84HpUDE2oefp1l17nfJ
         Xt/lTfKsj5RXHPn1EkMOkK8my9lH3GCcrlfeLCXaZq6ncyleiKD5R3yXAi4zT3i6Au08
         Y96VWiHbQeRzJehgqvX5P6TV4N9/ahd0ZjjwrDujeOBPgp4rBmjXQv10fykV2ZHaVe/S
         xr45Xou9foo4aJPCx1dL/7g4UKh8lBflHF8UA4cz/Q5vWGZBf0IlaFHDWWuFW+MaeOL2
         hhoLP055plS3vyc2uO+7EOfQ3cbsVBUQTGqKBf50Q9bKYs9Gsh70Smtv2fX4klbrsp0n
         RTFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698423141; x=1699027941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8pEeKz/Xg4ADRqq8ssLxF9L5qGvJXcQvhOCvIhb8a68=;
        b=RihuEJD6yqlT0m6BpQvdibMjVVrLXcBQwLBqnuiD0nGaWHb82b9ZFISvEmPnNX0zDb
         c+SHfepX2X8Q1uXyyCAdhn2G/k6fMBU0YSb2p7rlIaeVSkaC5V0/cIn2eMjesLehlNgF
         UH+cTURjKxUzKjAoPaOrcXnd5sd0HIHWZJVlr4gskR3WQjtMBrF6bZ5hsgE6yF4fpuL4
         OoHhjpXJxU+S81fOLFFEjTP2rksNVRzoT79r3aqj2IrjhX8qO1DwEPLG56LqGRM7P125
         38qKLd55iXDEOYjILdi9mYRtuIcdo2YRIjFBrmBK9JPmCl8mYuItD7vK9ol3sKu3X17C
         +sRA==
X-Gm-Message-State: AOJu0YyWC3uDiOMu32vsOOdcumUkVkEvBZ1he01H4iwaXAPcVbqFg3z6
	93gP6aRYpf8C1H7HEpq+M7AmnJK7Mf2MYw==
X-Google-Smtp-Source: AGHT+IEITNJvnm0wM5LzJkkGaJypv4quB9kchyj6bX/0FW3eqEw5EI+a6qlVkDT93EJQQ4mi5gq3dw==
X-Received: by 2002:a17:902:c412:b0:1c9:e77d:62d3 with SMTP id k18-20020a170902c41200b001c9e77d62d3mr4881372plk.10.1698423140912;
        Fri, 27 Oct 2023 09:12:20 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:86f5:78c8:cb9c:655c])
        by smtp.gmail.com with ESMTPSA id 12-20020a170902c20c00b001bc675068e2sm1753610pll.111.2023.10.27.09.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 09:12:20 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] recipetool: add python_hatchling support
Date: Fri, 27 Oct 2023 09:12:12 -0700
Message-Id: <20231027161212.468295-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Oct 2023 16:12:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189751

One of the newer PEP-517 backends to be added was python_hatchling.bbclass
but it was not included in the recent improvements.

Add selftest for 'jsonschema' pypi package.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py    | 35 +++++++++++++++++++
 .../lib/recipetool/create_buildsys_python.py  |  6 +++-
 2 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 8e0fc995f7e..b64f724b8f0 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -576,6 +576,41 @@ class RecipetoolCreateTests(RecipetoolBase):
 
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
+    def test_recipetool_create_python3_pep517_hatchling(self):
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
+        # Test creating python3 package from tarball (using hatchling class)
+        temprecipe = os.path.join(self.tempdir, 'recipe')
+        os.makedirs(temprecipe)
+        pn = 'jsonschema'
+        pv = '4.19.1'
+        recipefile = os.path.join(temprecipe, 'python3-%s_%s.bb' % (pn, pv))
+        srcuri = 'https://files.pythonhosted.org/packages/e4/43/087b24516db11722c8687e0caf0f66c7785c0b1c51b0ab951dfde924e3f5/jsonschema-%s.tar.gz' % pv
+        result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
+        self.assertTrue(os.path.isfile(recipefile))
+        checkvars = {}
+        checkvars['SUMMARY'] = 'An implementation of JSON Schema validation for Python'
+        checkvars['HOMEPAGE'] = 'https://github.com/python-jsonschema/jsonschema'
+        checkvars['LICENSE'] = set(['MIT'])
+        checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af'
+        checkvars['SRC_URI'] = 'https://files.pythonhosted.org/packages/e4/43/087b24516db11722c8687e0caf0f66c7785c0b1c51b0ab951dfde924e3f5/jsonschema-${PV}.tar.gz'
+        checkvars['SRC_URI[md5sum]'] = '4d6667ce76f820c35082c2d60a4896ab'
+        checkvars['SRC_URI[sha1sum]'] = '9173714cb88964d07f3a3f4fcaaef638b8ceac0c'
+        checkvars['SRC_URI[sha256sum]'] = 'ec84cc37cfa703ef7cd4928db24f9cb31428a5d0fa77747b8b51a847458e0bbf'
+        checkvars['SRC_URI[sha384sum]'] = '7a53181f0e679aa3dc3eb4d05a420877b7b9bff2d02e81f5c289a37ed1127d6c0cca1f5a5f9e4e166f089ab36bcc2be9'
+        checkvars['SRC_URI[sha512sum]'] = '60fa769faf6e3fc2c14eb9acd189c86e9d366b157230a5681d36552af0c159cb1ad33fd920668a36afdab98bc97253f91501704c5c07b5009fdaf9d29b52060d'
+        inherits = ['python_hatchling']
+
+        self._test_recipe_contents(recipefile, checkvars, inherits)
+
     def test_recipetool_create_github_tarball(self):
         # Basic test to ensure github URL mangling doesn't apply to release tarballs
         temprecipe = os.path.join(self.tempdir, 'recipe')
diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index 9e7f22c0db0..9312e4abf13 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -662,11 +662,12 @@ class PythonPyprojectTomlRecipeHandler(PythonRecipeHandler):
     PEP517 https://peps.python.org/pep-0517/#source-trees
     PEP518 https://peps.python.org/pep-0518/#build-system-table
     """
-    # bitbake currently support the 3 following backends
+    # bitbake currently supports the 4 following backends
     build_backend_map = {
         "setuptools.build_meta": "python_setuptools_build_meta",
         "poetry.core.masonry.api": "python_poetry_core",
         "flit_core.buildapi": "python_flit_core",
+        "hatchling.build": "python_hatchling",
     }
 
     # setuptools.build_meta and flit declare project metadata into the "project" section of pyproject.toml
@@ -716,6 +717,8 @@ class PythonPyprojectTomlRecipeHandler(PythonRecipeHandler):
         "poetry-core": "python3-poetry-core",
         "flit_core": "python3-flit-core",
         "setuptools-scm": "python3-setuptools-scm",
+        "hatchling": "python3-hatchling",
+        "hatch-vcs": "python3-hatch-vcs",
     }
 
     def __init__(self):
@@ -776,6 +779,7 @@ class PythonPyprojectTomlRecipeHandler(PythonRecipeHandler):
                     if field == "license":
                         # For setuptools.build_meta and flit, licence is a table
                         # but for poetry licence is a string
+                        # for hatchling, both table (jsonschema) and string (iniconfig) have been used
                         if build_backend == "poetry.core.masonry.api":
                             value = values
                         else:
-- 
2.34.1


