Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F05F3C25A
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 13:29:16 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14154.1773062953840561555
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 06:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aCYdekSa;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: stondo@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79901821bb0so6104697b3.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 06:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773062953; x=1773667753; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m4MO1wMJL49xQRRJcjgjfZnFZvHPCNP7ySXitFu5dDo=;
        b=aCYdekSaF7kYds46mkfjp1vPnYHcYu6fbaiLsrMg9mYAqJsl4p1UXWysLKtKil9Gd9
         CfJvFzmWrfOXKg6iEYBaV+Eb4b+blWirbIMU7zwQtDfiZKEI0frKqA1G5m7ONzocVqOM
         9dnZJ0bTUqIDk/YN4zAM8c+d8iAgU2r0eUEASx3kYFD/8Ga5a2ddx1ceCc1Vfa1jbi7J
         45QLQYHYc8TEwoy+mFzy/ZrCp1ie5OM4gRwrFnPoq2kz5xxEEGt1/XZqSpbZipraG/fp
         SBHsFs78+cQCVFX5KYVBus7zNfpdcvaSFGII33Sh10fjO4vn4GBSMmxgz8eiFNoRgiTa
         D99A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773062953; x=1773667753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m4MO1wMJL49xQRRJcjgjfZnFZvHPCNP7ySXitFu5dDo=;
        b=wVJX7OFI8RYzx8VN9noLfNN/56VFzc4szQBBcDtL1zannoLCPoVaE68FniObYfooVZ
         BXTA6iIs9cvSqWsf7xGQJdHiYuUBfcnEUlkNNSmZn2ufBdDGPSHsNK99x5mowjJ9aoAE
         9yL2LnH5DNPYBSnvs11y4o0OcsxxwaYzRZ2w2LYyF+ClD3DfTxy4XAN4KHrNWAY6kEsQ
         tZiGCOk351dMeYhfg0Gkkn9P9Lo4rYheVGwoLqCv+4m9VvNVRZOBuQFoXz9R013Tlo5l
         T5PCjCOHZ6ofJ9lxS5Qv0JSf02SZwSoaVfpa8SuWDcHlopqohEHjrUqNDzQip3EBNgJd
         tfsg==
X-Gm-Message-State: AOJu0YzcK+0643MrE6Nsx5SpNUWyFblORMV1b/pIqvcqU+gIKMn8rJYt
	GiQjlP4da2L1DVHX+HKkvchGF6C8nm2ol9oaxdxOJxnl3XJGq5V0PK69GNLYgA==
X-Gm-Gg: ATEYQzwGj+FRaWYNCkEmuo0RTOSbWDdDGcHH9Bax9SBo9fMOP04W05go+QwDDeFOA03
	ks4P4Tz/d1FOVaVCLo++u5gB7d+F8tvxHOtsCtNutOO6lDucuQEOLADwwXzZ/wv23cqLfQoHziV
	vnFTlntfSB/4DTvZCOW5HeZddkjLj1oqUkCk+Df7dS2Ev46uVbbsSJy185MOgsixM2yLhc3TbTm
	7noiZ9QsFxDRiDxMYZSpFgRY9PoHe4+scPjPS9R261jTHL3kjNWC4E99PgiSa0ijA4MnaAgBz8Q
	Ve6M51ARmlQVOmq70i/wWS92LLX80sg3C1Y9ffrtM23s39To4pyW7EQjW1MtojrKadEAX2jQEWz
	5nKz0t8lTlPaEIzinkVezLJrzT/0Wdnsuyj0pHyF/+RMjWd9ZTy+f3TXE+bLld91KuCC66+Cs4T
	oGMPNT7OkQSWAgIBa79PoeZcaiUXRKxmoikVJemhKuGE9SAVp/n9qy14s7uRepuDK0VV9uUk7+4
	GoLMIeq
X-Received: by 2002:a05:690c:c510:b0:798:67be:f903 with SMTP id 00721157ae682-798dd73a078mr101231427b3.39.1773062952707;
        Mon, 09 Mar 2026 06:29:12 -0700 (PDT)
Received: from fedora (mob-194-230-161-149.cgn.sunrise.net. [194.230.161.149])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-798dee6afd5sm44299437b3.45.2026.03.09.06.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 06:29:12 -0700 (PDT)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	mathieu.dubois-briand@bootlin.com
Subject: [OE-core][PATCH v8 2/7] spdx30: Add supplier support for image and SDK SBOMs
Date: Mon,  9 Mar 2026 14:28:49 +0100
Message-ID: <20260309132854.128375-3-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309132854.128375-1-stondo@gmail.com>
References: <cover.1772805096.git.stefano.tondo.ext@siemens.com>
 <20260309132854.128375-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 13:29:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232711

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Add SPDX_IMAGE_SUPPLIER and SPDX_SDK_SUPPLIER variables that allow
setting a supplier agent on image and SDK SBOM root elements using
the suppliedBy property.

These follow the existing SPDX_PACKAGE_SUPPLIER pattern and use the
standard agent variable system to define supplier information.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
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
index 5ced792d71..c3a23d7889 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -1314,6 +1314,16 @@ def create_image_sbom_spdx(d):
 
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
@@ -1425,6 +1435,16 @@ def create_sdk_sbom(d, sdk_deploydir, spdx_work_dir, toolchain_outputname):
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


