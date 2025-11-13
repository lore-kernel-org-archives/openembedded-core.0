Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E14B8CD98EC
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 21:40:53 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.946.1763058297871489313
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 10:24:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ePlbrrfK;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: stondo@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6406f3dcc66so1994163a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 10:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763058296; x=1763663096; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LqJMJ+riNgRGu52BqOr5FKwYyMGL88t1mBOp919CGFY=;
        b=ePlbrrfK1Vp3hcylB/EgVLKwf9KnewDzsQnX6a495eTzAcB8KNgYEZ+IHhH/YEfJ+k
         gDOZoehEtmSwb4KHCFSUuYXD+4Qsuc179wW8Sl0BeCLdEIcfSy94hF/gF79DZmK+MJ+J
         aqq/5C86DIf/67qMpY8Z1mG2VjlWAP+9pCU7uniV4aKUskQ6ODNsdmsXxurjXRLtqolM
         L+RQXgywaxYwCmIRHrvFAky54R+Oy4mhXq6eO/Uw2w00mgLdDaqIpfM/GfivWwwvOP24
         kQVZjJgOgRWqScJpeqCs92Qs1zu8Vv5/IF5IzjyTJq5GMJcSfSwG4tGsRD9FfEDhYS/h
         m49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763058296; x=1763663096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LqJMJ+riNgRGu52BqOr5FKwYyMGL88t1mBOp919CGFY=;
        b=xAoW/QF5cmvExD+NCsXNdiDOca821GBSYYt8PbAjCWzvtZ89fwaNbEzg/BhoCZrjco
         5yf+DEP7MpECqdsAwGafQpytLe9RBuIhiHrvVEwNeFKWAw7GKHVRQlnQEfhVFkivPOe8
         NQ/q5r/YAGQNjhWmGL4n/yQeiP+/e0lFkGVWy1kd2cQH5m62hSy1lEUBTECmxGuA5sxC
         +2HWZ2t862I62RwNhOzcfnECYsd5IWL4Fwcgb5e7ZWWNsAcyGqm2jOFtI0cVtfzl8Gk7
         pBhnefDp2mvnzU2Q8bmiylzky4Kc1sdXg73MqooI+DlDGRBxRpNJuqWaCWQZtTeuwsYg
         BLfA==
X-Gm-Message-State: AOJu0YzHZT8GbmEVcYGZePmnkdbF6nPoZQX6D3xKocs34mAssiZAc92z
	eU/lE5DX7Mni/MvkXuyC8c3045EENnL8cTrF6DHxH0Q3XoFHsDw04T0fAFM9JQ==
X-Gm-Gg: ASbGncs421K9CKoLuwoQ3Hwp9IUUUzIhxlwn1EJF/ClQ32D/sTF27nKKfpirZ8Cw+wa
	6pyI6ohdQksIwieMpFHEt1qBHNtUbap+7VON0IPEXkNaDAJC0WwtnHHWBXtsH1ZpIenuTWdovX5
	v9g2g++3hGEXmwZ2faWRPfF1/PvgWgO7IUPp5hlZEkIJR5Wpq7DV9+icm5ga0g6X3CFME9HoJF1
	XVfr1P71SgjpuS0z5fQSJpp1Lw9CLQfgfq/pQQI6Vw0DNKNHcE1yocQmdTu4ZzMrsgY2BU7i+QN
	mV6l9oSkiG3JytmQDsqqcWJdNPcPno4hUIj101atb6yTHhuP4WEj6i6V3tXjcP+MOLnswQOqhl8
	wM2sVsCEGPl9Lg3gGotCnmrqi6cAklBpNbMacy6vdqZ0rlqMnUNRe+r6VPbHDkrpitNvsVWzMiB
	xQSwIYqPSk9IjCVgBuT6bWN64=
X-Google-Smtp-Source: AGHT+IGUM7QryIAsAfz9Bb3cXjQ/dZI5jZXhoOup4Wzx3rFP9Pc4DL8kZoVNjAiO3ndsEzR0z+q86g==
X-Received: by 2002:a17:907:2d21:b0:b6d:6832:a9d3 with SMTP id a640c23a62f3a-b7367b8b69emr16732666b.39.1763057921358;
        Thu, 13 Nov 2025 10:18:41 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b7359bfb238sm118784966b.14.2025.11.13.10.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 10:18:40 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Stefano Tondo <stefano.tondo.ext@siemens.com>,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com
Subject: [OE-core 1/2] spdx30_tasks: Fix SPDX_CUSTOM_ANNOTATION_VARS implementation
Date: Thu, 13 Nov 2025 19:18:22 +0100
Message-ID: <20251113181828.508075-2-stondo@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251113181828.508075-1-stondo@gmail.com>
References: <20251113181828.508075-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 21:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226270

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


