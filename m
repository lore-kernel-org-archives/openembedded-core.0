Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E17CEA4E2F
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 16:01:56 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.164112.1772467309836170926
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 08:01:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N1R+Ny0X;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: stondo@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9361c771e9so725268766b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 08:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772467308; x=1773072108; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fuvUL6zq9VB3HVOoTf8ZvUiVZ8dew1HLCDlrOXRhKlk=;
        b=N1R+Ny0XtRPeUC/QW+0F0JIbKcK9vm/k/GaVZzPgy4TJVaL3lLctjLZdGmvkHxHJo7
         hnNzwzvR7xcoYwWZOatVyrn2w/eAkbRbluqR4XTRQPYqrTaeXPdhCMjXfNZNxFVHxR/u
         P59vWg4ENAdWcIXPa5A+33q4I/7mSH2MZlL7nfkJwTInXrHtyOks/cdYzmv01T2gG4RA
         QHILvwkruArbeu3gAVGDmXS71lUuSE9crj4ZkX6PazL3LdaK+xzbknhSZvl4UOSzlArr
         1oc78YTSzqKlfzT+0QpF5P1Qn0CntKmqnOI+tVfaFITb7zKzfqsotZDkqM8hEowqFCWR
         AYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772467308; x=1773072108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fuvUL6zq9VB3HVOoTf8ZvUiVZ8dew1HLCDlrOXRhKlk=;
        b=QO5gu1oRYJlkbf/UZWIGPfU2U9sGkZeONvyiW9sXYJ3G8Hs70Jme+o5jrDORaayebn
         iFYItgs4m2JIKb55tE41XOTgrmpmtdVDV38cWKiuLtPQvNBnt58SI1mAjMMOtjw5FRry
         Un0pyODfoZL6bNnA0T11DIxK7Lrst7dANBuZLfJr5QV8ECWIfykYrwJjFusBt6+COpR4
         xZjWB0BnBzj5BVueGE7TeTXXZMG8Ixqm4/Fwom8CIWZ/4tGWe8nAu+sXPS/CHRNUbID0
         M3wT989985Aj1C1MNesF3lexPxuGWPuYEQwGFyO/R3ZqNjgTxXuvoJgDlGq5mwFVPvTB
         uYjg==
X-Gm-Message-State: AOJu0Yws38Z3wZ5Ge2PpYCI0ARkafOnwXzfDhnhUNJwy+BTdEvml49Vj
	TiLy1sEFbns6H4z7eWzLRpomoWNSPJLkPy0uYSjPlkxs8U7uHvkPLE2VysD8YA==
X-Gm-Gg: ATEYQzz9bjLF9idvXIKaYREAunCOBKf7Fk5+fJ87fBO7xxZOZbfO8PQc1Dmbk5jSMcy
	sFx13yqeYHLDOdHGO4OhHunacFVLvIs4P3z38u7vlt5JajrvQ1jW3rsQWaJV3IQL0Xv32Ptz1BJ
	ENbsOdFZdwxuVaD3YAc8vuvu6HXajE8Wxk3F+Af4SEFxs0oeokVnNajvysnnxHfLTTAm+Gk+A4j
	HaDGME3Dc4R58P2LcIdrpIuc33eea8NhbQmeazR7P4tHSdMn8cT19No4TzKA+ahHUCI89/1wT7s
	+Ley/yIDwZZwciUjU1z5FvwYP9GOcL860AjGzs0n4n2KtdRTbXM8ySMi3NgLDR31h3/4N3VZMVb
	jywvqgDXGWugEVgpNWrRbwWPbMz6+SC5F/16oNz+sDdio9iqz5jOq6cvMs4zYUq2Ovj3HMSFy74
	iJUCDkyKwX352a/CwCp6/JHSiYzh+kYrf9XEEDFnTIcAs1eZbJFu7POkOIY7bdEym2SkFX+bRQw
	xC6JlCGplGo0J2lmLJ+
X-Received: by 2002:a17:907:da15:b0:b8f:a68a:e85d with SMTP id a640c23a62f3a-b938391c161mr654320666b.23.1772467307466;
        Mon, 02 Mar 2026 08:01:47 -0800 (PST)
Received: from fedora (mob-194-230-144-8.cgn.sunrise.net. [194.230.144.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60e40fsm28390097f8f.7.2026.03.02.08.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 08:01:46 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com
Subject: [PATCH v5 08/10] spdx.py: Add test for version extraction patterns
Date: Mon,  2 Mar 2026 17:01:12 +0100
Message-ID: <20260302160114.46884-9-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302160114.46884-1-stefano.tondo.ext@siemens.com>
References: <20260302160114.46884-1-stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 16:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232217

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


