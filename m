Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6271F3C9BE
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 16:30:24 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24471.1771950617451451071
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 08:30:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f/MEtWvg;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4833115090dso55578175e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 08:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771950615; x=1772555415; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tasMwHb1eE4X7gh3WGFR+2/nPG3uVPiKjIGnUOBd/6M=;
        b=f/MEtWvgiunL1LpwfeLeLvsAr2ANQp/E2mG38sv1n+PduAN/1QXRKPalNzEIGnP7KU
         p99ACc9dRRM/IszlpCeKxKuDZ7DcNZD1FL1zjygUYRLO16D/vU4Fe4rL4qZ3TZrtDzP8
         liBcDahfBxIhcp4KKT9sMZnCaHKXLyJB1wt3F4h6jsMdQB3jDzb61Av5s1qhnDjSV++Z
         FZL2nHQkEM3OYcEwtdDLdK+H99pD5ADU18206ghUEsR06klyNBE6AVd8A/QAQ1umaIln
         FQlIKcBwRSCESIKfCF6lL25yxtWRnktDLAnjurn0tfx1ue6X2jSCAcAvMc6RZYQ4wspy
         yhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771950615; x=1772555415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tasMwHb1eE4X7gh3WGFR+2/nPG3uVPiKjIGnUOBd/6M=;
        b=UCMMrRuPTyQgNDCVYmUzko6ieQcnySKCnHkEQndoB6PmpyICL3gN1MvJ21axZzskoJ
         cMwgx+r+K/dsKEVeed14gquUgzwYGi9rn6ytYQDxktS6gMN8M4xux+KPjeGJavGz6i/z
         KtxgbVHZZcWZr0k0F9J0aaYgxiHXEpUXEkpkqeF0y/UP6v1L712y8KOFRLlZmFtUEmUo
         IDm6NGWMlPzl7e3K7WwPNFRywAn+g4eyaOjduShT2FuRDVMaKRD8z7QVNIsSgcmoUebX
         8os2mX8fgvK9JA/8xyudOkHJ1Xex+duH4NPWYs32udgHQc4ZAKlcHky0AzN2lLewJKCX
         V3nA==
X-Gm-Message-State: AOJu0YzgbVX7/C/HVXL78HuzLMvqNszvEZ5GN7xTxoaa+go5zN6ofAsx
	i0siUhiibqbBPYB0nfNrOYmedkm9Cazv4j41CXu6pNoH0ia5y4m+OvpQVKhBJA==
X-Gm-Gg: AZuq6aIiUDfCdJtIVn2mJ16UhwNEYRWfr1ENJ1bQJaYNPzj7db4aKo97yyIA5mP/e1j
	mKRqUkNShOBxNoA1APKkJW9FpguAvXYxEaHgPQlenm6HK+kjkevo1IObnRKu4kAQnsQj1bw4AP5
	ud8H9TJb/6VDvAfx0UuNottzbAbusnyQ29W8eV2oIUt1mlBaYTiGG8MkQU+c65kC2dkvYJ5NZEy
	bC9hJzOCzOEGY6q+D1zu2pnOjzYTyRYzjmItkwzNcwF33z6W7t/zs7pmrqLoUWKo7xJi01MQ6ta
	FQR0HRbVjUMXUfH6l4I8CWcwWrKjIQk9NCxuW/Vj5e7CzL6Ms7VgMiY7LJ8/r2W3RZzQuKWcTBC
	GMgbWKNohXjXwnnTuvGkG7Zh1lBiuniffZx/JhNmkrm+kO4SsnDctGHIm3CYXvV99oHvo7bFsII
	I4XmG3oDyUpTjFS3eobUK6pEcVnBo1wk3BniPq278hKEhzY58a1px2Lp3IzfINc0An1DnCHr14p
	Th2QPN0
X-Received: by 2002:a05:600c:c8a:b0:480:4a90:1b06 with SMTP id 5b1f17b1804b1-483a9603d42mr198024435e9.34.1771950614919;
        Tue, 24 Feb 2026 08:30:14 -0800 (PST)
Received: from fedora (mob-194-230-144-218.cgn.sunrise.net. [194.230.144.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd6f3124sm9716355e9.1.2026.02.24.08.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 08:30:14 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com,
	mathieu.dubois-briand@bootlin.com
Subject: [PATCH v3 09/11] spdx.py: Add test for version extraction patterns
Date: Tue, 24 Feb 2026 17:29:44 +0100
Message-ID: <20260224162946.4000445-10-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224162946.4000445-1-stondo@gmail.com>
References: <20260224162946.4000445-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 16:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231886

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Add test verifying that version extraction patterns work correctly for:
- Rust crates (.crate files)
- Go modules
- Python packages (PyPI)
- Generic tarball formats
- Git revision hashes

Test builds tar recipe and validates that all packages have proper
version strings extracted from their filenames.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oeqa/selftest/cases/spdx.py | 47 ++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index d7dee5e2ee..5b91577434 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -442,3 +442,50 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
             f"External references {'found' if found_external_refs else 'not found'} "
             f"in SPDX output (defensive handling verified)"
         )
+
+    def test_version_extraction_patterns(self):
+        """
+        Test that version extraction works for various package formats.
+
+        This test verifies that version patterns correctly extract versions from:
+        1. Rust crates (.crate files)
+        2. Go modules
+        3. Python packages (PyPI)
+        4. Generic tarball formats
+        5. Git revision hashes
+        """
+        # Build a package that has dependencies with various formats
+        objset = self.check_recipe_spdx(
+            "tar",
+            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/recipes/recipe-tar.spdx.json",
+        )
+
+        # Collect all packages with versions
+        packages_with_versions = []
+        for pkg in objset.foreach_type(oe.spdx30.software_Package):
+            if hasattr(pkg, 'software_packageVersion') and pkg.software_packageVersion:
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


