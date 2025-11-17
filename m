Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0273CEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 13:05:13 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8649.1763384705876247996
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Nov 2025 05:05:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bmaEQ6Cn;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso28501895e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 05:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763384704; x=1763989504; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iXkEDhSacKKqX8ho7kD6uXbJnqLf3Mb+Ws7B4lezrMI=;
        b=bmaEQ6CnSLnIGTEqRt9wrZij1bfJUUWK1l8UDShFntR1DN7baMUrpAt4+cZBD8NThN
         CdD8uXAPENyrA0SHW3A35HYnAdRVe9kHmYsMCjibWCKLJ53XFgjia94izP/CGOoEWkeX
         03lPvShgAVVQ+wad1QEKB1of38JWvjqOyWnVOWPfNIYTRqovqwluFMpBRUP+JXUVgBuX
         PCClDQlO647LNQnG4I/NmyNYtRhOBkEcdf62l6RK4MGzInEb7iua4L/gDX+umvpj/MGE
         J8lyixrdc/ihrag7xkFYq+ngDHfMwAXkkK99ePrqcof90BZpBygq9s2xqS6LaUvgDb2C
         q/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763384704; x=1763989504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXkEDhSacKKqX8ho7kD6uXbJnqLf3Mb+Ws7B4lezrMI=;
        b=J7fszQ8r4auEApbEFN1X4IgNcctykycBa5/isUyC8scMXeGQwFmMDVGpaAqqZ11O1x
         MtY8nnwNGb7UXsKcYtf3N6vVCeebw+yacXZe37fyeZOux+VgLeaC9opDUKeEBEmm8uLj
         sivZEof3I/uXrvJZ9qLEtVWXclOtLQPigHIYWpLN+6TOhE8CcIyjH6uXq+7FnErfrJrq
         VrM+r2s4bLAvaDTbyEYVXUMY6wEtZkVfOn/iZpUfoRLctzWnTGbhVAL78yvkNOAizPI/
         DVt615+5l2ot6kj/PhSd71yMXCeIkCiPZSrwDzuGNrf10HOp00ZdlgkQbJ1f0iVSrA8h
         2j7A==
X-Gm-Message-State: AOJu0YzZlkyufVp8N/s3OnK52sxVlfpUTwuQxaGhFfIKAcUz/p8hGVyY
	I62oLDgdx49llm7LZ5Y/rG1qOv1rMNbHiiPzWkbxO1Mg1bAY2RLVmdrIXoIuSg==
X-Gm-Gg: ASbGncsEdpjjLycErt28cfT9he66Vxd+aMNJ2uBTO6wLg4YBzFUASf+J7oFRi7Gtks6
	boeCDQm/2NHGkKClUOjTZkNGgQyY789q09QKemAAV+5uS5gTz/5SgAp4QXkP4BlcepFYJy2O2eU
	FdVXELFNwUPG2Xb90Yypn/Zu2RM6Za1Wpkp2inqThQwJtOqBms/yAk7AUDmV6EQ+uyrt2RLKXxw
	aHaiiVkKWlbx4LSB9DRyU59EE5dr9gew0p2bztYMNd6ldQuD0GPcqtfxSYlU52SRibNTvtDqy6n
	sXd23CsJUtAUH+OEbSRhw6oGFxc0AwgVeifXrSqZg3/oH+RbyL8E1WEyJ3FHc+eJ5XUj6DYKMdT
	wRKAL1yjcJWJ6i2mgU03IHny30a1HSVHCEBR1r1dTe+TYIAImHsZF8M+uZ0JW5Kakw9WN6YWyg7
	xX+vUzCr2d+W7MCPnEauVSFwVEdMeLDcPViMwFyb6EsiHl+aPOBDDlWsuj0fU0RD/boLfMFqdZo
	ruH
X-Google-Smtp-Source: AGHT+IFlX8PuYxerW6HiEpzolY8xAleERRdah5qsD9/89jTBKkeloPk6WlXflxu07K/Oew50XcWJjQ==
X-Received: by 2002:a5d:584e:0:b0:42b:3cd2:e9bb with SMTP id ffacd0b85a97d-42b5936c3dbmr12116459f8f.32.1763384703449;
        Mon, 17 Nov 2025 05:05:03 -0800 (PST)
Received: from fedora (mob-194-230-144-54.cgn.sunrise.net. [194.230.144.54])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42b53f0b8a0sm26628763f8f.25.2025.11.17.05.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 05:05:02 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	mathieu.dubois-briand@bootlin.com,
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Subject: [OE-core][PATCH v2] spdx30_tasks: Fix SPDX_CUSTOM_ANNOTATION_VARS implementation
Date: Mon, 17 Nov 2025 14:04:51 +0100
Message-ID: <20251117130451.1711036-1-stondo@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 13:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226493

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Fix incorrect function call when processing SPDX_CUSTOM_ANNOTATION_VARS.
The code was calling new_annotation() as a standalone function, but it
should be called as a method on the build_objset object.

Error:
    new_annotation(d, build_objset, build, ...)

Corrected to:
    build_objset.new_annotation(d, build_objset, build, ...)

This bug would cause a NameError at runtime if SPDX_CUSTOM_ANNOTATION_VARS
was set to a non-empty value, preventing SPDX document generation.

The fix aligns with how new_annotation() is called elsewhere in the
codebase and matches the SBOMObjset class method signature.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>

---
Changes in v2:
- Fixed test bugs: corrected SPDX file path from packages/ to recipes/
- Fixed test bugs: removed parentheses from objset.objects() call
- Fixed whitespace formatting in test code
---
 meta/lib/oe/spdx30_tasks.py          |  4 +-
 meta/lib/oeqa/selftest/cases/spdx.py | 74 ++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index f2f133005d..4d11b3c289 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -498,9 +498,7 @@ def create_spdx(d):
     build_objset.set_is_native(is_native)
 
     for var in (d.getVar("SPDX_CUSTOM_ANNOTATION_VARS") or "").split():
-        new_annotation(
-            d,
-            build_objset,
+        build_objset.new_annotation(
             build,
             "%s=%s" % (var, d.getVar(var)),
             oe.spdx30.AnnotationType.other,
diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index 8cd4e83ca2..eda41cf952 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -286,3 +286,77 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
                 break
         else:
             self.assertTrue(False, "Unable to find imported Host SpdxID")
+
+    def test_custom_annotation_vars(self):
+        """
+        Test that SPDX_CUSTOM_ANNOTATION_VARS properly creates annotations
+        without runtime errors. This is a regression test for the bug where
+        new_annotation() was called as a standalone function instead of as
+        a method on build_objset, causing a NameError.
+        
+        The test verifies:
+        1. The build completes successfully (no NameError)
+        2. Each configured annotation variable appears exactly once
+        3. The annotation values match the configured variables
+        
+        We check for exact equality (not >=) to prevent regressions where
+        one annotation might appear multiple times while another is missing.
+        """
+        ANNOTATION_VAR1 = "TestAnnotation1"
+        ANNOTATION_VAR2 = "TestAnnotation2"
+
+        # This will fail with NameError if new_annotation() is called incorrectly
+        objset = self.check_recipe_spdx(
+            "base-files",
+            "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/packages/package-base-files.spdx.json",
+            extraconf=textwrap.dedent(
+                f"""\
+                ANNOTATION1 = "{ANNOTATION_VAR1}"
+                ANNOTATION2 = "{ANNOTATION_VAR2}"
+                SPDX_CUSTOM_ANNOTATION_VARS = "ANNOTATION1 ANNOTATION2"
+                """
+            ),
+        )
+
+        # If we got here, the build succeeded (no NameError)
+        # Now verify the annotations were actually created
+
+        # Find the build element
+        build = None
+        for o in objset.foreach_type(oe.spdx30.build_Build):
+            build = o
+            break
+
+        self.assertIsNotNone(build, "Unable to find Build element")
+
+        # Find annotation objects that reference our build
+        found_annotations = []
+        for obj in objset.objects():
+            if isinstance(obj, oe.spdx30.Annotation):
+                if hasattr(obj, "subject") and build._id == obj.subject._id:
+                    found_annotations.append(obj)
+
+        # Check each annotation separately to ensure exactly one occurrence of each
+        annotation1_count = 0
+        annotation2_count = 0
+        
+        for annotation in found_annotations:
+            if hasattr(annotation, "statement"):
+                if f"ANNOTATION1={ANNOTATION_VAR1}" in annotation.statement:
+                    annotation1_count += 1
+                    self.logger.info(f"Found ANNOTATION1: {annotation.statement}")
+                if f"ANNOTATION2={ANNOTATION_VAR2}" in annotation.statement:
+                    annotation2_count += 1
+                    self.logger.info(f"Found ANNOTATION2: {annotation.statement}")
+
+        # Each annotation should appear exactly once
+        self.assertEqual(
+            annotation1_count,
+            1,
+            f"Expected exactly 1 occurrence of ANNOTATION1, found {annotation1_count}",
+        )
+        self.assertEqual(
+            annotation2_count,
+            1,
+            f"Expected exactly 1 occurrence of ANNOTATION2, found {annotation2_count}",
+        )
-- 
2.51.1


