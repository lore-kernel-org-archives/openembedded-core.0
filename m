Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1164C5DF99
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 05:10:33 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14925.1771650625939088163
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 21:10:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QEbAoRoy;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-483703e4b08so21514885e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 21:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771650624; x=1772255424; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0i5SUA9+DdN+UBmjiT9Uh/B+IelUJomMGl6PbM+Yjc=;
        b=QEbAoRoyu3plfhwYtZtTMZTE/K8ej71kyC84HcUNbMqpaGtSsD3boPH9XVpFaV9H51
         dRjY1ucK3OMXhg3qqg3Xif14kDoylCZ0/ly9VO8CJsqXK4w+kPfPygtox7BbruBa3lGE
         L1XsMFW1Fkckkk1npn7f+oDEq7gfe4+k5JFR4NE7CBtZFTYEDclBN2SPQoiEctyUWTuW
         1DhtuF3RExbF8mxfKU1D4i38HDH+xG/tXkm1SUVe2E+SyDT0/kT3K2rom7jKgqKQiP/y
         mSxUisKujeADjgf1/ooi3v0SQHnL+I8eKCfDe3jP6bG+LOWK08X9dsvimBwFbhiEiVI6
         WlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771650624; x=1772255424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r0i5SUA9+DdN+UBmjiT9Uh/B+IelUJomMGl6PbM+Yjc=;
        b=UbLqOy1l7JDiMrUcJTG2TC2rq7i6JhfKc6NP4xC7VuQW0a0HGuOjYGQ91nOpSFuPXu
         APNmpr/6sr/cf1P0U0PSMF6VwSPSEFXac5FIGsPjQZEmJnP0V4JgvwNExvcskIaWMvOp
         BddhmYoNURhzmePiX36gSwNtY60ObQOBqXdMzX9lODa98n4baFlP1ufyz+Aiaa0nNxZL
         NIpGNfj5qSi9jEY1FP/uMsLSDhUddwEj2tI76JV7SsJ8SePDV3GnntWAr6n2C2K3uj7s
         N+n2QB+4R/fq5ZotKqAnwRR0AgjuI8utYsJLe7OOIwL2sfxn6oRFI9Ew4gF+JCS9ErHc
         uojQ==
X-Gm-Message-State: AOJu0YzwSL2c+1sLU+R0ujMlOy8RdkfP2eGMK4Icu5DPoDcmWR7ZOvyw
	ez/WfmleRrAL+cKkHUmhN/8oukKIAVuKRxsMpJIB2EQX+cWBFxyOeI7/F2tPuA==
X-Gm-Gg: AZuq6aKIvrHSkijJvWbtaClwFo7C6rk3l9hI78gdzbDBZToi3ZnqBwptTtMxNWnHvYx
	ulFyJzP5K5j6uNRbh62Ews0qOsgLKbe3Ujf/If7cw2Y+76ho65xFWgAZHTJ28SuYcd2W6QV1O/K
	4W9ijtQENcIVG7w1DMeOAwb3/Ug9fFWGngpq8ljqh2IXW1Ppouc4x3xly2+uX2xbkwEszwCgjJY
	EftnowEKHU8bF4Kg0SGA/EzVXrKjgV7czhdXC9zHJDmMSuyc47UQs3p/TYjb6EvdplNWkpZSJwP
	NfyxAUU8VNvZmFyYa+TaEnAAqC1P57/w5Qy7UYmzcSpWF6s7h94gkVRTSJRiKIhUX6IM1H90q1f
	7sYINOgVsMw4C7MxFTM6PpHDjjYGe6Ad5O+GHb0DnczOctU26w1e8en8T/+egrotR9EeM/0taEv
	E6VMV2ffogOq2HdBH4Lg3PF32XCo/tPPyZcBI=
X-Received: by 2002:a05:600c:a204:b0:483:fbe:23dd with SMTP id 5b1f17b1804b1-483a00a52bdmr94756025e9.12.1771650623924;
        Fri, 20 Feb 2026 21:10:23 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bfa1bdsm2455901f8f.3.2026.02.20.21.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 21:10:23 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com
Subject: [PATCH v2 08/18] spdx30: Include recipe base PURL in package external identifiers
Date: Sat, 21 Feb 2026 06:09:56 +0100
Message-ID: <20260221051006.335141-9-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221051006.335141-1-stondo@gmail.com>
References: <20260221051006.335141-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 05:10:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231588

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Include the recipe's base PURL (from oe.purl.get_base_purl) in the
external identifiers for built packages alongside any PURLs from
SPDX_PACKAGE_URLS.

This ensures that every built package has a pkg:yocto PURL (e.g.,
pkg:yocto/core/zlib@1.3.1) in its external identifiers, improving
tool interoperability and supply chain tracking.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oe/spdx30_tasks.py | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 9f5a37b8bf..ef47bd4205 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -853,6 +853,7 @@ def create_spdx(d):
         [oe.sbom30.get_element_link_id(recipe_spdx_license)],
     )
 
+
     dep_sources = {}
     if oe.spdx_common.process_sources(d) and include_sources:
         bb.debug(1, "Adding source files to SPDX")
@@ -886,6 +887,8 @@ def create_spdx(d):
     debug_source_ids = set()
     source_hash_cache = {}
 
+    recipe_purl = oe.purl.get_base_purl(d)
+
     # Write out the package SPDX data now. It is not complete as we cannot
     # write the runtime data, so write it to a staging area and a later task
     # will write out the final collection
@@ -953,7 +956,12 @@ def create_spdx(d):
             if purls:
                 spdx_package.software_packageUrl = purls[0]
 
-            for p in sorted(set(purls)):
+            # Combine SPDX_PACKAGE_URLS with recipe base PURL
+            all_purls = set(purls)
+            if recipe_purl:
+                all_purls.add(recipe_purl)
+
+            for p in sorted(all_purls):
                 spdx_package.externalIdentifier.append(
                     oe.spdx30.ExternalIdentifier(
                         externalIdentifierType=oe.spdx30.ExternalIdentifierType.packageUrl,
-- 
2.53.0


