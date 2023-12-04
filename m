Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A28FCC4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 15:59:52 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.72364.1701705589691338267
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 07:59:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=DEw21Cd4;
 spf=pass (domain: baylibre.com, ip: 209.85.128.53, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40c0a03eb87so14578925e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 07:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701705587; x=1702310387; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tvn93zXlOozJpVGbSP2G/Dvv7AsjgFtSstz+fmtTgHE=;
        b=DEw21Cd4uIQp70slznUHZ8Dmcgmh2OvYA2UBeFmnanVpVOczluIc1xedNj6uwm8+yL
         5kw60JFxSmMA25ZJgP9ptm+6I2J9OuViHl4QeEMyRxmOCk+iuVzNCUOyfs94XnKjdNp9
         fJ4xfXi3ODeWlhJvawvRlmFY0S1zIdKap3/kFzsiB+zYXOnlZ/Jtw10iSYl66GnsHMB0
         cxo7bSk85OZwLH5rWh6jIJQy6wxdk0mfSbzpxol1Hi46z6AFiAhfpwkMOOZBLu17DytI
         09Vhs0N7r7MoaxjDJlrc1UEubAyXgdEY6T53UNlDxGvDGDhkPxBKe7sKacMXdnY1s0pS
         GdLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701705587; x=1702310387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tvn93zXlOozJpVGbSP2G/Dvv7AsjgFtSstz+fmtTgHE=;
        b=siwDO5RIoxdW0BE3VX17PgVoqo5jFwkYsK2rXmklHZJdlqMvfVutIlS5t1BHqd3ANa
         F17wOBZDcilztAblONzMz3D2p6ljVwE11tKpT672Bh52pa9fNnPQerUjkl5DhNk5IEk3
         HZzNXgUKEw8xl8nkap8bfpPNKqokCTgtqX7mWMdiolm9IUXyF0+KUudEx7pjwjXUbGAS
         p7nPBi3hrRYLUhok56UxXHbXka7ZgUVPMiu48S6PMFT/lk0+w46pSnDn7M/Kv4S8ErQ8
         bkxCY+hqTCl/VpEXd5w8ypxQRj/0adssMCgHEjoRyugNLaYDzaG0K7oPueQ+BX/XIBsR
         Dj1A==
X-Gm-Message-State: AOJu0YxCscoPcfA1S9z3yyryzD68776vsPFe3snOZpx/aH7AMpWOPv0f
	9m99cTcEGwWJ3cSQRliu6/WrPt4HibzzM/KzOyMFbw==
X-Google-Smtp-Source: AGHT+IG890eBmxZNEEVpg+nlJE/fgDq+xbb4iXrRxR8SeH6Izq0QTHN9GMFlQkethPljlyIpplRB8Q==
X-Received: by 2002:a05:600c:1f92:b0:40b:5f03:b3d1 with SMTP id je18-20020a05600c1f9200b0040b5f03b3d1mr1413175wmb.243.1701705587630;
        Mon, 04 Dec 2023 07:59:47 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id g16-20020a05600c4ed000b0040b47c53610sm15479595wmq.14.2023.12.04.07.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 07:59:46 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [RESEND][PATCH 7/7] oeqa/selftest/recipetool/devtool: add test for pypi class
Date: Mon,  4 Dec 2023 16:59:34 +0100
Message-ID: <20231204155934.836992-8-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204155934.836992-1-jstephan@baylibre.com>
References: <20231204155934.836992-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 15:59:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191761

recipetool now supports the pypi class and python recipes can by created
using the new following syntax:

* recipetool create https://pypi.org/project/<package>
* recipetool create https://pypi.org/project/<package>/<version>
* recipetool create https://pypi.org/project/<package> --version <version>

or the old syntax:
* recipetool create https://files.pythonhosted.org/packages/<...>

So add tests for the new syntax and modify old tests

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py    |   4 +-
 meta/lib/oeqa/selftest/cases/recipetool.py | 112 +++++++++++++++------
 2 files changed, 85 insertions(+), 31 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index b5c488be8e8..3d9a4901ea5 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -543,7 +543,7 @@ class DevtoolAddTests(DevtoolBase):
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake -c cleansstate %s' % testrecipe)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
-        result = runCmd('devtool add %s %s -f %s' % (testrecipe, srcdir, url))
+        result = runCmd('devtool add --no-pypi %s %s -f %s' % (testrecipe, srcdir, url))
         self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created. %s' % result.output)
         self.assertTrue(os.path.isfile(os.path.join(srcdir, 'setup.py')), 'Unable to find setup.py in source directory')
         self.assertTrue(os.path.isdir(os.path.join(srcdir, '.git')), 'git repository for external source tree was not created')
@@ -562,7 +562,7 @@ class DevtoolAddTests(DevtoolBase):
         result = runCmd('devtool reset -n %s' % testrecipe)
         shutil.rmtree(srcdir)
         fakever = '1.9'
-        result = runCmd('devtool add %s %s -f %s -V %s' % (testrecipe, srcdir, url, fakever))
+        result = runCmd('devtool add --no-pypi %s %s -f %s -V %s' % (testrecipe, srcdir, url, fakever))
         self.assertTrue(os.path.isfile(os.path.join(srcdir, 'setup.py')), 'Unable to find setup.py in source directory')
         # Test devtool status
         result = runCmd('devtool status')
diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 4bc28a4f2ee..b59e53f5994 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -457,13 +457,15 @@ class RecipetoolCreateTests(RecipetoolBase):
 
     def test_recipetool_create_python3_setuptools(self):
         # Test creating python3 package from tarball (using setuptools3 class)
+        # Use the --no-pypi switch to avoid creating a pypi enabled recipe and
+        # and check the created recipe as if it was a more general tarball
         temprecipe = os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
         pn = 'python-magic'
         pv = '0.4.15'
         recipefile = os.path.join(temprecipe, '%s_%s.bb' % (pn, pv))
         srcuri = 'https://files.pythonhosted.org/packages/84/30/80932401906eaf787f2e9bd86dc458f1d2e75b064b4c187341f29516945c/python-magic-%s.tar.gz' % pv
-        result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
+        result = runCmd('recipetool create --no-pypi -o %s %s' % (temprecipe, srcuri))
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
         checkvars['LICENSE'] = set(['MIT'])
@@ -474,6 +476,82 @@ class RecipetoolCreateTests(RecipetoolBase):
         inherits = ['setuptools3']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
+    def test_recipetool_create_python3_setuptools_pypi_tarball(self):
+        # Test creating python3 package from tarball (using setuptools3 and pypi classes)
+        temprecipe = os.path.join(self.tempdir, 'recipe')
+        os.makedirs(temprecipe)
+        pn = 'python-magic'
+        pv = '0.4.15'
+        recipefile = os.path.join(temprecipe, '%s_%s.bb' % (pn, pv))
+        srcuri = 'https://files.pythonhosted.org/packages/84/30/80932401906eaf787f2e9bd86dc458f1d2e75b064b4c187341f29516945c/python-magic-%s.tar.gz' % pv
+        result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
+        self.assertTrue(os.path.isfile(recipefile))
+        checkvars = {}
+        checkvars['LICENSE'] = set(['MIT'])
+        checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=16a934f165e8c3245f241e77d401bb88'
+        checkvars['PYPI_PACKAGE'] = pn
+        inherits = ['setuptools3', 'pypi']
+        self._test_recipe_contents(recipefile, checkvars, inherits)
+
+    def test_recipetool_create_python3_setuptools_pypi(self):
+        # Test creating python3 package from pypi url (using setuptools3 and pypi classes)
+        # Intentionnaly using setuptools3 class here instead of any of the pep517 class
+        # to avoid the toml dependency and allows this test to run on host autobuilders
+        # with older version of python
+        temprecipe = os.path.join(self.tempdir, 'recipe')
+        os.makedirs(temprecipe)
+        pn = 'python-magic'
+        pv = '0.4.15'
+        recipefile = os.path.join(temprecipe, '%s_%s.bb' % (pn, pv))
+        # First specify the required version in the url
+        srcuri = 'https://pypi.org/project/%s/%s' % (pn, pv)
+        runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
+        self.assertTrue(os.path.isfile(recipefile))
+        checkvars = {}
+        checkvars['LICENSE'] = set(['MIT'])
+        checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=16a934f165e8c3245f241e77d401bb88'
+        checkvars['PYPI_PACKAGE'] = pn
+        inherits = ['setuptools3', "pypi"]
+        self._test_recipe_contents(recipefile, checkvars, inherits)
+
+        # Now specify the version as a recipetool parameter
+        runCmd('rm -rf %s' % recipefile)
+        self.assertFalse(os.path.isfile(recipefile))
+        srcuri = 'https://pypi.org/project/%s' % pn
+        runCmd('recipetool create -o %s %s --version %s' % (temprecipe, srcuri, pv))
+        self.assertTrue(os.path.isfile(recipefile))
+        checkvars = {}
+        checkvars['LICENSE'] = set(['MIT'])
+        checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=16a934f165e8c3245f241e77d401bb88'
+        checkvars['PYPI_PACKAGE'] = pn
+        inherits = ['setuptools3', "pypi"]
+        self._test_recipe_contents(recipefile, checkvars, inherits)
+
+        # Now, try to grab latest version of the package, so we cannot guess the name of the recipe,
+        # unless hardcoding the latest version but it means we will need to update the test for each release,
+        # so use a regexp
+        runCmd('rm -rf %s' % recipefile)
+        self.assertFalse(os.path.isfile(recipefile))
+        recipefile_re = r'%s_(.*)\.bb' % pn
+        result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
+        dirlist = os.listdir(temprecipe)
+        if len(dirlist) > 1:
+            self.fail('recipetool created more than just one file; output:\n%s\ndirlist:\n%s' % (result.output, str(dirlist)))
+        if len(dirlist) < 1 or not os.path.isfile(os.path.join(temprecipe, dirlist[0])):
+            self.fail('recipetool did not create recipe file; output:\n%s\ndirlist:\n%s' % (result.output, str(dirlist)))
+        import re
+        match = re.match(recipefile_re, dirlist[0])
+        self.assertTrue(match)
+        latest_pv = match.group(1)
+        self.assertTrue(latest_pv != pv)
+        recipefile = os.path.join(temprecipe, '%s_%s.bb' % (pn, latest_pv))
+        # Do not check LIC_FILES_CHKSUM here to avoid having updating the test on each release
+        checkvars = {}
+        checkvars['LICENSE'] = set(['MIT'])
+        checkvars['PYPI_PACKAGE'] = pn
+        inherits = ['setuptools3', "pypi"]
+        self._test_recipe_contents(recipefile, checkvars, inherits)
+
     def test_recipetool_create_python3_pep517_setuptools_build_meta(self):
         # This test require python 3.11 or above for the tomllib module
         # or tomli module to be installed
@@ -498,13 +576,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars['SUMMARY'] = 'A library for working with the color formats defined by HTML and CSS.'
         checkvars['LICENSE'] = set(['BSD-3-Clause'])
         checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=702b1ef12cf66832a88f24c8f2ee9c19'
-        checkvars['SRC_URI'] = 'https://files.pythonhosted.org/packages/a1/fb/f95560c6a5d4469d9c49e24cf1b5d4d21ffab5608251c6020a965fb7791c/webcolors-${PV}.tar.gz'
-        checkvars['SRC_URI[md5sum]'] = 'c9be30c5b0cf1cad32e4cbacbb2229e9'
-        checkvars['SRC_URI[sha1sum]'] = 'c90b84fb65eed9b4c9dea7f08c657bfac0e820a5'
-        checkvars['SRC_URI[sha256sum]'] = 'c225b674c83fa923be93d235330ce0300373d02885cef23238813b0d5668304a'
-        checkvars['SRC_URI[sha384sum]'] = '45652af349660f19f68d01361dd5bda287789e5ea63608f52a8cea526ac04465614db2ea236103fb8456b1fcaea96ed7'
-        checkvars['SRC_URI[sha512sum]'] = '074aaf135ac6b0025b88b731d1d6dfa4c539b4fff7195658cc58a4326bb9f0449a231685d312b4a1ec48ca535a838bfa5c680787fe0e61473a2a092c448937d0'
-        inherits = ['python_setuptools_build_meta']
+        inherits = ['python_setuptools_build_meta', 'pypi']
 
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
@@ -532,13 +604,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars['SUMMARY'] = 'Simple module to parse ISO 8601 dates'
         checkvars['LICENSE'] = set(['MIT'])
         checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=aab31f2ef7ba214a5a341eaa47a7f367'
-        checkvars['SRC_URI'] = 'https://files.pythonhosted.org/packages/b9/f3/ef59cee614d5e0accf6fd0cbba025b93b272e626ca89fb70a3e9187c5d15/iso8601-${PV}.tar.gz'
-        checkvars['SRC_URI[md5sum]'] = '6e33910eba87066b3be7fcf3d59d16b5'
-        checkvars['SRC_URI[sha1sum]'] = 'efd225b2c9fa7d9e4a1ec6ad94f3295cee982e61'
-        checkvars['SRC_URI[sha256sum]'] = '6b1d3829ee8921c4301998c909f7829fa9ed3cbdac0d3b16af2d743aed1ba8df'
-        checkvars['SRC_URI[sha384sum]'] = '255002433fe65c19adfd6b91494271b613cb25ef6a35ac77436de1e03d60cc07bf89fd716451b917f1435e4384860ef6'
-        checkvars['SRC_URI[sha512sum]'] = 'db57ab2a25ef91e3bc479c8539d27e853cf1fbf60986820b8999ae15d7e566425a1e0cfba47d0f3b23aa703db0576db368e6c110ba2a2f46c9a34e8ee3611fb7'
-        inherits = ['python_poetry_core']
+        inherits = ['python_poetry_core', 'pypi']
 
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
@@ -566,13 +632,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars['SUMMARY'] = 'Backported and Experimental Type Hints for Python 3.8+'
         checkvars['LICENSE'] = set(['PSF-2.0'])
         checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2'
-        checkvars['SRC_URI'] = 'https://files.pythonhosted.org/packages/1f/7a/8b94bb016069caa12fc9f587b28080ac33b4fbb8ca369b98bc0a4828543e/typing_extensions-${PV}.tar.gz'
-        checkvars['SRC_URI[md5sum]'] = '74bafe841fbd1c27324afdeb099babdf'
-        checkvars['SRC_URI[sha1sum]'] = 'f8bed69cbad4a57a1a67bf8a31b62b657b47f7a3'
-        checkvars['SRC_URI[sha256sum]'] = 'df8e4339e9cb77357558cbdbceca33c303714cf861d1eef15e1070055ae8b7ef'
-        checkvars['SRC_URI[sha384sum]'] = '0bd0112234134d965c6884f3c1f95d27b6ae49cfb08108101158e31dff33c2dce729331628b69818850f1acb68f6c8d0'
-        checkvars['SRC_URI[sha512sum]'] = '5fbff10e085fbf3ac2e35d08d913608d8c8bca66903435ede91cdc7776d775689a53d64f5f0615fe687c6c228ac854c8651d99eb1cb96ec61c56b7ca01fdd440'
-        inherits = ['python_flit_core']
+        inherits = ['python_flit_core', 'pypi']
 
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
@@ -601,13 +661,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars['HOMEPAGE'] = 'https://github.com/python-jsonschema/jsonschema'
         checkvars['LICENSE'] = set(['MIT'])
         checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af'
-        checkvars['SRC_URI'] = 'https://files.pythonhosted.org/packages/e4/43/087b24516db11722c8687e0caf0f66c7785c0b1c51b0ab951dfde924e3f5/jsonschema-${PV}.tar.gz'
-        checkvars['SRC_URI[md5sum]'] = '4d6667ce76f820c35082c2d60a4896ab'
-        checkvars['SRC_URI[sha1sum]'] = '9173714cb88964d07f3a3f4fcaaef638b8ceac0c'
-        checkvars['SRC_URI[sha256sum]'] = 'ec84cc37cfa703ef7cd4928db24f9cb31428a5d0fa77747b8b51a847458e0bbf'
-        checkvars['SRC_URI[sha384sum]'] = '7a53181f0e679aa3dc3eb4d05a420877b7b9bff2d02e81f5c289a37ed1127d6c0cca1f5a5f9e4e166f089ab36bcc2be9'
-        checkvars['SRC_URI[sha512sum]'] = '60fa769faf6e3fc2c14eb9acd189c86e9d366b157230a5681d36552af0c159cb1ad33fd920668a36afdab98bc97253f91501704c5c07b5009fdaf9d29b52060d'
-        inherits = ['python_hatchling']
+        inherits = ['python_hatchling', 'pypi']
 
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
-- 
2.42.0


