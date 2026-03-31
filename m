Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C5D109B474
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 14:20:22 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21558.1774966813698704919
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 07:20:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YpbQ4S3e;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso59419335e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 07:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774966812; x=1775571612; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I4/g10PzmXSArNoJyRAoXKR7hLguNMyepeOuPFE/W1k=;
        b=YpbQ4S3eAIZLUJWPvi5nOIsmHY7FKTaXNxbXEu3EZVmpsS/L8cR18WAUFp7gjkN24S
         1jbJS2+V+OjNpuvmKDG+5sRC/YPhsjFQdps8bVXlY2GWMHnMO2VJKOGNk2YMuWgs6fxe
         76deqohomnR/TXRipOg/LUZGNTSlsaqtICkKoryjXVno1ftuej+W4f2EKVaKkPt1Bkpx
         DcGRu/EPiqyWba3+Z4yEMoZcqDrHOLnLmcLvFlftuLUTyPhISkSQYqQngyAbsEhM/OMa
         UGv7Ilv1qQ5dw97R7K0bPd5kCcLOnkVArnOfcY7FzdVcM8ZdJOLFPbJBuaKOndwGPY2y
         5XKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774966812; x=1775571612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I4/g10PzmXSArNoJyRAoXKR7hLguNMyepeOuPFE/W1k=;
        b=OVEi7QFQOAuRhU84FFu4X1R1pCWt+G5WcJl7ubOyuKpNJ04GQe2EmkIvb3xhGhXAqz
         qOIFHLOSi4fIFO0sVLmHB1k3bbz1cTRY4tV15z30VmtuXLM+Fs2RPu+ggIbKbj/DhnXn
         x5wkgBp4rlB1QwSu1qa3jUbtJ2TmSi67CgOLVK4xoJi2muBoUzJu5B10G5X7+1XxJTru
         nHoZHRzyLof+feQL+MOmQppS/LHHk1CTycQu1J/1AYwz2rXppJ4PCm8FujwJG7m3tHp0
         /Jji0mtNLlbmKm5ReEntcrHXqQx+IjXInPeD7KwfxY6UMGRBxtVMFGQ+trwQ4lTeq8sV
         OPQw==
X-Gm-Message-State: AOJu0Yy1NpfuDAfAsOYA1IM+o2Mzb7jVN74q+d4FVrcYVU+oVbkHkDlK
	gBErqU3ZTz9Be27qZClDSIM+WotuzpXExP8K6W2yEARNUpNmBrhN9tAgRfMHgnBuTUs=
X-Gm-Gg: ATEYQzxxGja9zhpsj88i/vhw9WkY5xgkKXykY8TNJgmCwHHHoLCirNeZgXFi8X0VWFv
	TsBIt31zhNBMFY3vi82i2nQc28lpWuIWRZ7ZN/UyklZ00bGrTZx/gkHea5LhSymCVfUAMIBTALy
	T2F9fn3WtWEOfngU93IwEehbANDnu/Hd7PXQhJQ9KKOzA5objdDLqg9p5C99alYZJIw0cYcES8H
	ZH/xb2wqf/eYyqBach/LotcOX+2NzclENPEDhHgX4WFQ+Xtx5u/B7YVcrSxovl5FTXsMIzPZAy7
	MXGwrizPz2cHR09MQ54pp0HD0++J9V8rNcknxVQe5Ree30IlkkXkDjGEmTwmJuKvQnN+7t9jQDb
	XxE66N7xGD+yc8N5ayiBP4clX76swZXVWTbC5jZwciZMnQ/etz1VJ+m38mer/GRU1zjnvJHPB9N
	dmFn1w+cu/ThJYqNhYdx7IK+GWVqBlpty4D0+v9bl0k6KM0vroJqQw2O1vP4TlI5jHy6vFHy7DJ
	RCKLA==
X-Received: by 2002:a05:600c:2d4c:b0:485:364e:9328 with SMTP id 5b1f17b1804b1-48727eda499mr174744415e9.16.1774966811609;
        Tue, 31 Mar 2026 07:20:11 -0700 (PDT)
Received: from fedora (mob-194-230-144-65.cgn.sunrise.net. [194.230.144.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c536a7fsm40865415e9.1.2026.03.31.07.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:20:10 -0700 (PDT)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	richard.purdie@linuxfoundation.org,
	ross.burton@arm.com,
	marta.rybczynska@syslinbit.com,
	benjamin.robin@bootlin.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	mathieu.dubois-briand@bootlin.com,
	stefano.tondo.ext@siemens.com
Subject: [RFC PATCH 2/2] oeqa/selftest: Add tests for OpenVEX integration
Date: Tue, 31 Mar 2026 16:19:56 +0200
Message-ID: <20260331141956.608976-3-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331141956.608976-1-stondo@gmail.com>
References: <20260331141956.608976-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 14:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234293

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Add two test methods to SPDX30Check:
- test_openvex_integration: Verifies VEX relationships exist in SPDX
  output and packages have PURLs for VEX product identification
- test_openvex_standalone_files: Verifies standalone .vex.json files
  are created with proper metadata when OPENVEX_GENERATE_STANDALONE=1

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oeqa/selftest/cases/spdx.py | 90 ++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index 8285189382..661daa17d8 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -443,3 +443,93 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
                 r'\d',
                 f"Version '{version}' for package '{name}' should contain digits"
             )
+
+    def test_openvex_integration(self):
+        """
+        Test that OpenVEX generation is integrated into SPDX workflow.
+
+        Verifies VEX relationships are created for vulnerabilities and
+        packages have PURLs suitable for VEX product identification.
+        """
+        objset = self.check_recipe_spdx(
+            "busybox",
+            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/static/static-busybox.spdx.json",
+            task="create_recipe_spdx",
+            extraconf="""                OPENVEX_AUTHOR = "Test Author"
+                OPENVEX_ROLE = "securityAdvisor"
+                """,
+        )
+
+        # Check for VEX relationships (any type: Fixed, Affected, NotAffected, etc.)
+        vex_count = 0
+        for rel in objset.foreach_type(oe.spdx30.security_VexVulnAssessmentRelationship):
+            vex_count += 1
+            self.assertIsNotNone(rel.from_, "VEX relationship missing 'from' field")
+            self.assertIsNotNone(rel.to, "VEX relationship missing 'to' field")
+
+        if vex_count:
+            self.logger.info(f"Found {vex_count} VEX relationships in SPDX")
+        else:
+            self.logger.info("No VEX relationships found (expected if no CVEs)")
+
+        # Verify packages have PURLs for VEX product identification
+        packages_with_purls = []
+        for pkg in objset.foreach_type(oe.spdx30.software_Package):
+            if hasattr(pkg, "externalIdentifier") and pkg.externalIdentifier:
+                for ext_id in pkg.externalIdentifier:
+                    if hasattr(ext_id, "externalIdentifierType"):
+                        if "packageurl" in str(ext_id.externalIdentifierType).lower():
+                            packages_with_purls.append(pkg.name)
+                            break
+
+        self.assertGreater(
+            len(packages_with_purls), 0,
+            "Should have packages with PURLs for VEX product identification"
+        )
+        self.logger.info(f"Found {len(packages_with_purls)} packages with PURLs")
+
+    def test_openvex_standalone_files(self):
+        """
+        Test that standalone OpenVEX files are generated when enabled.
+
+        Verifies OpenVEX JSON files are created with required metadata
+        for a recipe with known CVEs (busybox).
+        """
+        import json
+        from pathlib import Path
+
+        self.check_recipe_spdx(
+            "busybox",
+            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/static/static-busybox.spdx.json",
+            task="create_recipe_spdx",
+            extraconf="""                OPENVEX_GENERATE_STANDALONE = "1"
+                OPENVEX_AUTHOR = "Test Security Team"
+                OPENVEX_ROLE = "securityAdvisor"
+                """,
+        )
+
+        deploy_dir_spdx = get_bb_var("DEPLOY_DIR_SPDX")
+        sstate_pkgarch = get_bb_var("SSTATE_PKGARCH", "busybox")
+
+        vex_file = Path(deploy_dir_spdx) / sstate_pkgarch / "recipes" / "busybox.vex.json"
+
+        self.assertExists(str(vex_file), "busybox.vex.json should exist (busybox has known CVEs)")
+
+        with open(vex_file, "r") as f:
+            vex_data = json.load(f)
+
+        self.assertIn("@context", vex_data, "VEX missing @context")
+        self.assertIn("statements", vex_data, "VEX missing statements")
+        self.assertGreater(len(vex_data["statements"]), 0, "VEX should have at least one statement")
+
+        self.assertEqual(
+            vex_data["author"],
+            "Test Security Team",
+            "VEX author not set correctly"
+        )
+
+        self.logger.info(
+            f"Validated OpenVEX file: busybox.vex.json "
+            f"({len(vex_data['statements'])} statements)"
+        )
+
-- 
2.53.0


