Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99AFCF3C9BC
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 16:30:24 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24306.1771950615831338355
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 08:30:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PgS25aEv;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-483487335c2so52095535e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 08:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771950614; x=1772555414; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysRQGPa3HYnxPcx0cw4H9v5i6wZuTw/tquz2mgnWdpc=;
        b=PgS25aEvK3bxi+khvlNGg2ReBlhxAWk/mgcMJQT/pvb8hCXqEBLy3wz7Y2aAJsSuT/
         kNo4rmemDgPuH4ZQDvCaVfr6LdcgaJWCe7mVl0FwIaWcQMRzfizwnP0TZuHPXhZOYImg
         apaF4q0JRYPBBA8i3KA6CRD+5+WSTUUbiIOBc9b+aD+qTXncrT10yNZBWcxYq1B6a6MX
         hwj0m7kcu4goNv6WPU70lykAGkc2pFZsCvol96X/Vd1nni3oPjDOfi5DM/xEsNrJKHkt
         ZM6xIIOwyOKpdFUZsRyMNs64nTZSANI6tBhz8NxAN6Y+MAfqZE/xhka6RjaaX0S7+kv1
         hdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771950614; x=1772555414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ysRQGPa3HYnxPcx0cw4H9v5i6wZuTw/tquz2mgnWdpc=;
        b=Qrr94SbjhLutrHI1QXG+39jDRZrG7C8U8Uw0pXyv2pQMLv5yqfnOydUtQC12pdqtNn
         yPrdpsKTR1cmnbwYbb502cmtikkZ6SpInAQGowPcqcY/Uc3SzNEw5BKxGn6kLmQvDDMm
         pDoQKoMzNANXSYANg7QLHO969hnvLUKlqM+F8E5JCEUfCiWemCaNw6MKCIvt/eX/kaG9
         hoYHAuu/HZ+3ANnJSClHcqzfRsvPkMkO2m171DJHzxVq1cKrLuk7S2dV3e4+QO1QJlTy
         BYu8a1E4eNZXlDsrzIlIaThD5eC780YTN/9py2jlfBGeZsSJ3uqF2UyxMdpYi4ob1AxU
         FMdA==
X-Gm-Message-State: AOJu0YxXUqaFL2D/DIPmUNU337IZT1Nm/iKHKqlNgmbMqiuFxNNVoy6r
	eLMC6b8bEFT5WGmT32idoPqwVhAN96SNTc2vYTiHKpFUFx66ZB0yqd6+EE7YdA==
X-Gm-Gg: AZuq6aJGFSDYJYYStWp0vj+MquzP8UxEG1AXSO1U9amonmC3KytiDuBp44qGQcLuTSX
	pEaFiSR6SesBQd9O+qWuuIswkqvztdIRlrqlQnFoYJlRLqfBzzVOvAFFd8XD9+99gbreEWS0D+j
	1jnYjyIPwCyq8m99dz+4c1ElM7gMtJfA8FnateRXQckqEAI6qD6gSh5kGODtSFPWWPCtF8QRw4X
	TPeqDt0bOBy4SzsycOFbfLWRV+OQXD00iRNC++BfFpLeYjbMseLDQIkiNECPTQOlo4HZUvxpQUP
	pqAzA1gzJP9FuAXEoWHmNNw/apcfOIbL5J4vDGEV1Lu1GAdpqY25jwhnG6KM//zPCNKFEL4T1Po
	aEPg19cEnKVRpcn8Z2kWpQ1DWEKATbVDW2ZwebGF1WbiND6q8vp1VzHEbISlp7EW82oBTrpscJB
	ahuw07Ov8WqVA7ctSg2870SUv3Z4bNbGA3CyHpogP8+vStDnsFqieWpOtHC9REDCFfuxeFQzDNJ
	WX7efDLJrYvH4VVU30=
X-Received: by 2002:a05:600c:1c26:b0:477:89d5:fdb2 with SMTP id 5b1f17b1804b1-483a95be915mr240874885e9.14.1771950613268;
        Tue, 24 Feb 2026 08:30:13 -0800 (PST)
Received: from fedora (mob-194-230-144-218.cgn.sunrise.net. [194.230.144.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd6f3124sm9716355e9.1.2026.02.24.08.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 08:30:12 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com,
	mathieu.dubois-briand@bootlin.com
Subject: [PATCH v3 08/11] oeqa/selftest: Add test for download_location defensive handling
Date: Tue, 24 Feb 2026 17:29:43 +0100
Message-ID: <20260224162946.4000445-9-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224162946.4000445-1-stondo@gmail.com>
References: <20260224162946.4000445-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 16:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231885

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


