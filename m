Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D0AFC5DF8F
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 04:53:53 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14686.1771649623277581589
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 20:53:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mhssqWCA;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso20060945e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 20:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771649621; x=1772254421; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fjyqalbZYUb+23wMOsPHkc8uj/DQ0bbU/0CDSbIQ5OM=;
        b=mhssqWCAYFbte93me9Yzvdy6ttmMENOkaYI4gMyHvJpF2tLZw8Dgw/mIz86AJjD0eT
         8AD4AkJWNrGh14YOrAm7U5BpPrS5k9WzE52vu7aineRrhDtKz3LqpO73SxbfQx0TrRf8
         3Y2JoXjlq6xnUaq9/MZvUS2tlSFTBS84GWVcNFFd7dovrLtj5ngQ6ymwb7e8m2ypJew5
         iRMuxlQKLmTUBTRqVDIeImWUmO2EzJSEhhv3OjRvW4POHzAPJ07pmLpNvZE321VvJfHU
         I7nofg5ihfVpNrNhyWsLL/3+Es4YPCRgB0Z37NY0ZelE5/LkFgbEtW8bnBtUum4WOiai
         eFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771649621; x=1772254421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fjyqalbZYUb+23wMOsPHkc8uj/DQ0bbU/0CDSbIQ5OM=;
        b=qAC2qPEXSseEpmTZILPUT7tVj2+LuH3O9ideJXBlUaEIHV0hFnd9BkjmjF6qDEMisl
         D/K0jgZHjxtMTrdTHbMgZ6EvlVt5uQazOx4MA/Vlv5oEan5NVN/A/TLcbOLq1eof4xob
         9Rx8UwtSsk7bwKKMuPEYXWMuMST9HLF5QdsrG4SD1sLDbC5XCYdFXMeePw6CFKR+UDCW
         XFKHnJODiRwr9Kb1fWFYy7QdeRJfiQRbW+PxRQxP6pXC1C0fHXNCB+Km5kpIguisXC1A
         hmLCzuXAy3TdgwWg5Iw/mpzLd5QlQBhQagrO39231XDo+FWmjzAx2i7sN39i8jTtBi1I
         npfQ==
X-Gm-Message-State: AOJu0YzRZt/eEK1UJ7x1llRRJiuqndMv5/b0qpoMzreecRSBcHPn3zmC
	NMpvGaO0tD8g9wzFP3hwRay2N2kXjUvhqte939ZvYbPZOYqRGwPXFyobtcIaqj9P
X-Gm-Gg: AZuq6aJYXcroBDpdaOmhEi36Plls3TC7EBMS7zPznBF4n6pXmbJwBJHeXznMEzUjk/G
	cI4tq7JYZHTJzbIaONtMLNE62sC52FfK4Nvyh7hj2+5Af8fQsf2ZvNpCuJdydV4yfbNFsGCMCvz
	Pf5qhRSdcF3kVMIK3SQ9ZcN9uqOOYypMzOMpKaIMmKFQg4wEidFkfYaR8U6HweTXjVIU83e9V5V
	T1lc02EbUOJbYsiu3eDrKL/nVvwqZdqQUuSuUr3T9p1hsTPcCKYmFF3kLTZWYvEHKTBJ28f45Sf
	VoZ94dUSMlIpFZKrEAjMJE4p4E49gGK7S/L8VjrRgEyER7HPW+btPMPPGNj8RpW5bo+zlDiI250
	D85ap3JLwPak9Q76njXoe855p7o9OmJ47UkJ1hDBVfoY7Ugpbwpfx+gVvXOBt4Acn3189olM8qU
	Iy2Uqe9UFdplOuO7Lgx3Ur6i+i40sgzZcae7U=
X-Received: by 2002:a05:600c:5486:b0:483:709e:f239 with SMTP id 5b1f17b1804b1-483a95dea69mr25078435e9.22.1771649621335;
        Fri, 20 Feb 2026 20:53:41 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a4e8d392sm79561495e9.2.2026.02.20.20.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 20:53:40 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com
Subject: [PATCH v2 2/2] oeqa/selftest: Add test for lifecycle scope classification
Date: Sat, 21 Feb 2026 05:53:37 +0100
Message-ID: <20260221045337.327402-3-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221045337.327402-1-stondo@gmail.com>
References: <20260221045337.327402-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 04:53:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231579

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


