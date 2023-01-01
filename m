Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0237FC53210
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:38:46 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.16026.1672594723763662988
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:38:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=tm4CYsYI;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id e10so3236371pgc.9
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pDzJ6+R+B+JCd0KP3PRfzxRmxZ5K2DE+I9NKNqk4Uyc=;
        b=tm4CYsYIOTEQcvMBCwVmmjClu3LqCPuk2StEx+4ZzvlxpM8i+Vtab/1fW71/ZAK/i9
         XIvtSnQ0gyMkeygRTw9f5TFz/+5LHEnARJNHyC7pD/vYmvB2RIldqVPq14y/BUwpHZX0
         vZe/HCEiORKpjEnxewxZLdbW2zcGZDaSkbOm90XF9Offlr0LIzqu37W/IvO/I4btdWoK
         wVmHGYGZB3dohoZxgzaZf4C28Vl3lcwmL5sfsOwMw66n6M3+vo41weGxscAZFydGpeGs
         DP4BnAtkG967MIJDVHzixjVjoTqIPs2KO18PBQdA5Ta5eAnXtqW/hk47OCpHcJZm7pkL
         88UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pDzJ6+R+B+JCd0KP3PRfzxRmxZ5K2DE+I9NKNqk4Uyc=;
        b=to5LueDD96iZbwvYECaKIHh4RMJJaO1Hb8+0S2vCt83MMJb+tsc8YnV4VN2BWKO1DL
         qbhqf5wEQb91hM1n/8fAK/h7gvmlPFffosVoFnIBR65WDfDRzBOGrv8jrc2KVbjQ3dkR
         ZfUN3gFKHv7jIbzSE5JMCfS39m80ldBxwG94m3Rnf3iH00pWMc9rOjaxsOY9LWDGXqUi
         R9zVF5U0UA6UoVGWVI9CFZ9Py+i0NDNY/2oiu65lMDH2DJx4YMMKpOw9ntfQ9cfbDbM2
         qzAVSPzjwUI1/GmY0TwQK/B93qr2N2GKSGxBgTmw602FJ/BbPl/oliU5h2dGty7JVcu+
         MKvw==
X-Gm-Message-State: AFqh2kocBLbD4GZVCj7gOUTB6MwifXx5J/tjGrZFMmT/4np2rp4X3YHx
	w8McSn6VJ8azYhgLvSmrhzp9WmuH0AK0ZIRYcU4=
X-Google-Smtp-Source: AMrXdXseU3Mcu3oi7Bm70VOy7yTG1lRxB1GKWbhBCR+7bjg5m4b/iPgY3BV7R4N3ZLaMpZaSSBNSDg==
X-Received: by 2002:a62:1d57:0:b0:581:6979:5e with SMTP id d84-20020a621d57000000b005816979005emr20997152pfd.15.1672594722683;
        Sun, 01 Jan 2023 09:38:42 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id v63-20020a626142000000b005828071bf7asm102299pfb.22.2023.01.01.09.38.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:38:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 23/29] classes/create-spdx: Add SPDX_PRETTY option
Date: Sun,  1 Jan 2023 07:37:45 -1000
Message-Id: <645b22b51370ab11e31ca2ff84f5211ce2e9af83.1672594521.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594521.git.steve@sakoman.com>
References: <cover.1672594521.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:38:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175211

From: Joshua Watt <JPEWhacker@gmail.com>

Adds an option to make the SPDX more human-readable (at the expense of a
larger files)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4799594b26f77ed259dc661bf077519b338390c8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/create-spdx.bbclass | 22 ++++++++++++++++------
 meta/lib/oe/sbom.py              |  4 ++--
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 212dfe0aa3..349ecfe6ab 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -24,6 +24,7 @@ SPDX_ARCHIVE_PACKAGED ??= "0"
 
 SPDX_UUID_NAMESPACE ??= "sbom.openembedded.org"
 SPDX_NAMESPACE_PREFIX ??= "http://spdx.org/spdxdoc"
+SPDX_PRETTY ??= "0"
 
 SPDX_LICENSES ??= "${COREBASE}/meta/files/spdx-licenses.json"
 
@@ -75,6 +76,11 @@ def recipe_spdx_is_native(d, recipe):
 def is_work_shared_spdx(d):
     return bb.data.inherits_class('kernel', d) or ('work-shared' in d.getVar('WORKDIR'))
 
+def get_json_indent(d):
+    if d.getVar("SPDX_PRETTY") == "1":
+        return 2
+    return None
+
 python() {
     import json
     if d.getVar("SPDX_LICENSE_DATA"):
@@ -514,7 +520,7 @@ python do_create_spdx() {
 
     dep_recipes = collect_dep_recipes(d, doc, recipe)
 
-    doc_sha1 = oe.sbom.write_doc(d, doc, "recipes")
+    doc_sha1 = oe.sbom.write_doc(d, doc, "recipes", indent=get_json_indent(d))
     dep_recipes.append(oe.sbom.DepRecipe(doc, doc_sha1, recipe))
 
     recipe_ref = oe.spdx.SPDXExternalDocumentRef()
@@ -579,7 +585,7 @@ python do_create_spdx() {
 
             add_package_sources_from_debug(d, package_doc, spdx_package, package, package_files, sources)
 
-            oe.sbom.write_doc(d, package_doc, "packages")
+            oe.sbom.write_doc(d, package_doc, "packages", indent=get_json_indent(d))
 }
 # NOTE: depending on do_unpack is a hack that is necessary to get it's dependencies for archive the source
 addtask do_create_spdx after do_package do_packagedata do_unpack before do_populate_sdk do_build do_rm_work
@@ -743,7 +749,7 @@ python do_create_runtime_spdx() {
                 )
                 seen_deps.add(dep)
 
-            oe.sbom.write_doc(d, runtime_doc, "runtime", spdx_deploy)
+            oe.sbom.write_doc(d, runtime_doc, "runtime", spdx_deploy, indent=get_json_indent(d))
 }
 
 addtask do_create_runtime_spdx after do_create_spdx before do_build do_rm_work
@@ -939,7 +945,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages):
     image_spdx_path = rootfs_deploydir / (rootfs_name + ".spdx.json")
 
     with image_spdx_path.open("wb") as f:
-        doc.to_json(f, sort_keys=True)
+        doc.to_json(f, sort_keys=True, indent=get_json_indent(d))
 
     num_threads = int(d.getVar("BB_NUMBER_THREADS"))
 
@@ -997,7 +1003,11 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages):
 
             index["documents"].sort(key=lambda x: x["filename"])
 
-            index_str = io.BytesIO(json.dumps(index, sort_keys=True).encode("utf-8"))
+            index_str = io.BytesIO(json.dumps(
+                index,
+                sort_keys=True,
+                indent=get_json_indent(d),
+            ).encode("utf-8"))
 
             info = tarfile.TarInfo()
             info.name = "index.json"
@@ -1011,4 +1021,4 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages):
 
     spdx_index_path = rootfs_deploydir / (rootfs_name + ".spdx.index.json")
     with spdx_index_path.open("w") as f:
-        json.dump(index, f, sort_keys=True)
+        json.dump(index, f, sort_keys=True, indent=get_json_indent(d))
diff --git a/meta/lib/oe/sbom.py b/meta/lib/oe/sbom.py
index 3372f13a9d..52bf51440e 100644
--- a/meta/lib/oe/sbom.py
+++ b/meta/lib/oe/sbom.py
@@ -32,7 +32,7 @@ def get_sdk_spdxid(sdk):
     return "SPDXRef-SDK-%s" % sdk
 
 
-def write_doc(d, spdx_doc, subdir, spdx_deploy=None):
+def write_doc(d, spdx_doc, subdir, spdx_deploy=None, indent=None):
     from pathlib import Path
 
     if spdx_deploy is None:
@@ -41,7 +41,7 @@ def write_doc(d, spdx_doc, subdir, spdx_deploy=None):
     dest = spdx_deploy / subdir / (spdx_doc.name + ".spdx.json")
     dest.parent.mkdir(exist_ok=True, parents=True)
     with dest.open("wb") as f:
-        doc_sha1 = spdx_doc.to_json(f, sort_keys=True)
+        doc_sha1 = spdx_doc.to_json(f, sort_keys=True, indent=indent)
 
     l = spdx_deploy / "by-namespace" / spdx_doc.documentNamespace.replace("/", "_")
     l.parent.mkdir(exist_ok=True, parents=True)
-- 
2.25.1


