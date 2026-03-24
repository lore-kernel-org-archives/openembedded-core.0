Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEEA1F532E7
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 17:14:53 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2730.1774372487644456378
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 10:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nIizR60e;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-483487335c2so44851345e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 10:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774372486; x=1774977286; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frt4szT8bkoO/XX4DW64eg/GyCV08l+6VEbb2BNNw74=;
        b=nIizR60e7n2HGE3ZeCVACeYPFJ9byNfiEzUC93nG79oDfCMLsbqvSCiccrPIvVmK+k
         xr1sIt8LUxQfKGDAVoyyAeXxTzOdYNAZ9OAPocMszy54buunYOJ6f61hSqQf9HwnULzz
         wXG/tlOMrDCoBpunrFk/hhCp4JXi2/RXwNGWQOWinR1e4Cg80JrrOKctxw4rXNU1YLO5
         dNfiPRfgS+JVwpWWfHln7mw0TQIfYKJtR7/Gd6tx9PST7jm9GIg6z8cmMgR59tCaQEJG
         W2fTLJ5Xeo/hS5dBx+kxdmVWtdAOYwuZCWESp2bfdnNBEUaS2xQvEGEMJTVHwGXg7jfT
         ap7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774372486; x=1774977286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=frt4szT8bkoO/XX4DW64eg/GyCV08l+6VEbb2BNNw74=;
        b=Vkg+YY0RgDn0zoCQSCL9A+FR19sA9Y9bCfPDx1e0sv8vgb9bEx5b2airHBpmz7B7ZJ
         /reP8lo1OGfPf/dQWw8WUFezuniQgm5r6nL2uLjtisZZf2uRllhq8N1IlnVzFgn2sli4
         epbkMyPMuP6Q5/9JrcNml+sJHxt7HDbbNwVlqvwUvMvLKKCKTI1okCmcaVm8JKqm/xCD
         KZLL+RYWUrAysnXmU3gBvsEcZ2uf8UeVM141uRxfwOxwWq/QTwTpSP1mYrm6rx1L97NG
         unqY69NcLd+9jG4d8mN+RGTGvTiBKP39mkgkGLsO6oeyKaNUnsHkH5kEQ32jWK+AmvPS
         Kehw==
X-Gm-Message-State: AOJu0Yz9/SpqqgCvugqVar/Vh+4w19GqxqPLPSqiZBMfesYua1cC49XM
	/N3zSSlprSC9P6Dc7CSglHsFrH5nLIzry8JDL7tjbzQsijCXjgDf3A06fBZoT0Ld
X-Gm-Gg: ATEYQzxEjZOFDlElycZSpz7eq7zXn5gFCBIdX84EvvLWJkXoJ3zsZdk9k658w/ksv8Y
	k9CoNvfWCF+DDlcAkqCqDH6ieYsaW8Rit7N/BsRMr8+hK/EHP3kLmHI0RIk8N7D7aQ6fXaKFIWN
	C6gunLBYN9kASlUE9fK3CGSzSNOV3du9qBMWJmWnfS267OWOGP3+FEvmKhLSv+GeS4rodehzchv
	JTu5MswiVQH3echaYkvByJ6kzyRw1PqMs9wYaUTtLBasUmWH8by+dgbEmaigjfwmHagaoWogwUn
	JJC5gkTR3DB1qd388jYXnH4U6rh0tzyfbKra24Em0ED/rAEWKfcsjvPyftSpIiz3kO8T+UPRR93
	jRKd0Q99GktP2gQv1kXU9dtq+KGPm8wTJ+HcOhb/OWZ5H8tPvp1qRYAVT53hNSYYOXut2kGmFYx
	KGMQ2lqC4P0Xm7FcQGxynBKhEv6WJhhDq3iQGHT6Dfbsv0JF7P3PuCtVs01/nuDkAkSGbGMRFgH
	xahGLJexQPm0xObgwMhL4L5fQ==
X-Received: by 2002:a05:600c:1913:b0:480:3ad0:93bf with SMTP id 5b1f17b1804b1-48716061795mr7601225e9.24.1774372485556;
        Tue, 24 Mar 2026 10:14:45 -0700 (PDT)
Received: from fedora (mob-194-230-148-205.cgn.sunrise.net. [194.230.148.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487165e8e0csm1089275e9.1.2026.03.24.10.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 10:14:45 -0700 (PDT)
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
Date: Tue, 24 Mar 2026 18:12:43 +0100
Message-ID: <20260324171246.686862-3-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324132958.2316491-1-stondo@gmail.com>
References: <20260324132958.2316491-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 17:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233810

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


