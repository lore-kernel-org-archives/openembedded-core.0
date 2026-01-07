Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B176CF6C1A
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 09:17:23 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2295.1767777427173525225
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 01:17:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CVSE0ZOd;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47d3ffa6720so18033835e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 01:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767777425; x=1768382225; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgcbTqY34GY/UbYcWCL4FbUGesSgoCTZ6pTKntAzzrY=;
        b=CVSE0ZOd8WsSdhCZkAKDjeVjXnhCPIKyR4SIm3/dXfoejPDF7Nf3YMQsUUCQ2aAmB4
         jOfKVXnry7Hfw7H1YKgV3ts82rZKZpD8EISDNsIE1IzHDcFd0ZOFH3FXLnz58iaf44ft
         n6yfuZgXepGK3zr32gM0DpNEmfoy051jP/8TeWRpfUeg9HcV4paSxJDjKg5IVE90nzUs
         Vx0A5WiigED/bBNE7UfNBN8aBR/ZK42pgVw5TcMmbk+ULk3wF0krS7wit1RvONGW6j22
         ZBGXl7NkbMhZoZDNrtYCH+yqxvE1DxigCELw3b5964ylmGsiVaexvSUJo8h4tfKNf4T0
         C84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767777425; x=1768382225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lgcbTqY34GY/UbYcWCL4FbUGesSgoCTZ6pTKntAzzrY=;
        b=o+oc6LkzbWp6A8L7GF7HSWvwihn5rDOQH0UCZbWkBHSLFp46ZmP0s2R1S/MPD360f1
         /uLraSRY2BUBKOnTfC1pC6uAEcVZKwpHT4cyETw7oLEXkhoPve8H+XFsFVLinkAENpPa
         LvcSH5o3Pey2mhr3nj6N3IFglJuKKDAYFPei0T9uQ4HhqtktMGra2BcpEKrUwstAQRa4
         C3OlMvc/DiVKUjMFJk107CRlUmtdjVmQ0ldaq5kODvup1edy2b+nzjvUHrCr8Mv02OFJ
         wASc6ZQLJcI7NXVwPyN9h+PAUEDmRyq753Ehx1UEI63oatYMDFdE6wMrgkGUuYbqujYN
         wyuA==
X-Gm-Message-State: AOJu0YzBSzQIV26X0EHzuZdNFCNvcmXrn/O4vpKVI2ztrDvZVDgTESNF
	wTdOGgaWoTwg81G174E8u5vZX2TZr8qs/SUWN0iIYJA91ki1jN2rIjjObXoGrA==
X-Gm-Gg: AY/fxX7xSHLXWhihdumK+9zcosmfp7BnWaREx+O1LusjVPwvRGey8xT1Oi95vBWnFwL
	VLGQCYeUmbGKLazz572rTwHVsQyXcI64Su3c1QA34zS8R7hgRn5BDsPkdiL8zO0bO/MGUPU/o5B
	CRlmPgX+/uNtyOghY6Szj5juWfZeRInX7YHuXXGp0JaefmxpLdLl0EukFzjVI+iBtQCcIOQcdNe
	Mv6j+QNCYulUggydICQHO8nOiu9/5MgHDPZgqrVVL8dzo6O+tO2BG3hNyeh+ALxKtnbH8ag13Td
	Ws/8UH14+IKKdbRdx+BdNCJBtBPJ5hsOu8HJxRM4v32NAIQpeBbY6+KmOh9wW6VQTHnuYylbqi8
	G+lOwehhqPyJE1F1yYLIexuyA4KThLb6Nlr31Cia0MSorCFBMd8vVkLhATdUO/cvuTJ7TUQZF91
	CQA2AAYdDSQwdg+YLPimmQl6Wj5+lDdn9mfA==
X-Google-Smtp-Source: AGHT+IFHnZWRnu7kP5UlR6TGxbLtOdRxBrksLPtOPl4IWZhab8d+qe/XviawSA5VRccY5aa+4Stsog==
X-Received: by 2002:a05:6000:4287:b0:430:f65d:c0df with SMTP id ffacd0b85a97d-432c37a2f8fmr2218458f8f.56.1767777424927;
        Wed, 07 Jan 2026 01:17:04 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-432bd0dadcfsm9211303f8f.3.2026.01.07.01.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:17:04 -0800 (PST)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	JPEWhacker@gmail.com
Subject: [PATCH v3] spdx30_tasks: Add concluded license support with SPDX_CONCLUDED_LICENSE
Date: Wed,  7 Jan 2026 10:17:00 +0100
Message-ID: <20260107091700.21144-1-stondo@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260106112557.53709-1-stondo@gmail.com>
References: <20260106112557.53709-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 09:17:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228965

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Add hasConcludedLicense relationship to SBOM packages with support for
manual license conclusion override via SPDX_CONCLUDED_LICENSE variable.

The concluded license represents the license determination after manual
or external license analysis. This should be set manually in recipes or
layers when:

1. Manual license review identifies differences from the declared LICENSE
2. External license scanning tools detect additional license information
3. Legal review concludes a different license applies

The hasConcludedLicense relationship is ONLY added to the SBOM when
SPDX_CONCLUDED_LICENSE is explicitly set. When unset or empty, no
concluded license is included in the SBOM, correctly indicating that
no license analysis was performed (per SPDX semantics).

When differences from the declared LICENSE are found, users should:

1. Preferably: Correct the LICENSE field in the recipe and contribute
   the fix upstream to OpenEmbedded
2. Alternatively: Set SPDX_CONCLUDED_LICENSE locally in your layer when
   upstream contribution is not immediately possible or when the license
   conclusion is environment-specific

The implementation checks both package-specific overrides
(SPDX_CONCLUDED_LICENSE:${PN}) and the global variable, allowing
per-package license conclusions when needed.

The concluded license expression is automatically de-duplicated by
add_license_expression() to avoid redundant license objects in the SBOM.

The variable is initialized in spdx-common.bbclass with comprehensive
documentation explaining its purpose, usage guidelines, and examples.

Example usage in recipe or layer:
  SPDX_CONCLUDED_LICENSE = "MIT & Apache-2.0"
  SPDX_CONCLUDED_LICENSE:${PN} = "MIT & Apache-2.0"

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/classes/spdx-common.bbclass | 16 ++++++++++++++++
 meta/lib/oe/spdx30_tasks.py      | 14 ++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index ca0416d1c7..3110230c9e 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -36,6 +36,22 @@ SPDX_LICENSES ??= "${COREBASE}/meta/files/spdx-licenses.json"
 
 SPDX_CUSTOM_ANNOTATION_VARS ??= ""
 
+SPDX_CONCLUDED_LICENSE ??= ""
+SPDX_CONCLUDED_LICENSE[doc] = "The license concluded by manual or external \
+    license analysis. This should only be set when explicit license analysis \
+    (manual review or external scanning tools) has been performed and a license \
+    conclusion has been reached. When unset or empty, no concluded license is \
+    included in the SBOM, indicating that no license analysis was performed. \
+    When differences from the declared LICENSE are found, the preferred approach \
+    is to correct the LICENSE field in the recipe and contribute the fix upstream \
+    to OpenEmbedded. Use this variable locally only when upstream contribution is \
+    not immediately possible or when the license conclusion is environment-specific. \
+    Supports package-specific overrides via SPDX_CONCLUDED_LICENSE:${PN}. \
+    This allows tracking license analysis results in SBOM while maintaining recipe \
+    LICENSE field for build compatibility. \
+    Example: SPDX_CONCLUDED_LICENSE = 'MIT & Apache-2.0' or \
+    SPDX_CONCLUDED_LICENSE:${PN} = 'MIT & Apache-2.0'"
+
 SPDX_MULTILIB_SSTATE_ARCHS ??= "${SSTATE_ARCHS}"
 
 python () {
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 286a08ed9b..b099fb201e 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -712,6 +712,20 @@ def create_spdx(d):
                 oe.spdx30.RelationshipType.hasDeclaredLicense,
                 [oe.sbom30.get_element_link_id(package_spdx_license)],
             )
+            
+            # Add concluded license relationship if manually set
+            # Only add when license analysis has been explicitly performed
+            concluded_license_str = d.getVar("SPDX_CONCLUDED_LICENSE:%s" % package) or d.getVar("SPDX_CONCLUDED_LICENSE")
+            if concluded_license_str:
+                concluded_spdx_license = add_license_expression(
+                    d, build_objset, concluded_license_str, license_data
+                )
+                
+                pkg_objset.new_relationship(
+                    [spdx_package],
+                    oe.spdx30.RelationshipType.hasConcludedLicense,
+                    [oe.sbom30.get_element_link_id(concluded_spdx_license)],
+                )
 
             # NOTE: CVE Elements live in the recipe collection
             all_cves = set()
-- 
2.52.0


