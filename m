Return-Path: <louis.rannou@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC3FC4167B
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 22:48:14 +0000 (UTC)
Received: from 13.mo561.mail-out.ovh.net (13.mo561.mail-out.ovh.net [188.165.33.202])
 by mx.groups.io with SMTP id smtpd.web11.9576.1698792487328627650
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 15:48:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 188.165.33.202, mailfrom: louis.rannou@syslinbit.com)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.108.4.105])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 8EDD227F94
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 22:48:05 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-nzml2 (unknown [10.110.208.94])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id C60111FDBB;
	Tue, 31 Oct 2023 22:48:04 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.108])
	by ghost-submission-6684bf9d7b-nzml2 with ESMTPSA
	id aNuULCSEQWUYnR8APQBgzw
	(envelope-from <louis.rannou@syslinbit.com>); Tue, 31 Oct 2023 22:48:04 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-108S00230785716-45e2-40c2-a9b4-49eb0fcda999,
                    E382B8EC8DEDBA5F41C2577A0B4F295D8A9180D4) smtp.auth=louis.rannou@syslinbit.com
X-OVh-ClientIp: 45.81.62.9
From: Louis Rannou <louis.rannou@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	jpewhacker@gmail.com,
	Samantha Jalabert <samantha.jalabert@syslinbit.com>,
	Louis Rannou <louis.rannou@syslinbit.com>
Subject: [OE-core][RFC v2 07/12] create-spdx-3.0: support for recipe spdx creation
Date: Tue, 31 Oct 2023 23:47:28 +0100
Message-ID: <20231031224733.367227-8-louis.rannou@syslinbit.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231031224733.367227-1-louis.rannou@syslinbit.com>
References: <20231031224733.367227-1-louis.rannou@syslinbit.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9522016987851447773
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddtfedgtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepnfhouhhishcutfgrnhhnohhuuceolhhouhhishdrrhgrnhhnohhusehshihslhhinhgsihhtrdgtohhmqeenucggtffrrghtthgvrhhnpeeuvddthfdthffggfdvuedttddtgfefgfevledthefhhedufefgheeutdfgtdeffeenucffohhmrghinhepshhpugigrdhorhhgpdguohgtrdhnrghmvgdpshgsohhmrdhrvggrugdpshgsohhmrdhsvggrrhgthhdpphgrtghkrghgvggurghtrgdrrhgvrggupdiishhtugdrohhpvghnnecukfhppeduvdejrddtrddtrddupdeghedrkedurdeivddrledpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehlohhuihhsrdhrrghnnhhouhesshihshhlihhnsghithdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehiedupdhmohguvgepshhmthhpohhuth
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 22:48:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189883

From: Samantha Jalabert <samantha.jalabert@syslinbit.com>

Change functions and tasks to match the SPDX 3 model.

Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
Signed-off-by: Louis Rannou <louis.rannou@syslinbit.com>
---
 meta/classes/create-spdx-3.0.bbclass | 731 +++++++++------------------
 meta/lib/oe/spdx3.py                 |   4 +-
 2 files changed, 230 insertions(+), 505 deletions(-)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
index b0aef80db1..33e9798fb0 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -11,7 +11,7 @@ DEPLOY_DIR_SPDX ??=3D "${DEPLOY_DIR}/spdx"
 CVE_PRODUCT ??=3D "${BPN}"
 CVE_VERSION ??=3D "${PV}"
=20
-SPDXDIR ??=3D "${WORKDIR}/spdx"
+SPDXDIR ??=3D "${WORKDIR}/spdx-3.0"
 SPDXDEPLOY =3D "${SPDXDIR}/deploy"
 SPDXWORK =3D "${SPDXDIR}/work"
 SPDXIMAGEWORK =3D "${SPDXDIR}/image-work"
@@ -64,21 +64,77 @@ def get_doc_namespace(d, doc):
     namespace_uuid =3D uuid.uuid5(uuid.NAMESPACE_DNS, d.getVar("SPDX_UUI=
D_NAMESPACE"))
     return "%s/%s-%s" % (d.getVar("SPDX_NAMESPACE_PREFIX"), doc.name, st=
r(uuid.uuid5(namespace_uuid, doc.name)))
=20
-def create_annotation(d, comment):
+def generate_creationInfo(d, document, comment=3DNone):
+    """
+    Generate the creationInfo and its elements for a document
+    """
     from datetime import datetime, timezone
+    import oe.spdx3
=20
     creation_time =3D datetime.now(tz=3Dtimezone.utc).strftime("%Y-%m-%d=
T%H:%M:%SZ")
-    annotation =3D oe.spdx.SPDXAnnotation()
-    annotation.annotationDate =3D creation_time
-    annotation.annotationType =3D "OTHER"
-    annotation.annotator =3D "Tool: %s - %s" % (d.getVar("SPDX_TOOL_NAME=
"), d.getVar("SPDX_TOOL_VERSION"))
-    annotation.comment =3D comment
-    return annotation
+
+    document.creationInfo =3D oe.spdx3.SPDX3CreationInfo()
+    document.creationInfo.specVersion =3D "3.0.0"
+    document.creationInfo.created =3D creation_time
+    document.creationInfo.dataLicense =3D "https://spdx.org/licenses/CC0=
-1.0"
+
+    if comment is not None:
+        document.creationInfo.comment =3D comment
+
+    tool =3D oe.spdx3.SPDX3Tool()
+    tool.name =3D "OpenEmbedded Core create-spdx.bbclass"
+    tool.spdxId =3D "spdx-" + d.getVar("PN") + ":SPDXRef-Actor-" + tool.=
name.replace(" ", "")
+    tool.creationInfo =3D document.creationInfo
+    document.element.append(tool)
+    document.creationInfo.createdUsing.append(tool)
+
+    organization =3D oe.spdx3.SPDX3Organization()
+    organization.name =3D d.getVar("SPDX_ORG")
+    organization.spdxId =3D "spdx-" + d.getVar("PN") + ":SPDXRef-Actor-"=
 + organization.name.replace(" ", "")
+    organization.creationInfo =3D document.creationInfo
+    document.element.append(organization)
+    document.creationInfo.createdBy.append(organization)
+
+    person =3D oe.spdx3.SPDX3Person()
+    person.name =3D "Person: N/A ()"
+    person.spdxId =3D "spdx-" + d.getVar("PN") + ":SPDXRef-Actor-" + per=
son.name.replace(" ", "")
+    document.creationInfo.createdBy.append(person)
+    document.element.append(person)
+
+def get_supplier(d, doc=3DNone):
+    """
+    Get the supplier of a document or create it.
+    """
+    import oe.spdx3
+
+    supplier =3D d.getVar("SPDX_SUPPLIER")
+    agentName =3D supplier.split(": ")[1]
+    agentType =3D supplier.split(": ")[0]
+
+    if doc:
+        for element in doc.element:
+            if(isinstance(element, oe.spdx3.SPDX3Agent) and element.name=
 =3D=3D agentName):
+                return element
+
+    if(agentType =3D=3D "Organization"):
+        agent =3D oe.spdx3.SPDX3Organization()
+    elif(agentType =3D=3D "Person"):
+        agent =3D oe.spdx3.SPDX3Person()
+    else:
+        raise KeyError("%r is not a valid SPDX agent type" % agentType)
+
+    agent.name =3D agentName
+    agent.spdxId =3D "spdx-" + d.getVar("PN") + ":SPDXRef-Actor-" + agen=
t.name.replace(" ", "")
+    agent.creationInfo =3D doc.creationInfo
+
+    return agent
=20
 def recipe_spdx_is_native(d, recipe):
-    return any(a.annotationType =3D=3D "OTHER" and
-      a.annotator =3D=3D "Tool: %s - %s" % (d.getVar("SPDX_TOOL_NAME"), =
d.getVar("SPDX_TOOL_VERSION")) and
-      a.comment =3D=3D "isNative" for a in recipe.annotations)
+    return False
+# TODO: find a better way to mark native recipes
+#    return any(a.annotationType =3D=3D "OTHER" and
+#      a.annotator =3D=3D "Tool: %s - %s" % (d.getVar("SPDX_TOOL_NAME"),=
 d.getVar("SPDX_TOOL_VERSION")) and
+#      a.comment =3D=3D "isNative" for a in recipe.annotations)
=20
 def is_work_shared_spdx(d):
     return bb.data.inherits_class('kernel', d) or ('work-shared' in d.ge=
tVar('WORKDIR'))
@@ -113,7 +169,7 @@ def convert_license_to_spdx(lic, document, d, existin=
g=3D{}):
         if name in extracted:
             return
=20
-        extracted_info =3D oe.spdx.SPDXExtractedLicensingInfo()
+        extracted_info =3D oe.spdx.SPDX3ExtractedLicensingInfo()
         extracted_info.name =3D name
         extracted_info.licenseId =3D ident
         extracted_info.extractedText =3D None
@@ -202,8 +258,7 @@ def process_sources(d):
=20
 def add_package_files(d, doc, spdx_pkg, topdir, get_spdxid, get_types, *=
, archive=3DNone, ignore_dirs=3D[], ignore_top_level_dirs=3D[]):
     from pathlib import Path
-    import oe.spdx
-    import hashlib
+    import oe.spdx3
=20
     source_date_epoch =3D d.getVar("SOURCE_DATE_EPOCH")
     if source_date_epoch:
@@ -223,11 +278,18 @@ def add_package_files(d, doc, spdx_pkg, topdir, get=
_spdxid, get_types, *, archiv
             filename =3D str(filepath.relative_to(topdir))
=20
             if not filepath.is_symlink() and filepath.is_file():
-                spdx_file =3D oe.spdx.SPDXFile()
-                spdx_file.SPDXID =3D get_spdxid(file_counter)
-                for t in get_types(filepath):
-                    spdx_file.fileTypes.append(t)
-                spdx_file.fileName =3D filename
+                spdx_file =3D oe.spdx3.SPDX3File()
+                spdx_file.name =3D filename
+                spdx_file.spdxId =3D get_spdxid(file_counter)
+                spdx_file.primaryPurpose =3D None
+                spdx_file.additionalPurpose =3D []
+                types =3D get_types(filepath)
+                for t in types:
+                    if t in oe.spdx3.SPDX3SoftwarePurpose:
+                        if spdx_file.primaryPurpose =3D=3D None:
+                            spdx_file.primaryPurpose =3D t
+                        else:
+                            spdx_file.additionalPurpose.append(t)
=20
                 if archive is not None:
                     with filepath.open("rb") as f:
@@ -245,42 +307,37 @@ def add_package_files(d, doc, spdx_pkg, topdir, get=
_spdxid, get_types, *, archiv
=20
                 sha1 =3D bb.utils.sha1_file(filepath)
                 sha1s.append(sha1)
-                spdx_file.checksums.append(oe.spdx.SPDXChecksum(
-                        algorithm=3D"SHA1",
-                        checksumValue=3Dsha1,
-                    ))
-                spdx_file.checksums.append(oe.spdx.SPDXChecksum(
-                        algorithm=3D"SHA256",
-                        checksumValue=3Dbb.utils.sha256_file(filepath),
-                    ))
-
-                if "SOURCE" in spdx_file.fileTypes:
-                    extracted_lics =3D extract_licenses(filepath)
-                    if extracted_lics:
-                        spdx_file.licenseInfoInFiles =3D extracted_lics
-
-                doc.files.append(spdx_file)
-                doc.add_relationship(spdx_pkg, "CONTAINS", spdx_file)
-                spdx_pkg.hasFiles.append(spdx_file.SPDXID)
=20
-                spdx_files.append(spdx_file)
+                hashSha1 =3D oe.spdx3.SPDX3Hash()
+                hashSha1.algorithm =3D "sha1"
+                hashSha1.hashValue =3D sha1
+                spdx_file.verifiedUsing.append(hashSha1)
=20
-                file_counter +=3D 1
+                hashSha256 =3D oe.spdx3.SPDX3Hash()
+                hashSha256.algorithm =3D "sha256"
+                hashSha256.hashValue =3D bb.utils.sha256_file(filepath)
+                spdx_file.verifiedUsing.append(hashSha256)
+
+                # TODO: Rework when License Profile implemented
+                #if "SOURCE" in spdx_file.fileTypes:
+                #    extracted_lics =3D extract_licenses(filepath)
+                #    if extracted_lics:
+                #        spdx_file.licenseInfoInFiles =3D extracted_lics
=20
-    sha1s.sort()
-    verifier =3D hashlib.sha1()
-    for v in sha1s:
-        verifier.update(v.encode("utf-8"))
-    spdx_pkg.packageVerificationCode.packageVerificationCodeValue =3D ve=
rifier.hexdigest()
+                doc.element.append(spdx_file)
+
+                doc.add_relationship(spdx_pkg, "contains", spdx_file)
+
+                spdx_files.append(spdx_file)
+                file_counter +=3D 1
=20
     return spdx_files
=20
=20
 def add_package_sources_from_debug(d, package_doc, spdx_package, package=
, package_files, sources):
     from pathlib import Path
-    import hashlib
     import oe.packagedata
-    import oe.spdx
+    import oe.spdx3
=20
     debug_search_paths =3D [
         Path(d.getVar('PKGD')),
@@ -299,15 +356,15 @@ def add_package_sources_from_debug(d, package_doc, =
spdx_package, package, packag
             continue
=20
         for pkg_file in package_files:
-            if file_path.lstrip("/") =3D=3D pkg_file.fileName.lstrip("/"=
):
+            if file_path.lstrip("/") =3D=3D pkg_file.name.lstrip("/"):
                 break
         else:
             bb.fatal("No package file found for %s in %s; SPDX found: %s=
" % (str(file_path), package,
-                " ".join(p.fileName for p in package_files)))
+                " ".join(p.name for p in package_files)))
             continue
=20
         for debugsrc in file_data["debugsrc"]:
-            ref_id =3D "NOASSERTION"
+            ref_id =3D None
             for search in debug_search_paths:
                 if debugsrc.startswith("/usr/src/kernel"):
                     debugsrc_path =3D search / debugsrc.replace('/usr/sr=
c/kernel/', '')
@@ -320,24 +377,32 @@ def add_package_sources_from_debug(d, package_doc, =
spdx_package, package, packag
=20
                 if file_sha256 in sources:
                     source_file =3D sources[file_sha256]
-
-                    doc_ref =3D package_doc.find_external_document_ref(s=
ource_file.doc.documentNamespace)
+                    doc_ref =3D package_doc.find_external_map(source_fil=
e.doc.documentNamespace)
                     if doc_ref is None:
-                        doc_ref =3D oe.spdx.SPDXExternalDocumentRef()
-                        doc_ref.externalDocumentId =3D "DocumentRef-depe=
ndency-" + source_file.doc.name
-                        doc_ref.spdxDocument =3D source_file.doc.documen=
tNamespace
-                        doc_ref.checksum.algorithm =3D "SHA1"
-                        doc_ref.checksum.checksumValue =3D source_file.d=
oc_sha1
-                        package_doc.externalDocumentRefs.append(doc_ref)
-
-                    ref_id =3D "%s:%s" % (doc_ref.externalDocumentId, so=
urce_file.file.SPDXID)
+                        doc_ref =3D oe.spdx3.SPDX3ExternalMap()
+                        doc_ref.externalId =3D "DocumentRef-dependency-"=
 + source_file.doc.name
+                        doc_ref.verifiedUsing =3D oe.spdx3.SPDX3Hash()
+                        doc_ref.verifiedUsing.algorithm =3D "sha1"
+                        doc_ref.verifiedUsing.hashValue =3D source_file.=
doc_sha1
+                        doc_ref.definingDocument =3D source_file.doc.doc=
umentNamespace
+
+                        package_doc.imports.append(doc_ref)
+
+                    ref_id =3D "%s:%s" % (doc_ref.externalId, source_fil=
e.file.spdxId)
                 else:
                     bb.debug(1, "Debug source %s with SHA256 %s not foun=
d in any dependency" % (str(debugsrc_path), file_sha256))
                 break
             else:
                 bb.debug(1, "Debug source %s not found" % debugsrc)
=20
-            package_doc.add_relationship(pkg_file, "GENERATED_FROM", ref=
_id, comment=3Ddebugsrc)
+            relation_id =3D package_doc.add_relationship(ref_id, "genera=
tes", pkg_file)
+            comment =3D oe.spdx3.SPDX3Annotation()
+            comment.subject =3D relation_id
+            comment.annotationType =3D "other"
+            comment.statement =3D "debugsrc"
+            package_doc.element.append(comment)
+
+    return
=20
 add_package_sources_from_debug[vardepsexclude] +=3D "STAGING_KERNEL_DIR"
=20
@@ -345,7 +410,7 @@ def collect_dep_recipes(d, doc, spdx_recipe):
     import json
     from pathlib import Path
     import oe.sbom
-    import oe.spdx
+    import oe.spdx3
=20
     deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
     spdx_deps_file =3D Path(d.getVar("SPDXDEPS"))
@@ -362,10 +427,10 @@ def collect_dep_recipes(d, doc, spdx_recipe):
         if not dep_recipe_path:
             bb.fatal("Cannot find any SPDX file for recipe %s, %s" % (de=
p_pn, dep_hashfn))
=20
-        spdx_dep_doc, spdx_dep_sha1 =3D oe.sbom.read_doc(dep_recipe_path=
)
+        spdx_dep_doc, spdx_dep_pkg, spdx_dep_sha1 =3D oe.sbom.search_doc=
(dep_recipe_path, ["Package"])
=20
-        for pkg in spdx_dep_doc.packages:
-            if pkg.name =3D=3D dep_pn:
+        for pkg in spdx_dep_pkg['Package']:
+            if pkg["name"] =3D=3D dep_pn:
                 spdx_dep_recipe =3D pkg
                 break
         else:
@@ -373,19 +438,15 @@ def collect_dep_recipes(d, doc, spdx_recipe):
=20
         dep_recipes.append(oe.sbom.DepRecipe(spdx_dep_doc, spdx_dep_sha1=
, spdx_dep_recipe))
=20
-        dep_recipe_ref =3D oe.spdx.SPDXExternalDocumentRef()
-        dep_recipe_ref.externalDocumentId =3D "DocumentRef-dependency-" =
+ spdx_dep_doc.name
-        dep_recipe_ref.spdxDocument =3D spdx_dep_doc.documentNamespace
-        dep_recipe_ref.checksum.algorithm =3D "SHA1"
-        dep_recipe_ref.checksum.checksumValue =3D spdx_dep_sha1
-
-        doc.externalDocumentRefs.append(dep_recipe_ref)
+        dep_recipe_ref =3D oe.spdx3.SPDX3ExternalMap()
+        dep_recipe_ref.externalId =3D "DocumentRef-%s" % spdx_dep_doc["n=
ame"]
+        hashSha1 =3D oe.spdx3.SPDX3Hash()
+        hashSha1.algorithm =3D "sha1"
+        hashSha1.hashValue =3D spdx_dep_sha1
+        dep_recipe_ref.verifiedUsing.append(hashSha1)
=20
-        doc.add_relationship(
-            "%s:%s" % (dep_recipe_ref.externalDocumentId, spdx_dep_recip=
e.SPDXID),
-            "BUILD_DEPENDENCY_OF",
-            spdx_recipe
-        )
+        doc.imports.append(dep_recipe_ref)
+        doc.add_relationship("%s:%s" % (dep_recipe_ref.externalId, spdx_=
dep_recipe["spdxId"]), "buildDependency", spdx_recipe)
=20
     return dep_recipes
=20
@@ -393,24 +454,35 @@ collect_dep_recipes[vardepsexclude] =3D "SSTATE_ARC=
HS"
=20
 def collect_dep_sources(d, dep_recipes):
     import oe.sbom
+    import oe.spdx3
=20
     sources =3D {}
     for dep in dep_recipes:
         # Don't collect sources from native recipes as they
         # match non-native sources also.
-        if recipe_spdx_is_native(d, dep.recipe):
-            continue
-        recipe_files =3D set(dep.recipe.hasFiles)
-
-        for spdx_file in dep.doc.files:
-            if spdx_file.SPDXID not in recipe_files:
-                continue
+        if hasattr(dep.doc, "element"):
+            for element in dep.doc.element:
+                if isinstance(element, oe.spdx3.SPDX3Annotation) \
+                and element.subject =3D=3D dep.recipe.spdxId \
+                and element.statement =3D=3D "isNative":
+                    continue
=20
-            if "SOURCE" in spdx_file.fileTypes:
-                for checksum in spdx_file.checksums:
-                    if checksum.algorithm =3D=3D "SHA256":
-                        sources[checksum.checksumValue] =3D oe.sbom.DepS=
ource(dep.doc, dep.doc_sha1, dep.recipe, spdx_file)
-                        break
+        recipe_files =3D []
+
+        if hasattr(dep.doc, "element"):
+            for element in dep.doc.element:
+                if isinstance(element, oe.spdx3.SPDX3Relationship) and e=
lement._from =3D=3D dep.recipe.spdxId and element.relationshipType =3D=3D=
 "contains":
+                    recipe_files =3D element.to
+
+            for element in dep.doc.element:
+                if isinstance(element, oe.spdx3.SPDX3File) \
+                and element.spdxId not in recipe_files \
+                and (element.primaryPurpose =3D=3D "source" or "source" =
in element.additionalPurpose):
+                    for checksum in element.verifiedUsing:
+                        if algorithm in checksum.properties() \
+                        and checksum.algorithm =3D=3D "sha256":
+                            sources[checksum.hashValue] =3D oe.sbom.DepS=
ource(dep.doc, dep.doc_sha1, dep.recipe, spdx_file)
+                            break
=20
     return sources
=20
@@ -418,16 +490,16 @@ def add_download_packages(d, doc, recipe):
     import os.path
     from bb.fetch2 import decodeurl, CHECKSUM_LIST
     import bb.process
-    import oe.spdx
+    import oe.spdx3
     import oe.sbom
=20
     for download_idx, src_uri in enumerate(d.getVar('SRC_URI').split()):
         f =3D bb.fetch2.FetchData(src_uri, d)
=20
         for name in f.names:
-            package =3D oe.spdx.SPDXPackage()
+            package =3D oe.spdx3.SPDX3Package()
             package.name =3D "%s-source-%d" % (d.getVar("PN"), download_=
idx + 1)
-            package.SPDXID =3D oe.sbom.get_download_spdxid(d, download_i=
dx + 1)
+            package.spdxId =3D oe.sbom.get_download_spdxid(d, download_i=
dx + 1)
=20
             if f.type =3D=3D "file":
                 continue
@@ -443,42 +515,28 @@ def add_download_packages(d, doc, recipe):
=20
             if f.method.supports_checksum(f):
                 for checksum_id in CHECKSUM_LIST:
-                    if checksum_id.upper() not in oe.spdx.SPDXPackage.AL=
LOWED_CHECKSUMS:
+                    if checksum_id not in oe.spdx3.SPDX3HashAlgorithm:
                         continue
=20
                     expected_checksum =3D getattr(f, "%s_expected" % che=
cksum_id)
                     if expected_checksum is None:
                         continue
=20
-                    c =3D oe.spdx.SPDXChecksum()
+                    c =3D oe.spdx3.SPDX3Hash()
                     c.algorithm =3D checksum_id.upper()
-                    c.checksumValue =3D expected_checksum
-                    package.checksums.append(c)
+                    c.hashValue =3D expected_checksum
+                    package.verifiedUsing.append(c)
=20
             package.downloadLocation =3D uri
-            doc.packages.append(package)
-            doc.add_relationship(doc, "DESCRIBES", package)
-            # In the future, we might be able to do more fancy dependenc=
ies,
-            # but this should be sufficient for now
-            doc.add_relationship(package, "BUILD_DEPENDENCY_OF", recipe)
+            doc.element.append(package)
=20
-def collect_direct_deps(d, dep_task):
-    current_task =3D "do_" + d.getVar("BB_CURRENTTASK")
-    pn =3D d.getVar("PN")
+            doc.add_relationship(doc, "describes", package)
+            doc.add_relationship(package, "buildDependency", recipe)
=20
-    taskdepdata =3D d.getVar("BB_TASKDEPDATA", False)
=20
-    for this_dep in taskdepdata.values():
-        if this_dep[0] =3D=3D pn and this_dep[1] =3D=3D current_task:
-            break
-    else:
-        bb.fatal(f"Unable to find this {pn}:{current_task} in taskdepdat=
a")
+def collect_direct_deps(d, dep_task):
=20
     deps =3D set()
-    for dep_name in this_dep[3]:
-        dep_data =3D taskdepdata[dep_name]
-        if dep_data[1] =3D=3D dep_task and dep_data[0] !=3D pn:
-            deps.add((dep_data[0], dep_data[7]))
=20
     return sorted(deps)
=20
@@ -509,9 +567,8 @@ do_collect_spdx_deps[deptask] =3D "do_create_spdx"
 do_collect_spdx_deps[dirs] =3D "${SPDXDIR}"
=20
 python do_create_spdx() {
-    from datetime import datetime, timezone
     import oe.sbom
-    import oe.spdx
+    import oe.spdx3
     import uuid
     from pathlib import Path
     from contextlib import contextmanager
@@ -538,36 +595,34 @@ python do_create_spdx() {
     include_sources =3D d.getVar("SPDX_INCLUDE_SOURCES") =3D=3D "1"
     archive_sources =3D d.getVar("SPDX_ARCHIVE_SOURCES") =3D=3D "1"
     archive_packaged =3D d.getVar("SPDX_ARCHIVE_PACKAGED") =3D=3D "1"
-    pkg_arch =3D d.getVar("SSTATE_PKGARCH")
-
-    creation_time =3D datetime.now(tz=3Dtimezone.utc).strftime("%Y-%m-%d=
T%H:%M:%SZ")
=20
-    doc =3D oe.spdx.SPDXDocument()
+    doc =3D oe.spdx3.SPDX3SpdxDocument()
=20
     doc.name =3D "recipe-" + d.getVar("PN")
     doc.documentNamespace =3D get_doc_namespace(d, doc)
-    doc.creationInfo.created =3D creation_time
-    doc.creationInfo.comment =3D "This document was created by analyzing=
 recipe files during the build."
-    doc.creationInfo.licenseListVersion =3D d.getVar("SPDX_LICENSE_DATA"=
)["licenseListVersion"]
-    doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spd=
x.bbclass")
-    doc.creationInfo.creators.append("Organization: %s" % d.getVar("SPDX=
_ORG"))
-    doc.creationInfo.creators.append("Person: N/A ()")
-
-    recipe =3D oe.spdx.SPDXPackage()
+    generate_creationInfo(d, doc)
+
+    recipe =3D oe.spdx3.SPDX3Package()
+    recipe.spdxId =3D oe.sbom.get_recipe_spdxid(d)
     recipe.name =3D d.getVar("PN")
-    recipe.versionInfo =3D d.getVar("PV")
-    recipe.SPDXID =3D oe.sbom.get_recipe_spdxid(d)
-    recipe.supplier =3D d.getVar("SPDX_SUPPLIER")
+    recipe.packageVersion =3D d.getVar("PV")
+    recipe.suppliedBy.append(get_supplier(d, doc))
+
     if bb.data.inherits_class("native", d) or bb.data.inherits_class("cr=
oss", d):
-        recipe.annotations.append(create_annotation(d, "isNative"))
+        comment =3D oe.spdx3.SPDX3Annotation()
+        comment.annotationType =3D "other"
+        comment.subject =3D recipe.spdxId
+        comment.statement =3D "isNative"
+
+        doc.element.append(comment)
=20
     homepage =3D d.getVar("HOMEPAGE")
     if homepage:
-        recipe.homepage =3D homepage
-
-    license =3D d.getVar("LICENSE")
-    if license:
-        recipe.licenseDeclared =3D convert_license_to_spdx(license, doc,=
 d)
+        recipe.homePage =3D homepage
+# TODO: Rework when License Profile implemented
+#    license =3D d.getVar("LICENSE")
+#    if license:
+#        recipe.licenseDeclared =3D convert_license_to_spdx(license, doc=
, d)
=20
     summary =3D d.getVar("SUMMARY")
     if summary:
@@ -581,26 +636,11 @@ python do_create_spdx() {
         for var in d.getVar('SPDX_CUSTOM_ANNOTATION_VARS').split():
             recipe.annotations.append(create_annotation(d, var + "=3D" +=
 d.getVar(var)))
=20
-    # Some CVEs may be patched during the build process without incremen=
ting the version number,
-    # so querying for CVEs based on the CPE id can lead to false positiv=
es. To account for this,
-    # save the CVEs fixed by patches to source information field in the =
SPDX.
-    patched_cves =3D oe.cve_check.get_patched_cves(d)
-    patched_cves =3D list(patched_cves)
-    patched_cves =3D ' '.join(patched_cves)
-    if patched_cves:
-        recipe.sourceInfo =3D "CVEs fixed: " + patched_cves
-
-    cpe_ids =3D oe.cve_check.get_cpe_ids(d.getVar("CVE_PRODUCT"), d.getV=
ar("CVE_VERSION"))
-    if cpe_ids:
-        for cpe_id in cpe_ids:
-            cpe =3D oe.spdx.SPDXExternalReference()
-            cpe.referenceCategory =3D "SECURITY"
-            cpe.referenceType =3D "http://spdx.org/rdf/references/cpe23T=
ype"
-            cpe.referenceLocator =3D cpe_id
-            recipe.externalRefs.append(cpe)
-
-    doc.packages.append(recipe)
-    doc.add_relationship(doc, "DESCRIBES", recipe)
+    # TODO: CVE handling
+
+    doc.element.append(recipe)
+
+    doc.add_relationship(doc, "describes", recipe)
=20
     add_download_packages(d, doc, recipe)
=20
@@ -615,7 +655,7 @@ python do_create_spdx() {
                 recipe,
                 spdx_workdir,
                 lambda file_counter: "SPDXRef-SourceFile-%s-%d" % (d.get=
Var("PN"), file_counter),
-                lambda filepath: ["SOURCE"],
+                lambda filepath: ["source"],
                 ignore_dirs=3D[".git"],
                 ignore_top_level_dirs=3D["temp"],
                 archive=3Darchive,
@@ -626,17 +666,13 @@ python do_create_spdx() {
=20
     dep_recipes =3D collect_dep_recipes(d, doc, recipe)
=20
-    doc_sha1 =3D oe.sbom.write_doc(d, doc, pkg_arch, "recipes", indent=3D=
get_json_indent(d))
+    doc_sha1 =3D oe.sbom.write_doc(d, doc, doc, d.getVar("SSTATE_PKGARCH=
"), "recipes", indent=3Dget_json_indent(d))
     dep_recipes.append(oe.sbom.DepRecipe(doc, doc_sha1, recipe))
=20
-    recipe_ref =3D oe.spdx.SPDXExternalDocumentRef()
-    recipe_ref.externalDocumentId =3D "DocumentRef-recipe-" + recipe.nam=
e
-    recipe_ref.spdxDocument =3D doc.documentNamespace
-    recipe_ref.checksum.algorithm =3D "SHA1"
-    recipe_ref.checksum.checksumValue =3D doc_sha1
+    #TODO: references
=20
     sources =3D collect_dep_sources(d, dep_recipes)
-    found_licenses =3D {license.name:recipe_ref.externalDocumentId + ":"=
 + license.licenseId for license in doc.hasExtractedLicensingInfos}
+#    found_licenses =3D {license.name:recipe_ref.externalDocumentId + ":=
" + license.licenseId for license in doc.hasExtractedLicensingInfos}
=20
     if not recipe_spdx_is_native(d, recipe):
         bb.build.exec_func("read_subpackage_metadata", d)
@@ -646,42 +682,41 @@ python do_create_spdx() {
             if not oe.packagedata.packaged(package, d):
                 continue
=20
-            package_doc =3D oe.spdx.SPDXDocument()
+            doc =3D oe.spdx3.SPDX3SpdxDocument()
             pkg_name =3D d.getVar("PKG:%s" % package) or package
-            package_doc.name =3D pkg_name
-            package_doc.documentNamespace =3D get_doc_namespace(d, packa=
ge_doc)
-            package_doc.creationInfo.created =3D creation_time
-            package_doc.creationInfo.comment =3D "This document was crea=
ted by analyzing packages created during the build."
-            package_doc.creationInfo.licenseListVersion =3D d.getVar("SP=
DX_LICENSE_DATA")["licenseListVersion"]
-            package_doc.creationInfo.creators.append("Tool: OpenEmbedded=
 Core create-spdx.bbclass")
-            package_doc.creationInfo.creators.append("Organization: %s" =
% d.getVar("SPDX_ORG"))
-            package_doc.creationInfo.creators.append("Person: N/A ()")
-            package_doc.externalDocumentRefs.append(recipe_ref)
+            doc.name =3D pkg_name
+            doc.documentNamespace =3D get_doc_namespace(d, doc)
+            generate_creationInfo(d, doc)
+
+            # TODO: Rework when License Profile implemented
+            # package_doc.creationInfo.licenseListVersion =3D d.getVar("=
SPDX_LICENSE_DATA")["licenseListVersion"]
+            # package_doc.externalDocumentRefs.append(recipe_ref)
=20
             package_license =3D d.getVar("LICENSE:%s" % package) or d.ge=
tVar("LICENSE")
=20
-            spdx_package =3D oe.spdx.SPDXPackage()
+            spdx_package =3D oe.spdx3.SPDX3Package()
=20
-            spdx_package.SPDXID =3D oe.sbom.get_package_spdxid(pkg_name)
+            spdx_package.spdxId =3D oe.sbom.get_package_spdxid(pkg_name)
             spdx_package.name =3D pkg_name
-            spdx_package.versionInfo =3D d.getVar("PV")
-            spdx_package.licenseDeclared =3D convert_license_to_spdx(pac=
kage_license, package_doc, d, found_licenses)
-            spdx_package.supplier =3D d.getVar("SPDX_SUPPLIER")
+            spdx_package.packageVersion =3D d.getVar("PV")
+            # TODO: Rework when License Profile implemented
+            #spdx_package.licenseDeclared =3D convert_license_to_spdx(pa=
ckage_license, package_doc, d, found_licenses)
+            spdx_package.suppliedBy =3D [ d.getVar("SPDX_SUPPLIER") ]
=20
-            package_doc.packages.append(spdx_package)
+            doc.element.append(spdx_package)
=20
-            package_doc.add_relationship(spdx_package, "GENERATED_FROM",=
 "%s:%s" % (recipe_ref.externalDocumentId, recipe.SPDXID))
-            package_doc.add_relationship(package_doc, "DESCRIBES", spdx_=
package)
+            doc.add_relationship(recipe, "generates", spdx_package)
+            doc.add_relationship(doc, "describes", spdx_package)
=20
-            package_archive =3D deploy_dir_spdx / "packages" / (package_=
doc.name + ".tar.zst")
+            package_archive =3D deploy_dir_spdx / "packages" / (doc.name=
 + ".tar.zst")
             with optional_tarfile(package_archive, archive_packaged) as =
archive:
                 package_files =3D add_package_files(
                     d,
-                    package_doc,
+                    doc,
                     spdx_package,
                     pkgdest / package,
                     lambda file_counter: oe.sbom.get_packaged_file_spdxi=
d(pkg_name, file_counter),
-                    lambda filepath: ["BINARY"],
+                    lambda filepath: ["executable"],
                     ignore_top_level_dirs=3D['CONTROL', 'DEBIAN'],
                     archive=3Darchive,
                 )
@@ -689,9 +724,9 @@ python do_create_spdx() {
                 if archive is not None:
                     spdx_package.packageFileName =3D str(package_archive=
.name)
=20
-            add_package_sources_from_debug(d, package_doc, spdx_package,=
 package, package_files, sources)
+            add_package_sources_from_debug(d, doc, spdx_package, package=
, package_files, sources)
=20
-            oe.sbom.write_doc(d, package_doc, pkg_arch, "packages", inde=
nt=3Dget_json_indent(d))
+            oe.sbom.write_doc(d, doc, doc, d.getVar("SSTATE_PKGARCH"), "=
packages", indent=3Dget_json_indent(d))
 }
 do_create_spdx[vardepsexclude] +=3D "BB_NUMBER_THREADS"
 # NOTE: depending on do_unpack is a hack that is necessary to get it's d=
ependencies for archive the source
@@ -749,127 +784,11 @@ def collect_package_providers(d):
 collect_package_providers[vardepsexclude] +=3D "BB_TASKDEPDATA"
=20
 python do_create_runtime_spdx() {
-    from datetime import datetime, timezone
-    import oe.sbom
-    import oe.spdx
-    import oe.packagedata
-    from pathlib import Path
-
-    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
-    spdx_deploy =3D Path(d.getVar("SPDXRUNTIMEDEPLOY"))
-    is_native =3D bb.data.inherits_class("native", d) or bb.data.inherit=
s_class("cross", d)
-
-    creation_time =3D datetime.now(tz=3Dtimezone.utc).strftime("%Y-%m-%d=
T%H:%M:%SZ")
-
-    providers =3D collect_package_providers(d)
-    pkg_arch =3D d.getVar("SSTATE_PKGARCH")
-    package_archs =3D d.getVar("SSTATE_ARCHS").split()
-    package_archs.reverse()
-
-    if not is_native:
-        bb.build.exec_func("read_subpackage_metadata", d)
-
-        dep_package_cache =3D {}
-
-        pkgdest =3D Path(d.getVar("PKGDEST"))
-        for package in d.getVar("PACKAGES").split():
-            localdata =3D bb.data.createCopy(d)
-            pkg_name =3D d.getVar("PKG:%s" % package) or package
-            localdata.setVar("PKG", pkg_name)
-            localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False) +=
 ":" + package)
-
-            if not oe.packagedata.packaged(package, localdata):
-                continue
-
-            pkg_spdx_path =3D oe.sbom.doc_path(deploy_dir_spdx, pkg_name=
, pkg_arch, "packages")
-
-            package_doc, package_doc_sha1 =3D oe.sbom.read_doc(pkg_spdx_=
path)
-
-            for p in package_doc.packages:
-                if p.name =3D=3D pkg_name:
-                    spdx_package =3D p
-                    break
-            else:
-                bb.fatal("Package '%s' not found in %s" % (pkg_name, pkg=
_spdx_path))
-
-            runtime_doc =3D oe.spdx.SPDXDocument()
-            runtime_doc.name =3D "runtime-" + pkg_name
-            runtime_doc.documentNamespace =3D get_doc_namespace(localdat=
a, runtime_doc)
-            runtime_doc.creationInfo.created =3D creation_time
-            runtime_doc.creationInfo.comment =3D "This document was crea=
ted by analyzing package runtime dependencies."
-            runtime_doc.creationInfo.licenseListVersion =3D d.getVar("SP=
DX_LICENSE_DATA")["licenseListVersion"]
-            runtime_doc.creationInfo.creators.append("Tool: OpenEmbedded=
 Core create-spdx.bbclass")
-            runtime_doc.creationInfo.creators.append("Organization: %s" =
% d.getVar("SPDX_ORG"))
-            runtime_doc.creationInfo.creators.append("Person: N/A ()")
-
-            package_ref =3D oe.spdx.SPDXExternalDocumentRef()
-            package_ref.externalDocumentId =3D "DocumentRef-package-" + =
package
-            package_ref.spdxDocument =3D package_doc.documentNamespace
-            package_ref.checksum.algorithm =3D "SHA1"
-            package_ref.checksum.checksumValue =3D package_doc_sha1
-
-            runtime_doc.externalDocumentRefs.append(package_ref)
-
-            runtime_doc.add_relationship(
-                runtime_doc.SPDXID,
-                "AMENDS",
-                "%s:%s" % (package_ref.externalDocumentId, package_doc.S=
PDXID)
-            )
-
-            deps =3D bb.utils.explode_dep_versions2(localdata.getVar("RD=
EPENDS") or "")
-            seen_deps =3D set()
-            for dep, _ in deps.items():
-                if dep in seen_deps:
-                    continue
-
-                if dep not in providers:
-                    continue
-
-                (dep, dep_hashfn) =3D providers[dep]
-
-                if not oe.packagedata.packaged(dep, localdata):
-                    continue
-
-                dep_pkg_data =3D oe.packagedata.read_subpkgdata_dict(dep=
, d)
-                dep_pkg =3D dep_pkg_data["PKG"]
-
-                if dep in dep_package_cache:
-                    (dep_spdx_package, dep_package_ref) =3D dep_package_=
cache[dep]
-                else:
-                    dep_path =3D oe.sbom.doc_find_by_hashfn(deploy_dir_s=
pdx, package_archs, dep_pkg, dep_hashfn)
-                    if not dep_path:
-                        bb.fatal("No SPDX file found for package %s, %s"=
 % (dep_pkg, dep_hashfn))
-
-                    spdx_dep_doc, spdx_dep_sha1 =3D oe.sbom.read_doc(dep=
_path)
-
-                    for pkg in spdx_dep_doc.packages:
-                        if pkg.name =3D=3D dep_pkg:
-                            dep_spdx_package =3D pkg
-                            break
-                    else:
-                        bb.fatal("Package '%s' not found in %s" % (dep_p=
kg, dep_path))
-
-                    dep_package_ref =3D oe.spdx.SPDXExternalDocumentRef(=
)
-                    dep_package_ref.externalDocumentId =3D "DocumentRef-=
runtime-dependency-" + spdx_dep_doc.name
-                    dep_package_ref.spdxDocument =3D spdx_dep_doc.docume=
ntNamespace
-                    dep_package_ref.checksum.algorithm =3D "SHA1"
-                    dep_package_ref.checksum.checksumValue =3D spdx_dep_=
sha1
-
-                    dep_package_cache[dep] =3D (dep_spdx_package, dep_pa=
ckage_ref)
-
-                runtime_doc.externalDocumentRefs.append(dep_package_ref)
-
-                runtime_doc.add_relationship(
-                    "%s:%s" % (dep_package_ref.externalDocumentId, dep_s=
pdx_package.SPDXID),
-                    "RUNTIME_DEPENDENCY_OF",
-                    "%s:%s" % (package_ref.externalDocumentId, spdx_pack=
age.SPDXID)
-                )
-                seen_deps.add(dep)
-
-            oe.sbom.write_doc(d, runtime_doc, pkg_arch, "runtime", spdx_=
deploy, indent=3Dget_json_indent(d))
+    # TODO: implement for SPDX3
+    return
 }
=20
-do_create_runtime_spdx[vardepsexclude] +=3D "OVERRIDES SSTATE_ARCHS"
+do_create_runtime_spdx[vardepsexclude] +=3D "OVERRIDES"
=20
 addtask do_create_runtime_spdx after do_create_spdx before do_build do_r=
m_work
 SSTATETASKS +=3D "do_create_runtime_spdx"
@@ -950,209 +869,13 @@ POPULATE_SDK_POST_HOST_COMMAND:append:task-populat=
e-sdk =3D " sdk_host_combine_spd
 POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk =3D " sdk_targ=
et_combine_spdx"
=20
 python image_combine_spdx() {
-    import os
-    import oe.sbom
-    from pathlib import Path
-    from oe.rootfs import image_list_installed_packages
-
-    image_name =3D d.getVar("IMAGE_NAME")
-    image_link_name =3D d.getVar("IMAGE_LINK_NAME")
-    imgdeploydir =3D Path(d.getVar("IMGDEPLOYDIR"))
-    img_spdxid =3D oe.sbom.get_image_spdxid(image_name)
-    packages =3D image_list_installed_packages(d)
-
-    combine_spdx(d, image_name, imgdeploydir, img_spdxid, packages, Path=
(d.getVar("SPDXIMAGEWORK")))
-
-    def make_image_link(target_path, suffix):
-        if image_link_name:
-            link =3D imgdeploydir / (image_link_name + suffix)
-            if link !=3D target_path:
-                link.symlink_to(os.path.relpath(target_path, link.parent=
))
-
-    spdx_tar_path =3D imgdeploydir / (image_name + ".spdx.tar.zst")
-    make_image_link(spdx_tar_path, ".spdx.tar.zst")
+    return
 }
=20
 python sdk_host_combine_spdx() {
-    sdk_combine_spdx(d, "host")
+    return
 }
=20
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
-    sdk_name =3D d.getVar("TOOLCHAIN_OUTPUTNAME") + "-" + sdk_type
-    sdk_deploydir =3D Path(d.getVar("SDKDEPLOYDIR"))
-    sdk_spdxid =3D oe.sbom.get_sdk_spdxid(sdk_name)
-    sdk_packages =3D sdk_list_installed_packages(d, sdk_type =3D=3D "tar=
get")
-    combine_spdx(d, sdk_name, sdk_deploydir, sdk_spdxid, sdk_packages, P=
ath(d.getVar('SPDXSDKWORK')))
-
-def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packag=
es, spdx_workdir):
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
-    providers =3D collect_package_providers(d)
-    package_archs =3D d.getVar("SSTATE_ARCHS").split()
-    package_archs.reverse()
-
-    creation_time =3D datetime.now(tz=3Dtimezone.utc).strftime("%Y-%m-%d=
T%H:%M:%SZ")
-    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
-    source_date_epoch =3D d.getVar("SOURCE_DATE_EPOCH")
-
-    doc =3D oe.spdx.SPDXDocument()
-    doc.name =3D rootfs_name
-    doc.documentNamespace =3D get_doc_namespace(d, doc)
-    doc.creationInfo.created =3D creation_time
-    doc.creationInfo.comment =3D "This document was created by analyzing=
 the source of the Yocto recipe during the build."
-    doc.creationInfo.licenseListVersion =3D d.getVar("SPDX_LICENSE_DATA"=
)["licenseListVersion"]
-    doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spd=
x.bbclass")
-    doc.creationInfo.creators.append("Organization: %s" % d.getVar("SPDX=
_ORG"))
-    doc.creationInfo.creators.append("Person: N/A ()")
-
-    image =3D oe.spdx.SPDXPackage()
-    image.name =3D d.getVar("PN")
-    image.versionInfo =3D d.getVar("PV")
-    image.SPDXID =3D rootfs_spdxid
-    image.supplier =3D d.getVar("SPDX_SUPPLIER")
-
-    doc.packages.append(image)
-
-    for name in sorted(packages.keys()):
-        if name not in providers:
-            bb.fatal("Unable to find SPDX provider for '%s'" % name)
-
-        pkg_name, pkg_hashfn =3D providers[name]
-
-        pkg_spdx_path =3D oe.sbom.doc_find_by_hashfn(deploy_dir_spdx, pa=
ckage_archs, pkg_name, pkg_hashfn)
-        if not pkg_spdx_path:
-            bb.fatal("No SPDX file found for package %s, %s" % (pkg_name=
, pkg_hashfn))
-
-        pkg_doc, pkg_doc_sha1 =3D oe.sbom.read_doc(pkg_spdx_path)
-
-        for p in pkg_doc.packages:
-            if p.name =3D=3D name:
-                pkg_ref =3D oe.spdx.SPDXExternalDocumentRef()
-                pkg_ref.externalDocumentId =3D "DocumentRef-%s" % pkg_do=
c.name
-                pkg_ref.spdxDocument =3D pkg_doc.documentNamespace
-                pkg_ref.checksum.algorithm =3D "SHA1"
-                pkg_ref.checksum.checksumValue =3D pkg_doc_sha1
-
-                doc.externalDocumentRefs.append(pkg_ref)
-                doc.add_relationship(image, "CONTAINS", "%s:%s" % (pkg_r=
ef.externalDocumentId, p.SPDXID))
-                break
-        else:
-            bb.fatal("Unable to find package with name '%s' in SPDX file=
 %s" % (name, pkg_spdx_path))
-
-        runtime_spdx_path =3D oe.sbom.doc_find_by_hashfn(deploy_dir_spdx=
, package_archs, "runtime-" + name, pkg_hashfn)
-        if not runtime_spdx_path:
-            bb.fatal("No runtime SPDX document found for %s, %s" % (name=
, pkg_hashfn))
-
-        runtime_doc, runtime_doc_sha1 =3D oe.sbom.read_doc(runtime_spdx_=
path)
-
-        runtime_ref =3D oe.spdx.SPDXExternalDocumentRef()
-        runtime_ref.externalDocumentId =3D "DocumentRef-%s" % runtime_do=
c.name
-        runtime_ref.spdxDocument =3D runtime_doc.documentNamespace
-        runtime_ref.checksum.algorithm =3D "SHA1"
-        runtime_ref.checksum.checksumValue =3D runtime_doc_sha1
-
-        # "OTHER" isn't ideal here, but I can't find a relationship that=
 makes sense
-        doc.externalDocumentRefs.append(runtime_ref)
-        doc.add_relationship(
-            image,
-            "OTHER",
-            "%s:%s" % (runtime_ref.externalDocumentId, runtime_doc.SPDXI=
D),
-            comment=3D"Runtime dependencies for %s" % name
-        )
-
-    image_spdx_path =3D spdx_workdir / (rootfs_name + ".spdx.json")
-
-    with image_spdx_path.open("wb") as f:
-        doc.to_json(f, sort_keys=3DTrue, indent=3Dget_json_indent(d))
-
-    num_threads =3D int(d.getVar("BB_NUMBER_THREADS"))
-
-    visited_docs =3D set()
-
-    index =3D {"documents": []}
-
-    spdx_tar_path =3D rootfs_deploydir / (rootfs_name + ".spdx.tar.zst")
-    with bb.compress.zstd.open(spdx_tar_path, "w", num_threads=3Dnum_thr=
eads) as f:
-        with tarfile.open(fileobj=3Df, mode=3D"w|") as tar:
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
-                    doc, sha1 =3D oe.sbom.read_doc(f)
-                    f.seek(0)
-
-                    if doc.documentNamespace in visited_docs:
-                        return
-
-                    bb.note("Adding SPDX document %s" % path)
-                    visited_docs.add(doc.documentNamespace)
-                    info =3D tar.gettarinfo(fileobj=3Df)
-
-                    info.name =3D doc.name + ".spdx.json"
-                    info.uid =3D 0
-                    info.gid =3D 0
-                    info.uname =3D "root"
-                    info.gname =3D "root"
-
-                    if source_date_epoch is not None and info.mtime > in=
t(source_date_epoch):
-                        info.mtime =3D int(source_date_epoch)
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
-                    ref_path =3D oe.sbom.doc_find_by_namespace(deploy_di=
r_spdx, package_archs, ref.spdxDocument)
-                    if not ref_path:
-                        bb.fatal("Cannot find any SPDX file for document=
 %s" % ref.spdxDocument)
-                    collect_spdx_document(ref_path)
-
-            collect_spdx_document(image_spdx_path)
-
-            index["documents"].sort(key=3Dlambda x: x["filename"])
-
-            index_str =3D io.BytesIO(json.dumps(
-                index,
-                sort_keys=3DTrue,
-                indent=3Dget_json_indent(d),
-            ).encode("utf-8"))
-
-            info =3D tarfile.TarInfo()
-            info.name =3D "index.json"
-            info.size =3D len(index_str.getvalue())
-            info.uid =3D 0
-            info.gid =3D 0
-            info.uname =3D "root"
-            info.gname =3D "root"
-
-            tar.addfile(info, fileobj=3Dindex_str)
-
-combine_spdx[vardepsexclude] +=3D "BB_NUMBER_THREADS SSTATE_ARCHS"
diff --git a/meta/lib/oe/spdx3.py b/meta/lib/oe/spdx3.py
index 36ba7aa1c3..1a404e0b43 100644
--- a/meta/lib/oe/spdx3.py
+++ b/meta/lib/oe/spdx3.py
@@ -68,6 +68,7 @@ class SPDX3Hash(SPDX3IntegrityMethod):
 #
 class SPDX3CreationInfo(SPDXObject):
     specVersion =3D _String(default=3D"3.0.0")
+    comment =3D _String(default=3D"")
     created =3D _String()
     createdBy =3D _ObjectList(SPDX3Agent)
     profile =3D _StringList(default=3D["core", "software"])  # TODO: not=
 in creationInfo in spec
@@ -88,7 +89,8 @@ class SPDX3CreationInfo(SPDXObject):
             main["createdUsing"] =3D [c.spdxId for c in self._spdx["crea=
tedUsing"]]
=20
         for (key, value) in self._spdx.items():
-            if not key in ["createdBy", "createdUsing"]:
+            if not key in ["createdBy", "createdUsing"] \
+               and value is not None and value is not "":
                 main.update({key: value})
         return main
=20
--=20
2.42.0


