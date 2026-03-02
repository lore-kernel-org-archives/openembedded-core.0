Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E5AEA4E2C
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 16:01:36 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.164095.1772467291003292124
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 08:01:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IavE+wP3;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439bcec8613so514998f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 08:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772467289; x=1773072089; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KjtfWZab3pHkEShliIIuxh0QfLpjMDToChUQ7v2nBg=;
        b=IavE+wP36eB1lheQKDmWhK3J2qgUJfvWklVFov0uEDv08V9+KSdjdezsVg4/CWNGiT
         dqbT5/Ve4shE7GQ1nr0H9v05NUVKu8l1I6H/JGzfq3zUpRZ4wCYgfmXgSveeB8aBWnO3
         lMZBT/lhm3ZWpmfrRfIvCDWfAdkj3aBjrB8Mr3zp9ddGIDATAuHdi76wEX9Im8MG+GnD
         1hqqkA/GlAJ8W/QlbXblansHaca1ukRqGCi01weoy6kgEn1LzFkIROPs1+8U47hLHl8s
         2maORjQMcA0S0PAYBDWdigIovE/6kqpeQ6wjDdrHgOxhDJ0hn+ym6/a1iO+KX4gn31AR
         lp/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772467289; x=1773072089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4KjtfWZab3pHkEShliIIuxh0QfLpjMDToChUQ7v2nBg=;
        b=WPNxRpWZxz4CTJBnCG30x4CtMigJwHNUDfrnPlyNvcWF7wKXoYc/Gli9XUk/kjnFgL
         n/dzRDWCYTgMMmqCqPHvS62rjIm4W6PzfayotuX4b786oQG+Raf5/wX4VGuQSHwY/pav
         O3GSXC9zzHxdT2JY6uWNwCJV8QMEHbbVsgc+6Ps68XJlzmq+aGDhpGSiQTIcfAtjqKyL
         9AugrDEOFtytcLma+/xsO5pZOLer83ZQ6lK/tLGc9aB7QigyiybQHkdGvYTjcQ5435rq
         y6vPGQ4urgF0DqjduhAawvvRMyfSBs9zpvHeINQTEaysMazzxOPSA3hX5pqE74HyC2xc
         HZsg==
X-Gm-Message-State: AOJu0Yw0MzIrrBoOESGe3Upgl+/3b/ECwdKPsD3tSioq9lJEoJzhhwqY
	ehWnW43hfjbB1yK4WE706jlKMAi+kMkKKTBP0j1NokysRPv/8I8iQqVTBIDIrg==
X-Gm-Gg: ATEYQzycNnlmQN+QoDB7v+aWJRLTD5MGi6Q3gg/htFGx2rRlVWHFUlTVwS5SE9W3MaH
	83AkelCh+SbA39rwV6boNgviYraCkn64D0am2Y1fkxhsHXGkTV2TCVwa+l3+yaiT7oOQTBx1uaG
	GV21XLfKnE3a9eBLXJGZgvHcIvaD2oj7oQfDdZUF/b2kYJR7yD0/PtMR0f9iHNGUTC8qEC0k7aI
	66AH+bvAUsqHvq0KDyGopqFagQaL+KAifYCgw4/QVFBkSR7E2487lovdH6zWS603F8nchdNhRr4
	TWkyAkOO4D/RsOU2U8oTRt7hOQc5Q3nFaRXoS5uQxmjiptoRoFVak81C7FkiAL1pH/ao+Pevqcg
	egzOWH62EmAkxCb7EbfvNrm2w2ic4gBBszPTycnmg2DYmDSQmtviHHWzplEB+J6pdy7GXwdIVEz
	Uy0f6j8jlz6sA4D+6zELSG700GR5cfRvMdMBW0b7WueKYMYuIT+Hubsnw4Vz0VdhAZPNJyZ+Hwu
	irSX/LkCLdEhRTmUkGG
X-Received: by 2002:a5d:5d82:0:b0:437:745f:a6b8 with SMTP id ffacd0b85a97d-4399dddbfabmr21302099f8f.9.1772467288755;
        Mon, 02 Mar 2026 08:01:28 -0800 (PST)
Received: from fedora (mob-194-230-144-8.cgn.sunrise.net. [194.230.144.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60e40fsm28390097f8f.7.2026.03.02.08.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 08:01:27 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com
Subject: [PATCH v5 02/10] spdx30: Add supplier support for image and SDK SBOMs
Date: Mon,  2 Mar 2026 17:01:06 +0100
Message-ID: <20260302160114.46884-3-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302160114.46884-1-stefano.tondo.ext@siemens.com>
References: <20260302160114.46884-1-stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 16:01:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232210

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


