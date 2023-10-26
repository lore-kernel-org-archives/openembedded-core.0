Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF754C27C47
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 10:51:35 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.197290.1698317491725620566
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 03:51:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fmzvmc0K;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-32003aae100so1158433f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 03:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698317489; x=1698922289; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dknR4BbEhNe7kkWU7ZZlLd6LMN4383RSMNF5RSntOqs=;
        b=fmzvmc0Ki29MfYjDw941yjwEMUreS/wPkIJcXmLfNKyGmMTK1q1oQmEhkeJzbKEOCD
         Ya8MaFr8SQt13Hqh2uigfDd9xddgKqSv9dKfxcoboE8lvCX7/V9ON515nivbI1Cx8PSV
         WdZMqzMcoxwM8pNIyXMYnV3ZyESJoeQz2yIV3vr9xH+oV7QHN7NzXUt+72+jfD8+dTIz
         Kuj2ACJeT9fiv7KsdNSJ32AF+Ey9u41zBv3w0uEFTzfMVuRSgDTvwihgwJpCuCRgxmHD
         Z5CB7Nwk4g8TwkQz7pQBK26iiQGMvjELXZb1P6JnceFGW9JE01/rCqdnI89EUlFFDlNt
         zP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698317489; x=1698922289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dknR4BbEhNe7kkWU7ZZlLd6LMN4383RSMNF5RSntOqs=;
        b=pRcpUtVqhHgkaWWidAhyhLqolIc/o38zeY0KWyFqt/HodI/pVOhIxjiZRgE/rTtHW3
         xI8p6byjZ10rtVgisFsZM6xo9FdIsIwWVf3/fDh0D2R69XSw2DmI9ESSDquKyZpLHVcp
         bYzCv2EeiCeXcu33ksJiGH8jnI3uzjtSvpRvNbTplPpH1AN4IHMnrPqwcUF69miU64yD
         FAu7hSd92gnCRaLEPiaIJL21vOowHCDO65XXeCvPKeAsInaqfzgvds2f6Ttn6rGYjw4K
         /5ZKLUe2CKcMUG0TOYBIdztXJvKKlXoYl4zUqt/y6sAeXVilK8OzH5uHh/FsG6iAIvh7
         iJmw==
X-Gm-Message-State: AOJu0YwtcWHFsOeLcyOcS+rOsJIbldimQwyyZtpaqt4KXMHIg3rXmNxq
	nFa/NHGkUHe48z/ZoDODu+3vx4BdpLAjFg==
X-Google-Smtp-Source: AGHT+IEdRRnY3O0gwL0m4OqpTBoOPgyPOCuZFMpYW9nzyJGpfE+GYKkt0Y52gtqlvYXY/pO5ixCF+Q==
X-Received: by 2002:a5d:59a4:0:b0:32d:c5fd:159b with SMTP id p4-20020a5d59a4000000b0032dc5fd159bmr3005757wrr.4.1698317489258;
        Thu, 26 Oct 2023 03:51:29 -0700 (PDT)
Received: from localhost.localdomain ([31.32.81.187])
        by smtp.gmail.com with ESMTPSA id f1-20020adff8c1000000b0032da75af3easm13936004wrq.80.2023.10.26.03.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 03:51:28 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Samantha Jalabert <samantha.jalabert@syslinbit.com>
Subject: [RFC][OE-core 7/7] create-spdx-3.0: support for recipe spdx creation
Date: Thu, 26 Oct 2023 12:48:47 +0200
Message-ID: <20231026105033.257971-8-marta.rybczynska@syslinbit.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231026105033.257971-1-marta.rybczynska@syslinbit.com>
References: <20231026105033.257971-1-marta.rybczynska@syslinbit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 10:51:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189718

From: Samantha Jalabert <samantha.jalabert@syslinbit.com>

Change functions and tasks to match the SPDX 3 model.

Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
---
 meta/classes/create-spdx-3.0.bbclass | 728 +++++++++------------------
 1 file changed, 224 insertions(+), 504 deletions(-)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index b0aef80db1..ffe34969a8 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -11,7 +11,7 @@ DEPLOY_DIR_SPDX ??= "${DEPLOY_DIR}/spdx"
 CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
-SPDXDIR ??= "${WORKDIR}/spdx"
+SPDXDIR ??= "${WORKDIR}/spdx-3.0"
 SPDXDEPLOY = "${SPDXDIR}/deploy"
 SPDXWORK = "${SPDXDIR}/work"
 SPDXIMAGEWORK = "${SPDXDIR}/image-work"
@@ -64,21 +64,74 @@ def get_doc_namespace(d, doc):
     namespace_uuid = uuid.uuid5(uuid.NAMESPACE_DNS, d.getVar("SPDX_UUID_NAMESPACE"))
     return "%s/%s-%s" % (d.getVar("SPDX_NAMESPACE_PREFIX"), doc.name, str(uuid.uuid5(namespace_uuid, doc.name)))
 
-def create_annotation(d, comment):
+def generate_creationInfo(d, document):
+    """
+    Generate the creationInfo and its elements for a document
+    """
     from datetime import datetime, timezone
+    import oe.spdx3
 
     creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
-    annotation = oe.spdx.SPDXAnnotation()
-    annotation.annotationDate = creation_time
-    annotation.annotationType = "OTHER"
-    annotation.annotator = "Tool: %s - %s" % (d.getVar("SPDX_TOOL_NAME"), d.getVar("SPDX_TOOL_VERSION"))
-    annotation.comment = comment
-    return annotation
+
+    document.creationInfo = oe.spdx3.SPDX3CreationInfo()
+    document.creationInfo.specVersion = "3.0.0"
+    document.creationInfo.created = creation_time
+    document.creationInfo.dataLicense = "https://spdx.org/licenses/CC0-1.0"
+
+    tool = oe.spdx3.SPDX3Tool()
+    tool.name = "OpenEmbedded Core create-spdx.bbclass"
+    tool.spdxId = "spdx-" + d.getVar("PN") + ":SPDXRef-Actor-" + tool.name.replace(" ", "")
+    tool.creationInfo = document.creationInfo
+    document.element.append(tool)
+    document.creationInfo.createdUsing.append(tool)
+
+    organization = oe.spdx3.SPDX3Organization()
+    organization.name = d.getVar("SPDX_ORG")
+    organization.spdxId = "spdx-" + d.getVar("PN") + ":SPDXRef-Actor-" + organization.name.replace(" ", "")
+    organization.creationInfo = document.creationInfo
+    document.element.append(organization)
+    document.creationInfo.createdBy.append(organization)
+
+    person = oe.spdx3.SPDX3Person()
+    person.name = "Person: N/A ()"
+    person.spdxId = "spdx-" + d.getVar("PN") + ":SPDXRef-Actor-" + person.name.replace(" ", "")
+    document.creationInfo.createdBy.append(person)
+    document.element.append(person)
+
+def get_supplier(d, doc=None):
+    """
+    Get the supplier of a document or create it.
+    """
+    import oe.spdx3
+
+    supplier = d.getVar("SPDX_SUPPLIER")
+    agentName = supplier.split(": ")[1]
+    agentType = supplier.split(": ")[0]
+
+    if doc:
+        for element in doc.element:
+            if(isinstance(element, oe.spdx3.SPDX3Agent) and element.name == agentName):
+                return element
+
+    if(agentType == "Organization"):
+        agent = oe.spdx3.SPDX3Organization()
+    elif(agentType == "Person"):
+        agent = oe.spdx3.SPDX3Person()
+    else:
+        raise KeyError("%r is not a valid SPDX agent type" % agentType)
+
+    agent.name = agentName
+    agent.spdxId = "spdx-" + d.getVar("PN") + ":SPDXRef-Actor-" + agent.name.replace(" ", "")
+    agent.creationInfo = doc.creationInfo
+
+    return agent
 
 def recipe_spdx_is_native(d, recipe):
-    return any(a.annotationType == "OTHER" and
-      a.annotator == "Tool: %s - %s" % (d.getVar("SPDX_TOOL_NAME"), d.getVar("SPDX_TOOL_VERSION")) and
-      a.comment == "isNative" for a in recipe.annotations)
+    return False
+# TODO: find a better way to mark native recipes
+#    return any(a.annotationType == "OTHER" and
+#      a.annotator == "Tool: %s - %s" % (d.getVar("SPDX_TOOL_NAME"), d.getVar("SPDX_TOOL_VERSION")) and
+#      a.comment == "isNative" for a in recipe.annotations)
 
 def is_work_shared_spdx(d):
     return bb.data.inherits_class('kernel', d) or ('work-shared' in d.getVar('WORKDIR'))
@@ -113,7 +166,7 @@ def convert_license_to_spdx(lic, document, d, existing={}):
         if name in extracted:
             return
 
-        extracted_info = oe.spdx.SPDXExtractedLicensingInfo()
+        extracted_info = oe.spdx.SPDX3ExtractedLicensingInfo()
         extracted_info.name = name
         extracted_info.licenseId = ident
         extracted_info.extractedText = None
@@ -202,8 +255,7 @@ def process_sources(d):
 
 def add_package_files(d, doc, spdx_pkg, topdir, get_spdxid, get_types, *, archive=None, ignore_dirs=[], ignore_top_level_dirs=[]):
     from pathlib import Path
-    import oe.spdx
-    import hashlib
+    import oe.spdx3
 
     source_date_epoch = d.getVar("SOURCE_DATE_EPOCH")
     if source_date_epoch:
@@ -223,11 +275,18 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_spdxid, get_types, *, archiv
             filename = str(filepath.relative_to(topdir))
 
             if not filepath.is_symlink() and filepath.is_file():
-                spdx_file = oe.spdx.SPDXFile()
-                spdx_file.SPDXID = get_spdxid(file_counter)
-                for t in get_types(filepath):
-                    spdx_file.fileTypes.append(t)
-                spdx_file.fileName = filename
+                spdx_file = oe.spdx3.SPDX3File()
+                spdx_file.name = filename
+                spdx_file.spdxId = get_spdxid(file_counter)
+                spdx_file.primaryPurpose = None
+                spdx_file.additionalPurpose = []
+                types = get_types(filepath)
+                for t in types:
+                    if t in oe.spdx3.SPDX3SoftwarePurpose:
+                        if spdx_file.primaryPurpose == None:
+                            spdx_file.primaryPurpose = t
+                        else:
+                            spdx_file.additionalPurpose.append(t)
 
                 if archive is not None:
                     with filepath.open("rb") as f:
@@ -245,42 +304,37 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_spdxid, get_types, *, archiv
 
                 sha1 = bb.utils.sha1_file(filepath)
                 sha1s.append(sha1)
-                spdx_file.checksums.append(oe.spdx.SPDXChecksum(
-                        algorithm="SHA1",
-                        checksumValue=sha1,
-                    ))
-                spdx_file.checksums.append(oe.spdx.SPDXChecksum(
-                        algorithm="SHA256",
-                        checksumValue=bb.utils.sha256_file(filepath),
-                    ))
-
-                if "SOURCE" in spdx_file.fileTypes:
-                    extracted_lics = extract_licenses(filepath)
-                    if extracted_lics:
-                        spdx_file.licenseInfoInFiles = extracted_lics
-
-                doc.files.append(spdx_file)
-                doc.add_relationship(spdx_pkg, "CONTAINS", spdx_file)
-                spdx_pkg.hasFiles.append(spdx_file.SPDXID)
 
-                spdx_files.append(spdx_file)
+                hashSha1 = oe.spdx3.SPDX3Hash()
+                hashSha1.algorithm = "sha1"
+                hashSha1.hashValue = sha1
+                spdx_file.verifiedUsing.append(hashSha1)
 
-                file_counter += 1
+                hashSha256 = oe.spdx3.SPDX3Hash()
+                hashSha256.algorithm = "sha256"
+                hashSha256.hashValue = bb.utils.sha256_file(filepath)
+                spdx_file.verifiedUsing.append(hashSha256)
+
+                # TODO: Rework when License Profile implemented
+                #if "SOURCE" in spdx_file.fileTypes:
+                #    extracted_lics = extract_licenses(filepath)
+                #    if extracted_lics:
+                #        spdx_file.licenseInfoInFiles = extracted_lics
 
-    sha1s.sort()
-    verifier = hashlib.sha1()
-    for v in sha1s:
-        verifier.update(v.encode("utf-8"))
-    spdx_pkg.packageVerificationCode.packageVerificationCodeValue = verifier.hexdigest()
+                doc.element.append(spdx_file)
+
+                doc.add_relationship(spdx_pkg, "contains", spdx_file)
+
+                spdx_files.append(spdx_file)
+                file_counter += 1
 
     return spdx_files
 
 
 def add_package_sources_from_debug(d, package_doc, spdx_package, package, package_files, sources):
     from pathlib import Path
-    import hashlib
     import oe.packagedata
-    import oe.spdx
+    import oe.spdx3
 
     debug_search_paths = [
         Path(d.getVar('PKGD')),
@@ -299,15 +353,15 @@ def add_package_sources_from_debug(d, package_doc, spdx_package, package, packag
             continue
 
         for pkg_file in package_files:
-            if file_path.lstrip("/") == pkg_file.fileName.lstrip("/"):
+            if file_path.lstrip("/") == pkg_file.name.lstrip("/"):
                 break
         else:
             bb.fatal("No package file found for %s in %s; SPDX found: %s" % (str(file_path), package,
-                " ".join(p.fileName for p in package_files)))
+                " ".join(p.name for p in package_files)))
             continue
 
         for debugsrc in file_data["debugsrc"]:
-            ref_id = "NOASSERTION"
+            ref_id = None
             for search in debug_search_paths:
                 if debugsrc.startswith("/usr/src/kernel"):
                     debugsrc_path = search / debugsrc.replace('/usr/src/kernel/', '')
@@ -320,24 +374,32 @@ def add_package_sources_from_debug(d, package_doc, spdx_package, package, packag
 
                 if file_sha256 in sources:
                     source_file = sources[file_sha256]
-
-                    doc_ref = package_doc.find_external_document_ref(source_file.doc.documentNamespace)
+                    doc_ref = package_doc.find_external_map(source_file.doc.documentNamespace)
                     if doc_ref is None:
-                        doc_ref = oe.spdx.SPDXExternalDocumentRef()
-                        doc_ref.externalDocumentId = "DocumentRef-dependency-" + source_file.doc.name
-                        doc_ref.spdxDocument = source_file.doc.documentNamespace
-                        doc_ref.checksum.algorithm = "SHA1"
-                        doc_ref.checksum.checksumValue = source_file.doc_sha1
-                        package_doc.externalDocumentRefs.append(doc_ref)
-
-                    ref_id = "%s:%s" % (doc_ref.externalDocumentId, source_file.file.SPDXID)
+                        doc_ref = oe.spdx3.SPDX3ExternalMap()
+                        doc_ref.externalId = "DocumentRef-dependency-" + source_file.doc.name
+                        doc_ref.verifiedUsing = oe.spdx3.SPDX3Hash()
+                        doc_ref.verifiedUsing.algorithm = "sha1"
+                        doc_ref.verifiedUsing.hashValue = source_file.doc_sha1
+                        doc_ref.definingDocument = source_file.doc.documentNamespace
+
+                        package_doc.imports.append(doc_ref)
+
+                    ref_id = "%s:%s" % (doc_ref.externalId, source_file.file.spdxId)
                 else:
                     bb.debug(1, "Debug source %s with SHA256 %s not found in any dependency" % (str(debugsrc_path), file_sha256))
                 break
             else:
                 bb.debug(1, "Debug source %s not found" % debugsrc)
 
-            package_doc.add_relationship(pkg_file, "GENERATED_FROM", ref_id, comment=debugsrc)
+            relation_id = package_doc.add_relationship(ref_id, "generates", pkg_file)
+            comment = oe.spdx3.SPDX3Annotation()
+            comment.subject = relation_id
+            comment.annotationType = "other"
+            comment.statement = "debugsrc"
+            package_doc.element.append(comment)
+
+    return
 
 add_package_sources_from_debug[vardepsexclude] += "STAGING_KERNEL_DIR"
 
@@ -345,7 +407,7 @@ def collect_dep_recipes(d, doc, spdx_recipe):
     import json
     from pathlib import Path
     import oe.sbom
-    import oe.spdx
+    import oe.spdx3
 
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
     spdx_deps_file = Path(d.getVar("SPDXDEPS"))
@@ -362,10 +424,10 @@ def collect_dep_recipes(d, doc, spdx_recipe):
         if not dep_recipe_path:
             bb.fatal("Cannot find any SPDX file for recipe %s, %s" % (dep_pn, dep_hashfn))
 
-        spdx_dep_doc, spdx_dep_sha1 = oe.sbom.read_doc(dep_recipe_path)
+        spdx_dep_doc, spdx_dep_pkg, spdx_dep_sha1 = oe.sbom.search_doc(dep_recipe_path, ["Package"])
 
-        for pkg in spdx_dep_doc.packages:
-            if pkg.name == dep_pn:
+        for pkg in spdx_dep_pkg['Package']:
+            if pkg["name"] == dep_pn:
                 spdx_dep_recipe = pkg
                 break
         else:
@@ -373,19 +435,15 @@ def collect_dep_recipes(d, doc, spdx_recipe):
 
         dep_recipes.append(oe.sbom.DepRecipe(spdx_dep_doc, spdx_dep_sha1, spdx_dep_recipe))
 
-        dep_recipe_ref = oe.spdx.SPDXExternalDocumentRef()
-        dep_recipe_ref.externalDocumentId = "DocumentRef-dependency-" + spdx_dep_doc.name
-        dep_recipe_ref.spdxDocument = spdx_dep_doc.documentNamespace
-        dep_recipe_ref.checksum.algorithm = "SHA1"
-        dep_recipe_ref.checksum.checksumValue = spdx_dep_sha1
-
-        doc.externalDocumentRefs.append(dep_recipe_ref)
+        dep_recipe_ref = oe.spdx3.SPDX3ExternalMap()
+        dep_recipe_ref.externalId = "DocumentRef-%s" % spdx_dep_doc["name"]
+        hashSha1 = oe.spdx3.SPDX3Hash()
+        hashSha1.algorithm = "sha1"
+        hashSha1.hashValue = spdx_dep_sha1
+        dep_recipe_ref.verifiedUsing.append(hashSha1)
 
-        doc.add_relationship(
-            "%s:%s" % (dep_recipe_ref.externalDocumentId, spdx_dep_recipe.SPDXID),
-            "BUILD_DEPENDENCY_OF",
-            spdx_recipe
-        )
+        doc.imports.append(dep_recipe_ref)
+        doc.add_relationship("%s:%s" % (dep_recipe_ref.externalId, spdx_dep_recipe["spdxId"]), "buildDependency", spdx_recipe)
 
     return dep_recipes
 
@@ -393,24 +451,35 @@ collect_dep_recipes[vardepsexclude] = "SSTATE_ARCHS"
 
 def collect_dep_sources(d, dep_recipes):
     import oe.sbom
+    import oe.spdx3
 
     sources = {}
     for dep in dep_recipes:
         # Don't collect sources from native recipes as they
         # match non-native sources also.
-        if recipe_spdx_is_native(d, dep.recipe):
-            continue
-        recipe_files = set(dep.recipe.hasFiles)
-
-        for spdx_file in dep.doc.files:
-            if spdx_file.SPDXID not in recipe_files:
-                continue
+        if hasattr(dep.doc, "element"):
+            for element in dep.doc.element:
+                if isinstance(element, oe.spdx3.SPDX3Annotation) \
+                and element.subject == dep.recipe.spdxId \
+                and element.statement == "isNative":
+                    continue
 
-            if "SOURCE" in spdx_file.fileTypes:
-                for checksum in spdx_file.checksums:
-                    if checksum.algorithm == "SHA256":
-                        sources[checksum.checksumValue] = oe.sbom.DepSource(dep.doc, dep.doc_sha1, dep.recipe, spdx_file)
-                        break
+        recipe_files = []
+
+        if hasattr(dep.doc, "element"):
+            for element in dep.doc.element:
+                if isinstance(element, oe.spdx3.SPDX3Relationship) and element._from == dep.recipe.spdxId and element.relationshipType == "contains":
+                    recipe_files = element.to
+
+            for element in dep.doc.element:
+                if isinstance(element, oe.spdx3.SPDX3File) \
+                and element.spdxId not in recipe_files \
+                and (element.primaryPurpose == "source" or "source" in element.additionalPurpose):
+                    for checksum in element.verifiedUsing:
+                        if algorithm in checksum.properties() \
+                        and checksum.algorithm == "sha256":
+                            sources[checksum.hashValue] = oe.sbom.DepSource(dep.doc, dep.doc_sha1, dep.recipe, spdx_file)
+                            break
 
     return sources
 
@@ -418,16 +487,16 @@ def add_download_packages(d, doc, recipe):
     import os.path
     from bb.fetch2 import decodeurl, CHECKSUM_LIST
     import bb.process
-    import oe.spdx
+    import oe.spdx3
     import oe.sbom
 
     for download_idx, src_uri in enumerate(d.getVar('SRC_URI').split()):
         f = bb.fetch2.FetchData(src_uri, d)
 
         for name in f.names:
-            package = oe.spdx.SPDXPackage()
+            package = oe.spdx3.SPDX3Package()
             package.name = "%s-source-%d" % (d.getVar("PN"), download_idx + 1)
-            package.SPDXID = oe.sbom.get_download_spdxid(d, download_idx + 1)
+            package.spdxId = oe.sbom.get_download_spdxid(d, download_idx + 1)
 
             if f.type == "file":
                 continue
@@ -443,42 +512,28 @@ def add_download_packages(d, doc, recipe):
 
             if f.method.supports_checksum(f):
                 for checksum_id in CHECKSUM_LIST:
-                    if checksum_id.upper() not in oe.spdx.SPDXPackage.ALLOWED_CHECKSUMS:
+                    if checksum_id not in oe.spdx3.SPDX3HashAlgorithm:
                         continue
 
                     expected_checksum = getattr(f, "%s_expected" % checksum_id)
                     if expected_checksum is None:
                         continue
 
-                    c = oe.spdx.SPDXChecksum()
+                    c = oe.spdx3.SPDX3Hash()
                     c.algorithm = checksum_id.upper()
-                    c.checksumValue = expected_checksum
-                    package.checksums.append(c)
+                    c.hashValue = expected_checksum
+                    package.verifiedUsing.append(c)
 
             package.downloadLocation = uri
-            doc.packages.append(package)
-            doc.add_relationship(doc, "DESCRIBES", package)
-            # In the future, we might be able to do more fancy dependencies,
-            # but this should be sufficient for now
-            doc.add_relationship(package, "BUILD_DEPENDENCY_OF", recipe)
+            doc.element.append(package)
 
-def collect_direct_deps(d, dep_task):
-    current_task = "do_" + d.getVar("BB_CURRENTTASK")
-    pn = d.getVar("PN")
+            doc.add_relationship(doc, "describes", package)
+            doc.add_relationship(package, "buildDependency", recipe)
 
-    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
 
-    for this_dep in taskdepdata.values():
-        if this_dep[0] == pn and this_dep[1] == current_task:
-            break
-    else:
-        bb.fatal(f"Unable to find this {pn}:{current_task} in taskdepdata")
+def collect_direct_deps(d, dep_task):
 
     deps = set()
-    for dep_name in this_dep[3]:
-        dep_data = taskdepdata[dep_name]
-        if dep_data[1] == dep_task and dep_data[0] != pn:
-            deps.add((dep_data[0], dep_data[7]))
 
     return sorted(deps)
 
@@ -509,9 +564,8 @@ do_collect_spdx_deps[deptask] = "do_create_spdx"
 do_collect_spdx_deps[dirs] = "${SPDXDIR}"
 
 python do_create_spdx() {
-    from datetime import datetime, timezone
     import oe.sbom
-    import oe.spdx
+    import oe.spdx3
     import uuid
     from pathlib import Path
     from contextlib import contextmanager
@@ -538,36 +592,34 @@ python do_create_spdx() {
     include_sources = d.getVar("SPDX_INCLUDE_SOURCES") == "1"
     archive_sources = d.getVar("SPDX_ARCHIVE_SOURCES") == "1"
     archive_packaged = d.getVar("SPDX_ARCHIVE_PACKAGED") == "1"
-    pkg_arch = d.getVar("SSTATE_PKGARCH")
-
-    creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
 
-    doc = oe.spdx.SPDXDocument()
+    doc = oe.spdx3.SPDX3SpdxDocument()
 
     doc.name = "recipe-" + d.getVar("PN")
     doc.documentNamespace = get_doc_namespace(d, doc)
-    doc.creationInfo.created = creation_time
-    doc.creationInfo.comment = "This document was created by analyzing recipe files during the build."
-    doc.creationInfo.licenseListVersion = d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"]
-    doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spdx.bbclass")
-    doc.creationInfo.creators.append("Organization: %s" % d.getVar("SPDX_ORG"))
-    doc.creationInfo.creators.append("Person: N/A ()")
-
-    recipe = oe.spdx.SPDXPackage()
+    generate_creationInfo(d, doc)
+
+    recipe = oe.spdx3.SPDX3Package()
+    recipe.spdxId = oe.sbom.get_recipe_spdxid(d)
     recipe.name = d.getVar("PN")
-    recipe.versionInfo = d.getVar("PV")
-    recipe.SPDXID = oe.sbom.get_recipe_spdxid(d)
-    recipe.supplier = d.getVar("SPDX_SUPPLIER")
+    recipe.packageVersion = d.getVar("PV")
+    recipe.suppliedBy.append(get_supplier(d, doc))
+
     if bb.data.inherits_class("native", d) or bb.data.inherits_class("cross", d):
-        recipe.annotations.append(create_annotation(d, "isNative"))
+        comment = oe.spdx3.SPDX3Annotation()
+        comment.annotationType = "other"
+        comment.subject = recipe.spdxId
+        comment.statement = "isNative"
+
+        doc.element.append(comment)
 
     homepage = d.getVar("HOMEPAGE")
     if homepage:
-        recipe.homepage = homepage
-
-    license = d.getVar("LICENSE")
-    if license:
-        recipe.licenseDeclared = convert_license_to_spdx(license, doc, d)
+        recipe.homePage = homepage
+# TODO: Rework when License Profile implemented
+#    license = d.getVar("LICENSE")
+#    if license:
+#        recipe.licenseDeclared = convert_license_to_spdx(license, doc, d)
 
     summary = d.getVar("SUMMARY")
     if summary:
@@ -581,26 +633,11 @@ python do_create_spdx() {
         for var in d.getVar('SPDX_CUSTOM_ANNOTATION_VARS').split():
             recipe.annotations.append(create_annotation(d, var + "=" + d.getVar(var)))
 
-    # Some CVEs may be patched during the build process without incrementing the version number,
-    # so querying for CVEs based on the CPE id can lead to false positives. To account for this,
-    # save the CVEs fixed by patches to source information field in the SPDX.
-    patched_cves = oe.cve_check.get_patched_cves(d)
-    patched_cves = list(patched_cves)
-    patched_cves = ' '.join(patched_cves)
-    if patched_cves:
-        recipe.sourceInfo = "CVEs fixed: " + patched_cves
-
-    cpe_ids = oe.cve_check.get_cpe_ids(d.getVar("CVE_PRODUCT"), d.getVar("CVE_VERSION"))
-    if cpe_ids:
-        for cpe_id in cpe_ids:
-            cpe = oe.spdx.SPDXExternalReference()
-            cpe.referenceCategory = "SECURITY"
-            cpe.referenceType = "http://spdx.org/rdf/references/cpe23Type"
-            cpe.referenceLocator = cpe_id
-            recipe.externalRefs.append(cpe)
-
-    doc.packages.append(recipe)
-    doc.add_relationship(doc, "DESCRIBES", recipe)
+    # TODO: CVE handling
+
+    doc.element.append(recipe)
+
+    doc.add_relationship(doc, "describes", recipe)
 
     add_download_packages(d, doc, recipe)
 
@@ -615,7 +652,7 @@ python do_create_spdx() {
                 recipe,
                 spdx_workdir,
                 lambda file_counter: "SPDXRef-SourceFile-%s-%d" % (d.getVar("PN"), file_counter),
-                lambda filepath: ["SOURCE"],
+                lambda filepath: ["source"],
                 ignore_dirs=[".git"],
                 ignore_top_level_dirs=["temp"],
                 archive=archive,
@@ -626,17 +663,13 @@ python do_create_spdx() {
 
     dep_recipes = collect_dep_recipes(d, doc, recipe)
 
-    doc_sha1 = oe.sbom.write_doc(d, doc, pkg_arch, "recipes", indent=get_json_indent(d))
+    doc_sha1 = oe.sbom.write_doc(d, doc, doc, d.getVar("SSTATE_PKGARCH"), "recipes", indent=get_json_indent(d))
     dep_recipes.append(oe.sbom.DepRecipe(doc, doc_sha1, recipe))
 
-    recipe_ref = oe.spdx.SPDXExternalDocumentRef()
-    recipe_ref.externalDocumentId = "DocumentRef-recipe-" + recipe.name
-    recipe_ref.spdxDocument = doc.documentNamespace
-    recipe_ref.checksum.algorithm = "SHA1"
-    recipe_ref.checksum.checksumValue = doc_sha1
+    #TODO: references
 
     sources = collect_dep_sources(d, dep_recipes)
-    found_licenses = {license.name:recipe_ref.externalDocumentId + ":" + license.licenseId for license in doc.hasExtractedLicensingInfos}
+#    found_licenses = {license.name:recipe_ref.externalDocumentId + ":" + license.licenseId for license in doc.hasExtractedLicensingInfos}
 
     if not recipe_spdx_is_native(d, recipe):
         bb.build.exec_func("read_subpackage_metadata", d)
@@ -646,42 +679,41 @@ python do_create_spdx() {
             if not oe.packagedata.packaged(package, d):
                 continue
 
-            package_doc = oe.spdx.SPDXDocument()
+            doc = oe.spdx3.SPDX3SpdxDocument()
             pkg_name = d.getVar("PKG:%s" % package) or package
-            package_doc.name = pkg_name
-            package_doc.documentNamespace = get_doc_namespace(d, package_doc)
-            package_doc.creationInfo.created = creation_time
-            package_doc.creationInfo.comment = "This document was created by analyzing packages created during the build."
-            package_doc.creationInfo.licenseListVersion = d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"]
-            package_doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spdx.bbclass")
-            package_doc.creationInfo.creators.append("Organization: %s" % d.getVar("SPDX_ORG"))
-            package_doc.creationInfo.creators.append("Person: N/A ()")
-            package_doc.externalDocumentRefs.append(recipe_ref)
+            doc.name = pkg_name
+            doc.documentNamespace = get_doc_namespace(d, doc)
+            generate_creationInfo(d, doc)
+
+            # TODO: Rework when License Profile implemented
+            # package_doc.creationInfo.licenseListVersion = d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"]
+            # package_doc.externalDocumentRefs.append(recipe_ref)
 
             package_license = d.getVar("LICENSE:%s" % package) or d.getVar("LICENSE")
 
-            spdx_package = oe.spdx.SPDXPackage()
+            spdx_package = oe.spdx3.SPDX3Package()
 
-            spdx_package.SPDXID = oe.sbom.get_package_spdxid(pkg_name)
+            spdx_package.spdxId = oe.sbom.get_package_spdxid(pkg_name)
             spdx_package.name = pkg_name
-            spdx_package.versionInfo = d.getVar("PV")
-            spdx_package.licenseDeclared = convert_license_to_spdx(package_license, package_doc, d, found_licenses)
-            spdx_package.supplier = d.getVar("SPDX_SUPPLIER")
+            spdx_package.packageVersion = d.getVar("PV")
+            # TODO: Rework when License Profile implemented
+            #spdx_package.licenseDeclared = convert_license_to_spdx(package_license, package_doc, d, found_licenses)
+            spdx_package.suppliedBy = [ d.getVar("SPDX_SUPPLIER") ]
 
-            package_doc.packages.append(spdx_package)
+            doc.element.append(spdx_package)
 
-            package_doc.add_relationship(spdx_package, "GENERATED_FROM", "%s:%s" % (recipe_ref.externalDocumentId, recipe.SPDXID))
-            package_doc.add_relationship(package_doc, "DESCRIBES", spdx_package)
+            doc.add_relationship(recipe, "generates", spdx_package)
+            doc.add_relationship(doc, "describes", spdx_package)
 
-            package_archive = deploy_dir_spdx / "packages" / (package_doc.name + ".tar.zst")
+            package_archive = deploy_dir_spdx / "packages" / (doc.name + ".tar.zst")
             with optional_tarfile(package_archive, archive_packaged) as archive:
                 package_files = add_package_files(
                     d,
-                    package_doc,
+                    doc,
                     spdx_package,
                     pkgdest / package,
                     lambda file_counter: oe.sbom.get_packaged_file_spdxid(pkg_name, file_counter),
-                    lambda filepath: ["BINARY"],
+                    lambda filepath: ["executable"],
                     ignore_top_level_dirs=['CONTROL', 'DEBIAN'],
                     archive=archive,
                 )
@@ -689,9 +721,9 @@ python do_create_spdx() {
                 if archive is not None:
                     spdx_package.packageFileName = str(package_archive.name)
 
-            add_package_sources_from_debug(d, package_doc, spdx_package, package, package_files, sources)
+            add_package_sources_from_debug(d, doc, spdx_package, package, package_files, sources)
 
-            oe.sbom.write_doc(d, package_doc, pkg_arch, "packages", indent=get_json_indent(d))
+            oe.sbom.write_doc(d, doc, doc, d.getVar("SSTATE_PKGARCH"), "packages", indent=get_json_indent(d))
 }
 do_create_spdx[vardepsexclude] += "BB_NUMBER_THREADS"
 # NOTE: depending on do_unpack is a hack that is necessary to get it's dependencies for archive the source
@@ -749,127 +781,11 @@ def collect_package_providers(d):
 collect_package_providers[vardepsexclude] += "BB_TASKDEPDATA"
 
 python do_create_runtime_spdx() {
-    from datetime import datetime, timezone
-    import oe.sbom
-    import oe.spdx
-    import oe.packagedata
-    from pathlib import Path
-
-    deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
-    spdx_deploy = Path(d.getVar("SPDXRUNTIMEDEPLOY"))
-    is_native = bb.data.inherits_class("native", d) or bb.data.inherits_class("cross", d)
-
-    creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
-
-    providers = collect_package_providers(d)
-    pkg_arch = d.getVar("SSTATE_PKGARCH")
-    package_archs = d.getVar("SSTATE_ARCHS").split()
-    package_archs.reverse()
-
-    if not is_native:
-        bb.build.exec_func("read_subpackage_metadata", d)
-
-        dep_package_cache = {}
-
-        pkgdest = Path(d.getVar("PKGDEST"))
-        for package in d.getVar("PACKAGES").split():
-            localdata = bb.data.createCopy(d)
-            pkg_name = d.getVar("PKG:%s" % package) or package
-            localdata.setVar("PKG", pkg_name)
-            localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False) + ":" + package)
-
-            if not oe.packagedata.packaged(package, localdata):
-                continue
-
-            pkg_spdx_path = oe.sbom.doc_path(deploy_dir_spdx, pkg_name, pkg_arch, "packages")
-
-            package_doc, package_doc_sha1 = oe.sbom.read_doc(pkg_spdx_path)
-
-            for p in package_doc.packages:
-                if p.name == pkg_name:
-                    spdx_package = p
-                    break
-            else:
-                bb.fatal("Package '%s' not found in %s" % (pkg_name, pkg_spdx_path))
-
-            runtime_doc = oe.spdx.SPDXDocument()
-            runtime_doc.name = "runtime-" + pkg_name
-            runtime_doc.documentNamespace = get_doc_namespace(localdata, runtime_doc)
-            runtime_doc.creationInfo.created = creation_time
-            runtime_doc.creationInfo.comment = "This document was created by analyzing package runtime dependencies."
-            runtime_doc.creationInfo.licenseListVersion = d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"]
-            runtime_doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spdx.bbclass")
-            runtime_doc.creationInfo.creators.append("Organization: %s" % d.getVar("SPDX_ORG"))
-            runtime_doc.creationInfo.creators.append("Person: N/A ()")
-
-            package_ref = oe.spdx.SPDXExternalDocumentRef()
-            package_ref.externalDocumentId = "DocumentRef-package-" + package
-            package_ref.spdxDocument = package_doc.documentNamespace
-            package_ref.checksum.algorithm = "SHA1"
-            package_ref.checksum.checksumValue = package_doc_sha1
-
-            runtime_doc.externalDocumentRefs.append(package_ref)
-
-            runtime_doc.add_relationship(
-                runtime_doc.SPDXID,
-                "AMENDS",
-                "%s:%s" % (package_ref.externalDocumentId, package_doc.SPDXID)
-            )
-
-            deps = bb.utils.explode_dep_versions2(localdata.getVar("RDEPENDS") or "")
-            seen_deps = set()
-            for dep, _ in deps.items():
-                if dep in seen_deps:
-                    continue
-
-                if dep not in providers:
-                    continue
-
-                (dep, dep_hashfn) = providers[dep]
-
-                if not oe.packagedata.packaged(dep, localdata):
-                    continue
-
-                dep_pkg_data = oe.packagedata.read_subpkgdata_dict(dep, d)
-                dep_pkg = dep_pkg_data["PKG"]
-
-                if dep in dep_package_cache:
-                    (dep_spdx_package, dep_package_ref) = dep_package_cache[dep]
-                else:
-                    dep_path = oe.sbom.doc_find_by_hashfn(deploy_dir_spdx, package_archs, dep_pkg, dep_hashfn)
-                    if not dep_path:
-                        bb.fatal("No SPDX file found for package %s, %s" % (dep_pkg, dep_hashfn))
-
-                    spdx_dep_doc, spdx_dep_sha1 = oe.sbom.read_doc(dep_path)
-
-                    for pkg in spdx_dep_doc.packages:
-                        if pkg.name == dep_pkg:
-                            dep_spdx_package = pkg
-                            break
-                    else:
-                        bb.fatal("Package '%s' not found in %s" % (dep_pkg, dep_path))
-
-                    dep_package_ref = oe.spdx.SPDXExternalDocumentRef()
-                    dep_package_ref.externalDocumentId = "DocumentRef-runtime-dependency-" + spdx_dep_doc.name
-                    dep_package_ref.spdxDocument = spdx_dep_doc.documentNamespace
-                    dep_package_ref.checksum.algorithm = "SHA1"
-                    dep_package_ref.checksum.checksumValue = spdx_dep_sha1
-
-                    dep_package_cache[dep] = (dep_spdx_package, dep_package_ref)
-
-                runtime_doc.externalDocumentRefs.append(dep_package_ref)
-
-                runtime_doc.add_relationship(
-                    "%s:%s" % (dep_package_ref.externalDocumentId, dep_spdx_package.SPDXID),
-                    "RUNTIME_DEPENDENCY_OF",
-                    "%s:%s" % (package_ref.externalDocumentId, spdx_package.SPDXID)
-                )
-                seen_deps.add(dep)
-
-            oe.sbom.write_doc(d, runtime_doc, pkg_arch, "runtime", spdx_deploy, indent=get_json_indent(d))
+    # TODO: implement for SPDX3
+    return
 }
 
-do_create_runtime_spdx[vardepsexclude] += "OVERRIDES SSTATE_ARCHS"
+do_create_runtime_spdx[vardepsexclude] += "OVERRIDES"
 
 addtask do_create_runtime_spdx after do_create_spdx before do_build do_rm_work
 SSTATETASKS += "do_create_runtime_spdx"
@@ -950,209 +866,13 @@ POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk = " sdk_host_combine_spd
 POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk = " sdk_target_combine_spdx"
 
 python image_combine_spdx() {
-    import os
-    import oe.sbom
-    from pathlib import Path
-    from oe.rootfs import image_list_installed_packages
-
-    image_name = d.getVar("IMAGE_NAME")
-    image_link_name = d.getVar("IMAGE_LINK_NAME")
-    imgdeploydir = Path(d.getVar("IMGDEPLOYDIR"))
-    img_spdxid = oe.sbom.get_image_spdxid(image_name)
-    packages = image_list_installed_packages(d)
-
-    combine_spdx(d, image_name, imgdeploydir, img_spdxid, packages, Path(d.getVar("SPDXIMAGEWORK")))
-
-    def make_image_link(target_path, suffix):
-        if image_link_name:
-            link = imgdeploydir / (image_link_name + suffix)
-            if link != target_path:
-                link.symlink_to(os.path.relpath(target_path, link.parent))
-
-    spdx_tar_path = imgdeploydir / (image_name + ".spdx.tar.zst")
-    make_image_link(spdx_tar_path, ".spdx.tar.zst")
+    return
 }
 
 python sdk_host_combine_spdx() {
-    sdk_combine_spdx(d, "host")
+    return
 }
 
 python sdk_target_combine_spdx() {
-    sdk_combine_spdx(d, "target")
+    return
 }
-
-def sdk_combine_spdx(d, sdk_type):
-    import oe.sbom
-    from pathlib import Path
-    from oe.sdk import sdk_list_installed_packages
-
-    sdk_name = d.getVar("TOOLCHAIN_OUTPUTNAME") + "-" + sdk_type
-    sdk_deploydir = Path(d.getVar("SDKDEPLOYDIR"))
-    sdk_spdxid = oe.sbom.get_sdk_spdxid(sdk_name)
-    sdk_packages = sdk_list_installed_packages(d, sdk_type == "target")
-    combine_spdx(d, sdk_name, sdk_deploydir, sdk_spdxid, sdk_packages, Path(d.getVar('SPDXSDKWORK')))
-
-def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx_workdir):
-    import os
-    import oe.spdx
-    import oe.sbom
-    import io
-    import json
-    from datetime import timezone, datetime
-    from pathlib import Path
-    import tarfile
-    import bb.compress.zstd
-
-    providers = collect_package_providers(d)
-    package_archs = d.getVar("SSTATE_ARCHS").split()
-    package_archs.reverse()
-
-    creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
-    deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
-    source_date_epoch = d.getVar("SOURCE_DATE_EPOCH")
-
-    doc = oe.spdx.SPDXDocument()
-    doc.name = rootfs_name
-    doc.documentNamespace = get_doc_namespace(d, doc)
-    doc.creationInfo.created = creation_time
-    doc.creationInfo.comment = "This document was created by analyzing the source of the Yocto recipe during the build."
-    doc.creationInfo.licenseListVersion = d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"]
-    doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spdx.bbclass")
-    doc.creationInfo.creators.append("Organization: %s" % d.getVar("SPDX_ORG"))
-    doc.creationInfo.creators.append("Person: N/A ()")
-
-    image = oe.spdx.SPDXPackage()
-    image.name = d.getVar("PN")
-    image.versionInfo = d.getVar("PV")
-    image.SPDXID = rootfs_spdxid
-    image.supplier = d.getVar("SPDX_SUPPLIER")
-
-    doc.packages.append(image)
-
-    for name in sorted(packages.keys()):
-        if name not in providers:
-            bb.fatal("Unable to find SPDX provider for '%s'" % name)
-
-        pkg_name, pkg_hashfn = providers[name]
-
-        pkg_spdx_path = oe.sbom.doc_find_by_hashfn(deploy_dir_spdx, package_archs, pkg_name, pkg_hashfn)
-        if not pkg_spdx_path:
-            bb.fatal("No SPDX file found for package %s, %s" % (pkg_name, pkg_hashfn))
-
-        pkg_doc, pkg_doc_sha1 = oe.sbom.read_doc(pkg_spdx_path)
-
-        for p in pkg_doc.packages:
-            if p.name == name:
-                pkg_ref = oe.spdx.SPDXExternalDocumentRef()
-                pkg_ref.externalDocumentId = "DocumentRef-%s" % pkg_doc.name
-                pkg_ref.spdxDocument = pkg_doc.documentNamespace
-                pkg_ref.checksum.algorithm = "SHA1"
-                pkg_ref.checksum.checksumValue = pkg_doc_sha1
-
-                doc.externalDocumentRefs.append(pkg_ref)
-                doc.add_relationship(image, "CONTAINS", "%s:%s" % (pkg_ref.externalDocumentId, p.SPDXID))
-                break
-        else:
-            bb.fatal("Unable to find package with name '%s' in SPDX file %s" % (name, pkg_spdx_path))
-
-        runtime_spdx_path = oe.sbom.doc_find_by_hashfn(deploy_dir_spdx, package_archs, "runtime-" + name, pkg_hashfn)
-        if not runtime_spdx_path:
-            bb.fatal("No runtime SPDX document found for %s, %s" % (name, pkg_hashfn))
-
-        runtime_doc, runtime_doc_sha1 = oe.sbom.read_doc(runtime_spdx_path)
-
-        runtime_ref = oe.spdx.SPDXExternalDocumentRef()
-        runtime_ref.externalDocumentId = "DocumentRef-%s" % runtime_doc.name
-        runtime_ref.spdxDocument = runtime_doc.documentNamespace
-        runtime_ref.checksum.algorithm = "SHA1"
-        runtime_ref.checksum.checksumValue = runtime_doc_sha1
-
-        # "OTHER" isn't ideal here, but I can't find a relationship that makes sense
-        doc.externalDocumentRefs.append(runtime_ref)
-        doc.add_relationship(
-            image,
-            "OTHER",
-            "%s:%s" % (runtime_ref.externalDocumentId, runtime_doc.SPDXID),
-            comment="Runtime dependencies for %s" % name
-        )
-
-    image_spdx_path = spdx_workdir / (rootfs_name + ".spdx.json")
-
-    with image_spdx_path.open("wb") as f:
-        doc.to_json(f, sort_keys=True, indent=get_json_indent(d))
-
-    num_threads = int(d.getVar("BB_NUMBER_THREADS"))
-
-    visited_docs = set()
-
-    index = {"documents": []}
-
-    spdx_tar_path = rootfs_deploydir / (rootfs_name + ".spdx.tar.zst")
-    with bb.compress.zstd.open(spdx_tar_path, "w", num_threads=num_threads) as f:
-        with tarfile.open(fileobj=f, mode="w|") as tar:
-            def collect_spdx_document(path):
-                nonlocal tar
-                nonlocal deploy_dir_spdx
-                nonlocal source_date_epoch
-                nonlocal index
-
-                if path in visited_docs:
-                    return
-
-                visited_docs.add(path)
-
-                with path.open("rb") as f:
-                    doc, sha1 = oe.sbom.read_doc(f)
-                    f.seek(0)
-
-                    if doc.documentNamespace in visited_docs:
-                        return
-
-                    bb.note("Adding SPDX document %s" % path)
-                    visited_docs.add(doc.documentNamespace)
-                    info = tar.gettarinfo(fileobj=f)
-
-                    info.name = doc.name + ".spdx.json"
-                    info.uid = 0
-                    info.gid = 0
-                    info.uname = "root"
-                    info.gname = "root"
-
-                    if source_date_epoch is not None and info.mtime > int(source_date_epoch):
-                        info.mtime = int(source_date_epoch)
-
-                    tar.addfile(info, f)
-
-                    index["documents"].append({
-                        "filename": info.name,
-                        "documentNamespace": doc.documentNamespace,
-                        "sha1": sha1,
-                    })
-
-                for ref in doc.externalDocumentRefs:
-                    ref_path = oe.sbom.doc_find_by_namespace(deploy_dir_spdx, package_archs, ref.spdxDocument)
-                    if not ref_path:
-                        bb.fatal("Cannot find any SPDX file for document %s" % ref.spdxDocument)
-                    collect_spdx_document(ref_path)
-
-            collect_spdx_document(image_spdx_path)
-
-            index["documents"].sort(key=lambda x: x["filename"])
-
-            index_str = io.BytesIO(json.dumps(
-                index,
-                sort_keys=True,
-                indent=get_json_indent(d),
-            ).encode("utf-8"))
-
-            info = tarfile.TarInfo()
-            info.name = "index.json"
-            info.size = len(index_str.getvalue())
-            info.uid = 0
-            info.gid = 0
-            info.uname = "root"
-            info.gname = "root"
-
-            tar.addfile(info, fileobj=index_str)
-
-combine_spdx[vardepsexclude] += "BB_NUMBER_THREADS SSTATE_ARCHS"
-- 
2.42.0


