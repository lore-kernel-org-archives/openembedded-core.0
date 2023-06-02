Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 744CCC7EE2C
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 13:34:58 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.13227.1685712896792220177
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 06:34:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=NllwaFsL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-30789a4c537so1856802f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 06:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685712895; x=1688304895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZElALzCmcRkMWLq2T39r4KxAFcQxJ6GIHmKrm9U6lEQ=;
        b=NllwaFsLU7Zb62H+FPZv3Hyz7tCoA+5MPXdZa7pLrT8ud1U5ClukDlE3Csksg4CBgt
         PLkO6+ALJgD/kxpQ+2IA3PtWJJswgScyQIP19MMX9OMZ1pNf7Pdauln0BjlzBVN5uGCW
         o+C1igCu2eSwQpHocKYg+xGbSpshd8ItYhoIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685712895; x=1688304895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZElALzCmcRkMWLq2T39r4KxAFcQxJ6GIHmKrm9U6lEQ=;
        b=ZRF42EZ4XTeftjWRAl4qOwh6EjKJttcsiZ7JnJwY7/aM2mctfuGQbPJns8xWrQMpR0
         HZhfrDFx0FbAqg+dV2vnc8T4poQUNSkZsbC7W5/y6KAISvS3EfowOrmgK9nx5y7ixtmt
         L2rs9xo55puJx5lj+gucPBXdl9YyNkUbpjMG4QcmMcYgJtoSY76jStW+qaEbqlkRW+Gc
         c1Rn7MD8eFub+D+9F7XNz4tMl2ug77IcDbEOfka+RTnXzJa9p9m9CUqr37Tr1BpDNArd
         a3/gnzEsONLmiNG9vKrivQ8ph5z+lKxC9jyW1fX6MNBkM5/AStvryq0WgHwotzeTzvWA
         cgeg==
X-Gm-Message-State: AC+VfDyV6nG2XSYV+vJpQJN+WG2zPRl5bW29igU7qPZVD39bQaKWg84M
	45ICfmO8Cqm5M1IZxAMopuXbYnIxOkpL38vyilQ=
X-Google-Smtp-Source: ACHHUZ4hT7UU6QLX7cRaHEo++YbflzBwmp3Pu6Syo7PvshA6XI3zXDvGBuYa4FXrOytjO6wbWuKEKw==
X-Received: by 2002:a5d:61ce:0:b0:306:3b39:9a2a with SMTP id q14-20020a5d61ce000000b003063b399a2amr3899897wrv.42.1685712894909;
        Fri, 02 Jun 2023 06:34:54 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:527f:ecab:4831:c523])
        by smtp.gmail.com with ESMTPSA id z10-20020a056000110a00b003063a92bbf5sm1734262wrw.70.2023.06.02.06.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 06:34:54 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [PATCH 01/11] classes/create-spdx-2.2: Use hashfn from BB_TASKDEPDATA instead of MACHINE
Date: Fri,  2 Jun 2023 14:34:43 +0100
Message-Id: <20230602133453.229023-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 13:34:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182319

From: Joshua Watt <JPEWhacker@gmail.com>

Enabling the SPDX class and running two builds, one with SDKMACHINE=i686
and then again with SDKMACHINE=x86_64 would lead to errors since the output
was stored per MACHINE and the overlapping files would cause manifest errors.

The hashfn data from bitbake has SSTATE_PKGARCH encoded into it which is how
sstate separates out it's targets and SDPX should be using the same structure.
Therefore switch to using this.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/create-spdx-2.2.bbclass | 61 +++++++++++++++++-----------
 meta/lib/oe/sbom.py                  | 22 ++++++++--
 2 files changed, 57 insertions(+), 26 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index e0f62a43a2d..6ec0c1465e7 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
-DEPLOY_DIR_SPDX ??= "${DEPLOY_DIR}/spdx/${MACHINE}"
+DEPLOY_DIR_SPDX ??= "${DEPLOY_DIR}/spdx"
 
 # The product name that the CVE database uses.  Defaults to BPN, but may need to
 # be overriden per recipe (for example tiff.bb sets CVE_PRODUCT=libtiff).
@@ -337,6 +337,20 @@ def add_package_sources_from_debug(d, package_doc, spdx_package, package, packag
 
             package_doc.add_relationship(pkg_file, "GENERATED_FROM", ref_id, comment=debugsrc)
 
+def collect_deps(d):
+    current_task = "do_" + d.getVar("BB_CURRENTTASK")
+
+    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
+    deps = sorted(set(
+        (dep[0], dep[7]) for dep in taskdepdata.values() if
+            dep[1] == current_task and dep[0] != d.getVar("PN")
+    ))
+
+    return deps
+
+collect_deps[vardepsexclude] += "BB_TASKDEPDATA"
+collect_deps[vardeps] += "DEPENDS"
+
 def collect_dep_recipes(d, doc, spdx_recipe):
     from pathlib import Path
     import oe.sbom
@@ -345,13 +359,9 @@ def collect_dep_recipes(d, doc, spdx_recipe):
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
 
     dep_recipes = []
-    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
-    deps = sorted(set(
-        dep[0] for dep in taskdepdata.values() if
-            dep[1] == "do_create_spdx" and dep[0] != d.getVar("PN")
-    ))
-    for dep_pn in deps:
-        dep_recipe_path = deploy_dir_spdx / "recipes" / ("recipe-%s.spdx.json" % dep_pn)
+
+    for dep_pn, dep_hashfn in collect_deps(d):
+        dep_recipe_path = oe.sbom.doc_path_by_hashfn(deploy_dir_spdx, "recipe-" + dep_pn, dep_hashfn)
 
         spdx_dep_doc, spdx_dep_sha1 = oe.sbom.read_doc(dep_recipe_path)
 
@@ -380,8 +390,6 @@ def collect_dep_recipes(d, doc, spdx_recipe):
 
     return dep_recipes
 
-collect_dep_recipes[vardepsexclude] += "BB_TASKDEPDATA"
-collect_dep_recipes[vardeps] += "DEPENDS"
 
 def collect_dep_sources(d, dep_recipes):
     import oe.sbom
@@ -571,7 +579,7 @@ python do_create_spdx() {
 
     dep_recipes = collect_dep_recipes(d, doc, recipe)
 
-    doc_sha1 = oe.sbom.write_doc(d, doc, "recipes", indent=get_json_indent(d))
+    doc_sha1 = oe.sbom.write_doc(d, doc, d.getVar("SSTATE_PKGARCH"), "recipes", indent=get_json_indent(d))
     dep_recipes.append(oe.sbom.DepRecipe(doc, doc_sha1, recipe))
 
     recipe_ref = oe.spdx.SPDXExternalDocumentRef()
@@ -636,7 +644,7 @@ python do_create_spdx() {
 
             add_package_sources_from_debug(d, package_doc, spdx_package, package, package_files, sources)
 
-            oe.sbom.write_doc(d, package_doc, "packages", indent=get_json_indent(d))
+            oe.sbom.write_doc(d, package_doc, d.getVar("SSTATE_PKGARCH"), "packages", indent=get_json_indent(d))
 }
 # NOTE: depending on do_unpack is a hack that is necessary to get it's dependencies for archive the source
 addtask do_create_spdx after do_package do_packagedata do_unpack before do_populate_sdk do_build do_rm_work
@@ -667,11 +675,11 @@ def collect_package_providers(d):
 
     taskdepdata = d.getVar("BB_TASKDEPDATA", False)
     deps = sorted(set(
-        dep[0] for dep in taskdepdata.values() if dep[0] != d.getVar("PN")
+        (dep[0], dep[7]) for dep in taskdepdata.values() if dep[0] != d.getVar("PN")
     ))
-    deps.append(d.getVar("PN"))
+    deps.append((d.getVar("PN"), d.getVar("BB_HASHFILENAME")))
 
-    for dep_pn in deps:
+    for dep_pn, dep_hashfn in deps:
         recipe_data = oe.packagedata.read_pkgdata(dep_pn, d)
 
         for pkg in recipe_data.get("PACKAGES", "").split():
@@ -681,7 +689,7 @@ def collect_package_providers(d):
             rprovides.add(pkg)
 
             for r in rprovides:
-                providers[r] = pkg
+                providers[r] = (pkg, dep_hashfn)
 
     return providers
 
@@ -717,7 +725,7 @@ python do_create_runtime_spdx() {
             if not oe.packagedata.packaged(package, localdata):
                 continue
 
-            pkg_spdx_path = deploy_dir_spdx / "packages" / (pkg_name + ".spdx.json")
+            pkg_spdx_path = oe.sbom.doc_path(deploy_dir_spdx, pkg_name, d.getVar("SSTATE_PKGARCH"), "packages")
 
             package_doc, package_doc_sha1 = oe.sbom.read_doc(pkg_spdx_path)
 
@@ -761,7 +769,7 @@ python do_create_runtime_spdx() {
                 if dep not in providers:
                     continue
 
-                dep = providers[dep]
+                (dep, dep_hashfn) = providers[dep]
 
                 if not oe.packagedata.packaged(dep, localdata):
                     continue
@@ -772,7 +780,7 @@ python do_create_runtime_spdx() {
                 if dep in dep_package_cache:
                     (dep_spdx_package, dep_package_ref) = dep_package_cache[dep]
                 else:
-                    dep_path = deploy_dir_spdx / "packages" / ("%s.spdx.json" % dep_pkg)
+                    dep_path = oe.sbom.doc_path_by_hashfn(deploy_dir_spdx, dep_pkg, dep_hashfn)
 
                     spdx_dep_doc, spdx_dep_sha1 = oe.sbom.read_doc(dep_path)
 
@@ -800,7 +808,7 @@ python do_create_runtime_spdx() {
                 )
                 seen_deps.add(dep)
 
-            oe.sbom.write_doc(d, runtime_doc, "runtime", spdx_deploy, indent=get_json_indent(d))
+            oe.sbom.write_doc(d, runtime_doc, d.getVar("SSTATE_PKGARCH"), "runtime", spdx_deploy, indent=get_json_indent(d))
 }
 
 addtask do_create_runtime_spdx after do_create_spdx before do_build do_rm_work
@@ -933,6 +941,8 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
     import tarfile
     import bb.compress.zstd
 
+    providers = collect_package_providers(d)
+
     creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
     source_date_epoch = d.getVar("SOURCE_DATE_EPOCH")
@@ -956,7 +966,12 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
     doc.packages.append(image)
 
     for name in sorted(packages.keys()):
-        pkg_spdx_path = deploy_dir_spdx / "packages" / (name + ".spdx.json")
+        if name not in providers:
+            bb.fatal("Unable to find provider for '%s'" % name)
+
+        pkg_name, pkg_hashfn = providers[name]
+
+        pkg_spdx_path = oe.sbom.doc_path_by_hashfn(deploy_dir_spdx, pkg_name, pkg_hashfn)
         pkg_doc, pkg_doc_sha1 = oe.sbom.read_doc(pkg_spdx_path)
 
         for p in pkg_doc.packages:
@@ -973,7 +988,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
         else:
             bb.fatal("Unable to find package with name '%s' in SPDX file %s" % (name, pkg_spdx_path))
 
-        runtime_spdx_path = deploy_dir_spdx / "runtime" / ("runtime-" + name + ".spdx.json")
+        runtime_spdx_path = oe.sbom.doc_path_by_hashfn(deploy_dir_spdx, "runtime-" + name, pkg_hashfn)
         runtime_doc, runtime_doc_sha1 = oe.sbom.read_doc(runtime_spdx_path)
 
         runtime_ref = oe.spdx.SPDXExternalDocumentRef()
@@ -1045,7 +1060,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
                     })
 
                 for ref in doc.externalDocumentRefs:
-                    ref_path = deploy_dir_spdx / "by-namespace" / ref.spdxDocument.replace("/", "_")
+                    ref_path = oe.sbom.doc_path_by_namespace(deploy_dir_spdx, ref.spdxDocument)
                     collect_spdx_document(ref_path)
 
             collect_spdx_document(image_spdx_path)
diff --git a/meta/lib/oe/sbom.py b/meta/lib/oe/sbom.py
index 22ed5070ea0..1130fa668bd 100644
--- a/meta/lib/oe/sbom.py
+++ b/meta/lib/oe/sbom.py
@@ -38,18 +38,34 @@ def get_sdk_spdxid(sdk):
     return "SPDXRef-SDK-%s" % sdk
 
 
-def write_doc(d, spdx_doc, subdir, spdx_deploy=None, indent=None):
+def doc_path_by_namespace(spdx_deploy, doc_namespace):
+    return spdx_deploy / "by-namespace" / doc_namespace.replace("/", "_")
+
+
+def doc_path_by_hashfn(spdx_deploy, doc_name, hashfn):
+    return spdx_deploy / "by-hash" / hashfn.split()[1] / (doc_name + ".spdx.json")
+
+
+def doc_path(spdx_deploy, doc_name, arch, subdir):
+    return spdx_deploy / arch/ subdir / (doc_name + ".spdx.json")
+
+
+def write_doc(d, spdx_doc, arch, subdir, spdx_deploy=None, indent=None):
     from pathlib import Path
 
     if spdx_deploy is None:
         spdx_deploy = Path(d.getVar("SPDXDEPLOY"))
 
-    dest = spdx_deploy / subdir / (spdx_doc.name + ".spdx.json")
+    dest = doc_path(spdx_deploy, spdx_doc.name, arch, subdir)
     dest.parent.mkdir(exist_ok=True, parents=True)
     with dest.open("wb") as f:
         doc_sha1 = spdx_doc.to_json(f, sort_keys=True, indent=indent)
 
-    l = spdx_deploy / "by-namespace" / spdx_doc.documentNamespace.replace("/", "_")
+    l = doc_path_by_namespace(spdx_deploy, spdx_doc.documentNamespace)
+    l.parent.mkdir(exist_ok=True, parents=True)
+    l.symlink_to(os.path.relpath(dest, l.parent))
+
+    l = doc_path_by_hashfn(spdx_deploy, spdx_doc.name, d.getVar("BB_HASHFILENAME"))
     l.parent.mkdir(exist_ok=True, parents=True)
     l.symlink_to(os.path.relpath(dest, l.parent))
 
-- 
2.39.2


