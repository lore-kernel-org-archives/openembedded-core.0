Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23964D0D15C
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 18:10:08 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12695.1767809403778728176
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 10:10:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lWzIWzGP;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47aa03d3326so20415265e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 10:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767809402; x=1768414202; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7O7x4H+VYiEqClsWXn3AsDK7E27UdlqPl1ev5xrjwk=;
        b=lWzIWzGPapEH7xftxs/4doRg3BdFbgzpaMIzxurmV+vw0Qsr0R5PzAxLjpDg7ax34G
         n26sjYB3AU44atHWZxupAvvU7vlsUNcrtuln1EOplwRBROp+dzGGqpwYR559IdTd5WdE
         aHln+F/DWU1qjP4O8nz1vJlC1DD3kAb1fk1368GDbKH/R4uoHAWkqGb0XAI5uZs14jX3
         Tb7XffEkzpLVX3EoNyxZwmrmqbSC7AuceebDRxO3qvzrWA8VNYdZ8JVM5Zp9IswYs9k8
         tgIWmeh5+CniUJDBoU5/5u4INOITxFGG1SxIAPQH/qRnVtxn7cJuZIsRChRVYxf02J4g
         sVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767809402; x=1768414202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g7O7x4H+VYiEqClsWXn3AsDK7E27UdlqPl1ev5xrjwk=;
        b=tiZRtRfYA2jobvBKD42VREG6wAAJ4cJziYsbZrecv9BnRoWg1y4ZwxZCOhTRz6dLvZ
         43XB6DURR0yrDlTGz5H7ejAMm6hGFI+3gJ+Gs5WXqwYt/G5xBj8eArtwYhVc2n1y37fO
         sYJqbvA4iAAtc4N3fgZtGRQ4c4DG+sOlTK4rAYpVdPyLvM3nya3w/4cAcqZWOXMHkc1V
         ePTEx62ri2wFkT1NVuwXIezhtTJuNPD/FGzkYwmAPeP3faeYHk+o4m2teUiMNqap+ix4
         QyaR3GiVvmXOVlttjZbRA59QUmveqvH4BKe3u7J62jMLm7GtWCTVGqrOVzizd0iNszsf
         2L/w==
X-Gm-Message-State: AOJu0YznX+kN2CbifFTZ3hMX5vgZuu1fYvoCLKGkmAiEA81CafkWuy9E
	elfgrJEg0dQpSRXKjYqJbzZM7fFhsTzUHVG1odNd6uyRJmBO8RoKrFHpvwUhsw==
X-Gm-Gg: AY/fxX5WlbDnRUd/afo4qwzjhYSjz6OyaStKN/3jh7wK/uCjeS48tESJePFvOmrUKvc
	d/jS6V2AV+lrEo+W2AassvzMWC2R8pm/BuWEDwYC3BLO/Bxr7PZMm2U+ZYgCVs4M+1u1zq1mkGu
	8Y2vCwxVCLASSDE7CyS4pV4h9ujmitQhc4DOhU5OvXCbWXzi/q8g6zdH7WnqveKUmpbS174vVeb
	m/bCA3c/cCB/wJOcnASveDqYpA8QFApffdTaooVvZU6414qLaq8tEDlWD/rtVkqTOxcOdmVPXb4
	P9u2UTSvM+yiSOkRL1MzuJ7YYgYu0OSTEmG9cLdG+/XFgzLcCLfyRoxNLIITEb71KOhPbSYzctj
	NTqZKZSZ5QGr6TGDyf5MSrGUK0x21AH4xIuMgamXbBoL+tODkCL6lgawALmK6GP3JRFo1+stQN/
	2N76CMoxGDmf4GPwxT26UqQDc=
X-Google-Smtp-Source: AGHT+IHrpm0pRQM+/WejSGXksLh1fAWKMAaYFjDriBdLtzJA52ZUI5UvU+G+7uvatDCJl3ig40hmFQ==
X-Received: by 2002:a05:600c:b86:b0:47a:7aa0:175a with SMTP id 5b1f17b1804b1-47d84b3bc85mr38752435e9.26.1767809401786;
        Wed, 07 Jan 2026 10:10:01 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-432bd5df9c5sm11895630f8f.22.2026.01.07.10.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 10:10:01 -0800 (PST)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: stondo@gmail.com,
	stefano.tondo.ext@siemens.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com
Subject: [PATCH] spdx30: Add SBOM metadata component and supplier support
Date: Wed,  7 Jan 2026 19:09:51 +0100
Message-ID: <20260107180951.140895-5-stondo@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107180951.140895-1-stondo@gmail.com>
References: <20260107180951.140895-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 18:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229024

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

This commit adds support for including image/product metadata and
supplier information in SPDX 3.0 SBOMs to meet compliance requirements.

New configuration variables (in spdx-common.bbclass):

  SBOM_COMPONENT_NAME (optional):
    - Name of the product/image being documented
    - Creates a software_Package element with metadata
    - Typically set to IMAGE_BASENAME or product name

  SBOM_COMPONENT_VERSION (optional):
    - Version of the product/image
    - Falls back to DISTRO_VERSION if not set

  SBOM_COMPONENT_SUMMARY (optional):
    - Description of the product/image
    - Falls back to IMAGE_SUMMARY if not set

  SBOM_SUPPLIER_NAME (optional):
    - Name of the organization supplying the SBOM
    - Creates an Organization element

  SBOM_SUPPLIER_URL (optional):
    - URL of the supplier organization
    - Added as externalIdentifier

Implementation (in sbom30.py):

  - create_sbom(): Add metadata component and supplier after SBOM
    creation but before collection expansion
  - Create relationships:
    * SBOM --describes--> metadata component
    * SBOM --availableFrom--> supplier Organization

SPDX 3.0 elements created:

  - software_Package (primaryPurpose: operatingSystem) for product
  - Organization with optional URL externalIdentifier
  - Appropriate relationships per SPDX 3.0 spec

Usage example in local.conf:

  SBOM_COMPONENT_NAME = ""
  SBOM_COMPONENT_VERSION = "1.0.0"
  SBOM_COMPONENT_SUMMARY = "Production image for Device X"
  SBOM_SUPPLIER_NAME = "Acme Corporation"
  SBOM_SUPPLIER_URL = "https://acme.com"

This enables profile-specific SBOM workflows and compliance validation
tools that require product and supplier metadata.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oe/sbom30.py       | 52 +++++++++++++++++++++++++++++++++++++
 meta/lib/oe/spdx30_tasks.py | 10 +++----
 2 files changed, 57 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 227ac51877..197361db4f 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -1045,6 +1045,58 @@ def create_sbom(d, name, root_elements, add_objectsets=[]):
         )
     )
 
+    # Add SBOM metadata component (image/product information)
+    sbom_component_name = d.getVar("SBOM_COMPONENT_NAME")
+    if sbom_component_name:
+        sbom_component_version = d.getVar("SBOM_COMPONENT_VERSION") or d.getVar("DISTRO_VERSION") or "unknown"
+        sbom_component_summary = d.getVar("SBOM_COMPONENT_SUMMARY") or d.getVar("IMAGE_SUMMARY") or f"{name} image"
+
+        metadata_component = objset.add(
+            oe.spdx30.software_Package(
+                _id=objset.new_spdxid("metadata", "component"),
+                creationInfo=objset.doc.creationInfo,
+                name=sbom_component_name,
+                software_packageVersion=sbom_component_version,
+                summary=sbom_component_summary,
+                software_primaryPurpose=oe.spdx30.software_SoftwarePurpose.operatingSystem,
+            )
+        )
+
+        # Link SBOM to metadata component
+        objset.new_relationship(
+            [sbom],
+            oe.spdx30.RelationshipType.describes,
+            [metadata_component],
+        )
+
+    # Add supplier information if provided
+    sbom_supplier_name = d.getVar("SBOM_SUPPLIER_NAME")
+    if sbom_supplier_name:
+        sbom_supplier_url = d.getVar("SBOM_SUPPLIER_URL")
+
+        supplier = objset.add(
+            oe.spdx30.Organization(
+                _id=objset.new_spdxid("supplier", sbom_supplier_name.replace(" ", "-").lower()),
+                creationInfo=objset.doc.creationInfo,
+                name=sbom_supplier_name,
+            )
+        )
+
+        if sbom_supplier_url:
+            supplier.externalIdentifier = [
+                oe.spdx30.ExternalIdentifier(
+                    externalIdentifierType=oe.spdx30.ExternalIdentifierType.urlScheme,
+                    identifier=sbom_supplier_url,
+                )
+            ]
+
+        # Link supplier to SBOM (SBOM is available from supplier)
+        objset.new_relationship(
+            [sbom],
+            oe.spdx30.RelationshipType.availableFrom,
+            [supplier],
+        )
+
     missing_spdxids = objset.expand_collection(add_objectsets=add_objectsets)
     if missing_spdxids:
         bb.warn(
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index c86b088b61..757503cd6b 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -179,17 +179,17 @@ def add_package_files(
                 continue
 
             filename = str(filepath.relative_to(topdir))
-            
+
             # Apply file filtering if enabled
             if spdx_file_filter == "essential":
                 file_upper = file.upper()
                 filename_lower = filename.lower()
-                
+
                 # Skip if matches exclude patterns
                 skip_file = any(pattern in filename_lower for pattern in exclude_patterns)
                 if skip_file:
                     continue
-                
+
                 # Keep only essential files (license/readme/etc)
                 is_essential = any(pattern in file_upper for pattern in essential_patterns)
                 if not is_essential:
@@ -198,7 +198,7 @@ def add_package_files(
                 # Skip all files
                 continue
             # else: spdx_file_filter == "all" or any other value - include all files
-            
+
             file_purposes = get_purposes(filepath)
 
             # Check if file is compiled
@@ -245,7 +245,7 @@ def get_package_sources_from_debug(
     d, package, package_files, sources, source_hash_cache
 ):
     spdx_file_filter = (d.getVar("SPDX_FILE_FILTER") or "all").lower()
-    
+
     def file_path_match(file_path, pkg_file):
         if file_path.lstrip("/") == pkg_file.name.lstrip("/"):
             return True
-- 
2.52.0


