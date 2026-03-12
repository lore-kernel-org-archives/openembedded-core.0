Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01DE01067055
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 15:39:03 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24659.1773329933015674904
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 08:38:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HRu4/zO8;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48538c5956bso11860775e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 08:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773329931; x=1773934731; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VBYoliMG7reUnNZuziuNn9Wy67z+GP84Mrqbrk8JaKc=;
        b=HRu4/zO8+Jm8vFgw/8AQF29Gxy8bHwsHs22bqB2UsRfOprTg80IHyjzUVKm9xm354W
         XSPigVHJ1dFG19q155I8hd9dumioXtFGcUdwcS1tqP+x8xzE2O2uMKZPDb01xIm2VNCe
         LsJ9WS6x8iLFbXvUr3xkYFGVjp3Wv5rKyMz2rD6Io28Usavge4Etjb/6ieo4tTbTEXnn
         M4FUj8por9bmqaUZRorRXMde8srCBlj8B4eZ7X/7zGXazQCeGpwMmfD36sbjzs1qwU7C
         K9vHbq+ZgDF5GjOOZG+95gvcv29YwLtbqZxjTvfg85HVOE5mAWRba3a96FcNjK0mUNUb
         7k+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773329931; x=1773934731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VBYoliMG7reUnNZuziuNn9Wy67z+GP84Mrqbrk8JaKc=;
        b=A6sW4zPBnreqHK+4won4zD1in0lWfH/XyZs7tIPwWz5vfypSwSA3MhrmCzSjpBn8xt
         6htenRRDmmLN1N/LMU6ZAqgn4YyWI6pf9U96jeA2ieVPu7/QlDQtc9qxSe99+COhVQpi
         0ponI5boAh11vyh8Zi9N0c4HZ5i07zGZlL5OdyhqbcaMSlq+cLsYT+zMLazQolDtLgGA
         njoWaZ8xIh7tKB8s8ufbphPp+zAYqASlQcTmaPSifPgFOecH00euBgHgxqqhVDuB8AII
         WBw1M3hE+T35b9A2ROpSjpGxYLzPUHfCGQ6uLWcR2qYKCKEdGmwcjFqw0CBECY+Z2qBi
         l5ug==
X-Gm-Message-State: AOJu0Ywxvk1cBkSa2mbIWtu7ZZOTXqo0HltijwnThkN7aaQ/A+VOLxC7
	EEpCYroqud6IHeT1fJkVi8+q7N0/Y5aeoHWPMZ1jJbg1Dg//L046jDjpmHjoRw==
X-Gm-Gg: ATEYQzyw8LznJgjpbthIAZS1wJZji1V8ggqj0yjfEB5gr/x3OZ0Mf/T3qZTb1/ZoNaR
	k9yFbM+Bz+JEGhR4zCe7jgYFwRdEc3rattYhQVnfNADdILKXciCsMYvo9NZLCQ+djYjoII6K63/
	VepwzEsf8XDmKER2VXwrNAcUmUDUBbRztlPY/He76YMFv7elZXw/xAGH24WW31kSSmpMpvCg3JZ
	Jd/8vpmanYsFqSRtWlgV7pqWnKLTR2SMlnJvJZ0Nij1TE/hoVXZaxwy8JDCMPFyf/SrXjlL5FI8
	w3XrCObnw40clGMAcKHakslLQrhnvlJyWHwfZTWobCAalk168GTH6GNwkdfTncI9E9ZkZKfTSdh
	fF1cD2wYwBRztyscaNssojqYF7PAmIc1AUNE+GVPGUOljF6erSI1FtuArdDd+8eHXSN0UuWXD9j
	m0ZtAWd8bNt5DCdqBr+93oHdTGopzIjozwAdA=
X-Received: by 2002:a05:600c:350e:b0:483:6d9e:e4f5 with SMTP id 5b1f17b1804b1-48555ac7160mr2223575e9.5.1773329930941;
        Thu, 12 Mar 2026 08:38:50 -0700 (PDT)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0dcf2asm74857385e9.8.2026.03.12.08.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:38:50 -0700 (PDT)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Subject: [OE-core][PATCH v9 2/7] spdx30: Add supplier support for image and SDK SBOMs
Date: Thu, 12 Mar 2026 16:38:40 +0100
Message-ID: <20260312153845.164369-3-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312153845.164369-1-stondo@gmail.com>
References: <20260309132854.128375-1-stondo@gmail.com>
 <20260312153845.164369-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 15:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232975

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


