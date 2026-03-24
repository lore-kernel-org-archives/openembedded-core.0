Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 228D8FEC0E6
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 17:15:25 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2746.1774372517297971715
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 10:15:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XhzvD26y;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486b96760easo14107835e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 10:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774372515; x=1774977315; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frt4szT8bkoO/XX4DW64eg/GyCV08l+6VEbb2BNNw74=;
        b=XhzvD26y5KJUgNqcAS+3o9Sy2Qik6PGRaAp61Z24gEwNLiJvLusn6LXbxxSMR3un2Q
         4fh5r2yyFmJQv0wIAtmEBT1+NMyGLPCS3jvwc56pDNVg6BgYe7SUZR44tHQm+jfScHTy
         EsdHLdRm71VuXvil9DULu5V4DwRPxEhSedFkYyyLKjy7Y2x4PXqRcz3Xt9m8TD63b0lW
         rpG29O3h8Nf2Zl/rG45gwKpuO7vTER+fJrcTViiGlBEhUTSIPXt2LloO4xTMtD9E7u0P
         O2ZaGm7A1MbEiNkkjQ8YfAz18aFqBT1v8dj9R1k5V/6qGW4CgrCbJfSmaYnjqmyRCVFk
         2zaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774372515; x=1774977315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=frt4szT8bkoO/XX4DW64eg/GyCV08l+6VEbb2BNNw74=;
        b=RkoejFA3rVV1yim5jxSAukZu9hx35HnAq4gK26y+MclT+mTJf8+ZcEv79hF2C6wQUM
         pj5doRsV2VvMwf7/wHSWLAUKoHHrRkQ/Avd/w82tMpP2/d75/kj+2wrt+BH6BCr+8c3y
         fsbHyBViTTwfeDPGfUuvY1qjAyKg8C0GAcVSMRy4VOGHXgJi+8MOE2MPJxv+Sd0oC/qT
         5WAlKRa3PaWc7QoGko/UBk+if1F9TdVERCMRYknFlsEJF6QymmnGYokLoa/5PeTD0Hn6
         9eSY/eM/cWh1oJFo1rzglvdaLl+XTXK/IVYvx3H/upGRb9hSswhC0ZKrDBt+QJ3IZ9Wp
         RDcQ==
X-Gm-Message-State: AOJu0YwuHNUZK44SmXotQlmosCrjgad4ljUq+USqj4JysdnsMIyZQkCR
	PxeAfYAOdr07nxLkB6GCUv3y8LgDsXoSn7GxoxaeduX4/FmUh+HEidaRabUJa0+2
X-Gm-Gg: ATEYQzxG8DDFVg0euLHkjLzWB3JQmKLlp+4b0UCN6Sm7Y2H6NTY8ab18uqr7an3+Xwr
	jDpXP6EPVC8OKOHMzvW7x4Wtpi1+FJ/ojIfWUk1IE0LPzcYdCxr8t9PGAMMYdkyOBZG7ZD8ZchB
	l8GYFGLILAXDkw4Gr0FDnI0bNxHouo+59gYwTROqSWY9UnUEqBbD4NTjnkvOBcgnOikbaVoEDGU
	IuWx35X5XPaCKBXnYMacN+gz6YnJuKrdJWGM9GYF6a9jSe1wnQBzAGAWb20CdP9sADHgUwhk5nW
	Sb3j4xR5AQBtVwQeRksEi3L2pquccLuEy188VfjaxV1sb3x5CWXe/V00UKFKrEJDBDMJOn88qL3
	mXoFnkAO49WuaF/zZ8kqLGIo3dvoA3gFR5DSkN6V+Wi2vhoyxKGsOKaDHODwHzsx3u/Q4ADub+f
	A9VMosoiFiy30PEuPXriC/EgWl9d+3IpkFUhljE6CaqA8DD2B1eTK2ceZm8Sbm9dS4QVnIvAxw7
	U6W/7FDo8udXLU3of4zkGMa4c1q35gR0ebZ
X-Received: by 2002:a05:600c:1e8f:b0:487:36c:f5ab with SMTP id 5b1f17b1804b1-48715fe70f2mr7563205e9.10.1774372515079;
        Tue, 24 Mar 2026 10:15:15 -0700 (PDT)
Received: from fedora (mob-194-230-148-205.cgn.sunrise.net. [194.230.148.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487165bea11sm2168665e9.1.2026.03.24.10.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 10:15:14 -0700 (PDT)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	ross.burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	mathieu.dubois-briand@bootlin.com
Subject: [PATCH v16 2/5] spdx30: Add supplier support for image and SDK SBOMs
Date: Tue, 24 Mar 2026 18:14:59 +0100
Message-ID: <20260324171502.689012-3-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324132958.2316491-1-stondo@gmail.com>
References: <20260324132958.2316491-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 17:15:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233816

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
index 68ed821a8c..51e10befba 100644
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
@@ -1560,6 +1570,16 @@ def create_sdk_sbom(d, sdk_deploydir, spdx_work_dir, toolchain_outputname):
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


