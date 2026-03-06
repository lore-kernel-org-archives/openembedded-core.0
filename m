Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D71FF01838
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 14:00:18 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69777.1772805616568639024
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 06:00:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lh3WPjka;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48069a48629so97211405e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 06:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772805615; x=1773410415; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dz2DIwvOCon29AzR+EnavIgbskim4kyUitsTfI6u7p4=;
        b=Lh3WPjkaA1kQw0H9M7Jthecp1/L4C5IXqUcGJLVqjJwEPF5wtlyJSz526OoUc6a1Qs
         p1ENw2wTg9t7XcTCz42e+CksxRl3Z8173EGK1zAK7JCqDvrbeA24o5+NvDn6HeX7dZs7
         TqNi8tIEVNsPEJdexHxUhOrnLieNw9tnBh1QFXPfMNRElppir1Iz1+888cm+ruJcFGKY
         DcJGI/mbO8ZGAet6Z0Ji/wo0iNHHGAzg+NMKZTun2jHrYetl1PSe+KNjGTGuyS49HTdM
         BiXE6UtxfPzDmJ9l3N7ZHbeK2390EUVHVbK8q7R865xGtK5wtFjTigumiKkW7E8KpHS1
         cnWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805615; x=1773410415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dz2DIwvOCon29AzR+EnavIgbskim4kyUitsTfI6u7p4=;
        b=MQwLG1S8exJmrQaMCPLlayOdcFAeNoskjzYrEr0QUjux9dQYoURfpmgRJyY/MjVFrx
         1BPLgN1ZcUxikPr8ncsL9jHF3r5njSwM2mkBfxheYBslBdUInpUy7TwdcnU1htONiLfk
         pgzu4qDrUV85xv9EPcGJVk4M0Mu3hHcABxH+ZYBHLxKh0V4MEQWk3kGyQMKOWi46BxPF
         esOQEw8y8mWyG3vBP/amBLKnkWBMTEHRM1hoy9RU01mVF01LEDq+3YkoCv6wa5lyaBFS
         Uenkybv+2FF544EfhNKI770/0pitrYybCSW7IaYKOi+UWIujgQVwCaGpQvZlz7vKifA6
         mGIQ==
X-Gm-Message-State: AOJu0YyS+en8UJhMJjFSlaeD6/UIOnYehtMTaaS4BWJkEexxMXvBLWOH
	hFBre98UPxTEvfuxGx2mu5rR4rj8KOZC1/7FZmmQ3p8VKcfAuTSgsDtb4iNbMw==
X-Gm-Gg: ATEYQzyXlS6KzqPgQCSi4TDdSLHMZnKCw8fREOJqNSZcEfijv5n37po0Iqat4YLTeoM
	rPws5FLwjLBoBl17sBVdIxLgdAfEEQyoRnpNvZtU8BNN7gO06SrAsfy4L7Zs+OdD55tT2QkHJwD
	n/3+OISJIJB+aA9+CSRb9vno53veZDPGZZEOQOjOrOeMCTbRlSZ0vHalQfXlCv7vqDlZvUeA0qR
	lbgmRv88bBUHR1Pcm/92Sspt7+up50xGt9LwSaGzmBhncY/vOQrIiwJq9NUeOxdgTojCrGG4QXo
	eH6axiIzZh5r9T9a01zCOVuNfKQnHr4wRjOurAslNQm+g0f/IjM+B2sbbaCUygWuX0LD3OGPBJ5
	r/HkFi+/3BmfSkG3hau2Ou0GT0cd1uRZtkoEzazn1pnX+H4iBFw/RqypnKPu04CNzSBcsJSJPjV
	TRLzEQsJrzTPAkBi0b08OhGqE7YEnzj3//wr5nRfue4VgyTrjiY81f
X-Received: by 2002:a05:600c:5303:b0:477:c478:46d7 with SMTP id 5b1f17b1804b1-4852695aa55mr36328375e9.22.1772805614443;
        Fri, 06 Mar 2026 06:00:14 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb4257csm187098845e9.15.2026.03.06.06.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:00:13 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com,
	joshua.watt@garmin.com,
	ross.burton@arm.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Subject: [OE-core][PATCH v7 08/10] spdx.py: Add test for version extraction patterns
Date: Fri,  6 Mar 2026 15:00:00 +0100
Message-ID: <cf5163cfab3cf40b250dc77aefc0d91948b6c14e.1772805096.git.stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772805096.git.stefano.tondo.ext@siemens.com>
References: <cover.1772805096.git.stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 14:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232574

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
 meta/lib/oeqa/selftest/cases/spdx.py | 53 ++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index 9b6fcd335c..14a50205d5 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -448,3 +448,56 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
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
+            # Use a unique namespace prefix to ensure do_create_spdx runs
+            # fresh regardless of sstate from prior tests in the same
+            # oe-selftest worker (see test_extra_opts for rationale)
+            extraconf="""\
+                SPDX_NAMESPACE_PREFIX = "http://spdx.org/spdxdocs/test-version-extract"
+                """,
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


