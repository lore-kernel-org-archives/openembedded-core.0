Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A99A0F54AB7
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 13:30:17 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19486.1774359015897368253
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 06:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KxstllSW;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso44652385e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 06:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774359014; x=1774963814; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msv1QujP3/OtyqVWNxdCYkHOiHANGiaQ6fHKsgSMM5M=;
        b=KxstllSWdjwanmdBA56wvp/x3m9TlJTYPWil4miatr4+26ND/QyfGzS3DecV2bJzNw
         Ireh7iFbGhZO8DUPOM3rp7l8eKuwoI+VAVexLObzjfRTrDz96zOqfQjaCB1Z7nzjTmF2
         uGArs32eJIWEOk3mDDqGk9grJUHdzJkES/2gIRFkNNd0J/737PEEfMEv52+1jP8eVTcn
         A8hfG/UZT9SciP6s3KdPYJ/K4za91lfr/WIknqHE985fJuUByouhnUHFUxy3OKOvlmwv
         8sKNQ6GaUmhGLcCtiETKL+7daFbthz4zi3jfAwvLvyX+CGjfCubfdqWMxcvhuAMfp7M0
         a8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774359014; x=1774963814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=msv1QujP3/OtyqVWNxdCYkHOiHANGiaQ6fHKsgSMM5M=;
        b=NoPdXPSlzMDsqg7riuxpPVRSqmX7fuO+CaNURfcqSRosvA7qvU30WF8QUSJVEYltWH
         4Rsfcrn5OzW0QSqh5wby7drslhsZgz/QYRrkVtYLHWVlyDEfU6VOlYVdBw+zNYCGTLBe
         fT5WShwqzd/7oPagzJK2cFf8aDKtRFwUFWpaLlAtuFKhN4kiduVfVxlP1lLagPLoHK7v
         ShytXeHjMnhXJeHSr+hJ/QE/vF2iYIhF2Z6DjlCYchjfpgtNtVRjrUNETj9Env94pD2Q
         5tdPeER/p5aGRt/QGgYalyZSnEUg12vS4ml5xfrLWwV531Li/6cJ5EVSjhQg2dt9dOFA
         SYkQ==
X-Gm-Message-State: AOJu0YzwU9AhZN9lK6kPZZ1iFCoSrlXmYNOh4G2H/QdbvMyF+/kjYdN0
	CDKn2xv33IEcEZThpb9A7HmEK5OlPyqOuXYq8Pt76UxTiC44usW86bEzGBCcV6mo
X-Gm-Gg: ATEYQzxuVmqZyUDhM9QilayfJCeDDc1AyzPP3+Cy20TQ9BdnW73rOyo/VkRIPC92OAh
	s+7Gg4T3j+FQYKv92GS1gwQXt7f5kR67KwjufQECTOKVv6+V7xyV5fgMmWkoCj41CJfvIWAYOKo
	8pVIoAx69kR31YC7QwSTH2uWgc/JEDWAwMuh9vSAQURUujn0x5ZejG1NV6CQusKJKiUvzFNoggS
	EgDmhV4CIPVW1XZ49mjiHjIvOLyZB5vsikNf+WMTxTSeEzMVuSA64BuaaxSFnUOZXwHBr+RE9FC
	7YIpV9hN8dYuMHENbEPu06jFdTwNf1mulzKpBukLQKa2YL/twidofIcpnffjTeAAGXLSMkaYX9o
	k2/9jJVJJshcGZY0/WBJeeM2nUYSL5dzJXlvRH+zYx8kVLCDb5FWdwHdAk11bW0gGFZ0JrTGZQV
	O+PJELHXoF1WFIJtXx1K09Vro5SDY+yOeRGL4CPdtOgYP8xcYU3zDAfRCQC5qrWOJkKZ2M/ftQp
	/5/NKrm
X-Received: by 2002:a05:600c:8219:b0:485:ae14:8187 with SMTP id 5b1f17b1804b1-486febb5996mr215368085e9.2.1774359013422;
        Tue, 24 Mar 2026 06:30:13 -0700 (PDT)
Received: from fedora (mob-194-230-148-205.cgn.sunrise.net. [194.230.148.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48710fa0e35sm47494875e9.3.2026.03.24.06.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:30:12 -0700 (PDT)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	ross.burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	mathieu.dubois-briand@bootlin.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v14 2/4] spdx30: Add supplier support for image and SDK SBOMs
Date: Tue, 24 Mar 2026 14:29:56 +0100
Message-ID: <20260324132958.2316491-3-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324132958.2316491-1-stondo@gmail.com>
References: <20260323210745.1337169-1-stefano.tondo.ext@siemens.com>
 <20260324132958.2316491-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 13:30:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233799

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


