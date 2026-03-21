Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D111094478
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 13:18:46 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10734.1774099117073826440
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Mar 2026 06:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hhi0wO4t;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439b9b1900bso1034372f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 06:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774099115; x=1774703915; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJGjlZk+lQ6hqbjoAMdFdAu77PRpfbXHdukv1GxGEv4=;
        b=hhi0wO4t7ddffw9Tf0ESm0EfwQeMNtISrZLkKgBFztp+gcyjABUa/wC5BHyxIzjKzk
         3qlgzWtG0cvhGUtTsaqeZqyVLUnQC6cHTdG2F1OIy9+Q6o6aNrnLEQHxHLyYaT4j++bj
         zPa12LjZ1BgMAV/lFvOvm+NOgA4AkUeqTMEapH/8qHvhqooPdpYaNRobAidw0i5yVegl
         CWs5OUcw56Za6wgl51UAd4o8leM/UFedBWjM8R1YS6kOPmkiZ4fzKcNO0XXraRVBE6ni
         jwO2vrwXN42mUrm6aeFHCBpqfyXEEF2tBpLnVH0AuhfMjk0d9g9wcI8YVxRTZEb9Pa3L
         cQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774099115; x=1774703915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EJGjlZk+lQ6hqbjoAMdFdAu77PRpfbXHdukv1GxGEv4=;
        b=AMeKZT9EQah9PyrQ9UQaH5CxhlIZenKw736Bw9Acyxw02TqRD8JNI0PFpPK8GY0sqj
         /CZlHz/uduv7OY4phEQMnh4O7F2ppSYO7b59hiSYfd7edmORzaBgthivfLZfoSVwDqFO
         FuFcMg95e3yBt49ETQPNods/0msKt6kiJr2FEmr6bwquouIPqq1hCCUqjvaduOhkyyWJ
         2iQ035msZIumpHH9aszXyWKBFEk/PQjNELFy8sEufh2m5SZWENBSsf6kil2rdoPxKpOs
         yKG0X93LdmaVao9/5DJdOuOHo17xI+UroKc6vNPLE/Xig3xdSJqcKMYArrgXjtwIEHgY
         U77g==
X-Gm-Message-State: AOJu0Yxk5E2Z8lbL487QrUb9ig1SzxWaXlAslp2aFem25k828kF4uf2E
	rQXJOLTuFxJBEhnBGdf2b9rHGVhwWMzJdJbpAwuYKfKfT7kmczRYAebBKpWy+aQU
X-Gm-Gg: ATEYQzxPDBlUfL0mHeobkRKiT4luDeneANajpVqmKKyJzwBW7SOaUHeX09xPyQAMDzd
	ggqkX9CohLyaH2P9ymjLMGcdgGcbbZyWRyfaJH7MOjLOVOOTNjOYSc7Oz25TYKtkA0D/OR/wh+m
	mupbonqYyipccpzlmoII/OrpGU6nVAVe7YBzWe9OCIXueb8crvwh9zKlOMAVaj6xPxO8ByQfHXk
	mUqp1oSQZv/qySX2bJ8PynhhXw9T6A7Osj3XKMZsiFU2uyuYRUyJ6SSj1Y7UWBHegYr6raCLNgg
	cUygHal9q2VLmmVXaRw5z4vPs8x9PGHDtUQCnc7B/Px05P0ih/8yAns5Hg4e/9I600brej7CJjO
	0D2yad1egDXTbAU5JhSh1mNjCKn8EIqnr8mCIDfiXImFHeU6QIQosEVn0tQldBWCG+THkC8+QiN
	bbpONg30lHpN+wzy6/12fFrpLcDxJw2wPonqI=
X-Received: by 2002:a05:6000:2003:b0:43b:5761:f232 with SMTP id ffacd0b85a97d-43b642819d6mr10564851f8f.43.1774099115065;
        Sat, 21 Mar 2026 06:18:35 -0700 (PDT)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bf1c5sm15004285f8f.14.2026.03.21.06.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 06:18:34 -0700 (PDT)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	mathieu.dubois-briand@bootlin.com
Subject: [OE-core][PATCH v11 4/4] oeqa/selftest: Add tests for source download enrichment
Date: Sat, 21 Mar 2026 14:18:26 +0100
Message-ID: <20260321131826.1401671-5-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260321131826.1401671-1-stondo@gmail.com>
References: <20260321131826.1401671-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 13:18:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233661

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Add two new SPDX 3.0 selftest cases:

test_download_location_defensive_handling:
  Verifies SPDX generation succeeds for recipes with tarball sources
  and that external references are properly structured (ExternalRef
  locator is a list of strings per SPDX 3.0 spec).

test_version_extraction_patterns:
  Verifies that version extraction works correctly and all source
  packages have proper version strings containing digits.

These tests validate the source download enrichment added in the
previous commit.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oeqa/selftest/cases/spdx.py | 104 +++++++++++++++++++++------
 1 file changed, 83 insertions(+), 21 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index af1144c1e5..140d3debba 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -141,29 +141,15 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
     SPDX_CLASS = "create-spdx-3.0"
 
     def test_base_files(self):
-        self.check_recipe_spdx(
-            "base-files",
-            "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/static/static-base-files.spdx.json",
-            task="create_recipe_spdx",
-        )
         self.check_recipe_spdx(
             "base-files",
             "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/packages/package-base-files.spdx.json",
         )
 
-    def test_world_sbom(self):
-        objset = self.check_recipe_spdx(
-            "meta-world-recipe-sbom",
-            "{DEPLOY_DIR_IMAGE}/world-recipe-sbom.spdx.json",
-        )
-
-        # Document should be fully linked
-        self.check_objset_missing_ids(objset)
-
     def test_gcc_include_source(self):
         objset = self.check_recipe_spdx(
             "gcc",
-            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/builds/build-gcc.spdx.json",
+            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/recipes/recipe-gcc.spdx.json",
             extraconf="""\
                 SPDX_INCLUDE_SOURCES = "1"
                 """,
@@ -176,12 +162,12 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
             if software_file.name == filename:
                 found = True
                 self.logger.info(
-                    f"The spdxId of {filename} in build-gcc.spdx.json is {software_file.spdxId}"
+                    f"The spdxId of {filename} in recipe-gcc.spdx.json is {software_file.spdxId}"
                 )
                 break
 
         self.assertTrue(
-            found, f"Not found source file {filename} in build-gcc.spdx.json\n"
+            found, f"Not found source file {filename} in recipe-gcc.spdx.json\n"
         )
 
     def test_core_image_minimal(self):
@@ -319,7 +305,7 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
         # This will fail with NameError if new_annotation() is called incorrectly
         objset = self.check_recipe_spdx(
             "base-files",
-            "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/builds/build-base-files.spdx.json",
+            "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/recipes/recipe-base-files.spdx.json",
             extraconf=textwrap.dedent(
                 f"""\
                 ANNOTATION1 = "{ANNOTATION_VAR1}"
@@ -374,8 +360,8 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
 
     def test_kernel_config_spdx(self):
         kernel_recipe = get_bb_var("PREFERRED_PROVIDER_virtual/kernel")
-        spdx_file = f"build-{kernel_recipe}.spdx.json"
-        spdx_path = f"{{DEPLOY_DIR_SPDX}}/{{SSTATE_PKGARCH}}/builds/{spdx_file}"
+        spdx_file = f"recipe-{kernel_recipe}.spdx.json"
+        spdx_path = f"{{DEPLOY_DIR_SPDX}}/{{SSTATE_PKGARCH}}/recipes/{spdx_file}"
 
         # Make sure kernel is configured first
         bitbake(f"-c configure {kernel_recipe}")
@@ -383,7 +369,7 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
         objset = self.check_recipe_spdx(
             kernel_recipe,
             spdx_path,
-            task="do_create_spdx",
+            task="do_create_kernel_config_spdx",
             extraconf="""\
                 INHERIT += "create-spdx"
                 SPDX_INCLUDE_KERNEL_CONFIG = "1"
@@ -428,3 +414,79 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
                 value, ["enabled", "disabled"],
                 f"Unexpected PACKAGECONFIG value '{value}' for {key}"
             )
+
+    def test_download_location_defensive_handling(self):
+        """Test that download_location handling is defensive.
+
+        Verifies SPDX generation succeeds and external references are
+        properly structured when download_location retrieval works.
+        """
+        objset = self.check_recipe_spdx(
+            "m4",
+            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/builds/build-m4.spdx.json",
+        )
+
+        found_external_refs = False
+        for pkg in objset.foreach_type(oe.spdx30.software_Package):
+            if pkg.externalRef:
+                found_external_refs = True
+                for ref in pkg.externalRef:
+                    self.assertIsNotNone(ref.externalRefType)
+                    self.assertIsNotNone(ref.locator)
+                    self.assertGreater(len(ref.locator), 0, "Locator should have at least one entry")
+                    for loc in ref.locator:
+                        self.assertIsInstance(loc, str)
+                break
+
+        self.logger.info(
+            f"External references {'found' if found_external_refs else 'not found'} "
+            f"in SPDX output (defensive handling verified)"
+        )
+
+    def test_version_extraction_patterns(self):
+        """Test that version extraction works for various package formats.
+
+        Verifies that Git source downloads carry extracted versions and that
+        the reported version strings are well-formed.
+        """
+        objset = self.check_recipe_spdx(
+            "opkg-utils",
+            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/builds/build-opkg-utils.spdx.json",
+        )
+
+        # Collect all packages with versions
+        packages_with_versions = []
+        for pkg in objset.foreach_type(oe.spdx30.software_Package):
+            if pkg.software_packageVersion:
+                packages_with_versions.append((pkg.name, pkg.software_packageVersion))
+
+        self.assertGreater(
+            len(packages_with_versions), 0,
+            "Should find packages with extracted versions"
+        )
+
+        for name, version in packages_with_versions:
+            self.assertRegex(
+                version,
+                r"^[0-9a-f]{40}$",
+                f"Expected Git source version for {name} to be a full SHA-1",
+            )
+
+        self.logger.info(f"Found {len(packages_with_versions)} packages with versions")
+
+        # Log some examples for debugging
+        for name, version in packages_with_versions[:5]:
+            self.logger.info(f"  {name}: {version}")
+
+        # Verify that versions follow expected patterns
+        for name, version in packages_with_versions:
+            # Version should not be empty
+            self.assertIsNotNone(version)
+            self.assertNotEqual(version, "")
+
+            # Version should contain digits
+            self.assertRegex(
+                version,
+                r'\d',
+                f"Version '{version}' for package '{name}' should contain digits"
+            )
-- 
2.53.0


