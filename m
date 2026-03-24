Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B82FC72DF
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 17:14:55 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2732.1774372493537378542
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 10:14:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gn8/2R72;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486fe2024a9so32780635e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 10:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774372492; x=1774977292; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lle3j5ejD55GWoR3QxdxmnApS09jZT3GXcZ5Cv6BXeo=;
        b=gn8/2R72XjORFZDtynNUXNx69e2+jlNfcior4t5bNiL21WXCUsEw+zNYtfk+S1awKn
         S+uqSOvjJlRjSA++zG9RjedunabpVYK3G8W+udoePHRHIdFEFm6MrWNqei76lc2/wQUr
         /NNnMFgFlgCGNKArLrMIY3mjW8R7Hdkg8ScLxYPJVFLp6ke8sc8knTkQEjlsHO48FOzM
         KVGKX9aLAFFkmUWoOtgDEyuRkIK04owLNEzkJZU5Xu5GmDPkjSpyD8H2qgTscGcgk2lM
         O8beVmiX4rjOw1/SsQKa6E/DbwAW7+pO4/MVckt8WRkz2iWjRz+DMc5bgfnVL03f4naP
         suzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774372492; x=1774977292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lle3j5ejD55GWoR3QxdxmnApS09jZT3GXcZ5Cv6BXeo=;
        b=eLruiJg0CfsiH7ln7maKl4wOiGwRhAxm54R03RcI5+O1hj3kH+pK0DeOX8vSK6ffj3
         d2Q5kNt41De1dh/kUMxf24awZAjIP1Ytlm6AwD+V+qayRfpIBui6HFxpeH9Vp+elvvgy
         BBAWkAikhdhZ54nAuAobWO3Qkf+3IB7N6g29RNL8mNWXZMrXqSs4lrDN7o9vXrHnMqaZ
         ZbYUvMMzc9lZcliTLv3irrAGi/5xVfkGJOCI/8C0zoKArjbD097XfPn3tx+TsjR7y/1J
         p47yEooejRBKNgDKJcd0hh1IYrvrHqfWz0HE7+5Hfuk39BI4r29eiQnMqvP+x4MaXTFb
         30/w==
X-Gm-Message-State: AOJu0YxXDnYCulPGX5C2oNtuTAfp5sxZ83K+/Ag8ahBz2MU2vzhsvPXw
	eA5PiH8NyW75Q4vTRLQbQi9jc9Jin7tRl+TTBdVGhEBcsgCL6WiJ3OIvSxXdl8kZ
X-Gm-Gg: ATEYQzxATxP4kYVMzD5SqQuDqPVdchr0LVLnZWlnY0QFVLOO+YwTsLnjXCkVE0iq3Zm
	0i6ECQBqJp0aVB2ILi0wrGJtbD7xaF+Z+py5e7Ix2o5H+NaEpXYh8DmSnAkur2ptUMs8+i04rH0
	qV/QxrRoJKyjJTsioIzui/E1leHr1ND30ZxCI5jnox9mI2jiWffgWZ/9BHBD8q8GyjqDOJw3ZWK
	mTseJB0sqMqDyCXIYPiVLr6ppw/avCOwSwjxnPfQPW9qdXtR4rTvJTzhctjpWDwprG7tHYsdaxQ
	Cfsq6gSUU2+bOBKnLRaj+CQkFE9JNgDxY2l4u1F+5j98ow00JXS3jPGoznFsBGzw4d5qu+tKZ2Q
	gCbXnmCU7Qv0uyFNOtBG0MUD2G5YScy4ng6Uuf1NLLYBxPgO0Sq31onAQ8ShVUUquuMOje58qXK
	TZHleYFbFFaWvDVsrIe6HVTDO7Szdf/O33LRKCLs2elGwacrqdfeqlBg23V1Yj7tVEbRuDCxxyp
	4RmA6vs+IOZv1gh4DtkOtzx9w==
X-Received: by 2002:a05:600c:190e:b0:486:ffa3:55f with SMTP id 5b1f17b1804b1-48716050973mr8630225e9.27.1774372491439;
        Tue, 24 Mar 2026 10:14:51 -0700 (PDT)
Received: from fedora (mob-194-230-148-205.cgn.sunrise.net. [194.230.148.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487165e8e0csm1089275e9.1.2026.03.24.10.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 10:14:50 -0700 (PDT)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	ross.burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	mathieu.dubois-briand@bootlin.com
Subject: [PATCH v16 5/5] oeqa/selftest: Add tests for source download enrichment
Date: Tue, 24 Mar 2026 18:12:46 +0100
Message-ID: <20260324171246.686862-6-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324132958.2316491-1-stondo@gmail.com>
References: <20260324132958.2316491-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 17:14:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233813

Add two new test methods to SPDX30Check:

test_download_location_defensive_handling:
  Builds m4 and verifies that SPDX generation succeeds and any
  external references present are properly structured with valid
  types and locator strings.

test_version_extraction_patterns:
  Builds opkg-utils (a Git-based recipe) and verifies that source
  download packages carry the full SHA-1 commit hash as their
  software_packageVersion.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oeqa/selftest/cases/spdx.py | 76 ++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index af1144c1e5..9347e0bf7b 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -428,3 +428,79 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
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


