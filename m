Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8892EF901F
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 17:05:57 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23388.1772643949150057707
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 09:05:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JeTskE8J;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so80766575e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 09:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772643947; x=1773248747; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KjtfWZab3pHkEShliIIuxh0QfLpjMDToChUQ7v2nBg=;
        b=JeTskE8JsYbbMg4yquq94qUGjF1w/nBFi3MCp9ldnC1ZCnnAq2XnthgHigjwBsexWA
         rmJxoeSbi+oMT0hy94vumHx2dJmtUhcrdxrgz3TIElpbCC/WvZjvDLHJdY0yL4f8i6WH
         Z9AGYG931HvSdkyWJFK2RXJs73yTRFQly7p9mjYR4+ToFndOIQjHOgDv4fO8T71FgnxR
         E87w327Ak05bV8SvPj/yoN9sBkHZP70uRhxDob15qa9Q1gDPsNSqlGrikgCL8XmDz7LF
         i8qFsiShAb4JnyBKrCwo9JwQb9tWrNMQQsontisy9lw/bjVscWiwk49sNF3ZWVA08dJ0
         071A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772643947; x=1773248747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4KjtfWZab3pHkEShliIIuxh0QfLpjMDToChUQ7v2nBg=;
        b=mBBWbq9JL3covAMCA2ByL1scn4/XH1xIozskw2/IMrR0YPNlbbd0Yvycr8+/zyk4Tj
         S3FYu5JBEkwQvtf7WCJ888BbCClq1BU8w0vICHiwpi408CBIeWKiAbC5+D3L1jrhD5HW
         nGC7dRig287KgHjLNhVwmXNVSuE7zDk8xjQOSiYKho2H1IuEO8/f6WZcP+lHF4FdBi7a
         Cxu7kIrqqbrOJaGop6v9kkPCCU1HV9LjSe9QuXkxnjz8PhiT4FRV4KkD5quOBHromwaD
         +78X/kA+mBlNfFG84f7rT6Z2OrOrU/6LXRYRD7H/YKWZmqT9LzzDv5LR+Jq7VaBKTSX6
         DbTA==
X-Gm-Message-State: AOJu0Yx51nx2ziZWWXuF+D0Nn3QyyrAB9rdelOoeU9lbrQH1TRsQ1oCG
	UTBWkqmsFYPEYmlIIEOOBlbJJXSsYmGYTBTVibqFS5nWKkz4aKGPdD/VpiMgQw==
X-Gm-Gg: ATEYQzzCwVeYjF/J4F/uQC+8CXIUhZnbMHTZoSQw94qHhtnh6CMwjX/qZO5GVtWK3SK
	4BZ1fFX15gPQ/WYiYfp8q2/YnHNvruIS8WKlFwsomLgwseqh/4QQHjenE+btt5Sk346GeDpj07P
	DGLBwOnc5ccCnYtgzJrwsajSiFXjZY+PCLWXm71GbomnFjx5GOQ3SQKGb0UiKeyLeqpmJodRCuo
	/zlvAfst3JjDYRCS2ZSOi8srhcujsk6udHWynClIvC/jzzUpXhn5HlhEoDnYj4tvpkHRXEhgPwF
	KaKtpPQX/6RgUU6dZ4Ci684iqp/8Y5TLwRi6qQ2vlSAqMFW79YY9FSDthuLuhCgWmUMUj5PjtKt
	YH0bBsAbLH99f6SiLHlvPsDltiXzCtIKn8QqKGnQ0sBQ2bz3lxNRouqOF+8ZI1Da/gL/hY+Arir
	NuKo/0o4kj2mh9RRiuIpGrhOI=
X-Received: by 2002:a05:600c:458d:b0:482:eec4:74c with SMTP id 5b1f17b1804b1-4851988a630mr41777245e9.22.1772643947001;
        Wed, 04 Mar 2026 09:05:47 -0800 (PST)
Received: from fedora ([165.225.94.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485188914ddsm78557395e9.12.2026.03.04.09.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:05:45 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	jpewhacker@gmail.com,
	mathieu.dubois-briand@bootlin.com
Subject: [PATCH v6 02/10] spdx30: Add supplier support for image and SDK SBOMs
Date: Wed,  4 Mar 2026 18:05:33 +0100
Message-ID: <20260304170541.180868-3-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304170541.180868-1-stefano.tondo.ext@siemens.com>
References: <20260302160114.46884-1-stefano.tondo.ext@siemens.com>
 <20260304170541.180868-1-stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 17:05:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232405

This commit adds support for setting supplier information on image and SDK
SBOMs using the suppliedBy property on root elements.

New configuration variables:

  SPDX_IMAGE_SUPPLIER (optional):
    - Base variable name to describe the Agent supplying the image SBOM
    - Follows the same Agent variable pattern as SPDX_PACKAGE_SUPPLIER
    - Sets suppliedBy on all root elements of the image SBOM

  SPDX_SDK_SUPPLIER (optional):
    - Base variable name to describe the Agent supplying the SDK SBOM
    - Follows the same Agent variable pattern as SPDX_PACKAGE_SUPPLIER
    - Sets suppliedBy on all root elements of the SDK SBOM

Implementation:

  - create_image_sbom_spdx(): After create_sbom() returns, uses
    objset.new_agent() to create supplier and sets suppliedBy on
    sbom.rootElement

  - create_sdk_sbom(): After create_sbom() returns, uses objset.new_agent()
    to create supplier and sets suppliedBy on sbom.rootElement

  - Uses existing agent infrastructure (objset.new_agent()) for proper
    de-duplication and metadata handling

  - No changes to generic create_sbom() function which is used for recipes,
    images, and SDKs

Usage example in local.conf:

  SPDX_IMAGE_SUPPLIER_name = "Acme Corporation"
  SPDX_IMAGE_SUPPLIER_type = "organization"
  SPDX_IMAGE_SUPPLIER_id_email = "sbom@acme.com"

This enables compliance workflows that require supplier metadata on image
and SDK SBOMs while following existing OpenEmbedded SPDX patterns.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/classes/create-spdx-3.0.bbclass | 10 ++++++++++
 meta/lib/oe/spdx30_tasks.py          | 26 +++++++++++++++++++++++---
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index d4575d61c4..def2dacbc3 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -124,6 +124,16 @@ SPDX_ON_BEHALF_OF[doc] = "The base variable name to describe the Agent on who's
 SPDX_PACKAGE_SUPPLIER[doc] = "The base variable name to describe the Agent who \
     is supplying artifacts produced by the build"
 
+SPDX_IMAGE_SUPPLIER[doc] = "The base variable name to describe the Agent who \
+    is supplying the image SBOM. The supplier will be set on all root elements \
+    of the image SBOM using the suppliedBy property. If not set, no supplier \
+    information will be added to the image SBOM."
+
+SPDX_SDK_SUPPLIER[doc] = "The base variable name to describe the Agent who \
+    is supplying the SDK SBOM. The supplier will be set on all root elements \
+    of the SDK SBOM using the suppliedBy property. If not set, no supplier \
+    information will be added to the SDK SBOM."
+
 SPDX_PACKAGE_VERSION ??= "${PV}"
 SPDX_PACKAGE_VERSION[doc] = "The version of a package, software_packageVersion \
     in software_Package"
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index bd703b5bec..0888d9d7e4 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -162,7 +162,7 @@ def add_package_files(
         bb.debug(1, f"Total compiled files: {len(compiled_sources)}")
 
     # File filtering configuration
-    spdx_file_filter = (d.getVar("SPDX_FILE_FILTER") or "all").lower()
+    spdx_file_filter = (d.getVar("SPDX_FILES_INCLUDED") or "all").lower()
     essential_patterns = (d.getVar("SPDX_FILE_ESSENTIAL_PATTERNS") or "").split()
     exclude_patterns = (d.getVar("SPDX_FILE_EXCLUDE_PATTERNS") or "").split()
 
@@ -244,7 +244,7 @@ def add_package_files(
 def get_package_sources_from_debug(
     d, package, package_files, sources, source_hash_cache
 ):
-    spdx_file_filter = (d.getVar("SPDX_FILE_FILTER") or "all").lower()
+    spdx_file_filter = (d.getVar("SPDX_FILES_INCLUDED") or "all").lower()
 
     def file_path_match(file_path, pkg_file):
         if file_path.lstrip("/") == pkg_file.name.lstrip("/"):
@@ -283,7 +283,7 @@ def get_package_sources_from_debug(
             if spdx_file_filter in ("none", "essential"):
                 bb.debug(
                     1,
-                    f"Skipping debug source lookup for {file_path} in {package} (filtered by SPDX_FILE_FILTER={spdx_file_filter})",
+                    f"Skipping debug source lookup for {file_path} in {package} (filtered by SPDX_FILES_INCLUDED={spdx_file_filter})",
                 )
                 continue
             else:
@@ -1330,6 +1330,16 @@ def create_image_sbom_spdx(d):
 
     objset, sbom = oe.sbom30.create_sbom(d, image_name, root_elements)
 
+    # Set supplier on root elements if SPDX_IMAGE_SUPPLIER is defined
+    supplier = objset.new_agent("SPDX_IMAGE_SUPPLIER", add=False)
+    if supplier is not None:
+        supplier_id = supplier if isinstance(supplier, str) else supplier._id
+        if not isinstance(supplier, str):
+            objset.add(supplier)
+        for elem in sbom.rootElement:
+            if hasattr(elem, "suppliedBy"):
+                elem.suppliedBy = supplier_id
+
     oe.sbom30.write_jsonld_doc(d, objset, spdx_path)
 
     def make_image_link(target_path, suffix):
@@ -1441,6 +1451,16 @@ def create_sdk_sbom(d, sdk_deploydir, spdx_work_dir, toolchain_outputname):
         d, toolchain_outputname, sorted(list(files)), [rootfs_objset]
     )
 
+    # Set supplier on root elements if SPDX_SDK_SUPPLIER is defined
+    supplier = objset.new_agent("SPDX_SDK_SUPPLIER", add=False)
+    if supplier is not None:
+        supplier_id = supplier if isinstance(supplier, str) else supplier._id
+        if not isinstance(supplier, str):
+            objset.add(supplier)
+        for elem in sbom.rootElement:
+            if hasattr(elem, "suppliedBy"):
+                elem.suppliedBy = supplier_id
+
     oe.sbom30.write_jsonld_doc(
         d, objset, sdk_deploydir / (toolchain_outputname + ".spdx.json")
     )
-- 
2.53.0


