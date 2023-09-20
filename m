Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 809C8CE79C3
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 10:58:07 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.35159.1695207485702094593
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 03:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AifguHyH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-31dd10c2b8bso6299154f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 03:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695207484; x=1695812284; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B3lpTK2br2JyGSjk4tnVougSWsXWsPbToRJySQ7zOQQ=;
        b=AifguHyHUjVI3r8WHr5e4Hwn0trlyQFRWZ0vDb4FIKnCiA+pejqTpYFtvoUJSJTaLd
         aWDy7nmKSERCyLmkMgkLBHid+Y4AFYLkRavb0IHDmpbEW0dc2Ymr15pf8SpMdKbjQ+4m
         4vXAux3Q1g/P9VKDchhEfUazOoycc3CB+hZv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695207484; x=1695812284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B3lpTK2br2JyGSjk4tnVougSWsXWsPbToRJySQ7zOQQ=;
        b=ImuI8Ecpp6O6BYqnQK7ZVMto4ZbrySo5hmZwIBW1j4mnS0jZrV5wHsb8Ee4acNMyU0
         C6GOCOWISkCS/kKdM0ceMHJ3ZusKho9W26XzQGVsQcBdQSruyWIo3LwAzSShRKWpkEZk
         RyYkpTbkznnW5LS3kbEqzdyeQXT+AH7RONyBw8adxoWFk2f2enqzgVvUfNYnrc2vfqQr
         rmPpzwlO6J/Y8YqE9DBCaz8MC5zHY/NxKbxhtNSjGtDC1KKMG2negNyn8hSNXt06A1o4
         koX1iI2Jznbo2cIrSLGxGExJm0PGFZ+0d1M2ZBD/FlW8IVi8cdfkDdzigr2EugQOKTL4
         Ek6w==
X-Gm-Message-State: AOJu0YwFjBOTn+QUZ1uP19VfHR8KF9DnItIHb7vbQiTg5OhiBzzt6vTv
	Nz2SA3feDDok3RHDBxLOkIpHeZItLGqm9idg4EM=
X-Google-Smtp-Source: AGHT+IHArPECI/+tlug9y/+TgeOuYg9izR4eYEhH7i3S4Z96s1TB8Ei+hFmllBdXInYXKkXx8LDwvA==
X-Received: by 2002:adf:e712:0:b0:31a:d551:c2c0 with SMTP id c18-20020adfe712000000b0031ad551c2c0mr2105136wrm.57.1695207483873;
        Wed, 20 Sep 2023 03:58:03 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:34a6:a1c2:97a:851d])
        by smtp.gmail.com with ESMTPSA id h1-20020adfe981000000b0031f300a4c26sm426636wrm.93.2023.09.20.03.58.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 03:58:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6 v2] create-spdx/sbom: Ensure files don't overlap between machines
Date: Wed, 20 Sep 2023 11:57:58 +0100
Message-Id: <20230920105802.1008778-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230920105802.1008778-1-richard.purdie@linuxfoundation.org>
References: <20230920105802.1008778-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 10:58:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187918

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
 meta/classes/create-spdx-2.2.bbclass | 31 ++++++++++++++++++----------
 meta/lib/oe/sbom.py                  | 20 ++++++++++++------
 2 files changed, 34 insertions(+), 17 deletions(-)

v2 - Use reversed order of SSTATE_ARCHS

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 9b28d124c78..39110823c0c 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -349,6 +349,8 @@ def collect_dep_recipes(d, doc, spdx_recipe):
 
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
     spdx_deps_file = Path(d.getVar("SPDXDEPS"))
+    package_archs = d.getVar("SSTATE_ARCHS").split()
+    package_archs.reverse()
 
     dep_recipes = []
 
@@ -356,7 +358,7 @@ def collect_dep_recipes(d, doc, spdx_recipe):
         deps = json.load(f)
 
     for dep_pn, dep_hashfn in deps:
-        dep_recipe_path = oe.sbom.doc_path_by_hashfn(deploy_dir_spdx, "recipe-" + dep_pn, dep_hashfn)
+        dep_recipe_path = oe.sbom.doc_path_by_hashfn(deploy_dir_spdx, package_archs, "recipe-" + dep_pn, dep_hashfn)
 
         spdx_dep_doc, spdx_dep_sha1 = oe.sbom.read_doc(dep_recipe_path)
 
@@ -385,6 +387,7 @@ def collect_dep_recipes(d, doc, spdx_recipe):
 
     return dep_recipes
 
+collect_dep_recipes[vardepsexclude] = "SSTATE_ARCHS"
 
 def collect_dep_sources(d, dep_recipes):
     import oe.sbom
@@ -533,6 +536,7 @@ python do_create_spdx() {
     include_sources = d.getVar("SPDX_INCLUDE_SOURCES") == "1"
     archive_sources = d.getVar("SPDX_ARCHIVE_SOURCES") == "1"
     archive_packaged = d.getVar("SPDX_ARCHIVE_PACKAGED") == "1"
+    pkg_arch = d.getVar("SSTATE_PKGARCH")
 
     creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
 
@@ -620,7 +624,7 @@ python do_create_spdx() {
 
     dep_recipes = collect_dep_recipes(d, doc, recipe)
 
-    doc_sha1 = oe.sbom.write_doc(d, doc, d.getVar("SSTATE_PKGARCH"), "recipes", indent=get_json_indent(d))
+    doc_sha1 = oe.sbom.write_doc(d, doc, pkg_arch, "recipes", indent=get_json_indent(d))
     dep_recipes.append(oe.sbom.DepRecipe(doc, doc_sha1, recipe))
 
     recipe_ref = oe.spdx.SPDXExternalDocumentRef()
@@ -685,7 +689,7 @@ python do_create_spdx() {
 
             add_package_sources_from_debug(d, package_doc, spdx_package, package, package_files, sources)
 
-            oe.sbom.write_doc(d, package_doc, d.getVar("SSTATE_PKGARCH"), "packages", indent=get_json_indent(d))
+            oe.sbom.write_doc(d, package_doc, pkg_arch, "packages", indent=get_json_indent(d))
 }
 do_create_spdx[vardepsexclude] += "BB_NUMBER_THREADS"
 # NOTE: depending on do_unpack is a hack that is necessary to get it's dependencies for archive the source
@@ -756,6 +760,9 @@ python do_create_runtime_spdx() {
     creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
 
     providers = collect_package_providers(d)
+    pkg_arch = d.getVar("SSTATE_PKGARCH")
+    package_archs = d.getVar("SSTATE_ARCHS").split()
+    package_archs.reverse()
 
     if not is_native:
         bb.build.exec_func("read_subpackage_metadata", d)
@@ -772,7 +779,7 @@ python do_create_runtime_spdx() {
             if not oe.packagedata.packaged(package, localdata):
                 continue
 
-            pkg_spdx_path = oe.sbom.doc_path(deploy_dir_spdx, pkg_name, d.getVar("SSTATE_PKGARCH"), "packages")
+            pkg_spdx_path = oe.sbom.doc_path(deploy_dir_spdx, pkg_name, pkg_arch, "packages")
 
             package_doc, package_doc_sha1 = oe.sbom.read_doc(pkg_spdx_path)
 
@@ -827,7 +834,7 @@ python do_create_runtime_spdx() {
                 if dep in dep_package_cache:
                     (dep_spdx_package, dep_package_ref) = dep_package_cache[dep]
                 else:
-                    dep_path = oe.sbom.doc_path_by_hashfn(deploy_dir_spdx, dep_pkg, dep_hashfn)
+                    dep_path = oe.sbom.doc_path_by_hashfn(deploy_dir_spdx, package_archs, dep_pkg, dep_hashfn)
 
                     spdx_dep_doc, spdx_dep_sha1 = oe.sbom.read_doc(dep_path)
 
@@ -855,10 +862,10 @@ python do_create_runtime_spdx() {
                 )
                 seen_deps.add(dep)
 
-            oe.sbom.write_doc(d, runtime_doc, d.getVar("SSTATE_PKGARCH"), "runtime", spdx_deploy, indent=get_json_indent(d))
+            oe.sbom.write_doc(d, runtime_doc, pkg_arch, "runtime", spdx_deploy, indent=get_json_indent(d))
 }
 
-do_create_runtime_spdx[vardepsexclude] += "OVERRIDES"
+do_create_runtime_spdx[vardepsexclude] += "OVERRIDES SSTATE_ARCHS"
 
 addtask do_create_runtime_spdx after do_create_spdx before do_build do_rm_work
 SSTATETASKS += "do_create_runtime_spdx"
@@ -993,6 +1000,8 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
     import bb.compress.zstd
 
     providers = collect_package_providers(d)
+    package_archs = d.getVar("SSTATE_ARCHS").split()
+    package_archs.reverse()
 
     creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
@@ -1022,7 +1031,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
 
         pkg_name, pkg_hashfn = providers[name]
 
-        pkg_spdx_path = oe.sbom.doc_path_by_hashfn(deploy_dir_spdx, pkg_name, pkg_hashfn)
+        pkg_spdx_path = oe.sbom.doc_path_by_hashfn(deploy_dir_spdx, package_archs, pkg_name, pkg_hashfn)
         pkg_doc, pkg_doc_sha1 = oe.sbom.read_doc(pkg_spdx_path)
 
         for p in pkg_doc.packages:
@@ -1039,7 +1048,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
         else:
             bb.fatal("Unable to find package with name '%s' in SPDX file %s" % (name, pkg_spdx_path))
 
-        runtime_spdx_path = oe.sbom.doc_path_by_hashfn(deploy_dir_spdx, "runtime-" + name, pkg_hashfn)
+        runtime_spdx_path = oe.sbom.doc_path_by_hashfn(deploy_dir_spdx, package_archs, "runtime-" + name, pkg_hashfn)
         runtime_doc, runtime_doc_sha1 = oe.sbom.read_doc(runtime_spdx_path)
 
         runtime_ref = oe.spdx.SPDXExternalDocumentRef()
@@ -1111,7 +1120,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
                     })
 
                 for ref in doc.externalDocumentRefs:
-                    ref_path = oe.sbom.doc_path_by_namespace(deploy_dir_spdx, ref.spdxDocument)
+                    ref_path = oe.sbom.doc_path_by_namespace(deploy_dir_spdx, package_archs, ref.spdxDocument)
                     collect_spdx_document(ref_path)
 
             collect_spdx_document(image_spdx_path)
@@ -1134,4 +1143,4 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
 
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


