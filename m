Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D380FC9830C
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:12:05 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2931.1790154719461847047
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=n8gDcwPn;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d3931so4776065e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154718; x=1790759518; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=drGwC4eMyxlu2SEFRs/EPJszD+oNO4HA6d08cOR+CxA=;
        b=n8gDcwPnFoCb5ADbpNsOBybEv7gNfsAmldyiov6xAf1GEu0ftL3uO+UCi39ml580Y2
         UKaQkaV1ASN1+kD23E43zG1qCPNEzqg9cRb/XOV65/iZXbbqztQ+CHQ68VN9LCGt2VRU
         96uAMN2AUhI3LCDBwGkrzI0gD61HV5WT16gJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154718; x=1790759518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=drGwC4eMyxlu2SEFRs/EPJszD+oNO4HA6d08cOR+CxA=;
        b=p6HjtB1DxfXPKpt0KBOn7LPC3dO+rcdpgHna1DL62kc5te7PI4pvyExxwpWzATivfw
         YJHJfqgtLvP3AZfJNUCZjm7AazouwUAWWhBgcvLd45clnRED6/TikqTB3/OXtdXEnNDY
         4pQfuq7cXBscaAjHJ6/3rXHr/PZzPTOTUU5XCR/VlmOxgGa/YPtZgcLm7Dz+uhE4QDRh
         77YBpbkoa0YYEjgQfZ46WZcQeN1dB2PRQP9HXCE7AB3pcdkvQRROdHixIdsqMPnHle9G
         7uDH9euKVwTb25i2AvBCzfL3oIBh+OkanIhL+sJ9Roe9oWdwjmQNZDDCxrCrMnoccBqB
         Aw9g==
X-Gm-Message-State: AFuF++ljeKTMWVaTW3xa+rVRZ5RlkSJEWh3g8IrRt8ZAUB9zSQMge53m
	JsiuIvUuXNxuEYM8lC+lkbn5OAsG3LygHmzk8xe2RTAia4cAhXnMIbdY+Y5l8IxOp0OB6SUpKQA
	TUKfMQtE=
X-Gm-Gg: AYBFou2lf+lr/rMuIeLsQGltKFIvMr3Zc180zbMP4SaBf7Wr19aDcK9VxXl0Cwd5zB/
	BFZ3QSjjSlUF0ZEl37zBlS6CM7S1xLYTiP1J8HOWFLcnmeM7kMfw4AQbGtNJaPk35x580x1uPeX
	X+EQaZ1995aJzMbM4y3zeIcXeRRN6yBneebbsZEtruYZFA6i9Y/N0RMu5a2YxADWeWlS+RNHEnR
	g+zmobIVCBETDt9XGI+QNiQUguH9WCrnPDYlmAalWHh/gr6DRGTz2Rr9VxjONefwTfZ1plGKl9Y
	UZ4Ak7ESuGSV7R9F3aiH1x1WKfian8ymwTqTvQvap05WOs9DGTM3efBmVX1Njcpw3f4Fle3aKet
	dQK1p4pIlVRgQEkP1M3vDKbYa4Q7t1uy5djwTjbWjzYA3k6+7f2C9l+sk3x7fQezbnaTOxpApfQ
	Rc3ZLglTPha0lQN4Lb1BtjCfKOSNn2fmfIqlKxc0Yo0+BrTYhJSxo++dBp89AcQmFY5clCr42X1
	4JdROthd/5rORpQT24cqJtxsE9svn0To67nlU6SX2m8BKwHbsY2dwovcAyg/r7KxdJ6hOMJwct8
	m3EVAfs=
X-Received: by 2002:a05:600c:a307:b0:49f:e3f2:f5a3 with SMTP id 5b1f17b1804b1-49fe3f2f5d4mr2769935e9.0.1790154717624;
        Wed, 23 Sep 2026 02:11:57 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.11.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:11:57 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 32/48] spdx30_tasks: Fix SPDX_CUSTOM_ANNOTATION_VARS implementation
Date: Wed, 23 Sep 2026 11:10:34 +0200
Message-ID: <de5c85b2c4c5a62d12aa5b9ab328d9a51d831c41.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246494

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
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 52ab3b640c6bb7ece34cb4ea6026fd6375f17af4)
Cc: Joshua Watt <jpewhacker@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC:
Link: https://lore.kernel.org/all/CAJdd5GaqcWujQae-GXQpcgAGtosHe7_X0T%2B8LyOfrr8-mOgzLA@mail.gmail.com/
]
---
 meta/lib/oe/spdx30_tasks.py          |  4 +-
 meta/lib/oeqa/selftest/cases/spdx.py | 74 ++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index b43d626df36..0e9c6faf5cc 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -517,9 +517,7 @@ def create_spdx(d):
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
index 3373988ca40..5f75b077252 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -343,3 +343,77 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
                 value, ["enabled", "disabled"],
                 f"Unexpected PACKAGECONFIG value '{value}' for {key}"
             )
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
+            "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/recipes/recipe-base-files.spdx.json",
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
+        for obj in objset.objects:  # <-- Remove parentheses
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

