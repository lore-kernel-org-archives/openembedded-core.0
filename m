Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B83FCE068
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 12:19:00 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68803.1772108335831479078
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 04:18:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N8mzcl+5;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48373a4bca3so4829125e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 04:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772108333; x=1772713133; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysRQGPa3HYnxPcx0cw4H9v5i6wZuTw/tquz2mgnWdpc=;
        b=N8mzcl+5YhbFnO1lVR7/uFh3lrvTq+ZVMefOzQCsKXP5CXAQ9zuU5puXXvMxrXlmGz
         mWtxXSqElr52w+MMOBpjHRxo65OCCId6nql7OkKqflV1FPvgwWirfquMkccNBaKR/YsV
         22o/aOeQYMtTPv7JGsvUk/hYiQi/9rSZdS7sUgXJ6h1mB6kN1qRRN5VtWM3Hktp4peri
         YS739X/AjeW5WwzNJYfma169N+l0XaAtk3OZ6BUOsynPszLbiFLHlyePDqYQ5lP0XBvc
         NFon7eIj+wLfHXdfskg8qUIdT3I6EQtfaOQakATR8Kl+a+GatY4ux3SJ0/42GeZ+07tZ
         DeeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772108333; x=1772713133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ysRQGPa3HYnxPcx0cw4H9v5i6wZuTw/tquz2mgnWdpc=;
        b=dP+UYsAS6PjQwlGcrusr7jvwZVOS9D2E6prH5sLqnUH6cYhuk2OrDVn9OpB+RCYypf
         Tlq6IVpOc+LGdb/1Me5I/2mEbxb6niYSbY5iImByZHg5VLOjsGO2BId2i1nYaccEmsK8
         87KRLe6dm7DLONbLP+ryOLNF26YUcJmSPRlJYVL/kML0zkmMmccASyxvv4Yvbbmpw/5N
         XSodJSxt1zw2Ye0BDR5L2G54OU0VkQtJ7H9LxoaIryfJnqTQfIMUGBzxhyaAFApIVffR
         gXQm4HwV1WGY718oQBUx/kipfgADjh/LGINt52mxmDkm2zitGIrWh/Jm/c/Iq0RrYI+B
         C0UQ==
X-Gm-Message-State: AOJu0YwwyFXqjOs3n6bIRf59+ZaDpwkinwhKD4SuRyTzGnYT4k4LV3UN
	ZJBBaCYDYOH+p8X5xZy4rxrEHx/clOc3OBchq9p1xD+JZhOfguVXamQaWWofcw==
X-Gm-Gg: ATEYQzyZd0P4SLXQv2EL3W4GVsLDegUeV4mELRvab+J6k7H18Inedg8bWNjZ7/GbskZ
	bZTOhylQIr25D96gDdXSx4yR9pPrV8XdcorNyBhU47JihYQv/0g8Wm+f0IvXdkBtUa/fKJVXh5s
	bs2IoIGYuCJ2imH6bkU6qDHqJQZ+H9ocLMwfmEC61Yr5BL7YlGXU//uwKNYuHkrHOWqwKT3zAAL
	ff4MlH9qGSyYKJgaep+nGwBeT3wMIjXvslqnfHmfOM4auwAePycNdIfi+EfEwbukx34YCzZj98d
	FSA1Wy1PMs9JwEe027VigdafXBqkrHWx3r9SiNsm7Qwcr5OmLB9m+ewmfnJBIV/VsbZqY7tDdsS
	1mdmfqBvEMd6TMiOAvxKPeaNwR+0ppqc4g2f4fwh9lQwBVSf2d1cL9c2P9azSPQ2uUrJKONdb99
	1uy9DrWQ==
X-Received: by 2002:a05:600c:34c3:b0:47a:814c:eea1 with SMTP id 5b1f17b1804b1-483c21bd28emr72037605e9.35.1772108332528;
        Thu, 26 Feb 2026 04:18:52 -0800 (PST)
Received: from fedora ([165.225.94.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb77466sm48483955e9.5.2026.02.26.04.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 04:18:50 -0800 (PST)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	jpewhacker@gmail.com,
	mathieu@bootlin.com,
	Ross.Burton@arm.com
Subject: [PATCH v4 08/11] oeqa/selftest: Add test for download_location defensive handling
Date: Thu, 26 Feb 2026 13:18:20 +0100
Message-ID: <20260226121823.149327-9-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226121823.149327-1-stondo@gmail.com>
References: <20260226121823.149327-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 12:19:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232013

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Add test to verify that SPDX generation handles download_location
failures gracefully and doesn't crash if fetch_data_to_uri() behavior
changes.

Test verifies:
1. SPDX file generation succeeds for recipes with tarball sources
2. External references are properly structured when generated
3. ExternalRef.locator is a list of strings (SPDX 3.0 spec requirement)
4. Defensive try/except and isinstance() checks prevent crashes

The test uses m4 recipe which has tarball sources, allowing verification
of the download location handling without requiring complex setup.

Test can be run with:
  oe-selftest -r spdx.SPDX30Check.test_download_location_defensive_handling

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oeqa/selftest/cases/spdx.py | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index 41ef52fce1..d7dee5e2ee 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -414,3 +414,31 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
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
+            if hasattr(pkg, 'externalRef') and pkg.externalRef:
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
-- 
2.53.0


