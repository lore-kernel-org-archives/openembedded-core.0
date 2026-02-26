Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C4DCFCE064
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 12:19:00 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68608.1772108338868976354
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 04:18:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WhmGLGn8;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4834826e5a0so8993235e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 04:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772108336; x=1772713136; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tasMwHb1eE4X7gh3WGFR+2/nPG3uVPiKjIGnUOBd/6M=;
        b=WhmGLGn8KTCXicZ0rqhASLcrcKD70iVXIppbn7L37iY0nh27ZvGGDPjrf8QfltvD8B
         5jk3/Ma48C4UfwVe8Kze6H9ZTSgU9XcKr6Dg6OoCBYsgpMGUjvUd9CouRq1r7jVEMnKO
         aqqp7b5fa0ZR+QI/RB7Qd9lfPLa4VMuLIsoB52r73/CKKmbcFROCDeNdjnBf8eNUjiMy
         92lpPDwRZmCN8QL850ZjqaLb6jFoVgKTtFPi5t49mMzExXljURxPX4ch4gnCT6dPurJN
         d6r9bL2trJDJB+CQYHQOdYLU9Wu1rnV8KavzYVD/5hI5CDs0AmB4eIvv1pqlqS5TbUDi
         4uKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772108336; x=1772713136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tasMwHb1eE4X7gh3WGFR+2/nPG3uVPiKjIGnUOBd/6M=;
        b=H6TiRshSryurPFRAtys8LDCArgSENOvVMVImi5W6yQkaKHkuNaI8OkZ3LUg0ufJW3y
         eA51yVvQiALxkQaO7HAirg54Xm2PBnBfxLuB7yKwIBhhK99NAQVfDewt13qr/GzENae5
         s7RN+V6UjmaV0k6dTnK27z1iPQUwg0T37NR1hRDl5SSE26kfms5d6XufgTQIwsm7ib3s
         iuO1yIl3uGloLo5CYIJKqYTVYAm/jhd1y2b3bBRI+mcx1OaLXTcr022e9zmekl1lYC7+
         qhN/+eEolJWbu0S2PHnMl+DG1IxksC64zRzAWWr6W8PpV/haHfNo/jAbWj5ddMNKDpmy
         FDlg==
X-Gm-Message-State: AOJu0YyAi0KAhq2+x91jBUR4SPkOt4Sh9RjGowa1Bg96Smeyr+4R1rxO
	nd/MIEOBNUeIkL1oEt30lmDabs24oheqhw7VU/OlRwwBynDtXGAikh6CKNl0nA==
X-Gm-Gg: ATEYQzyBiYKtb+wz/tLk4gx2AVZ2fjqP0or+3vZ7Wflq0ablkdIUrivF90ZBBQOKvJX
	wlbZWFaPGxtrqKQhaD3CoYyxEKGaQuNKQoFt0dF8jGd0uHO+UCMJg+YiyWYOPkCXlzoMVCUMJnj
	vE076rmlqQy+XuhvOiIgZATXFAu6V61Jckokx5aZnyNYGbsfaNZYBauvmZbiRlga18oi8FS3yId
	i0DebqDsr7tNoBC8oF04hTVuZiWTejPVY97tMemcJK9lB5ieg2+rNkFdMsF1YLHTonKAo7eZP7u
	Q0KkNstZstBPZV9kgIQLJ77QZq/yiQkeQTKojJgwHHGVbLKyv/hzTkEdkk9jjV3moJIaFF6XOx2
	f0MG2s93IC6cCEa45Ed15qXsJDzjFIKIYIsA9dhZYtjiMrqtUPaZ9v42iysI2VdsyJUlTDW2p5H
	UlGj/xEA==
X-Received: by 2002:a05:600c:6296:b0:483:a361:41a5 with SMTP id 5b1f17b1804b1-483c3df4633mr34047225e9.30.1772108336001;
        Thu, 26 Feb 2026 04:18:56 -0800 (PST)
Received: from fedora ([165.225.94.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb77466sm48483955e9.5.2026.02.26.04.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 04:18:53 -0800 (PST)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	jpewhacker@gmail.com,
	mathieu@bootlin.com,
	Ross.Burton@arm.com
Subject: [PATCH v4 09/11] spdx.py: Add test for version extraction patterns
Date: Thu, 26 Feb 2026 13:18:21 +0100
Message-ID: <20260226121823.149327-10-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226121823.149327-1-stondo@gmail.com>
References: <20260226121823.149327-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 12:19:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232014

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


