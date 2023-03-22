Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AEC2C6FD1F
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 20:46:16 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web10.56034.1679517974006145068
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 13:46:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hQCbAvQe;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id f19-20020a9d5f13000000b00693ce5a2f3eso11069081oti.8
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 13:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679517972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCrplWIlnhL6v+9DcM+1kFAJos1pYReMJNFgWst3ObU=;
        b=hQCbAvQe/OqwJrWTN17sR5tTuzDA297yZ97Nk9gDe4zfu+LHqFDMUTOEgVbtmoaNl1
         cVjwFy6tdv+xH3YiopqOa//YCk5PXUAdr4KXr+K4Ac8HglFS/fjIRNiZQfBCy/Ywr0lV
         GE7Lgk0V6t6qycvZgcbQvmtnqS1jPHCJtTpN2Wn/PYip2dGOqout/4mmTleyfTeGV/hs
         wNUlgSPX/ChQ3hCuQUyZONqV4y41ghOB+vDKPgy1blQviL6S4PuJRAX8yJilTvrwnQOM
         ZguKhehw5M8Nd6oy54+MEjfi8w4/bKRh0kDJ/yx7UTZDDnS0hpsBJ8qsCoWFzYTSU7e/
         gYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679517972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MCrplWIlnhL6v+9DcM+1kFAJos1pYReMJNFgWst3ObU=;
        b=GNOnnInZfKgg230FTmO38LO53TNfIzYQxjaFdSdEqaHlPMiCqRKxU9TdEKaKYT+dNZ
         vkLCCARM9USr2vcczyOxjNCCgbsX9nxqDGzrF4LVPZG62kqKTw0Tfgu0ajThoVl2zcuw
         OaBuzqcKTQXjkUEgAw1rWj+gkftvK2O+/FMpj+Hw9zHdfHzx1H19xEkw5inddm4OEmvk
         KvZRlk1ncgtExPXgxE5r5GrO977BHTciGkSdZhon4x6+oIICtPHlVKsjUSnITg8Rz4qw
         4h5TpMdGBuMSa07ns4xZsqyjwuaFY7TNYp77ihTOcgUyyP3WZwlZSCPjOckoBwrzVOFv
         myGw==
X-Gm-Message-State: AO0yUKUSx7mip+z90movobmGu7LmwxqPEZWR02vOKOiD8PJXq6aaRsBT
	hQSH8IEfUeO9gwvcUePjSDA+UcQK5jk=
X-Google-Smtp-Source: AK7set+/8oY6dCiEd+elFl9nw1bU9gU588Pt6e1jfKmIt/au1yMz3JrI/kVlYPy4MgCrkBAY5oAb+g==
X-Received: by 2002:a9d:734a:0:b0:68b:ba93:6c11 with SMTP id l10-20020a9d734a000000b0068bba936c11mr2058761otk.23.1679517969065;
        Wed, 22 Mar 2023 13:46:09 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id y21-20020a0568301d9500b0069f87d2ae09sm2288561oti.54.2023.03.22.13.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 13:46:08 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][dunfell][PATCH 1/5] classes/create-spdx: Backport
Date: Wed, 22 Mar 2023 15:45:54 -0500
Message-Id: <20230322204558.1386634-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230322204558.1386634-1-JPEWhacker@gmail.com>
References: <20230322204558.1386634-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 20:46:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178957

Backports the create-spdx classes from the latest versions on master.
This backport is a simple copy with no modifications, as its too
complex to cherry-pick all the corresponding changes. This will give an
appropriate base commit for subsequent changes and if necessary
additional backport cherry-picks from master in the future.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-2.2.bbclass | 1069 +++++
 meta/classes/create-spdx.bbclass     |    8 +
 meta/files/spdx-licenses.json        | 5937 ++++++++++++++++++++++++++
 meta/lib/oe/sbom.py                  |   84 +
 meta/lib/oe/spdx.py                  |  357 ++
 5 files changed, 7455 insertions(+)
 create mode 100644 meta/classes/create-spdx-2.2.bbclass
 create mode 100644 meta/classes/create-spdx.bbclass
 create mode 100644 meta/files/spdx-licenses.json
 create mode 100644 meta/lib/oe/sbom.py
 create mode 100644 meta/lib/oe/spdx.py

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
new file mode 100644
index 0000000000..13d13fe1fc
--- /dev/null
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -0,0 +1,1069 @@
+#
+# Copyright OpenEmbedded Contributors
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
+SPDXIMAGEWORK = "${SPDXDIR}/image-work"
+SPDXSDKWORK = "${SPDXDIR}/sdk-work"
+
+SPDX_TOOL_NAME ??= "oe-spdx-creator"
+SPDX_TOOL_VERSION ??= "1.0"
+
+SPDXRUNTIMEDEPLOY = "${SPDXDIR}/runtime-deploy"
+
+SPDX_INCLUDE_SOURCES ??= "0"
+SPDX_ARCHIVE_SOURCES ??= "0"
+SPDX_ARCHIVE_PACKAGED ??= "0"
+
+SPDX_UUID_NAMESPACE ??= "sbom.openembedded.org"
+SPDX_NAMESPACE_PREFIX ??= "http://spdx.org/spdxdoc"
+SPDX_PRETTY ??= "0"
+
+SPDX_LICENSES ??= "${COREBASE}/meta/files/spdx-licenses.json"
+
+SPDX_CUSTOM_ANNOTATION_VARS ??= ""
+
+SPDX_ORG ??= "OpenEmbedded ()"
+SPDX_SUPPLIER ??= "Organization: ${SPDX_ORG}"
+SPDX_SUPPLIER[doc] = "The SPDX PackageSupplier field for SPDX packages created from \
+    this recipe. For SPDX documents create using this class during the build, this \
+    is the contact information for the person or organization who is doing the \
+    build."
+
+def extract_licenses(filename):
+    import re
+
+    lic_regex = re.compile(rb'^\W*SPDX-License-Identifier:\s*([ \w\d.()+-]+?)(?:\s+\W*)?$', re.MULTILINE)
+
+    try:
+        with open(filename, 'rb') as f:
+            size = min(15000, os.stat(filename).st_size)
+            txt = f.read(size)
+            licenses = re.findall(lic_regex, txt)
+            if licenses:
+                ascii_licenses = [lic.decode('ascii') for lic in licenses]
+                return ascii_licenses
+    except Exception as e:
+        bb.warn(f"Exception reading {filename}: {e}")
+    return None
+
+def get_doc_namespace(d, doc):
+    import uuid
+    namespace_uuid = uuid.uuid5(uuid.NAMESPACE_DNS, d.getVar("SPDX_UUID_NAMESPACE"))
+    return "%s/%s-%s" % (d.getVar("SPDX_NAMESPACE_PREFIX"), doc.name, str(uuid.uuid5(namespace_uuid, doc.name)))
+
+def create_annotation(d, comment):
+    from datetime import datetime, timezone
+
+    creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
+    annotation = oe.spdx.SPDXAnnotation()
+    annotation.annotationDate = creation_time
+    annotation.annotationType = "OTHER"
+    annotation.annotator = "Tool: %s - %s" % (d.getVar("SPDX_TOOL_NAME"), d.getVar("SPDX_TOOL_VERSION"))
+    annotation.comment = comment
+    return annotation
+
+def recipe_spdx_is_native(d, recipe):
+    return any(a.annotationType == "OTHER" and
+      a.annotator == "Tool: %s - %s" % (d.getVar("SPDX_TOOL_NAME"), d.getVar("SPDX_TOOL_VERSION")) and
+      a.comment == "isNative" for a in recipe.annotations)
+
+def is_work_shared_spdx(d):
+    return bb.data.inherits_class('kernel', d) or ('work-shared' in d.getVar('WORKDIR'))
+
+def get_json_indent(d):
+    if d.getVar("SPDX_PRETTY") == "1":
+        return 2
+    return None
+
+python() {
+    import json
+    if d.getVar("SPDX_LICENSE_DATA"):
+        return
+
+    with open(d.getVar("SPDX_LICENSES"), "r") as f:
+        data = json.load(f)
+        # Transform the license array to a dictionary
+        data["licenses"] = {l["licenseId"]: l for l in data["licenses"]}
+        d.setVar("SPDX_LICENSE_DATA", data)
+}
+
+def convert_license_to_spdx(lic, document, d, existing={}):
+    from pathlib import Path
+    import oe.spdx
+
+    license_data = d.getVar("SPDX_LICENSE_DATA")
+    extracted = {}
+
+    def add_extracted_license(ident, name):
+        nonlocal document
+
+        if name in extracted:
+            return
+
+        extracted_info = oe.spdx.SPDXExtractedLicensingInfo()
+        extracted_info.name = name
+        extracted_info.licenseId = ident
+        extracted_info.extractedText = None
+
+        if name == "PD":
+            # Special-case this.
+            extracted_info.extractedText = "Software released to the public domain"
+        else:
+            # Seach for the license in COMMON_LICENSE_DIR and LICENSE_PATH
+            for directory in [d.getVar('COMMON_LICENSE_DIR')] + (d.getVar('LICENSE_PATH') or '').split():
+                try:
+                    with (Path(directory) / name).open(errors="replace") as f:
+                        extracted_info.extractedText = f.read()
+                        break
+                except FileNotFoundError:
+                    pass
+            if extracted_info.extractedText is None:
+                # If it's not SPDX or PD, then NO_GENERIC_LICENSE must be set
+                filename = d.getVarFlag('NO_GENERIC_LICENSE', name)
+                if filename:
+                    filename = d.expand("${S}/" + filename)
+                    with open(filename, errors="replace") as f:
+                        extracted_info.extractedText = f.read()
+                else:
+                    bb.error("Cannot find any text for license %s" % name)
+
+        extracted[name] = extracted_info
+        document.hasExtractedLicensingInfos.append(extracted_info)
+
+    def convert(l):
+        if l == "(" or l == ")":
+            return l
+
+        if l == "&":
+            return "AND"
+
+        if l == "|":
+            return "OR"
+
+        if l == "CLOSED":
+            return "NONE"
+
+        spdx_license = d.getVarFlag("SPDXLICENSEMAP", l) or l
+        if spdx_license in license_data["licenses"]:
+            return spdx_license
+
+        try:
+            spdx_license = existing[l]
+        except KeyError:
+            spdx_license = "LicenseRef-" + l
+            add_extracted_license(spdx_license, l)
+
+        return spdx_license
+
+    lic_split = lic.replace("(", " ( ").replace(")", " ) ").split()
+
+    return ' '.join(convert(l) for l in lic_split)
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
+    if source_date_epoch:
+        source_date_epoch = int(source_date_epoch)
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
+            if not filepath.is_symlink() and filepath.is_file():
+                spdx_file = oe.spdx.SPDXFile()
+                spdx_file.SPDXID = get_spdxid(file_counter)
+                for t in get_types(filepath):
+                    spdx_file.fileTypes.append(t)
+                spdx_file.fileName = filename
+
+                if archive is not None:
+                    with filepath.open("rb") as f:
+                        info = archive.gettarinfo(fileobj=f)
+                        info.name = filename
+                        info.uid = 0
+                        info.gid = 0
+                        info.uname = "root"
+                        info.gname = "root"
+
+                        if source_date_epoch is not None and info.mtime > source_date_epoch:
+                            info.mtime = source_date_epoch
+
+                        archive.addfile(info, f)
+
+                sha1 = bb.utils.sha1_file(filepath)
+                sha1s.append(sha1)
+                spdx_file.checksums.append(oe.spdx.SPDXChecksum(
+                        algorithm="SHA1",
+                        checksumValue=sha1,
+                    ))
+                spdx_file.checksums.append(oe.spdx.SPDXChecksum(
+                        algorithm="SHA256",
+                        checksumValue=bb.utils.sha256_file(filepath),
+                    ))
+
+                if "SOURCE" in spdx_file.fileTypes:
+                    extracted_lics = extract_licenses(filepath)
+                    if extracted_lics:
+                        spdx_file.licenseInfoInFiles = extracted_lics
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
+        Path(d.getVar('STAGING_KERNEL_DIR')),
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
+            ref_id = "NOASSERTION"
+            for search in debug_search_paths:
+                if debugsrc.startswith("/usr/src/kernel"):
+                    debugsrc_path = search / debugsrc.replace('/usr/src/kernel/', '')
+                else:
+                    debugsrc_path = search / debugsrc.lstrip("/")
+                if not debugsrc_path.exists():
+                    continue
+
+                file_sha256 = bb.utils.sha256_file(debugsrc_path)
+
+                if file_sha256 in sources:
+                    source_file = sources[file_sha256]
+
+                    doc_ref = package_doc.find_external_document_ref(source_file.doc.documentNamespace)
+                    if doc_ref is None:
+                        doc_ref = oe.spdx.SPDXExternalDocumentRef()
+                        doc_ref.externalDocumentId = "DocumentRef-dependency-" + source_file.doc.name
+                        doc_ref.spdxDocument = source_file.doc.documentNamespace
+                        doc_ref.checksum.algorithm = "SHA1"
+                        doc_ref.checksum.checksumValue = source_file.doc_sha1
+                        package_doc.externalDocumentRefs.append(doc_ref)
+
+                    ref_id = "%s:%s" % (doc_ref.externalDocumentId, source_file.file.SPDXID)
+                else:
+                    bb.debug(1, "Debug source %s with SHA256 %s not found in any dependency" % (str(debugsrc_path), file_sha256))
+                break
+            else:
+                bb.debug(1, "Debug source %s not found" % debugsrc)
+
+            package_doc.add_relationship(pkg_file, "GENERATED_FROM", ref_id, comment=debugsrc)
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
+collect_dep_recipes[vardeps] += "DEPENDS"
+
+def collect_dep_sources(d, dep_recipes):
+    import oe.sbom
+
+    sources = {}
+    for dep in dep_recipes:
+        # Don't collect sources from native recipes as they
+        # match non-native sources also.
+        if recipe_spdx_is_native(d, dep.recipe):
+            continue
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
+
+    deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
+    spdx_workdir = Path(d.getVar("SPDXWORK"))
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
+    doc.creationInfo.comment = "This document was created by analyzing recipe files during the build."
+    doc.creationInfo.licenseListVersion = d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"]
+    doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spdx.bbclass")
+    doc.creationInfo.creators.append("Organization: %s" % d.getVar("SPDX_ORG"))
+    doc.creationInfo.creators.append("Person: N/A ()")
+
+    recipe = oe.spdx.SPDXPackage()
+    recipe.name = d.getVar("PN")
+    recipe.versionInfo = d.getVar("PV")
+    recipe.SPDXID = oe.sbom.get_recipe_spdxid(d)
+    recipe.supplier = d.getVar("SPDX_SUPPLIER")
+    if bb.data.inherits_class("native", d) or bb.data.inherits_class("cross", d):
+        recipe.annotations.append(create_annotation(d, "isNative"))
+
+    homepage = d.getVar("HOMEPAGE")
+    if homepage:
+        recipe.homepage = homepage
+
+    license = d.getVar("LICENSE")
+    if license:
+        recipe.licenseDeclared = convert_license_to_spdx(license, doc, d)
+
+    summary = d.getVar("SUMMARY")
+    if summary:
+        recipe.summary = summary
+
+    description = d.getVar("DESCRIPTION")
+    if description:
+        recipe.description = description
+
+    if d.getVar("SPDX_CUSTOM_ANNOTATION_VARS"):
+        for var in d.getVar('SPDX_CUSTOM_ANNOTATION_VARS').split():
+            recipe.annotations.append(create_annotation(d, var + "=" + d.getVar(var)))
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
+    add_download_packages(d, doc, recipe)
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
+    doc_sha1 = oe.sbom.write_doc(d, doc, "recipes", indent=get_json_indent(d))
+    dep_recipes.append(oe.sbom.DepRecipe(doc, doc_sha1, recipe))
+
+    recipe_ref = oe.spdx.SPDXExternalDocumentRef()
+    recipe_ref.externalDocumentId = "DocumentRef-recipe-" + recipe.name
+    recipe_ref.spdxDocument = doc.documentNamespace
+    recipe_ref.checksum.algorithm = "SHA1"
+    recipe_ref.checksum.checksumValue = doc_sha1
+
+    sources = collect_dep_sources(d, dep_recipes)
+    found_licenses = {license.name:recipe_ref.externalDocumentId + ":" + license.licenseId for license in doc.hasExtractedLicensingInfos}
+
+    if not recipe_spdx_is_native(d, recipe):
+        bb.build.exec_func("read_subpackage_metadata", d)
+
+        pkgdest = Path(d.getVar("PKGDEST"))
+        for package in d.getVar("PACKAGES").split():
+            if not oe.packagedata.packaged(package, d):
+                continue
+
+            package_doc = oe.spdx.SPDXDocument()
+            pkg_name = d.getVar("PKG:%s" % package) or package
+            package_doc.name = pkg_name
+            package_doc.documentNamespace = get_doc_namespace(d, package_doc)
+            package_doc.creationInfo.created = creation_time
+            package_doc.creationInfo.comment = "This document was created by analyzing packages created during the build."
+            package_doc.creationInfo.licenseListVersion = d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"]
+            package_doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spdx.bbclass")
+            package_doc.creationInfo.creators.append("Organization: %s" % d.getVar("SPDX_ORG"))
+            package_doc.creationInfo.creators.append("Person: N/A ()")
+            package_doc.externalDocumentRefs.append(recipe_ref)
+
+            package_license = d.getVar("LICENSE:%s" % package) or d.getVar("LICENSE")
+
+            spdx_package = oe.spdx.SPDXPackage()
+
+            spdx_package.SPDXID = oe.sbom.get_package_spdxid(pkg_name)
+            spdx_package.name = pkg_name
+            spdx_package.versionInfo = d.getVar("PV")
+            spdx_package.licenseDeclared = convert_license_to_spdx(package_license, package_doc, d, found_licenses)
+            spdx_package.supplier = d.getVar("SPDX_SUPPLIER")
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
+                    ignore_top_level_dirs=['CONTROL', 'DEBIAN'],
+                    archive=archive,
+                )
+
+                if archive is not None:
+                    spdx_package.packageFileName = str(package_archive.name)
+
+            add_package_sources_from_debug(d, package_doc, spdx_package, package, package_files, sources)
+
+            oe.sbom.write_doc(d, package_doc, "packages", indent=get_json_indent(d))
+}
+# NOTE: depending on do_unpack is a hack that is necessary to get it's dependencies for archive the source
+addtask do_create_spdx after do_package do_packagedata do_unpack before do_populate_sdk do_build do_rm_work
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
+do_create_spdx[dirs] = "${SPDXWORK}"
+do_create_spdx[cleandirs] = "${SPDXDEPLOY} ${SPDXWORK}"
+do_create_spdx[depends] += "${PATCHDEPENDENCY}"
+do_create_spdx[deptask] = "do_create_spdx"
+
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
+        dep[0] for dep in taskdepdata.values() if dep[0] != d.getVar("PN")
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
+    is_native = bb.data.inherits_class("native", d) or bb.data.inherits_class("cross", d)
+
+    creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
+
+    providers = collect_package_providers(d)
+
+    if not is_native:
+        bb.build.exec_func("read_subpackage_metadata", d)
+
+        dep_package_cache = {}
+
+        pkgdest = Path(d.getVar("PKGDEST"))
+        for package in d.getVar("PACKAGES").split():
+            localdata = bb.data.createCopy(d)
+            pkg_name = d.getVar("PKG:%s" % package) or package
+            localdata.setVar("PKG", pkg_name)
+            localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False) + ":" + package)
+
+            if not oe.packagedata.packaged(package, localdata):
+                continue
+
+            pkg_spdx_path = deploy_dir_spdx / "packages" / (pkg_name + ".spdx.json")
+
+            package_doc, package_doc_sha1 = oe.sbom.read_doc(pkg_spdx_path)
+
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
+            runtime_doc.creationInfo.creators.append("Organization: %s" % d.getVar("SPDX_ORG"))
+            runtime_doc.creationInfo.creators.append("Person: N/A ()")
+
+            package_ref = oe.spdx.SPDXExternalDocumentRef()
+            package_ref.externalDocumentId = "DocumentRef-package-" + package
+            package_ref.spdxDocument = package_doc.documentNamespace
+            package_ref.checksum.algorithm = "SHA1"
+            package_ref.checksum.checksumValue = package_doc_sha1
+
+            runtime_doc.externalDocumentRefs.append(package_ref)
+
+            runtime_doc.add_relationship(
+                runtime_doc.SPDXID,
+                "AMENDS",
+                "%s:%s" % (package_ref.externalDocumentId, package_doc.SPDXID)
+            )
+
+            deps = bb.utils.explode_dep_versions2(localdata.getVar("RDEPENDS") or "")
+            seen_deps = set()
+            for dep, _ in deps.items():
+                if dep in seen_deps:
+                    continue
+
+                if dep not in providers:
+                    continue
+
+                dep = providers[dep]
+
+                if not oe.packagedata.packaged(dep, localdata):
+                    continue
+
+                dep_pkg_data = oe.packagedata.read_subpkgdata_dict(dep, d)
+                dep_pkg = dep_pkg_data["PKG"]
+
+                if dep in dep_package_cache:
+                    (dep_spdx_package, dep_package_ref) = dep_package_cache[dep]
+                else:
+                    dep_path = deploy_dir_spdx / "packages" / ("%s.spdx.json" % dep_pkg)
+
+                    spdx_dep_doc, spdx_dep_sha1 = oe.sbom.read_doc(dep_path)
+
+                    for pkg in spdx_dep_doc.packages:
+                        if pkg.name == dep_pkg:
+                            dep_spdx_package = pkg
+                            break
+                    else:
+                        bb.fatal("Package '%s' not found in %s" % (dep_pkg, dep_path))
+
+                    dep_package_ref = oe.spdx.SPDXExternalDocumentRef()
+                    dep_package_ref.externalDocumentId = "DocumentRef-runtime-dependency-" + spdx_dep_doc.name
+                    dep_package_ref.spdxDocument = spdx_dep_doc.documentNamespace
+                    dep_package_ref.checksum.algorithm = "SHA1"
+                    dep_package_ref.checksum.checksumValue = spdx_dep_sha1
+
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
+
+            oe.sbom.write_doc(d, runtime_doc, "runtime", spdx_deploy, indent=get_json_indent(d))
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
+        if not is_work_shared_spdx(d):
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
+        if is_work_shared_spdx(d):
+            share_src = d.getVar('WORKDIR')
+            d.setVar('WORKDIR', spdx_workdir)
+            d.setVar('STAGING_DIR_NATIVE', spdx_sysroot_native)
+            src_dir = spdx_workdir + "/" + d.getVar('PN')+ "-" + d.getVar('PV') + "-" + d.getVar('PR')
+            bb.utils.mkdirhier(src_dir)
+            if bb.data.inherits_class('kernel',d):
+                share_src = d.getVar('STAGING_KERNEL_DIR')
+            cmd_copy_share = "cp -rf " + share_src + "/* " + src_dir + "/"
+            cmd_copy_shared_res = os.popen(cmd_copy_share).read()
+            bb.note("cmd_copy_shared_result = " + cmd_copy_shared_res)
+
+            git_path = src_dir + "/.git"
+            if os.path.exists(git_path):
+                shutils.rmtree(git_path)
+
+        # Make sure gcc and kernel sources are patched only once
+        if not (d.getVar('SRC_URI') == "" or is_work_shared_spdx(d)):
+            bb.build.exec_func('do_patch', d)
+
+        # Some userland has no source.
+        if not os.path.exists( spdx_workdir ):
+            bb.utils.mkdirhier(spdx_workdir)
+    finally:
+        d.setVar("WORKDIR", workdir)
+
+do_rootfs[recrdeptask] += "do_create_spdx do_create_runtime_spdx"
+do_rootfs[cleandirs] += "${SPDXIMAGEWORK}"
+
+ROOTFS_POSTUNINSTALL_COMMAND =+ "image_combine_spdx ; "
+
+do_populate_sdk[recrdeptask] += "do_create_spdx do_create_runtime_spdx"
+do_populate_sdk[cleandirs] += "${SPDXSDKWORK}"
+POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk = " sdk_host_combine_spdx; "
+POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk = " sdk_target_combine_spdx; "
+
+python image_combine_spdx() {
+    import os
+    import oe.sbom
+    from pathlib import Path
+    from oe.rootfs import image_list_installed_packages
+
+    image_name = d.getVar("IMAGE_NAME")
+    image_link_name = d.getVar("IMAGE_LINK_NAME")
+    imgdeploydir = Path(d.getVar("IMGDEPLOYDIR"))
+    img_spdxid = oe.sbom.get_image_spdxid(image_name)
+    packages = image_list_installed_packages(d)
+
+    combine_spdx(d, image_name, imgdeploydir, img_spdxid, packages, Path(d.getVar("SPDXIMAGEWORK")))
+
+    def make_image_link(target_path, suffix):
+        if image_link_name:
+            link = imgdeploydir / (image_link_name + suffix)
+            if link != target_path:
+                link.symlink_to(os.path.relpath(target_path, link.parent))
+
+    spdx_tar_path = imgdeploydir / (image_name + ".spdx.tar.zst")
+    make_image_link(spdx_tar_path, ".spdx.tar.zst")
+}
+
+python sdk_host_combine_spdx() {
+    sdk_combine_spdx(d, "host")
+}
+
+python sdk_target_combine_spdx() {
+    sdk_combine_spdx(d, "target")
+}
+
+def sdk_combine_spdx(d, sdk_type):
+    import oe.sbom
+    from pathlib import Path
+    from oe.sdk import sdk_list_installed_packages
+
+    sdk_name = d.getVar("SDK_NAME") + "-" + sdk_type
+    sdk_deploydir = Path(d.getVar("SDKDEPLOYDIR"))
+    sdk_spdxid = oe.sbom.get_sdk_spdxid(sdk_name)
+    sdk_packages = sdk_list_installed_packages(d, sdk_type == "target")
+    combine_spdx(d, sdk_name, sdk_deploydir, sdk_spdxid, sdk_packages, Path(d.getVar('SPDXSDKWORK')))
+
+def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx_workdir):
+    import os
+    import oe.spdx
+    import oe.sbom
+    import io
+    import json
+    from datetime import timezone, datetime
+    from pathlib import Path
+    import tarfile
+    import bb.compress.zstd
+
+    creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
+    deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
+    source_date_epoch = d.getVar("SOURCE_DATE_EPOCH")
+
+    doc = oe.spdx.SPDXDocument()
+    doc.name = rootfs_name
+    doc.documentNamespace = get_doc_namespace(d, doc)
+    doc.creationInfo.created = creation_time
+    doc.creationInfo.comment = "This document was created by analyzing the source of the Yocto recipe during the build."
+    doc.creationInfo.licenseListVersion = d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"]
+    doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spdx.bbclass")
+    doc.creationInfo.creators.append("Organization: %s" % d.getVar("SPDX_ORG"))
+    doc.creationInfo.creators.append("Person: N/A ()")
+
+    image = oe.spdx.SPDXPackage()
+    image.name = d.getVar("PN")
+    image.versionInfo = d.getVar("PV")
+    image.SPDXID = rootfs_spdxid
+    image.supplier = d.getVar("SPDX_SUPPLIER")
+
+    doc.packages.append(image)
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
+    image_spdx_path = spdx_workdir / (rootfs_name + ".spdx.json")
+
+    with image_spdx_path.open("wb") as f:
+        doc.to_json(f, sort_keys=True, indent=get_json_indent(d))
+
+    num_threads = int(d.getVar("BB_NUMBER_THREADS"))
+
+    visited_docs = set()
+
+    index = {"documents": []}
+
+    spdx_tar_path = rootfs_deploydir / (rootfs_name + ".spdx.tar.zst")
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
+                    doc, sha1 = oe.sbom.read_doc(f)
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
+                        "sha1": sha1,
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
+            index_str = io.BytesIO(json.dumps(
+                index,
+                sort_keys=True,
+                indent=get_json_indent(d),
+            ).encode("utf-8"))
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
diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
new file mode 100644
index 0000000000..19c6c0ff0b
--- /dev/null
+++ b/meta/classes/create-spdx.bbclass
@@ -0,0 +1,8 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Include this class when you don't care what version of SPDX you get; it will
+# be updated to the latest stable version that is supported
+inherit create-spdx-2.2
diff --git a/meta/files/spdx-licenses.json b/meta/files/spdx-licenses.json
new file mode 100644
index 0000000000..ef926164ec
--- /dev/null
+++ b/meta/files/spdx-licenses.json
@@ -0,0 +1,5937 @@
+{
+  "licenseListVersion": "3.14",
+  "licenses": [
+    {
+      "reference": "https://spdx.org/licenses/GPL-1.0.html",
+      "isDeprecatedLicenseId": true,
+      "detailsUrl": "https://spdx.org/licenses/GPL-1.0.json",
+      "referenceNumber": 0,
+      "name": "GNU General Public License v1.0 only",
+      "licenseId": "GPL-1.0",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/gpl-1.0-standalone.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/bzip2-1.0.6.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/bzip2-1.0.6.json",
+      "referenceNumber": 1,
+      "name": "bzip2 and libbzip2 License v1.0.6",
+      "licenseId": "bzip2-1.0.6",
+      "seeAlso": [
+        "https://sourceware.org/git/?p\u003dbzip2.git;a\u003dblob;f\u003dLICENSE;hb\u003dbzip2-1.0.6",
+        "http://bzip.org/1.0.5/bzip2-manual-1.0.5.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Intel-ACPI.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Intel-ACPI.json",
+      "referenceNumber": 2,
+      "name": "Intel ACPI Software License Agreement",
+      "licenseId": "Intel-ACPI",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Intel_ACPI_Software_License_Agreement"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/XSkat.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/XSkat.json",
+      "referenceNumber": 3,
+      "name": "XSkat License",
+      "licenseId": "XSkat",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/XSkat_License"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-2.0.json",
+      "referenceNumber": 4,
+      "name": "Creative Commons Attribution Non Commercial Share Alike 2.0 Generic",
+      "licenseId": "CC-BY-NC-SA-2.0",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-nc-sa/2.0/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Plexus.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Plexus.json",
+      "referenceNumber": 5,
+      "name": "Plexus Classworlds License",
+      "licenseId": "Plexus",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Plexus_Classworlds_License"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Giftware.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Giftware.json",
+      "referenceNumber": 6,
+      "name": "Giftware License",
+      "licenseId": "Giftware",
+      "seeAlso": [
+        "http://liballeg.org/license.html#allegro-4-the-giftware-license"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/BitTorrent-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/BitTorrent-1.0.json",
+      "referenceNumber": 7,
+      "name": "BitTorrent Open Source License v1.0",
+      "licenseId": "BitTorrent-1.0",
+      "seeAlso": [
+        "http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/licenses/BitTorrent?r1\u003d1.1\u0026r2\u003d1.1.1.1\u0026diff_format\u003ds"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/APSL-1.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/APSL-1.1.json",
+      "referenceNumber": 8,
+      "name": "Apple Public Source License 1.1",
+      "licenseId": "APSL-1.1",
+      "seeAlso": [
+        "http://www.opensource.apple.com/source/IOSerialFamily/IOSerialFamily-7/APPLE_LICENSE"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/GPL-2.0-with-GCC-exception.html",
+      "isDeprecatedLicenseId": true,
+      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-with-GCC-exception.json",
+      "referenceNumber": 9,
+      "name": "GNU General Public License v2.0 w/GCC Runtime Library exception",
+      "licenseId": "GPL-2.0-with-GCC-exception",
+      "seeAlso": [
+        "https://gcc.gnu.org/git/?p\u003dgcc.git;a\u003dblob;f\u003dgcc/libgcc1.c;h\u003d762f5143fc6eed57b6797c82710f3538aa52b40b;hb\u003dcb143a3ce4fb417c68f5fa2691a1b1b1053dfba9#l10"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/UPL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/UPL-1.0.json",
+      "referenceNumber": 10,
+      "name": "Universal Permissive License v1.0",
+      "licenseId": "UPL-1.0",
+      "seeAlso": [
+        "https://opensource.org/licenses/UPL"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/wxWindows.html",
+      "isDeprecatedLicenseId": true,
+      "detailsUrl": "https://spdx.org/licenses/wxWindows.json",
+      "referenceNumber": 11,
+      "name": "wxWindows Library License",
+      "licenseId": "wxWindows",
+      "seeAlso": [
+        "https://opensource.org/licenses/WXwindows"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Caldera.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Caldera.json",
+      "referenceNumber": 12,
+      "name": "Caldera License",
+      "licenseId": "Caldera",
+      "seeAlso": [
+        "http://www.lemis.com/grog/UNIX/ancient-source-all.pdf"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Zend-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Zend-2.0.json",
+      "referenceNumber": 13,
+      "name": "Zend License v2.0",
+      "licenseId": "Zend-2.0",
+      "seeAlso": [
+        "https://web.archive.org/web/20130517195954/http://www.zend.com/license/2_00.txt"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/CUA-OPL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CUA-OPL-1.0.json",
+      "referenceNumber": 14,
+      "name": "CUA Office Public License v1.0",
+      "licenseId": "CUA-OPL-1.0",
+      "seeAlso": [
+        "https://opensource.org/licenses/CUA-OPL-1.0"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/JPNIC.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/JPNIC.json",
+      "referenceNumber": 15,
+      "name": "Japan Network Information Center License",
+      "licenseId": "JPNIC",
+      "seeAlso": [
+        "https://gitlab.isc.org/isc-projects/bind9/blob/master/COPYRIGHT#L366"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/SAX-PD.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/SAX-PD.json",
+      "referenceNumber": 16,
+      "name": "Sax Public Domain Notice",
+      "licenseId": "SAX-PD",
+      "seeAlso": [
+        "http://www.saxproject.org/copying.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-ND-2.5.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-2.5.json",
+      "referenceNumber": 17,
+      "name": "Creative Commons Attribution No Derivatives 2.5 Generic",
+      "licenseId": "CC-BY-ND-2.5",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-nd/2.5/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/eGenix.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/eGenix.json",
+      "referenceNumber": 18,
+      "name": "eGenix.com Public License 1.1.0",
+      "licenseId": "eGenix",
+      "seeAlso": [
+        "http://www.egenix.com/products/eGenix.com-Public-License-1.1.0.pdf",
+        "https://fedoraproject.org/wiki/Licensing/eGenix.com_Public_License_1.1.0"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/LGPLLR.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/LGPLLR.json",
+      "referenceNumber": 19,
+      "name": "Lesser General Public License For Linguistic Resources",
+      "licenseId": "LGPLLR",
+      "seeAlso": [
+        "http://www-igm.univ-mlv.fr/~unitex/lgpllr.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/OLDAP-2.2.2.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.2.2.json",
+      "referenceNumber": 20,
+      "name": "Open LDAP Public License 2.2.2",
+      "licenseId": "OLDAP-2.2.2",
+      "seeAlso": [
+        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\u003dblob;f\u003dLICENSE;hb\u003ddf2cc1e21eb7c160695f5b7cffd6296c151ba188"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-ND-3.0-DE.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-3.0-DE.json",
+      "referenceNumber": 21,
+      "name": "Creative Commons Attribution No Derivatives 3.0 Germany",
+      "licenseId": "CC-BY-ND-3.0-DE",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-nd/3.0/de/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/IPA.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/IPA.json",
+      "referenceNumber": 22,
+      "name": "IPA Font License",
+      "licenseId": "IPA",
+      "seeAlso": [
+        "https://opensource.org/licenses/IPA"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/NCSA.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/NCSA.json",
+      "referenceNumber": 23,
+      "name": "University of Illinois/NCSA Open Source License",
+      "licenseId": "NCSA",
+      "seeAlso": [
+        "http://otm.illinois.edu/uiuc_openSource",
+        "https://opensource.org/licenses/NCSA"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/W3C.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/W3C.json",
+      "referenceNumber": 24,
+      "name": "W3C Software Notice and License (2002-12-31)",
+      "licenseId": "W3C",
+      "seeAlso": [
+        "http://www.w3.org/Consortium/Legal/2002/copyright-software-20021231.html",
+        "https://opensource.org/licenses/W3C"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/Adobe-2006.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Adobe-2006.json",
+      "referenceNumber": 25,
+      "name": "Adobe Systems Incorporated Source Code License Agreement",
+      "licenseId": "Adobe-2006",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/AdobeLicense"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Net-SNMP.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Net-SNMP.json",
+      "referenceNumber": 26,
+      "name": "Net-SNMP License",
+      "licenseId": "Net-SNMP",
+      "seeAlso": [
+        "http://net-snmp.sourceforge.net/about/license.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-SA-4.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-4.0.json",
+      "referenceNumber": 27,
+      "name": "Creative Commons Attribution Share Alike 4.0 International",
+      "licenseId": "CC-BY-SA-4.0",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-sa/4.0/legalcode"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/YPL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/YPL-1.0.json",
+      "referenceNumber": 28,
+      "name": "Yahoo! Public License v1.0",
+      "licenseId": "YPL-1.0",
+      "seeAlso": [
+        "http://www.zimbra.com/license/yahoo_public_license_1.0.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Nunit.html",
+      "isDeprecatedLicenseId": true,
+      "detailsUrl": "https://spdx.org/licenses/Nunit.json",
+      "referenceNumber": 29,
+      "name": "Nunit License",
+      "licenseId": "Nunit",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Nunit"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/MITNFA.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/MITNFA.json",
+      "referenceNumber": 30,
+      "name": "MIT +no-false-attribs license",
+      "licenseId": "MITNFA",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/MITNFA"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/PHP-3.01.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/PHP-3.01.json",
+      "referenceNumber": 31,
+      "name": "PHP License v3.01",
+      "licenseId": "PHP-3.01",
+      "seeAlso": [
+        "http://www.php.net/license/3_01.txt"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/BSD-Source-Code.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/BSD-Source-Code.json",
+      "referenceNumber": 32,
+      "name": "BSD Source Code Attribution",
+      "licenseId": "BSD-Source-Code",
+      "seeAlso": [
+        "https://github.com/robbiehanson/CocoaHTTPServer/blob/master/LICENSE.txt"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-SA-2.5.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-2.5.json",
+      "referenceNumber": 33,
+      "name": "Creative Commons Attribution Share Alike 2.5 Generic",
+      "licenseId": "CC-BY-SA-2.5",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-sa/2.5/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Motosoto.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Motosoto.json",
+      "referenceNumber": 34,
+      "name": "Motosoto License",
+      "licenseId": "Motosoto",
+      "seeAlso": [
+        "https://opensource.org/licenses/Motosoto"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/OSL-1.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OSL-1.1.json",
+      "referenceNumber": 35,
+      "name": "Open Software License 1.1",
+      "licenseId": "OSL-1.1",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/OSL1.1"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/NGPL.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/NGPL.json",
+      "referenceNumber": 36,
+      "name": "Nethack General Public License",
+      "licenseId": "NGPL",
+      "seeAlso": [
+        "https://opensource.org/licenses/NGPL"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-2.5-AU.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-2.5-AU.json",
+      "referenceNumber": 37,
+      "name": "Creative Commons Attribution 2.5 Australia",
+      "licenseId": "CC-BY-2.5-AU",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by/2.5/au/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Unicode-TOU.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Unicode-TOU.json",
+      "referenceNumber": 38,
+      "name": "Unicode Terms of Use",
+      "licenseId": "Unicode-TOU",
+      "seeAlso": [
+        "http://www.unicode.org/copyright.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-License.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-License.json",
+      "referenceNumber": 39,
+      "name": "BSD 3-Clause No Nuclear License",
+      "licenseId": "BSD-3-Clause-No-Nuclear-License",
+      "seeAlso": [
+        "http://download.oracle.com/otn-pub/java/licenses/bsd.txt?AuthParam\u003d1467140197_43d516ce1776bd08a58235a7785be1cc"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/OPUBL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OPUBL-1.0.json",
+      "referenceNumber": 40,
+      "name": "Open Publication License v1.0",
+      "licenseId": "OPUBL-1.0",
+      "seeAlso": [
+        "http://opencontent.org/openpub/",
+        "https://www.debian.org/opl",
+        "https://www.ctan.org/license/opl"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.0-UK.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-2.0-UK.json",
+      "referenceNumber": 41,
+      "name": "Creative Commons Attribution Non Commercial Share Alike 2.0 England and Wales",
+      "licenseId": "CC-BY-NC-SA-2.0-UK",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-nc-sa/2.0/uk/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/NLOD-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/NLOD-2.0.json",
+      "referenceNumber": 42,
+      "name": "Norwegian Licence for Open Government Data (NLOD) 2.0",
+      "licenseId": "NLOD-2.0",
+      "seeAlso": [
+        "http://data.norge.no/nlod/en/2.0"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/gnuplot.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/gnuplot.json",
+      "referenceNumber": 43,
+      "name": "gnuplot License",
+      "licenseId": "gnuplot",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Gnuplot"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/EPICS.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/EPICS.json",
+      "referenceNumber": 44,
+      "name": "EPICS Open License",
+      "licenseId": "EPICS",
+      "seeAlso": [
+        "https://epics.anl.gov/license/open.php"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Info-ZIP.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Info-ZIP.json",
+      "referenceNumber": 45,
+      "name": "Info-ZIP License",
+      "licenseId": "Info-ZIP",
+      "seeAlso": [
+        "http://www.info-zip.org/license.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/OLDAP-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.0.json",
+      "referenceNumber": 46,
+      "name": "Open LDAP Public License v2.0 (or possibly 2.0A and 2.0B)",
+      "licenseId": "OLDAP-2.0",
+      "seeAlso": [
+        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\u003dblob;f\u003dLICENSE;hb\u003dcbf50f4e1185a21abd4c0a54d3f4341fe28f36ea"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CERN-OHL-P-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CERN-OHL-P-2.0.json",
+      "referenceNumber": 47,
+      "name": "CERN Open Hardware Licence Version 2 - Permissive",
+      "licenseId": "CERN-OHL-P-2.0",
+      "seeAlso": [
+        "https://www.ohwr.org/project/cernohl/wikis/Documents/CERN-OHL-version-2"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-Warranty.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-Warranty.json",
+      "referenceNumber": 48,
+      "name": "BSD 3-Clause No Nuclear Warranty",
+      "licenseId": "BSD-3-Clause-No-Nuclear-Warranty",
+      "seeAlso": [
+        "https://jogamp.org/git/?p\u003dgluegen.git;a\u003dblob_plain;f\u003dLICENSE.txt"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/AML.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/AML.json",
+      "referenceNumber": 49,
+      "name": "Apple MIT License",
+      "licenseId": "AML",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Apple_MIT_License"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/MulanPSL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/MulanPSL-1.0.json",
+      "referenceNumber": 50,
+      "name": "Mulan Permissive Software License, Version 1",
+      "licenseId": "MulanPSL-1.0",
+      "seeAlso": [
+        "https://license.coscl.org.cn/MulanPSL/",
+        "https://github.com/yuwenlong/longphp/blob/25dfb70cc2a466dc4bb55ba30901cbce08d164b5/LICENSE"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Multics.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Multics.json",
+      "referenceNumber": 51,
+      "name": "Multics License",
+      "licenseId": "Multics",
+      "seeAlso": [
+        "https://opensource.org/licenses/Multics"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/VSL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/VSL-1.0.json",
+      "referenceNumber": 52,
+      "name": "Vovida Software License v1.0",
+      "licenseId": "VSL-1.0",
+      "seeAlso": [
+        "https://opensource.org/licenses/VSL-1.0"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/RSA-MD.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/RSA-MD.json",
+      "referenceNumber": 53,
+      "name": "RSA Message-Digest License",
+      "licenseId": "RSA-MD",
+      "seeAlso": [
+        "http://www.faqs.org/rfcs/rfc1321.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-PDDC.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-PDDC.json",
+      "referenceNumber": 54,
+      "name": "Creative Commons Public Domain Dedication and Certification",
+      "licenseId": "CC-PDDC",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/publicdomain/"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-SA-2.1-JP.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-2.1-JP.json",
+      "referenceNumber": 55,
+      "name": "Creative Commons Attribution Share Alike 2.1 Japan",
+      "licenseId": "CC-BY-SA-2.1-JP",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-sa/2.1/jp/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/LPPL-1.2.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/LPPL-1.2.json",
+      "referenceNumber": 56,
+      "name": "LaTeX Project Public License v1.2",
+      "licenseId": "LPPL-1.2",
+      "seeAlso": [
+        "http://www.latex-project.org/lppl/lppl-1-2.txt"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/Spencer-94.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Spencer-94.json",
+      "referenceNumber": 57,
+      "name": "Spencer License 94",
+      "licenseId": "Spencer-94",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Henry_Spencer_Reg-Ex_Library_License"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/OLDAP-1.2.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-1.2.json",
+      "referenceNumber": 58,
+      "name": "Open LDAP Public License v1.2",
+      "licenseId": "OLDAP-1.2",
+      "seeAlso": [
+        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\u003dblob;f\u003dLICENSE;hb\u003d42b0383c50c299977b5893ee695cf4e486fb0dc7"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/O-UDA-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/O-UDA-1.0.json",
+      "referenceNumber": 59,
+      "name": "Open Use of Data Agreement v1.0",
+      "licenseId": "O-UDA-1.0",
+      "seeAlso": [
+        "https://github.com/microsoft/Open-Use-of-Data-Agreement/blob/v1.0/O-UDA-1.0.md",
+        "https://cdla.dev/open-use-of-data-agreement-v1-0/"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/OLDAP-2.7.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.7.json",
+      "referenceNumber": 60,
+      "name": "Open LDAP Public License v2.7",
+      "licenseId": "OLDAP-2.7",
+      "seeAlso": [
+        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\u003dblob;f\u003dLICENSE;hb\u003d47c2415c1df81556eeb39be6cad458ef87c534a2"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/Glulxe.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Glulxe.json",
+      "referenceNumber": 61,
+      "name": "Glulxe License",
+      "licenseId": "Glulxe",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Glulxe"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/iMatix.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/iMatix.json",
+      "referenceNumber": 62,
+      "name": "iMatix Standard Function Library Agreement",
+      "licenseId": "iMatix",
+      "seeAlso": [
+        "http://legacy.imatix.com/html/sfl/sfl4.htm#license"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/TAPR-OHL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/TAPR-OHL-1.0.json",
+      "referenceNumber": 63,
+      "name": "TAPR Open Hardware License v1.0",
+      "licenseId": "TAPR-OHL-1.0",
+      "seeAlso": [
+        "https://www.tapr.org/OHL"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/NBPL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/NBPL-1.0.json",
+      "referenceNumber": 64,
+      "name": "Net Boolean Public License v1",
+      "licenseId": "NBPL-1.0",
+      "seeAlso": [
+        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\u003dblob;f\u003dLICENSE;hb\u003d37b4b3f6cc4bf34e1d3dec61e69914b9819d8894"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/LiLiQ-R-1.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/LiLiQ-R-1.1.json",
+      "referenceNumber": 65,
+      "name": "Licence Libre du Québec – Réciprocité version 1.1",
+      "licenseId": "LiLiQ-R-1.1",
+      "seeAlso": [
+        "https://www.forge.gouv.qc.ca/participez/licence-logicielle/licence-libre-du-quebec-liliq-en-francais/licence-libre-du-quebec-reciprocite-liliq-r-v1-1/",
+        "http://opensource.org/licenses/LiLiQ-R-1.1"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/Noweb.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Noweb.json",
+      "referenceNumber": 66,
+      "name": "Noweb License",
+      "licenseId": "Noweb",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Noweb"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC0-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC0-1.0.json",
+      "referenceNumber": 67,
+      "name": "Creative Commons Zero v1.0 Universal",
+      "licenseId": "CC0-1.0",
+      "seeAlso": [
+        "https://creativecommons.org/publicdomain/zero/1.0/legalcode"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/BSD-Protection.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/BSD-Protection.json",
+      "referenceNumber": 68,
+      "name": "BSD Protection License",
+      "licenseId": "BSD-Protection",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/BSD_Protection_License"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-NC-2.5.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-2.5.json",
+      "referenceNumber": 69,
+      "name": "Creative Commons Attribution Non Commercial 2.5 Generic",
+      "licenseId": "CC-BY-NC-2.5",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-nc/2.5/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Zlib.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Zlib.json",
+      "referenceNumber": 70,
+      "name": "zlib License",
+      "licenseId": "Zlib",
+      "seeAlso": [
+        "http://www.zlib.net/zlib_license.html",
+        "https://opensource.org/licenses/Zlib"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/GFDL-1.3-invariants-or-later.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-invariants-or-later.json",
+      "referenceNumber": 71,
+      "name": "GNU Free Documentation License v1.3 or later - invariants",
+      "licenseId": "GFDL-1.3-invariants-or-later",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/fdl-1.3.txt"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-3.0-AT.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-3.0-AT.json",
+      "referenceNumber": 72,
+      "name": "Creative Commons Attribution 3.0 Austria",
+      "licenseId": "CC-BY-3.0-AT",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by/3.0/at/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/LPPL-1.3c.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/LPPL-1.3c.json",
+      "referenceNumber": 73,
+      "name": "LaTeX Project Public License v1.3c",
+      "licenseId": "LPPL-1.3c",
+      "seeAlso": [
+        "http://www.latex-project.org/lppl/lppl-1-3c.txt",
+        "https://opensource.org/licenses/LPPL-1.3c"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/EPL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/EPL-1.0.json",
+      "referenceNumber": 74,
+      "name": "Eclipse Public License 1.0",
+      "licenseId": "EPL-1.0",
+      "seeAlso": [
+        "http://www.eclipse.org/legal/epl-v10.html",
+        "https://opensource.org/licenses/EPL-1.0"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/GFDL-1.1-invariants-or-later.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1-invariants-or-later.json",
+      "referenceNumber": 75,
+      "name": "GNU Free Documentation License v1.1 or later - invariants",
+      "licenseId": "GFDL-1.1-invariants-or-later",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/ANTLR-PD-fallback.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/ANTLR-PD-fallback.json",
+      "referenceNumber": 76,
+      "name": "ANTLR Software Rights Notice with license fallback",
+      "licenseId": "ANTLR-PD-fallback",
+      "seeAlso": [
+        "http://www.antlr2.org/license.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/OLDAP-2.4.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.4.json",
+      "referenceNumber": 77,
+      "name": "Open LDAP Public License v2.4",
+      "licenseId": "OLDAP-2.4",
+      "seeAlso": [
+        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\u003dblob;f\u003dLICENSE;hb\u003dcd1284c4a91a8a380d904eee68d1583f989ed386"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/OLDAP-2.3.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.3.json",
+      "referenceNumber": 78,
+      "name": "Open LDAP Public License v2.3",
+      "licenseId": "OLDAP-2.3",
+      "seeAlso": [
+        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\u003dblob;f\u003dLICENSE;hb\u003dd32cf54a32d581ab475d23c810b0a7fbaf8d63c3"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/ZPL-2.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/ZPL-2.1.json",
+      "referenceNumber": 79,
+      "name": "Zope Public License 2.1",
+      "licenseId": "ZPL-2.1",
+      "seeAlso": [
+        "http://old.zope.org/Resources/ZPL/"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/Apache-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Apache-2.0.json",
+      "referenceNumber": 80,
+      "name": "Apache License 2.0",
+      "licenseId": "Apache-2.0",
+      "seeAlso": [
+        "https://www.apache.org/licenses/LICENSE-2.0",
+        "https://opensource.org/licenses/Apache-2.0"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/SGI-B-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/SGI-B-2.0.json",
+      "referenceNumber": 81,
+      "name": "SGI Free Software License B v2.0",
+      "licenseId": "SGI-B-2.0",
+      "seeAlso": [
+        "http://oss.sgi.com/projects/FreeB/SGIFreeSWLicB.2.0.pdf"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/Hippocratic-2.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Hippocratic-2.1.json",
+      "referenceNumber": 82,
+      "name": "Hippocratic License 2.1",
+      "licenseId": "Hippocratic-2.1",
+      "seeAlso": [
+        "https://firstdonoharm.dev/version/2/1/license.html",
+        "https://github.com/EthicalSource/hippocratic-license/blob/58c0e646d64ff6fbee275bfe2b9492f914e3ab2a/LICENSE.txt"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-SA-3.0-DE.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-3.0-DE.json",
+      "referenceNumber": 83,
+      "name": "Creative Commons Attribution Share Alike 3.0 Germany",
+      "licenseId": "CC-BY-SA-3.0-DE",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-sa/3.0/de/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-1.0.json",
+      "referenceNumber": 84,
+      "name": "Creative Commons Attribution Non Commercial Share Alike 1.0 Generic",
+      "licenseId": "CC-BY-NC-SA-1.0",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-nc-sa/1.0/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/LGPL-2.1-or-later.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/LGPL-2.1-or-later.json",
+      "referenceNumber": 85,
+      "name": "GNU Lesser General Public License v2.1 or later",
+      "licenseId": "LGPL-2.1-or-later",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/lgpl-2.1-standalone.html",
+        "https://opensource.org/licenses/LGPL-2.1"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-3.0-US.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-3.0-US.json",
+      "referenceNumber": 86,
+      "name": "Creative Commons Attribution 3.0 United States",
+      "licenseId": "CC-BY-3.0-US",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by/3.0/us/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/TCP-wrappers.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/TCP-wrappers.json",
+      "referenceNumber": 87,
+      "name": "TCP Wrappers License",
+      "licenseId": "TCP-wrappers",
+      "seeAlso": [
+        "http://rc.quest.com/topics/openssh/license.php#tcpwrappers"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/GFDL-1.2-invariants-or-later.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2-invariants-or-later.json",
+      "referenceNumber": 88,
+      "name": "GNU Free Documentation License v1.2 or later - invariants",
+      "licenseId": "GFDL-1.2-invariants-or-later",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Eurosym.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Eurosym.json",
+      "referenceNumber": 89,
+      "name": "Eurosym License",
+      "licenseId": "Eurosym",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Eurosym"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/GFDL-1.1.html",
+      "isDeprecatedLicenseId": true,
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1.json",
+      "referenceNumber": 90,
+      "name": "GNU Free Documentation License v1.1",
+      "licenseId": "GFDL-1.1",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/LPPL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/LPPL-1.0.json",
+      "referenceNumber": 91,
+      "name": "LaTeX Project Public License v1.0",
+      "licenseId": "LPPL-1.0",
+      "seeAlso": [
+        "http://www.latex-project.org/lppl/lppl-1-0.txt"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/LGPL-2.0+.html",
+      "isDeprecatedLicenseId": true,
+      "detailsUrl": "https://spdx.org/licenses/LGPL-2.0+.json",
+      "referenceNumber": 92,
+      "name": "GNU Library General Public License v2 or later",
+      "licenseId": "LGPL-2.0+",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/lgpl-2.0-standalone.html"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/SGI-B-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/SGI-B-1.0.json",
+      "referenceNumber": 93,
+      "name": "SGI Free Software License B v1.0",
+      "licenseId": "SGI-B-1.0",
+      "seeAlso": [
+        "http://oss.sgi.com/projects/FreeB/SGIFreeSWLicB.1.0.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/APL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/APL-1.0.json",
+      "referenceNumber": 94,
+      "name": "Adaptive Public License 1.0",
+      "licenseId": "APL-1.0",
+      "seeAlso": [
+        "https://opensource.org/licenses/APL-1.0"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/libtiff.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/libtiff.json",
+      "referenceNumber": 95,
+      "name": "libtiff License",
+      "licenseId": "libtiff",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/libtiff"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/AFL-2.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/AFL-2.1.json",
+      "referenceNumber": 96,
+      "name": "Academic Free License v2.1",
+      "licenseId": "AFL-2.1",
+      "seeAlso": [
+        "http://opensource.linux-mirror.org/licenses/afl-2.1.txt"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-NC-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-1.0.json",
+      "referenceNumber": 97,
+      "name": "Creative Commons Attribution Non Commercial 1.0 Generic",
+      "licenseId": "CC-BY-NC-1.0",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-nc/1.0/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/GD.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/GD.json",
+      "referenceNumber": 98,
+      "name": "GD License",
+      "licenseId": "GD",
+      "seeAlso": [
+        "https://libgd.github.io/manuals/2.3.0/files/license-txt.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/AFL-1.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/AFL-1.1.json",
+      "referenceNumber": 99,
+      "name": "Academic Free License v1.1",
+      "licenseId": "AFL-1.1",
+      "seeAlso": [
+        "http://opensource.linux-mirror.org/licenses/afl-1.1.txt",
+        "http://wayback.archive.org/web/20021004124254/http://www.opensource.org/licenses/academic.php"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-3.0-IGO.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-3.0-IGO.json",
+      "referenceNumber": 100,
+      "name": "Creative Commons Attribution Non Commercial No Derivatives 3.0 IGO",
+      "licenseId": "CC-BY-NC-ND-3.0-IGO",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-nc-nd/3.0/igo/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Unicode-DFS-2015.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Unicode-DFS-2015.json",
+      "referenceNumber": 101,
+      "name": "Unicode License Agreement - Data Files and Software (2015)",
+      "licenseId": "Unicode-DFS-2015",
+      "seeAlso": [
+        "https://web.archive.org/web/20151224134844/http://unicode.org/copyright.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/GFDL-1.2-only.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2-only.json",
+      "referenceNumber": 102,
+      "name": "GNU Free Documentation License v1.2 only",
+      "licenseId": "GFDL-1.2-only",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/MPL-1.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/MPL-1.1.json",
+      "referenceNumber": 103,
+      "name": "Mozilla Public License 1.1",
+      "licenseId": "MPL-1.1",
+      "seeAlso": [
+        "http://www.mozilla.org/MPL/MPL-1.1.html",
+        "https://opensource.org/licenses/MPL-1.1"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/GPL-2.0-only.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-only.json",
+      "referenceNumber": 104,
+      "name": "GNU General Public License v2.0 only",
+      "licenseId": "GPL-2.0-only",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html",
+        "https://opensource.org/licenses/GPL-2.0"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-NC-4.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-4.0.json",
+      "referenceNumber": 105,
+      "name": "Creative Commons Attribution Non Commercial 4.0 International",
+      "licenseId": "CC-BY-NC-4.0",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-nc/4.0/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/FreeImage.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/FreeImage.json",
+      "referenceNumber": 106,
+      "name": "FreeImage Public License v1.0",
+      "licenseId": "FreeImage",
+      "seeAlso": [
+        "http://freeimage.sourceforge.net/freeimage-license.txt"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/SHL-0.51.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/SHL-0.51.json",
+      "referenceNumber": 107,
+      "name": "Solderpad Hardware License, Version 0.51",
+      "licenseId": "SHL-0.51",
+      "seeAlso": [
+        "https://solderpad.org/licenses/SHL-0.51/"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CNRI-Jython.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CNRI-Jython.json",
+      "referenceNumber": 108,
+      "name": "CNRI Jython License",
+      "licenseId": "CNRI-Jython",
+      "seeAlso": [
+        "http://www.jython.org/license.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/ZPL-1.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/ZPL-1.1.json",
+      "referenceNumber": 109,
+      "name": "Zope Public License 1.1",
+      "licenseId": "ZPL-1.1",
+      "seeAlso": [
+        "http://old.zope.org/Resources/License/ZPL-1.1"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Afmparse.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Afmparse.json",
+      "referenceNumber": 110,
+      "name": "Afmparse License",
+      "licenseId": "Afmparse",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Afmparse"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/OLDAP-2.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.1.json",
+      "referenceNumber": 111,
+      "name": "Open LDAP Public License v2.1",
+      "licenseId": "OLDAP-2.1",
+      "seeAlso": [
+        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\u003dblob;f\u003dLICENSE;hb\u003db0d176738e96a0d3b9f85cb51e140a86f21be715"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Rdisc.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Rdisc.json",
+      "referenceNumber": 112,
+      "name": "Rdisc License",
+      "licenseId": "Rdisc",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Rdisc_License"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Imlib2.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Imlib2.json",
+      "referenceNumber": 113,
+      "name": "Imlib2 License",
+      "licenseId": "Imlib2",
+      "seeAlso": [
+        "http://trac.enlightenment.org/e/browser/trunk/imlib2/COPYING",
+        "https://git.enlightenment.org/legacy/imlib2.git/tree/COPYING"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/BSD-4-Clause-Shortened.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/BSD-4-Clause-Shortened.json",
+      "referenceNumber": 114,
+      "name": "BSD 4 Clause Shortened",
+      "licenseId": "BSD-4-Clause-Shortened",
+      "seeAlso": [
+        "https://metadata.ftp-master.debian.org/changelogs//main/a/arpwatch/arpwatch_2.1a15-7_copyright"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Sendmail.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Sendmail.json",
+      "referenceNumber": 115,
+      "name": "Sendmail License",
+      "licenseId": "Sendmail",
+      "seeAlso": [
+        "http://www.sendmail.com/pdfs/open_source/sendmail_license.pdf",
+        "https://web.archive.org/web/20160322142305/https://www.sendmail.com/pdfs/open_source/sendmail_license.pdf"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-2.5.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-2.5.json",
+      "referenceNumber": 116,
+      "name": "Creative Commons Attribution 2.5 Generic",
+      "licenseId": "CC-BY-2.5",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by/2.5/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/AAL.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/AAL.json",
+      "referenceNumber": 117,
+      "name": "Attribution Assurance License",
+      "licenseId": "AAL",
+      "seeAlso": [
+        "https://opensource.org/licenses/attribution"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/MPL-2.0-no-copyleft-exception.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/MPL-2.0-no-copyleft-exception.json",
+      "referenceNumber": 118,
+      "name": "Mozilla Public License 2.0 (no copyleft exception)",
+      "licenseId": "MPL-2.0-no-copyleft-exception",
+      "seeAlso": [
+        "http://www.mozilla.org/MPL/2.0/",
+        "https://opensource.org/licenses/MPL-2.0"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-2.5.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-2.5.json",
+      "referenceNumber": 119,
+      "name": "Creative Commons Attribution Non Commercial No Derivatives 2.5 Generic",
+      "licenseId": "CC-BY-NC-ND-2.5",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-nc-nd/2.5/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-3.0-NL.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-3.0-NL.json",
+      "referenceNumber": 120,
+      "name": "Creative Commons Attribution 3.0 Netherlands",
+      "licenseId": "CC-BY-3.0-NL",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by/3.0/nl/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/LPL-1.02.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/LPL-1.02.json",
+      "referenceNumber": 121,
+      "name": "Lucent Public License v1.02",
+      "licenseId": "LPL-1.02",
+      "seeAlso": [
+        "http://plan9.bell-labs.com/plan9/license.html",
+        "https://opensource.org/licenses/LPL-1.02"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/ECL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/ECL-1.0.json",
+      "referenceNumber": 122,
+      "name": "Educational Community License v1.0",
+      "licenseId": "ECL-1.0",
+      "seeAlso": [
+        "https://opensource.org/licenses/ECL-1.0"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/OFL-1.0-no-RFN.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OFL-1.0-no-RFN.json",
+      "referenceNumber": 123,
+      "name": "SIL Open Font License 1.0 with no Reserved Font Name",
+      "licenseId": "OFL-1.0-no-RFN",
+      "seeAlso": [
+        "http://scripts.sil.org/cms/scripts/page.php?item_id\u003dOFL10_web"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-3.0-DE.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-3.0-DE.json",
+      "referenceNumber": 124,
+      "name": "Creative Commons Attribution Non Commercial Share Alike 3.0 Germany",
+      "licenseId": "CC-BY-NC-SA-3.0-DE",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-nc-sa/3.0/de/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-SA-3.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-3.0.json",
+      "referenceNumber": 125,
+      "name": "Creative Commons Attribution Share Alike 3.0 Unported",
+      "licenseId": "CC-BY-SA-3.0",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-sa/3.0/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/NTP.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/NTP.json",
+      "referenceNumber": 126,
+      "name": "NTP License",
+      "licenseId": "NTP",
+      "seeAlso": [
+        "https://opensource.org/licenses/NTP"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/MPL-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/MPL-2.0.json",
+      "referenceNumber": 127,
+      "name": "Mozilla Public License 2.0",
+      "licenseId": "MPL-2.0",
+      "seeAlso": [
+        "https://www.mozilla.org/MPL/2.0/",
+        "https://opensource.org/licenses/MPL-2.0"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/APSL-1.2.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/APSL-1.2.json",
+      "referenceNumber": 128,
+      "name": "Apple Public Source License 1.2",
+      "licenseId": "APSL-1.2",
+      "seeAlso": [
+        "http://www.samurajdata.se/opensource/mirror/licenses/apsl.php"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/GFDL-1.2-no-invariants-only.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2-no-invariants-only.json",
+      "referenceNumber": 129,
+      "name": "GNU Free Documentation License v1.2 only - no invariants",
+      "licenseId": "GFDL-1.2-no-invariants-only",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Artistic-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Artistic-2.0.json",
+      "referenceNumber": 130,
+      "name": "Artistic License 2.0",
+      "licenseId": "Artistic-2.0",
+      "seeAlso": [
+        "http://www.perlfoundation.org/artistic_license_2_0",
+        "https://www.perlfoundation.org/artistic-license-20.html",
+        "https://opensource.org/licenses/artistic-license-2.0"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/GPL-2.0.html",
+      "isDeprecatedLicenseId": true,
+      "detailsUrl": "https://spdx.org/licenses/GPL-2.0.json",
+      "referenceNumber": 131,
+      "name": "GNU General Public License v2.0 only",
+      "licenseId": "GPL-2.0",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html",
+        "https://opensource.org/licenses/GPL-2.0"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/RSCPL.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/RSCPL.json",
+      "referenceNumber": 132,
+      "name": "Ricoh Source Code Public License",
+      "licenseId": "RSCPL",
+      "seeAlso": [
+        "http://wayback.archive.org/web/20060715140826/http://www.risource.org/RPL/RPL-1.0A.shtml",
+        "https://opensource.org/licenses/RSCPL"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/Sleepycat.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Sleepycat.json",
+      "referenceNumber": 133,
+      "name": "Sleepycat License",
+      "licenseId": "Sleepycat",
+      "seeAlso": [
+        "https://opensource.org/licenses/Sleepycat"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/xpp.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/xpp.json",
+      "referenceNumber": 134,
+      "name": "XPP License",
+      "licenseId": "xpp",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/xpp"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CDLA-Sharing-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CDLA-Sharing-1.0.json",
+      "referenceNumber": 135,
+      "name": "Community Data License Agreement Sharing 1.0",
+      "licenseId": "CDLA-Sharing-1.0",
+      "seeAlso": [
+        "https://cdla.io/sharing-1-0"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/ClArtistic.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/ClArtistic.json",
+      "referenceNumber": 136,
+      "name": "Clarified Artistic License",
+      "licenseId": "ClArtistic",
+      "seeAlso": [
+        "http://gianluca.dellavedova.org/2011/01/03/clarified-artistic-license/",
+        "http://www.ncftp.com/ncftp/doc/LICENSE.txt"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/AGPL-1.0-only.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/AGPL-1.0-only.json",
+      "referenceNumber": 137,
+      "name": "Affero General Public License v1.0 only",
+      "licenseId": "AGPL-1.0-only",
+      "seeAlso": [
+        "http://www.affero.org/oagpl.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-3.0-DE.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-3.0-DE.json",
+      "referenceNumber": 138,
+      "name": "Creative Commons Attribution 3.0 Germany",
+      "licenseId": "CC-BY-3.0-DE",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by/3.0/de/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/AFL-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/AFL-2.0.json",
+      "referenceNumber": 139,
+      "name": "Academic Free License v2.0",
+      "licenseId": "AFL-2.0",
+      "seeAlso": [
+        "http://wayback.archive.org/web/20060924134533/http://www.opensource.org/licenses/afl-2.0.txt"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/Intel.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Intel.json",
+      "referenceNumber": 140,
+      "name": "Intel Open Source License",
+      "licenseId": "Intel",
+      "seeAlso": [
+        "https://opensource.org/licenses/Intel"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/GFDL-1.1-no-invariants-or-later.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1-no-invariants-or-later.json",
+      "referenceNumber": 141,
+      "name": "GNU Free Documentation License v1.1 or later - no invariants",
+      "licenseId": "GFDL-1.1-no-invariants-or-later",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/APAFML.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/APAFML.json",
+      "referenceNumber": 142,
+      "name": "Adobe Postscript AFM License",
+      "licenseId": "APAFML",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/AdobePostscriptAFM"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/GFDL-1.2.html",
+      "isDeprecatedLicenseId": true,
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2.json",
+      "referenceNumber": 143,
+      "name": "GNU Free Documentation License v1.2",
+      "licenseId": "GFDL-1.2",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/SISSL.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/SISSL.json",
+      "referenceNumber": 144,
+      "name": "Sun Industry Standards Source License v1.1",
+      "licenseId": "SISSL",
+      "seeAlso": [
+        "http://www.openoffice.org/licenses/sissl_license.html",
+        "https://opensource.org/licenses/SISSL"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/Naumen.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Naumen.json",
+      "referenceNumber": 145,
+      "name": "Naumen Public License",
+      "licenseId": "Naumen",
+      "seeAlso": [
+        "https://opensource.org/licenses/Naumen"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/HTMLTIDY.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/HTMLTIDY.json",
+      "referenceNumber": 146,
+      "name": "HTML Tidy License",
+      "licenseId": "HTMLTIDY",
+      "seeAlso": [
+        "https://github.com/htacg/tidy-html5/blob/next/README/LICENSE.md"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/OLDAP-2.8.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.8.json",
+      "referenceNumber": 147,
+      "name": "Open LDAP Public License v2.8",
+      "licenseId": "OLDAP-2.8",
+      "seeAlso": [
+        "http://www.openldap.org/software/release/license.html"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/blessing.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/blessing.json",
+      "referenceNumber": 148,
+      "name": "SQLite Blessing",
+      "licenseId": "blessing",
+      "seeAlso": [
+        "https://www.sqlite.org/src/artifact/e33a4df7e32d742a?ln\u003d4-9",
+        "https://sqlite.org/src/artifact/df5091916dbb40e6"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-ND-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-2.0.json",
+      "referenceNumber": 149,
+      "name": "Creative Commons Attribution No Derivatives 2.0 Generic",
+      "licenseId": "CC-BY-ND-2.0",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-nd/2.0/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/OGTSL.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OGTSL.json",
+      "referenceNumber": 150,
+      "name": "Open Group Test Suite License",
+      "licenseId": "OGTSL",
+      "seeAlso": [
+        "http://www.opengroup.org/testing/downloads/The_Open_Group_TSL.txt",
+        "https://opensource.org/licenses/OGTSL"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/LGPL-2.0-or-later.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/LGPL-2.0-or-later.json",
+      "referenceNumber": 151,
+      "name": "GNU Library General Public License v2 or later",
+      "licenseId": "LGPL-2.0-or-later",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/lgpl-2.0-standalone.html"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/Parity-7.0.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Parity-7.0.0.json",
+      "referenceNumber": 152,
+      "name": "The Parity Public License 7.0.0",
+      "licenseId": "Parity-7.0.0",
+      "seeAlso": [
+        "https://paritylicense.com/versions/7.0.0.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-ND-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-1.0.json",
+      "referenceNumber": 153,
+      "name": "Creative Commons Attribution No Derivatives 1.0 Generic",
+      "licenseId": "CC-BY-ND-1.0",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-nd/1.0/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/dvipdfm.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/dvipdfm.json",
+      "referenceNumber": 154,
+      "name": "dvipdfm License",
+      "licenseId": "dvipdfm",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/dvipdfm"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CNRI-Python.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CNRI-Python.json",
+      "referenceNumber": 155,
+      "name": "CNRI Python License",
+      "licenseId": "CNRI-Python",
+      "seeAlso": [
+        "https://opensource.org/licenses/CNRI-Python"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/BSD-4-Clause-UC.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/BSD-4-Clause-UC.json",
+      "referenceNumber": 156,
+      "name": "BSD-4-Clause (University of California-Specific)",
+      "licenseId": "BSD-4-Clause-UC",
+      "seeAlso": [
+        "http://www.freebsd.org/copyright/license.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/NLOD-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/NLOD-1.0.json",
+      "referenceNumber": 157,
+      "name": "Norwegian Licence for Open Government Data (NLOD) 1.0",
+      "licenseId": "NLOD-1.0",
+      "seeAlso": [
+        "http://data.norge.no/nlod/en/1.0"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/MS-RL.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/MS-RL.json",
+      "referenceNumber": 158,
+      "name": "Microsoft Reciprocal License",
+      "licenseId": "MS-RL",
+      "seeAlso": [
+        "http://www.microsoft.com/opensource/licenses.mspx",
+        "https://opensource.org/licenses/MS-RL"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-4.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-4.0.json",
+      "referenceNumber": 159,
+      "name": "Creative Commons Attribution Non Commercial Share Alike 4.0 International",
+      "licenseId": "CC-BY-NC-SA-4.0",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/HaskellReport.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/HaskellReport.json",
+      "referenceNumber": 160,
+      "name": "Haskell Language Report License",
+      "licenseId": "HaskellReport",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Haskell_Language_Report_License"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-1.0.json",
+      "referenceNumber": 161,
+      "name": "Creative Commons Attribution 1.0 Generic",
+      "licenseId": "CC-BY-1.0",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by/1.0/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/UCL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/UCL-1.0.json",
+      "referenceNumber": 162,
+      "name": "Upstream Compatibility License v1.0",
+      "licenseId": "UCL-1.0",
+      "seeAlso": [
+        "https://opensource.org/licenses/UCL-1.0"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/Mup.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Mup.json",
+      "referenceNumber": 163,
+      "name": "Mup License",
+      "licenseId": "Mup",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Mup"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/SMPPL.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/SMPPL.json",
+      "referenceNumber": 164,
+      "name": "Secure Messaging Protocol Public License",
+      "licenseId": "SMPPL",
+      "seeAlso": [
+        "https://github.com/dcblake/SMP/blob/master/Documentation/License.txt"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/PHP-3.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/PHP-3.0.json",
+      "referenceNumber": 165,
+      "name": "PHP License v3.0",
+      "licenseId": "PHP-3.0",
+      "seeAlso": [
+        "http://www.php.net/license/3_0.txt",
+        "https://opensource.org/licenses/PHP-3.0"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/GL2PS.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/GL2PS.json",
+      "referenceNumber": 166,
+      "name": "GL2PS License",
+      "licenseId": "GL2PS",
+      "seeAlso": [
+        "http://www.geuz.org/gl2ps/COPYING.GL2PS"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CrystalStacker.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CrystalStacker.json",
+      "referenceNumber": 167,
+      "name": "CrystalStacker License",
+      "licenseId": "CrystalStacker",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing:CrystalStacker?rd\u003dLicensing/CrystalStacker"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/W3C-20150513.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/W3C-20150513.json",
+      "referenceNumber": 168,
+      "name": "W3C Software Notice and Document License (2015-05-13)",
+      "licenseId": "W3C-20150513",
+      "seeAlso": [
+        "https://www.w3.org/Consortium/Legal/2015/copyright-software-and-document"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/NIST-PD-fallback.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/NIST-PD-fallback.json",
+      "referenceNumber": 169,
+      "name": "NIST Public Domain Notice with license fallback",
+      "licenseId": "NIST-PD-fallback",
+      "seeAlso": [
+        "https://github.com/usnistgov/jsip/blob/59700e6926cbe96c5cdae897d9a7d2656b42abe3/LICENSE",
+        "https://github.com/usnistgov/fipy/blob/86aaa5c2ba2c6f1be19593c5986071cf6568cc34/LICENSE.rst"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/OGL-UK-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OGL-UK-1.0.json",
+      "referenceNumber": 170,
+      "name": "Open Government Licence v1.0",
+      "licenseId": "OGL-UK-1.0",
+      "seeAlso": [
+        "http://www.nationalarchives.gov.uk/doc/open-government-licence/version/1/"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CPL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CPL-1.0.json",
+      "referenceNumber": 171,
+      "name": "Common Public License 1.0",
+      "licenseId": "CPL-1.0",
+      "seeAlso": [
+        "https://opensource.org/licenses/CPL-1.0"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/LGPL-2.1-only.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/LGPL-2.1-only.json",
+      "referenceNumber": 172,
+      "name": "GNU Lesser General Public License v2.1 only",
+      "licenseId": "LGPL-2.1-only",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/lgpl-2.1-standalone.html",
+        "https://opensource.org/licenses/LGPL-2.1"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/ZPL-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/ZPL-2.0.json",
+      "referenceNumber": 173,
+      "name": "Zope Public License 2.0",
+      "licenseId": "ZPL-2.0",
+      "seeAlso": [
+        "http://old.zope.org/Resources/License/ZPL-2.0",
+        "https://opensource.org/licenses/ZPL-2.0"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/Frameworx-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Frameworx-1.0.json",
+      "referenceNumber": 174,
+      "name": "Frameworx Open License 1.0",
+      "licenseId": "Frameworx-1.0",
+      "seeAlso": [
+        "https://opensource.org/licenses/Frameworx-1.0"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/AGPL-3.0-only.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/AGPL-3.0-only.json",
+      "referenceNumber": 175,
+      "name": "GNU Affero General Public License v3.0 only",
+      "licenseId": "AGPL-3.0-only",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/agpl.txt",
+        "https://opensource.org/licenses/AGPL-3.0"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/DRL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/DRL-1.0.json",
+      "referenceNumber": 176,
+      "name": "Detection Rule License 1.0",
+      "licenseId": "DRL-1.0",
+      "seeAlso": [
+        "https://github.com/Neo23x0/sigma/blob/master/LICENSE.Detection.Rules.md"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/EFL-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/EFL-2.0.json",
+      "referenceNumber": 177,
+      "name": "Eiffel Forum License v2.0",
+      "licenseId": "EFL-2.0",
+      "seeAlso": [
+        "http://www.eiffel-nice.org/license/eiffel-forum-license-2.html",
+        "https://opensource.org/licenses/EFL-2.0"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/Spencer-99.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Spencer-99.json",
+      "referenceNumber": 178,
+      "name": "Spencer License 99",
+      "licenseId": "Spencer-99",
+      "seeAlso": [
+        "http://www.opensource.apple.com/source/tcl/tcl-5/tcl/generic/regfronts.c"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CAL-1.0-Combined-Work-Exception.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CAL-1.0-Combined-Work-Exception.json",
+      "referenceNumber": 179,
+      "name": "Cryptographic Autonomy License 1.0 (Combined Work Exception)",
+      "licenseId": "CAL-1.0-Combined-Work-Exception",
+      "seeAlso": [
+        "http://cryptographicautonomylicense.com/license-text.html",
+        "https://opensource.org/licenses/CAL-1.0"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/GFDL-1.1-invariants-only.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1-invariants-only.json",
+      "referenceNumber": 180,
+      "name": "GNU Free Documentation License v1.1 only - invariants",
+      "licenseId": "GFDL-1.1-invariants-only",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/TCL.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/TCL.json",
+      "referenceNumber": 181,
+      "name": "TCL/TK License",
+      "licenseId": "TCL",
+      "seeAlso": [
+        "http://www.tcl.tk/software/tcltk/license.html",
+        "https://fedoraproject.org/wiki/Licensing/TCL"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/SHL-0.5.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/SHL-0.5.json",
+      "referenceNumber": 182,
+      "name": "Solderpad Hardware License v0.5",
+      "licenseId": "SHL-0.5",
+      "seeAlso": [
+        "https://solderpad.org/licenses/SHL-0.5/"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/OFL-1.0-RFN.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OFL-1.0-RFN.json",
+      "referenceNumber": 183,
+      "name": "SIL Open Font License 1.0 with Reserved Font Name",
+      "licenseId": "OFL-1.0-RFN",
+      "seeAlso": [
+        "http://scripts.sil.org/cms/scripts/page.php?item_id\u003dOFL10_web"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/LGPL-2.0.html",
+      "isDeprecatedLicenseId": true,
+      "detailsUrl": "https://spdx.org/licenses/LGPL-2.0.json",
+      "referenceNumber": 184,
+      "name": "GNU Library General Public License v2 only",
+      "licenseId": "LGPL-2.0",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/lgpl-2.0-standalone.html"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/CERN-OHL-W-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CERN-OHL-W-2.0.json",
+      "referenceNumber": 185,
+      "name": "CERN Open Hardware Licence Version 2 - Weakly Reciprocal",
+      "licenseId": "CERN-OHL-W-2.0",
+      "seeAlso": [
+        "https://www.ohwr.org/project/cernohl/wikis/Documents/CERN-OHL-version-2"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/Glide.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Glide.json",
+      "referenceNumber": 186,
+      "name": "3dfx Glide License",
+      "licenseId": "Glide",
+      "seeAlso": [
+        "http://www.users.on.net/~triforce/glidexp/COPYING.txt"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/mpich2.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/mpich2.json",
+      "referenceNumber": 187,
+      "name": "mpich2 License",
+      "licenseId": "mpich2",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/MIT"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/psutils.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/psutils.json",
+      "referenceNumber": 188,
+      "name": "psutils License",
+      "licenseId": "psutils",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/psutils"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/SPL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/SPL-1.0.json",
+      "referenceNumber": 189,
+      "name": "Sun Public License v1.0",
+      "licenseId": "SPL-1.0",
+      "seeAlso": [
+        "https://opensource.org/licenses/SPL-1.0"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/Apache-1.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Apache-1.1.json",
+      "referenceNumber": 190,
+      "name": "Apache License 1.1",
+      "licenseId": "Apache-1.1",
+      "seeAlso": [
+        "http://apache.org/licenses/LICENSE-1.1",
+        "https://opensource.org/licenses/Apache-1.1"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-ND-4.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-4.0.json",
+      "referenceNumber": 191,
+      "name": "Creative Commons Attribution No Derivatives 4.0 International",
+      "licenseId": "CC-BY-ND-4.0",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-nd/4.0/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/FreeBSD-DOC.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/FreeBSD-DOC.json",
+      "referenceNumber": 192,
+      "name": "FreeBSD Documentation License",
+      "licenseId": "FreeBSD-DOC",
+      "seeAlso": [
+        "https://www.freebsd.org/copyright/freebsd-doc-license/"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/SCEA.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/SCEA.json",
+      "referenceNumber": 193,
+      "name": "SCEA Shared Source License",
+      "licenseId": "SCEA",
+      "seeAlso": [
+        "http://research.scea.com/scea_shared_source_license.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Latex2e.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Latex2e.json",
+      "referenceNumber": 194,
+      "name": "Latex2e License",
+      "licenseId": "Latex2e",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Latex2e"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Artistic-1.0-cl8.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Artistic-1.0-cl8.json",
+      "referenceNumber": 195,
+      "name": "Artistic License 1.0 w/clause 8",
+      "licenseId": "Artistic-1.0-cl8",
+      "seeAlso": [
+        "https://opensource.org/licenses/Artistic-1.0"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/SGI-B-1.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/SGI-B-1.1.json",
+      "referenceNumber": 196,
+      "name": "SGI Free Software License B v1.1",
+      "licenseId": "SGI-B-1.1",
+      "seeAlso": [
+        "http://oss.sgi.com/projects/FreeB/"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/NRL.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/NRL.json",
+      "referenceNumber": 197,
+      "name": "NRL License",
+      "licenseId": "NRL",
+      "seeAlso": [
+        "http://web.mit.edu/network/isakmp/nrllicense.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/SWL.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/SWL.json",
+      "referenceNumber": 198,
+      "name": "Scheme Widget Library (SWL) Software License Agreement",
+      "licenseId": "SWL",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/SWL"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Zed.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Zed.json",
+      "referenceNumber": 199,
+      "name": "Zed License",
+      "licenseId": "Zed",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Zed"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CERN-OHL-1.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CERN-OHL-1.1.json",
+      "referenceNumber": 200,
+      "name": "CERN Open Hardware Licence v1.1",
+      "licenseId": "CERN-OHL-1.1",
+      "seeAlso": [
+        "https://www.ohwr.org/project/licenses/wikis/cern-ohl-v1.1"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/RHeCos-1.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/RHeCos-1.1.json",
+      "referenceNumber": 201,
+      "name": "Red Hat eCos Public License v1.1",
+      "licenseId": "RHeCos-1.1",
+      "seeAlso": [
+        "http://ecos.sourceware.org/old-license.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/JasPer-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/JasPer-2.0.json",
+      "referenceNumber": 202,
+      "name": "JasPer License",
+      "licenseId": "JasPer-2.0",
+      "seeAlso": [
+        "http://www.ece.uvic.ca/~mdadams/jasper/LICENSE"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/SSPL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/SSPL-1.0.json",
+      "referenceNumber": 203,
+      "name": "Server Side Public License, v 1",
+      "licenseId": "SSPL-1.0",
+      "seeAlso": [
+        "https://www.mongodb.com/licensing/server-side-public-license"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/GPL-2.0+.html",
+      "isDeprecatedLicenseId": true,
+      "detailsUrl": "https://spdx.org/licenses/GPL-2.0+.json",
+      "referenceNumber": 204,
+      "name": "GNU General Public License v2.0 or later",
+      "licenseId": "GPL-2.0+",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html",
+        "https://opensource.org/licenses/GPL-2.0"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/OLDAP-1.4.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-1.4.json",
+      "referenceNumber": 205,
+      "name": "Open LDAP Public License v1.4",
+      "licenseId": "OLDAP-1.4",
+      "seeAlso": [
+        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\u003dblob;f\u003dLICENSE;hb\u003dc9f95c2f3f2ffb5e0ae55fe7388af75547660941"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/libpng-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/libpng-2.0.json",
+      "referenceNumber": 206,
+      "name": "PNG Reference Library version 2",
+      "licenseId": "libpng-2.0",
+      "seeAlso": [
+        "http://www.libpng.org/pub/png/src/libpng-LICENSE.txt"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CNRI-Python-GPL-Compatible.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CNRI-Python-GPL-Compatible.json",
+      "referenceNumber": 207,
+      "name": "CNRI Python Open Source GPL Compatible License Agreement",
+      "licenseId": "CNRI-Python-GPL-Compatible",
+      "seeAlso": [
+        "http://www.python.org/download/releases/1.6.1/download_win/"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Aladdin.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Aladdin.json",
+      "referenceNumber": 208,
+      "name": "Aladdin Free Public License",
+      "licenseId": "Aladdin",
+      "seeAlso": [
+        "http://pages.cs.wisc.edu/~ghost/doc/AFPL/6.01/Public.htm"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CECILL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CECILL-1.0.json",
+      "referenceNumber": 209,
+      "name": "CeCILL Free Software License Agreement v1.0",
+      "licenseId": "CECILL-1.0",
+      "seeAlso": [
+        "http://www.cecill.info/licences/Licence_CeCILL_V1-fr.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Ruby.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Ruby.json",
+      "referenceNumber": 210,
+      "name": "Ruby License",
+      "licenseId": "Ruby",
+      "seeAlso": [
+        "http://www.ruby-lang.org/en/LICENSE.txt"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/NPL-1.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/NPL-1.1.json",
+      "referenceNumber": 211,
+      "name": "Netscape Public License v1.1",
+      "licenseId": "NPL-1.1",
+      "seeAlso": [
+        "http://www.mozilla.org/MPL/NPL/1.1/"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/ImageMagick.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/ImageMagick.json",
+      "referenceNumber": 212,
+      "name": "ImageMagick License",
+      "licenseId": "ImageMagick",
+      "seeAlso": [
+        "http://www.imagemagick.org/script/license.php"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Cube.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Cube.json",
+      "referenceNumber": 213,
+      "name": "Cube License",
+      "licenseId": "Cube",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Cube"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/GFDL-1.1-only.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1-only.json",
+      "referenceNumber": 214,
+      "name": "GNU Free Documentation License v1.1 only",
+      "licenseId": "GFDL-1.1-only",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-2.0.json",
+      "referenceNumber": 215,
+      "name": "Creative Commons Attribution 2.0 Generic",
+      "licenseId": "CC-BY-2.0",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by/2.0/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/AFL-1.2.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/AFL-1.2.json",
+      "referenceNumber": 216,
+      "name": "Academic Free License v1.2",
+      "licenseId": "AFL-1.2",
+      "seeAlso": [
+        "http://opensource.linux-mirror.org/licenses/afl-1.2.txt",
+        "http://wayback.archive.org/web/20021204204652/http://www.opensource.org/licenses/academic.php"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-SA-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-2.0.json",
+      "referenceNumber": 217,
+      "name": "Creative Commons Attribution Share Alike 2.0 Generic",
+      "licenseId": "CC-BY-SA-2.0",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-sa/2.0/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CECILL-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CECILL-2.0.json",
+      "referenceNumber": 218,
+      "name": "CeCILL Free Software License Agreement v2.0",
+      "licenseId": "CECILL-2.0",
+      "seeAlso": [
+        "http://www.cecill.info/licences/Licence_CeCILL_V2-en.html"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/MIT-advertising.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/MIT-advertising.json",
+      "referenceNumber": 219,
+      "name": "Enlightenment License (e16)",
+      "licenseId": "MIT-advertising",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/MIT_With_Advertising"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.5.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-2.5.json",
+      "referenceNumber": 220,
+      "name": "Creative Commons Attribution Non Commercial Share Alike 2.5 Generic",
+      "licenseId": "CC-BY-NC-SA-2.5",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-nc-sa/2.5/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Artistic-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Artistic-1.0.json",
+      "referenceNumber": 221,
+      "name": "Artistic License 1.0",
+      "licenseId": "Artistic-1.0",
+      "seeAlso": [
+        "https://opensource.org/licenses/Artistic-1.0"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/OSL-3.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OSL-3.0.json",
+      "referenceNumber": 222,
+      "name": "Open Software License 3.0",
+      "licenseId": "OSL-3.0",
+      "seeAlso": [
+        "https://web.archive.org/web/20120101081418/http://rosenlaw.com:80/OSL3.0.htm",
+        "https://opensource.org/licenses/OSL-3.0"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/X11.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/X11.json",
+      "referenceNumber": 223,
+      "name": "X11 License",
+      "licenseId": "X11",
+      "seeAlso": [
+        "http://www.xfree86.org/3.3.6/COPYRIGHT2.html#3"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/Bahyph.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Bahyph.json",
+      "referenceNumber": 224,
+      "name": "Bahyph License",
+      "licenseId": "Bahyph",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Bahyph"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/OLDAP-2.0.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.0.1.json",
+      "referenceNumber": 225,
+      "name": "Open LDAP Public License v2.0.1",
+      "licenseId": "OLDAP-2.0.1",
+      "seeAlso": [
+        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\u003dblob;f\u003dLICENSE;hb\u003db6d68acd14e51ca3aab4428bf26522aa74873f0e"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/EUDatagrid.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/EUDatagrid.json",
+      "referenceNumber": 226,
+      "name": "EU DataGrid Software License",
+      "licenseId": "EUDatagrid",
+      "seeAlso": [
+        "http://eu-datagrid.web.cern.ch/eu-datagrid/license.html",
+        "https://opensource.org/licenses/EUDatagrid"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/MTLL.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/MTLL.json",
+      "referenceNumber": 227,
+      "name": "Matrix Template Library License",
+      "licenseId": "MTLL",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Matrix_Template_Library_License"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/GFDL-1.2-invariants-only.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2-invariants-only.json",
+      "referenceNumber": 228,
+      "name": "GNU Free Documentation License v1.2 only - invariants",
+      "licenseId": "GFDL-1.2-invariants-only",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/GFDL-1.3-no-invariants-or-later.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-no-invariants-or-later.json",
+      "referenceNumber": 229,
+      "name": "GNU Free Documentation License v1.3 or later - no invariants",
+      "licenseId": "GFDL-1.3-no-invariants-or-later",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/fdl-1.3.txt"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/curl.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/curl.json",
+      "referenceNumber": 230,
+      "name": "curl License",
+      "licenseId": "curl",
+      "seeAlso": [
+        "https://github.com/bagder/curl/blob/master/COPYING"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/LAL-1.3.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/LAL-1.3.json",
+      "referenceNumber": 231,
+      "name": "Licence Art Libre 1.3",
+      "licenseId": "LAL-1.3",
+      "seeAlso": [
+        "https://artlibre.org/"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/DSDP.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/DSDP.json",
+      "referenceNumber": 232,
+      "name": "DSDP License",
+      "licenseId": "DSDP",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/DSDP"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CERN-OHL-1.2.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CERN-OHL-1.2.json",
+      "referenceNumber": 233,
+      "name": "CERN Open Hardware Licence v1.2",
+      "licenseId": "CERN-OHL-1.2",
+      "seeAlso": [
+        "https://www.ohwr.org/project/licenses/wikis/cern-ohl-v1.2"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/TOSL.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/TOSL.json",
+      "referenceNumber": 234,
+      "name": "Trusster Open Source License",
+      "licenseId": "TOSL",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/TOSL"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/GPL-3.0-with-autoconf-exception.html",
+      "isDeprecatedLicenseId": true,
+      "detailsUrl": "https://spdx.org/licenses/GPL-3.0-with-autoconf-exception.json",
+      "referenceNumber": 235,
+      "name": "GNU General Public License v3.0 w/Autoconf exception",
+      "licenseId": "GPL-3.0-with-autoconf-exception",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/autoconf-exception-3.0.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-3.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-3.0.json",
+      "referenceNumber": 236,
+      "name": "Creative Commons Attribution 3.0 Unported",
+      "licenseId": "CC-BY-3.0",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by/3.0/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Qhull.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Qhull.json",
+      "referenceNumber": 237,
+      "name": "Qhull License",
+      "licenseId": "Qhull",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Qhull"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/GFDL-1.3-no-invariants-only.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-no-invariants-only.json",
+      "referenceNumber": 238,
+      "name": "GNU Free Documentation License v1.3 only - no invariants",
+      "licenseId": "GFDL-1.3-no-invariants-only",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/fdl-1.3.txt"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/TORQUE-1.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/TORQUE-1.1.json",
+      "referenceNumber": 239,
+      "name": "TORQUE v2.5+ Software License v1.1",
+      "licenseId": "TORQUE-1.1",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/TORQUEv1.1"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/MS-PL.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/MS-PL.json",
+      "referenceNumber": 240,
+      "name": "Microsoft Public License",
+      "licenseId": "MS-PL",
+      "seeAlso": [
+        "http://www.microsoft.com/opensource/licenses.mspx",
+        "https://opensource.org/licenses/MS-PL"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/Apache-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Apache-1.0.json",
+      "referenceNumber": 241,
+      "name": "Apache License 1.0",
+      "licenseId": "Apache-1.0",
+      "seeAlso": [
+        "http://www.apache.org/licenses/LICENSE-1.0"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/copyleft-next-0.3.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/copyleft-next-0.3.1.json",
+      "referenceNumber": 242,
+      "name": "copyleft-next 0.3.1",
+      "licenseId": "copyleft-next-0.3.1",
+      "seeAlso": [
+        "https://github.com/copyleft-next/copyleft-next/blob/master/Releases/copyleft-next-0.3.1"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/GFDL-1.2-or-later.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2-or-later.json",
+      "referenceNumber": 243,
+      "name": "GNU Free Documentation License v1.2 or later",
+      "licenseId": "GFDL-1.2-or-later",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/GPL-3.0+.html",
+      "isDeprecatedLicenseId": true,
+      "detailsUrl": "https://spdx.org/licenses/GPL-3.0+.json",
+      "referenceNumber": 244,
+      "name": "GNU General Public License v3.0 or later",
+      "licenseId": "GPL-3.0+",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/gpl-3.0-standalone.html",
+        "https://opensource.org/licenses/GPL-3.0"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/MulanPSL-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/MulanPSL-2.0.json",
+      "referenceNumber": 245,
+      "name": "Mulan Permissive Software License, Version 2",
+      "licenseId": "MulanPSL-2.0",
+      "seeAlso": [
+        "https://license.coscl.org.cn/MulanPSL2/"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/FSFAP.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/FSFAP.json",
+      "referenceNumber": 246,
+      "name": "FSF All Permissive License",
+      "licenseId": "FSFAP",
+      "seeAlso": [
+        "https://www.gnu.org/prep/maintain/html_node/License-Notices-for-Other-Files.html"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/Xerox.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Xerox.json",
+      "referenceNumber": 247,
+      "name": "Xerox License",
+      "licenseId": "Xerox",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Xerox"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CDDL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CDDL-1.0.json",
+      "referenceNumber": 248,
+      "name": "Common Development and Distribution License 1.0",
+      "licenseId": "CDDL-1.0",
+      "seeAlso": [
+        "https://opensource.org/licenses/cddl1"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/GFDL-1.3-invariants-only.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-invariants-only.json",
+      "referenceNumber": 249,
+      "name": "GNU Free Documentation License v1.3 only - invariants",
+      "licenseId": "GFDL-1.3-invariants-only",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/fdl-1.3.txt"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/etalab-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/etalab-2.0.json",
+      "referenceNumber": 250,
+      "name": "Etalab Open License 2.0",
+      "licenseId": "etalab-2.0",
+      "seeAlso": [
+        "https://github.com/DISIC/politique-de-contribution-open-source/blob/master/LICENSE.pdf",
+        "https://raw.githubusercontent.com/DISIC/politique-de-contribution-open-source/master/LICENSE"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/XFree86-1.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/XFree86-1.1.json",
+      "referenceNumber": 251,
+      "name": "XFree86 License 1.1",
+      "licenseId": "XFree86-1.1",
+      "seeAlso": [
+        "http://www.xfree86.org/current/LICENSE4.html"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/SNIA.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/SNIA.json",
+      "referenceNumber": 252,
+      "name": "SNIA Public License 1.1",
+      "licenseId": "SNIA",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/SNIA_Public_License"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/LPPL-1.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/LPPL-1.1.json",
+      "referenceNumber": 253,
+      "name": "LaTeX Project Public License v1.1",
+      "licenseId": "LPPL-1.1",
+      "seeAlso": [
+        "http://www.latex-project.org/lppl/lppl-1-1.txt"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CATOSL-1.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CATOSL-1.1.json",
+      "referenceNumber": 254,
+      "name": "Computer Associates Trusted Open Source License 1.1",
+      "licenseId": "CATOSL-1.1",
+      "seeAlso": [
+        "https://opensource.org/licenses/CATOSL-1.1"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/TU-Berlin-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/TU-Berlin-2.0.json",
+      "referenceNumber": 255,
+      "name": "Technische Universitaet Berlin License 2.0",
+      "licenseId": "TU-Berlin-2.0",
+      "seeAlso": [
+        "https://github.com/CorsixTH/deps/blob/fd339a9f526d1d9c9f01ccf39e438a015da50035/licences/libgsm.txt"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/GFDL-1.3.html",
+      "isDeprecatedLicenseId": true,
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3.json",
+      "referenceNumber": 256,
+      "name": "GNU Free Documentation License v1.3",
+      "licenseId": "GFDL-1.3",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/fdl-1.3.txt"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/GFDL-1.3-or-later.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-or-later.json",
+      "referenceNumber": 257,
+      "name": "GNU Free Documentation License v1.3 or later",
+      "licenseId": "GFDL-1.3-or-later",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/fdl-1.3.txt"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/LAL-1.2.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/LAL-1.2.json",
+      "referenceNumber": 258,
+      "name": "Licence Art Libre 1.2",
+      "licenseId": "LAL-1.2",
+      "seeAlso": [
+        "http://artlibre.org/licence/lal/licence-art-libre-12/"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/ICU.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/ICU.json",
+      "referenceNumber": 259,
+      "name": "ICU License",
+      "licenseId": "ICU",
+      "seeAlso": [
+        "http://source.icu-project.org/repos/icu/icu/trunk/license.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/FTL.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/FTL.json",
+      "referenceNumber": 260,
+      "name": "Freetype Project License",
+      "licenseId": "FTL",
+      "seeAlso": [
+        "http://freetype.fis.uniroma2.it/FTL.TXT",
+        "http://git.savannah.gnu.org/cgit/freetype/freetype2.git/tree/docs/FTL.TXT",
+        "http://gitlab.freedesktop.org/freetype/freetype/-/raw/master/docs/FTL.TXT"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/MirOS.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/MirOS.json",
+      "referenceNumber": 261,
+      "name": "The MirOS Licence",
+      "licenseId": "MirOS",
+      "seeAlso": [
+        "https://opensource.org/licenses/MirOS"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/BSD-2-Clause-NetBSD.html",
+      "isDeprecatedLicenseId": true,
+      "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause-NetBSD.json",
+      "referenceNumber": 262,
+      "name": "BSD 2-Clause NetBSD License",
+      "licenseId": "BSD-2-Clause-NetBSD",
+      "seeAlso": [
+        "http://www.netbsd.org/about/redistribution.html#default"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-3.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-3.0.json",
+      "referenceNumber": 263,
+      "name": "Creative Commons Attribution Non Commercial No Derivatives 3.0 Unported",
+      "licenseId": "CC-BY-NC-ND-3.0",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-nc-nd/3.0/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/OSET-PL-2.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OSET-PL-2.1.json",
+      "referenceNumber": 264,
+      "name": "OSET Public License version 2.1",
+      "licenseId": "OSET-PL-2.1",
+      "seeAlso": [
+        "http://www.osetfoundation.org/public-license",
+        "https://opensource.org/licenses/OPL-2.1"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-2.0.json",
+      "referenceNumber": 265,
+      "name": "Creative Commons Attribution Non Commercial No Derivatives 2.0 Generic",
+      "licenseId": "CC-BY-NC-ND-2.0",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-nc-nd/2.0/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/SISSL-1.2.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/SISSL-1.2.json",
+      "referenceNumber": 266,
+      "name": "Sun Industry Standards Source License v1.2",
+      "licenseId": "SISSL-1.2",
+      "seeAlso": [
+        "http://gridscheduler.sourceforge.net/Gridengine_SISSL_license.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Wsuipa.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Wsuipa.json",
+      "referenceNumber": 267,
+      "name": "Wsuipa License",
+      "licenseId": "Wsuipa",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Wsuipa"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Zimbra-1.4.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Zimbra-1.4.json",
+      "referenceNumber": 268,
+      "name": "Zimbra Public License v1.4",
+      "licenseId": "Zimbra-1.4",
+      "seeAlso": [
+        "http://www.zimbra.com/legal/zimbra-public-license-1-4"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Linux-OpenIB.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Linux-OpenIB.json",
+      "referenceNumber": 269,
+      "name": "Linux Kernel Variant of OpenIB.org license",
+      "licenseId": "Linux-OpenIB",
+      "seeAlso": [
+        "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/infiniband/core/sa.h"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/LGPL-3.0.html",
+      "isDeprecatedLicenseId": true,
+      "detailsUrl": "https://spdx.org/licenses/LGPL-3.0.json",
+      "referenceNumber": 270,
+      "name": "GNU Lesser General Public License v3.0 only",
+      "licenseId": "LGPL-3.0",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/lgpl-3.0-standalone.html",
+        "https://opensource.org/licenses/LGPL-3.0"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/OLDAP-2.5.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.5.json",
+      "referenceNumber": 271,
+      "name": "Open LDAP Public License v2.5",
+      "licenseId": "OLDAP-2.5",
+      "seeAlso": [
+        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\u003dblob;f\u003dLICENSE;hb\u003d6852b9d90022e8593c98205413380536b1b5a7cf"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/AMPAS.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/AMPAS.json",
+      "referenceNumber": 272,
+      "name": "Academy of Motion Picture Arts and Sciences BSD",
+      "licenseId": "AMPAS",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/BSD#AMPASBSD"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/GPL-1.0-or-later.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/GPL-1.0-or-later.json",
+      "referenceNumber": 273,
+      "name": "GNU General Public License v1.0 or later",
+      "licenseId": "GPL-1.0-or-later",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/gpl-1.0-standalone.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/BUSL-1.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/BUSL-1.1.json",
+      "referenceNumber": 274,
+      "name": "Business Source License 1.1",
+      "licenseId": "BUSL-1.1",
+      "seeAlso": [
+        "https://mariadb.com/bsl11/"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Adobe-Glyph.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Adobe-Glyph.json",
+      "referenceNumber": 275,
+      "name": "Adobe Glyph List License",
+      "licenseId": "Adobe-Glyph",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/MIT#AdobeGlyph"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/0BSD.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/0BSD.json",
+      "referenceNumber": 276,
+      "name": "BSD Zero Clause License",
+      "licenseId": "0BSD",
+      "seeAlso": [
+        "http://landley.net/toybox/license.html"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/W3C-19980720.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/W3C-19980720.json",
+      "referenceNumber": 277,
+      "name": "W3C Software Notice and License (1998-07-20)",
+      "licenseId": "W3C-19980720",
+      "seeAlso": [
+        "http://www.w3.org/Consortium/Legal/copyright-software-19980720.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/FSFUL.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/FSFUL.json",
+      "referenceNumber": 278,
+      "name": "FSF Unlimited License",
+      "licenseId": "FSFUL",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/FSF_Unlimited_License"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-3.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-3.0.json",
+      "referenceNumber": 279,
+      "name": "Creative Commons Attribution Non Commercial Share Alike 3.0 Unported",
+      "licenseId": "CC-BY-NC-SA-3.0",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-nc-sa/3.0/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/DOC.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/DOC.json",
+      "referenceNumber": 280,
+      "name": "DOC License",
+      "licenseId": "DOC",
+      "seeAlso": [
+        "http://www.cs.wustl.edu/~schmidt/ACE-copying.html",
+        "https://www.dre.vanderbilt.edu/~schmidt/ACE-copying.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/TMate.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/TMate.json",
+      "referenceNumber": 281,
+      "name": "TMate Open Source License",
+      "licenseId": "TMate",
+      "seeAlso": [
+        "http://svnkit.com/license.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/MIT-open-group.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/MIT-open-group.json",
+      "referenceNumber": 282,
+      "name": "MIT Open Group variant",
+      "licenseId": "MIT-open-group",
+      "seeAlso": [
+        "https://gitlab.freedesktop.org/xorg/app/iceauth/-/blob/master/COPYING",
+        "https://gitlab.freedesktop.org/xorg/app/xvinfo/-/blob/master/COPYING",
+        "https://gitlab.freedesktop.org/xorg/app/xsetroot/-/blob/master/COPYING",
+        "https://gitlab.freedesktop.org/xorg/app/xauth/-/blob/master/COPYING"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/AMDPLPA.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/AMDPLPA.json",
+      "referenceNumber": 283,
+      "name": "AMD\u0027s plpa_map.c License",
+      "licenseId": "AMDPLPA",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/AMD_plpa_map_License"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Condor-1.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Condor-1.1.json",
+      "referenceNumber": 284,
+      "name": "Condor Public License v1.1",
+      "licenseId": "Condor-1.1",
+      "seeAlso": [
+        "http://research.cs.wisc.edu/condor/license.html#condor",
+        "http://web.archive.org/web/20111123062036/http://research.cs.wisc.edu/condor/license.html#condor"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/PolyForm-Noncommercial-1.0.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/PolyForm-Noncommercial-1.0.0.json",
+      "referenceNumber": 285,
+      "name": "PolyForm Noncommercial License 1.0.0",
+      "licenseId": "PolyForm-Noncommercial-1.0.0",
+      "seeAlso": [
+        "https://polyformproject.org/licenses/noncommercial/1.0.0"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-No-Military-License.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-No-Military-License.json",
+      "referenceNumber": 286,
+      "name": "BSD 3-Clause No Military License",
+      "licenseId": "BSD-3-Clause-No-Military-License",
+      "seeAlso": [
+        "https://gitlab.syncad.com/hive/dhive/-/blob/master/LICENSE",
+        "https://github.com/greymass/swift-eosio/blob/master/LICENSE"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-4.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-4.0.json",
+      "referenceNumber": 287,
+      "name": "Creative Commons Attribution 4.0 International",
+      "licenseId": "CC-BY-4.0",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by/4.0/legalcode"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/OGL-Canada-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OGL-Canada-2.0.json",
+      "referenceNumber": 288,
+      "name": "Open Government Licence - Canada",
+      "licenseId": "OGL-Canada-2.0",
+      "seeAlso": [
+        "https://open.canada.ca/en/open-government-licence-canada"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-3.0-IGO.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-3.0-IGO.json",
+      "referenceNumber": 289,
+      "name": "Creative Commons Attribution Non Commercial Share Alike 3.0 IGO",
+      "licenseId": "CC-BY-NC-SA-3.0-IGO",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-nc-sa/3.0/igo/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/EFL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/EFL-1.0.json",
+      "referenceNumber": 290,
+      "name": "Eiffel Forum License v1.0",
+      "licenseId": "EFL-1.0",
+      "seeAlso": [
+        "http://www.eiffel-nice.org/license/forum.txt",
+        "https://opensource.org/licenses/EFL-1.0"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/Newsletr.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Newsletr.json",
+      "referenceNumber": 291,
+      "name": "Newsletr License",
+      "licenseId": "Newsletr",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Newsletr"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/copyleft-next-0.3.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/copyleft-next-0.3.0.json",
+      "referenceNumber": 292,
+      "name": "copyleft-next 0.3.0",
+      "licenseId": "copyleft-next-0.3.0",
+      "seeAlso": [
+        "https://github.com/copyleft-next/copyleft-next/blob/master/Releases/copyleft-next-0.3.0"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/GPL-3.0-or-later.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/GPL-3.0-or-later.json",
+      "referenceNumber": 293,
+      "name": "GNU General Public License v3.0 or later",
+      "licenseId": "GPL-3.0-or-later",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/gpl-3.0-standalone.html",
+        "https://opensource.org/licenses/GPL-3.0"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/CDLA-Permissive-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CDLA-Permissive-2.0.json",
+      "referenceNumber": 294,
+      "name": "Community Data License Agreement Permissive 2.0",
+      "licenseId": "CDLA-Permissive-2.0",
+      "seeAlso": [
+        "https://cdla.dev/permissive-2-0"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-ND-3.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-3.0.json",
+      "referenceNumber": 295,
+      "name": "Creative Commons Attribution No Derivatives 3.0 Unported",
+      "licenseId": "CC-BY-ND-3.0",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-nd/3.0/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/C-UDA-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/C-UDA-1.0.json",
+      "referenceNumber": 296,
+      "name": "Computational Use of Data Agreement v1.0",
+      "licenseId": "C-UDA-1.0",
+      "seeAlso": [
+        "https://github.com/microsoft/Computational-Use-of-Data-Agreement/blob/master/C-UDA-1.0.md",
+        "https://cdla.dev/computational-use-of-data-agreement-v1-0/"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Barr.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Barr.json",
+      "referenceNumber": 297,
+      "name": "Barr License",
+      "licenseId": "Barr",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Barr"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Vim.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Vim.json",
+      "referenceNumber": 298,
+      "name": "Vim License",
+      "licenseId": "Vim",
+      "seeAlso": [
+        "http://vimdoc.sourceforge.net/htmldoc/uganda.html"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/GPL-2.0-with-classpath-exception.html",
+      "isDeprecatedLicenseId": true,
+      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-with-classpath-exception.json",
+      "referenceNumber": 299,
+      "name": "GNU General Public License v2.0 w/Classpath exception",
+      "licenseId": "GPL-2.0-with-classpath-exception",
+      "seeAlso": [
+        "https://www.gnu.org/software/classpath/license.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/BitTorrent-1.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/BitTorrent-1.1.json",
+      "referenceNumber": 300,
+      "name": "BitTorrent Open Source License v1.1",
+      "licenseId": "BitTorrent-1.1",
+      "seeAlso": [
+        "http://directory.fsf.org/wiki/License:BitTorrentOSL1.1"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/CDL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CDL-1.0.json",
+      "referenceNumber": 301,
+      "name": "Common Documentation License 1.0",
+      "licenseId": "CDL-1.0",
+      "seeAlso": [
+        "http://www.opensource.apple.com/cdl/",
+        "https://fedoraproject.org/wiki/Licensing/Common_Documentation_License",
+        "https://www.gnu.org/licenses/license-list.html#ACDL"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-SA-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-1.0.json",
+      "referenceNumber": 302,
+      "name": "Creative Commons Attribution Share Alike 1.0 Generic",
+      "licenseId": "CC-BY-SA-1.0",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-sa/1.0/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/ADSL.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/ADSL.json",
+      "referenceNumber": 303,
+      "name": "Amazon Digital Services License",
+      "licenseId": "ADSL",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/AmazonDigitalServicesLicense"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/PostgreSQL.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/PostgreSQL.json",
+      "referenceNumber": 304,
+      "name": "PostgreSQL License",
+      "licenseId": "PostgreSQL",
+      "seeAlso": [
+        "http://www.postgresql.org/about/licence",
+        "https://opensource.org/licenses/PostgreSQL"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/OFL-1.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OFL-1.1.json",
+      "referenceNumber": 305,
+      "name": "SIL Open Font License 1.1",
+      "licenseId": "OFL-1.1",
+      "seeAlso": [
+        "http://scripts.sil.org/cms/scripts/page.php?item_id\u003dOFL_web",
+        "https://opensource.org/licenses/OFL-1.1"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/NPL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/NPL-1.0.json",
+      "referenceNumber": 306,
+      "name": "Netscape Public License v1.0",
+      "licenseId": "NPL-1.0",
+      "seeAlso": [
+        "http://www.mozilla.org/MPL/NPL/1.0/"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/xinetd.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/xinetd.json",
+      "referenceNumber": 307,
+      "name": "xinetd License",
+      "licenseId": "xinetd",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Xinetd_License"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/LGPL-2.0-only.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/LGPL-2.0-only.json",
+      "referenceNumber": 308,
+      "name": "GNU Library General Public License v2 only",
+      "licenseId": "LGPL-2.0-only",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/lgpl-2.0-standalone.html"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/zlib-acknowledgement.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/zlib-acknowledgement.json",
+      "referenceNumber": 309,
+      "name": "zlib/libpng License with Acknowledgement",
+      "licenseId": "zlib-acknowledgement",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/ZlibWithAcknowledgement"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/OLDAP-2.2.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.2.1.json",
+      "referenceNumber": 310,
+      "name": "Open LDAP Public License v2.2.1",
+      "licenseId": "OLDAP-2.2.1",
+      "seeAlso": [
+        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\u003dblob;f\u003dLICENSE;hb\u003d4bc786f34b50aa301be6f5600f58a980070f481e"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/APSL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/APSL-1.0.json",
+      "referenceNumber": 311,
+      "name": "Apple Public Source License 1.0",
+      "licenseId": "APSL-1.0",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Apple_Public_Source_License_1.0"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-LBNL.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-LBNL.json",
+      "referenceNumber": 312,
+      "name": "Lawrence Berkeley National Labs BSD variant license",
+      "licenseId": "BSD-3-Clause-LBNL",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/LBNLBSD"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/GLWTPL.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/GLWTPL.json",
+      "referenceNumber": 313,
+      "name": "Good Luck With That Public License",
+      "licenseId": "GLWTPL",
+      "seeAlso": [
+        "https://github.com/me-shaon/GLWTPL/commit/da5f6bc734095efbacb442c0b31e33a65b9d6e85"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/LGPL-3.0-only.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/LGPL-3.0-only.json",
+      "referenceNumber": 314,
+      "name": "GNU Lesser General Public License v3.0 only",
+      "licenseId": "LGPL-3.0-only",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/lgpl-3.0-standalone.html",
+        "https://opensource.org/licenses/LGPL-3.0"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/OGC-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OGC-1.0.json",
+      "referenceNumber": 315,
+      "name": "OGC Software License, Version 1.0",
+      "licenseId": "OGC-1.0",
+      "seeAlso": [
+        "https://www.ogc.org/ogc/software/1.0"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Dotseqn.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Dotseqn.json",
+      "referenceNumber": 316,
+      "name": "Dotseqn License",
+      "licenseId": "Dotseqn",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Dotseqn"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/MakeIndex.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/MakeIndex.json",
+      "referenceNumber": 317,
+      "name": "MakeIndex License",
+      "licenseId": "MakeIndex",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/MakeIndex"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/GPL-3.0-only.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/GPL-3.0-only.json",
+      "referenceNumber": 318,
+      "name": "GNU General Public License v3.0 only",
+      "licenseId": "GPL-3.0-only",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/gpl-3.0-standalone.html",
+        "https://opensource.org/licenses/GPL-3.0"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-License-2014.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-License-2014.json",
+      "referenceNumber": 319,
+      "name": "BSD 3-Clause No Nuclear License 2014",
+      "licenseId": "BSD-3-Clause-No-Nuclear-License-2014",
+      "seeAlso": [
+        "https://java.net/projects/javaeetutorial/pages/BerkeleyLicense"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/GPL-1.0-only.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/GPL-1.0-only.json",
+      "referenceNumber": 320,
+      "name": "GNU General Public License v1.0 only",
+      "licenseId": "GPL-1.0-only",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/gpl-1.0-standalone.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/IJG.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/IJG.json",
+      "referenceNumber": 321,
+      "name": "Independent JPEG Group License",
+      "licenseId": "IJG",
+      "seeAlso": [
+        "http://dev.w3.org/cvsweb/Amaya/libjpeg/Attic/README?rev\u003d1.2"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/AGPL-1.0-or-later.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/AGPL-1.0-or-later.json",
+      "referenceNumber": 322,
+      "name": "Affero General Public License v1.0 or later",
+      "licenseId": "AGPL-1.0-or-later",
+      "seeAlso": [
+        "http://www.affero.org/oagpl.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/OFL-1.1-no-RFN.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OFL-1.1-no-RFN.json",
+      "referenceNumber": 323,
+      "name": "SIL Open Font License 1.1 with no Reserved Font Name",
+      "licenseId": "OFL-1.1-no-RFN",
+      "seeAlso": [
+        "http://scripts.sil.org/cms/scripts/page.php?item_id\u003dOFL_web",
+        "https://opensource.org/licenses/OFL-1.1"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/BSL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/BSL-1.0.json",
+      "referenceNumber": 324,
+      "name": "Boost Software License 1.0",
+      "licenseId": "BSL-1.0",
+      "seeAlso": [
+        "http://www.boost.org/LICENSE_1_0.txt",
+        "https://opensource.org/licenses/BSL-1.0"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/Libpng.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Libpng.json",
+      "referenceNumber": 325,
+      "name": "libpng License",
+      "licenseId": "Libpng",
+      "seeAlso": [
+        "http://www.libpng.org/pub/png/src/libpng-LICENSE.txt"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-NC-3.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-3.0.json",
+      "referenceNumber": 326,
+      "name": "Creative Commons Attribution Non Commercial 3.0 Unported",
+      "licenseId": "CC-BY-NC-3.0",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-nc/3.0/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-NC-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-2.0.json",
+      "referenceNumber": 327,
+      "name": "Creative Commons Attribution Non Commercial 2.0 Generic",
+      "licenseId": "CC-BY-NC-2.0",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-nc/2.0/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Unlicense.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Unlicense.json",
+      "referenceNumber": 328,
+      "name": "The Unlicense",
+      "licenseId": "Unlicense",
+      "seeAlso": [
+        "https://unlicense.org/"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/LPL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/LPL-1.0.json",
+      "referenceNumber": 329,
+      "name": "Lucent Public License Version 1.0",
+      "licenseId": "LPL-1.0",
+      "seeAlso": [
+        "https://opensource.org/licenses/LPL-1.0"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/bzip2-1.0.5.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/bzip2-1.0.5.json",
+      "referenceNumber": 330,
+      "name": "bzip2 and libbzip2 License v1.0.5",
+      "licenseId": "bzip2-1.0.5",
+      "seeAlso": [
+        "https://sourceware.org/bzip2/1.0.5/bzip2-manual-1.0.5.html",
+        "http://bzip.org/1.0.5/bzip2-manual-1.0.5.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Entessa.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Entessa.json",
+      "referenceNumber": 331,
+      "name": "Entessa Public License v1.0",
+      "licenseId": "Entessa",
+      "seeAlso": [
+        "https://opensource.org/licenses/Entessa"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/BSD-2-Clause-Patent.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause-Patent.json",
+      "referenceNumber": 332,
+      "name": "BSD-2-Clause Plus Patent License",
+      "licenseId": "BSD-2-Clause-Patent",
+      "seeAlso": [
+        "https://opensource.org/licenses/BSDplusPatent"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/ECL-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/ECL-2.0.json",
+      "referenceNumber": 333,
+      "name": "Educational Community License v2.0",
+      "licenseId": "ECL-2.0",
+      "seeAlso": [
+        "https://opensource.org/licenses/ECL-2.0"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/Crossword.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Crossword.json",
+      "referenceNumber": 334,
+      "name": "Crossword License",
+      "licenseId": "Crossword",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Crossword"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-1.0.json",
+      "referenceNumber": 335,
+      "name": "Creative Commons Attribution Non Commercial No Derivatives 1.0 Generic",
+      "licenseId": "CC-BY-NC-ND-1.0",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-nd-nc/1.0/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/OCLC-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OCLC-2.0.json",
+      "referenceNumber": 336,
+      "name": "OCLC Research Public License 2.0",
+      "licenseId": "OCLC-2.0",
+      "seeAlso": [
+        "http://www.oclc.org/research/activities/software/license/v2final.htm",
+        "https://opensource.org/licenses/OCLC-2.0"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/CECILL-1.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CECILL-1.1.json",
+      "referenceNumber": 337,
+      "name": "CeCILL Free Software License Agreement v1.1",
+      "licenseId": "CECILL-1.1",
+      "seeAlso": [
+        "http://www.cecill.info/licences/Licence_CeCILL_V1.1-US.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CECILL-2.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CECILL-2.1.json",
+      "referenceNumber": 338,
+      "name": "CeCILL Free Software License Agreement v2.1",
+      "licenseId": "CECILL-2.1",
+      "seeAlso": [
+        "http://www.cecill.info/licences/Licence_CeCILL_V2.1-en.html"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/OGDL-Taiwan-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OGDL-Taiwan-1.0.json",
+      "referenceNumber": 339,
+      "name": "Taiwan Open Government Data License, version 1.0",
+      "licenseId": "OGDL-Taiwan-1.0",
+      "seeAlso": [
+        "https://data.gov.tw/license"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Abstyles.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Abstyles.json",
+      "referenceNumber": 340,
+      "name": "Abstyles License",
+      "licenseId": "Abstyles",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Abstyles"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/libselinux-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/libselinux-1.0.json",
+      "referenceNumber": 341,
+      "name": "libselinux public domain notice",
+      "licenseId": "libselinux-1.0",
+      "seeAlso": [
+        "https://github.com/SELinuxProject/selinux/blob/master/libselinux/LICENSE"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/ANTLR-PD.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/ANTLR-PD.json",
+      "referenceNumber": 342,
+      "name": "ANTLR Software Rights Notice",
+      "licenseId": "ANTLR-PD",
+      "seeAlso": [
+        "http://www.antlr2.org/license.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/GPL-2.0-or-later.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-or-later.json",
+      "referenceNumber": 343,
+      "name": "GNU General Public License v2.0 or later",
+      "licenseId": "GPL-2.0-or-later",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html",
+        "https://opensource.org/licenses/GPL-2.0"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/IPL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/IPL-1.0.json",
+      "referenceNumber": 344,
+      "name": "IBM Public License v1.0",
+      "licenseId": "IPL-1.0",
+      "seeAlso": [
+        "https://opensource.org/licenses/IPL-1.0"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/MIT-enna.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/MIT-enna.json",
+      "referenceNumber": 345,
+      "name": "enna License",
+      "licenseId": "MIT-enna",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/MIT#enna"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CPOL-1.02.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CPOL-1.02.json",
+      "referenceNumber": 346,
+      "name": "Code Project Open License 1.02",
+      "licenseId": "CPOL-1.02",
+      "seeAlso": [
+        "http://www.codeproject.com/info/cpol10.aspx"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-SA-3.0-AT.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-3.0-AT.json",
+      "referenceNumber": 347,
+      "name": "Creative Commons Attribution Share Alike 3.0 Austria",
+      "licenseId": "CC-BY-SA-3.0-AT",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-sa/3.0/at/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/GPL-3.0-with-GCC-exception.html",
+      "isDeprecatedLicenseId": true,
+      "detailsUrl": "https://spdx.org/licenses/GPL-3.0-with-GCC-exception.json",
+      "referenceNumber": 348,
+      "name": "GNU General Public License v3.0 w/GCC Runtime Library exception",
+      "licenseId": "GPL-3.0-with-GCC-exception",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/gcc-exception-3.1.html"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/BSD-1-Clause.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/BSD-1-Clause.json",
+      "referenceNumber": 349,
+      "name": "BSD 1-Clause License",
+      "licenseId": "BSD-1-Clause",
+      "seeAlso": [
+        "https://svnweb.freebsd.org/base/head/include/ifaddrs.h?revision\u003d326823"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/NTP-0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/NTP-0.json",
+      "referenceNumber": 350,
+      "name": "NTP No Attribution",
+      "licenseId": "NTP-0",
+      "seeAlso": [
+        "https://github.com/tytso/e2fsprogs/blob/master/lib/et/et_name.c"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/SugarCRM-1.1.3.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/SugarCRM-1.1.3.json",
+      "referenceNumber": 351,
+      "name": "SugarCRM Public License v1.1.3",
+      "licenseId": "SugarCRM-1.1.3",
+      "seeAlso": [
+        "http://www.sugarcrm.com/crm/SPL"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/MIT.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/MIT.json",
+      "referenceNumber": 352,
+      "name": "MIT License",
+      "licenseId": "MIT",
+      "seeAlso": [
+        "https://opensource.org/licenses/MIT"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/OFL-1.1-RFN.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OFL-1.1-RFN.json",
+      "referenceNumber": 353,
+      "name": "SIL Open Font License 1.1 with Reserved Font Name",
+      "licenseId": "OFL-1.1-RFN",
+      "seeAlso": [
+        "http://scripts.sil.org/cms/scripts/page.php?item_id\u003dOFL_web",
+        "https://opensource.org/licenses/OFL-1.1"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/Watcom-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Watcom-1.0.json",
+      "referenceNumber": 354,
+      "name": "Sybase Open Watcom Public License 1.0",
+      "licenseId": "Watcom-1.0",
+      "seeAlso": [
+        "https://opensource.org/licenses/Watcom-1.0"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.0-FR.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-2.0-FR.json",
+      "referenceNumber": 355,
+      "name": "Creative Commons Attribution-NonCommercial-ShareAlike 2.0 France",
+      "licenseId": "CC-BY-NC-SA-2.0-FR",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-nc-sa/2.0/fr/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/ODbL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/ODbL-1.0.json",
+      "referenceNumber": 356,
+      "name": "Open Data Commons Open Database License v1.0",
+      "licenseId": "ODbL-1.0",
+      "seeAlso": [
+        "http://www.opendatacommons.org/licenses/odbl/1.0/",
+        "https://opendatacommons.org/licenses/odbl/1-0/"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/FSFULLR.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/FSFULLR.json",
+      "referenceNumber": 357,
+      "name": "FSF Unlimited License (with License Retention)",
+      "licenseId": "FSFULLR",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/FSF_Unlimited_License#License_Retention_Variant"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/OLDAP-1.3.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-1.3.json",
+      "referenceNumber": 358,
+      "name": "Open LDAP Public License v1.3",
+      "licenseId": "OLDAP-1.3",
+      "seeAlso": [
+        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\u003dblob;f\u003dLICENSE;hb\u003de5f8117f0ce088d0bd7a8e18ddf37eaa40eb09b1"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/SSH-OpenSSH.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/SSH-OpenSSH.json",
+      "referenceNumber": 359,
+      "name": "SSH OpenSSH license",
+      "licenseId": "SSH-OpenSSH",
+      "seeAlso": [
+        "https://github.com/openssh/openssh-portable/blob/1b11ea7c58cd5c59838b5fa574cd456d6047b2d4/LICENCE#L10"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/BSD-2-Clause.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause.json",
+      "referenceNumber": 360,
+      "name": "BSD 2-Clause \"Simplified\" License",
+      "licenseId": "BSD-2-Clause",
+      "seeAlso": [
+        "https://opensource.org/licenses/BSD-2-Clause"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/HPND.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/HPND.json",
+      "referenceNumber": 361,
+      "name": "Historical Permission Notice and Disclaimer",
+      "licenseId": "HPND",
+      "seeAlso": [
+        "https://opensource.org/licenses/HPND"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/Zimbra-1.3.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Zimbra-1.3.json",
+      "referenceNumber": 362,
+      "name": "Zimbra Public License v1.3",
+      "licenseId": "Zimbra-1.3",
+      "seeAlso": [
+        "http://web.archive.org/web/20100302225219/http://www.zimbra.com/license/zimbra-public-license-1-3.html"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/Borceux.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Borceux.json",
+      "referenceNumber": 363,
+      "name": "Borceux license",
+      "licenseId": "Borceux",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Borceux"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/OLDAP-1.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-1.1.json",
+      "referenceNumber": 364,
+      "name": "Open LDAP Public License v1.1",
+      "licenseId": "OLDAP-1.1",
+      "seeAlso": [
+        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\u003dblob;f\u003dLICENSE;hb\u003d806557a5ad59804ef3a44d5abfbe91d706b0791f"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/OFL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OFL-1.0.json",
+      "referenceNumber": 365,
+      "name": "SIL Open Font License 1.0",
+      "licenseId": "OFL-1.0",
+      "seeAlso": [
+        "http://scripts.sil.org/cms/scripts/page.php?item_id\u003dOFL10_web"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/NASA-1.3.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/NASA-1.3.json",
+      "referenceNumber": 366,
+      "name": "NASA Open Source Agreement 1.3",
+      "licenseId": "NASA-1.3",
+      "seeAlso": [
+        "http://ti.arc.nasa.gov/opensource/nosa/",
+        "https://opensource.org/licenses/NASA-1.3"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/VOSTROM.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/VOSTROM.json",
+      "referenceNumber": 367,
+      "name": "VOSTROM Public License for Open Source",
+      "licenseId": "VOSTROM",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/VOSTROM"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/MIT-0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/MIT-0.json",
+      "referenceNumber": 368,
+      "name": "MIT No Attribution",
+      "licenseId": "MIT-0",
+      "seeAlso": [
+        "https://github.com/aws/mit-0",
+        "https://romanrm.net/mit-zero",
+        "https://github.com/awsdocs/aws-cloud9-user-guide/blob/master/LICENSE-SAMPLECODE"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/ISC.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/ISC.json",
+      "referenceNumber": 369,
+      "name": "ISC License",
+      "licenseId": "ISC",
+      "seeAlso": [
+        "https://www.isc.org/licenses/",
+        "https://www.isc.org/downloads/software-support-policy/isc-license/",
+        "https://opensource.org/licenses/ISC"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/Unicode-DFS-2016.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Unicode-DFS-2016.json",
+      "referenceNumber": 370,
+      "name": "Unicode License Agreement - Data Files and Software (2016)",
+      "licenseId": "Unicode-DFS-2016",
+      "seeAlso": [
+        "http://www.unicode.org/copyright.html"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/BlueOak-1.0.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/BlueOak-1.0.0.json",
+      "referenceNumber": 371,
+      "name": "Blue Oak Model License 1.0.0",
+      "licenseId": "BlueOak-1.0.0",
+      "seeAlso": [
+        "https://blueoakcouncil.org/license/1.0.0"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/LiLiQ-Rplus-1.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/LiLiQ-Rplus-1.1.json",
+      "referenceNumber": 372,
+      "name": "Licence Libre du Québec – Réciprocité forte version 1.1",
+      "licenseId": "LiLiQ-Rplus-1.1",
+      "seeAlso": [
+        "https://www.forge.gouv.qc.ca/participez/licence-logicielle/licence-libre-du-quebec-liliq-en-francais/licence-libre-du-quebec-reciprocite-forte-liliq-r-v1-1/",
+        "http://opensource.org/licenses/LiLiQ-Rplus-1.1"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/NOSL.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/NOSL.json",
+      "referenceNumber": 373,
+      "name": "Netizen Open Source License",
+      "licenseId": "NOSL",
+      "seeAlso": [
+        "http://bits.netizen.com.au/licenses/NOSL/nosl.txt"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/SMLNJ.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/SMLNJ.json",
+      "referenceNumber": 374,
+      "name": "Standard ML of New Jersey License",
+      "licenseId": "SMLNJ",
+      "seeAlso": [
+        "https://www.smlnj.org/license.html"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/LGPL-3.0+.html",
+      "isDeprecatedLicenseId": true,
+      "detailsUrl": "https://spdx.org/licenses/LGPL-3.0+.json",
+      "referenceNumber": 375,
+      "name": "GNU Lesser General Public License v3.0 or later",
+      "licenseId": "LGPL-3.0+",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/lgpl-3.0-standalone.html",
+        "https://opensource.org/licenses/LGPL-3.0"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/CPAL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CPAL-1.0.json",
+      "referenceNumber": 376,
+      "name": "Common Public Attribution License 1.0",
+      "licenseId": "CPAL-1.0",
+      "seeAlso": [
+        "https://opensource.org/licenses/CPAL-1.0"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/PSF-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/PSF-2.0.json",
+      "referenceNumber": 377,
+      "name": "Python Software Foundation License 2.0",
+      "licenseId": "PSF-2.0",
+      "seeAlso": [
+        "https://opensource.org/licenses/Python-2.0"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/RPL-1.5.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/RPL-1.5.json",
+      "referenceNumber": 378,
+      "name": "Reciprocal Public License 1.5",
+      "licenseId": "RPL-1.5",
+      "seeAlso": [
+        "https://opensource.org/licenses/RPL-1.5"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/BSD-2-Clause-FreeBSD.html",
+      "isDeprecatedLicenseId": true,
+      "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause-FreeBSD.json",
+      "referenceNumber": 379,
+      "name": "BSD 2-Clause FreeBSD License",
+      "licenseId": "BSD-2-Clause-FreeBSD",
+      "seeAlso": [
+        "http://www.freebsd.org/copyright/freebsd-license.html"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/MIT-Modern-Variant.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/MIT-Modern-Variant.json",
+      "referenceNumber": 380,
+      "name": "MIT License Modern Variant",
+      "licenseId": "MIT-Modern-Variant",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing:MIT#Modern_Variants",
+        "https://ptolemy.berkeley.edu/copyright.htm",
+        "https://pirlwww.lpl.arizona.edu/resources/guide/software/PerlTk/Tixlic.html"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/Nokia.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Nokia.json",
+      "referenceNumber": 381,
+      "name": "Nokia Open Source License",
+      "licenseId": "Nokia",
+      "seeAlso": [
+        "https://opensource.org/licenses/nokia"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/GFDL-1.1-no-invariants-only.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1-no-invariants-only.json",
+      "referenceNumber": 382,
+      "name": "GNU Free Documentation License v1.1 only - no invariants",
+      "licenseId": "GFDL-1.1-no-invariants-only",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/PDDL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/PDDL-1.0.json",
+      "referenceNumber": 383,
+      "name": "Open Data Commons Public Domain Dedication \u0026 License 1.0",
+      "licenseId": "PDDL-1.0",
+      "seeAlso": [
+        "http://opendatacommons.org/licenses/pddl/1.0/",
+        "https://opendatacommons.org/licenses/pddl/"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/EUPL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/EUPL-1.0.json",
+      "referenceNumber": 384,
+      "name": "European Union Public License 1.0",
+      "licenseId": "EUPL-1.0",
+      "seeAlso": [
+        "http://ec.europa.eu/idabc/en/document/7330.html",
+        "http://ec.europa.eu/idabc/servlets/Doc027f.pdf?id\u003d31096"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CDDL-1.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CDDL-1.1.json",
+      "referenceNumber": 385,
+      "name": "Common Development and Distribution License 1.1",
+      "licenseId": "CDDL-1.1",
+      "seeAlso": [
+        "http://glassfish.java.net/public/CDDL+GPL_1_1.html",
+        "https://javaee.github.io/glassfish/LICENSE"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/GFDL-1.3-only.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-only.json",
+      "referenceNumber": 386,
+      "name": "GNU Free Documentation License v1.3 only",
+      "licenseId": "GFDL-1.3-only",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/fdl-1.3.txt"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/OLDAP-2.6.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.6.json",
+      "referenceNumber": 387,
+      "name": "Open LDAP Public License v2.6",
+      "licenseId": "OLDAP-2.6",
+      "seeAlso": [
+        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\u003dblob;f\u003dLICENSE;hb\u003d1cae062821881f41b73012ba816434897abf4205"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/JSON.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/JSON.json",
+      "referenceNumber": 388,
+      "name": "JSON License",
+      "licenseId": "JSON",
+      "seeAlso": [
+        "http://www.json.org/license.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/LGPL-3.0-or-later.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/LGPL-3.0-or-later.json",
+      "referenceNumber": 389,
+      "name": "GNU Lesser General Public License v3.0 or later",
+      "licenseId": "LGPL-3.0-or-later",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/lgpl-3.0-standalone.html",
+        "https://opensource.org/licenses/LGPL-3.0"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/GPL-3.0.html",
+      "isDeprecatedLicenseId": true,
+      "detailsUrl": "https://spdx.org/licenses/GPL-3.0.json",
+      "referenceNumber": 390,
+      "name": "GNU General Public License v3.0 only",
+      "licenseId": "GPL-3.0",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/gpl-3.0-standalone.html",
+        "https://opensource.org/licenses/GPL-3.0"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/Fair.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Fair.json",
+      "referenceNumber": 391,
+      "name": "Fair License",
+      "licenseId": "Fair",
+      "seeAlso": [
+        "http://fairlicense.org/",
+        "https://opensource.org/licenses/Fair"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/GPL-2.0-with-font-exception.html",
+      "isDeprecatedLicenseId": true,
+      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-with-font-exception.json",
+      "referenceNumber": 392,
+      "name": "GNU General Public License v2.0 w/Font exception",
+      "licenseId": "GPL-2.0-with-font-exception",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/gpl-faq.html#FontException"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/OSL-2.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OSL-2.1.json",
+      "referenceNumber": 393,
+      "name": "Open Software License 2.1",
+      "licenseId": "OSL-2.1",
+      "seeAlso": [
+        "http://web.archive.org/web/20050212003940/http://www.rosenlaw.com/osl21.htm",
+        "https://opensource.org/licenses/OSL-2.1"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/LPPL-1.3a.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/LPPL-1.3a.json",
+      "referenceNumber": 394,
+      "name": "LaTeX Project Public License v1.3a",
+      "licenseId": "LPPL-1.3a",
+      "seeAlso": [
+        "http://www.latex-project.org/lppl/lppl-1-3a.txt"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/NAIST-2003.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/NAIST-2003.json",
+      "referenceNumber": 395,
+      "name": "Nara Institute of Science and Technology License (2003)",
+      "licenseId": "NAIST-2003",
+      "seeAlso": [
+        "https://enterprise.dejacode.com/licenses/public/naist-2003/#license-text",
+        "https://github.com/nodejs/node/blob/4a19cc8947b1bba2b2d27816ec3d0edf9b28e503/LICENSE#L343"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-4.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-4.0.json",
+      "referenceNumber": 396,
+      "name": "Creative Commons Attribution Non Commercial No Derivatives 4.0 International",
+      "licenseId": "CC-BY-NC-ND-4.0",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-NC-3.0-DE.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-3.0-DE.json",
+      "referenceNumber": 397,
+      "name": "Creative Commons Attribution Non Commercial 3.0 Germany",
+      "licenseId": "CC-BY-NC-3.0-DE",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-nc/3.0/de/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/LGPL-2.1+.html",
+      "isDeprecatedLicenseId": true,
+      "detailsUrl": "https://spdx.org/licenses/LGPL-2.1+.json",
+      "referenceNumber": 398,
+      "name": "GNU Library General Public License v2.1 or later",
+      "licenseId": "LGPL-2.1+",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/lgpl-2.1-standalone.html",
+        "https://opensource.org/licenses/LGPL-2.1"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/OPL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OPL-1.0.json",
+      "referenceNumber": 399,
+      "name": "Open Public License v1.0",
+      "licenseId": "OPL-1.0",
+      "seeAlso": [
+        "http://old.koalateam.com/jackaroo/OPL_1_0.TXT",
+        "https://fedoraproject.org/wiki/Licensing/Open_Public_License"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/HPND-sell-variant.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/HPND-sell-variant.json",
+      "referenceNumber": 400,
+      "name": "Historical Permission Notice and Disclaimer - sell variant",
+      "licenseId": "HPND-sell-variant",
+      "seeAlso": [
+        "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/sunrpc/auth_gss/gss_generic_token.c?h\u003dv4.19"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/QPL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/QPL-1.0.json",
+      "referenceNumber": 401,
+      "name": "Q Public License 1.0",
+      "licenseId": "QPL-1.0",
+      "seeAlso": [
+        "http://doc.qt.nokia.com/3.3/license.html",
+        "https://opensource.org/licenses/QPL-1.0"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/EUPL-1.2.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/EUPL-1.2.json",
+      "referenceNumber": 402,
+      "name": "European Union Public License 1.2",
+      "licenseId": "EUPL-1.2",
+      "seeAlso": [
+        "https://joinup.ec.europa.eu/page/eupl-text-11-12",
+        "https://joinup.ec.europa.eu/sites/default/files/custom-page/attachment/eupl_v1.2_en.pdf",
+        "https://joinup.ec.europa.eu/sites/default/files/custom-page/attachment/2020-03/EUPL-1.2%20EN.txt",
+        "https://joinup.ec.europa.eu/sites/default/files/inline-files/EUPL%20v1_2%20EN(1).txt",
+        "http://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri\u003dCELEX:32017D0863",
+        "https://opensource.org/licenses/EUPL-1.2"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/GFDL-1.2-no-invariants-or-later.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2-no-invariants-or-later.json",
+      "referenceNumber": 403,
+      "name": "GNU Free Documentation License v1.2 or later - no invariants",
+      "licenseId": "GFDL-1.2-no-invariants-or-later",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/eCos-2.0.html",
+      "isDeprecatedLicenseId": true,
+      "detailsUrl": "https://spdx.org/licenses/eCos-2.0.json",
+      "referenceNumber": 404,
+      "name": "eCos license version 2.0",
+      "licenseId": "eCos-2.0",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/ecos-license.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/NCGL-UK-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/NCGL-UK-2.0.json",
+      "referenceNumber": 405,
+      "name": "Non-Commercial Government Licence",
+      "licenseId": "NCGL-UK-2.0",
+      "seeAlso": [
+        "http://www.nationalarchives.gov.uk/doc/non-commercial-government-licence/version/2/"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Beerware.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Beerware.json",
+      "referenceNumber": 406,
+      "name": "Beerware License",
+      "licenseId": "Beerware",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Beerware",
+        "https://people.freebsd.org/~phk/"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-Open-MPI.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-Open-MPI.json",
+      "referenceNumber": 407,
+      "name": "BSD 3-Clause Open MPI variant",
+      "licenseId": "BSD-3-Clause-Open-MPI",
+      "seeAlso": [
+        "https://www.open-mpi.org/community/license.php",
+        "http://www.netlib.org/lapack/LICENSE.txt"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/GPL-2.0-with-bison-exception.html",
+      "isDeprecatedLicenseId": true,
+      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-with-bison-exception.json",
+      "referenceNumber": 408,
+      "name": "GNU General Public License v2.0 w/Bison exception",
+      "licenseId": "GPL-2.0-with-bison-exception",
+      "seeAlso": [
+        "http://git.savannah.gnu.org/cgit/bison.git/tree/data/yacc.c?id\u003d193d7c7054ba7197b0789e14965b739162319b5e#n141"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CECILL-B.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CECILL-B.json",
+      "referenceNumber": 409,
+      "name": "CeCILL-B Free Software License Agreement",
+      "licenseId": "CECILL-B",
+      "seeAlso": [
+        "http://www.cecill.info/licences/Licence_CeCILL-B_V1-en.html"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/GPL-2.0-with-autoconf-exception.html",
+      "isDeprecatedLicenseId": true,
+      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-with-autoconf-exception.json",
+      "referenceNumber": 410,
+      "name": "GNU General Public License v2.0 w/Autoconf exception",
+      "licenseId": "GPL-2.0-with-autoconf-exception",
+      "seeAlso": [
+        "http://ac-archive.sourceforge.net/doc/copyright.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/EPL-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/EPL-2.0.json",
+      "referenceNumber": 411,
+      "name": "Eclipse Public License 2.0",
+      "licenseId": "EPL-2.0",
+      "seeAlso": [
+        "https://www.eclipse.org/legal/epl-2.0",
+        "https://www.opensource.org/licenses/EPL-2.0"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/MIT-feh.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/MIT-feh.json",
+      "referenceNumber": 412,
+      "name": "feh License",
+      "licenseId": "MIT-feh",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/MIT#feh"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/RPL-1.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/RPL-1.1.json",
+      "referenceNumber": 413,
+      "name": "Reciprocal Public License 1.1",
+      "licenseId": "RPL-1.1",
+      "seeAlso": [
+        "https://opensource.org/licenses/RPL-1.1"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/CDLA-Permissive-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CDLA-Permissive-1.0.json",
+      "referenceNumber": 414,
+      "name": "Community Data License Agreement Permissive 1.0",
+      "licenseId": "CDLA-Permissive-1.0",
+      "seeAlso": [
+        "https://cdla.io/permissive-1-0"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Python-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Python-2.0.json",
+      "referenceNumber": 415,
+      "name": "Python License 2.0",
+      "licenseId": "Python-2.0",
+      "seeAlso": [
+        "https://opensource.org/licenses/Python-2.0"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/MPL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/MPL-1.0.json",
+      "referenceNumber": 416,
+      "name": "Mozilla Public License 1.0",
+      "licenseId": "MPL-1.0",
+      "seeAlso": [
+        "http://www.mozilla.org/MPL/MPL-1.0.html",
+        "https://opensource.org/licenses/MPL-1.0"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/GFDL-1.1-or-later.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1-or-later.json",
+      "referenceNumber": 417,
+      "name": "GNU Free Documentation License v1.1 or later",
+      "licenseId": "GFDL-1.1-or-later",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/diffmark.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/diffmark.json",
+      "referenceNumber": 418,
+      "name": "diffmark license",
+      "licenseId": "diffmark",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/diffmark"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/GPL-1.0+.html",
+      "isDeprecatedLicenseId": true,
+      "detailsUrl": "https://spdx.org/licenses/GPL-1.0+.json",
+      "referenceNumber": 419,
+      "name": "GNU General Public License v1.0 or later",
+      "licenseId": "GPL-1.0+",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/gpl-1.0-standalone.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/OpenSSL.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OpenSSL.json",
+      "referenceNumber": 420,
+      "name": "OpenSSL License",
+      "licenseId": "OpenSSL",
+      "seeAlso": [
+        "http://www.openssl.org/source/license.html"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/OSL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OSL-1.0.json",
+      "referenceNumber": 421,
+      "name": "Open Software License 1.0",
+      "licenseId": "OSL-1.0",
+      "seeAlso": [
+        "https://opensource.org/licenses/OSL-1.0"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/Parity-6.0.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Parity-6.0.0.json",
+      "referenceNumber": 422,
+      "name": "The Parity Public License 6.0.0",
+      "licenseId": "Parity-6.0.0",
+      "seeAlso": [
+        "https://paritylicense.com/versions/6.0.0.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/AGPL-1.0.html",
+      "isDeprecatedLicenseId": true,
+      "detailsUrl": "https://spdx.org/licenses/AGPL-1.0.json",
+      "referenceNumber": 423,
+      "name": "Affero General Public License v1.0",
+      "licenseId": "AGPL-1.0",
+      "seeAlso": [
+        "http://www.affero.org/oagpl.html"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/YPL-1.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/YPL-1.1.json",
+      "referenceNumber": 424,
+      "name": "Yahoo! Public License v1.1",
+      "licenseId": "YPL-1.1",
+      "seeAlso": [
+        "http://www.zimbra.com/license/yahoo_public_license_1.1.html"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/SSH-short.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/SSH-short.json",
+      "referenceNumber": 425,
+      "name": "SSH short notice",
+      "licenseId": "SSH-short",
+      "seeAlso": [
+        "https://github.com/openssh/openssh-portable/blob/1b11ea7c58cd5c59838b5fa574cd456d6047b2d4/pathnames.h",
+        "http://web.mit.edu/kolya/.f/root/athena.mit.edu/sipb.mit.edu/project/openssh/OldFiles/src/openssh-2.9.9p2/ssh-add.1",
+        "https://joinup.ec.europa.eu/svn/lesoll/trunk/italc/lib/src/dsa_key.cpp"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/IBM-pibs.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/IBM-pibs.json",
+      "referenceNumber": 426,
+      "name": "IBM PowerPC Initialization and Boot Software",
+      "licenseId": "IBM-pibs",
+      "seeAlso": [
+        "http://git.denx.de/?p\u003du-boot.git;a\u003dblob;f\u003darch/powerpc/cpu/ppc4xx/miiphy.c;h\u003d297155fdafa064b955e53e9832de93bfb0cfb85b;hb\u003d9fab4bf4cc077c21e43941866f3f2c196f28670d"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Xnet.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Xnet.json",
+      "referenceNumber": 427,
+      "name": "X.Net License",
+      "licenseId": "Xnet",
+      "seeAlso": [
+        "https://opensource.org/licenses/Xnet"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/TU-Berlin-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/TU-Berlin-1.0.json",
+      "referenceNumber": 428,
+      "name": "Technische Universitaet Berlin License 1.0",
+      "licenseId": "TU-Berlin-1.0",
+      "seeAlso": [
+        "https://github.com/swh/ladspa/blob/7bf6f3799fdba70fda297c2d8fd9f526803d9680/gsm/COPYRIGHT"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/AGPL-3.0.html",
+      "isDeprecatedLicenseId": true,
+      "detailsUrl": "https://spdx.org/licenses/AGPL-3.0.json",
+      "referenceNumber": 429,
+      "name": "GNU Affero General Public License v3.0",
+      "licenseId": "AGPL-3.0",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/agpl.txt",
+        "https://opensource.org/licenses/AGPL-3.0"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/CAL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CAL-1.0.json",
+      "referenceNumber": 430,
+      "name": "Cryptographic Autonomy License 1.0",
+      "licenseId": "CAL-1.0",
+      "seeAlso": [
+        "http://cryptographicautonomylicense.com/license-text.html",
+        "https://opensource.org/licenses/CAL-1.0"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/AFL-3.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/AFL-3.0.json",
+      "referenceNumber": 431,
+      "name": "Academic Free License v3.0",
+      "licenseId": "AFL-3.0",
+      "seeAlso": [
+        "http://www.rosenlaw.com/AFL3.0.htm",
+        "https://opensource.org/licenses/afl-3.0"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/CECILL-C.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CECILL-C.json",
+      "referenceNumber": 432,
+      "name": "CeCILL-C Free Software License Agreement",
+      "licenseId": "CECILL-C",
+      "seeAlso": [
+        "http://www.cecill.info/licences/Licence_CeCILL-C_V1-en.html"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/OGL-UK-3.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OGL-UK-3.0.json",
+      "referenceNumber": 433,
+      "name": "Open Government Licence v3.0",
+      "licenseId": "OGL-UK-3.0",
+      "seeAlso": [
+        "http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-Clear.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-Clear.json",
+      "referenceNumber": 434,
+      "name": "BSD 3-Clause Clear License",
+      "licenseId": "BSD-3-Clause-Clear",
+      "seeAlso": [
+        "http://labs.metacarta.com/license-explanation.html#license"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-Modification.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-Modification.json",
+      "referenceNumber": 435,
+      "name": "BSD 3-Clause Modification",
+      "licenseId": "BSD-3-Clause-Modification",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing:BSD#Modification_Variant"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-SA-2.0-UK.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-2.0-UK.json",
+      "referenceNumber": 436,
+      "name": "Creative Commons Attribution Share Alike 2.0 England and Wales",
+      "licenseId": "CC-BY-SA-2.0-UK",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-sa/2.0/uk/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Saxpath.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Saxpath.json",
+      "referenceNumber": 437,
+      "name": "Saxpath License",
+      "licenseId": "Saxpath",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Saxpath_License"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/NLPL.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/NLPL.json",
+      "referenceNumber": 438,
+      "name": "No Limit Public License",
+      "licenseId": "NLPL",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/NLPL"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/SimPL-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/SimPL-2.0.json",
+      "referenceNumber": 439,
+      "name": "Simple Public License 2.0",
+      "licenseId": "SimPL-2.0",
+      "seeAlso": [
+        "https://opensource.org/licenses/SimPL-2.0"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/psfrag.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/psfrag.json",
+      "referenceNumber": 440,
+      "name": "psfrag License",
+      "licenseId": "psfrag",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/psfrag"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Spencer-86.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Spencer-86.json",
+      "referenceNumber": 441,
+      "name": "Spencer License 86",
+      "licenseId": "Spencer-86",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Henry_Spencer_Reg-Ex_Library_License"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/OCCT-PL.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OCCT-PL.json",
+      "referenceNumber": 442,
+      "name": "Open CASCADE Technology Public License",
+      "licenseId": "OCCT-PL",
+      "seeAlso": [
+        "http://www.opencascade.com/content/occt-public-license"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/CERN-OHL-S-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CERN-OHL-S-2.0.json",
+      "referenceNumber": 443,
+      "name": "CERN Open Hardware Licence Version 2 - Strongly Reciprocal",
+      "licenseId": "CERN-OHL-S-2.0",
+      "seeAlso": [
+        "https://www.ohwr.org/project/cernohl/wikis/Documents/CERN-OHL-version-2"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/ErlPL-1.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/ErlPL-1.1.json",
+      "referenceNumber": 444,
+      "name": "Erlang Public License v1.1",
+      "licenseId": "ErlPL-1.1",
+      "seeAlso": [
+        "http://www.erlang.org/EPLICENSE"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/MIT-CMU.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/MIT-CMU.json",
+      "referenceNumber": 445,
+      "name": "CMU License",
+      "licenseId": "MIT-CMU",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing:MIT?rd\u003dLicensing/MIT#CMU_Style",
+        "https://github.com/python-pillow/Pillow/blob/fffb426092c8db24a5f4b6df243a8a3c01fb63cd/LICENSE"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/NIST-PD.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/NIST-PD.json",
+      "referenceNumber": 446,
+      "name": "NIST Public Domain Notice",
+      "licenseId": "NIST-PD",
+      "seeAlso": [
+        "https://github.com/tcheneau/simpleRPL/blob/e645e69e38dd4e3ccfeceb2db8cba05b7c2e0cd3/LICENSE.txt",
+        "https://github.com/tcheneau/Routing/blob/f09f46fcfe636107f22f2c98348188a65a135d98/README.md"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/OSL-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OSL-2.0.json",
+      "referenceNumber": 447,
+      "name": "Open Software License 2.0",
+      "licenseId": "OSL-2.0",
+      "seeAlso": [
+        "http://web.archive.org/web/20041020171434/http://www.rosenlaw.com/osl2.0.html"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/APSL-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/APSL-2.0.json",
+      "referenceNumber": 448,
+      "name": "Apple Public Source License 2.0",
+      "licenseId": "APSL-2.0",
+      "seeAlso": [
+        "http://www.opensource.apple.com/license/apsl/"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/Leptonica.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Leptonica.json",
+      "referenceNumber": 449,
+      "name": "Leptonica License",
+      "licenseId": "Leptonica",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Leptonica"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/PolyForm-Small-Business-1.0.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/PolyForm-Small-Business-1.0.0.json",
+      "referenceNumber": 450,
+      "name": "PolyForm Small Business License 1.0.0",
+      "licenseId": "PolyForm-Small-Business-1.0.0",
+      "seeAlso": [
+        "https://polyformproject.org/licenses/small-business/1.0.0"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/LiLiQ-P-1.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/LiLiQ-P-1.1.json",
+      "referenceNumber": 451,
+      "name": "Licence Libre du Québec – Permissive version 1.1",
+      "licenseId": "LiLiQ-P-1.1",
+      "seeAlso": [
+        "https://forge.gouv.qc.ca/licence/fr/liliq-v1-1/",
+        "http://opensource.org/licenses/LiLiQ-P-1.1"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/NetCDF.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/NetCDF.json",
+      "referenceNumber": 452,
+      "name": "NetCDF license",
+      "licenseId": "NetCDF",
+      "seeAlso": [
+        "http://www.unidata.ucar.edu/software/netcdf/copyright.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/OML.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OML.json",
+      "referenceNumber": 453,
+      "name": "Open Market License",
+      "licenseId": "OML",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Open_Market_License"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/AGPL-3.0-or-later.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/AGPL-3.0-or-later.json",
+      "referenceNumber": 454,
+      "name": "GNU Affero General Public License v3.0 or later",
+      "licenseId": "AGPL-3.0-or-later",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/agpl.txt",
+        "https://opensource.org/licenses/AGPL-3.0"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/OLDAP-2.2.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.2.json",
+      "referenceNumber": 455,
+      "name": "Open LDAP Public License v2.2",
+      "licenseId": "OLDAP-2.2",
+      "seeAlso": [
+        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\u003dblob;f\u003dLICENSE;hb\u003d470b0c18ec67621c85881b2733057fecf4a1acc3"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/BSD-3-Clause.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause.json",
+      "referenceNumber": 456,
+      "name": "BSD 3-Clause \"New\" or \"Revised\" License",
+      "licenseId": "BSD-3-Clause",
+      "seeAlso": [
+        "https://opensource.org/licenses/BSD-3-Clause"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/WTFPL.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/WTFPL.json",
+      "referenceNumber": 457,
+      "name": "Do What The F*ck You Want To Public License",
+      "licenseId": "WTFPL",
+      "seeAlso": [
+        "http://www.wtfpl.net/about/",
+        "http://sam.zoy.org/wtfpl/COPYING"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/OGL-UK-2.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/OGL-UK-2.0.json",
+      "referenceNumber": 458,
+      "name": "Open Government Licence v2.0",
+      "licenseId": "OGL-UK-2.0",
+      "seeAlso": [
+        "http://www.nationalarchives.gov.uk/doc/open-government-licence/version/2/"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-Attribution.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-Attribution.json",
+      "referenceNumber": 459,
+      "name": "BSD with attribution",
+      "licenseId": "BSD-3-Clause-Attribution",
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/BSD_with_Attribution"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/RPSL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/RPSL-1.0.json",
+      "referenceNumber": 460,
+      "name": "RealNetworks Public Source License v1.0",
+      "licenseId": "RPSL-1.0",
+      "seeAlso": [
+        "https://helixcommunity.org/content/rpsl",
+        "https://opensource.org/licenses/RPSL-1.0"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-3.0-DE.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-3.0-DE.json",
+      "referenceNumber": 461,
+      "name": "Creative Commons Attribution Non Commercial No Derivatives 3.0 Germany",
+      "licenseId": "CC-BY-NC-ND-3.0-DE",
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-nc-nd/3.0/de/legalcode"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/EUPL-1.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/EUPL-1.1.json",
+      "referenceNumber": 462,
+      "name": "European Union Public License 1.1",
+      "licenseId": "EUPL-1.1",
+      "seeAlso": [
+        "https://joinup.ec.europa.eu/software/page/eupl/licence-eupl",
+        "https://joinup.ec.europa.eu/sites/default/files/custom-page/attachment/eupl1.1.-licence-en_0.pdf",
+        "https://opensource.org/licenses/EUPL-1.1"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/Sendmail-8.23.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Sendmail-8.23.json",
+      "referenceNumber": 463,
+      "name": "Sendmail License 8.23",
+      "licenseId": "Sendmail-8.23",
+      "seeAlso": [
+        "https://www.proofpoint.com/sites/default/files/sendmail-license.pdf",
+        "https://web.archive.org/web/20181003101040/https://www.proofpoint.com/sites/default/files/sendmail-license.pdf"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/ODC-By-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/ODC-By-1.0.json",
+      "referenceNumber": 464,
+      "name": "Open Data Commons Attribution License v1.0",
+      "licenseId": "ODC-By-1.0",
+      "seeAlso": [
+        "https://opendatacommons.org/licenses/by/1.0/"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/D-FSL-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/D-FSL-1.0.json",
+      "referenceNumber": 465,
+      "name": "Deutsche Freie Software Lizenz",
+      "licenseId": "D-FSL-1.0",
+      "seeAlso": [
+        "http://www.dipp.nrw.de/d-fsl/lizenzen/",
+        "http://www.dipp.nrw.de/d-fsl/index_html/lizenzen/de/D-FSL-1_0_de.txt",
+        "http://www.dipp.nrw.de/d-fsl/index_html/lizenzen/en/D-FSL-1_0_en.txt",
+        "https://www.hbz-nrw.de/produkte/open-access/lizenzen/dfsl",
+        "https://www.hbz-nrw.de/produkte/open-access/lizenzen/dfsl/deutsche-freie-software-lizenz",
+        "https://www.hbz-nrw.de/produkte/open-access/lizenzen/dfsl/german-free-software-license",
+        "https://www.hbz-nrw.de/produkte/open-access/lizenzen/dfsl/D-FSL-1_0_de.txt/at_download/file",
+        "https://www.hbz-nrw.de/produkte/open-access/lizenzen/dfsl/D-FSL-1_0_en.txt/at_download/file"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/BSD-4-Clause.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/BSD-4-Clause.json",
+      "referenceNumber": 466,
+      "name": "BSD 4-Clause \"Original\" or \"Old\" License",
+      "licenseId": "BSD-4-Clause",
+      "seeAlso": [
+        "http://directory.fsf.org/wiki/License:BSD_4Clause"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/LGPL-2.1.html",
+      "isDeprecatedLicenseId": true,
+      "detailsUrl": "https://spdx.org/licenses/LGPL-2.1.json",
+      "referenceNumber": 467,
+      "name": "GNU Lesser General Public License v2.1 only",
+      "licenseId": "LGPL-2.1",
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/lgpl-2.1-standalone.html",
+        "https://opensource.org/licenses/LGPL-2.1"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/BSD-2-Clause-Views.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause-Views.json",
+      "referenceNumber": 468,
+      "name": "BSD 2-Clause with views sentence",
+      "licenseId": "BSD-2-Clause-Views",
+      "seeAlso": [
+        "http://www.freebsd.org/copyright/freebsd-license.html",
+        "https://people.freebsd.org/~ivoras/wine/patch-wine-nvidia.sh",
+        "https://github.com/protegeproject/protege/blob/master/license.txt"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Artistic-1.0-Perl.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Artistic-1.0-Perl.json",
+      "referenceNumber": 469,
+      "name": "Artistic License 1.0 (Perl)",
+      "licenseId": "Artistic-1.0-Perl",
+      "seeAlso": [
+        "http://dev.perl.org/licenses/artistic.html"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/NPOSL-3.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/NPOSL-3.0.json",
+      "referenceNumber": 470,
+      "name": "Non-Profit Open Software License 3.0",
+      "licenseId": "NPOSL-3.0",
+      "seeAlso": [
+        "https://opensource.org/licenses/NOSL3.0"
+      ],
+      "isOsiApproved": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/gSOAP-1.3b.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/gSOAP-1.3b.json",
+      "referenceNumber": 471,
+      "name": "gSOAP Public License v1.3b",
+      "licenseId": "gSOAP-1.3b",
+      "seeAlso": [
+        "http://www.cs.fsu.edu/~engelen/license.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Interbase-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Interbase-1.0.json",
+      "referenceNumber": 472,
+      "name": "Interbase Public License v1.0",
+      "licenseId": "Interbase-1.0",
+      "seeAlso": [
+        "https://web.archive.org/web/20060319014854/http://info.borland.com/devsupport/interbase/opensource/IPL.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/StandardML-NJ.html",
+      "isDeprecatedLicenseId": true,
+      "detailsUrl": "https://spdx.org/licenses/StandardML-NJ.json",
+      "referenceNumber": 473,
+      "name": "Standard ML of New Jersey License",
+      "licenseId": "StandardML-NJ",
+      "seeAlso": [
+        "http://www.smlnj.org//license.html"
+      ],
+      "isOsiApproved": false
+    }
+  ],
+  "releaseDate": "2021-08-08"
+}
\ No newline at end of file
diff --git a/meta/lib/oe/sbom.py b/meta/lib/oe/sbom.py
new file mode 100644
index 0000000000..22ed5070ea
--- /dev/null
+++ b/meta/lib/oe/sbom.py
@@ -0,0 +1,84 @@
+#
+# Copyright OpenEmbedded Contributors
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
+def get_download_spdxid(d, idx):
+    return "SPDXRef-Download-%s-%d" % (d.getVar("PN"), idx)
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
+def get_sdk_spdxid(sdk):
+    return "SPDXRef-SDK-%s" % sdk
+
+
+def write_doc(d, spdx_doc, subdir, spdx_deploy=None, indent=None):
+    from pathlib import Path
+
+    if spdx_deploy is None:
+        spdx_deploy = Path(d.getVar("SPDXDEPLOY"))
+
+    dest = spdx_deploy / subdir / (spdx_doc.name + ".spdx.json")
+    dest.parent.mkdir(exist_ok=True, parents=True)
+    with dest.open("wb") as f:
+        doc_sha1 = spdx_doc.to_json(f, sort_keys=True, indent=indent)
+
+    l = spdx_deploy / "by-namespace" / spdx_doc.documentNamespace.replace("/", "_")
+    l.parent.mkdir(exist_ok=True, parents=True)
+    l.symlink_to(os.path.relpath(dest, l.parent))
+
+    return doc_sha1
+
+
+def read_doc(fn):
+    import hashlib
+    import oe.spdx
+    import io
+    import contextlib
+
+    @contextlib.contextmanager
+    def get_file():
+        if isinstance(fn, io.IOBase):
+            yield fn
+        else:
+            with fn.open("rb") as f:
+                yield f
+
+    with get_file() as f:
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
index 0000000000..7aaf2af5ed
--- /dev/null
+++ b/meta/lib/oe/spdx.py
@@ -0,0 +1,357 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+#
+# This library is intended to capture the JSON SPDX specification in a type
+# safe manner. It is not intended to encode any particular OE specific
+# behaviors, see the sbom.py for that.
+#
+# The documented SPDX spec document doesn't cover the JSON syntax for
+# particular configuration, which can make it hard to determine what the JSON
+# syntax should be. I've found it is actually much simpler to read the official
+# SPDX JSON schema which can be found here: https://github.com/spdx/spdx-spec
+# in schemas/spdx-schema.json
+#
+
+import hashlib
+import itertools
+import json
+
+SPDX_VERSION = "2.2"
+
+
+#
+# The following are the support classes that are used to implement SPDX object
+#
+
+class _Property(object):
+    """
+    A generic SPDX object property. The different types will derive from this
+    class
+    """
+
+    def __init__(self, *, default=None):
+        self.default = default
+
+    def setdefault(self, dest, name):
+        if self.default is not None:
+            dest.setdefault(name, self.default)
+
+
+class _String(_Property):
+    """
+    A scalar string property for an SPDX object
+    """
+
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
+    """
+    A scalar SPDX object property of a SPDX object
+    """
+
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
+    """
+    A list of SPDX properties
+    """
+
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
+        def set_helper(obj, value):
+            obj._spdx[name] = list(value)
+
+        def del_helper(obj):
+            del obj._spdx[name]
+
+        attrs[name] = property(get_helper, set_helper, del_helper)
+
+    def init(self, source):
+        return [self.prop.init(o) for o in source]
+
+
+class _StringList(_ListProperty):
+    """
+    A list of strings as a property for an SPDX object
+    """
+
+    def __init__(self, **kwargs):
+        super().__init__(_String(), **kwargs)
+
+
+class _ObjectList(_ListProperty):
+    """
+    A list of SPDX objects as a property for an SPDX object
+    """
+
+    def __init__(self, cls, **kwargs):
+        super().__init__(_Object(cls), **kwargs)
+
+
+class MetaSPDXObject(type):
+    """
+    A metaclass that allows properties (anything derived from a _Property
+    class) to be defined for a SPDX object
+    """
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
+    """
+    The base SPDX object; all SPDX spec classes must derive from this class
+    """
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
+#
+# These are the SPDX objects implemented from the spec. The *only* properties
+# that can be added to these objects are ones directly specified in the SPDX
+# spec, however you may add helper functions to make operations easier.
+#
+# Defaults should *only* be specified if the SPDX spec says there is a certain
+# required value for a field (e.g. dataLicense), or if the field is mandatory
+# and has some sane "this field is unknown" (e.g. "NOASSERTION")
+#
+
+class SPDXAnnotation(SPDXObject):
+    annotationDate = _String()
+    annotationType = _String()
+    annotator = _String()
+    comment = _String()
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
+    annotations = _ObjectList(SPDXAnnotation)
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
+    name = _String()
+    SPDXID = _String()
+    versionInfo = _String()
+    downloadLocation = _String(default="NOASSERTION")
+    supplier = _String(default="NOASSERTION")
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
+    annotations = _ObjectList(SPDXAnnotation)
+    checksums = _ObjectList(SPDXChecksum)
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
+class SPDXExtractedLicensingInfo(SPDXObject):
+    name = _String()
+    comment = _String()
+    licenseId = _String()
+    extractedText = _String()
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
+    hasExtractedLicensingInfos = _ObjectList(SPDXExtractedLicensingInfo)
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
+    def add_relationship(self, _from, relationship, _to, *, comment=None, annotation=None):
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
+        if annotation is not None:
+            r.annotations.append(annotation)
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
2.33.0


