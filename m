Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8BABC433EF
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 22:48:58 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web11.520.1643323737865613653
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 14:48:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TG1gyNXu;
 spf=pass (domain: gmail.com, ip: 209.85.210.47,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id
 q19-20020a056830441300b0059a54d66106so4085939otv.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 14:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WiEGcWU0fiUMQgn/oQUQmlXVL95V/8rqJTngYji/p1M=;
        b=TG1gyNXuYwGCuLl00LzxFaV9fwcEJSKwGs9vxF0/BpNBfzLo8deaf0ftZGj8ISTKnA
         ChCVAP+JtmXyBdlHjCo9u3myhkqGhgyHU8MIW3XLo3sqTyCEAUdWjU+rqLR81SriyFeV
         UAc57i1XMC9EAFyHLYdo4v45KXIU+mNTG92D0vI2i2iI3/6yxIlHkNALBi+v2O0fuI5B
         2qJTBo7lf3KdzT4Bho6tE2DHhGxNBjUXRc0PysRMbzf5yyphHG+568ipu19rSoTmzn6e
         E4s3mqK1hZ3AbbgWyHZNdNWKBKtojJ0FiSYGtJ88rgAPrb2jJMhRA/k69a5V66w9eWJo
         9iLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WiEGcWU0fiUMQgn/oQUQmlXVL95V/8rqJTngYji/p1M=;
        b=tZcdee65Baq/FzZEACKOjjf+fwg10a0TgwOfKZoZMYkBCSziLQL5PT/er1KVW50dAz
         xcI4gB538QEYA+uiUKhW5+m296cBsxHykvzUIw8nXzk9eeFTivEW99nsO7qT4neEHHh7
         SwDGZuLfZhpzuO4sedM+vIvFhcKGHK3FXYQfMMaGZLKvB9yX8vjueunVYUqxz1NEzzdV
         6bHDsbzpyLo80EntkB/4qbMVNj2HuP3R27yKyl/GYGbn8i/fGGSe817h1w9QuKO4l9hN
         qjvjf/Xd+lZDJT21dSkZc1N0DEm/r7XQcFiQpAqOieLc5HvUYiLJIjgif1dMJ2mCKAK0
         JGIA==
X-Gm-Message-State: AOAM530tazYcQz1osXnX5u6r4bt6zM/G7J/Fmmbs4dytsxMd1aNoXsEd
	2QhJ3TNaZBc09Z7pyD4dPQWGUcqrmB0=
X-Google-Smtp-Source: 
 ABdhPJxGMa1RVKTYRGPqmZezyCO4gJ2LCrBVGqB6ToGpME8BIPdFw56LqeTSJQvg1/iBiU6432wiDw==
X-Received: by 2002:a05:6830:1112:: with SMTP id
 w18mr3332574otq.172.1643323736798;
        Thu, 27 Jan 2022 14:48:56 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id
 s18sm2255977oie.0.2022.01.27.14.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 14:48:55 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/create-spdx: Add packageSupplier field
Date: Thu, 27 Jan 2022 16:48:52 -0600
Message-Id: <20220127224852.1523820-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 22:48:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161058

Per NIST SBoM recommendations, include the Package Supplier field for
all SPDX packages that are created. This field should generally be set
to the person or organization that is performing the build, since they
would be considered the "supplier" of the SPDX packages.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index eb9535069a..eaf92c1773 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -29,6 +29,11 @@ SPDX_NAMESPACE_PREFIX ??= "http://spdx.org/spdxdoc"
 SPDX_LICENSES ??= "${COREBASE}/meta/files/spdx-licenses.json"
 
 SPDX_ORG ??= "OpenEmbedded ()"
+SPDX_SUPPLIER ??= "Organization: ${SPDX_ORG}"
+SPDX_SUPPLIER[doc] = "The SPDX PackageSupplier field for SPDX packages created from \
+    this recipe. For SPDX documents create using this class during the build, this \
+    is the contact information for the person or organization who is doing the \
+    build."
 
 do_image_complete[depends] = "virtual/kernel:do_create_spdx"
 
@@ -425,6 +430,7 @@ python do_create_spdx() {
     recipe.name = d.getVar("PN")
     recipe.versionInfo = d.getVar("PV")
     recipe.SPDXID = oe.sbom.get_recipe_spdxid(d)
+    recipe.packageSupplier = d.getVar("SPDX_SUPPLIER")
     if bb.data.inherits_class("native", d) or bb.data.inherits_class("cross", d):
         recipe.annotations.append(create_annotation(d, "isNative"))
 
@@ -534,6 +540,7 @@ python do_create_spdx() {
             spdx_package.name = pkg_name
             spdx_package.versionInfo = d.getVar("PV")
             spdx_package.licenseDeclared = convert_license_to_spdx(package_license, package_doc, d, found_licenses)
+            spdx_package.packageSupplier = d.getVar("SPDX_SUPPLIER")
 
             package_doc.packages.append(spdx_package)
 
@@ -826,6 +833,7 @@ python image_combine_spdx() {
     image.name = d.getVar("PN")
     image.versionInfo = d.getVar("PV")
     image.SPDXID = oe.sbom.get_image_spdxid(image_name)
+    image.packageSupplier = d.getVar("SPDX_SUPPLIER")
 
     doc.packages.append(image)
 
-- 
2.33.0


