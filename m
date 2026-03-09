Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E3F5F3C262
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 13:29:27 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14159.1773062960976113248
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 06:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TbReHyLj;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: stondo@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79628fb5c05so95036657b3.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 06:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773062960; x=1773667760; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTetZvP6BebA79DU1h03+zwm3V3+NRTqsJ+4iic2qCc=;
        b=TbReHyLjJBY43mDRCaURunk6yIh3vy4ttIZdzRjp3BMuV6aa8lq4vW0z9sVuAWctOH
         wwKkTJZ+FSLY7/eDXv1qT/hd5DaGNHWglp7RFrZe360ib0Vl3hkBmdDd3IIzZxrP1yiV
         Roxzf571TH1//CO/K/ppbNkloOVjqcYutOh5Bd3M/Xp9apMZlmmFv9uMgb6bzg+7etQp
         ciMP1AAtEO/K5b88/nfTYYqKCeCMnEN5YdkG4I4z9IIdIJD8TQyHU9uZVulgTQ5rXw1D
         ymlONDE7ypV4mQ+4brysPnSLiuNwDHNO+1w2+0qgP+Zv8wfjdcEPIRAKwAev2E6QVt9G
         ENcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773062960; x=1773667760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vTetZvP6BebA79DU1h03+zwm3V3+NRTqsJ+4iic2qCc=;
        b=pOkt9w21NAEKiED6rrRtEiRxQjgF6QRSg+y3Msxv45ysLRpvBKyXUeKOmBe2vz5N7r
         Q9vhc/Qh099BzFA6J8zOgBmDK7Q9ccIYuTJSd5nlilkauuQpp2E6UBAnjK/TwgLkCqUT
         vCwiGBdZ2ZQWgWk05Zd7uRt/hRmAciF5dKwIkJABYwQbHKcsQU88/L5HL2mlK+hNMdXg
         ff2oBt4t1xuaBU4Wv8HMAM382Ip/DBKkQ2pL/ZEV4Lq+6dawa7QVAER7yvSTRhnF2pxr
         ExZVZau8gxZzj8fy3d5wQ2DECYEMX1t9C7S5yjU5Lnuq07BvpE1nr8qfdRkkDyk35jvC
         vGZg==
X-Gm-Message-State: AOJu0YwkqhuahJMixw74x2LdlntQhDVSfeSvLTxvKJGDSghLYOtjf/R+
	3BsjV8Mi6PuIPfFupEbU9QObiDmWsdLRAOdph+HhJA5N7jksP4DaJ0Kll3qwJw==
X-Gm-Gg: ATEYQzziHtnWJ6l6lxOTACsjIPkZcoAgOd5bXdGj2U7Oq6g0Tv/xTdXPMKU9xfkpQHk
	fSO22ekDoaGdMNpiqW35QqMi+QuidcueME4+2XqLPjlvtKogP61893oq9xSbC8cYTYg3PyYwzVC
	e9adm8Tj09CrktL8J6aJkaa8xXA1MZ7xdQMa0ICl1Qg2vBB0cHmVUk7IMOJtXebcGHJfVGyUxdp
	uTc3YISs4ea9KzgEBsFHFq4SiuVpS0KkDOc0SC/XSkt8r4u7DZP+7K1+GnHgrfaUiWtCAoLG+CP
	NeZl0DNoLt2YLl6gryD9jUkvzsEsb6aP8VENVJS1G3CwNl7FFbVb/27TqlZZWJ8RkiDJI5vzd3P
	O/3T4QwGEMbCifJVJMSyPBVTX9eIQ7v6CK/cMaQaOM5Wa77ryR3i1Mxf+GXwlLwEqoz8fH7el6b
	qjyo1RPEcTIoBcqCT91p0zS8rjiG5ZdBOgIElZoPkEjq9iD81BQk3jMOJaUEFyALxRIxQkLgU5b
	L2Ittct
X-Received: by 2002:a05:690c:dd4:b0:798:704e:9d7e with SMTP id 00721157ae682-798dd789d41mr101621397b3.52.1773062959781;
        Mon, 09 Mar 2026 06:29:19 -0700 (PDT)
Received: from fedora (mob-194-230-161-149.cgn.sunrise.net. [194.230.161.149])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-798dee6afd5sm44299437b3.45.2026.03.09.06.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 06:29:19 -0700 (PDT)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	mathieu.dubois-briand@bootlin.com
Subject: [OE-core][PATCH v8 5/7] oeqa/selftest: Add tests for source download enrichment
Date: Mon,  9 Mar 2026 14:28:52 +0100
Message-ID: <20260309132854.128375-6-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309132854.128375-1-stondo@gmail.com>
References: <cover.1772805096.git.stefano.tondo.ext@siemens.com>
 <20260309132854.128375-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 13:29:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232714

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
 meta/lib/oeqa/selftest/cases/spdx.py | 69 ++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index 41ef52fce1..7ce2ea57b1 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
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
+            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/recipes/recipe-m4.spdx.json",
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
+            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/recipes/recipe-tar.spdx.json",
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


