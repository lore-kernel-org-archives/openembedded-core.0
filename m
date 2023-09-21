Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD432E71088
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 15:09:13 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web11.20450.1695308950568091991
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 08:09:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X8MsQm8l;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6c454a5f3c7so645053a34.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 08:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695308949; x=1695913749; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qzFseZSF0p+vuN8LWoJcxuGbE4s5dHC16B5rQ5+Y+Yc=;
        b=X8MsQm8lrPba6D1IicKMbv93wYGk8S744NMeVQVwlFloUHV/1XMsDoy6Ia/c7WdZ0+
         wS9Getpr9IgI0XLZMCeIwpNl1WjuiH61Z/im5nLCCPbCmA9PmKJe39wepW/TM1zQl77K
         hKQYQvjFtjZ+2bLKIDVh03Qa05jhZNP+zopzOUyc8FLTG42J0EpfKKjA+ZK3/2wnF1vh
         7QAlZmmA+IxgmkLscf4epEl+qlJeaqhMW18FEoH51UPOE/s8yeuU1yO84BiNchj3R+ID
         F/2zzdyW6cHr45dAVkFcsINYCpzX47IqumhWvqi91y4OhzQ3jQ5idNlIgRKAYUls2Rgs
         V5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695308949; x=1695913749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qzFseZSF0p+vuN8LWoJcxuGbE4s5dHC16B5rQ5+Y+Yc=;
        b=TyFJU8WnJC+P+MxRwmlpAY1sdA05lp+5hAe2pBqHutA9J4F0c8XPuOE0vNpdpCWx9r
         8DZcap/Q7nHn9oyDqz6cZS8qmxvrFRjjuZ2D3/xxlJGh/A+O/4mylGYpjiax9w2l1DOo
         gPiAIY456PD12CIAznsf8UChGxjIgjJYx1jJItjxjpbBQBESHFmVIbDP8cAiFz2zcKE/
         Q0Oj9o23P/WjOVIn3ITXXuesXZOckuOwaf8eh1r/FzsGMwZnVxi0WvEzZPaTKCHllYi/
         xOQHKO8KuRVxxH6iZokD+2n3rt8EdZVnV15tIUYIeOYOBolt/EzhJSPbFB40glHONvc5
         S/BQ==
X-Gm-Message-State: AOJu0YyDOMFrmPjaHQrczsBlndg3CexYT2BfOlwrclAlv211wHxAQ+U8
	LeWm5bmx5nwG/lS/q5yGKMZt8m4m8wI=
X-Google-Smtp-Source: AGHT+IHqYpmXdu21gDt2BzJ6MZubHV+mF3OS0GfXXMG8GR1b0F99RBSn2Dintxdo7JNW0vp9/aX1KA==
X-Received: by 2002:a05:6830:4cf:b0:6be:fdab:dc65 with SMTP id s15-20020a05683004cf00b006befdabdc65mr5841337otd.19.1695308948702;
        Thu, 21 Sep 2023 08:09:08 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::f27c])
        by smtp.gmail.com with ESMTPSA id 62-20020a4a0641000000b00573a3e283e1sm486137ooj.39.2023.09.21.08.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 08:09:07 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] create-spdx/sbom: Ensure files don't overlap between machines
Date: Thu, 21 Sep 2023 09:04:20 -0600
Message-Id: <20230921150420.1317625-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 15:09:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188013

From: Richard Purdie <richard.purdie@linuxfoundation.org>

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
Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-2.2.bbclass | 41 ++++++++++++++++++++--------
 meta/lib/oe/sbom.py                  | 34 ++++++++++++++++++-----
 2 files changed, 57 insertions(+), 18 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 9b28d124c78..a2b96da61a9 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -349,6 +349,8 @@ def collect_dep_recipes(d, doc, spdx_recipe):
 
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
     spdx_deps_file = Path(d.getVar("SPDXDEPS"))
+    package_archs = d.getVar("SSTATE_ARCHS").split()
+    package_archs.reverse()
 
     dep_recipes = []
 
@@ -356,7 +358,9 @@ def collect_dep_recipes(d, doc, spdx_recipe):
         deps = json.load(f)
 
     for dep_pn, dep_hashfn in deps:
-        dep_recipe_path = oe.sbom.doc_path_by_hashfn(deploy_dir_spdx, "recipe-" + dep_pn, dep_hashfn)
+        dep_recipe_path = oe.sbom.doc_find_by_hashfn(deploy_dir_spdx, package_archs, "recipe-" + dep_pn, dep_hashfn)
+        if not dep_recipe_path:
+            bb.fatal("Cannot find any SPDX file for recipe %s, %s" % (dep_pn, dep_hashfn))
 
         spdx_dep_doc, spdx_dep_sha1 = oe.sbom.read_doc(dep_recipe_path)
 
@@ -385,6 +389,7 @@ def collect_dep_recipes(d, doc, spdx_recipe):
 
     return dep_recipes
 
+collect_dep_recipes[vardepsexclude] = "SSTATE_ARCHS"
 
 def collect_dep_sources(d, dep_recipes):
     import oe.sbom
@@ -533,6 +538,7 @@ python do_create_spdx() {
     include_sources = d.getVar("SPDX_INCLUDE_SOURCES") == "1"
     archive_sources = d.getVar("SPDX_ARCHIVE_SOURCES") == "1"
     archive_packaged = d.getVar("SPDX_ARCHIVE_PACKAGED") == "1"
+    pkg_arch = d.getVar("SSTATE_PKGARCH")
 
     creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
 
@@ -620,7 +626,7 @@ python do_create_spdx() {
 
     dep_recipes = collect_dep_recipes(d, doc, recipe)
 
-    doc_sha1 = oe.sbom.write_doc(d, doc, d.getVar("SSTATE_PKGARCH"), "recipes", indent=get_json_indent(d))
+    doc_sha1 = oe.sbom.write_doc(d, doc, pkg_arch, "recipes", indent=get_json_indent(d))
     dep_recipes.append(oe.sbom.DepRecipe(doc, doc_sha1, recipe))
 
     recipe_ref = oe.spdx.SPDXExternalDocumentRef()
@@ -685,7 +691,7 @@ python do_create_spdx() {
 
             add_package_sources_from_debug(d, package_doc, spdx_package, package, package_files, sources)
 
-            oe.sbom.write_doc(d, package_doc, d.getVar("SSTATE_PKGARCH"), "packages", indent=get_json_indent(d))
+            oe.sbom.write_doc(d, package_doc, pkg_arch, "packages", indent=get_json_indent(d))
 }
 do_create_spdx[vardepsexclude] += "BB_NUMBER_THREADS"
 # NOTE: depending on do_unpack is a hack that is necessary to get it's dependencies for archive the source
@@ -756,6 +762,9 @@ python do_create_runtime_spdx() {
     creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
 
     providers = collect_package_providers(d)
+    pkg_arch = d.getVar("SSTATE_PKGARCH")
+    package_archs = d.getVar("SSTATE_ARCHS").split()
+    package_archs.reverse()
 
     if not is_native:
         bb.build.exec_func("read_subpackage_metadata", d)
@@ -772,7 +781,7 @@ python do_create_runtime_spdx() {
             if not oe.packagedata.packaged(package, localdata):
                 continue
 
-            pkg_spdx_path = oe.sbom.doc_path(deploy_dir_spdx, pkg_name, d.getVar("SSTATE_PKGARCH"), "packages")
+            pkg_spdx_path = oe.sbom.doc_path(deploy_dir_spdx, pkg_name, pkg_arch, "packages")
 
             package_doc, package_doc_sha1 = oe.sbom.read_doc(pkg_spdx_path)
 
@@ -827,7 +836,9 @@ python do_create_runtime_spdx() {
                 if dep in dep_package_cache:
                     (dep_spdx_package, dep_package_ref) = dep_package_cache[dep]
                 else:
-                    dep_path = oe.sbom.doc_path_by_hashfn(deploy_dir_spdx, dep_pkg, dep_hashfn)
+                    dep_path = oe.sbom.doc_find_by_hashfn(deploy_dir_spdx, package_archs, dep_pkg, dep_hashfn)
+                    if not dep_path:
+                        bb.fatal("No SPDX file found for package %s, %s" % (dep_pkg, dep_hashfn))
 
                     spdx_dep_doc, spdx_dep_sha1 = oe.sbom.read_doc(dep_path)
 
@@ -855,10 +866,10 @@ python do_create_runtime_spdx() {
                 )
                 seen_deps.add(dep)
 
-            oe.sbom.write_doc(d, runtime_doc, d.getVar("SSTATE_PKGARCH"), "runtime", spdx_deploy, indent=get_json_indent(d))
+            oe.sbom.write_doc(d, runtime_doc, pkg_arch, "runtime", spdx_deploy, indent=get_json_indent(d))
 }
 
-do_create_runtime_spdx[vardepsexclude] += "OVERRIDES"
+do_create_runtime_spdx[vardepsexclude] += "OVERRIDES SSTATE_ARCHS"
 
 addtask do_create_runtime_spdx after do_create_spdx before do_build do_rm_work
 SSTATETASKS += "do_create_runtime_spdx"
@@ -993,6 +1004,8 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
     import bb.compress.zstd
 
     providers = collect_package_providers(d)
+    package_archs = d.getVar("SSTATE_ARCHS").split()
+    package_archs.reverse()
 
     creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
@@ -1022,7 +1035,10 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
 
         pkg_name, pkg_hashfn = providers[name]
 
-        pkg_spdx_path = oe.sbom.doc_path_by_hashfn(deploy_dir_spdx, pkg_name, pkg_hashfn)
+        pkg_spdx_path = oe.sbom.doc_find_by_hashfn(deploy_dir_spdx, package_archs, pkg_name, pkg_hashfn)
+        if not pkg_spdx_path:
+            bb.fatal("No SPDX file found for package %s, %s" % (pkg_name, pkg_hashfn))
+
         pkg_doc, pkg_doc_sha1 = oe.sbom.read_doc(pkg_spdx_path)
 
         for p in pkg_doc.packages:
@@ -1039,7 +1055,10 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
         else:
             bb.fatal("Unable to find package with name '%s' in SPDX file %s" % (name, pkg_spdx_path))
 
-        runtime_spdx_path = oe.sbom.doc_path_by_hashfn(deploy_dir_spdx, "runtime-" + name, pkg_hashfn)
+        runtime_spdx_path = oe.sbom.doc_find_by_hashfn(deploy_dir_spdx, package_archs, "runtime-" + name, pkg_hashfn)
+        if not runtime_spdx_path:
+            bb.fatal("No runtime SPDX document found for %s, %s" % (name, pkg_hashfn))
+
         runtime_doc, runtime_doc_sha1 = oe.sbom.read_doc(runtime_spdx_path)
 
         runtime_ref = oe.spdx.SPDXExternalDocumentRef()
@@ -1111,7 +1130,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
                     })
 
                 for ref in doc.externalDocumentRefs:
-                    ref_path = oe.sbom.doc_path_by_namespace(deploy_dir_spdx, ref.spdxDocument)
+                    ref_path = oe.sbom.doc_find_by_namespace(deploy_dir_spdx, package_archs, ref.spdxDocument)
                     collect_spdx_document(ref_path)
 
             collect_spdx_document(image_spdx_path)
@@ -1134,4 +1153,4 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
 
             tar.addfile(info, fileobj=index_str)
 
-combine_spdx[vardepsexclude] += "BB_NUMBER_THREADS"
+combine_spdx[vardepsexclude] += "BB_NUMBER_THREADS SSTATE_ARCHS"
diff --git a/meta/lib/oe/sbom.py b/meta/lib/oe/sbom.py
index 1130fa668bd..fd4b6895d8f 100644
--- a/meta/lib/oe/sbom.py
+++ b/meta/lib/oe/sbom.py
@@ -38,16 +38,34 @@ def get_sdk_spdxid(sdk):
     return "SPDXRef-SDK-%s" % sdk
 
 
-def doc_path_by_namespace(spdx_deploy, doc_namespace):
-    return spdx_deploy / "by-namespace" / doc_namespace.replace("/", "_")
+def _doc_path_by_namespace(spdx_deploy, arch, doc_namespace):
+    return spdx_deploy / "by-namespace" / arch / doc_namespace.replace("/", "_")
 
 
-def doc_path_by_hashfn(spdx_deploy, doc_name, hashfn):
-    return spdx_deploy / "by-hash" / hashfn.split()[1] / (doc_name + ".spdx.json")
+def doc_find_by_namespace(spdx_deploy, search_arches, doc_namespace):
+    for pkgarch in search_arches:
+        p = _doc_path_by_namespace(spdx_deploy, pkgarch, doc_namespace)
+        if os.path.exists(p):
+            return p
+    return None
+
+
+def _doc_path_by_hashfn(spdx_deploy, arch, doc_name, hashfn):
+    return (
+        spdx_deploy / "by-hash" / arch / hashfn.split()[1] / (doc_name + ".spdx.json")
+    )
+
+
+def doc_find_by_hashfn(spdx_deploy, search_arches, doc_name, hashfn):
+    for pkgarch in search_arches:
+        p = _doc_path_by_hashfn(spdx_deploy, pkgarch, doc_name, hashfn)
+        if os.path.exists(p):
+            return p
+    return None
 
 
 def doc_path(spdx_deploy, doc_name, arch, subdir):
-    return spdx_deploy / arch/ subdir / (doc_name + ".spdx.json")
+    return spdx_deploy / arch / subdir / (doc_name + ".spdx.json")
 
 
 def write_doc(d, spdx_doc, arch, subdir, spdx_deploy=None, indent=None):
@@ -61,11 +79,13 @@ def write_doc(d, spdx_doc, arch, subdir, spdx_deploy=None, indent=None):
     with dest.open("wb") as f:
         doc_sha1 = spdx_doc.to_json(f, sort_keys=True, indent=indent)
 
-    l = doc_path_by_namespace(spdx_deploy, spdx_doc.documentNamespace)
+    l = _doc_path_by_namespace(spdx_deploy, arch, spdx_doc.documentNamespace)
     l.parent.mkdir(exist_ok=True, parents=True)
     l.symlink_to(os.path.relpath(dest, l.parent))
 
-    l = doc_path_by_hashfn(spdx_deploy, spdx_doc.name, d.getVar("BB_HASHFILENAME"))
+    l = _doc_path_by_hashfn(
+        spdx_deploy, arch, spdx_doc.name, d.getVar("BB_HASHFILENAME")
+    )
     l.parent.mkdir(exist_ok=True, parents=True)
     l.symlink_to(os.path.relpath(dest, l.parent))
 
-- 
2.34.1


