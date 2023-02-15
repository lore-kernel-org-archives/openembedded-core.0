Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38AB8C636CC
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 21:13:53 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.5280.1676495632412741999
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 13:13:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JH7DVzLF;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id dt8so17081907oib.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 13:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=00WYRlMmfZcxi9j+OgJcAsoZwz87a+18qknAk9oQucs=;
        b=JH7DVzLFIZQjm4WPYZj5welyNX8FJPwAUKjdiJjrHpqkqq2OoE/jjnfuyaBZFD8WGD
         CnsXkITOZsv+pOtFlGTYcOmm+23p3FgY9rRGbdb/NaS/5woOWBejVOX5S1IaWBLZiDZZ
         Kr93Hx1VJY7SZQPk81pY2vVk1MQ+eSsMOjGyDnEDoJD4uaW648ZCc2sAzYKeICfGnJom
         kyA43u9CAqoXlUXihvBQMuj0kwjuvsYnzqFJWPImGsL6DO0/N5ji23keYXu1FY6w/hlp
         pTF5F10Lq0yGFG9ZUAGbX0t66oBDuBfu8iqjsfl50iGeem+52Gb/YaR/RAcmzX+/xdeJ
         hTsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00WYRlMmfZcxi9j+OgJcAsoZwz87a+18qknAk9oQucs=;
        b=lOJH80tpBogTUawFgVZqHYdG74n/FJt7mBWXAAZqAeBdY8mpUQJQmQgtxSTUkNutVk
         xFgGuLvOpDiKYWw0shpBB3nwEWECsmSyLc5ZqdvZFvqMYLKxnkaqDPXax9P+FfPZ6pIy
         FXbU9xwzkt2ZhPx40DEoZBshHWUjwwHMWJSG1Y5TWVNdx5ObTRP64PskfSK8W4g9RYhr
         3hnIwDM2X42Z/lXLsGoYRk14NiLwQUKqBwoUxjDPGV0yw2DZckPMfcIrr84gExsF+7b5
         fKRUpVFW+dAhyTx7l8spuFiTykyxAdoZi/tg4viQfcuxXDFeAHk8uLLCdBlkHyhXDl8h
         uSJQ==
X-Gm-Message-State: AO0yUKV0Y48EXavfLiHmuRl+Y9yR0KmVodGwAWSSNn6oNwcfYZgNJ6UW
	/cUoEKyxhhbRW7s0CxxA0wsOmvJeN+c=
X-Google-Smtp-Source: AK7set/ckWk73xsjCqXYYAsTSACjZSg7rGIL0ZVKqfMyGGR8ywWQBx5QC9WaSiUPIiBbdqrfzFq89g==
X-Received: by 2002:a05:6808:152:b0:378:bf7:84bb with SMTP id h18-20020a056808015200b003780bf784bbmr1351293oie.1.1676495631068;
        Wed, 15 Feb 2023 13:13:51 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id q185-20020acac0c2000000b0035a9003b8edsm7653963oif.40.2023.02.15.13.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 13:13:50 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Carlo Piana <carlo@piana.eu>,
	Alberto Pianon <alberto@pianon.eu>,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/create-spdx-2.2: Report downloads as separate packages
Date: Wed, 15 Feb 2023 15:13:46 -0600
Message-Id: <20230215211346.3223918-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 21:13:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177217

Moves the downloaded items from SRC_URI into separate packages in the
recipe document. This is much better than the previous implementation
because:
 1) It can report multiple download locations in SRC_URI, instead of
    just the first one reported.
 2) It prevents the assumption that the source files listed in the
    recipe are the exact file from the source URL; in particular, files
    that come from file:// SRC_URI entries, and source files that have
    been patched were problematic, since these aren't from the upstream
    source.
 3) It allows the checksums to be specified

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-2.2.bbclass | 58 ++++++++++++++++++++++++----
 meta/lib/oe/sbom.py                  |  4 ++
 meta/lib/oe/spdx.py                  | 13 +++++++
 3 files changed, 67 insertions(+), 8 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 28a42e009f..454dd7a7a0 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -406,6 +406,54 @@ def collect_dep_sources(d, dep_recipes):
 
     return sources
 
+def add_download_packages(d, doc, recipe):
+    import os.path
+    from bb.fetch2 import decodeurl, CHECKSUM_LIST
+    import bb.process
+    import oe.spdx
+    import oe.sbom
+
+    for download_idx, src_uri in enumerate(d.getVar('SRC_URI').split()):
+        f = bb.fetch2.FetchData(src_uri, d)
+
+        for name in f.names:
+            package = oe.spdx.SPDXPackage()
+            package.name = "%s-source-%d" % (d.getVar("PN"), download_idx + 1)
+            package.SPDXID = oe.sbom.get_download_spdxid(d, download_idx + 1)
+
+            if f.type == "file":
+                continue
+
+            uri = f.type
+            proto = getattr(f, "proto", None)
+            if proto is not None:
+                uri = uri + "+" + proto
+            uri = uri + "://" + f.host + f.path
+
+            if f.method.supports_srcrev():
+                uri = uri + "@" + f.revisions[name]
+
+            if f.method.supports_checksum(f):
+                for checksum_id in CHECKSUM_LIST:
+                    if checksum_id.upper() not in oe.spdx.SPDXPackage.ALLOWED_CHECKSUMS:
+                        continue
+
+                    expected_checksum = getattr(f, "%s_expected" % checksum_id)
+                    if expected_checksum is None:
+                        continue
+
+                    c = oe.spdx.SPDXChecksum()
+                    c.algorithm = checksum_id.upper()
+                    c.checksumValue = expected_checksum
+                    package.checksums.append(c)
+
+            package.downloadLocation = uri
+            doc.packages.append(package)
+            doc.add_relationship(doc, "DESCRIBES", package)
+            # In the future, we might be able to do more fancy dependencies,
+            # but this should be sufficient for now
+            doc.add_relationship(package, "BUILD_DEPENDENCY_OF", recipe)
+
 python do_create_spdx() {
     from datetime import datetime, timezone
     import oe.sbom
@@ -458,14 +506,6 @@ python do_create_spdx() {
     if bb.data.inherits_class("native", d) or bb.data.inherits_class("cross", d):
         recipe.annotations.append(create_annotation(d, "isNative"))
 
-    for s in d.getVar('SRC_URI').split():
-        if not s.startswith("file://"):
-            s = s.split(';')[0]
-            recipe.downloadLocation = s
-            break
-    else:
-        recipe.downloadLocation = "NOASSERTION"
-
     homepage = d.getVar("HOMEPAGE")
     if homepage:
         recipe.homepage = homepage
@@ -507,6 +547,8 @@ python do_create_spdx() {
     doc.packages.append(recipe)
     doc.add_relationship(doc, "DESCRIBES", recipe)
 
+    add_download_packages(d, doc, recipe)
+
     if process_sources(d) and include_sources:
         recipe_archive = deploy_dir_spdx / "recipes" / (doc.name + ".tar.zst")
         with optional_tarfile(recipe_archive, archive_sources) as archive:
diff --git a/meta/lib/oe/sbom.py b/meta/lib/oe/sbom.py
index bbf466bbad..22ed5070ea 100644
--- a/meta/lib/oe/sbom.py
+++ b/meta/lib/oe/sbom.py
@@ -14,6 +14,10 @@ def get_recipe_spdxid(d):
     return "SPDXRef-%s-%s" % ("Recipe", d.getVar("PN"))
 
 
+def get_download_spdxid(d, idx):
+    return "SPDXRef-Download-%s-%d" % (d.getVar("PN"), idx)
+
+
 def get_package_spdxid(pkg):
     return "SPDXRef-Package-%s" % pkg
 
diff --git a/meta/lib/oe/spdx.py b/meta/lib/oe/spdx.py
index c74ea68878..7aaf2af5ed 100644
--- a/meta/lib/oe/spdx.py
+++ b/meta/lib/oe/spdx.py
@@ -216,6 +216,18 @@ class SPDXPackageVerificationCode(SPDXObject):
 
 
 class SPDXPackage(SPDXObject):
+    ALLOWED_CHECKSUMS = [
+        "SHA1",
+        "SHA224",
+        "SHA256",
+        "SHA384",
+        "SHA512",
+        "MD2",
+        "MD4",
+        "MD5",
+        "MD6",
+    ]
+
     name = _String()
     SPDXID = _String()
     versionInfo = _String()
@@ -234,6 +246,7 @@ class SPDXPackage(SPDXObject):
     hasFiles = _StringList()
     packageFileName = _String()
     annotations = _ObjectList(SPDXAnnotation)
+    checksums = _ObjectList(SPDXChecksum)
 
 
 class SPDXFile(SPDXObject):
-- 
2.33.0


