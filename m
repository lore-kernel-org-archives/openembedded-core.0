Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B81EC5DF94
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 05:10:23 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14944.1771650614892795654
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 21:10:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P1pXuNtt;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4376c0bffc1so2067078f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 21:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771650613; x=1772255413; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eupd2dykcPZr6sFQFGsjgA9Qm1pjQz8IJyRmLVzjvJ4=;
        b=P1pXuNttIAX8bk5UhVlxlhR6zGX5nCVZK2LmM8yS17vN400w6Hj3CY29CBh1+wFj8H
         QQwlDFn5PCZrJjlfiBt66DcJkJarJmKcXhEZyN1lclXXVyK6pbR4HzeZjKyP2NPiqLqj
         5EqLLzxjUdp/X5uX8PafwXtWfhYN94nzoH1Ugxfawcm87WKaUUAyUEq+k4vMRNGWDiTM
         tcV15KsORfi5woLnlVN8kHIKCO7Kxs6MUmRMCdRS8JfP6dvsx4Begz6NyrIpRL5dbfRO
         m4Miz6j8lzMrp5WQZrHVxZZj5NqMPg65zPeVKhyqw/vtpXKJ9Z4ev+snSqwITV0IkWU7
         99JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771650613; x=1772255413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eupd2dykcPZr6sFQFGsjgA9Qm1pjQz8IJyRmLVzjvJ4=;
        b=bCOH5pGSLhncPwFkghDUz8O9KL3/nBRYGnJdel3OkPMY2Be9F/AsZ7EvS/JP232d7k
         zDNX+u2n+Sh0mmSI3bQyCo/7znhJWsgQ4HnjY+H1Z9to/BVcrSg8vpb2yfyV5z4mBc/c
         VNxG4WeinhgVLMJhz6icfwDszNGUGv0mrvPTCFSKwhP72tJUmzK5QE1y2j/+h2CHwDtH
         H8AZEN9km2MQRPT3EtYKB3VQzppZK38LOh5kSOBBa/RER5tQ0qYdDgsF/KNEKICrcIbR
         CZ8EzlC/sS6B3q1d3igTIWR8OFVst5GVtB8gHRoRL4+QcBnLOoEfDpShDr16VOQRozVY
         SWJA==
X-Gm-Message-State: AOJu0YyiR1Up39XagYDBQN3bOJ0157JrKp67Yvx4U7sgeoGPOdCdE7+3
	49jLQK0QFre6pxvMf/qXLO9GEdnex9e6wJc8YGCy6vBTIIhyJ0YnFWaluwW90A==
X-Gm-Gg: AZuq6aLISkWTdEGJLpY/D0ili5JasZeOfzkUSW3Ts8I7vA4K/dlESgso3cYaR6qc1Zz
	fcBLGT1dvjdrWnRtDQw4cqLs53l8Oss+5cq/QXY764VdY0EEj4MIfcgWbYEKaEYeWOxPupsT4Uo
	A3B65Mjrn4XLHOI7x5HgYvs4c3oukuu4wlQ60Fswb1tYo+QBGDnKJSYj77JcaOmS3jH15CnukXt
	KR6YTUpSZb+HRHDiq2JiKNj+hkoyshhjd4D1xE+nrI30qMpkQS+WbjJsnQ7HAn5XEkDQ93L+IxX
	roviKYCvs33HV2/e+mg0N3sb96sQ2Tt32zQexAc3ON5wZ1C2M/0ls90/l5tdf3zPptN0IXWs81a
	aLO8xZn7BAmIoiIv7+t7oEkoKPDThh/0CoG/mI5qvxSW2kW0o/J/2GjXYnVhLpzyTXlcza3cWjc
	XeVVgHwE6/akrsRFyfy9esGsEBPQyNC1G/lEU=
X-Received: by 2002:a05:6000:26c2:b0:430:96bd:411b with SMTP id ffacd0b85a97d-4396f19d88fmr3600618f8f.58.1771650612855;
        Fri, 20 Feb 2026 21:10:12 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bfa1bdsm2455901f8f.3.2026.02.20.21.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 21:10:11 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com
Subject: [PATCH v2 02/18] spdx30: Add supplier support for image and SDK SBOMs
Date: Sat, 21 Feb 2026 06:09:50 +0100
Message-ID: <20260221051006.335141-3-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221051006.335141-1-stondo@gmail.com>
References: <20260221051006.335141-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 05:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231582

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


