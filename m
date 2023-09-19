Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4993ECE79AC
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 21:46:33 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.22847.1695159985282874454
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 14:46:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FptA17u7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-31c8321c48fso159546f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 14:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695159983; x=1695764783; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2CpFVOQnp8kMFEYPj5Ca02vYxdWnTUOGDBmRqRqbyP8=;
        b=FptA17u7l1H2UoGCa4s4n4ndDE3FFDf5gzWIBVzdhAqwP7V5b+WtHDq883oKc8fyRf
         pGJpxlmIXihD+HrTSiunAq3vCj3sRzVjnSw0WZ896dkzMiEyM2eDmtvicDdArbUHm9nZ
         L8R8TASNSSUdTR32BP1SrpWpw1n8xAL4aWRT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695159983; x=1695764783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2CpFVOQnp8kMFEYPj5Ca02vYxdWnTUOGDBmRqRqbyP8=;
        b=hf42D5RPWQp6oFcsUEG4sgug1kE+B+kW50gyMlzGA0nHFwCy0s8Y91X/fK7x5vjc3a
         82VS9SmdslEke5cQM+3kDZftHyCupmkfp5hz4a1qWqoWJZmKBe8ljgc5g6ylg8zGMxbb
         3N3aWH3PmLRRdzBB3pOYnWcJjl/taH6lFi7SgF4jHUOFtpC0ftnGJva6FE4svpxGZwA/
         snm2Q1N4eXTTIH2AwOnD08dCptpEpHHxsIaUHLJopuNvnWO8NulXIVHBqk6viVelNX+C
         qaerJmAUcSClDot7r7jDv2k8PC4/dYYXxLl97CmUW+e8b1glUToazPDz7hHUfk/GqCDl
         5zWg==
X-Gm-Message-State: AOJu0YxK87MzJ02M1L4Fz4keu56fZ8w1fKERhj2OeS14+Zcgf/z0xNbc
	efGZJQ9OHSX5E7vFbP3YmOsxwk7gkzaxc/5ORHo=
X-Google-Smtp-Source: AGHT+IEKd6eTX9MAlsjE/dz4N6XjUQ7X63+xDBmd8hQ76JkWDQXViNO3Ccm+s5LuLESCWDMGUlsvhQ==
X-Received: by 2002:a5d:51d0:0:b0:320:6d6:315b with SMTP id n16-20020a5d51d0000000b0032006d6315bmr645324wrv.29.1695159983506;
        Tue, 19 Sep 2023 14:46:23 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:34a6:a1c2:97a:851d])
        by smtp.gmail.com with ESMTPSA id c13-20020a5d4ccd000000b0030fd03e3d25sm16657827wrt.75.2023.09.19.14.46.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 14:46:23 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] create-spdx/sbom: Ensure files don't overlap between machines
Date: Tue, 19 Sep 2023 22:46:16 +0100
Message-Id: <20230919214621.903967-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230919214621.903967-1-richard.purdie@linuxfoundation.org>
References: <20230919214621.903967-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 21:46:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187877

Currently the by-id and by-namespace SPDX files are created without reference
to PACKAGE_ARCH. This means that for two machines using a common package architecture
(e.g. genericx86-64 and qqemux86-64), there would be overlapping files. This means
that the build of one can remove files from the other leading to build failures. An
example would be:

MACHINE=qemux86-64 bitbake core-image-minimal
MACHINE=genericx86-64 bitbake core-image-minimal
MACHINE=qemux86-64 bitbake linux-yocto -c clean
MACHINE=genericx86-64 bitbake core-image-minimal -C rootfs

To fix this, add PACKAGE_ARCH to the path used for the files and use a search
path based upon PACKAGE_ARCHS to access them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/create-spdx-2.2.bbclass | 28 +++++++++++++++++-----------
 meta/lib/oe/sbom.py                  | 20 ++++++++++++++------
 2 files changed, 31 insertions(+), 17 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 9b28d124c78..655d63fcd38 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -349,6 +349,7 @@ def collect_dep_recipes(d, doc, spdx_recipe):
 
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
     spdx_deps_file = Path(d.getVar("SPDXDEPS"))
+    package_archs = d.getVar("SSTATE_ARCHS").split()
 
     dep_recipes = []
 
@@ -356,7 +357,7 @@ def collect_dep_recipes(d, doc, spdx_recipe):
         deps = json.load(f)
 
     for dep_pn, dep_hashfn in deps:
-        dep_recipe_path = oe.sbom.doc_path_by_hashfn(deploy_dir_spdx, "recipe-" + dep_pn, dep_hashfn)
+        dep_recipe_path = oe.sbom.doc_path_by_hashfn(deploy_dir_spdx, package_archs, "recipe-" + dep_pn, dep_hashfn)
 
         spdx_dep_doc, spdx_dep_sha1 = oe.sbom.read_doc(dep_recipe_path)
 
@@ -385,6 +386,7 @@ def collect_dep_recipes(d, doc, spdx_recipe):
 
     return dep_recipes
 
+collect_dep_recipes[vardepsexclude] = "SSTATE_ARCHS"
 
 def collect_dep_sources(d, dep_recipes):
     import oe.sbom
@@ -533,6 +535,7 @@ python do_create_spdx() {
     include_sources = d.getVar("SPDX_INCLUDE_SOURCES") == "1"
     archive_sources = d.getVar("SPDX_ARCHIVE_SOURCES") == "1"
     archive_packaged = d.getVar("SPDX_ARCHIVE_PACKAGED") == "1"
+    pkg_arch = d.getVar("SSTATE_PKGARCH")
 
     creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
 
@@ -620,7 +623,7 @@ python do_create_spdx() {
 
     dep_recipes = collect_dep_recipes(d, doc, recipe)
 
-    doc_sha1 = oe.sbom.write_doc(d, doc, d.getVar("SSTATE_PKGARCH"), "recipes", indent=get_json_indent(d))
+    doc_sha1 = oe.sbom.write_doc(d, doc, pkg_arch, "recipes", indent=get_json_indent(d))
     dep_recipes.append(oe.sbom.DepRecipe(doc, doc_sha1, recipe))
 
     recipe_ref = oe.spdx.SPDXExternalDocumentRef()
@@ -685,7 +688,7 @@ python do_create_spdx() {
 
             add_package_sources_from_debug(d, package_doc, spdx_package, package, package_files, sources)
 
-            oe.sbom.write_doc(d, package_doc, d.getVar("SSTATE_PKGARCH"), "packages", indent=get_json_indent(d))
+            oe.sbom.write_doc(d, package_doc, pkg_arch, "packages", indent=get_json_indent(d))
 }
 do_create_spdx[vardepsexclude] += "BB_NUMBER_THREADS"
 # NOTE: depending on do_unpack is a hack that is necessary to get it's dependencies for archive the source
@@ -756,6 +759,8 @@ python do_create_runtime_spdx() {
     creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
 
     providers = collect_package_providers(d)
+    pkg_arch = d.getVar("SSTATE_PKGARCH")
+    package_archs = d.getVar("SSTATE_ARCHS").split()
 
     if not is_native:
         bb.build.exec_func("read_subpackage_metadata", d)
@@ -772,7 +777,7 @@ python do_create_runtime_spdx() {
             if not oe.packagedata.packaged(package, localdata):
                 continue
 
-            pkg_spdx_path = oe.sbom.doc_path(deploy_dir_spdx, pkg_name, d.getVar("SSTATE_PKGARCH"), "packages")
+            pkg_spdx_path = oe.sbom.doc_path(deploy_dir_spdx, pkg_name, pkg_arch, "packages")
 
             package_doc, package_doc_sha1 = oe.sbom.read_doc(pkg_spdx_path)
 
@@ -827,7 +832,7 @@ python do_create_runtime_spdx() {
                 if dep in dep_package_cache:
                     (dep_spdx_package, dep_package_ref) = dep_package_cache[dep]
                 else:
-                    dep_path = oe.sbom.doc_path_by_hashfn(deploy_dir_spdx, dep_pkg, dep_hashfn)
+                    dep_path = oe.sbom.doc_path_by_hashfn(deploy_dir_spdx, package_archs, dep_pkg, dep_hashfn)
 
                     spdx_dep_doc, spdx_dep_sha1 = oe.sbom.read_doc(dep_path)
 
@@ -855,10 +860,10 @@ python do_create_runtime_spdx() {
                 )
                 seen_deps.add(dep)
 
-            oe.sbom.write_doc(d, runtime_doc, d.getVar("SSTATE_PKGARCH"), "runtime", spdx_deploy, indent=get_json_indent(d))
+            oe.sbom.write_doc(d, runtime_doc, pkg_arch, "runtime", spdx_deploy, indent=get_json_indent(d))
 }
 
-do_create_runtime_spdx[vardepsexclude] += "OVERRIDES"
+do_create_runtime_spdx[vardepsexclude] += "OVERRIDES SSTATE_ARCHS"
 
 addtask do_create_runtime_spdx after do_create_spdx before do_build do_rm_work
 SSTATETASKS += "do_create_runtime_spdx"
@@ -993,6 +998,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
     import bb.compress.zstd
 
     providers = collect_package_providers(d)
+    package_archs = d.getVar("SSTATE_ARCHS").split()
 
     creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
@@ -1022,7 +1028,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
 
         pkg_name, pkg_hashfn = providers[name]
 
-        pkg_spdx_path = oe.sbom.doc_path_by_hashfn(deploy_dir_spdx, pkg_name, pkg_hashfn)
+        pkg_spdx_path = oe.sbom.doc_path_by_hashfn(deploy_dir_spdx, package_archs, pkg_name, pkg_hashfn)
         pkg_doc, pkg_doc_sha1 = oe.sbom.read_doc(pkg_spdx_path)
 
         for p in pkg_doc.packages:
@@ -1039,7 +1045,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
         else:
             bb.fatal("Unable to find package with name '%s' in SPDX file %s" % (name, pkg_spdx_path))
 
-        runtime_spdx_path = oe.sbom.doc_path_by_hashfn(deploy_dir_spdx, "runtime-" + name, pkg_hashfn)
+        runtime_spdx_path = oe.sbom.doc_path_by_hashfn(deploy_dir_spdx, package_archs, "runtime-" + name, pkg_hashfn)
         runtime_doc, runtime_doc_sha1 = oe.sbom.read_doc(runtime_spdx_path)
 
         runtime_ref = oe.spdx.SPDXExternalDocumentRef()
@@ -1111,7 +1117,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
                     })
 
                 for ref in doc.externalDocumentRefs:
-                    ref_path = oe.sbom.doc_path_by_namespace(deploy_dir_spdx, ref.spdxDocument)
+                    ref_path = oe.sbom.doc_path_by_namespace(deploy_dir_spdx, package_archs, ref.spdxDocument)
                     collect_spdx_document(ref_path)
 
             collect_spdx_document(image_spdx_path)
@@ -1134,4 +1140,4 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
 
             tar.addfile(info, fileobj=index_str)
 
-combine_spdx[vardepsexclude] += "BB_NUMBER_THREADS"
+combine_spdx[vardepsexclude] += "BB_NUMBER_THREADS SSTATE_ARCHS"
diff --git a/meta/lib/oe/sbom.py b/meta/lib/oe/sbom.py
index 1130fa668bd..cddbf3cc51c 100644
--- a/meta/lib/oe/sbom.py
+++ b/meta/lib/oe/sbom.py
@@ -38,12 +38,20 @@ def get_sdk_spdxid(sdk):
     return "SPDXRef-SDK-%s" % sdk
 
 
-def doc_path_by_namespace(spdx_deploy, doc_namespace):
-    return spdx_deploy / "by-namespace" / doc_namespace.replace("/", "_")
+def doc_path_by_namespace(spdx_deploy, archs, doc_namespace):
+    for pkgarch in archs:
+        filename = spdx_deploy / "by-namespace" / pkgarch / doc_namespace.replace("/", "_")
+        if os.path.exists(filename):
+            break
+    return filename
 
 
-def doc_path_by_hashfn(spdx_deploy, doc_name, hashfn):
-    return spdx_deploy / "by-hash" / hashfn.split()[1] / (doc_name + ".spdx.json")
+def doc_path_by_hashfn(spdx_deploy, archs, doc_name, hashfn):
+    for pkgarch in archs:
+        filename = spdx_deploy / "by-hash" / pkgarch / hashfn.split()[1] / (doc_name + ".spdx.json")
+        if os.path.exists(filename):
+            break
+    return filename
 
 
 def doc_path(spdx_deploy, doc_name, arch, subdir):
@@ -61,11 +69,11 @@ def write_doc(d, spdx_doc, arch, subdir, spdx_deploy=None, indent=None):
     with dest.open("wb") as f:
         doc_sha1 = spdx_doc.to_json(f, sort_keys=True, indent=indent)
 
-    l = doc_path_by_namespace(spdx_deploy, spdx_doc.documentNamespace)
+    l = doc_path_by_namespace(spdx_deploy, [arch], spdx_doc.documentNamespace)
     l.parent.mkdir(exist_ok=True, parents=True)
     l.symlink_to(os.path.relpath(dest, l.parent))
 
-    l = doc_path_by_hashfn(spdx_deploy, spdx_doc.name, d.getVar("BB_HASHFILENAME"))
+    l = doc_path_by_hashfn(spdx_deploy, [arch], spdx_doc.name, d.getVar("BB_HASHFILENAME"))
     l.parent.mkdir(exist_ok=True, parents=True)
     l.symlink_to(os.path.relpath(dest, l.parent))
 
-- 
2.39.2


