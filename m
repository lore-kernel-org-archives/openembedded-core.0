Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC89D12D45
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 11:25:06 +0000 (UTC)
Received: from smtp-190f.mail.infomaniak.ch (smtp-190f.mail.infomaniak.ch [185.125.25.15])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12942.1764761101953598199
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 03:25:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.15, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dLwKS0TTSzbHG;
	Wed,  3 Dec 2025 12:25:00 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4dLwKR34nCzMTZ;
	Wed,  3 Dec 2025 12:24:59 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Wed, 03 Dec 2025 12:24:36 +0100
Subject: [PATCH] recipetool: support PEP639-variant of license key in
 pyproject.toml
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-devtool-pep-0639-v1-1-c39997c88996@cherry.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7bkFrC+sr0SFyq4VI0ZBA+nvSZ
 WAOMxkiB+EIY5UhcJIo7iqi6wrWY7l2RrHFoVFNpwvQcrqdO9GzR9W3A2oyRGSssaqDkvnAmzz
 /cprf9wOXGBxLYgAAAA==
X-Change-ID: 20251202-devtool-pep-0639-1484448d8d05
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 11:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227216

From: Quentin Schulz <quentin.schulz@cherry.de>

Python modules using PEP639-variant of the license key[1] are currently
returning Unknown as LICENSE when using recipetool create on them
because we try to parse the key as a dict but it is now an SPDX license
expression.

This adds support for PEP639-variant of the license key, though it does
not handle the newly added license-files key[2] as I couldn't find a
dual-licensed recipe which uses that mechanism yet.

[1] https://peps.python.org/pep-0639/#add-string-value-to-license-key
[2] https://peps.python.org/pep-0639/#add-license-files-key

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/lib/oeqa/selftest/cases/recipetool.py       | 45 ++++++++++++++++++++++++
 scripts/lib/recipetool/create_buildsys_python.py | 12 +++++--
 2 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 0bd724c8ee..e23055ded1 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -595,6 +595,51 @@ class RecipetoolCreateTests(RecipetoolBase):
 
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
+    def test_recipetool_create_python3_pep517_setuptools_build_meta_license_prepep639(self):
+        # Test pre-PEP639 where the license field is a table
+        # This test require python 3.11 or above for the tomllib module or tomli module to be installed
+        needTomllib(self)
+
+        # Test creating python3 package from tarball (using setuptools.build_meta class)
+        temprecipe = os.path.join(self.tempdir, 'recipe')
+        os.makedirs(temprecipe)
+        pv = '1.37.1'
+        pn = 'yamllint'
+        recipefile = os.path.join(temprecipe, 'python3-%s_%s.bb' % (pn, pv))
+        srcuri = 'https://files.pythonhosted.org/packages/46/f2/cd8b7584a48ee83f0bc94f8a32fea38734cefcdc6f7324c4d3bfc699457b//%s-%s.tar.gz' % (pn, pv)
+        result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
+        self.assertTrue(os.path.isfile(recipefile))
+        checkvars = {}
+        checkvars['SUMMARY'] = 'A linter for YAML files.'
+        checkvars['LICENSE'] = set(['GPL-3.0-only'])
+        checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=1ebbd3e34237af26da5dc08a4e440464'
+        checkvars['SRC_URI[sha256sum]'] = '81f7c0c5559becc8049470d86046b36e96113637bcbe4753ecef06977c00245d'
+        inherits = ['python_setuptools_build_meta', 'pypi']
+
+        self._test_recipe_contents(recipefile, checkvars, inherits)
+
+    def test_recipetool_create_python3_pep517_setuptools_build_meta_license_pep639(self):
+        # Test PEP639 where the license field is an SPDX license expression string
+        # This test require python 3.11 or above for the tomllib module or tomli module to be installed
+        needTomllib(self)
+
+        # Test creating python3 package from tarball (using setuptools.build_meta class)
+        temprecipe = os.path.join(self.tempdir, 'recipe')
+        os.makedirs(temprecipe)
+        pv = '2.0.0'
+        recipefile = os.path.join(temprecipe, 'python3-sphinxcontrib-svg2pdfconverter_%s.bb' % pv)
+        srcuri = 'https://files.pythonhosted.org/packages/21/7a/21930ae148f94c458ca2f8f554d4e737e17c1db8b152238f530fc0c89e32/sphinxcontrib_svg2pdfconverter-%s.tar.gz' % pv
+        result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
+        self.assertTrue(os.path.isfile(recipefile))
+        checkvars = {}
+        checkvars['SUMMARY'] = 'Sphinx SVG to PDF or PNG converter extension'
+        checkvars['LICENSE'] = set(['BSD-2-Clause'])
+        checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE.txt;md5=b11cf936853a71258d4b57bb1849a3f9'
+        checkvars['SRC_URI[sha256sum]'] = 'ab9c8f1080391e231812d20abf2657a69ee35574563b1014414f953964a95fa3'
+        inherits = ['python_setuptools_build_meta', 'pypi']
+
+        self._test_recipe_contents(recipefile, checkvars, inherits)
+
     def test_recipetool_create_python3_pep517_poetry_core_masonry_api(self):
         # This test require python 3.11 or above for the tomllib module or tomli module to be installed
         needTomllib(self)
diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index a807dafae5..61979c842c 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -858,10 +858,16 @@ class PythonPyprojectTomlRecipeHandler(PythonRecipeHandler):
             if metadata:
                 for field, values in metadata.items():
                     if field == "license":
-                        # For setuptools.build_meta and flit, licence is a table
-                        # but for poetry licence is a string
+                        # for flit, licence is a table
+                        # for setuptools.build_meta, license is either:
+                        # - a table, pre-PEP639,
+                        # - an SPDX license expression as string, since PEP639
+                        # for poetry licence is a string
                         # for hatchling, both table (jsonschema) and string (iniconfig) have been used
-                        if build_backend == "poetry.core.masonry.api":
+                        # TODO: support license-files array of glob paths since PEP639
+                        if build_backend == "poetry.core.masonry.api" or \
+                                (build_backend == "setuptools.build_meta" and
+                                 isinstance(values, str)):
                             value = values
                         else:
                             value = values.get("text", "")

---
base-commit: ac7327583aef83fd400190506f3147623de38b68
change-id: 20251202-devtool-pep-0639-1484448d8d05

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


