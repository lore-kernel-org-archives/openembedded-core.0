Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web09.8184.1630503924960812791
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 06:45:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NIvo9OwI;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id w19so3735941oik.10
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 06:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AlTQl2+KNK/cEfzvbcLRc/HVQRayGgYR34/tQ4m1lOQ=;
        b=NIvo9OwIIx8WOrRrTK9qBWWPedFiBLLjkRvN2Up23My4h3HBOUmvuwYMcgURjEsgzT
         kwZL64q3dRiaJIkZEN3sQy/EFGqwR5eLcqmdV6Am8wOpGMGsV8T05clpHuLn1xzywQ/S
         aUrukmwXRMra72xxsdYH5va+ggJGe/Z7rUHCfj5EG9I4QnqHp6zeeVnNf+6qPlzkPOUj
         u14S1xwUFvwEOaqWaOKSxHuXiJuOPzEqEWaOSYMrThdjWKMs/DESXQh6yZQe4hb/cTRT
         HUz5AkJuOsU0KVQCKxIHNEVLHWHlNXaFL1+TMm6nIx48SxLj8+ZQdRiGPsHUXCi1w9+c
         FC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AlTQl2+KNK/cEfzvbcLRc/HVQRayGgYR34/tQ4m1lOQ=;
        b=KbNG8aBGTF5mcusmk0T9t7DYB7bgDVL96zDA41k0NBew8XSGDlJSfT3sUvPdcEPTys
         s8vp9WkqOeRpeFmvNquhnKiHTR6q24NZd4rBQd3Mvimb0JQjqNx/hIWAO3jRnF/5JZ/M
         XgrT6LA/KFG01vLHHf6vUMPbSyet8sVllj4wXvarg3FgH76PdAUThZLDxTRXYTALmDJd
         BMeUOgZgnMALFSKRkZXZXHJEkBRLen8A8wd4gHYdKxyxtZ9PP4R+J4bN8ClKKa46JjjN
         deUvtyCqH6+CuacLkVhslNxeTYTAeJrMgN0DQ2np75xW4gL/Na3Jo20QsDfXoy9Wiz3I
         1cwg==
X-Gm-Message-State: AOAM531X5h6sVPRRffP20HhUd8s/bGOXciuczY0gJZP3dJ+bh5L9JdO4
	LYQGyHBSbeO/ghwHGEcJXwAaDRs96kU=
X-Google-Smtp-Source: ABdhPJzK5z4BR0iHQsHMtlDUTJpuKuqmhD156oLiJ9rIu74Swvh4rliu6OWJtXroaikSSgQ1pQgj3w==
X-Received: by 2002:a05:6808:188f:: with SMTP id bi15mr7707290oib.53.1630503923845;
        Wed, 01 Sep 2021 06:45:23 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id c75sm4283772oob.47.2021.09.01.06.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 06:45:23 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	saul.wold@windriver.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 06/31] classes/create-spdx: Add runtime dependency mapping
Date: Wed,  1 Sep 2021 08:44:45 -0500
Message-Id: <20210901134510.29561-7-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901134510.29561-1-JPEWhacker@gmail.com>
References: <20210901134510.29561-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx.bbclass | 179 ++++++++++++++++++++++++++++++-
 meta/lib/oe/sbom.py              |   5 +-
 2 files changed, 181 insertions(+), 3 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 14caae8a50..28a2e64f52 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -13,6 +13,8 @@ SPDXDIR ??= "${WORKDIR}/spdx"
 SPDXDEPLOY = "${SPDXDIR}/deploy"
 SPDXWORK = "${SPDXDIR}/work"
 
+SPDXRUNTIMEDEPLOY = "${SPDXDIR}/runtime-deploy"
+
 SPDX_INCLUDE_SOURCES ??= "0"
 SPDX_INCLUDE_PACKAGED ??= "0"
 SPDX_ARCHIVE_SOURCES ??= "0"
@@ -486,6 +488,163 @@ do_create_spdx[cleandirs] = "${SPDXDEPLOY} ${SPDXWORK}"
 do_create_spdx[depends] += "${PATCHDEPENDENCY}"
 do_create_spdx[deptask] = "do_create_spdx"
 
+def collect_package_providers(d):
+    from pathlib import Path
+    import oe.sbom
+    import oe.spdx
+    import json
+
+    deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
+
+    providers = {}
+
+    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
+    deps = sorted(set(
+        dep[0] for dep in taskdepdata.values() if
+            dep[1] == "do_create_spdx" and dep[0] != d.getVar("PN")
+    ))
+    deps.append(d.getVar("PN"))
+
+    for dep_pn in deps:
+        recipe_data = oe.packagedata.read_pkgdata(dep_pn, d)
+
+        for pkg in recipe_data.get("PACKAGES", "").split():
+
+            pkg_data = oe.packagedata.read_subpkgdata_dict(pkg, d)
+            rprovides = set(n for n, _ in bb.utils.explode_dep_versions2(pkg_data.get("RPROVIDES", "")).items())
+            rprovides.add(pkg)
+
+            for r in rprovides:
+                providers[r] = pkg
+
+    return providers
+
+collect_package_providers[vardepsexclude] += "BB_TASKDEPDATA"
+
+python do_create_runtime_spdx() {
+    from datetime import datetime, timezone
+    import oe.sbom
+    import oe.spdx
+    import oe.packagedata
+    from pathlib import Path
+
+    deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
+    spdx_deploy = Path(d.getVar("SPDXRUNTIMEDEPLOY"))
+
+    creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
+
+    providers = collect_package_providers(d)
+
+    bb.build.exec_func("read_subpackage_metadata", d)
+
+    dep_package_cache = {}
+
+    pkgdest = Path(d.getVar("PKGDEST"))
+    for package in d.getVar("PACKAGES").split():
+        localdata = bb.data.createCopy(d)
+        pkg_name = d.getVar("PKG:%s" % package) or package
+        localdata.setVar("PKG", pkg_name)
+        localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False) + ":" + package)
+
+        if not oe.packagedata.packaged(package, localdata):
+            continue
+
+        pkg_spdx_path = deploy_dir_spdx / "packages" / (pkg_name + ".spdx.json")
+
+        package_doc, package_doc_sha1 = oe.sbom.read_doc(pkg_spdx_path)
+
+        for p in package_doc.packages:
+            if p.name == pkg_name:
+                spdx_package = p
+                break
+        else:
+            bb.fatal("Package '%s' not found in %s" % (pkg_name, pkg_spdx_path))
+
+        runtime_doc = oe.spdx.SPDXDocument()
+        runtime_doc.name = "runtime-" + pkg_name
+        runtime_doc.documentNamespace = get_doc_namespace(localdata, runtime_doc)
+        runtime_doc.creationInfo.created = creation_time
+        runtime_doc.creationInfo.comment = "This document was created by analyzing package runtime dependencies."
+        runtime_doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spdx.bbclass")
+        runtime_doc.creationInfo.creators.append("Organization: OpenEmbedded ()")
+        runtime_doc.creationInfo.creators.append("Person: N/A ()")
+
+        package_ref = oe.spdx.SPDXExternalDocumentRef()
+        package_ref.externalDocumentId = "DocumentRef-package"
+        package_ref.spdxDocument = package_doc.documentNamespace
+        package_ref.checksum.algorithm = "SHA1"
+        package_ref.checksum.checksumValue = package_doc_sha1
+
+        runtime_doc.externalDocumentRefs.append(package_ref)
+
+        runtime_doc.add_relationship(
+            runtime_doc.SPDXID,
+            "AMENDS",
+            "%s:%s" % (package_ref.externalDocumentId, package_doc.SPDXID)
+        )
+
+        deps = bb.utils.explode_dep_versions2(localdata.getVar("RDEPENDS") or "")
+        seen_deps = set()
+        for dep, _ in deps.items():
+            if dep in seen_deps:
+                continue
+
+            dep = providers[dep]
+
+            if not oe.packagedata.packaged(dep, localdata):
+                continue
+
+            dep_pkg_data = oe.packagedata.read_subpkgdata_dict(dep, d)
+            dep_pkg = dep_pkg_data["PKG"]
+
+            if dep in dep_package_cache:
+                (dep_spdx_package, dep_package_ref) = dep_package_cache[dep]
+            else:
+                dep_path = deploy_dir_spdx / "packages" / ("%s.spdx.json" % dep_pkg)
+
+                spdx_dep_doc, spdx_dep_sha1 = oe.sbom.read_doc(dep_path)
+
+                for pkg in spdx_dep_doc.packages:
+                    if pkg.name == dep_pkg:
+                        dep_spdx_package = pkg
+                        break
+                else:
+                    bb.fatal("Package '%s' not found in %s" % (dep_pkg, dep_path))
+
+                dep_package_ref = oe.spdx.SPDXExternalDocumentRef()
+                dep_package_ref.externalDocumentId = "DocumentRef-runtime-dependency-" + spdx_dep_doc.name
+                dep_package_ref.spdxDocument = spdx_dep_doc.documentNamespace
+                dep_package_ref.checksum.algorithm = "SHA1"
+                dep_package_ref.checksum.checksumValue = spdx_dep_sha1
+
+                dep_package_cache[dep] = (dep_spdx_package, dep_package_ref)
+
+            runtime_doc.externalDocumentRefs.append(dep_package_ref)
+
+            runtime_doc.add_relationship(
+                "%s:%s" % (dep_package_ref.externalDocumentId, dep_spdx_package.SPDXID),
+                "RUNTIME_DEPENDENCY_OF",
+                "%s:%s" % (package_ref.externalDocumentId, spdx_package.SPDXID)
+            )
+            seen_deps.add(dep)
+
+        oe.sbom.write_doc(d, runtime_doc, "runtime", spdx_deploy)
+}
+
+addtask do_create_runtime_spdx after do_create_spdx before do_build do_rm_work
+SSTATETASKS += "do_create_runtime_spdx"
+do_create_runtime_spdx[sstate-inputdirs] = "${SPDXRUNTIMEDEPLOY}"
+do_create_runtime_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
+
+python do_create_runtime_spdx_setscene () {
+    sstate_setscene(d)
+}
+addtask do_create_runtime_spdx_setscene
+
+do_create_runtime_spdx[dirs] = "${SPDXRUNTIMEDEPLOY}"
+do_create_runtime_spdx[cleandirs] = "${SPDXRUNTIMEDEPLOY}"
+do_create_runtime_spdx[rdeptask] = "do_create_spdx"
+
 def spdx_get_src(d):
     """
     save patched source of the recipe in SPDX_WORKDIR.
@@ -537,7 +696,7 @@ def spdx_get_src(d):
     finally:
         d.setVar("WORKDIR", workdir)
 
-do_rootfs[recrdeptask] += "do_create_spdx"
+do_rootfs[recrdeptask] += "do_create_spdx do_create_runtime_spdx"
 
 ROOTFS_POSTUNINSTALL_COMMAND =+ "image_combine_spdx ; "
 python image_combine_spdx() {
@@ -598,6 +757,24 @@ python image_combine_spdx() {
         else:
             bb.fatal("Unable to find package with name '%s' in SPDX file %s" % (name, pkg_spdx_path))
 
+        runtime_spdx_path = deploy_dir_spdx / "runtime" / ("runtime-" + name + ".spdx.json")
+        runtime_doc, runtime_doc_sha1 = oe.sbom.read_doc(runtime_spdx_path)
+
+        runtime_ref = oe.spdx.SPDXExternalDocumentRef()
+        runtime_ref.externalDocumentId = "DocumentRef-%s" % runtime_doc.name
+        runtime_ref.spdxDocument = runtime_doc.documentNamespace
+        runtime_ref.checksum.algorithm = "SHA1"
+        runtime_ref.checksum.checksumValue = runtime_doc_sha1
+
+        # "OTHER" isn't ideal here, but I can't find a relationship that makes sense
+        doc.externalDocumentRefs.append(runtime_ref)
+        doc.add_relationship(
+            image,
+            "OTHER",
+            "%s:%s" % (runtime_ref.externalDocumentId, runtime_doc.SPDXID),
+            comment="Runtime dependencies for %s" % name
+        )
+
     image_spdx_path = imgdeploydir / (image_name + ".spdx.json")
 
     with image_spdx_path.open("wb") as f:
diff --git a/meta/lib/oe/sbom.py b/meta/lib/oe/sbom.py
index 294feee10b..848812c0b7 100644
--- a/meta/lib/oe/sbom.py
+++ b/meta/lib/oe/sbom.py
@@ -28,10 +28,11 @@ def get_image_spdxid(img):
     return "SPDXRef-Image-%s" % img
 
 
-def write_doc(d, spdx_doc, subdir):
+def write_doc(d, spdx_doc, subdir, spdx_deploy=None):
     from pathlib import Path
 
-    spdx_deploy = Path(d.getVar("SPDXDEPLOY"))
+    if spdx_deploy is None:
+        spdx_deploy = Path(d.getVar("SPDXDEPLOY"))
 
     dest = spdx_deploy / subdir / (spdx_doc.name + ".spdx.json")
     dest.parent.mkdir(exist_ok=True, parents=True)
-- 
2.32.0

