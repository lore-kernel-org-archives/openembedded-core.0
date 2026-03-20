Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 822B210987BC
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 16:50:05 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17791.1774025396944649310
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 09:49:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ag1cCv+M;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso7751605e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 09:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774025395; x=1774630195; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VBYoliMG7reUnNZuziuNn9Wy67z+GP84Mrqbrk8JaKc=;
        b=Ag1cCv+MR3pxjh2Rrv8/m9qKAbIppuW+dCRQIeYbTZrtqsh0fzqAvjp1BLcyj2qFrq
         F0T98oE9d88kSk9h1TlGrBnOgjR2c5A1MQF13FwrHtCzsaY6JhiHjEDUH38gaaW7QAg7
         Oe0JQ/2fx8R1SPsrqapKaUL9B1vRg9fyxyCJEM5F4jSwf1aCLctlX3Qtupj0JtgB1Etn
         pd07Msqq1URyucxyaT41kWRcuQJQaUqCIubbE5d+LOZpMHdZT/9t/D/Kxtmo9XBCsdRz
         qTTQYDHQ8mKcpI3IpphRsdMtHFk1/6WFLcn5Zd70aumNdJlTl1boVXbpRPwfGd42/2Xa
         i8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774025395; x=1774630195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VBYoliMG7reUnNZuziuNn9Wy67z+GP84Mrqbrk8JaKc=;
        b=IBvb0poCizBxnkpIQkibYVBcdXCsY0bVbBb48GXZ0tuG43FfYqePvUTE0C66s8DxY9
         mSDwWL9aER2eV1J9Uldx//q7hlvEUUHSy5Rzl4Mlf3It3DrmSFc5Tammhk9vgz3ucBmh
         W22rji2mdzTK+3IpQl78tFbC8x//eIvT2TyUribWjTMaoKhYSynGH7Y8ByqD8/+f9qx4
         GyA5iGPxJHxz/E4Gzbg0WnCzHa6pExtCn1BDdopPSVi8zV9mRdnPlDNnVUcK1jxxbtHu
         rYi8BbYtoIN01U14JjHpxMitf2lRqHG0YXcglNNBf5Hy5sexf+yWiNLMtYncNHXfuUZK
         s5dg==
X-Gm-Message-State: AOJu0YzBCO/aKcQ0Mwz3TAzA2pjzk6S3A1bRhQctgFxYp9P6Eo8EgLRF
	9GQO27a4XF8Czr/ONJv4qPNMcC/VvOBFSzRezHs/rh0S2+neB/gAVznzyL5N54w3
X-Gm-Gg: ATEYQzzUTwbhru6VzAUqxkfDMu9s7BEUf1tzw9WzhqlNAPXRoRCFt9nfXF818AAQQRo
	VH+AE8H+Dy3x4KxozUwRiubwtDrI7Eso9RzelH9/3R0ptgHu6XvUzKNFo/FOi2iYvwNqYH4+AJy
	OzQWwGRsQw7IHiwDz1IUiqtacnvV7QiJxNKGv45slnk+borQgT3bsA8/7Oh0wgHIJCu3UKSTl/s
	vZ2gWsRnwFQodQ1amCSTuaLBhS+7h8Xr6lCUZH0hMapXh7lepeDjoKx8tBywPT8GMWpw7fk8VMw
	V2a07qsxg36wSHGNGnxEmswot8IEszrZ/G726lyFKpkfN93FLpJaDaV6FE3FahZSw2rb1m3dDik
	kS4q0XjKjPpGWraj8dNQ+k1PlBbC82LzUpH8J5fEg8mvATlRZ/hWTx7Alj8M+8HsF5YMwTU1i5i
	NV371SmwdTJRkU3gwTBNIJbx9IoFheIz1B584=
X-Received: by 2002:a05:600c:8b24:b0:485:3dfc:57c with SMTP id 5b1f17b1804b1-486fee0fcf6mr54506115e9.21.1774025394928;
        Fri, 20 Mar 2026 09:49:54 -0700 (PDT)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe6d91fbsm73018905e9.3.2026.03.20.09.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 09:49:54 -0700 (PDT)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	richard.purdie@linuxfoundation.org,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com
Subject: [OE-core][PATCH v10 2/7] spdx30: Add supplier support for image and SDK SBOMs
Date: Fri, 20 Mar 2026 17:49:46 +0100
Message-ID: <20260320164951.128572-3-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320164951.128572-1-stondo@gmail.com>
References: <20260312153845.164369-1-stondo@gmail.com>
 <20260320164951.128572-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 16:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233622

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Add SPDX_IMAGE_SUPPLIER and SPDX_SDK_SUPPLIER variables that allow
setting a supplier agent on image and SDK SBOM root elements using
the suppliedBy property.

These follow the existing SPDX_PACKAGE_SUPPLIER pattern and use the
standard agent variable system to define supplier information.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-3.0.bbclass | 10 ++++++++++
 meta/lib/oe/spdx30_tasks.py          | 20 ++++++++++++++++++++
 2 files changed, 30 insertions(+)

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
index bc02b319c8..8aaafea616 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -1316,6 +1316,16 @@ def create_image_sbom_spdx(d):
 
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
@@ -1427,6 +1437,16 @@ def create_sdk_sbom(d, sdk_deploydir, spdx_work_dir, toolchain_outputname):
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


