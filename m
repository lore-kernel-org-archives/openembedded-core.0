Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BFEDFEC0EC
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 17:15:25 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2750.1774372522553251365
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 10:15:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CwcM5oaa;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso15015955e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 10:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774372520; x=1774977320; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lle3j5ejD55GWoR3QxdxmnApS09jZT3GXcZ5Cv6BXeo=;
        b=CwcM5oaa1/lKrpAhxBsaJ8tUSJqO8T3F14xnFCMkxCZez4RxpfK94K6ps4rHg5al1m
         NGFdvsWtlhUa5+ZyqzJV9Ta64DZr4/SsXscwakVcabVHaHIw6ByjGpt5m23t7h5L5ySn
         4Z3vCnzCAxX19m+nCSPTpEqnfUpEBV7WgxF1GzCsGBh1fgIy1+aPMbFBDJHdeE5gf34u
         1ssvnhNqtiGTo4f/nRDpv1ELj1j+8CksJKgbUbhdxClrCjyEW3M13ua4g15rT7Af2ra4
         W1gK7yO5z3EviqW/qw2BDa2qWpsKMGTaNNkZqqjLLjaxvcQ8vbX+dxURYayuL5/PMGuC
         vk4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774372520; x=1774977320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lle3j5ejD55GWoR3QxdxmnApS09jZT3GXcZ5Cv6BXeo=;
        b=RKSprw5fm6fK6OlwM9pvAsMH9CH0YMSkvi0aZISlDaEqXjuxHKZDnNYnrh5WtJsmIe
         icB47PKusi6UVOQOo2m8pNxoeoRjlg011n5U51uSYgp1ASEZOB3Hmg3HJNwJCnuJkg/U
         ak5VcMTkkQDIepDJJtsmQFT5e4OGzZ9YXFX2IqmzNxIujeXd3RalFRsNmN6qTyLs5pT1
         rz4x/R8CM8xGXWHaBruOy7j5whI5MYFm2pTYjf0yTpi/L8Q7VMC1z9CLGRrmFj51KOcd
         JZsEhKpSUzC1qrHOUAzJ4FAERbtsQdg3dLZ/xm5yFYsTNCKvNh9uNz+BkP1xnqQgOSod
         kaAw==
X-Gm-Message-State: AOJu0YxKlNGjCps5NoimVJwUAC5zUIQ90UY5PtYy5cK16Dr42y8RTXfY
	h2xKbmWe1Gr5sAYHs1ixwbsAASO5KiO+p83Ku/yN8/ERucK/CdDAiTYyM9D2s4eY
X-Gm-Gg: ATEYQzw/yvkTi5QesxU0BrSYaK6ErQnjtRhJNDf+e+ECOO186C4nUq61zAE6VDdTwww
	yq/gRSAczIRfYEqrOyx+Vv3mFfiQrE60g9MWmf3xN8qZqG8se7IzL39FXh3UcSkbf3WY5TJhpvI
	VA1B15rcREE1aXWVtmiUc2w0DkpqkdUnnyL3P1B1VAStzVHZ9GjRPnxe9yd8p+1meksBCrSI8gk
	Q2csiI6DsesF5lUTOeT3ntsmazcFTByliaxiA6lU0mnSrHkT5iMuiszpx8K+rcbX3yrLWaPk4Kn
	lhKz3sTr3vpw0ObmPpIxJbI5nFf7P1VTPZGTiG20jK+x5Q2DD7Nyq6ch57rrxMsUmA1LEEDmA0s
	w+3UL3J0EIM0fh3xkNEQjAmk2yxTWWe6jgH5hSXiAP6fITWU9TQeMtFwl1XQWfT78Rratb/RO8Q
	mCPhj28qEXQrmiBeyh7cl+kUiHQ12TZ1jY8j9ltOURhRKrRAZvl1INh3jkl7zCWU1oPqSWEIS5f
	Q3gcXTuBnu0LFb6FMccxHVpEg==
X-Received: by 2002:a05:600c:3491:b0:47e:e076:c7a5 with SMTP id 5b1f17b1804b1-48715ff3363mr8511125e9.11.1774372520288;
        Tue, 24 Mar 2026 10:15:20 -0700 (PDT)
Received: from fedora (mob-194-230-148-205.cgn.sunrise.net. [194.230.148.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487165bea11sm2168665e9.1.2026.03.24.10.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 10:15:19 -0700 (PDT)
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
Date: Tue, 24 Mar 2026 18:15:02 +0100
Message-ID: <20260324171502.689012-6-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324132958.2316491-1-stondo@gmail.com>
References: <20260324132958.2316491-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 17:15:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233819

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


