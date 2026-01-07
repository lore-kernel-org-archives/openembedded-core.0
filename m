Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27FBBD0D15D
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 18:15:58 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12842.1767809748298193566
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 10:15:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ll6BCMpA;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so25554635e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 10:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767809746; x=1768414546; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BXUhtD1Npf5bnqnxOqLXgiX3P3MDkwj0CM66ydpXMYM=;
        b=ll6BCMpAbdIYhCOWMDlNIcDFLgU9YbgPEXe+3/CkxPIc9Cb55Hla+3otTOv7SVlHjE
         FXdoH3qgiqMyk7/haD2PiM/NqXRiQTRIOJcKlT/mcu0xC9CASBaqFeNfQGJJJR1+UaSH
         0g3++14XxcKwolowYsj2sivD7CZ2ZRYrwFPeBbsBgXRasW86H8d8yrqUp2nJmJHbn/ti
         AYtgFbMSkqBAbOjhvxY+xnONYx1m/8FwbcBEa1H+Sr8yqUt1DHKdApmrXR/GMFgLv4cy
         wX+sUIWDmc0uAXp+DUYzKlG9FSgX6XYVud9FWDjN1TNYSDGHqT3kiMrrakGrI2jSxq+N
         ucVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767809746; x=1768414546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BXUhtD1Npf5bnqnxOqLXgiX3P3MDkwj0CM66ydpXMYM=;
        b=OMv/0mBY8OQ5USuxmt6HZkU8khswMM1K/ZJIWCkiiD/u1kr6lmpPpzmBU5p26hylQq
         Sqs98AdMOZiNz2ATOO+ulZUb5W2VsNSTB/L8oDqvoAFBoM7LF8JJnY4HmkUxZO2X5lRV
         oaklVt3I4rUHqr9FbxgPxpfQQ0+zitoBQAOjxXq8zbHnb6Kgax8TwpuBrAzUz3zyRtxb
         R2aBTFMDAdyF1lGJeXqWqlSCKv5vUPHbh/KAvikUymjHodKFx3VUDsdqr9YnmqpXxipt
         SAmjAP2yWhJZK6y3+EWjvZ0+Kta7PZ1qPXVKXvNqNiPTWBxdG1LunlTfabxiG4qk/Ov+
         Zt9w==
X-Gm-Message-State: AOJu0YzpOtZWLTL+ybEgKTQ/YUJvdGsJXwBi/qwdtWspE9Rc2Em1EOWE
	Q9qRZSWJjod4dW24hHirlzO6jpDJIcHGfJqWVk6huzjqRsD4RoiDZOK4u9jhZA==
X-Gm-Gg: AY/fxX5wW7Nz2nGo1LWMajVAm1iTOIagm9LyOIU2Plz0TCW3JkEwfr1ij31hRLg6aZj
	HDv9n0zc0Q+LdgNwYaJ48jQGnEBAO8J6zhi52wiyS/OiORYchEKCzgNy5B09DxfNu7U3WpwGwZH
	twZEjF5Qr8uHRnk7DqNUb7+6hHnFNhfYT7ROKtCfT2yTuzH9DGPVJ3elUsiIxUw+A8Vxx0OyXOR
	Ltm5hZL0qNDWbLfx7/jmFMruFChxrznW+ftnhrkCLs7vaCkrkNFveGE4nWQmqffDLQUz0fa5aG/
	NEbr1FIjk58ufZNsVngl0Gvybdpc8VPIuus1IsQDqpSAAAY9iVYnvEG9pbdj+trz/TZkjdcLIK0
	PqJvvj7P8aykCs2PCHnXPQnfB6q1Ki+vt1L6/N5JgfIOoKiWNaCPEC0XoVmEHv19uAmf/8km1KQ
	KJdJ1VVzxO5ua5naerYsBPbuvHuEEP6VH4bg==
X-Google-Smtp-Source: AGHT+IHOJXNoo3U9Z+GSfqXf7LDt8xCYvCRMEjb8mlKkCDZu8d7WAhkNO/EpmmMWB32zuQRRNzyjMg==
X-Received: by 2002:a05:600c:1d19:b0:47d:5089:a476 with SMTP id 5b1f17b1804b1-47d84b386fdmr48980155e9.31.1767809746053;
        Wed, 07 Jan 2026 10:15:46 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47d7f6f0e15sm106686575e9.10.2026.01.07.10.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 10:15:45 -0800 (PST)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: stondo@gmail.com,
	stefano.tondo.ext@siemens.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	JPEWhacker@gmail.com
Subject: [PATCH v4] spdx30_tasks: Add concluded license support with SPDX_CONCLUDED_LICENSE
Date: Wed,  7 Jan 2026 19:15:41 +0100
Message-ID: <20260107181541.141957-1-stondo@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260106112557.53709-1-stondo@gmail.com>
References: <20260106112557.53709-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 18:15:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229025

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
 meta/lib/oe/spdx30_tasks.py      | 18 ++++++++++++++++--
 2 files changed, 32 insertions(+), 2 deletions(-)

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
index 286a08ed9b..a99b017c26 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -636,7 +636,7 @@ def create_spdx(d):
             set_var_field(
                 "HOMEPAGE", spdx_package, "software_homePage", package=package
             )
-            
+
             # Add summary with fallback to DESCRIPTION
             summary = None
             if package:
@@ -651,7 +651,7 @@ def create_spdx(d):
                 summary = f"Package {package or d.getVar('PN')}"
             if summary:
                 spdx_package.summary = summary
-            
+
             set_var_field("DESCRIPTION", spdx_package, "description", package=package)
 
             if d.getVar("SPDX_PACKAGE_URL:%s" % package) or d.getVar("SPDX_PACKAGE_URL"):
@@ -713,6 +713,20 @@ def create_spdx(d):
                 [oe.sbom30.get_element_link_id(package_spdx_license)],
             )
 
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
+
             # NOTE: CVE Elements live in the recipe collection
             all_cves = set()
             for status, cves in cve_by_status.items():
-- 
2.52.0


