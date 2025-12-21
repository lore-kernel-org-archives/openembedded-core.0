Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0689E67499
	for <webhook@archiver.kernel.org>; Sun, 21 Dec 2025 21:37:46 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68641.1766353062173661845
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Dec 2025 13:37:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mDcHodL2;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so3141706b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 13:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766353061; x=1766957861; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Jbn8QFKLhVRdw2Xof4xV40pn+Emtm83BJq0m7G3LEU=;
        b=mDcHodL25PSA0g3gKjeehTEpHZIgFJoAfkPa/T1yrllLwfy2ecJ0YA9WslthWvCJBb
         AVmpWPTxW5fkbI0EPQv4R6HcFwgU/M9Ix99p5h1T4VXtea4fvLCn8rhxrXuLvCp2yKdp
         CtGlzIWB5YylrVA7PY2+8VeLJ54TFCEwiJ9+hKIyA7DW/cjPkQOh0nb93YEduFYqbT6R
         fX6WlPNDUoWqvtdI+kDAMndV6miI/VhYk6PuxLxY1bjrZaVVVgKodEXbg/zJNqYYGHER
         ZVTo62cGUpWnBt6WEQZQvkjn0EPZKUt94CBIjpL7gazH7MqJqTsLRRJmm0oERh+ghZlJ
         i1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766353061; x=1766957861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4Jbn8QFKLhVRdw2Xof4xV40pn+Emtm83BJq0m7G3LEU=;
        b=BxkDR8pArMWux1mnWVI0FXQacXxQLayHl0evBXtHuCxj2D51qx/fryZHkKOIRMkYsz
         jc4VPBYRFdTnj75MxNH1v+ZgE3iMphgMaZy3HhY3Gy5l3HLliTTystMPHzi9P7g8dhed
         w1PI93Un1OY5JPXYEMt6SATpziY4t3VFr3/G7WWA0QagZjCSQ/IIzyoRFqJ+3di+8Om2
         0yt+++5FJX+u4IbLlMnKUgmuSWBb/OZNYhZ2Ve+gMgqDTarM5iHiukuPfVUNS0tjxIZO
         Vv0mxsvEzXZV+GIjpq8X3b+sIXHvteyLE+SA0I0LF8EIXvcwPzwu/IdB13rUZ6cT3Sqb
         D4UA==
X-Gm-Message-State: AOJu0YwmlgdBU2oHuXjSAy3b2QB4XXwKxT0+9ckppZVwICP1+KFMN10o
	0kBnmXxYvoIOGq0SoQyckWBr9KZHzdeme1eilpBLe1Vyfeml6PzCi6gcuhqtmTHOa11iXbWoUZ1
	E7FzlU6I=
X-Gm-Gg: AY/fxX77l6eg+speTxaduPaoTZB/L1TgHMWVfxfBCTEPU0RuYN3j0N025t2roLri+mm
	8W3XStSrRONGthOQ8c3c3+jHOHFmm+oHg7X7jbxKwP8O2jrHHBtcauTGhHzqS/Y620+x5VMJ3lo
	P+cqqGBu++wGn13CnTOaLmiU+/a7UB6cYR+doIR6gR+nU98ie+x3iJGxXp+24F52bPo6ldjACjR
	WqQtD8uo71ehOiXjC86z7WaKCx+4D9L6qG9qt2bT+GLkJd8XRTJWi8f8pH3t/syfYRxgWI4aVsD
	0MKyAD0aGKzCwIBtRlKQ+Ax4MwQYC2M6/t9VxnsJmBkuwTU3CBxnV4z1TRVd6GHBxhzMPmpnWrO
	kFOcRZh4Yk3KmIUaopLBr7JcmguWKzB89bQgkmguLS/+0LWuMs5gsk3MQJHOgDZM75A5NluNacU
	HymuolNtAi1BM=
X-Google-Smtp-Source: AGHT+IFdYB4FNRiBCJ64vWd+1EriBXF4bzaqvYF5F6zyE1oDPax+lpsgAL1Z4x2UHviBi3pBAkTkJg==
X-Received: by 2002:a05:6a00:2a0c:b0:7f7:1cce:d7b4 with SMTP id d2e1a72fcca58-7ff657a1000mr8237421b3a.1.1766353061374;
        Sun, 21 Dec 2025 13:37:41 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:dd61:72c7:d0b8:fed])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfabcbcsm8211166b3a.31.2025.12.21.13.37.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 13:37:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 12/18] spdx30_tasks: Fix SPDX_CUSTOM_ANNOTATION_VARS implementation
Date: Sun, 21 Dec 2025 13:37:05 -0800
Message-ID: <85eff3e7b70d5a2b343aded0564f86aba7371d76.1766352840.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766352840.git.steve@sakoman.com>
References: <cover.1766352840.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 21:37:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228270

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/spdx30_tasks.py          |  4 +-
 meta/lib/oeqa/selftest/cases/spdx.py | 85 +++++++++++++++++++++++++---
 2 files changed, 79 insertions(+), 10 deletions(-)

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
index 8cd4e83ca2..f548dd4be7 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -34,7 +34,7 @@ class SPDX22Check(OESelftestTestCase):
         arch_dir = get_bb_var("PACKAGE_ARCH", target_name)
         spdx_version = get_bb_var("SPDX_VERSION")
         # qemux86-64 creates the directory qemux86_64
-        #arch_dir = arch_var.replace("-", "_")
+        # arch_dir = arch_var.replace("-", "_")
 
         full_file_path = os.path.join(
             deploy_dir, "spdx", spdx_version, arch_dir, high_level_dir, spdx_file
@@ -89,15 +89,12 @@ class SPDX3CheckBase(object):
         return objset
 
     def check_recipe_spdx(self, target_name, spdx_path, *, task=None, extraconf=""):
-        config = (
-            textwrap.dedent(
-                f"""\
+        config = textwrap.dedent(
+            f"""\
                 INHERIT:remove = "create-spdx"
                 INHERIT += "{self.SPDX_CLASS}"
                 """
-            )
-            + textwrap.dedent(extraconf)
-        )
+        ) + textwrap.dedent(extraconf)
 
         self.write_config(config)
 
@@ -286,3 +283,77 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
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
-- 
2.43.0


