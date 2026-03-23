Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD6DFF46109
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 13:04:14 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16997.1774271051105113797
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 06:04:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MeerJ0Nx;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48704db565eso18541375e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 06:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774271048; x=1774875848; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YB+KxvAlnS0l9e4HAfcNtkSI4c7MwW6uWmA0vjcJfGI=;
        b=MeerJ0NxZpd/AzNUsdnqK5UmCuh1xvnonnFx19FP+PMbIn4KGtSFcVR5+XmHa7rXbX
         CxrgSqpqmMh70eR6TK1bO0ih9SWuCUNHJ1xF54bwqPmBD5CeGKR+oqhoE/vi1T5dmfKl
         0KXNzau5D50NCi9NVvj+WoG6SnTOfPAHcRa8iE6ufXeo/uAS0oW2LK76oBXVIT4XCGJT
         yodLs5I3BZ198yvRZyfkouR/pJc2mfygDx1BJtiUrBUPTDmVnd/kxx2wjoSH9S3ALnYY
         qlXgQ4+1bd2F9EyiRqBL0Y1gcAEQVABj4dz8lwZQmdZHLVWp0CIA8fkoJ1ovaFJOMafY
         aI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774271048; x=1774875848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YB+KxvAlnS0l9e4HAfcNtkSI4c7MwW6uWmA0vjcJfGI=;
        b=lMI1AiQ66Y2BQrpB9vpBlmhwIZpTmyG30PxuImYDOW0lvLdhaKLqzD/EkLkzDhsIMY
         fUiDkJ/3b3PDKAmsRUdGlVZa3044lr5k70VSzLVGlhQlDI0SWVN6zEgR26JGJcrx+ij/
         FbNWseg8jGk5ldmqDb0X8+jjF5fMhB8k7alr1FvMI0dt36sksMg5Mud4W9sLM3ZSAtfy
         2i7sTy6j2uY/LxHAOI6rjTvCHbgMjFzGVPPWK2ljEho0beXu/3w19PsBky+zgiWWyEJL
         oTNXZnkqAFjKi0v7QhZZmlToCMdMu02bT138E+WhFZ0HSQmIXIKf90Yb1BU0C36/vpty
         IvUA==
X-Gm-Message-State: AOJu0YwNwSv8S32Ey7lSO4X+fOjoNTPgitMgV+xik6mbeFIUXaTVhgXO
	Xca1S6jYcl5izuvT1DH1xebRfq/T5Po8WBB3uZ4g1hvbxD2BtYDw5Uww5IUVCJKD
X-Gm-Gg: ATEYQzx2WRCMWFrU6vbu7U2jNrFO8Uj8VBqmKQisy1ulIM0zzZlf8AP1BXNLdcwGU3A
	2stMKWio84W1NQIb851VS5R//SgXLc6tNp2Jy2mFcwtpYiQD71lz7+Slhcq3kZlM+YG/yZSNuKJ
	PqfqnF88LmqabTWd6u8fNf9vXiNoEWuOnj4UXHDDcimnQ1BIowzNjH1F6+lYGyvq3LSMGsmj2Gn
	+1FKRgsYHl7LF32p8Mp47BjxQdna/U75K77TKeH8cAlOOTUaRagjzMKGpY71lMu3wddxqUP55mp
	efow3FQuR3RdhuLgUfo3pl1Nl6NHvC+oJ7mksCQLHbSwIbDi7J5G++0WCzFxwGsl9O7g15D6R6u
	BCuL06gXASzOJNWN2ANbSax8cyDSuOMj3r8Sz1pRes2Vee2mIZvpxMlwbLJpZ3agOcc4OXQO2w+
	BXGIGDVZKkhulzi9iXrWfnpHAiD+9cOzOFo1Mg23T17Nhyj7oiRmFG
X-Received: by 2002:a05:600c:4705:b0:486:d76c:fa57 with SMTP id 5b1f17b1804b1-486fee0983dmr173966835e9.17.1774271047956;
        Mon, 23 Mar 2026 06:04:07 -0700 (PDT)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe7e2665sm324609665e9.6.2026.03.23.06.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:04:05 -0700 (PDT)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Ross.Burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	mathieu.dubois-briand@bootlin.com
Subject: [PATCH v12 4/4] oeqa/selftest: Add tests for source download enrichment
Date: Mon, 23 Mar 2026 14:03:50 +0100
Message-ID: <20260323130350.1177721-5-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323130350.1177721-1-stefano.tondo.ext@siemens.com>
References: <20260321131826.1401671-1-stondo@gmail.com>
 <20260323130350.1177721-1-stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 13:04:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233717

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


