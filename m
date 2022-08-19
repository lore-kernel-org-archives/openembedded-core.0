Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75BD8C00140
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 02:43:45 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.50699.1660877018260547942
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=m9Gla4EQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id e19so2196157pju.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=qe8mVxZcV2W+zWLORsOsF3SZHdmWfCFIWZE9/jCzIuA=;
        b=m9Gla4EQsnUmeoK0lCO5kD3qayl2lYfhiO8oP4ZkqkYR74InryrnwIB401fUDYOSB+
         pOv/VV287WjiYPTIRagiqVYgCsCWu0sb6L+R2vIWIRkeaWXq35J1Fdi+SmY/FLWC5XPu
         2FefEJcUCKM45FbD3dB5HoYwr0FyNzKC6k71XCmyPdpgg2GM4lyeneJxKHYhrwSVMjEn
         tSzk2sM21xamVqa6vanl2IBKaFyeGrG9Ligwp67+HV3bpMN5rHuJg3S/s/hMaIPiX4EX
         TgLVBbTT3LFXuqeNvinGfXPBA9yWwAoeJ9GRrHzfgz+nqFsdI8Iedl7yRaaaiEt6Yb+L
         cPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=qe8mVxZcV2W+zWLORsOsF3SZHdmWfCFIWZE9/jCzIuA=;
        b=l7xtd1BY8+QTwleVpzylw6naLBXD0wUh31hb1pDM626R5cDadRRj3O7RmoU6w6Hjk9
         hcuBp289c6nwHHv9OnFtKht1u/oy4M6muKssBEBtkuMN1fDY88rYYR7I+WGoOtCiBhPd
         I7LXTB3x17/BUtcTZGqbyy9AKbu3xF3XVglQ8q1NON8hV4FURMa7o8c8spM7G+NJ8Hgv
         61/FDdko3WKpeQrhvGKqoY7NBVz1QKqM4Ma9XTHB9AbiHX8wZ+DST6pZ0c/U7mY4xHdB
         AvFKchD+Qm9PUsVvEWDmw41UD1RxLqqU7At5C0rFj8MvdpDX0/Ap5KKpDcC6qN8PtDX9
         5UjA==
X-Gm-Message-State: ACgBeo1PKQQMbKxbWPsLj3TpbJZjzr0BIHqtwKxGTdWMf73twZYBZXKe
	QArssi2TuiUunAACal6/y/zegUpuHrTVXF9W
X-Google-Smtp-Source: 
 AA6agR5kFdu8UwqXipt16EKUY3jBzE2t2NRn5NtOK0TFqFeUCCHYWJdXkJ82tKI/y7Qvx+H0Haqc8w==
X-Received: by 2002:a17:902:f712:b0:171:29d0:6f9f with SMTP id
 h18-20020a170902f71200b0017129d06f9fmr5380245plo.84.1660877021559;
        Thu, 18 Aug 2022 19:43:41 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 t12-20020a17090a4e4c00b001fa80cde150sm4150145pjl.20.2022.08.18.19.43.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 19:43:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/26] create-spdx: Fix supplier field
Date: Thu, 18 Aug 2022 16:42:38 -1000
Message-Id: 
 <504b50aec662f177fea452e05e29af8b36ca69fc.1660876844.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660876844.git.steve@sakoman.com>
References: <cover.1660876844.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 02:43:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169559

From: Mihai Lindner <mihai.lindner@gmail.com>

The correct field name is "supplier" according to SPDX schema.
The "supplier" field translates to "PackageSupplier", but that's for
tag-value format.

Signed-off-by: Mihai Lindner <mihai.lindner@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ca8db0e0a2860ac1e3f537471fa71b43c3be0a58)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/create-spdx.bbclass | 6 +++---
 meta/lib/oe/spdx.py              | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 37b6b569a1..f6827fccf7 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -445,7 +445,7 @@ python do_create_spdx() {
     recipe.name = d.getVar("PN")
     recipe.versionInfo = d.getVar("PV")
     recipe.SPDXID = oe.sbom.get_recipe_spdxid(d)
-    recipe.packageSupplier = d.getVar("SPDX_SUPPLIER")
+    recipe.supplier = d.getVar("SPDX_SUPPLIER")
     if bb.data.inherits_class("native", d) or bb.data.inherits_class("cross", d):
         recipe.annotations.append(create_annotation(d, "isNative"))
 
@@ -555,7 +555,7 @@ python do_create_spdx() {
             spdx_package.name = pkg_name
             spdx_package.versionInfo = d.getVar("PV")
             spdx_package.licenseDeclared = convert_license_to_spdx(package_license, package_doc, d, found_licenses)
-            spdx_package.packageSupplier = d.getVar("SPDX_SUPPLIER")
+            spdx_package.supplier = d.getVar("SPDX_SUPPLIER")
 
             package_doc.packages.append(spdx_package)
 
@@ -895,7 +895,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages):
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
2.25.1


