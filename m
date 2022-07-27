Return-Path: <mihai.lindner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3634C19F2B
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 17:09:31 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.22485.1658941767849681450
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 10:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K7jAPRLR;
 spf=pass (domain: gmail.com, ip: 209.85.218.41,
 mailfrom: mihai.lindner@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id b11so32602476eju.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 10:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MZuxc3ky4inNm349m5wpTb+bisWQ3hN+kNhqPdY6jMw=;
        b=K7jAPRLR1t4DQ9RPC85KVLdiViejeaZgR6AA+KywDiL3WR8i+jCf+Jv/3ABHHpBmbF
         si0hRjFhw3iQ4zVSGUnMv+Vnw77MTwy+Scctxf8T34Wr3jWO7+n9wdSC2haZvqQrB9hJ
         L9gZ7j5uzBXhHGq3PXuHdsG7rdrsF5yhyG52UEeZ5naSWV5Ph3xcWOHBGT6v4oFB6rXw
         D+jaia/1F99n/fNrxETKWJBK7009GKUo6XHhXVUVOSLrIB5mVGQ/TwtV06D06ZURfqW5
         Uomd/Va05aM58oAtxHARNRC7G+wdTuDl4nxqMJwI8fkCYbz8bvpGdwNwEuIyplAggzov
         OLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MZuxc3ky4inNm349m5wpTb+bisWQ3hN+kNhqPdY6jMw=;
        b=syPg/xFjBDXW1FuTC3FyeWqwHDS0U5rRVC/lItoLVxPsPcROVZnoJQ/tI1hio/P3JG
         VRUvickmdQNBtz5bohfLrrakmhLARXWSUAGLGW+FD7F8sYTWG93PCtgKEMAlrxn3vLFb
         AN7sfca4GjsarDYtmGesua5Je5uWAMuNow/mQ2lMM1ME9JEDFJHzt2m6QLqh+BRc3UuK
         AWsfQyOwGZhQD2EzkJS/UkzW5xHJQnS7J/tPtzHyJNeRzzJOT9VOxLAL65tHRpboWJss
         cPCOCrfECAbFxfGua4rAa2hEh25KDD3a5GJANfy1vCJ0SWfcKwoqErGlzZ19YpZtFaYw
         rCdw==
X-Gm-Message-State: AJIora85j6lV1vpDd9udIozdnsExrexKqN3kXUk5YrBxBAYkqxApdu0R
	ZrmKEJKMuWEpEUbsQ5/Mki77PnYUGW9/VdAs
X-Google-Smtp-Source: 
 AGRyM1v7uHrBxTDsg71bH+C88ogo6myUPHFDjqFpEGvSAEbHKDddpT/+v+HGrynzcIbtKYA0nQ0PWA==
X-Received: by 2002:a17:906:dc95:b0:72f:ab47:1692 with SMTP id
 cs21-20020a170906dc9500b0072fab471692mr18056972ejc.319.1658941766302;
        Wed, 27 Jul 2022 10:09:26 -0700 (PDT)
Received: from fun2.lenovo.com ([2a02:2f07:7215:e600:b43b:ef09:3bb9:3e14])
        by smtp.gmail.com with ESMTPSA id
 19-20020a170906329300b0072b6d91b056sm7833533ejw.142.2022.07.27.10.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 10:09:25 -0700 (PDT)
From: Mihai Lindner <mihai.lindner@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Mihai Lindner <mihai.lindner@gmail.com>
Subject: [PATCH] create-spdx: Fix supplier field
Date: Wed, 27 Jul 2022 20:09:18 +0300
Message-Id: <20220727170918.6960-1-mihai.lindner@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 17:09:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168582

The correct field name is "supplier" according to SPDX schema.
The "supplier" field translates to "PackageSupplier", but that's for
tag-value format.

Signed-off-by: Mihai Lindner <mihai.lindner@gmail.com>
---
 meta/classes/create-spdx.bbclass | 6 +++---
 meta/lib/oe/spdx.py              | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 15cccac84b..21cd5be3cb 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -451,7 +451,7 @@ python do_create_spdx() {
     recipe.name = d.getVar("PN")
     recipe.versionInfo = d.getVar("PV")
     recipe.SPDXID = oe.sbom.get_recipe_spdxid(d)
-    recipe.packageSupplier = d.getVar("SPDX_SUPPLIER")
+    recipe.supplier = d.getVar("SPDX_SUPPLIER")
     if bb.data.inherits_class("native", d) or bb.data.inherits_class("cross", d):
         recipe.annotations.append(create_annotation(d, "isNative"))
 
@@ -561,7 +561,7 @@ python do_create_spdx() {
             spdx_package.name = pkg_name
             spdx_package.versionInfo = d.getVar("PV")
             spdx_package.licenseDeclared = convert_license_to_spdx(package_license, package_doc, d, found_licenses)
-            spdx_package.packageSupplier = d.getVar("SPDX_SUPPLIER")
+            spdx_package.supplier = d.getVar("SPDX_SUPPLIER")
 
             package_doc.packages.append(spdx_package)
 
@@ -901,7 +901,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages):
     image.name = d.getVar("PN")
     image.versionInfo = d.getVar("PV")
     image.SPDXID = rootfs_spdxid
-    image.packageSupplier = d.getVar("SPDX_SUPPLIER")
+    image.supplier = d.getVar("SPDX_SUPPLIER")
 
     doc.packages.append(image)
 
diff --git a/meta/lib/oe/spdx.py b/meta/lib/oe/spdx.py
index 14ca706895..6d56ed90df 100644
--- a/meta/lib/oe/spdx.py
+++ b/meta/lib/oe/spdx.py
@@ -218,7 +218,7 @@ class SPDXPackage(SPDXObject):
     SPDXID = _String()
     versionInfo = _String()
     downloadLocation = _String(default="NOASSERTION")
-    packageSupplier = _String(default="NOASSERTION")
+    supplier = _String(default="NOASSERTION")
     homepage = _String()
     licenseConcluded = _String(default="NOASSERTION")
     licenseDeclared = _String(default="NOASSERTION")
-- 
2.35.1


