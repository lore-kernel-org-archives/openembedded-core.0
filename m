Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.8131.1630503935481650856
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 06:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lYZot2WH;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id g66-20020a9d12c8000000b0051aeba607f1so3458233otg.11
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 06:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5EG3K7DQxLq7o98OvEcLliIguyvaRllVOeRHNnfd65M=;
        b=lYZot2WHSszusjFl16wJrJwgp0yLOO3let1gqAcAQx4HJcayH6qjbQItwOUm7qcusy
         w91KKIO1K8DpKgzVnW6vSfMpHkfOoYVwoVs7XoLCtVBByBttGcjc3Cd2rasoIc5WyIFj
         LLrnMA8x8O3ZYHKHQb70+LXNRoJcPm33rlz4Tjf8IvgcCCF6wIcnhugGvVMSPKroSN1o
         DTlUSgDwd6BGzlJYdMs0aYy8agUqqu1wt5A+P8qKi881bGqQKX366yaDEFA+oKxa40Or
         oOmseBH+//nu8C7S8WI5x6b5sNFQhfQBNSVHIo1ozEhL29lcclJKgHlGCWRZKgMKx3+J
         b43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5EG3K7DQxLq7o98OvEcLliIguyvaRllVOeRHNnfd65M=;
        b=ODxC7l19NAQu9xUtQ+Tjstdz16s9MDCB8vsjZh0qhal0qPHszJU1kNC/FpDnMIEQDd
         gdG995FbyFt3DhLl1rkjWZaRwsdWqFN2SSMkoLcV3p5Ex3E3S1F6lA00lhEBznXsyfYb
         iY+XXpDcT5CRqtKY1fcmzkdTYriW9Vql6yqMc/E4c7ETJVdbDDHZmKtJvohxzV4pI3Y6
         dVBhiDC6BeFlmXFBn3Yy9xBT3kE/KqMghymYUgu/yzCluLrP7VGXwxvs2hVEoTCY/AJi
         vaVWGW1+QxJE3PFcHjsYxP+eIOD+IS+90HcpTJnoeZOiFmP+FVZYZ5WfHi0xh7+Y2yXa
         cdNQ==
X-Gm-Message-State: AOAM530ZO0yUOnrQFXD5BPYnVTUzFYAdee+0HeAFp8zpMyflhbgixfNb
	mHQD9bz001mUaOz8dBhWJ3VGAUwNblU=
X-Google-Smtp-Source: ABdhPJzVfLYnHmMSEpV8JeFKq8avfn0QZVzPzLARcLCAnvhF18IA4g+/2DqUR8UCw1qKBl49egFaCg==
X-Received: by 2002:a05:6830:911:: with SMTP id v17mr29399119ott.133.1630503934280;
        Wed, 01 Sep 2021 06:45:34 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id c75sm4283772oob.47.2021.09.01.06.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 06:45:33 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	saul.wold@windriver.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 16/31] classes/create-spdx: Skip package processing for native recipes
Date: Wed,  1 Sep 2021 08:44:55 -0500
Message-Id: <20210901134510.29561-17-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901134510.29561-1-JPEWhacker@gmail.com>
References: <20210901134510.29561-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Native recipes do not produce packages and should not process them,
otherwise it can trigger an error in read_subpackage_metadata

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx.bbclass | 263 ++++++++++++++++---------------
 1 file changed, 134 insertions(+), 129 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index db1d1756c9..6af4181087 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -344,7 +344,6 @@ python do_create_spdx() {
         else:
             yield None
 
-    bb.build.exec_func("read_subpackage_metadata", d)
 
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
     spdx_workdir = Path(d.getVar("SPDXWORK"))
@@ -352,6 +351,7 @@ python do_create_spdx() {
     include_sources = d.getVar("SPDX_INCLUDE_SOURCES") == "1"
     archive_sources = d.getVar("SPDX_ARCHIVE_SOURCES") == "1"
     archive_packaged = d.getVar("SPDX_ARCHIVE_PACKAGED") == "1"
+    is_native = bb.data.inherits_class("native", d)
 
     creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
 
@@ -442,62 +442,65 @@ python do_create_spdx() {
 
     sources = collect_dep_sources(d, dep_recipes)
 
-    pkgdest = Path(d.getVar("PKGDEST"))
-    for package in d.getVar("PACKAGES").split():
-        if not oe.packagedata.packaged(package, d):
-            continue
-
-        package_doc = oe.spdx.SPDXDocument()
-        pkg_name = d.getVar("PKG:%s" % package) or package
-        package_doc.name = pkg_name
-        package_doc.documentNamespace = get_doc_namespace(d, package_doc)
-        package_doc.creationInfo.created = creation_time
-        package_doc.creationInfo.comment = "This document was created by analyzing packages created during the build."
-        package_doc.creationInfo.licenseListVersion = d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"]
-        package_doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spdx.bbclass")
-        package_doc.creationInfo.creators.append("Organization: OpenEmbedded ()")
-        package_doc.creationInfo.creators.append("Person: N/A ()")
-
-        recipe_ref = oe.spdx.SPDXExternalDocumentRef()
-        recipe_ref.externalDocumentId = "DocumentRef-recipe-" + recipe.name
-        recipe_ref.spdxDocument = doc.documentNamespace
-        recipe_ref.checksum.algorithm = "SHA1"
-        recipe_ref.checksum.checksumValue = doc_sha1
-
-        package_doc.externalDocumentRefs.append(recipe_ref)
-
-        package_license = d.getVar("LICENSE:%s" % package) or d.getVar("LICENSE")
+    if not is_native:
+        bb.build.exec_func("read_subpackage_metadata", d)
 
-        spdx_package = oe.spdx.SPDXPackage()
-
-        spdx_package.SPDXID = oe.sbom.get_package_spdxid(pkg_name)
-        spdx_package.name = pkg_name
-        spdx_package.versionInfo = d.getVar("PV")
-        spdx_package.licenseDeclared = convert_license_to_spdx(package_license, package_doc, d)
-
-        package_doc.packages.append(spdx_package)
+        pkgdest = Path(d.getVar("PKGDEST"))
+        for package in d.getVar("PACKAGES").split():
+            if not oe.packagedata.packaged(package, d):
+                continue
 
-        package_doc.add_relationship(spdx_package, "GENERATED_FROM", "%s:%s" % (recipe_ref.externalDocumentId, recipe.SPDXID))
-        package_doc.add_relationship(package_doc, "DESCRIBES", spdx_package)
+            package_doc = oe.spdx.SPDXDocument()
+            pkg_name = d.getVar("PKG:%s" % package) or package
+            package_doc.name = pkg_name
+            package_doc.documentNamespace = get_doc_namespace(d, package_doc)
+            package_doc.creationInfo.created = creation_time
+            package_doc.creationInfo.comment = "This document was created by analyzing packages created during the build."
+            package_doc.creationInfo.licenseListVersion = d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"]
+            package_doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spdx.bbclass")
+            package_doc.creationInfo.creators.append("Organization: OpenEmbedded ()")
+            package_doc.creationInfo.creators.append("Person: N/A ()")
+
+            recipe_ref = oe.spdx.SPDXExternalDocumentRef()
+            recipe_ref.externalDocumentId = "DocumentRef-recipe-" + recipe.name
+            recipe_ref.spdxDocument = doc.documentNamespace
+            recipe_ref.checksum.algorithm = "SHA1"
+            recipe_ref.checksum.checksumValue = doc_sha1
+
+            package_doc.externalDocumentRefs.append(recipe_ref)
+
+            package_license = d.getVar("LICENSE:%s" % package) or d.getVar("LICENSE")
+
+            spdx_package = oe.spdx.SPDXPackage()
+
+            spdx_package.SPDXID = oe.sbom.get_package_spdxid(pkg_name)
+            spdx_package.name = pkg_name
+            spdx_package.versionInfo = d.getVar("PV")
+            spdx_package.licenseDeclared = convert_license_to_spdx(package_license, package_doc, d)
+
+            package_doc.packages.append(spdx_package)
+
+            package_doc.add_relationship(spdx_package, "GENERATED_FROM", "%s:%s" % (recipe_ref.externalDocumentId, recipe.SPDXID))
+            package_doc.add_relationship(package_doc, "DESCRIBES", spdx_package)
+
+            package_archive = deploy_dir_spdx / "packages" / (package_doc.name + ".tar.zst")
+            with optional_tarfile(package_archive, archive_packaged) as archive:
+                package_files = add_package_files(
+                    d,
+                    package_doc,
+                    spdx_package,
+                    pkgdest / package,
+                    lambda file_counter: oe.sbom.get_packaged_file_spdxid(pkg_name, file_counter),
+                    lambda filepath: ["BINARY"],
+                    archive=archive,
+                )
 
-        package_archive = deploy_dir_spdx / "packages" / (package_doc.name + ".tar.zst")
-        with optional_tarfile(package_archive, archive_packaged) as archive:
-            package_files = add_package_files(
-                d,
-                package_doc,
-                spdx_package,
-                pkgdest / package,
-                lambda file_counter: oe.sbom.get_packaged_file_spdxid(pkg_name, file_counter),
-                lambda filepath: ["BINARY"],
-                archive=archive,
-            )
-
-            if archive is not None:
-                spdx_package.packageFileName = str(package_archive.name)
+                if archive is not None:
+                    spdx_package.packageFileName = str(package_archive.name)
 
-        add_package_sources_from_debug(d, package_doc, spdx_package, package, package_files, sources)
+            add_package_sources_from_debug(d, package_doc, spdx_package, package, package_files, sources)
 
-        oe.sbom.write_doc(d, package_doc, "packages")
+            oe.sbom.write_doc(d, package_doc, "packages")
 }
 # NOTE: depending on do_unpack is a hack that is necessary to get it's dependencies for archive the source
 addtask do_create_spdx after do_package do_packagedata do_unpack before do_build do_rm_work
@@ -557,106 +560,108 @@ python do_create_runtime_spdx() {
 
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
     spdx_deploy = Path(d.getVar("SPDXRUNTIMEDEPLOY"))
+    is_native = bb.data.inherits_class("native", d)
 
     creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
 
     providers = collect_package_providers(d)
 
-    bb.build.exec_func("read_subpackage_metadata", d)
+    if not is_native:
+        bb.build.exec_func("read_subpackage_metadata", d)
 
-    dep_package_cache = {}
+        dep_package_cache = {}
 
-    pkgdest = Path(d.getVar("PKGDEST"))
-    for package in d.getVar("PACKAGES").split():
-        localdata = bb.data.createCopy(d)
-        pkg_name = d.getVar("PKG:%s" % package) or package
-        localdata.setVar("PKG", pkg_name)
-        localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False) + ":" + package)
+        pkgdest = Path(d.getVar("PKGDEST"))
+        for package in d.getVar("PACKAGES").split():
+            localdata = bb.data.createCopy(d)
+            pkg_name = d.getVar("PKG:%s" % package) or package
+            localdata.setVar("PKG", pkg_name)
+            localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False) + ":" + package)
 
-        if not oe.packagedata.packaged(package, localdata):
-            continue
+            if not oe.packagedata.packaged(package, localdata):
+                continue
 
-        pkg_spdx_path = deploy_dir_spdx / "packages" / (pkg_name + ".spdx.json")
+            pkg_spdx_path = deploy_dir_spdx / "packages" / (pkg_name + ".spdx.json")
 
-        package_doc, package_doc_sha1 = oe.sbom.read_doc(pkg_spdx_path)
+            package_doc, package_doc_sha1 = oe.sbom.read_doc(pkg_spdx_path)
 
-        for p in package_doc.packages:
-            if p.name == pkg_name:
-                spdx_package = p
-                break
-        else:
-            bb.fatal("Package '%s' not found in %s" % (pkg_name, pkg_spdx_path))
-
-        runtime_doc = oe.spdx.SPDXDocument()
-        runtime_doc.name = "runtime-" + pkg_name
-        runtime_doc.documentNamespace = get_doc_namespace(localdata, runtime_doc)
-        runtime_doc.creationInfo.created = creation_time
-        runtime_doc.creationInfo.comment = "This document was created by analyzing package runtime dependencies."
-        runtime_doc.creationInfo.licenseListVersion = d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"]
-        runtime_doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spdx.bbclass")
-        runtime_doc.creationInfo.creators.append("Organization: OpenEmbedded ()")
-        runtime_doc.creationInfo.creators.append("Person: N/A ()")
-
-        package_ref = oe.spdx.SPDXExternalDocumentRef()
-        package_ref.externalDocumentId = "DocumentRef-package-" + package
-        package_ref.spdxDocument = package_doc.documentNamespace
-        package_ref.checksum.algorithm = "SHA1"
-        package_ref.checksum.checksumValue = package_doc_sha1
-
-        runtime_doc.externalDocumentRefs.append(package_ref)
-
-        runtime_doc.add_relationship(
-            runtime_doc.SPDXID,
-            "AMENDS",
-            "%s:%s" % (package_ref.externalDocumentId, package_doc.SPDXID)
-        )
-
-        deps = bb.utils.explode_dep_versions2(localdata.getVar("RDEPENDS") or "")
-        seen_deps = set()
-        for dep, _ in deps.items():
-            if dep in seen_deps:
-                continue
+            for p in package_doc.packages:
+                if p.name == pkg_name:
+                    spdx_package = p
+                    break
+            else:
+                bb.fatal("Package '%s' not found in %s" % (pkg_name, pkg_spdx_path))
+
+            runtime_doc = oe.spdx.SPDXDocument()
+            runtime_doc.name = "runtime-" + pkg_name
+            runtime_doc.documentNamespace = get_doc_namespace(localdata, runtime_doc)
+            runtime_doc.creationInfo.created = creation_time
+            runtime_doc.creationInfo.comment = "This document was created by analyzing package runtime dependencies."
+            runtime_doc.creationInfo.licenseListVersion = d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"]
+            runtime_doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spdx.bbclass")
+            runtime_doc.creationInfo.creators.append("Organization: OpenEmbedded ()")
+            runtime_doc.creationInfo.creators.append("Person: N/A ()")
+
+            package_ref = oe.spdx.SPDXExternalDocumentRef()
+            package_ref.externalDocumentId = "DocumentRef-package-" + package
+            package_ref.spdxDocument = package_doc.documentNamespace
+            package_ref.checksum.algorithm = "SHA1"
+            package_ref.checksum.checksumValue = package_doc_sha1
+
+            runtime_doc.externalDocumentRefs.append(package_ref)
 
-            dep = providers[dep]
+            runtime_doc.add_relationship(
+                runtime_doc.SPDXID,
+                "AMENDS",
+                "%s:%s" % (package_ref.externalDocumentId, package_doc.SPDXID)
+            )
 
-            if not oe.packagedata.packaged(dep, localdata):
-                continue
+            deps = bb.utils.explode_dep_versions2(localdata.getVar("RDEPENDS") or "")
+            seen_deps = set()
+            for dep, _ in deps.items():
+                if dep in seen_deps:
+                    continue
 
-            dep_pkg_data = oe.packagedata.read_subpkgdata_dict(dep, d)
-            dep_pkg = dep_pkg_data["PKG"]
+                dep = providers[dep]
 
-            if dep in dep_package_cache:
-                (dep_spdx_package, dep_package_ref) = dep_package_cache[dep]
-            else:
-                dep_path = deploy_dir_spdx / "packages" / ("%s.spdx.json" % dep_pkg)
+                if not oe.packagedata.packaged(dep, localdata):
+                    continue
 
-                spdx_dep_doc, spdx_dep_sha1 = oe.sbom.read_doc(dep_path)
+                dep_pkg_data = oe.packagedata.read_subpkgdata_dict(dep, d)
+                dep_pkg = dep_pkg_data["PKG"]
 
-                for pkg in spdx_dep_doc.packages:
-                    if pkg.name == dep_pkg:
-                        dep_spdx_package = pkg
-                        break
+                if dep in dep_package_cache:
+                    (dep_spdx_package, dep_package_ref) = dep_package_cache[dep]
                 else:
-                    bb.fatal("Package '%s' not found in %s" % (dep_pkg, dep_path))
+                    dep_path = deploy_dir_spdx / "packages" / ("%s.spdx.json" % dep_pkg)
 
-                dep_package_ref = oe.spdx.SPDXExternalDocumentRef()
-                dep_package_ref.externalDocumentId = "DocumentRef-runtime-dependency-" + spdx_dep_doc.name
-                dep_package_ref.spdxDocument = spdx_dep_doc.documentNamespace
-                dep_package_ref.checksum.algorithm = "SHA1"
-                dep_package_ref.checksum.checksumValue = spdx_dep_sha1
+                    spdx_dep_doc, spdx_dep_sha1 = oe.sbom.read_doc(dep_path)
 
-                dep_package_cache[dep] = (dep_spdx_package, dep_package_ref)
+                    for pkg in spdx_dep_doc.packages:
+                        if pkg.name == dep_pkg:
+                            dep_spdx_package = pkg
+                            break
+                    else:
+                        bb.fatal("Package '%s' not found in %s" % (dep_pkg, dep_path))
 
-            runtime_doc.externalDocumentRefs.append(dep_package_ref)
+                    dep_package_ref = oe.spdx.SPDXExternalDocumentRef()
+                    dep_package_ref.externalDocumentId = "DocumentRef-runtime-dependency-" + spdx_dep_doc.name
+                    dep_package_ref.spdxDocument = spdx_dep_doc.documentNamespace
+                    dep_package_ref.checksum.algorithm = "SHA1"
+                    dep_package_ref.checksum.checksumValue = spdx_dep_sha1
 
-            runtime_doc.add_relationship(
-                "%s:%s" % (dep_package_ref.externalDocumentId, dep_spdx_package.SPDXID),
-                "RUNTIME_DEPENDENCY_OF",
-                "%s:%s" % (package_ref.externalDocumentId, spdx_package.SPDXID)
-            )
-            seen_deps.add(dep)
+                    dep_package_cache[dep] = (dep_spdx_package, dep_package_ref)
+
+                runtime_doc.externalDocumentRefs.append(dep_package_ref)
+
+                runtime_doc.add_relationship(
+                    "%s:%s" % (dep_package_ref.externalDocumentId, dep_spdx_package.SPDXID),
+                    "RUNTIME_DEPENDENCY_OF",
+                    "%s:%s" % (package_ref.externalDocumentId, spdx_package.SPDXID)
+                )
+                seen_deps.add(dep)
 
-        oe.sbom.write_doc(d, runtime_doc, "runtime", spdx_deploy)
+            oe.sbom.write_doc(d, runtime_doc, "runtime", spdx_deploy)
 }
 
 addtask do_create_runtime_spdx after do_create_spdx before do_build do_rm_work
-- 
2.32.0

