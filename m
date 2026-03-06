Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74592F0183C
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 14:00:18 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69534.1772805609547349627
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 06:00:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d42khSdI;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso101206065e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 06:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772805608; x=1773410408; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KjtfWZab3pHkEShliIIuxh0QfLpjMDToChUQ7v2nBg=;
        b=d42khSdIpB+NN0BXru4CDleEKWaAhvt39mueUfXUNle+UrYs/D9Rmjkx75uPms3r2b
         vimKJUxOCBwF8nak4RKWs23ZTY5bagDUj1qFesQuGWd1bowW3VNlJS9MavGk3KabNiJH
         jBKs05RFFPsm0RY1toOxPGWNaxaDeLzzTpYIR/51B0ySL7YwSQ4t788mgOjRsFR1ZAgY
         Zh7oAA3kABmVwi3COjJ3SbPodMgsJIJhEB8jTB1JZ7XSGgkOTHxugu8X9sUIv9/0eqA6
         XosnhXxfbeJUrI3hMkuimX6t5Xk+Ao//kWZwrNQ+USeRwbGDR2rw0MXOoKuY7E3igQBe
         LgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805608; x=1773410408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4KjtfWZab3pHkEShliIIuxh0QfLpjMDToChUQ7v2nBg=;
        b=rFOTmA0G9OpkOUk/p7orz6HfVgf710sucZ2fdHEqx/huujCRvPTD/RfcVSzYzfJ9w6
         cRdvDBpHQ6+WhwFPmE9egWGK9PyC3Pi1TQOhAnWPNdC8T46WIM/F6gx2+2Bww2h+80XW
         zT5rphESsxaCVjJwZCYws8qRvzt7V46GD+hS34XSSX+zuH24gWffNDA+jvxpj3lwf7fh
         6W991p4nSWzsfIfvNFV+eRGMC76sDScgqC9hIpqCaZCtxVQCOo9PyJOteSMN2gtX7ySg
         rLgwwDXNp81YB+aCLZCoBuScKZCOZa/owmirK0E1TMSP4mYuZL2hbS9bldgQc5bgAs4u
         veKw==
X-Gm-Message-State: AOJu0YyeGeQGoYbhnRPmje578vVPEz0/5qVDFzG55HztKVlCcuqMWNHe
	Madu6WngL8V7CHk9BlpvCfvJMd4oHRuHMNbSIKQJ8RZBOxwgKzDtc6vQFlJbeg==
X-Gm-Gg: ATEYQzz29TLr98RzPEZV30cgqqeYW5m3NUiQ0ZMtcGT+6uGKA2w9bWYqIu5uHgEGC/q
	QWQOdhAjV1yOnqtPsUrmletX6pXTxRJQUqhETXmUwnxv+BDNSW8IdkHbT0/KkbgEOZg2/kIefRz
	dXk35j03OY6tHCTV8HucnvvLPNks/YxjFzsQzCn1BpoX8mgl+owyf2MMcve2sjTHNRHMvW7N9FJ
	50C5AxskeE3tTPpOIJf+Zus8s0L9/xflvnEmtPYjkPkzB0ZWR7oN6AWBFhOBDtIamm+V+maE5wR
	fo4AVymTGX7ikJ0GRSvcbe2yhALOOhRdmaNbFzFnwIup4iPNoQbaCQSPfnkEOLbaNjz9SF5ke4A
	upf9za2WNyWIxjRdHdryMWFb/Vq0lrr4HEpWCEJAAYOmDmHPXoYlanW3CbeIpWk7m+TiK5BjyAw
	+G9BdqC2LFy/I6Ia7GdAuUA4HqZCH8LsGZAYqAlZsDEbL3fK0ZjFEK0ulqnQnxYX8=
X-Received: by 2002:a05:600c:1913:b0:47d:3ead:7440 with SMTP id 5b1f17b1804b1-485269795ecmr31304365e9.32.1772805607349;
        Fri, 06 Mar 2026 06:00:07 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb4257csm187098845e9.15.2026.03.06.06.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:00:06 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com,
	joshua.watt@garmin.com,
	ross.burton@arm.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Subject: [OE-core][PATCH v7 02/10] spdx30: Add supplier support for image and SDK SBOMs
Date: Fri,  6 Mar 2026 14:59:54 +0100
Message-ID: <4a45ebaaa895fa7976d13572ed2b6f25a59592c3.1772805096.git.stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772805096.git.stefano.tondo.ext@siemens.com>
References: <cover.1772805096.git.stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 14:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232568

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


