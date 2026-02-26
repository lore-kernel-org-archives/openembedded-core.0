Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 336DEFCE060
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 12:18:50 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68798.1772108320812907245
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 04:18:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a/VX/+55;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so5545455e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 04:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772108318; x=1772713118; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CVhHdnflhbmxc5e6lkwvXp5qLxqYG5eFwQf4q3YtImo=;
        b=a/VX/+55YnMNwUdO1g/WIhfn7sZ7j0RwYMOVVg+eUqXcsMbq/yy3x/HvNXRcLOb7GD
         5eItKcemTlSb3nujQAI6FxM84is2mhWD2wMmbo2N/Dqkqq3MhYqXU4/Zxtr33r8rLQgN
         Op+HbxHzgU3EEvhsf60tk5ylCFrj02sCvL8XQMCGrjuKUgkaijkyKxqmrVZrW3IMDRCG
         KGDfdM5SQHbjmeA0WJ/7wqJXYsLx4P+DZUHQGqYzFK3wNyWB5r3v1V2wME3RHnz14wtO
         n1TtK2nz0fEsNvXOMEvpAksr9KWEdWp4A+0jskfqY5YNTpJlNm7nU7SV3Kkh4falII10
         SnUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772108318; x=1772713118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CVhHdnflhbmxc5e6lkwvXp5qLxqYG5eFwQf4q3YtImo=;
        b=ndYH0P6BcqEkr1fQ6+fgJE4JgsKXZM0O85gsg+Zcy7JMj6HZJJ3IRlXRr+/bVC39OU
         IAYLcwJXTomWGfaWT/qD1TddjB1gNjq77jCRzBt3bs6nKVhw9szxk7ksZYScERFZxlgR
         aT9AxlVPQwOfhaZnTGqOa0LF3Z/9WxoqKZtgvg9b5ILahaLSD3OqFUUfkBmW7iBRph8D
         52x9A8gyrS1no9LVDrbkyVQgOW7z+Pc/RcZmpm0yPzT8v2UPdXF/Ls33aLh3WGW8cGtm
         ca/GJp6tZQJ2JiI4ldvTL+4Gcamjn+LeLKMCnmQcR7J2f2Slqh4u7abeMMkWNCoUlcxL
         wa9g==
X-Gm-Message-State: AOJu0YxrLxy+Mlx4e7JBiZeMREmt8Gu2tuOptE3Z7cG6ckp4h7tBfLRb
	8tjI3WSZuGNmGZGNl+TJU5HnghSoYEVuwPP9qFNddG/EaXrjf3dAw+arx+N2Jg==
X-Gm-Gg: ATEYQzzpTb6kmAtDlw11xfMhKEXAKuY57MyWmoq60t+z33M58MrMZSkyr77WAaesFpO
	qd9IxAMJdQs9aVCBN0ji3sGz9wNVo6/jcznvg97HTMgpex8EKx+pQ3t2QHoKIVjT4ZPutRaA1Ty
	I7NIaH7yTlevxQvRKnjGUzDAMthujU03q82Zdh3/N8aePe9V4S0MiWG+hEv8c/WNArUVlHfe8nw
	ch0VSlBP0Dyq7pcS1Irnxbwy165yZ4XaR71B+az4aBHw+2bFUMV5nWZ5Ud9+ZH/jItlp0lEP7PZ
	U/MBvLTc9U9kjigRgu4gPmo9lKOthaA3RdsKTz02NsymvX1CrWzaTztScq91n3dVgMygRBphnVy
	vMk71HWx1IWePp+UHpDQQUgtRUk6oGixUfQTRSaIdtC5DfJPLfO3D9OqADnKvrhys53W14TwMvd
	b28Mqizxd47b/6PYIp
X-Received: by 2002:a05:600c:450c:b0:483:75f1:54f with SMTP id 5b1f17b1804b1-483b80c9ea4mr197318975e9.31.1772108317826;
        Thu, 26 Feb 2026 04:18:37 -0800 (PST)
Received: from fedora ([165.225.94.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb77466sm48483955e9.5.2026.02.26.04.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 04:18:36 -0800 (PST)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	jpewhacker@gmail.com,
	mathieu@bootlin.com,
	Ross.Burton@arm.com
Subject: [PATCH v4 02/11] spdx30: Add supplier support for image and SDK SBOMs
Date: Thu, 26 Feb 2026 13:18:14 +0100
Message-ID: <20260226121823.149327-3-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226121823.149327-1-stondo@gmail.com>
References: <20260226121823.149327-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 12:18:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232007

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


