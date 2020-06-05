Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.7317.1591350011130367362
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2020 02:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=b18sv7sx;
 spf=pass (domain: konsulko.com, ip: 209.85.221.68, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f68.google.com with SMTP id t18so9043159wru.6
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2020 02:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v9csNvTfuUVG5Hmv+Pp94CShAEJ/yFgFydP3H9pRZLE=;
        b=b18sv7sx26+Jm1BEEd5Ga10wbRHKQhe9bDXtT4oimx4KwHeUVdgvGcAoEagHIw2Qkj
         l9Z6I7tb5/iT+S8fpZP/u48SlxP/uLseSxGGyk+s+fHgZmDZcKirkc148A0WF3sQbQAH
         Ex9TwrDKdOFeHTelTFWNr1ULnqJf8NC0sPvq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v9csNvTfuUVG5Hmv+Pp94CShAEJ/yFgFydP3H9pRZLE=;
        b=NhmkPn2SMJNVLvUBXOCGLSVopMMblFM6vcdxBWYAcH/haZ0A5AIPi9Ze+M17riJSuc
         T8J+Z0AwZMYDnEDUz+doOQE7b86ACCwJKKwtIc515FUxeyFM1LXjOG/BYMMMJiSjMvs9
         GxxUmhP3oFYPllmE90q4n8EormoSqGZw5AyLUxFgd9iC+kJ+tey0hLMrg/R5s2dlAEPN
         IzU1UbfCB8FThYwmV9ARsM67e0evLB+PdA9wXTeCdLsAgp9GF0GTsp00cGaca5K7a1Id
         Vm7nDVOELYw44S2iRTwrt3LvqPpYikS26jrdJjV/6kJMgEaaGTJqYen+w9LVJahohFZR
         XZTA==
X-Gm-Message-State: AOAM533JOSzn6Eo80gV69b0+Zw7+ERVSILevcqzZdxsgLVEkb4vkdpQu
	paJETDHxAH9QBUYJGKC6BwmFs3lYoueZ/w==
X-Google-Smtp-Source: ABdhPJxIM5Fga8ltNmtxl669Xd6YwsPmJPJly47E2vmRT2oP3xWkertkyS3vdQpPswUvTojoEvg2Bg==
X-Received: by 2002:a5d:4008:: with SMTP id n8mr8535201wrp.82.1591350009284;
        Fri, 05 Jun 2020 02:40:09 -0700 (PDT)
Return-Path: <pbarker@konsulko.com>
Received: from ar2.home.b5net.uk ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id j5sm11283493wrq.39.2020.06.05.02.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 02:40:08 -0700 (PDT)
From: "Paul Barker" <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH 3/3] archiver: Speed up tests
Date: Fri,  5 Jun 2020 10:39:56 +0100
Message-Id: <20200605093956.6385-3-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200605093956.6385-1-pbarker@konsulko.com>
References: <20200605093956.6385-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When running tests locally without the advantage of a populated sstate
cache, the archiver tests can take an unnecessarily long time. Using
different target recipes can speed things up a lot by reducing the
number of dependencies that are built.

For the test case test_archiver_srpm_mode we can still test the
conditions described in bug #11121 by using a target recipe that is
known to inherit the nopackages class as well as a more normal recipe,
instead of having to compute all the depepndencies of core-image-sato.

Before:
    archiver.Archiver.test_archiver_allows_to_filter_on_recipe_name: PASSED (20.50s)
    archiver.Archiver.test_archiver_filters_by_type: PASSED (14.16s)
    archiver.Archiver.test_archiver_filters_by_type_and_name: PASSED (79.08s)
    archiver.Archiver.test_archiver_mode_configured: PASSED (558.19s)
    archiver.Archiver.test_archiver_mode_diff: PASSED (14.59s)
    archiver.Archiver.test_archiver_mode_dumpdata: PASSED (14.41s)
    archiver.Archiver.test_archiver_mode_mirror: PASSED (14.02s)
    archiver.Archiver.test_archiver_mode_mirror_combined: PASSED (19.99s)
    archiver.Archiver.test_archiver_mode_mirror_excludes: PASSED (14.24s)
    archiver.Archiver.test_archiver_mode_mirror_gitsm: PASSED (13.47s)
    archiver.Archiver.test_archiver_mode_mirror_gitsm_shallow: PASSED (22.15s)
    archiver.Archiver.test_archiver_mode_original: PASSED (14.15s)
    archiver.Archiver.test_archiver_mode_patched: PASSED (14.57s)
    archiver.Archiver.test_archiver_mode_recipe: PASSED (14.56s)
    archiver.Archiver.test_archiver_srpm_mode: PASSED (83.03s)
    oe-selftest () - Ran 15 tests in 911.905s

After:
    archiver.Archiver.test_archiver_allows_to_filter_on_recipe_name: PASSED (23.66s)
    archiver.Archiver.test_archiver_filters_by_type: PASSED (15.16s)
    archiver.Archiver.test_archiver_filters_by_type_and_name: PASSED (15.33s)
    archiver.Archiver.test_archiver_mode_configured: PASSED (15.94s)
    archiver.Archiver.test_archiver_mode_diff: PASSED (15.79s)
    archiver.Archiver.test_archiver_mode_dumpdata: PASSED (15.39s)
    archiver.Archiver.test_archiver_mode_mirror: PASSED (15.28s)
    archiver.Archiver.test_archiver_mode_mirror_combined: PASSED (21.22s)
    archiver.Archiver.test_archiver_mode_mirror_excludes: PASSED (15.11s)
    archiver.Archiver.test_archiver_mode_mirror_gitsm: PASSED (13.61s)
    archiver.Archiver.test_archiver_mode_mirror_gitsm_shallow: PASSED (23.21s)
    archiver.Archiver.test_archiver_mode_original: PASSED (14.87s)
    archiver.Archiver.test_archiver_mode_patched: PASSED (15.50s)
    archiver.Archiver.test_archiver_mode_recipe: PASSED (15.62s)
    archiver.Archiver.test_archiver_srpm_mode: PASSED (20.66s)
    oe-selftest () - Ran 15 tests in 257.170s

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 meta/lib/oeqa/selftest/cases/archiver.py | 30 ++++++++++++------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
index 37efed57c8..ddd08ecf84 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -19,8 +19,8 @@ class Archiver(OESelftestTestCase):
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         """
 
-        include_recipe = 'busybox'
-        exclude_recipe = 'zlib'
+        include_recipe = 'selftest-ed'
+        exclude_recipe = 'initscripts'
 
         features = 'INHERIT += "archiver"\n'
         features += 'ARCHIVER_MODE[src] = "original"\n'
@@ -51,8 +51,8 @@ class Archiver(OESelftestTestCase):
         Author:      André Draszik <adraszik@tycoint.com>
         """
 
-        target_recipe = 'initscripts'
-        native_recipe = 'zlib-native'
+        target_recipe = 'selftest-ed'
+        native_recipe = 'selftest-ed-native'
 
         features = 'INHERIT += "archiver"\n'
         features += 'ARCHIVER_MODE[src] = "original"\n'
@@ -86,8 +86,8 @@ class Archiver(OESelftestTestCase):
         Author:      André Draszik <adraszik@tycoint.com>
         """
 
-        target_recipes = [ 'initscripts', 'zlib' ]
-        native_recipes = [ 'update-rc.d-native', 'zlib-native' ]
+        target_recipes = [ 'initscripts', 'selftest-ed' ]
+        native_recipes = [ 'update-rc.d-native', 'selftest-ed-native' ]
 
         features = 'INHERIT += "archiver"\n'
         features += 'ARCHIVER_MODE[src] = "original"\n'
@@ -129,10 +129,10 @@ class Archiver(OESelftestTestCase):
         features += 'PACKAGE_CLASSES = "package_rpm"\n'
         self.write_config(features)
 
-        bitbake('-n core-image-sato')
+        bitbake('-n selftest-nopackages selftest-ed')
 
     def _test_archiver_mode(self, mode, target_file_name, extra_config=None):
-        target = "selftest-ed"
+        target = 'selftest-ed-native'
 
         features = 'INHERIT += "archiver"\n'
         features +=  'ARCHIVER_MODE[src] = "%s"\n' % (mode)
@@ -143,8 +143,8 @@ class Archiver(OESelftestTestCase):
         bitbake('-c clean %s' % (target))
         bitbake('-c deploy_archives %s' % (target))
 
-        bb_vars = get_bb_vars(['DEPLOY_DIR_SRC', 'TARGET_SYS'])
-        glob_str = os.path.join(bb_vars['DEPLOY_DIR_SRC'], bb_vars['TARGET_SYS'], '%s-*' % (target))
+        bb_vars = get_bb_vars(['DEPLOY_DIR_SRC', 'BUILD_SYS'])
+        glob_str = os.path.join(bb_vars['DEPLOY_DIR_SRC'], bb_vars['BUILD_SYS'], '%s-*' % (target))
         glob_result = glob.glob(glob_str)
         self.assertTrue(glob_result, 'Missing archiver directory for %s' % (target))
 
@@ -163,21 +163,21 @@ class Archiver(OESelftestTestCase):
         Test that the archiver works with `ARCHIVER_MODE[src] = "patched"`.
         """
 
-        self._test_archiver_mode('patched', 'selftest-ed-1.14.1-r0-patched.tar.gz')
+        self._test_archiver_mode('patched', 'selftest-ed-native-1.14.1-r0-patched.tar.gz')
 
     def test_archiver_mode_configured(self):
         """
         Test that the archiver works with `ARCHIVER_MODE[src] = "configured"`.
         """
 
-        self._test_archiver_mode('configured', 'selftest-ed-1.14.1-r0-configured.tar.gz')
+        self._test_archiver_mode('configured', 'selftest-ed-native-1.14.1-r0-configured.tar.gz')
 
     def test_archiver_mode_recipe(self):
         """
         Test that the archiver works with `ARCHIVER_MODE[recipe] = "1"`.
         """
 
-        self._test_archiver_mode('patched', 'selftest-ed-1.14.1-r0-recipe.tar.gz',
+        self._test_archiver_mode('patched', 'selftest-ed-native-1.14.1-r0-recipe.tar.gz',
                                  'ARCHIVER_MODE[recipe] = "1"\n')
 
     def test_archiver_mode_diff(self):
@@ -186,7 +186,7 @@ class Archiver(OESelftestTestCase):
         Exclusions controlled by `ARCHIVER_MODE[diff-exclude]` are not yet tested.
         """
 
-        self._test_archiver_mode('patched', 'selftest-ed-1.14.1-r0-diff.gz',
+        self._test_archiver_mode('patched', 'selftest-ed-native-1.14.1-r0-diff.gz',
                                  'ARCHIVER_MODE[diff] = "1"\n')
 
     def test_archiver_mode_dumpdata(self):
@@ -194,7 +194,7 @@ class Archiver(OESelftestTestCase):
         Test that the archiver works with `ARCHIVER_MODE[dumpdata] = "1"`.
         """
 
-        self._test_archiver_mode('patched', 'selftest-ed-1.14.1-r0-showdata.dump',
+        self._test_archiver_mode('patched', 'selftest-ed-native-1.14.1-r0-showdata.dump',
                                  'ARCHIVER_MODE[dumpdata] = "1"\n')
 
     def test_archiver_mode_mirror(self):
-- 
2.26.2

