Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72894F3C9B1
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 16:30:14 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24297.1771950606318190462
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 08:30:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MEitdJUo;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-480706554beso69125155e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 08:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771950604; x=1772555404; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CVhHdnflhbmxc5e6lkwvXp5qLxqYG5eFwQf4q3YtImo=;
        b=MEitdJUo0+9NMLWcpCu11ci1/uKu1/S0pFojaSk/57T1QXOWYCK8Jic9orw9lfVIJ3
         ec5yiATdhZAQ7HdEjadrwF06eTCPwRbyOlg9xrd3x3ER9pEHV+PkCziSbooIPAKiq7GX
         m2Ma1o3plchebpFA4kR0nhZxA1ZIVuih4ZGNWtotxwMzkR5N+iyb2QqRIhzbnDTkq2b4
         M04DNUaHYgLnGFVD0aINtwr53UdZBq0Gy38w6sSV+LbpNwzSkCeKPNUFECPCjkPPW9si
         PqUN4s2l/WOV8SfYCjojQBRKQ8BV4e+R3eL+Z8y569u69LA0W6h/7V2A9drandnvsvbG
         hSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771950604; x=1772555404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CVhHdnflhbmxc5e6lkwvXp5qLxqYG5eFwQf4q3YtImo=;
        b=M1bdIA0ZNuesPheDFxAxWHse+HaZqywU0L8KIPoG73ZZpHkIZG924hdmEJFys3T+rz
         QLYwizHCCQSe6/QwK49b+O71vzNWw70sR17/M10gT3VizMWHWnkTQX7bKhqn9TN4iPN7
         nFLa2etU/3zccbBDDb72/yLY7ZkJ3nEVFH0VrQHCSBRk/jSovNKMlv1mFjg6I8jlhJsz
         LQlqL0tLSC28x6oue0yPytX6vQ8ffxS4gC30yXXEjRA79DCVDHw0xbIR+hM+imTlUYhF
         6Absayr5ssBelZxH60EL4Trxmzvk1eORZiQlasQxeTr1PxfLR2i0ulklYO/MNX6VdkJj
         qW1Q==
X-Gm-Message-State: AOJu0Ywy2aUu2xUhb3VNvcECS5wAvPgE5f6PZKtyoiJp62MWn/HEjYEm
	0Wrc01u5fDgZwlCBhmMiclnQUhMnSvESuaO8aN9AWXKDgOSf0Y0jfN3+RO/Qpw==
X-Gm-Gg: AZuq6aI56evVV17ZiSN7P+RW+O0i8CFuy8JfOaTS4N73scw1+jd0azsTHl+0+0LB0wA
	w7W2f34CmSWSoG110sq9tGLOc21S1rPxe+vG895tvJkWpqrNZGonqk867KF5CAuKYffjuaRJAlw
	ZFHUSHAwa/NWx4oiPGe5dFoZIJWMtwcUhU0qTCUdiL7cR7Kpp1LO77rTsTJiNybWX/edq2WGIzO
	GmMtWd5twz+xG6+3kQpKZBBu8aNTsNhIl+5grAQfUsS1ZRpheq962NaYGsuRS5t8TOwBn84RRUZ
	AKqkV+T+fDZkHpEAA+1ilpKTFmMtATyucLUUsSAa49h1YfXv2vW6V0VVdv3/2YddgvOAQlT/RMZ
	KRZolJFg3/oHtwq2H7N1oMrcoVGRYq3Pfefzx+HbmJ4cuxRMaUAiLWECEhZdc1YNQ91q/QXAkBo
	UgKCAT51Lyxhd0cs5sGt3fqCFJFAcx0pMA6wxkzaglgkNLCY4U2JRtOQDWgjvAICUe5o2elzodQ
	0lszwi8DbsoiPOA6yc=
X-Received: by 2002:a05:600c:530f:b0:483:bcff:7948 with SMTP id 5b1f17b1804b1-483bcff7bd8mr21621235e9.10.1771950603908;
        Tue, 24 Feb 2026 08:30:03 -0800 (PST)
Received: from fedora (mob-194-230-144-218.cgn.sunrise.net. [194.230.144.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd6f3124sm9716355e9.1.2026.02.24.08.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 08:30:03 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com,
	mathieu.dubois-briand@bootlin.com
Subject: [PATCH v3 02/11] spdx30: Add supplier support for image and SDK SBOMs
Date: Tue, 24 Feb 2026 17:29:37 +0100
Message-ID: <20260224162946.4000445-3-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224162946.4000445-1-stondo@gmail.com>
References: <20260224162946.4000445-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 16:30:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231879

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


