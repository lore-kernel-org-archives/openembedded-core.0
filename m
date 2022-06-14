Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A2C2C43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 02:30:52 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web09.1587.1655173851502874627
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 19:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bJ3hLI6O;
 spf=pass (domain: gmail.com, ip: 209.85.160.43,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-1014b2752c1so3847213fac.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 19:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cYhjXmHjLBhXvnYcdpLRoj1ZF2NPUuE5VbynubmZ5OI=;
        b=bJ3hLI6O4FV4DE7MBOiWyKxVPm9vMa+6ZT4C+OcXQuBe8tkmoa16ijmHRd6mZI0EbY
         fmPdUUrBIwamu1HtJrnq2mPC8oPHW5J19kjQewI6oehGAprHSF8Fly+DQIHB/5vYXYWy
         NSgToCbRBuI/F3eQDYl2W5/oyIEq5RPy7VLogH9logjzVu39qUE113UvoHfg3T/r2ItI
         rxvzuaStaOpejxg8UEFz+vmK7QB1EP9x5u+qASiUVi7mvr01cfWhaMaNmr3x/0lUsTdh
         1TxtPvbgvr/ko0mGiQ2Tn5y0PJ+0GcCxH8nZmR8jFttc/YHFkyrC0H8AMkiY/IFwc753
         Yjbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cYhjXmHjLBhXvnYcdpLRoj1ZF2NPUuE5VbynubmZ5OI=;
        b=eDTKroa4u8B9NI3IIlF+DuipjxmZ3U+Jpk2q5yIj1MVBcjI+68AfFT9l97iOd/eceF
         F3QgwCvcvp2zlfWtOTmFOQm+CcddBr1CAwJHo0Lal5zRxBjgvBuknpp992T3IdP8h7Pn
         4ECcxT3PhgPdugB9vuX95mXeyykRZgXeXPBz01vvBzQXP9gfhG8BbPZUlOqGr0Znd2qk
         8SKMv6SbT21EM+TTpeGfO31V4HDDBEYrm3XleLfmi/RQvTRda5Om5Aq827bkF1elXori
         OtHDJM40gZRdqMj1zdMbyXrnTGLweDkiKK3naldo77TVai/PefeZJgx6a+DQHSvb1ghO
         5zAQ==
X-Gm-Message-State: AJIora9ggjuVReMnvOb72u9PLlvugsbyUK65IyGp3H7wPYpdhX2E2EbD
	fUHcZGCRmvx4B/dYfa9SKA8G0rj9H7s=
X-Google-Smtp-Source: 
 AGRyM1u8rSdWkhmYcv3m0Tlz2dd1SiBCt3pSh2j8rhs/Nxsji9V5Kc9+ZVXDYD1BKgbnlwBnLcT+qg==
X-Received: by 2002:a05:6870:5628:b0:f3:26ff:2f98 with SMTP id
 m40-20020a056870562800b000f326ff2f98mr1122312oao.176.1655173850447;
        Mon, 13 Jun 2022 19:30:50 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id
 b2-20020a4a8782000000b0041b83a0d994sm4458270ooi.34.2022.06.13.19.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 19:30:49 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/create-spdx: Add SPDX_PRETTY option
Date: Mon, 13 Jun 2022 21:30:47 -0500
Message-Id: <20220614023047.3180852-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jun 2022 02:30:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166872

Adds an option to make the SPDX more human-readable (at the expense of a
larger files)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx.bbclass | 22 ++++++++++++++++------
 meta/lib/oe/sbom.py              |  4 ++--
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 37b6b569a1..15cccac84b 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -25,6 +25,7 @@ SPDX_ARCHIVE_PACKAGED ??= "0"
 
 SPDX_UUID_NAMESPACE ??= "sbom.openembedded.org"
 SPDX_NAMESPACE_PREFIX ??= "http://spdx.org/spdxdoc"
+SPDX_PRETTY ??= "0"
 
 SPDX_LICENSES ??= "${COREBASE}/meta/files/spdx-licenses.json"
 
@@ -76,6 +77,11 @@ def recipe_spdx_is_native(d, recipe):
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
@@ -515,7 +521,7 @@ python do_create_spdx() {
 
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
@@ -938,7 +944,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages):
     image_spdx_path = rootfs_deploydir / (rootfs_name + ".spdx.json")
 
     with image_spdx_path.open("wb") as f:
-        doc.to_json(f, sort_keys=True)
+        doc.to_json(f, sort_keys=True, indent=get_json_indent(d))
 
     num_threads = int(d.getVar("BB_NUMBER_THREADS"))
 
@@ -996,7 +1002,11 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages):
 
             index["documents"].sort(key=lambda x: x["filename"])
 
-            index_str = io.BytesIO(json.dumps(index, sort_keys=True).encode("utf-8"))
+            index_str = io.BytesIO(json.dumps(
+                index,
+                sort_keys=True,
+                indent=get_json_indent(d),
+            ).encode("utf-8"))
 
             info = tarfile.TarInfo()
             info.name = "index.json"
@@ -1010,4 +1020,4 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages):
 
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
2.33.0


