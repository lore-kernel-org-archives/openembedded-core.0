Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF99FCD98CF
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 18:42:02 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87.1763059318295106611
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 10:41:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lpnWbDmQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: stondo@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b710601e659so184182866b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 10:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763059316; x=1763664116; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LqJMJ+riNgRGu52BqOr5FKwYyMGL88t1mBOp919CGFY=;
        b=lpnWbDmQI0dkv+bM5WzZYwEw89gTRLbRKdYGJ1gTyVxyzg6fDNCufCfpOrGzw2TGHs
         kq90f7AVTSvEEBdJayYX3qvzaFKocqF683NOOdMcc6TFJFGOT9CcZyLgoU8IEpQWPXoM
         ow6jfE0Pon5KPpZI6lEyx3Ze4Krh9PxCeTHs7YOvHKwsJU/br12hD1igxjhrRRCpvSwn
         JqyNvNhlXH7OvHo11NqtAVzaIPH4mhRQW6NjXX8/4Jtb/WNUouqekm4oK7TQvELOOyXH
         yJg2Y3Yncbwaz3u4mnVemHB1suBTMRvrU/jT0A8w1rNV+M0lNpnIDh1ri2MqIdIEVRRD
         EpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763059316; x=1763664116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LqJMJ+riNgRGu52BqOr5FKwYyMGL88t1mBOp919CGFY=;
        b=Q0nxzpkaWcV2XaB5jUWzIx41kMS0Fj5+N0K+6LLyfhtJxlx4rnAUS4ld6xQt0B+f/W
         pheGEefeI49iXUQBjshMg1PBnQAU5RTMeyShLWrgd1hH5+8pLI753snCVAsZ7RGkM47C
         5yc9baj4MS+1gLmbLOUkRE2oAuSSaKSSH0A6vePSXYWozDNW89B12qdBImKa5Nga2KSK
         GfoUrGcez+8p7obtfJTm85KT1jYjpEp8N0tquXd5bFSl7dJhwPXT673ZM1uDXx5U0TLa
         bjZ4aZLIAa8oPOY11Cj9/P9eye8xcw/3sij5Biia3hZwUMmrcQ8gPx1xna62vR55lEtR
         UVVw==
X-Gm-Message-State: AOJu0YwyTBxPn9IwfIJH9FN4+i8btjwc/Zt0Lo9RkvmbhyApH9j7/+H8
	ZFYt4EzdEYI0nRdCIgIqQB84AQbKL/eQlpI9mrDM+4f3Z56xQ7GztAuYO4cDHA==
X-Gm-Gg: ASbGncvQEoS27oSYffB28h1OfcL8qJYbYwZqdlekAlcCa+Ku5X3eFGSBqcDjk72/82q
	jF18t6fg59tDirl8I6AdpMhcNSdi5/HyuefLKYXMHIWedlKMp5WZZYlpYHE6svULl2jYUxbaUyH
	A/B288qfZDBhYUrK/RdZG8OMn6GlN/Lj6A24m5vuoTyZF/bLPXW2Gx7oPyu2HZGnTSpbX1HXYoz
	R/6MJ/ApIoDknJkouSsAm9YABRWFgVqS7FXIPUUPW8gs6zQtqGXdSgRX+CjglGoOsK+LDV9Y/Mw
	fjeiJvZG1WVLqkTaNqdyDxoPf2r0C+01VqjsFzs/h7ZzcVxG8OEBV3MbQF62phvTdzQy+/9BEUn
	Du8UFhxFm/yVWEfyfWth+D84Ke69saTZ9DjSxirpQlR3O6bovG91IcpRkP5E+E50V1kvxRJ8Fqm
	+NGKVbzFPRDIjrwwPviMaDQi0=
X-Google-Smtp-Source: AGHT+IGM07PPdnFAyjdRcI2Lr6CBSqe/LpDNBm6S1ja4bCgZY3icQ88sKL9ErwuQ+/85BW14fCL78g==
X-Received: by 2002:a17:907:934c:b0:b72:6ace:e5b6 with SMTP id a640c23a62f3a-b73677eea46mr30156266b.10.1763059316266;
        Thu, 13 Nov 2025 10:41:56 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b734fad48dcsm215301766b.25.2025.11.13.10.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 10:41:55 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Stefano Tondo <stefano.tondo.ext@siemens.com>,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com
Subject: [OE-core 1/2] spdx30_tasks: Fix SPDX_CUSTOM_ANNOTATION_VARS implementation
Date: Thu, 13 Nov 2025 19:41:46 +0100
Message-ID: <20251113184151.511039-2-stondo@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251113184151.511039-1-stondo@gmail.com>
References: <20251113184151.511039-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 18:42:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226259

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


