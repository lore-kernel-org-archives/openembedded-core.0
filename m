Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46E91C47BEE
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 11:26:18 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87911.1767698768668406547
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 03:26:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fPzMSzbc;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so6888505e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 03:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767698767; x=1768303567; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ze4Gh8YymxUVnUK4A9Gpg4z7iPt/83qMRN62BGRPiAs=;
        b=fPzMSzbchVwzAlKeG0G7lu9ZKTwfAfNa/wJY9D4MqQfHllvkQzXOO6zny0sQEM5nTJ
         lNl6bbfhevvyfKW1bqicpMb0yt8E1yE1xx7JwutDEwV+3JgKT0W0gRE0uRxEsUz1yyZv
         6cS8ljcGXLuk3/S3Ban1DG0LjO4kjLGlj6XjngKAPhR0uFilmmO3nSg6LO+B9wa/Pbmg
         vUeVj14AZQLuoFapWfBbA2Z6+v+aBw3zfKGR8Zi6EKa4BPYklwtclnD3ctelyYAVlay+
         B3ulZYdnTgutZKyKOLR2DPLkj1i5U35rxbXilBkJSX0/CDVf0v581zGMj6jogeo1ovQK
         0+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767698767; x=1768303567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ze4Gh8YymxUVnUK4A9Gpg4z7iPt/83qMRN62BGRPiAs=;
        b=C1eWSe8UuyWum6UFMSS/RHgaHNt8rNHyk/F20mFblJDBQiy8GcIGzLVzNl4cj+UFJp
         TPj61sjlsauKgS7HtLOH28VZIy6beabgbYgrkbNrqf7J5JC0RqOqFYYKNGLqP6VRHE2r
         AScixs23NNU+amkfLHCsdIuZSj+wlENflsVduE5nbnhQIQxmAvVvHQa2saDZsuOhDcrp
         pNvL+bNSfjuMIlLRvThC/MZF+NBdSe6Egs14vHGtRGOX46DKpXEsNM00UM1tTWQtV9zV
         K+UUusIvSuycfDvWH26ztcVOdIvTiW3Yoil+ssFimaYm16OvfOJbDIwYxwdzZ89bC2aK
         sIiA==
X-Gm-Message-State: AOJu0YzzNfQMnA8pYD972yNstQxJYvlJ1qQ/aqsayvxBeePhdKDXOwEw
	TvF8df49F1WAE4rvk8nC40gfusLfpPufOVeNIyAMnV5ixw01Bl0AhBzvVEChRQ==
X-Gm-Gg: AY/fxX5nTMIZPdLFwqYdjasJ3WlJB8okhQCy7Ze2CY21bFouizMUV+nrTjwq0oUvaGC
	blBy7j2N3T0ni33ZRdPBH+7CFC7K8fCAqErVROV3H7sNDqnvvPnmeOqWaSPcZePsG0wDHwDZYXL
	U/2pyyRsrwTV2g/FEn1uJkt09ghLIeMaMIT0fkc4rHjkPnDBzXo1sI+GaJFSa2B/c6pHtbmoCcs
	9E+wWCGD/cYSO0I10w+oUxCTJwLnyP++qlTP0H1ta3Tg6E2+CXPEPpj8wRfmaDaL26gjtMnjrQs
	r0iMLABIcA3wpFh2VCl98x4LZrdUI6U67w9yF6Kp9OmqbM7ePsm3YFckHntoOs8JFQFbGwKCvE3
	QNnEBpbGBtQbqHEyYOTIdRMxavR6nb0feHlA1RHt+x7xcrI0gg7LS6uM0Q8XxwdzI8QCeqZjiE8
	XMiJYb99rbb2EMKSUHpuxLdfOupB0cw4cjhQ==
X-Google-Smtp-Source: AGHT+IEwTkiwcVFb/k+piFQIUPm74bFL8hBt7XlgYEOxV3VPLR9DUVoi0UuXwLwL0n2S4lkoUr/XNA==
X-Received: by 2002:a05:600c:548b:b0:477:7b9a:bb0a with SMTP id 5b1f17b1804b1-47d7f099a1amr29743695e9.21.1767698766595;
        Tue, 06 Jan 2026 03:26:06 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47d7f6953fasm38266625e9.5.2026.01.06.03.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 03:26:05 -0800 (PST)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	JPEWhacker@gmail.com
Subject: [PATCH v2] spdx30_tasks: Add concluded license support with SPDX_CONCLUDED_LICENSE
Date: Tue,  6 Jan 2026 12:25:51 +0100
Message-ID: <20260106112557.53709-1-stondo@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 11:26:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228884

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

This variable allows tracking license analysis results in the SBOM while
maintaining the recipe LICENSE field for build system compatibility.

The variable is initialized in spdx-common.bbclass with comprehensive
documentation explaining its purpose, usage guidelines, and examples.

Example usage in recipe or layer:
  SPDX_CONCLUDED_LICENSE = "MIT & Apache-2.0"

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/classes/spdx-common.bbclass | 14 ++++++++++++++
 meta/lib/oe/spdx30_tasks.py      | 18 ++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index ca0416d1c7..504e6fba45 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -36,6 +36,20 @@ SPDX_LICENSES ??= "${COREBASE}/meta/files/spdx-licenses.json"
 
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
+    This allows tracking license analysis results in SBOM while maintaining recipe \
+    LICENSE field for build compatibility. \
+    Example: SPDX_CONCLUDED_LICENSE = 'MIT & Apache-2.0'"
+
 SPDX_MULTILIB_SSTATE_ARCHS ??= "${SSTATE_ARCHS}"
 
 python () {
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 286a08ed9b..885b9c5549 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -712,6 +712,24 @@ def create_spdx(d):
                 oe.spdx30.RelationshipType.hasDeclaredLicense,
                 [oe.sbom30.get_element_link_id(package_spdx_license)],
             )
+            
+            # Add concluded license relationship if manually set
+            # Only add when license analysis has been explicitly performed
+            concluded_license_str = d.getVar("SPDX_CONCLUDED_LICENSE")
+            if concluded_license_str:
+                # Use explicitly set concluded license
+                if concluded_license_str != package_license and concluded_license_str != d.getVar("LICENSE"):
+                    concluded_spdx_license = add_license_expression(
+                        d, build_objset, concluded_license_str, license_data
+                    )
+                else:
+                    concluded_spdx_license = package_spdx_license
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


