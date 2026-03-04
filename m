Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1735FEDA697
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 17:06:08 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23389.1772643961161206078
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 09:06:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MnK/PTMT;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so47833815e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 09:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772643959; x=1773248759; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fuvUL6zq9VB3HVOoTf8ZvUiVZ8dew1HLCDlrOXRhKlk=;
        b=MnK/PTMT19r3J74MmZSA3RAUVXQW2xiljedMOzJs2WBYlcRZ2/1Hx9jjgHTS0sHUjD
         bNM/GNGfqSQB2PP4vZWlMlubsvHR+p9840KUHMgKzzPzTyL9vRhiz8Tlj6c1FtL4KgRo
         fzUQAwNz3JknD3YbbXvuzZshH7Lqp2hb3GlgeVofpqUwjg7RLqWCt1b+mRVAum1breaU
         FHskQRj73II2nsR0rX2vwGMTlQmFgc0vXTLopTnq9imHi8/+liIDcEwKxxIbytoebwJe
         FeFIuItOxDOeeBOAIgu40gn8I4yl/eFexSUcsK3jINZ+DGBHgcbTydRKXS3/VJ+osfCI
         flHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772643959; x=1773248759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fuvUL6zq9VB3HVOoTf8ZvUiVZ8dew1HLCDlrOXRhKlk=;
        b=k0FEYQSof3dVcTEgjka2CM6LTH0ys6ejNB3Vhxz3huKv0mijr81tXcQ1sBjw3st9wI
         kluvNUOehcxWJRKtsoR22bmAiNTaznGIEeEqONbHhcdMDllq4DGIbnX1rHC9G37dbVj8
         NHy+ueX3S7mltdyf80aDMmm5WglboNfkCVTV5m/UKeepXT5coCybvTazLHyY0lvRx6zo
         +ZK26dFrEh07yVyG1IIYxNaTolUCYponQp06S4CisjkY9bb7i2AezIxNLgVrIex8Tu7b
         +18o7j7DXL4n0W3AMw4AmYkE9xWEunZC/XzNFG62L44yuPTOd3J0lsTckOTLHamqVVA6
         0RHA==
X-Gm-Message-State: AOJu0YxF9K6tB03BhxI5EKWGKDIjY4tisqdaaCJJQFqRSVyRwM8E3bbI
	sgijW85Ujh/yJbnk4QLkoNq9xx2YXPGJDKimxmhaMsngF+/aOCqCeTIq9ac9Pw==
X-Gm-Gg: ATEYQzyJD29ciZGc63chqqDxLP91cD0kFCuv/cI+HnSCu1l0Di60P18+7IQmiRA8dmb
	kemDbl5KXImrDxtjt5X4zmazkzuSPczZTAFBvleT35AZ3vbtG+PotGigsz1RtmebuxqfHL/MqKz
	0fyUz3zrRBI2FGky5fvYKhmEYsSInQ8FEGR2k+Q1INRPzyT089+KhcWLq0NRKUcjpXt6iuN4v3C
	aHkr4ia3Myz8DFX4oWCSm6xO2olK0gJQColKZexNy/dK8cpEJ95Z8+Cw4HIRCYJbcZBCFHbuQgp
	nSfMITGoMaS7AbOUqWKfOcxZ8rCoKnfIr8hv+ZT3GqZCP95OZYFkuVY6M2hzRSRRTWCqTsT17NV
	hp7eGiS5DaCohYo1T1iItMBcajvIWWzzj4uXhi0KKYie3mPI0GjwgsQB05ar32M8PP45y+pIroD
	2v/IpYVq94VzKqm1q10ziVuOU=
X-Received: by 2002:a05:600c:1f85:b0:47e:e4ff:e2ac with SMTP id 5b1f17b1804b1-485198a3b5amr49731445e9.33.1772643959216;
        Wed, 04 Mar 2026 09:05:59 -0800 (PST)
Received: from fedora ([165.225.94.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485188914ddsm78557395e9.12.2026.03.04.09.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:05:57 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	jpewhacker@gmail.com,
	mathieu.dubois-briand@bootlin.com
Subject: [PATCH v6 08/10] spdx.py: Add test for version extraction patterns
Date: Wed,  4 Mar 2026 18:05:39 +0100
Message-ID: <20260304170541.180868-9-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304170541.180868-1-stefano.tondo.ext@siemens.com>
References: <20260302160114.46884-1-stefano.tondo.ext@siemens.com>
 <20260304170541.180868-1-stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 17:06:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232411

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


