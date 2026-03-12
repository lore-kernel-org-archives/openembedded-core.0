Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F620106705C
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 15:39:03 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24664.1773329937720964021
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 08:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nChQGFYo;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439aeed8a5bso1247499f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 08:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773329936; x=1773934736; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zYp17iBPaoPjczXO5fSA5dfgjKxYkDwyVIKWeVby3wk=;
        b=nChQGFYoU1itVl3Xk2Up6BBydMlbSeoyHmu8MZrFXSVT7KmEaVjAzdoq91gog6JoGw
         pqR0cKUmXERLZ6QZHK1orEoVIDvKMYzYFnqUJHNVYu62B83fwbVhw29WM171j11MqY8G
         SvLBerRLMo90g+JJS5ah1Suc+t8fjBpQVGRyeUe6xU35ayN+VHNTufQX1scKt3vW7oJ/
         oXq20XQ572wYQ2rM0wQ8YSMk5fBFcLXhqjm5NWV+iIfuVAIyG0DQJILhDdoJFQ6NZWwd
         GAugMQFmrlAVJnUJtf+M3eFGGkQUCLkjJQ4AiGpAVjxwiOcrL0SAADJMxRI2dgwiLNiB
         IoKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773329936; x=1773934736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zYp17iBPaoPjczXO5fSA5dfgjKxYkDwyVIKWeVby3wk=;
        b=JI53KridVrSPp28PfhiQVdlB8SnTom1KGzr/pPAczPiFiTdWfuOTiudCHw2lFvAP5/
         ifxJwCRoJq4Kun02lE8MDSUr8fpbj/jSKjTihw9RtMCZRoQ9UViT/sMyIp2/0eGX4kek
         xvqjTVMQHeLSD1hpPTdAQwr25iTh/W6xcNRp65U+k+Eh+VODaRxEBlGHYRVEByahrvE4
         /u5ImCZzRyl0xjzQoFQNc7T+pchpT1frVbk0uSgrMA/5UO6QIiYf3DcQiMKvFTOFr/WJ
         B7GSGzElB7yadG53nOyvKLtIciWJ4RiRuOAbP7dZSXdyIuG9ZWBXx0kdmiHKcc0x7e+j
         ZCrg==
X-Gm-Message-State: AOJu0YzZvAynY+5OXFrXcxBEF+amQiC2O7YWvCjDjp2J4TJAVjhZy4lV
	m58BZ6XMgIupYdPgYi+f3VQ9NXOx+M5NZXfp7YApIwX70v8gIZ3G9tKSqaQ6uA==
X-Gm-Gg: ATEYQzy4PpziG2sLnFgt2PWXFxEBUGtaTKpmqpMVe7YWGomBPYyiQUb3uiPC8xe9Jof
	6LI2M92ErRkOlrp+o354Gt0+aGKuvUldcLfgtsIe4IRWvsumCqTl+9itC50LFH4PpLfYjPvmGUo
	2gQYnqldKE/QrzkZRfUWEFEfuUgfPvJwFRgfoD8K5PB/LWLT1DE8I+EbhrdZaFu/K1Kj9kDqqX8
	4Ouq1ezr2Ph48rWuejbTNCtaefEArSL9xEMLC/ltVGjguSIg93bLkmBc/0VXya5G0+Mk7gJ77KB
	m37Vm5BWxFA9Yacqj0DdyvXHUeby2VJ0tQI8jJJa+p/KLQPYcj77qnV9IJlzxnb5tfPkZPH8AVv
	gKmww+CVMlqdsf+CARRG3c5dlvdWbm6yTWcvohcq4W7FmIo+6etUbV7qQVTH5IhMHyeFdm1Q4oo
	GsG9iohmsgphr87vntOw5+ZgNeyhy19qlN9bw=
X-Received: by 2002:a05:600c:46d2:b0:485:38fc:7080 with SMTP id 5b1f17b1804b1-4854b10ef23mr107245975e9.28.1773329935404;
        Thu, 12 Mar 2026 08:38:55 -0700 (PDT)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0dcf2asm74857385e9.8.2026.03.12.08.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:38:54 -0700 (PDT)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Subject: [OE-core][PATCH v9 5/7] oeqa/selftest: Add tests for source download enrichment
Date: Thu, 12 Mar 2026 16:38:43 +0100
Message-ID: <20260312153845.164369-6-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312153845.164369-1-stondo@gmail.com>
References: <20260309132854.128375-1-stondo@gmail.com>
 <20260312153845.164369-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 15:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232978

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
 meta/lib/oeqa/selftest/cases/spdx.py | 71 +++++++++++++++++++++++++++-
 1 file changed, 70 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index 41ef52fce1..859667dd6b 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -392,7 +392,7 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
     def test_packageconfig_spdx(self):
         objset = self.check_recipe_spdx(
             "tar",
-            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/recipes/recipe-tar.spdx.json",
+            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/recipes/build-tar.spdx.json",
             extraconf="""\
                 SPDX_INCLUDE_PACKAGECONFIG = "1"
                 """,
@@ -414,3 +414,72 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
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
+            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/recipes/build-m4.spdx.json",
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
+        Verifies that version patterns correctly extract versions from
+        tarball sources and that all packages have proper version strings.
+        """
+        objset = self.check_recipe_spdx(
+            "tar",
+            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/recipes/build-tar.spdx.json",
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


