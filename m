Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9362EC4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 09:37:35 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.8033.1707471445952325085
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 01:37:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gC0WWcdd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51165a488baso905434e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 01:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1707471444; x=1708076244; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rjqh2BkVF2vIITFyXHKHWmMNQmqrYTgHKw9RVuzECIk=;
        b=gC0WWcddhUpuv8bDpO4WNK0nCDBfSg2o0Gbumnn07pr4LXu4CUbLD3bUZ7e//r/dtg
         TaH6ID+NZtqmpJfjVOf35Jgo9VTLAntUfynEwLtEwwcL4RTzqG/a45LwpEJEq7LB7tit
         +CAzo4RZKuTIjqa0Ci2pqxRSzvuLCTDR+YJAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707471444; x=1708076244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rjqh2BkVF2vIITFyXHKHWmMNQmqrYTgHKw9RVuzECIk=;
        b=gwdvd9h7z8cJkUmy6OLuU6hA90Kh0oG6fYRjutCecnQgJrLleLDUSdi43OYnuRnbSO
         mvt2xCnvVQ38QDOgI1ZYL3HHDVI0fDgG33F62AAbWsw2wf+MmvZlI4WpGF9BST2nIxQC
         HuwBKwfy7Ypjx6NdVM8zCOkYhYgKoOmPmUEtNibRteI68rvApRb/sKvKBKZy680Ur0HD
         6dZt7+MnobE6dsrRQRieKkjni09AKKN3AiklPAkn7cmD1D7QcZV8x7rqyqN9gAGgw+9C
         H+/nYPxdFPbOmD/LByDbn7yT8toGnFPtdy5If5MBN/skFoLHakDKYnWGOfjKubr8f0VU
         LakQ==
X-Gm-Message-State: AOJu0Ywv0LyBxtv9FWbyAmKnVQ2n1tTaPGsTA6LtErVd0fMqmWhBa3VP
	k6ix0T26IEBmFLtTMomuuWJO2DA0/Box3sUJpJlsIiKqu7uRrvvqpKoZfOQQ/zu0qk/fz+ySmbL
	r
X-Google-Smtp-Source: AGHT+IH75vjW65D6qcJ4sC2Z1Je3GKxD0za3+v1UjbWqjxkeCZlHDnwOS8jkdEA7bwP708q1IPdI2A==
X-Received: by 2002:ac2:5551:0:b0:511:3c74:cd1c with SMTP id l17-20020ac25551000000b005113c74cd1cmr629342lfk.23.1707471443322;
        Fri, 09 Feb 2024 01:37:23 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:47e1:ee11:154c:e6b3])
        by smtp.gmail.com with ESMTPSA id g12-20020a5d554c000000b0033b5ee36963sm1330764wrw.23.2024.02.09.01.37.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 01:37:22 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] selftest/recipetool: Factor tomllib test to a function
Date: Fri,  9 Feb 2024 09:37:20 +0000
Message-Id: <20240209093722.3363011-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 09:37:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195192

As more tests start to need this codeblock, factor it into a common function.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 65 +++++++---------------
 1 file changed, 20 insertions(+), 45 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 39114c67622..780e25b6c82 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -28,6 +28,16 @@ def tearDownModule():
     runCmd('rm -rf %s' % templayerdir)
 
 
+def needTomllib(test):
+    # This test require python 3.11 or above for the tomllib module or tomli module to be installed
+    try:
+        import tomllib
+    except ImportError:
+        try:
+            import tomli
+        except ImportError:
+            test.skipTest('Test requires python 3.11 or above for tomllib module or tomli module')
+
 class RecipetoolBase(devtool.DevtoolTestCase):
 
     def setUpLocal(self):
@@ -554,15 +564,8 @@ class RecipetoolCreateTests(RecipetoolBase):
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
     def test_recipetool_create_python3_pep517_setuptools_build_meta(self):
-        # This test require python 3.11 or above for the tomllib module
-        # or tomli module to be installed
-        try:
-            import tomllib
-        except ImportError:
-            try:
-                import tomli
-            except ImportError:
-                self.skipTest('Test requires python 3.11 or above for tomllib module or tomli module')
+        # This test require python 3.11 or above for the tomllib module or tomli module to be installed
+        needTomllib(self)
 
         # Test creating python3 package from tarball (using setuptools.build_meta class)
         temprecipe = os.path.join(self.tempdir, 'recipe')
@@ -583,15 +586,8 @@ class RecipetoolCreateTests(RecipetoolBase):
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
     def test_recipetool_create_python3_pep517_poetry_core_masonry_api(self):
-        # This test require python 3.11 or above for the tomllib module
-        # or tomli module to be installed
-        try:
-            import tomllib
-        except ImportError:
-            try:
-                import tomli
-            except ImportError:
-                self.skipTest('Test requires python 3.11 or above for tomllib module or tomli module')
+        # This test require python 3.11 or above for the tomllib module or tomli module to be installed
+        needTomllib(self)
 
         # Test creating python3 package from tarball (using poetry.core.masonry.api class)
         temprecipe = os.path.join(self.tempdir, 'recipe')
@@ -612,15 +608,8 @@ class RecipetoolCreateTests(RecipetoolBase):
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
     def test_recipetool_create_python3_pep517_flit_core_buildapi(self):
-        # This test require python 3.11 or above for the tomllib module
-        # or tomli module to be installed
-        try:
-            import tomllib
-        except ImportError:
-            try:
-                import tomli
-            except ImportError:
-                self.skipTest('Test requires python 3.11 or above for tomllib module or tomli module')
+        # This test require python 3.11 or above for the tomllib module or tomli module to be installed
+        needTomllib(self)
 
         # Test creating python3 package from tarball (using flit_core.buildapi class)
         temprecipe = os.path.join(self.tempdir, 'recipe')
@@ -641,15 +630,8 @@ class RecipetoolCreateTests(RecipetoolBase):
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
     def test_recipetool_create_python3_pep517_hatchling(self):
-        # This test require python 3.11 or above for the tomllib module
-        # or tomli module to be installed
-        try:
-            import tomllib
-        except ImportError:
-            try:
-                import tomli
-            except ImportError:
-                self.skipTest('Test requires python 3.11 or above for tomllib module or tomli module')
+        # This test require python 3.11 or above for the tomllib module or tomli module to be installed
+        needTomllib(self)
 
         # Test creating python3 package from tarball (using hatchling class)
         temprecipe = os.path.join(self.tempdir, 'recipe')
@@ -671,15 +653,8 @@ class RecipetoolCreateTests(RecipetoolBase):
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
     def test_recipetool_create_python3_pep517_maturin(self):
-        # This test require python 3.11 or above for the tomllib module
-        # or tomli module to be installed
-        try:
-            import tomllib
-        except ImportError:
-            try:
-                import tomli
-            except ImportError:
-                self.skipTest('Test requires python 3.11 or above for tomllib module or tomli module')
+        # This test require python 3.11 or above for the tomllib module or tomli module to be installed
+        needTomllib(self)
 
         # Test creating python3 package from tarball (using maturin class)
         temprecipe = os.path.join(self.tempdir, 'recipe')
-- 
2.40.1


