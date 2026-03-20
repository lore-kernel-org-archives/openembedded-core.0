Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D00C10987BB
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 16:50:05 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17795.1774025400839661577
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 09:50:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UB46GnlI;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso18838935e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 09:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774025399; x=1774630199; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zYp17iBPaoPjczXO5fSA5dfgjKxYkDwyVIKWeVby3wk=;
        b=UB46GnlI5wkFpeWhTtpeuKsbKH8Z+NwzbbyIO8p/aPeIZPuvG61GTpFJYUiHOfY5j1
         j9K8Xt9vnDWOBKDC7l3Sa1T1LuUBCkmvPcdQaYLI2EJ2eKoaut3NuJsRHZgFY/YLm1vG
         WOilIj2sbiQ4IpEOvOAHN2xEVDx7Q/w9lx1MtTy0xaYuuS4vjFJN3vDmAuLTfLSP37PB
         /loiVWIFTknH4g07o1IUMXgtI7N9khubWj2wAHiLJKJLA6fyh4Jm8W0nlj+iMtiWbHUc
         gmdkajSzJzmyy2fsAKBbZB3LIFQn8vUS6xBE+cND/27UKXt8GUqnx6fAaL77+PatT5MM
         Atjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774025399; x=1774630199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zYp17iBPaoPjczXO5fSA5dfgjKxYkDwyVIKWeVby3wk=;
        b=lOLvU3fOZVm4Ep9LGCFQXsDPjr10uiYCADyeldvJpxy3T28d3nROz8ZdoZBF55mWOP
         V18R0cqmPtz4TaY+bwS/qiL/Yzrm6YlaouiizFRq2cYM0yHyZdpkd1QLED0orQ9y6VAA
         VU70jNNe7zw4/CDFZxr4EKSs97pxQbvUHwOEW1rtmogqFiXr6j+tgQ0ZrYziJv+sd8SD
         H9ttulnf5HTxd1XsyTxaSQ7FZMFvuT5Dy1Y5WPXScY8cyCc/TML6tUBkBZ0XX6Bg5sQp
         YMlFzaLyTE7boQuo2kkyZbj7EpEGRkR25B+xqUfAGaBvfLyWuiGwVNDvNwEd43Nhth2P
         a6Ug==
X-Gm-Message-State: AOJu0Yz6RuyelutSMydhxjjHdmK4qZlDyb0zYXoNm1tfVJo3rduhxxdH
	NU79OktuDtqC5qPShloqWiFNMjMq7RSpOPGca9FEqAJOa3wfuISCBpQiyxZ3kr17
X-Gm-Gg: ATEYQzwuPUsg1Rt74nauCmd/0qBl0X+0DL97oe5CkirROJAJ0vr32MFW9FVSwCuxCxw
	FYuf2gDVCKYo9uQdsvkUd20KlCTMEuw1d72QEnVGzf0wTx1FVRUvoCO9oiYR/nx3RlZk99c3y6r
	s80xznmxDt+8cWq39JGALDZ216b26UjY1CsvQ4giUTTIEJ1o9RbUP51MBUoE0APsrr9BWpXFNEq
	7L8Uj/JutOLgpqGELJUtS6x0Gczq6Dz0LI3JoLuIjIzq5h88f9NYBLRsREA+749Lq2MVAjVXwvl
	1seUwCwsrdn8afHUVsRKtD+cfDrrlHmFCztRNYIB+XQLEBq22Af93QjLFOLM6fNaSyONCEqXLZz
	5vFwGCpsV/aXa5y4Qa+wFXqjk6ERJNvxK0y+aR/AJHsJ/83qs3oXaAGobBHogEbDjoPojDu8M+p
	/jdf/ptBYn6SqFcEol7zAf3r9FuI1cFFrABC0=
X-Received: by 2002:a05:600c:630d:b0:485:364e:934e with SMTP id 5b1f17b1804b1-486ff02c698mr59992365e9.21.1774025398367;
        Fri, 20 Mar 2026 09:49:58 -0700 (PDT)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe6d91fbsm73018905e9.3.2026.03.20.09.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 09:49:57 -0700 (PDT)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	richard.purdie@linuxfoundation.org,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com
Subject: [OE-core][PATCH v10 5/7] oeqa/selftest: Add tests for source download enrichment
Date: Fri, 20 Mar 2026 17:49:49 +0100
Message-ID: <20260320164951.128572-6-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320164951.128572-1-stondo@gmail.com>
References: <20260312153845.164369-1-stondo@gmail.com>
 <20260320164951.128572-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 16:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233625

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


