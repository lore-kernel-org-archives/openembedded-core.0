Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web12.8222.1630503921710404092
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 06:45:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PjNIz/72;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id x10-20020a056830408a00b004f26cead745so3472320ott.10
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 06:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XExIyuWJTUAx/qY4MUOv5aMrhw8yZYFofCRZeHiJkgw=;
        b=PjNIz/72tTk2dEjTk9hv0jUwxo/LBpCN+9zwi5XC52yr/r8c3D98/jH9Bp3YGn84+k
         bQTJNYUwrzWsZkiCezVbQ3BEa+dS8PtBM5Crj1rQDmB4no2nUaaSkW9MFJftkqfwhBwV
         x4m6aSzIFy2szHgPD16X6utF14PkA289WT5t9LG9RrSedb7gAl8nSyP8+5cu61cGfwqq
         xkJ+m2kkgJgtldUux4Kh0SOxhdJjFMX1pqd7EQw2JKeuFxa7qxnGChqDdHyKsAzX7SNR
         eH3Mgfpyi6a8pGsdAtMCoUnTFdrB9ECRwdrwzpneChY9P5B347EMfOPv/VhxPmaYSeUm
         eOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XExIyuWJTUAx/qY4MUOv5aMrhw8yZYFofCRZeHiJkgw=;
        b=WGjHj6rlM+DxYHTaTXeueF7q0RiLRAVcXcbf5xFy5uqn96QCqn2ZeK5pb4xoY2G4EL
         6xYVCDG7yx6BVMHWp4NgNixIBrVLum7G5rKoj0m5OyjW7s61I6nw8KUwzdNJnEagPfue
         xcfpqYng5HCxRYhpPRDtXtMGsJYUW+blaV7uHyvvkmXFGTo9u7CuSJU6Rvb+Dvf7Jy0E
         i2MpaWVW44v6vDovRsNvFpUUPhpqXW2HGDelhT3YmI6XLWRF3vgeD+YizDyIlZ3ff/Lo
         qMhTtSkPU9CMS9xq+KVqTE7BCzQGvhaPO+5n73qA6SpDXYhB2656M//yoWHcK04UhVbf
         ljCA==
X-Gm-Message-State: AOAM5307jNP1W7U/uxy205zGlpvKkqH9dMdO5ATif0ROmLiZqo8nwrJ1
	BJ+YSp9aisGwUqiLVh5ulI+ZXqZPJ3A=
X-Google-Smtp-Source: ABdhPJybMs6b5Ln5Ml+TsQY6EC7h6Z0x6KOjHGQJSNdxWQJDpv9iwPw+ON89Q9FPZzrkEXpmrxdCFw==
X-Received: by 2002:a9d:6f94:: with SMTP id h20mr29241149otq.168.1630503920219;
        Wed, 01 Sep 2021 06:45:20 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id c75sm4283772oob.47.2021.09.01.06.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 06:45:19 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	saul.wold@windriver.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 02/31] classes/create-spdx: Add class
Date: Wed,  1 Sep 2021 08:44:41 -0500
Message-Id: <20210901134510.29561-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901134510.29561-1-JPEWhacker@gmail.com>
References: <20210901134510.29561-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a class as a first attempt to create SPDX SBoM documents during the
build. This initial work was influenced by [meta-doubleopen][1],
although almost completely rewritten.

[1]: https://github.com/doubleopen-project/meta-doubleopen

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx.bbclass | 679 +++++++++++++++++++++++++++++++
 meta/lib/oe/sbom.py              |  63 +++
 meta/lib/oe/spdx.py              | 263 ++++++++++++
 3 files changed, 1005 insertions(+)
 create mode 100644 meta/classes/create-spdx.bbclass
 create mode 100644 meta/lib/oe/sbom.py
 create mode 100644 meta/lib/oe/spdx.py

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
new file mode 100644
index 0000000000..35fb4421d0
--- /dev/null
+++ b/meta/classes/create-spdx.bbclass
@@ -0,0 +1,679 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+DEPLOY_DIR_SPDX ??= "${DEPLOY_DIR}/spdx/${MACHINE}"
+
+# The product name that the CVE database uses.  Defaults to BPN, but may need to
+# be overriden per recipe (for example tiff.bb sets CVE_PRODUCT=libtiff).
+CVE_PRODUCT ??= "${BPN}"
+CVE_VERSION ??= "${PV}"
+
+SPDXDIR ??= "${WORKDIR}/spdx"
+SPDXDEPLOY = "${SPDXDIR}/deploy"
+SPDXWORK = "${SPDXDIR}/work"
+
+SPDX_INCLUDE_SOURCES ??= "0"
+SPDX_INCLUDE_PACKAGED ??= "0"
+SPDX_ARCHIVE_SOURCES ??= "0"
+SPDX_ARCHIVE_PACKAGED ??= "0"
+
+SPDX_UUID_NAMESPACE ??= "sbom.openembedded.org"
+SPDX_NAMESPACE_PREFIX ??= "http://spdx.org/spdxdoc"
+
+do_image_complete[depends] = "virtual/kernel:do_create_spdx"
+
+def get_doc_namespace(d, doc):
+    import uuid
+    namespace_uuid = uuid.uuid5(uuid.NAMESPACE_DNS, d.getVar("SPDX_UUID_NAMESPACE"))
+    return "%s/%s-%s" % (d.getVar("SPDX_NAMESPACE_PREFIX"), doc.name, str(uuid.uuid5(namespace_uuid, doc.name)))
+
+
+def is_work_shared(d):
+    pn = d.getVar('PN')
+    return bb.data.inherits_class('kernel', d) or pn.startswith('gcc-source')
+
+
+def convert_license_to_spdx(lic, d):
+    def convert(l):
+        if l == "&":
+            return "AND"
+
+        if l == "|":
+            return "OR"
+
+        spdx = d.getVarFlag('SPDXLICENSEMAP', l)
+        if spdx is not None:
+            return spdx
+
+        return l
+
+    return ' '.join(convert(l) for l in lic.split())
+
+
+def process_sources(d):
+    pn = d.getVar('PN')
+    assume_provided = (d.getVar("ASSUME_PROVIDED") or "").split()
+    if pn in assume_provided:
+        for p in d.getVar("PROVIDES").split():
+            if p != pn:
+                pn = p
+                break
+
+    # glibc-locale: do_fetch, do_unpack and do_patch tasks have been deleted,
+    # so avoid archiving source here.
+    if pn.startswith('glibc-locale'):
+        return False
+    if d.getVar('PN') == "libtool-cross":
+        return False
+    if d.getVar('PN') == "libgcc-initial":
+        return False
+    if d.getVar('PN') == "shadow-sysroot":
+        return False
+
+    # We just archive gcc-source for all the gcc related recipes
+    if d.getVar('BPN') in ['gcc', 'libgcc']:
+        bb.debug(1, 'spdx: There is bug in scan of %s is, do nothing' % pn)
+        return False
+
+    return True
+
+
+def add_package_files(d, doc, spdx_pkg, topdir, get_spdxid, get_types, *, archive=None, ignore_dirs=[], ignore_top_level_dirs=[]):
+    from pathlib import Path
+    import oe.spdx
+    import hashlib
+
+    source_date_epoch = d.getVar("SOURCE_DATE_EPOCH")
+
+    sha1s = []
+    spdx_files = []
+
+    file_counter = 1
+    for subdir, dirs, files in os.walk(topdir):
+        dirs[:] = [d for d in dirs if d not in ignore_dirs]
+        if subdir == str(topdir):
+            dirs[:] = [d for d in dirs if d not in ignore_top_level_dirs]
+
+        for file in files:
+            filepath = Path(subdir) / file
+            filename = str(filepath.relative_to(topdir))
+
+            if filepath.is_file() and not filepath.is_symlink():
+                spdx_file = oe.spdx.SPDXFile()
+                spdx_file.SPDXID = get_spdxid(file_counter)
+                for t in get_types(filepath):
+                    spdx_file.fileTypes.append(t)
+                spdx_file.fileName = filename
+
+                hashes = {
+                    "SHA1": hashlib.sha1(),
+                    "SHA256": hashlib.sha256(),
+                }
+
+                with filepath.open("rb") as f:
+                    while True:
+                        chunk = f.read(4096)
+                        if not chunk:
+                            break
+
+                        for h in hashes.values():
+                            h.update(chunk)
+
+                    if archive is not None:
+                        f.seek(0)
+                        info = archive.gettarinfo(fileobj=f)
+                        info.name = filename
+                        info.uid = 0
+                        info.gid = 0
+                        info.uname = "root"
+                        info.gname = "root"
+
+                        if source_date_epoch is not None and info.mtime > int(source_date_epoch):
+                            info.mtime = int(source_date_epoch)
+
+                        archive.addfile(info, f)
+
+                for k, v in hashes.items():
+                    spdx_file.checksums.append(oe.spdx.SPDXChecksum(
+                        algorithm=k,
+                        checksumValue=v.hexdigest(),
+                    ))
+
+                sha1s.append(hashes["SHA1"].hexdigest())
+
+                doc.files.append(spdx_file)
+                doc.add_relationship(spdx_pkg, "CONTAINS", spdx_file)
+                spdx_pkg.hasFiles.append(spdx_file.SPDXID)
+
+                spdx_files.append(spdx_file)
+
+                file_counter += 1
+
+    sha1s.sort()
+    verifier = hashlib.sha1()
+    for v in sha1s:
+        verifier.update(v.encode("utf-8"))
+    spdx_pkg.packageVerificationCode.packageVerificationCodeValue = verifier.hexdigest()
+
+    return spdx_files
+
+
+def add_package_sources_from_debug(d, package_doc, spdx_package, package, package_files, sources):
+    from pathlib import Path
+    import hashlib
+    import oe.packagedata
+    import oe.spdx
+
+    debug_search_paths = [
+        Path(d.getVar('PKGD')),
+        Path(d.getVar('STAGING_DIR_TARGET')),
+        Path(d.getVar('STAGING_DIR_NATIVE')),
+    ]
+
+    pkg_data = oe.packagedata.read_subpkgdata_extended(package, d)
+
+    if pkg_data is None:
+        return
+
+    for file_path, file_data in pkg_data["files_info"].items():
+        if not "debugsrc" in file_data:
+            continue
+
+        for pkg_file in package_files:
+            if file_path.lstrip("/") == pkg_file.fileName.lstrip("/"):
+                break
+        else:
+            bb.fatal("No package file found for %s" % str(file_path))
+            continue
+
+        for debugsrc in file_data["debugsrc"]:
+            for search in debug_search_paths:
+                debugsrc_path = search / debugsrc.lstrip("/")
+                if not debugsrc_path.exists():
+                    continue
+
+                with debugsrc_path.open("rb") as f:
+                    sha = hashlib.sha256()
+                    while True:
+                        chunk = f.read(4096)
+                        if not chunk:
+                            break
+                        sha.update(chunk)
+
+                file_sha256 = sha.hexdigest()
+
+                if not file_sha256 in sources:
+                    bb.debug(1, "Debug source %s with SHA256 %s not found in any dependency" % (str(debugsrc_path), file_sha256))
+                    continue
+
+                source_file = sources[file_sha256]
+
+                doc_ref = package_doc.find_external_document_ref(source_file.doc.documentNamespace)
+                if doc_ref is None:
+                    doc_ref = oe.spdx.SPDXExternalDocumentRef()
+                    doc_ref.externalDocumentId = "DocumentRef-dependency-" + source_file.doc.name
+                    doc_ref.spdxDocument = source_file.doc.documentNamespace
+                    doc_ref.checksum.algorithm = "SHA1"
+                    doc_ref.checksum.checksumValue = source_file.doc_sha1
+                    package_doc.externalDocumentRefs.append(doc_ref)
+
+                package_doc.add_relationship(
+                    pkg_file,
+                    "GENERATED_FROM",
+                    "%s:%s" % (doc_ref.externalDocumentId, source_file.file.SPDXID),
+                    comment=debugsrc
+                )
+                break
+            else:
+                bb.debug(1, "Debug source %s not found" % debugsrc)
+
+
+def collect_dep_recipes(d, doc, spdx_recipe):
+    from pathlib import Path
+    import oe.sbom
+    import oe.spdx
+
+    deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
+
+    dep_recipes = []
+    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
+    deps = sorted(set(
+        dep[0] for dep in taskdepdata.values() if
+            dep[1] == "do_create_spdx" and dep[0] != d.getVar("PN")
+    ))
+    for dep_pn in deps:
+        dep_recipe_path = deploy_dir_spdx / "recipes" / ("recipe-%s.spdx.json" % dep_pn)
+
+        spdx_dep_doc, spdx_dep_sha1 = oe.sbom.read_doc(dep_recipe_path)
+
+        for pkg in spdx_dep_doc.packages:
+            if pkg.name == dep_pn:
+                spdx_dep_recipe = pkg
+                break
+        else:
+            continue
+
+        dep_recipes.append(oe.sbom.DepRecipe(spdx_dep_doc, spdx_dep_sha1, spdx_dep_recipe))
+
+        dep_recipe_ref = oe.spdx.SPDXExternalDocumentRef()
+        dep_recipe_ref.externalDocumentId = "DocumentRef-dependency-" + spdx_dep_doc.name
+        dep_recipe_ref.spdxDocument = spdx_dep_doc.documentNamespace
+        dep_recipe_ref.checksum.algorithm = "SHA1"
+        dep_recipe_ref.checksum.checksumValue = spdx_dep_sha1
+
+        doc.externalDocumentRefs.append(dep_recipe_ref)
+
+        doc.add_relationship(
+            "%s:%s" % (dep_recipe_ref.externalDocumentId, spdx_dep_recipe.SPDXID),
+            "BUILD_DEPENDENCY_OF",
+            spdx_recipe
+        )
+
+    return dep_recipes
+
+collect_dep_recipes[vardepsexclude] += "BB_TASKDEPDATA"
+
+
+def collect_dep_sources(d, dep_recipes):
+    import oe.sbom
+
+    sources = {}
+    for dep in dep_recipes:
+        recipe_files = set(dep.recipe.hasFiles)
+
+        for spdx_file in dep.doc.files:
+            if spdx_file.SPDXID not in recipe_files:
+                continue
+
+            if "SOURCE" in spdx_file.fileTypes:
+                for checksum in spdx_file.checksums:
+                    if checksum.algorithm == "SHA256":
+                        sources[checksum.checksumValue] = oe.sbom.DepSource(dep.doc, dep.doc_sha1, dep.recipe, spdx_file)
+                        break
+
+    return sources
+
+
+python do_create_spdx() {
+    from datetime import datetime, timezone
+    import oe.sbom
+    import oe.spdx
+    import uuid
+    from pathlib import Path
+    from contextlib import contextmanager
+    import oe.cve_check
+
+    @contextmanager
+    def optional_tarfile(name, guard, mode="w"):
+        import tarfile
+        import bb.compress.zstd
+
+        num_threads = int(d.getVar("BB_NUMBER_THREADS"))
+
+        if guard:
+            name.parent.mkdir(parents=True, exist_ok=True)
+            with bb.compress.zstd.open(name, mode=mode + "b", num_threads=num_threads) as f:
+                with tarfile.open(fileobj=f, mode=mode + "|") as tf:
+                    yield tf
+        else:
+            yield None
+
+    bb.build.exec_func("read_subpackage_metadata", d)
+
+    deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
+    spdx_workdir = Path(d.getVar("SPDXWORK"))
+    include_packaged = d.getVar("SPDX_INCLUDE_PACKAGED") == "1"
+    include_sources = d.getVar("SPDX_INCLUDE_SOURCES") == "1"
+    archive_sources = d.getVar("SPDX_ARCHIVE_SOURCES") == "1"
+    archive_packaged = d.getVar("SPDX_ARCHIVE_PACKAGED") == "1"
+
+    creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
+
+    doc = oe.spdx.SPDXDocument()
+
+    doc.name = "recipe-" + d.getVar("PN")
+    doc.documentNamespace = get_doc_namespace(d, doc)
+    doc.creationInfo.created = creation_time
+    doc.creationInfo.comment = "This document was created by analyzing the source of the Yocto recipe during the build."
+    doc.creationInfo.creators.append("Tool: meta-doubleopen")
+    doc.creationInfo.creators.append("Organization: Double Open Project ()")
+    doc.creationInfo.creators.append("Person: N/A ()")
+
+    recipe = oe.spdx.SPDXPackage()
+    recipe.name = d.getVar("PN")
+    recipe.versionInfo = d.getVar("PV")
+    recipe.SPDXID = oe.sbom.get_recipe_spdxid(d)
+
+    src_uri = d.getVar('SRC_URI')
+    if src_uri:
+        recipe.downloadLocation = src_uri.split()[0]
+
+    homepage = d.getVar("HOMEPAGE")
+    if homepage:
+        recipe.homepage = homepage
+
+    license = d.getVar("LICENSE")
+    if license:
+        recipe.licenseDeclared = convert_license_to_spdx(license, d)
+
+    summary = d.getVar("SUMMARY")
+    if summary:
+        recipe.summary = summary
+
+    description = d.getVar("DESCRIPTION")
+    if description:
+        recipe.description = description
+
+    # Some CVEs may be patched during the build process without incrementing the version number,
+    # so querying for CVEs based on the CPE id can lead to false positives. To account for this,
+    # save the CVEs fixed by patches to source information field in the SPDX.
+    patched_cves = oe.cve_check.get_patched_cves(d)
+    patched_cves = list(patched_cves)
+    patched_cves = ' '.join(patched_cves)
+    if patched_cves:
+        recipe.sourceInfo = "CVEs fixed: " + patched_cves
+
+    cpe_ids = oe.cve_check.get_cpe_ids(d.getVar("CVE_PRODUCT"), d.getVar("CVE_VERSION"))
+    if cpe_ids:
+        for cpe_id in cpe_ids:
+            cpe = oe.spdx.SPDXExternalReference()
+            cpe.referenceCategory = "SECURITY"
+            cpe.referenceType = "http://spdx.org/rdf/references/cpe23Type"
+            cpe.referenceLocator = cpe_id
+            recipe.externalRefs.append(cpe)
+
+    doc.packages.append(recipe)
+    doc.add_relationship(doc, "DESCRIBES", recipe)
+
+    if process_sources(d) and include_sources:
+        recipe_archive = deploy_dir_spdx / "recipes" / (doc.name + ".tar.zst")
+        with optional_tarfile(recipe_archive, archive_sources) as archive:
+            spdx_get_src(d)
+
+            add_package_files(
+                d,
+                doc,
+                recipe,
+                spdx_workdir,
+                lambda file_counter: "SPDXRef-SourceFile-%s-%d" % (d.getVar("PN"), file_counter),
+                lambda filepath: ["SOURCE"],
+                ignore_dirs=[".git"],
+                ignore_top_level_dirs=["temp"],
+                archive=archive,
+            )
+
+            if archive is not None:
+                recipe.packageFileName = str(recipe_archive.name)
+
+    dep_recipes = collect_dep_recipes(d, doc, recipe)
+
+    doc_sha1 = oe.sbom.write_doc(d, doc, "recipes")
+    dep_recipes.append(oe.sbom.DepRecipe(doc, doc_sha1, recipe))
+
+    sources = collect_dep_sources(d, dep_recipes)
+
+    pkgdest = Path(d.getVar("PKGDEST"))
+    for package in d.getVar("PACKAGES").split():
+        if not oe.packagedata.packaged(package, d):
+            continue
+
+        package_doc = oe.spdx.SPDXDocument()
+        pkg_name = d.getVar("PKG:%s" % package) or package
+        package_doc.name = pkg_name
+        package_doc.documentNamespace = get_doc_namespace(d, package_doc)
+        package_doc.creationInfo.created = creation_time
+        package_doc.creationInfo.comment = "This document was created by analyzing the source of the Yocto recipe during the build."
+        package_doc.creationInfo.creators.append("Tool: meta-doubleopen")
+        package_doc.creationInfo.creators.append("Organization: Double Open Project ()")
+        package_doc.creationInfo.creators.append("Person: N/A ()")
+
+        recipe_ref = oe.spdx.SPDXExternalDocumentRef()
+        recipe_ref.externalDocumentId = "DocumentRef-recipe"
+        recipe_ref.spdxDocument = doc.documentNamespace
+        recipe_ref.checksum.algorithm = "SHA1"
+        recipe_ref.checksum.checksumValue = doc_sha1
+
+        package_doc.externalDocumentRefs.append(recipe_ref)
+
+        package_license = d.getVar("LICENSE:%s" % package) or d.getVar("LICENSE")
+
+        spdx_package = oe.spdx.SPDXPackage()
+
+        spdx_package.SPDXID = oe.sbom.get_package_spdxid(pkg_name)
+        spdx_package.name = pkg_name
+        spdx_package.versionInfo = d.getVar("PV")
+        spdx_package.licenseDeclared = convert_license_to_spdx(package_license, d)
+
+        package_doc.packages.append(spdx_package)
+
+        package_doc.add_relationship(spdx_package, "GENERATED_FROM", "%s:%s" % (recipe_ref.externalDocumentId, recipe.SPDXID))
+        package_doc.add_relationship(package_doc, "DESCRIBES", spdx_package)
+
+        package_archive = deploy_dir_spdx / "packages" / (package_doc.name + ".tar.zst")
+        with optional_tarfile(package_archive, archive_packaged) as archive:
+            package_files = add_package_files(
+                d,
+                package_doc,
+                spdx_package,
+                pkgdest / package,
+                lambda file_counter: oe.sbom.get_packaged_file_spdxid(pkg_name, file_counter),
+                lambda filepath: ["BINARY"],
+                archive=archive,
+            )
+
+            if archive is not None:
+                spdx_package.packageFileName = str(package_archive.name)
+
+        add_package_sources_from_debug(d, package_doc, spdx_package, package, package_files, sources)
+
+        oe.sbom.write_doc(d, package_doc, "packages")
+}
+# NOTE: depending on do_unpack is a hack that is necessary to get it's dependencies for archive the source
+addtask do_create_spdx after do_package do_packagedata do_unpack before do_build do_rm_work
+
+SSTATETASKS += "do_create_spdx"
+do_create_spdx[sstate-inputdirs] = "${SPDXDEPLOY}"
+do_create_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
+
+python do_create_spdx_setscene () {
+    sstate_setscene(d)
+}
+addtask do_create_spdx_setscene
+
+do_create_spdx[dirs] = "${SPDXDEPLOY} ${SPDXWORK}"
+do_create_spdx[cleandirs] = "${SPDXDEPLOY} ${SPDXWORK}"
+do_create_spdx[depends] += "${PATCHDEPENDENCY}"
+do_create_spdx[deptask] = "do_create_spdx"
+
+def spdx_get_src(d):
+    """
+    save patched source of the recipe in SPDX_WORKDIR.
+    """
+    import shutil
+    spdx_workdir = d.getVar('SPDXWORK')
+    spdx_sysroot_native = d.getVar('STAGING_DIR_NATIVE')
+    pn = d.getVar('PN')
+
+    workdir = d.getVar("WORKDIR")
+
+    try:
+        # The kernel class functions require it to be on work-shared, so we dont change WORKDIR
+        if not is_work_shared(d):
+            # Change the WORKDIR to make do_unpack do_patch run in another dir.
+            d.setVar('WORKDIR', spdx_workdir)
+            # Restore the original path to recipe's native sysroot (it's relative to WORKDIR).
+            d.setVar('STAGING_DIR_NATIVE', spdx_sysroot_native)
+
+            # The changed 'WORKDIR' also caused 'B' changed, create dir 'B' for the
+            # possibly requiring of the following tasks (such as some recipes's
+            # do_patch required 'B' existed).
+            bb.utils.mkdirhier(d.getVar('B'))
+
+            bb.build.exec_func('do_unpack', d)
+        # Copy source of kernel to spdx_workdir
+        if is_work_shared(d):
+            d.setVar('WORKDIR', spdx_workdir)
+            d.setVar('STAGING_DIR_NATIVE', spdx_sysroot_native)
+            src_dir = spdx_workdir + "/" + d.getVar('PN')+ "-" + d.getVar('PV') + "-" + d.getVar('PR')
+            bb.utils.mkdirhier(src_dir)
+            if bb.data.inherits_class('kernel',d):
+                share_src = d.getVar('STAGING_KERNEL_DIR')
+            cmd_copy_share = "cp -rf " + share_src + "/* " + src_dir + "/"
+            cmd_copy_kernel_result = os.popen(cmd_copy_share).read()
+            bb.note("cmd_copy_kernel_result = " + cmd_copy_kernel_result)
+
+            git_path = src_dir + "/.git"
+            if os.path.exists(git_path):
+                shutils.rmtree(git_path)
+
+        # Make sure gcc and kernel sources are patched only once
+        if not (d.getVar('SRC_URI') == "" or is_work_shared(d)):
+            bb.build.exec_func('do_patch', d)
+
+        # Some userland has no source.
+        if not os.path.exists( spdx_workdir ):
+            bb.utils.mkdirhier(spdx_workdir)
+    finally:
+        d.setVar("WORKDIR", workdir)
+
+do_rootfs[recrdeptask] += "do_create_spdx"
+
+ROOTFS_POSTUNINSTALL_COMMAND =+ "image_combine_spdx ; "
+python image_combine_spdx() {
+    import os
+    import oe.spdx
+    import oe.sbom
+    import io
+    import json
+    from oe.rootfs import image_list_installed_packages
+    from datetime import timezone, datetime
+    from pathlib import Path
+    import tarfile
+    import bb.compress.zstd
+
+    creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
+    image_name = d.getVar("IMAGE_NAME")
+    image_link_name = d.getVar("IMAGE_LINK_NAME")
+
+    deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
+    imgdeploydir = Path(d.getVar("IMGDEPLOYDIR"))
+    source_date_epoch = d.getVar("SOURCE_DATE_EPOCH")
+
+    doc = oe.spdx.SPDXDocument()
+    doc.name = image_name
+    doc.documentNamespace = get_doc_namespace(d, doc)
+    doc.creationInfo.created = creation_time
+    doc.creationInfo.comment = "This document was created by analyzing the source of the Yocto recipe during the build."
+    doc.creationInfo.creators.append("Tool: meta-doubleopen")
+    doc.creationInfo.creators.append("Organization: Double Open Project ()")
+    doc.creationInfo.creators.append("Person: N/A ()")
+
+    image = oe.spdx.SPDXPackage()
+    image.name = d.getVar("PN")
+    image.versionInfo = d.getVar("PV")
+    image.SPDXID = oe.sbom.get_image_spdxid(image_name)
+
+    doc.packages.append(image)
+
+    spdx_package = oe.spdx.SPDXPackage()
+
+    packages = image_list_installed_packages(d)
+
+    for name in sorted(packages.keys()):
+        pkg_spdx_path = deploy_dir_spdx / "packages" / (name + ".spdx.json")
+        pkg_doc, pkg_doc_sha1 = oe.sbom.read_doc(pkg_spdx_path)
+
+        for p in pkg_doc.packages:
+            if p.name == name:
+                pkg_ref = oe.spdx.SPDXExternalDocumentRef()
+                pkg_ref.externalDocumentId = "DocumentRef-%s" % pkg_doc.name
+                pkg_ref.spdxDocument = pkg_doc.documentNamespace
+                pkg_ref.checksum.algorithm = "SHA1"
+                pkg_ref.checksum.checksumValue = pkg_doc_sha1
+
+                doc.externalDocumentRefs.append(pkg_ref)
+                doc.add_relationship(image, "CONTAINS", "%s:%s" % (pkg_ref.externalDocumentId, p.SPDXID))
+                break
+        else:
+            bb.fatal("Unable to find package with name '%s' in SPDX file %s" % (name, pkg_spdx_path))
+
+    image_spdx_path = imgdeploydir / (image_name + ".spdx.json")
+
+    with image_spdx_path.open("wb") as f:
+        doc.to_json(f, sort_keys=True)
+
+    image_spdx_link = imgdeploydir / (image_link_name + ".spdx.json")
+    image_spdx_link.symlink_to(os.path.relpath(image_spdx_path, image_spdx_link.parent))
+
+    num_threads = int(d.getVar("BB_NUMBER_THREADS"))
+
+    visited_docs = set()
+
+    index = {"documents": []}
+
+    spdx_tar_path = imgdeploydir / (image_name + ".spdx.tar.zst")
+    with bb.compress.zstd.open(spdx_tar_path, "w", num_threads=num_threads) as f:
+        with tarfile.open(fileobj=f, mode="w|") as tar:
+            def collect_spdx_document(path):
+                nonlocal tar
+                nonlocal deploy_dir_spdx
+                nonlocal source_date_epoch
+                nonlocal index
+
+                if path in visited_docs:
+                    return
+
+                visited_docs.add(path)
+
+                with path.open("rb") as f:
+                    doc = oe.spdx.SPDXDocument.from_json(f)
+                    f.seek(0)
+
+                    if doc.documentNamespace in visited_docs:
+                        return
+
+                    bb.note("Adding SPDX document %s" % path)
+                    visited_docs.add(doc.documentNamespace)
+                    info = tar.gettarinfo(fileobj=f)
+
+                    info.name = doc.name + ".spdx.json"
+                    info.uid = 0
+                    info.gid = 0
+                    info.uname = "root"
+                    info.gname = "root"
+
+                    if source_date_epoch is not None and info.mtime > int(source_date_epoch):
+                        info.mtime = int(source_date_epoch)
+
+                    tar.addfile(info, f)
+
+                    index["documents"].append({
+                        "filename": info.name,
+                        "documentNamespace": doc.documentNamespace,
+                    })
+
+                for ref in doc.externalDocumentRefs:
+                    ref_path = deploy_dir_spdx / "by-namespace" / ref.spdxDocument.replace("/", "_")
+                    collect_spdx_document(ref_path)
+
+            collect_spdx_document(image_spdx_path)
+
+            index["documents"].sort(key=lambda x: x["filename"])
+
+            index_str = io.BytesIO(json.dumps(index, sort_keys=True).encode("utf-8"))
+
+            info = tarfile.TarInfo()
+            info.name = "index.json"
+            info.size = len(index_str.getvalue())
+            info.uid = 0
+            info.gid = 0
+            info.uname = "root"
+            info.gname = "root"
+
+            tar.addfile(info, fileobj=index_str)
+
+    spdx_tar_link = imgdeploydir / (image_link_name + ".spdx.tar.zst")
+    spdx_tar_link.symlink_to(os.path.relpath(spdx_tar_path, spdx_tar_link.parent))
+}
+
diff --git a/meta/lib/oe/sbom.py b/meta/lib/oe/sbom.py
new file mode 100644
index 0000000000..d40e5b792f
--- /dev/null
+++ b/meta/lib/oe/sbom.py
@@ -0,0 +1,63 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+import collections
+
+DepRecipe = collections.namedtuple("DepRecipe", ("doc", "doc_sha1", "recipe"))
+DepSource = collections.namedtuple("DepSource", ("doc", "doc_sha1", "recipe", "file"))
+
+
+def get_recipe_spdxid(d):
+    return "SPDXRef-%s-%s" % ("Recipe", d.getVar("PN"))
+
+
+def get_package_spdxid(pkg):
+    return "SPDXRef-Package-%s" % pkg
+
+
+def get_source_file_spdxid(d, idx):
+    return "SPDXRef-SourceFile-%s-%d" % (d.getVar("PN"), idx)
+
+
+def get_packaged_file_spdxid(pkg, idx):
+    return "SPDXRef-PackagedFile-%s-%d" % (pkg, idx)
+
+
+def get_image_spdxid(img):
+    return "SPDXRef-Image-%s" % img
+
+
+def write_doc(d, spdx_doc, subdir):
+    from pathlib import Path
+
+    spdx_deploy = Path(d.getVar("SPDXDEPLOY"))
+
+    dest = spdx_deploy / subdir / (spdx_doc.name + ".spdx.json")
+    dest.parent.mkdir(exist_ok=True, parents=True)
+    with dest.open("wb") as f:
+        doc_sha1 = spdx_doc.to_json(f, sort_keys=True)
+
+    l = spdx_deploy / "by-namespace" / spdx_doc.documentNamespace.replace("/", "_")
+    l.parent.mkdir(exist_ok=True, parents=True)
+    l.symlink_to(os.path.relpath(dest, l.parent))
+
+    return doc_sha1
+
+
+def read_doc(filename):
+    import hashlib
+    import oe.spdx
+
+    with filename.open("rb") as f:
+        sha1 = hashlib.sha1()
+        while True:
+            chunk = f.read(4096)
+            if not chunk:
+                break
+            sha1.update(chunk)
+
+        f.seek(0)
+        doc = oe.spdx.SPDXDocument.from_json(f)
+
+    return (doc, sha1.hexdigest())
diff --git a/meta/lib/oe/spdx.py b/meta/lib/oe/spdx.py
new file mode 100644
index 0000000000..3f569c6862
--- /dev/null
+++ b/meta/lib/oe/spdx.py
@@ -0,0 +1,263 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+import hashlib
+import itertools
+import json
+
+SPDX_VERSION = "2.2"
+
+
+class _Property(object):
+    def __init__(self, *, default=None):
+        self.default = default
+
+    def setdefault(self, dest, name):
+        if self.default is not None:
+            dest.setdefault(name, self.default)
+
+
+class _String(_Property):
+    def __init__(self, **kwargs):
+        super().__init__(**kwargs)
+
+    def set_property(self, attrs, name):
+        def get_helper(obj):
+            return obj._spdx[name]
+
+        def set_helper(obj, value):
+            obj._spdx[name] = value
+
+        def del_helper(obj):
+            del obj._spdx[name]
+
+        attrs[name] = property(get_helper, set_helper, del_helper)
+
+    def init(self, source):
+        return source
+
+
+class _Object(_Property):
+    def __init__(self, cls, **kwargs):
+        super().__init__(**kwargs)
+        self.cls = cls
+
+    def set_property(self, attrs, name):
+        def get_helper(obj):
+            if not name in obj._spdx:
+                obj._spdx[name] = self.cls()
+            return obj._spdx[name]
+
+        def set_helper(obj, value):
+            obj._spdx[name] = value
+
+        def del_helper(obj):
+            del obj._spdx[name]
+
+        attrs[name] = property(get_helper, set_helper)
+
+    def init(self, source):
+        return self.cls(**source)
+
+
+class _ListProperty(_Property):
+    def __init__(self, prop, **kwargs):
+        super().__init__(**kwargs)
+        self.prop = prop
+
+    def set_property(self, attrs, name):
+        def get_helper(obj):
+            if not name in obj._spdx:
+                obj._spdx[name] = []
+            return obj._spdx[name]
+
+        def del_helper(obj):
+            del obj._spdx[name]
+
+        attrs[name] = property(get_helper, None, del_helper)
+
+    def init(self, source):
+        return [self.prop.init(o) for o in source]
+
+
+class _StringList(_ListProperty):
+    def __init__(self, **kwargs):
+        super().__init__(_String(), **kwargs)
+
+
+class _ObjectList(_ListProperty):
+    def __init__(self, cls, **kwargs):
+        super().__init__(_Object(cls), **kwargs)
+
+
+class MetaSPDXObject(type):
+    def __new__(mcls, name, bases, attrs):
+        attrs["_properties"] = {}
+
+        for key in attrs.keys():
+            if isinstance(attrs[key], _Property):
+                prop = attrs[key]
+                attrs["_properties"][key] = prop
+                prop.set_property(attrs, key)
+
+        return super().__new__(mcls, name, bases, attrs)
+
+
+class SPDXObject(metaclass=MetaSPDXObject):
+    def __init__(self, **d):
+        self._spdx = {}
+
+        for name, prop in self._properties.items():
+            prop.setdefault(self._spdx, name)
+            if name in d:
+                self._spdx[name] = prop.init(d[name])
+
+    def serializer(self):
+        return self._spdx
+
+    def __setattr__(self, name, value):
+        if name in self._properties or name == "_spdx":
+            super().__setattr__(name, value)
+            return
+        raise KeyError("%r is not a valid SPDX property" % name)
+
+
+class SPDXChecksum(SPDXObject):
+    algorithm = _String()
+    checksumValue = _String()
+
+
+class SPDXRelationship(SPDXObject):
+    spdxElementId = _String()
+    relatedSpdxElement = _String()
+    relationshipType = _String()
+    comment = _String()
+
+
+class SPDXExternalReference(SPDXObject):
+    referenceCategory = _String()
+    referenceType = _String()
+    referenceLocator = _String()
+
+
+class SPDXPackageVerificationCode(SPDXObject):
+    packageVerificationCodeValue = _String()
+    packageVerificationCodeExcludedFiles = _StringList()
+
+
+class SPDXPackage(SPDXObject):
+    name = _String()
+    SPDXID = _String()
+    versionInfo = _String()
+    downloadLocation = _String(default="NOASSERTION")
+    packageSupplier = _String(default="NOASSERTION")
+    homepage = _String()
+    licenseConcluded = _String(default="NOASSERTION")
+    licenseDeclared = _String(default="NOASSERTION")
+    summary = _String()
+    description = _String()
+    sourceInfo = _String()
+    copyrightText = _String(default="NOASSERTION")
+    licenseInfoFromFiles = _StringList(default=["NOASSERTION"])
+    externalRefs = _ObjectList(SPDXExternalReference)
+    packageVerificationCode = _Object(SPDXPackageVerificationCode)
+    hasFiles = _StringList()
+    packageFileName = _String()
+
+
+class SPDXFile(SPDXObject):
+    SPDXID = _String()
+    fileName = _String()
+    licenseConcluded = _String(default="NOASSERTION")
+    copyrightText = _String(default="NOASSERTION")
+    licenseInfoInFiles = _StringList(default=["NOASSERTION"])
+    checksums = _ObjectList(SPDXChecksum)
+    fileTypes = _StringList()
+
+
+class SPDXCreationInfo(SPDXObject):
+    created = _String()
+    licenseListVersion = _String()
+    comment = _String()
+    creators = _StringList()
+
+
+class SPDXExternalDocumentRef(SPDXObject):
+    externalDocumentId = _String()
+    spdxDocument = _String()
+    checksum = _Object(SPDXChecksum)
+
+
+class SPDXDocument(SPDXObject):
+    spdxVersion = _String(default="SPDX-" + SPDX_VERSION)
+    dataLicense = _String(default="CC0-1.0")
+    SPDXID = _String(default="SPDXRef-DOCUMENT")
+    name = _String()
+    documentNamespace = _String()
+    creationInfo = _Object(SPDXCreationInfo)
+    packages = _ObjectList(SPDXPackage)
+    files = _ObjectList(SPDXFile)
+    relationships = _ObjectList(SPDXRelationship)
+    externalDocumentRefs = _ObjectList(SPDXExternalDocumentRef)
+
+    def __init__(self, **d):
+        super().__init__(**d)
+
+    def to_json(self, f, *, sort_keys=False, indent=None, separators=None):
+        class Encoder(json.JSONEncoder):
+            def default(self, o):
+                if isinstance(o, SPDXObject):
+                    return o.serializer()
+
+                return super().default(o)
+
+        sha1 = hashlib.sha1()
+        for chunk in Encoder(
+            sort_keys=sort_keys,
+            indent=indent,
+            separators=separators,
+        ).iterencode(self):
+            chunk = chunk.encode("utf-8")
+            f.write(chunk)
+            sha1.update(chunk)
+
+        return sha1.hexdigest()
+
+    @classmethod
+    def from_json(cls, f):
+        return cls(**json.load(f))
+
+    def add_relationship(self, _from, relationship, _to, *, comment=None):
+        if isinstance(_from, SPDXObject):
+            from_spdxid = _from.SPDXID
+        else:
+            from_spdxid = _from
+
+        if isinstance(_to, SPDXObject):
+            to_spdxid = _to.SPDXID
+        else:
+            to_spdxid = _to
+
+        r = SPDXRelationship(
+            spdxElementId=from_spdxid,
+            relatedSpdxElement=to_spdxid,
+            relationshipType=relationship,
+        )
+
+        if comment is not None:
+            r.comment = comment
+
+        self.relationships.append(r)
+
+    def find_by_spdxid(self, spdxid):
+        for o in itertools.chain(self.packages, self.files):
+            if o.SPDXID == spdxid:
+                return o
+        return None
+
+    def find_external_document_ref(self, namespace):
+        for r in self.externalDocumentRefs:
+            if r.spdxDocument == namespace:
+                return r
+        return None
-- 
2.32.0

