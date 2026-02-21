Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A719C5DF85
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 04:24:33 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14434.1771647865437160656
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 20:24:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fJ4AzrcJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48379a42f76so21254805e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 20:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771647863; x=1772252663; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eupd2dykcPZr6sFQFGsjgA9Qm1pjQz8IJyRmLVzjvJ4=;
        b=fJ4AzrcJ+Q/z0Seh/firWZup6cZmSNSBg2qLnox1d2df5B+Ho6NXFJUfjWyRnSDhf7
         Oa8Lp04tzVInLEfgvh9I2C2bs3ArylZmvy+6F9sc2+ai65xcZCgZ4vZBmZIZ5aSPIZee
         dYceHYfjfA2CLBk9rxyAqKoXb5PsY5wGGezp9j3PydwfMbAABnBZB0SspkeAG5zGZZb9
         L2X6gJ04qibKXVPoPDe89UdarZkhmq8ja1yEtQ1GK82iwXVqeK8JQZdJF2zLG11C2u1A
         EeAMWMaWBfepioOGAHSSLlE4xiTRcbMPo2SOgt4S1Cefb/K1Rj4khptrD1uTpeOtRPNi
         7+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771647863; x=1772252663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eupd2dykcPZr6sFQFGsjgA9Qm1pjQz8IJyRmLVzjvJ4=;
        b=xRHSovJZynVZ43mKf2/Q/zmGEgabNQSLyUXWtvXBrVBEWz4o84TXavPD1yzhwnWnTv
         vooxuSPQ9bfcitCReF3IYXMehwzIsE1aOTitQcAZbojQC+5bi16RXvyoVKxoG95FxPjb
         V7JVS+jmfQwGvYrcvt8eqdNG/Bp/sUI4vh4zl6Y95G1bxuj7Q1zgfMmJIQEgfQm3HOBd
         UWaw+ALpczohY4Po8tbwkiF4bAolC6qnJ5qf8C33DdkjjXJpBzou+uFR+Ht8om/BcKqk
         KsV1FmletCplFaIPDz5ev3mOSynX7McL4lfPe1WZjQCGfYDADySfYkszxjZaZ5el+phW
         CYCw==
X-Gm-Message-State: AOJu0Yz7r18PTxuSqfPMbGS/ZXbBn+vUCRNaBzOZOyEhkcMLzrs0fdqn
	ytdq3ARR/LLS1HvvbOjpfUX6H+GFgGMGmDjdWPKr6iKnVx8NU4a5QRbGxPwQtg==
X-Gm-Gg: AZuq6aLsbA1OSREadEWVQRQdUdPlGsaD/Af9y/tkxGwtBDliqm8k3dCHYL67Mnfp64C
	QmCtrpQOy+ue5i1iXjQYpBs7uCsANxI/XUwcD6tyF/N9xkvqvXkDF2TBt5BAhV4S/nGJ1ncNuFg
	mFrezecNRLx+5OrNnszUsQCDAnMVcfAVCoaNMC1HZVW/9r9jPgfTQO4c3owWvMmlXMOotqoIS3F
	/SioIQiF7NYQ8+EERaiIKzp7+ILbjFsiP5yt+JTAywO8NQsG/MozfD3pzXl3vDJxoh+pcIyUfep
	CofD/2hBsIgyHHMORRvsgePJ+ko32+RlRJkdWIMo+I4ymiieoIMkb1PcTUBkDQ7rrNa00dnhEK5
	k4QXlJV/QTtwHC/gxH89++5pq/7I4EWrGIzL5HNFvT/T72hWKXA+nx1WbskAdrftK4V90RXXmCL
	UrhwNT/vPU1jo/sYYmBiWdG0QtBT2GwsM0GDQ=
X-Received: by 2002:a05:600c:37cc:b0:47d:25ac:3a94 with SMTP id 5b1f17b1804b1-483a962d1bbmr23607965e9.17.1771647863322;
        Fri, 20 Feb 2026 20:24:23 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31ff4d7sm117340865e9.15.2026.02.20.20.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 20:24:22 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com
Subject: [PATCH 02/14] spdx30: Add supplier support for image and SDK SBOMs
Date: Sat, 21 Feb 2026 05:24:06 +0100
Message-ID: <20260221042418.317535-3-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221042418.317535-1-stondo@gmail.com>
References: <20260221042418.317535-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 04:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231558

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

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

  SPDX_IMAGE_SUPPLIER = "acme"
  SPDX_IMAGE_SUPPLIER_acme_name = "Acme Corporation"
  SPDX_IMAGE_SUPPLIER_acme_type = "organization"
  SPDX_IMAGE_SUPPLIER_acme_id_email = "sbom@acme.com"

This enables compliance workflows that require supplier metadata on image
and SDK SBOMs while following existing OpenEmbedded SPDX patterns.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/classes/create-spdx-3.0.bbclass | 10 +++++
 meta/lib/oe/spdx30_tasks.py          | 59 +++++++++++++++++++++++++---
 2 files changed, 63 insertions(+), 6 deletions(-)

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
index bd703b5bec..789b39bd93 100644
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
@@ -663,7 +663,13 @@ def create_spdx(d):
                 force_purposes=["install"],
             )
 
-            supplier = build_objset.new_agent("SPDX_PACKAGE_SUPPLIER")
+            # Follow the same pattern as SPDX_AUTHORS: get identifier, build varname, then call new_agent
+            supplier_id_val = d.getVar("SPDX_PACKAGE_SUPPLIER")
+            if supplier_id_val:
+                supplier_varname = f"SPDX_PACKAGE_SUPPLIER_{supplier_id_val}"
+                supplier = build_objset.new_agent(supplier_varname)
+            else:
+                supplier = None
             if supplier is not None:
                 spdx_package.suppliedBy = (
                     supplier if isinstance(supplier, str) else supplier._id
@@ -1006,8 +1012,17 @@ def write_bitbake_spdx(d):
     objset = oe.sbom30.ObjectSet.new_objset(d, "bitbake", False)
 
     host_import_key = d.getVar("SPDX_BUILD_HOST")
-    invoked_by = objset.new_agent("SPDX_INVOKED_BY", add=False)
-    on_behalf_of = objset.new_agent("SPDX_ON_BEHALF_OF", add=False)
+    invoked_by = None
+    invoked_by_id_val = d.getVar("SPDX_INVOKED_BY")
+    if invoked_by_id_val:
+        invoked_by_varname = f"SPDX_INVOKED_BY_{invoked_by_id_val}"
+        invoked_by = objset.new_agent(invoked_by_varname, add=False)
+
+    on_behalf_of = None
+    on_behalf_of_id_val = d.getVar("SPDX_ON_BEHALF_OF")
+    if on_behalf_of_id_val:
+        on_behalf_of_varname = f"SPDX_ON_BEHALF_OF_{on_behalf_of_id_val}"
+        on_behalf_of = objset.new_agent(on_behalf_of_varname, add=False)
 
     if d.getVar("SPDX_INCLUDE_BITBAKE_PARENT_BUILD") == "1":
         # Since the Build objects are unique, we may as well set the creation
@@ -1330,6 +1345,22 @@ def create_image_sbom_spdx(d):
 
     objset, sbom = oe.sbom30.create_sbom(d, image_name, root_elements)
 
+    # Set supplier on root elements if SPDX_IMAGE_SUPPLIER is defined
+    # Follow the same pattern as SPDX_AUTHORS: get identifier, build varname, then call new_agent
+    supplier_id_val = d.getVar("SPDX_IMAGE_SUPPLIER")
+    if supplier_id_val:
+        supplier_varname = f"SPDX_IMAGE_SUPPLIER_{supplier_id_val}"
+        supplier = objset.new_agent(supplier_varname, add=False)
+        if supplier is not None:
+            supplier_id = supplier if isinstance(supplier, str) else supplier._id
+            # Add supplier to objset if it's not already there
+            if not isinstance(supplier, str):
+                objset.add(supplier)
+            # Set suppliedBy on all root elements
+            for elem in sbom.rootElement:
+                if hasattr(elem, "suppliedBy"):
+                    elem.suppliedBy = supplier_id
+
     oe.sbom30.write_jsonld_doc(d, objset, spdx_path)
 
     def make_image_link(target_path, suffix):
@@ -1441,6 +1472,22 @@ def create_sdk_sbom(d, sdk_deploydir, spdx_work_dir, toolchain_outputname):
         d, toolchain_outputname, sorted(list(files)), [rootfs_objset]
     )
 
+    # Set supplier on root elements if SPDX_SDK_SUPPLIER is defined
+    # Follow the same pattern as SPDX_AUTHORS: get identifier, build varname, then call new_agent
+    supplier_id_val = d.getVar("SPDX_SDK_SUPPLIER")
+    if supplier_id_val:
+        supplier_varname = f"SPDX_SDK_SUPPLIER_{supplier_id_val}"
+        supplier = objset.new_agent(supplier_varname, add=False)
+        if supplier is not None:
+            supplier_id = supplier if isinstance(supplier, str) else supplier._id
+            # Add supplier to objset if it's not already there
+            if not isinstance(supplier, str):
+                objset.add(supplier)
+            # Set suppliedBy on all root elements
+            for elem in sbom.rootElement:
+                if hasattr(elem, "suppliedBy"):
+                    elem.suppliedBy = supplier_id
+
     oe.sbom30.write_jsonld_doc(
         d, objset, sdk_deploydir / (toolchain_outputname + ".spdx.json")
     )
-- 
2.53.0


