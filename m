Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03BC4F483F8
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 21:07:53 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5649.1774300072338726231
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 14:07:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fwDnXV2V;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-486fe655187so42323285e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 14:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774300070; x=1774904870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgq0Rr5Y9sFxmseyi7D9hrrAkED5kk0G1Y/ZBPHYpCY=;
        b=fwDnXV2VGdKbHrSnGyOAdOrILy603aRgbE77sHpoiJfBcUfd4JfSUvRvpvWdGNZaGz
         ADr73pKeGgSKu+Dsbx8rrUT0I1SaIKAsG2RF6aBjS2hQIVZRi4d3BqOxn/lMtKJsDFuD
         h6r4V2PVunzQLfvsycitbKvqciCArlSNyhSSdCjfYBZrkD7YC4nmmAh6kkoe0Ht+74FE
         b5xCQ4Vgdh/RnIiVCxYLJey7jW/suUsw8EhGoiO+UOEh7XMynVCBqtjZoZDQ+YIPQnDV
         sP+hwpVpo9AZc84bxjVOugHmPaUmjIWPe0oaOFQ3PERMOhjv4Vac6QzcnTMloa187fNC
         jnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774300070; x=1774904870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kgq0Rr5Y9sFxmseyi7D9hrrAkED5kk0G1Y/ZBPHYpCY=;
        b=Ku9PAMkYG+wMBjkn1OOq6SOZ7G/DxV6BO2RSBtBqLSZ+e43ajt/9R6W8AbZZ0ckbF7
         LFLLOec/JWahUkeYK3onX9jW4JAnEIJc01gkHZfA9h83b2vJeZNH5/+P5SJWcKBAa9im
         Oo/ga2lOrqw+BFVa3fsQoIMijTJsgcCl+ZPN+OROi5F9buL9g5elz+rL4tVP5u3vV6x1
         m1hmU5T5tInbnhndNqElggiUqq6LfucUlINdMainFdHXburx/LiUS01k+CJCGo4fKz80
         6p+MsU90DXW6PLW0CM4tskRHwFIhE36JnIfqsFQTHbQlEbkddCPQbYTKEI45pHLgfvaq
         Aalg==
X-Gm-Message-State: AOJu0Yy6Dw4ZM7qs47P/kwKtiZubR2G/IbCUaAC0LNbxW1p5ExglSToJ
	sA2TiN8Am3V7UXK+C/naeCOrOmWlE2Rwyc7+NNsi6727i/IoWsxqQK70TXGPa80J
X-Gm-Gg: ATEYQzwzvgD2FXkFqUcb0ccnumyYssqu+dcte3LUqLHpjfkVhamgEns8BTuAWK3vp9G
	2ZJmn5ZCFohfZUTZdeN+YTR3ERk+bnCHLuj+C9fJ667j4GSzhhwvXcJILISvBACsKPY8p1anHz9
	gCH5WKL8Mqem4vAre6VQtcGOEk3bZco14Q9cHjEWVi/ZoY1ogYyz4LWiQqfHFhU//iY3FIiO1D0
	bL9f5EBRFn40OKToLt946gAjqZ2VxfGNq+ErCh8BuJ1ZOKCXujCFJeRNmcj+kRBuIZRhXhzUG8l
	Dc4gjR2FxqzR3UwePXcvkYeqNAAdhv9h0eXjBZKuBy0KWPtTHRdo3OUImgJcXxyx/ADrL+z7MYW
	tUq5OhlXeT+nAHy6i5/UUaqpwippCWEFzoObAYYD0HSpXgwL/buDKasIsYofaZoK9NKTLgr5UFn
	QvB5wSpiQBXKPURvA5vHT4MSRbq5r672oaTQJ5FfNFWt5kUWfQciug
X-Received: by 2002:a05:600c:35c4:b0:485:3f1c:d8a4 with SMTP id 5b1f17b1804b1-486fedb2551mr223290915e9.9.1774300070351;
        Mon, 23 Mar 2026 14:07:50 -0700 (PDT)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487113c4eb3sm853495e9.0.2026.03.23.14.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 14:07:49 -0700 (PDT)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	ross.burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	mathieu.dubois-briand@bootlin.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [PATCH v13 2/4] spdx30: Add supplier support for image and SDK SBOMs
Date: Mon, 23 Mar 2026 22:07:43 +0100
Message-ID: <20260323210745.1337169-3-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323210745.1337169-1-stefano.tondo.ext@siemens.com>
References: <20260323210745.1337169-1-stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 21:07:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233765

Add SPDX_IMAGE_SUPPLIER and SPDX_SDK_SUPPLIER variables that allow
setting a supplier agent on image and SDK SBOM root elements using
the suppliedBy property.

These follow the existing SPDX_PACKAGE_SUPPLIER pattern and use the
standard agent variable system to define supplier information.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-3.0.bbclass | 10 ++++++++++
 meta/lib/oe/spdx30_tasks.py          | 23 ++++++++++++++++++++---
 2 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 7515f460c3..9a6606dce6 100644
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
index 68ed821a8c..62a00069df 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -1449,6 +1449,16 @@ def create_image_sbom_spdx(d):
 
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
@@ -1560,12 +1570,19 @@ def create_sdk_sbom(d, sdk_deploydir, spdx_work_dir, toolchain_outputname):
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
-
-
-def create_recipe_sbom(d, deploydir):
     sbom_name = d.getVar("SPDX_RECIPE_SBOM_NAME")
 
     recipe, recipe_objset = load_recipe_spdx(d)
-- 
2.53.0


