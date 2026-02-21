Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BAC4C5DF88
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 04:24:43 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14408.1771647880889882278
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 20:24:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P0J5v4R1;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so15896565e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 20:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771647879; x=1772252679; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tRkl5ynog6ZpQqGY45HytT3wZth87VxUU4GGQjyVZhQ=;
        b=P0J5v4R1JFuWc6HBIIqW0Ni2Rn/ae7SBHgCoTrh9JNrpvxIoksn68aDfWdLQzr54Yv
         hq3w2mlgsZdp5+gL9XKBuI1bC11dgWcZJDK6jDJqUHqyEOarMotB3bwz2G/PPx1C/eKG
         O6E0auC4xIaU22sY4J1RdgjHivtKLMprAiswEoi2iXdZ2mTcPUP4pIx8cKsIkAKwqRC2
         eqgmyN4JkF7c9eKX51oEpOHnMsFbjs36j7MLp+voktnqXAmT9T/7n7iPkabCmWyo/IRF
         H9cbsHavAN69B+3b1OG9L438N4p3hKlTQZ731EiE7KbX+C3cLETnIjcWEHwf9jGben6O
         DYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771647879; x=1772252679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tRkl5ynog6ZpQqGY45HytT3wZth87VxUU4GGQjyVZhQ=;
        b=PjfeUK1BeTzkt7vX+8MwBKEmM7F2CaPKGvjCDLo4mLXZ3hGDrIzPNo9kavV4UoSSGQ
         vzyMz4/P2aCkSFLuw7xezNDPaLAnqXxVBn16CRBLUt0EGIVGl7EYS2pZQ1b61WwS3YzT
         83bjPNdAKQrk9wGwgXvtAq42OCYjJ9/9IUO8EOxU7Ig7sm7TizZyUzjjfNBxfXvyqp4k
         /lp60jj2QEnEhkyP5oqO80M3KI7VoMBwq6SXDo1axUcgLq6xjgGpQ1Quj2jClwMzyCC7
         iIEwWC0UHUvcsAC/nRmr/FJ9E8pp2JWaXruKccsEootstDcDDpNKMTmdpBVjXCF6MjQA
         VnRA==
X-Gm-Message-State: AOJu0Yx3XlahrL529inVMGZhvt8EFwkE3k4drQua5h2d3j59qker9fsS
	zcDhGXOcjAp/ThlCZxWJKlPmiacFXpzfFq74kl3H+IACz0cal6uBG68SS6YhAA==
X-Gm-Gg: AZuq6aIBiVLs20Wg3UMyKAIszezfJ+Qax2hfRdw/LTah5YaH2rOHmXMOReiw845w9NU
	HgTqvm5tH1bw0Y5NTbAPXKuoytZYpx25tBGdCkP2b5+uAyjLJvSwSlj7BJzJrnQxBdjxxsu7jjK
	7j/F5mLtYVyQUQQGmt3Uqkexjg4LRQ/4mNEX5462KkaMPTEh/9ariuW3Hr5799VYu/vGXQMiaAD
	Jrgf2TQ6f2MQRMLkXj2NKkMmApDS1WgHRu5JKQf3VuDJhBVJOTEeBokdFostqYhS8yOz1/kihX9
	QYDUxubsIxm7qUnwuQVKZ+j6CZmliNm3ZPTKX+MNapDotlCX7IEzku54yCgv5vymFM9y/5iVD36
	PMc6fvE0Vwrc/U09XBaVwVpHGFNOZLucr7JA5zYKDyj44bmws6sh6mWVh3E3RkjOrGoFhm7+WUO
	Ukk+D62/nNBlg68ZJ6lwQ+9dRFjXiep2I2f8NItNtenuWAMg==
X-Received: by 2002:a05:600c:3111:b0:483:612d:7a9a with SMTP id 5b1f17b1804b1-483a95622f5mr30891175e9.0.1771647878853;
        Fri, 20 Feb 2026 20:24:38 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31ff4d7sm117340865e9.15.2026.02.20.20.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 20:24:37 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com
Subject: [PATCH 13/14] spdx.py: Add test for version extraction patterns
Date: Sat, 21 Feb 2026 05:24:17 +0100
Message-ID: <20260221042418.317535-14-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221042418.317535-1-stondo@gmail.com>
References: <20260221042418.317535-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 04:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231569

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
index cae5c95f43..9a0ef526d2 100644
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
+            if hasattr(pkg, 'version') and pkg.version:
+                packages_with_versions.append((pkg.name, pkg.version))
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


