Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F0A0D0D156
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 18:10:08 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12689.1767809399838484837
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 10:10:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KtMpoYxN;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso1193871f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 10:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767809398; x=1768414198; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hxZYYb4u+EoP4FQ5od+yCqQb+nqnheOqidiPhHgJzU8=;
        b=KtMpoYxN9lToN87JZh8YwRtH+mByaHIAk7WvCzAxjikyuZiuzD3ggoVCH9rFP+ezjN
         pFNcVyM+Hy4MGNCF0N+QIEc0mTvTNhAIeqx7YRP2OEZ8SwISLAnzUQnIHv20PIYaxUVj
         2ruge6w4tTSD83IgUPnVHI9C2qaOnaHsRk9UyZGBktosvy3N9XifbmYP9GBpvAZbGoAz
         bZITBZbUVSTaK3NA3tWP2bx70mVLT+W+tcv4Nh7gtnZMrbZ+It4UUEKlcJJrxOPv6Pia
         gi03wP1GqPRQl5uXOiSOtcggLVNODHOZhvk4MREWLi4thEcWVTKpelxmelqZKjAsa+yQ
         pXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767809398; x=1768414198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxZYYb4u+EoP4FQ5od+yCqQb+nqnheOqidiPhHgJzU8=;
        b=DE13+gXpI0jpmdMoBK+op1sp0Dwcy7ILNgj2Q6CjdRWfT8QCkm7yTwqVqlRdHWVyDv
         b2MDONh7t/FOx0HlP8zWWKH4hebTM7v6d4zzRi967GXM+CIRtjGBSFrkvIn3qLPyz6fO
         IXvWtA7X7icO3TH+bEyXMzuCwYZH6wtl/WfLcP7zO//Mzc/1dcKlg6HoY5QX2ZV7gEtT
         mPc+xlpPEODtocsnxFsC4N0dw8anLBkkP40DuTjsrhpe5yjSJuh05UhvgXbaWCjVmTB3
         eCnNK4wbkrg47yNNn9tDCIM4YQVnGoo9ITeqQTPWdoz/LvSf99DDoFPgx7hCqFK3hRke
         Ebgw==
X-Gm-Message-State: AOJu0YycURPMCRmzlawFl/KQuqs4hdtm6YYzQn+p4VSorx3h4zfAzIeS
	0+3etfGRAMpr8raeWXYVodSQT2W3pAMg3hN1j5tMg3f2d/b0h2Jpmo2UpdUh6pus
X-Gm-Gg: AY/fxX4/JJXX4v34MBCPxKReuTxcd5SfAHd/DRLOp5pJq9myZU6HsL9PgA6ns+JL+A3
	sn0TFPDZKOj0gPo2Vt4kt3swp879C54x42c+B6CZPeEGzYZZDm3DpAM6D+HOa1U+4ULg5q+2alp
	cgWrKcVv1NHumEgfLSLSVd8KNyV/+0PO4D/QNQST7UD0NXK2zf1t3VefX7WSYj0NgfqMk5Ythlr
	4+2MKswsQP+dW4Cx9RpIbAI2hp/f+Dgpdfl/wU8DUSKSLqXUve/LXRPxhIc/Z17W4a8golMVaxP
	ngqeVielFZ9pJEZK5n4/FaijQaCjk5CEcMC4g55a7n701x79sCoHeJNbAL09g2fCzntTMx3B36O
	HRqN9ddD8NF3xh3nDzFWzdj+7wLLCuSITDZ+kMzf460y7eQf2VMCOtBvn420fE1dE3mk8GKw7DH
	eNhgfZQPvmlMZz5ZzfsN+o6T8=
X-Google-Smtp-Source: AGHT+IEShW6Mj/rCiwpbqKKca7he8mjN4dvZLg13bgSd0jAVddpfboTqfe+ASssCJO4t/3lkwVpeRA==
X-Received: by 2002:a05:6000:1862:b0:430:ff81:2947 with SMTP id ffacd0b85a97d-432c379dba5mr4991843f8f.40.1767809397717;
        Wed, 07 Jan 2026 10:09:57 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-432bd5df9c5sm11895630f8f.22.2026.01.07.10.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 10:09:57 -0800 (PST)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: stondo@gmail.com,
	stefano.tondo.ext@siemens.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com
Subject: [PATCH] spdx-common: Clarify documentation and make SPDX_LICENSES extensible
Date: Wed,  7 Jan 2026 19:09:47 +0100
Message-ID: <20260107180951.140895-1-stondo@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 18:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229020

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

This commit improves the SPDX variable documentation and enhances
SPDX_LICENSES to support layer-based license extensions.

1. SPDX_NAMESPACE_PREFIX documentation clarification:
   - Clarify that this should be organization-specific
   - Explain the default is for compatibility only
   - Provide example of production override
   - Make it consistent with SPDX_UUID_NAMESPACE guidance

2. SPDX_LICENSES documentation enhancement:
   - Clarify when this variable needs to be set
   - Document the new list behavior
   - Provide example usage with += operator

3. SPDX_LICENSES implementation as extensible list:
   - Change from single file to space-separated list of files
   - Support layer-based license extensions without file copying
   - Later files override earlier ones for duplicate license IDs
   - Backward compatible (single file path still works)
   - Add error handling for missing/invalid files

This enhancement allows layers to add custom licenses without
maintaining a copy of the base spdx-licenses.json file:

  SPDX_LICENSES += "${LAYERDIR}/files/custom-licenses.json"

This is particularly useful for organizations with proprietary or
custom licenses that need to be tracked in SBOMs.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/classes/spdx-common.bbclass | 13 +++++++++----
 meta/lib/oe/spdx_common.py       | 31 +++++++++++++++++++++++++++----
 2 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index 6bd1b56d96..fbb096c528 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -42,7 +42,10 @@ SPDX_UUID_NAMESPACE[doc] = "The namespace used for generating UUIDs in SPDX \
 
 SPDX_NAMESPACE_PREFIX ??= "http://spdx.org/spdxdocs"
 SPDX_NAMESPACE_PREFIX[doc] = "The URI prefix used for SPDX document namespaces. \
-    Combined with other identifiers to create unique document URIs."
+    This should be a domain name or URI prefix unique to your organization to ensure \
+    globally unique document URIs. The default 'http://spdx.org/spdxdocs' is provided \
+    for compatibility but should be overridden in production environments (e.g., \
+    'https://sbom.example.com')."
 
 SPDX_PRETTY ??= "0"
 SPDX_PRETTY[doc] = "If set to '1', generate human-readable formatted JSON output \
@@ -50,9 +53,11 @@ SPDX_PRETTY[doc] = "If set to '1', generate human-readable formatted JSON output
     Pretty formatting makes files larger but easier to read."
 
 SPDX_LICENSES ??= "${COREBASE}/meta/files/spdx-licenses.json"
-SPDX_LICENSES[doc] = "Path to the JSON file containing SPDX license identifier \
-    mappings. This file maps common license names to official SPDX license \
-    identifiers."
+SPDX_LICENSES[doc] = "Space-separated list of JSON files containing SPDX license \
+    identifier mappings. Files are processed in order, with later entries overriding \
+    earlier ones. This allows layers to extend the base license set without copying \
+    the entire file. Set this variable in your layer when using licenses not known \
+    to oe-core (e.g., 'SPDX_LICENSES += \"${LAYERDIR}/files/custom-licenses.json\"')."
 
 SPDX_CUSTOM_ANNOTATION_VARS ??= ""
 SPDX_CUSTOM_ANNOTATION_VARS[doc] = "Space-separated list of variable names whose \
diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index 72c24180d5..8a6cf70fc1 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -42,10 +42,33 @@ def is_work_shared_spdx(d):
 
 
 def load_spdx_license_data(d):
-    with open(d.getVar("SPDX_LICENSES"), "r") as f:
-        data = json.load(f)
-        # Transform the license array to a dictionary
-        data["licenses"] = {l["licenseId"]: l for l in data["licenses"]}
+    """
+    Load SPDX license data from one or more JSON files.
+    SPDX_LICENSES can be a space-separated list of files.
+    Later files override earlier ones for duplicate license IDs.
+    """
+    license_files = d.getVar("SPDX_LICENSES").split()
+
+    # Initialize with empty structure
+    data = {"licenses": {}}
+
+    # Load and merge each file
+    for license_file in license_files:
+        try:
+            with open(license_file, "r") as f:
+                file_data = json.load(f)
+                # Transform the license array to a dictionary and merge
+                if "licenses" in file_data:
+                    for lic in file_data["licenses"]:
+                        data["licenses"][lic["licenseId"]] = lic
+                # Copy over other top-level keys from the last file
+                for key in file_data:
+                    if key != "licenses":
+                        data[key] = file_data[key]
+        except FileNotFoundError:
+            bb.warn(f"SPDX license file not found: {license_file}")
+        except json.JSONDecodeError as e:
+            bb.warn(f"Invalid JSON in SPDX license file {license_file}: {e}")
 
     return data
 
-- 
2.52.0


