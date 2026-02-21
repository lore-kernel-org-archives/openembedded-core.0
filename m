Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECB8CC61DC2
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 05:10:43 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14950.1771650639097010806
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 21:10:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Um4PymDJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-4362d4050c1so2718435f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 21:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771650637; x=1772255437; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fjyqalbZYUb+23wMOsPHkc8uj/DQ0bbU/0CDSbIQ5OM=;
        b=Um4PymDJPko2YaPYj/yWhjw+qVSVwRoa8AgWyfGF6MOI+Da3Drd8dZi7fUgizyGm7u
         w0p7cQlnSmfBzLZAWsfo6wGBd4RY86q0MTP8+C3bA7w453d7GzIzptJKOtsdRnOb5Fcz
         bHDBHJxAAM2tO9yR4umu69ocuDfz9FQZs1CPZl6MeXDCnB9qmbaCoNo7UeaM/FxPxwwU
         PfByrzUQAMqDC+gcsSdVqY2VUEW3pqRnT+tFxgsSj3F8rr63lfhMbSiUTEoT0lkzo3b8
         MwBpkQ3ihTNSnPmFtjZ1+QuLEuRvX+jUzdUiGfTTkEFSSn5G5Vs737/pI5pyUo5RZzwG
         DNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771650637; x=1772255437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fjyqalbZYUb+23wMOsPHkc8uj/DQ0bbU/0CDSbIQ5OM=;
        b=HEFSL4MdLseUbbvdxa533R3bDy6J9E05kcfzHjGn6K5wnSQ+sLHjPvgI5fMfcBnuRH
         9X0gk/vSJ3apR+sqElAl5SvxEdAx0fB3tEN5fVcPK02+5kCUSi4C7IQ1QGrRfUR9pxNq
         S21T3iaNHe7MIiNhL4cY6oQClUnGXdkeaZWhIpykXRC/+iSJT8uzdBiVflSAa6kJ5ggD
         xMOEUUVaJ54XOh/gtveOE/kZQfq8wueZVJ61ccSdT+lba4S7QZ3RrMzvsQ86mEmmPiAQ
         HwqZY4pPKkIpGhgkYnSuOMSHZNLbRDVxr3zxF7zE5RhQCzRfbekRjoIY3EOXaT3FGPam
         mr8g==
X-Gm-Message-State: AOJu0Yzv/YoLumQ+2yAeiRRY1vFfYBYEhMdbjqWiV5UVIFBLeDH/9QIU
	2LcQJN7jeDGkIvbRH/0QKf+llzLGStxfjcYydH5MgItsSZYBdl2m2wIbAQyoq7zu
X-Gm-Gg: AZuq6aIs9hEaBcS5ICjW1pIA65FWN4r77j9xRR6W8hd0FGGOy2LFr0HtX/wyIa7ifBL
	8z26o6bXuizeiHnedaj15Ma0sf64ZV8qi2aJ2Ot7Zk7XSNlun82fOpcJR3UnZhD8n1CbKOix1PE
	D2FN5gcbrYWljT36JvTtMgyBAwFsJDBkoUZqfZ2znMnDptwNctqn1AdiZoUvxtsjoy/wHGJKd2D
	na9BFwZn/8100cxf5V9D9sziQl6u6HOq0VQrsMirXV0qOgVO+X88eGNl4bYOIIwpnjYL6GkJj3Q
	a68sAl5BK1IKz6evg9x9bl3TZkUwLAd47MPvxwO3emPYYdnyuTbvrV53C+IEd8t2vSPoi5R3Utw
	gY1xRUV4sEoDnjTwNU4TRw01LI/O7D/CfRpfhKs9aDpXFYs3qI0pMja8NbiBsBDz4XSxrm1vNAY
	WVogIDwjlrgQioKDgk/LIJX5Z30hmrZdw9cG/DLLzymKygdQ==
X-Received: by 2002:a05:6000:604:b0:435:9a2b:53d0 with SMTP id ffacd0b85a97d-4396f1816c4mr3820015f8f.45.1771650637083;
        Fri, 20 Feb 2026 21:10:37 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bfa1bdsm2455901f8f.3.2026.02.20.21.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 21:10:35 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com
Subject: [PATCH v2 16/18] oeqa/selftest: Add test for lifecycle scope classification
Date: Sat, 21 Feb 2026 06:10:04 +0100
Message-ID: <20260221051006.335141-17-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221051006.335141-1-stondo@gmail.com>
References: <20260221051006.335141-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 05:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231596

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Add a selftest that verifies lifecycle scope classification correctly
assigns runtime scope to dependency relationships. The test builds
'acl' and checks that its SPDX package data contains
LifecycleScopedRelationship objects with runtime scope, verifying
that implicit shared library dependencies (e.g., glibc) are captured.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oeqa/selftest/cases/spdx.py | 39 ++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index 9a0ef526d2..a01d8d567f 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -489,3 +489,42 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
                 r'\d',
                 f"Version '{version}' for package '{name}' should contain digits"
             )
+
+    def test_lifecycle_scope_dependencies(self):
+        """Test that lifecycle scope classification assigns runtime scope."""
+        objset = self.check_recipe_spdx(
+            "acl",
+            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/packages/package-acl.spdx.json",
+        )
+
+        # Find runtime-scoped dependency relationships
+        runtime_rels = []
+        for rel in objset.foreach_type(oe.spdx30.LifecycleScopedRelationship):
+            if (rel.relationshipType == oe.spdx30.RelationshipType.dependsOn and
+                    rel.scope == oe.spdx30.LifecycleScopeType.runtime):
+                runtime_rels.append(rel)
+
+        self.assertGreater(
+            len(runtime_rels), 0,
+            "Expected runtime-scoped dependency relationships for acl"
+        )
+
+        # Verify dependencies reference other packages via link IDs
+        all_dep_ids = []
+        for rel in runtime_rels:
+            for to_elem in rel.to:
+                dep_id = to_elem._id if hasattr(to_elem, '_id') else str(to_elem)
+                all_dep_ids.append(dep_id)
+
+        self.assertGreater(
+            len(all_dep_ids), 0,
+            "Runtime dependency relationships should reference target packages"
+        )
+
+        # Verify implicit glibc dependency is captured (auto-detected
+        # shared library dependency)
+        has_glibc = any('glibc' in dep_id for dep_id in all_dep_ids)
+        self.assertTrue(
+            has_glibc,
+            f"Expected glibc in runtime dependencies. Found IDs: {all_dep_ids}"
+        )
-- 
2.53.0


