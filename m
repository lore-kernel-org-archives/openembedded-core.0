Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45A20D185C2
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 10:34:31 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3771.1767868466287786577
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 02:34:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TfWoCZks;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4327555464cso1703851f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 02:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767868464; x=1768473264; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxuhOTYkjeSPY0a0BLlfDGBo525VzsiCdIEoPYD9d/A=;
        b=TfWoCZkspZcSb4VXkOuWrZ1cD7p80IgX6xgCg3vWQO8I+QwY128GdWtav6B0M4onLK
         3taTnCm9yIo3xsTQSRXUGMC8eNZSPkWxkqnjvdlfBfbYRME9OAjHsApkhjMR1jIuusOI
         zmVVeEOvrjPDNDmHc4ipaW4GtsrJeC8dKkP7TwCSy3EYbfaczDdsDWio3U6idJg+C16B
         ZCjxEcx0sGd+tBkTvQtebZ9Us1kGaDyD4jB8TxlUrhA1+RaLaC42u62VzNjn9EvxLywS
         HJJ51cT2eDHte/4zvJDi1Qj1fHitbWn2bEpIvzfewbB2nnR28XcXnADBaKCiM6LyxoIo
         Ow9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767868464; x=1768473264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OxuhOTYkjeSPY0a0BLlfDGBo525VzsiCdIEoPYD9d/A=;
        b=o7A/2JpViitJ5Sf03tlaHJ6+LI4rzrtGnX5e4Z8I7QTUR4RbSTg6KJfAn4d8RD/q8Q
         n0n/0r2rUyWmjuJFsiFt074E53HFpy5Jmbh61WAiQONjrU3Rx6MxUB2BeKe8lm9NLOT0
         qrOevRCCtewHVtNwBFnDrCCg61A8A4GO+vPXaP+03dBY/E2OpwwqYHSCt7LPWEafyYl2
         +b6Nj6N9QkvKyYMwsg8oNTq26ADZfrOmz5f0CGO077PdaTyRENkpJa8bGXmuKdeMy8eZ
         FcDy9RxUBKp0m35BvTJe294iFBV8X2OJJ6B+0+OLRnWUH8cHbYmxIgVSibvH7I9xQ3yc
         B2Cg==
X-Gm-Message-State: AOJu0YyYwVY4XjQJJfuQobgtspytuDM3Duz0xQI5w9TZ+JM8zX5iB/+c
	7lKp//Rop5V6xW1txgjtSSOHRJ/+5UpJj6zzbK+V78Uekef5XdNaC8iXLTC0vw==
X-Gm-Gg: AY/fxX6OhgccD/r1B5zBo6Um3qnmQTMFj8LiAlAcfz7a5ht+FF1fFlWMkN3L7uGfQqX
	w++XlJuxpRhMg9POiJIPNoHu/orikSkdIzT1k5psmWRYauo2nQlDn8GB+lCowgpLNy6lRLjmGHo
	0F+h6ENM2jfiUwyyjlm5+F3+tAOIZv/9lQpO0Ppor9hnsFzA8H4pUD37tae4mZwUA4mnSbsjcxb
	L248kzRUaKBeQ7RpRux04S7ShSb9Z/JlFdoI1xmo8GxnN+Qrf8P8urBvRPdN3YoQltrLdty6h0h
	UVwNJmlqdecjxVhJ1f463+Yo6RpZUAo0YQu89gDmmRTrFx08tpqSlzV/HhcvH9LI9/Wu/wqrxaG
	aoWvBIrMkPEgN3vdXdLDeunBTjgS0O/y0x0DGZrjd8+BimUbOyI3wAZFPAUi/Hwa83q6Hq7YD1k
	UTNiAVxTrixjwH33vLHo2piZ4=
X-Google-Smtp-Source: AGHT+IFzru7cOwChYwXU/ZAmN65QzUQPdyRj1jzpXa1cRmUqfdmJdmy9+rfiww77G4hD+/EJ0ybWtg==
X-Received: by 2002:a05:6000:26c2:b0:431:8f8:7f24 with SMTP id ffacd0b85a97d-432c379d19emr7346858f8f.39.1767868464078;
        Thu, 08 Jan 2026 02:34:24 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-432bd0860f5sm15351720f8f.0.2026.01.08.02.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 02:34:23 -0800 (PST)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: stondo@gmail.com,
	stefano.tondo.ext@siemens.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	JPEWhacker@gmail.com
Subject: [PATCH] spdx30: Add supplier support for image and SDK SBOMs
Date: Thu,  8 Jan 2026 11:34:07 +0100
Message-ID: <20260108103407.72432-1-stondo@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107180951.140895-5-stondo@gmail.com>
References: <20260107180951.140895-5-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 10:34:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229057

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
 meta/classes/create-spdx-3.0.bbclass | 10 ++++++++++
 meta/lib/oe/spdx30_tasks.py          | 24 ++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 96c0b9722b..9f9066eeb5 100644
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
index c86b088b61..2883e2202a 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -1305,6 +1305,18 @@ def create_image_sbom_spdx(d):
 
     objset, sbom = oe.sbom30.create_sbom(d, image_name, root_elements)
 
+    # Set supplier on root elements if SPDX_IMAGE_SUPPLIER is defined
+    supplier = objset.new_agent("SPDX_IMAGE_SUPPLIER", add=False)
+    if supplier is not None:
+        supplier_id = supplier if isinstance(supplier, str) else supplier._id
+        # Add supplier to objset if it's not already there
+        if not isinstance(supplier, str):
+            objset.add(supplier)
+        # Set suppliedBy on all root elements
+        for elem in sbom.rootElement:
+            if hasattr(elem, "suppliedBy"):
+                elem.suppliedBy = supplier_id
+
     oe.sbom30.write_jsonld_doc(d, objset, spdx_path)
 
     def make_image_link(target_path, suffix):
@@ -1416,6 +1428,18 @@ def create_sdk_sbom(d, sdk_deploydir, spdx_work_dir, toolchain_outputname):
         d, toolchain_outputname, sorted(list(files)), [rootfs_objset]
     )
 
+    # Set supplier on root elements if SPDX_SDK_SUPPLIER is defined
+    supplier = objset.new_agent("SPDX_SDK_SUPPLIER", add=False)
+    if supplier is not None:
+        supplier_id = supplier if isinstance(supplier, str) else supplier._id
+        # Add supplier to objset if it's not already there
+        if not isinstance(supplier, str):
+            objset.add(supplier)
+        # Set suppliedBy on all root elements
+        for elem in sbom.rootElement:
+            if hasattr(elem, "suppliedBy"):
+                elem.suppliedBy = supplier_id
+
     oe.sbom30.write_jsonld_doc(
         d, objset, sdk_deploydir / (toolchain_outputname + ".spdx.json")
     )
-- 
2.52.0


