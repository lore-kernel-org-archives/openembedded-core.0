Return-Path: <louis.rannou@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF6FC00144
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 22:48:15 +0000 (UTC)
Received: from 17.mo581.mail-out.ovh.net (17.mo581.mail-out.ovh.net [188.165.35.227])
 by mx.groups.io with SMTP id smtpd.web11.9578.1698792488529440002
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 15:48:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 188.165.35.227, mailfrom: louis.rannou@syslinbit.com)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.109.146.19])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 9620028038
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 22:48:06 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-nzml2 (unknown [10.110.208.94])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 17D1B1FE00;
	Tue, 31 Oct 2023 22:48:06 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.108])
	by ghost-submission-6684bf9d7b-nzml2 with ESMTPSA
	id uGbQASaEQWUYnR8APQBgzw
	(envelope-from <louis.rannou@syslinbit.com>); Tue, 31 Oct 2023 22:48:06 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-108S002e6759df0-c68f-4549-b8e0-c0d2603b8464,
                    E382B8EC8DEDBA5F41C2577A0B4F295D8A9180D4) smtp.auth=louis.rannou@syslinbit.com
X-OVh-ClientIp: 45.81.62.9
From: Louis Rannou <louis.rannou@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	jpewhacker@gmail.com,
	Samantha Jalabert <samantha.jalabert@syslinbit.com>,
	Louis Rannou <louis.rannou@syslinbit.com>
Subject: [OE-core][RFC v2 09/12] create-spdx-3.0: support for spdx image
Date: Tue, 31 Oct 2023 23:47:30 +0100
Message-ID: <20231031224733.367227-10-louis.rannou@syslinbit.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231031224733.367227-1-louis.rannou@syslinbit.com>
References: <20231031224733.367227-1-louis.rannou@syslinbit.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9522298465644830173
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddtfedgtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepnfhouhhishcutfgrnhhnohhuuceolhhouhhishdrrhgrnhhnohhusehshihslhhinhgsihhtrdgtohhmqeenucggtffrrghtthgvrhhnpeejkeejhefhhfduheelveethfejteefgffgheeiuddtteeuteevhefgudekffevkeenucffohhmrghinhepshgsohhmrdhsvggrrhgthhdpphgrtghkrghgvggurghtrgdrrhgvrggupdiishhtugdrohhpvghnnecukfhppeduvdejrddtrddtrddupdeghedrkedurdeivddrledpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehlohhuihhsrdhrrghnnhhouhesshihshhlihhnsghithdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehkedupdhmohguvgepshhmthhpohhuth
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 22:48:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189885

From: Samantha Jalabert <samantha.jalabert@syslinbit.com>

Support for dependencies to provide the complete recipe SPDX.
Support for runtime SPDX
Support for combined SPDX

Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
Signed-off-by: Louis Rannou <louis.rannou@syslinbit.com>
---
 meta/classes/create-spdx-2.2.bbclass |   1 -
 meta/classes/create-spdx-3.0.bbclass | 389 +++++++++++++++++++++++++--
 2 files changed, 371 insertions(+), 19 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-s=
pdx-2.2.bbclass
index b0aef80db1..799c2fa092 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -713,7 +713,6 @@ do_create_spdx[depends] +=3D "${PATCHDEPENDENCY}"
 def collect_package_providers(d):
     from pathlib import Path
     import oe.sbom
-    import oe.spdx
     import json
=20
     deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
index 39f3db7233..2cd91dd791 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -129,12 +129,26 @@ def get_supplier(d, doc=3DNone):
=20
     return agent
=20
-def recipe_spdx_is_native(d, recipe):
+def create_annotation(d, doc, recipe, comment):
+    import oe.spdx3
+
+    c =3D oe.spdx3.SPDX3Annotation()
+    c.annotationType =3D "other"
+    c.subject =3D recipe.spdxId
+    c.statement =3D comment
+
+    doc.element.append(c)
+
+def recipe_spdx_is_native(doc, recipe):
+    import oe.spdx3
+
+    for element in doc.element:
+        if isinstance(element, oe.spdx3.SPDX3Annotation) \
+        and element.subject =3D=3D recipe.spdxId \
+        and element.statement =3D=3D "isNative":
+            return True
+
     return False
-# TODO: find a better way to mark native recipes
-#    return any(a.annotationType =3D=3D "OTHER" and
-#      a.annotator =3D=3D "Tool: %s - %s" % (d.getVar("SPDX_TOOL_NAME"),=
 d.getVar("SPDX_TOOL_VERSION")) and
-#      a.comment =3D=3D "isNative" for a in recipe.annotations)
=20
 def is_work_shared_spdx(d):
     return bb.data.inherits_class('kernel', d) or ('work-shared' in d.ge=
tVar('WORKDIR'))
@@ -435,10 +449,23 @@ def add_download_packages(d, doc, recipe):
             doc.add_relationship(doc, "describes", package)
             doc.add_relationship(package, "buildDependency", recipe)
=20
-
 def collect_direct_deps(d, dep_task):
+    current_task =3D "do_" + d.getVar("BB_CURRENTTASK")
+    pn =3D d.getVar("PN")
+
+    taskdepdata =3D d.getVar("BB_TASKDEPDATA", False)
+
+    for this_dep in taskdepdata.values():
+        if this_dep[0] =3D=3D pn and this_dep[1] =3D=3D current_task:
+            break
+    else:
+        bb.fatal(f"Unable to find this {pn}:{current_task} in taskdepdat=
a")
=20
     deps =3D set()
+    for dep_name in this_dep[3]:
+        dep_data =3D taskdepdata[dep_name]
+        if dep_data[1] =3D=3D dep_task and dep_data[0] !=3D pn:
+            deps.add((dep_data[0], dep_data[7]))
=20
     return sorted(deps)
=20
@@ -511,12 +538,7 @@ python do_create_spdx() {
     recipe.suppliedBy.append(get_supplier(d, doc))
=20
     if bb.data.inherits_class("native", d) or bb.data.inherits_class("cr=
oss", d):
-        comment =3D oe.spdx3.SPDX3Annotation()
-        comment.annotationType =3D "other"
-        comment.subject =3D recipe.spdxId
-        comment.statement =3D "isNative"
-
-        doc.element.append(comment)
+        create_annotation(d, doc, recipe, "isNative")
=20
     homepage =3D d.getVar("HOMEPAGE")
     if homepage:
@@ -536,7 +558,7 @@ python do_create_spdx() {
=20
     if d.getVar("SPDX_CUSTOM_ANNOTATION_VARS"):
         for var in d.getVar('SPDX_CUSTOM_ANNOTATION_VARS').split():
-            recipe.annotations.append(create_annotation(d, var + "=3D" +=
 d.getVar(var)))
+            recipe.annotations.append(create_annotation(d, doc, recipe, =
var + "=3D" + d.getVar(var)))
=20
     # TODO: CVE handling
=20
@@ -574,7 +596,7 @@ python do_create_spdx() {
=20
 #    found_licenses =3D {license.name:recipe_ref.externalDocumentId + ":=
" + license.licenseId for license in doc.hasExtractedLicensingInfos}
=20
-    if not recipe_spdx_is_native(d, recipe):
+    if not recipe_spdx_is_native(doc, recipe):
         bb.build.exec_func("read_subpackage_metadata", d)
=20
         pkgdest =3D Path(d.getVar("PKGDEST"))
@@ -685,11 +707,131 @@ def collect_package_providers(d):
 collect_package_providers[vardepsexclude] +=3D "BB_TASKDEPDATA"
=20
 python do_create_runtime_spdx() {
-    # TODO: implement for SPDX3
-    return
+    from datetime import datetime, timezone
+    import oe.sbom
+    import oe.spdx3
+    import oe.packagedata
+    from pathlib import Path
+
+    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
+    spdx_deploy =3D Path(d.getVar("SPDXRUNTIMEDEPLOY"))
+    is_native =3D bb.data.inherits_class("native", d) or bb.data.inherit=
s_class("cross", d)
+
+    creation_time =3D datetime.now(tz=3Dtimezone.utc).strftime("%Y-%m-%d=
T%H:%M:%SZ")
+
+    providers =3D collect_package_providers(d)
+    pkg_arch =3D d.getVar("SSTATE_PKGARCH")
+    package_archs =3D d.getVar("SSTATE_ARCHS").split()
+    package_archs.reverse()
+
+    if not is_native:
+        bb.build.exec_func("read_subpackage_metadata", d)
+
+        dep_package_cache =3D {}
+
+        pkgdest =3D Path(d.getVar("PKGDEST"))
+        for package in d.getVar("PACKAGES").split():
+            localdata =3D bb.data.createCopy(d)
+            pkg_name =3D d.getVar("PKG:%s" % package) or package
+            localdata.setVar("PKG", pkg_name)
+            localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False) +=
 ":" + package)
+
+            if not oe.packagedata.packaged(package, localdata):
+                continue
+
+            pkg_spdx_path =3D oe.sbom.doc_path(deploy_dir_spdx, pkg_name=
, pkg_arch, "packages")
+
+            j_package_doc, j_packages, package_doc_sha1 =3D oe.sbom.sear=
ch_doc(pkg_spdx_path, ["Package"])
+
+            for p in j_packages["Package"]:
+                if p['name'] =3D=3D pkg_name:
+                    j_spdx_package =3D p
+                    break
+            else:
+                bb.fatal("Package '%s' not found in %s" % (pkg_name, pkg=
_spdx_path))
+
+            runtime_doc =3D oe.spdx3.SPDX3SpdxDocument()
+            runtime_doc.name =3D "runtime-" + pkg_name
+            runtime_doc.documentNamespace =3D get_doc_namespace(localdat=
a, runtime_doc)
+            runtime_doc.creationInfo.created =3D creation_time
+            generate_creationInfo(d, runtime_doc,
+                                  "This document was created by analyzin=
g package runtime dependencies.")
+
+            package_ref =3D oe.spdx3.SPDX3ExternalMap()
+            package_ref.externalId =3D "DocumentRef-package-" + package
+            package_ref.definingDocument =3D j_package_doc['documentName=
space']
+            hashSha1 =3D oe.spdx3.SPDX3Hash()
+            hashSha1.algorithm =3D "sha1"
+            hashSha1.hashValue =3D package_doc_sha1
+            package_ref.verifiedUsing.append(hashSha1)
+
+            runtime_doc.imports.append(package_ref)
+
+            create_relationship(
+                d, runtime_doc,
+                runtime_doc,
+                "amends",
+                "%s:%s" % (package_ref.externalId, j_package_doc['spdxId=
'])
+            )
+
+            deps =3D bb.utils.explode_dep_versions2(localdata.getVar("RD=
EPENDS") or "")
+            seen_deps =3D set()
+            for dep, _ in deps.items():
+                if dep in seen_deps:
+                    continue
+
+                if dep not in providers:
+                    continue
+
+                (dep, dep_hashfn) =3D providers[dep]
+
+                if not oe.packagedata.packaged(dep, localdata):
+                    continue
+
+                dep_pkg_data =3D oe.packagedata.read_subpkgdata_dict(dep=
, d)
+                dep_pkg =3D dep_pkg_data["PKG"]
+
+                if dep in dep_package_cache:
+                    (j_dep_spdx_package, dep_package_ref) =3D dep_packag=
e_cache[dep]
+                else:
+                    dep_path =3D oe.sbom.doc_find_by_hashfn(deploy_dir_s=
pdx, package_archs, dep_pkg, dep_hashfn)
+                    if not dep_path:
+                        bb.fatal("No SPDX file found for package %s, %s"=
 % (dep_pkg, dep_hashfn))
+
+                    j_spdx_dep_doc, j_spdx_dep_packages, spdx_dep_sha1 =3D=
 oe.sbom.search_doc(dep_path, ["Package"])
+
+                    for pkg in j_spdx_dep_packages["Package"]:
+                        if pkg['name'] =3D=3D dep_pkg:
+                            j_dep_spdx_package =3D pkg
+                            break
+                    else:
+                        bb.fatal("Package '%s' not found in %s" % (dep_p=
kg, dep_path))
+
+
+                    dep_package_ref =3D oe.spdx3.SPDX3ExternalMap()
+                    dep_package_ref.externalId =3D "DocumentRef-runtime-=
dependency-" + j_spdx_dep_doc['name']
+                    dep_package_ref.definingDocument =3D j_spdx_dep_doc[=
'documentNamespace']
+                    hashSha1 =3D oe.spdx3.SPDX3Hash()
+                    hashSha1.algorithm =3D "sha1"
+                    hashSha1.hashValue =3D spdx_dep_sha1
+                    dep_package_ref.verifiedUsing.append(hashSha1)
+
+                    dep_package_cache[dep] =3D (j_dep_spdx_package, dep_=
package_ref)
+
+                runtime_doc.imports.append(dep_package_ref)
+
+                create_relationship(
+                    d, runtime_doc,
+                    "%s:%s" % (dep_package_ref.externalId, j_dep_spdx_pa=
ckage['spdxId']),
+                    "runtimeDependency",
+                    "%s:%s" % (package_ref.externalId, j_spdx_package['s=
pdxId'])
+                )
+                seen_deps.add(dep)
+
+            oe.sbom.write_doc(d, runtime_doc, runtime_doc, pkg_arch, "ru=
ntime", spdx_deploy, indent=3Dget_json_indent(d))
 }
=20
-do_create_runtime_spdx[vardepsexclude] +=3D "OVERRIDES"
+do_create_runtime_spdx[vardepsexclude] +=3D "OVERRIDES SSTATE_ARCHS"
=20
 addtask do_create_runtime_spdx after do_create_spdx before do_build do_r=
m_work
 SSTATETASKS +=3D "do_create_runtime_spdx"
@@ -770,9 +912,220 @@ POPULATE_SDK_POST_HOST_COMMAND:append:task-populate=
-sdk =3D " sdk_host_combine_spd
 POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk =3D " sdk_targ=
et_combine_spdx"
=20
 python image_combine_spdx() {
-    return
+    import os
+    import oe.sbom
+    from pathlib import Path
+    from oe.rootfs import image_list_installed_packages
+
+    image_name =3D d.getVar("IMAGE_NAME")
+    image_link_name =3D d.getVar("IMAGE_LINK_NAME")
+    imgdeploydir =3D Path(d.getVar("IMGDEPLOYDIR"))
+    img_spdxid =3D oe.sbom.get_image_spdxid(image_name)
+    packages =3D image_list_installed_packages(d)
+
+    combine_spdx(d, image_name, imgdeploydir, img_spdxid, packages,
+                 Path(d.getVar("SPDXIMAGEWORK")), Path(d.getVar("DEPLOY_=
DIR_SPDX")))
+    image_spdx_archive(d, image_name, imgdeploydir,
+                       Path(d.getVar("SPDXIMAGEWORK")), Path(d.getVar("D=
EPLOY_DIR_SPDX")))
+
+    def make_image_link(target_path, suffix):
+        if image_link_name:
+            link =3D imgdeploydir / (image_link_name + suffix)
+            if link !=3D target_path:
+                link.symlink_to(os.path.relpath(target_path, link.parent=
))
+
+    spdx_tar_path =3D imgdeploydir / (image_name + ".spdx.tar.zst")
+    make_image_link(spdx_tar_path, ".spdx.tar.zst")
 }
=20
+def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packag=
es, spdx_workdir, spdx_deploydir):
+    """
+    Combine the SPDX for the deployed image.
+
+    Create a document with the main image as package, add relations for =
each
+    packages and their runtime dependencies.
+    """
+    import os
+    import oe.spdx3
+    import oe.sbom
+    from datetime import timezone, datetime
+    from pathlib import Path
+    import bb.compress.zstd
+
+    providers =3D collect_package_providers(d)
+    package_archs =3D d.getVar("SSTATE_ARCHS").split()
+    package_archs.reverse()
+
+    creation_time =3D datetime.now(tz=3Dtimezone.utc).strftime("%Y-%m-%d=
T%H:%M:%SZ")
+
+    doc =3D oe.spdx3.SPDX3SpdxDocument()
+    doc.name =3D rootfs_name
+    doc.documentNamespace =3D get_doc_namespace(d, doc)
+    generate_creationInfo(d, doc)
+
+    image =3D oe.spdx3.SPDX3Package()
+    image.name =3D d.getVar("PN")
+    image.packageVersion =3D d.getVar("PV")
+    image.spdxId =3D rootfs_spdxid
+    image.suppliedBy.append(get_supplier(d, doc))
+
+    doc.element.append(image)
+
+    # TODO: this is done later, do we require this ?
+    # image_spdx_path =3D spdx_workdir / (rootfs_name + ".spdx.json")
+    # with image_spdx_path.open("wb") as f:
+    #     doc.to_json(f, sort_keys=3DTrue, indent=3Dget_json_indent(d))
+
+    num_threads =3D int(d.getVar("BB_NUMBER_THREADS"))
+
+    visited_docs =3D set()
+
+    index =3D {"documents": []}
+
+    for name in sorted(packages.keys()):
+        if name not in providers:
+            bb.fatal("Unable to find SPDX provider for '%s'" % name)
+
+        pkg_name, pkg_hashfn =3D providers[name]
+
+        pkg_spdx_path =3D oe.sbom.doc_find_by_hashfn(spdx_deploydir, pac=
kage_archs, pkg_name, pkg_hashfn)
+        if not pkg_spdx_path:
+            bb.fatal("No SPDX file found for package %s, %s" % (pkg_name=
, pkg_hashfn))
+
+        j_pkg_doc, j_pkg_pkgs, pkg_doc_sha1 =3D oe.sbom.search_doc(pkg_s=
pdx_path, ['Package'])
+
+        for p in j_pkg_pkgs['Package']:
+            if p['name'] =3D=3D name:
+                pkg_ref =3D oe.spdx3.SPDX3ExternalMap()
+                pkg_ref.externalId =3D "DocumentRef-%s" % j_pkg_doc['nam=
e']
+                pkg_ref.definingDocument =3D j_pkg_doc['documentNamespac=
e']
+                hashSha1 =3D oe.spdx3.SPDX3Hash()
+                hashSha1.algorithm =3D "sha1"
+                hashSha1.hashValue =3D pkg_doc_sha1
+                pkg_ref.verifiedUsing.append(hashSha1)
+
+                doc.imports.append(pkg_ref)
+                doc.add_relationship(image, "contains", "%s:%s" % (pkg_r=
ef.externalId, p['spdxId']))
+                break
+        else:
+            bb.fatal("Unable to find package with name '%s' in SPDX file=
 %s" % (name, pkg_spdx_path))
+
+        runtime_spdx_path =3D oe.sbom.doc_find_by_hashfn(spdx_deploydir,=
 package_archs, "runtime-" + name, pkg_hashfn)
+        if not runtime_spdx_path:
+            bb.fatal("No runtime SPDX document found for %s, %s" % (name=
, pkg_hashfn))
+
+        j_runtime_doc, _, runtime_doc_sha1 =3D oe.sbom.search_doc(runtim=
e_spdx_path)
+
+        runtime_ref =3D oe.spdx3.SPDX3ExternalMap()
+        runtime_ref.externalId =3D "DocumentRef-%s" % j_runtime_doc['nam=
e']
+        runtime_ref.definingDocument =3D j_runtime_doc['documentNamespac=
e']
+        hashSha1 =3D oe.spdx3.SPDX3Hash()
+        hashSha1.algorithm =3D "sha1"
+        hashSha1.hashValue =3D runtime_doc_sha1
+        runtime_ref.verifiedUsing.append(hashSha1)
+
+        doc.imports.append(runtime_ref)
+        create_relationship(
+            d,
+            doc,
+            image,
+            "runtimeDependency",
+            "%s:%s" % (runtime_ref.externalId, j_runtime_doc['spdxId'])
+        )
+
+    image_spdx_path =3D spdx_workdir / (rootfs_name + ".spdx.json")
+
+    with image_spdx_path.open("wb") as f:
+        doc.to_json(f, sort_keys=3DFalse, indent=3Dget_json_indent(d))
+
+
+def image_spdx_archive(d, rootfs_name, rootfs_deploydir, spdx_workdir, s=
pdx_deploydir):
+    import tarfile
+    import io
+    import json
+
+    source_date_epoch =3D d.getVar("SOURCE_DATE_EPOCH")
+
+    image_spdx_path =3D spdx_workdir / (rootfs_name + ".spdx.json")
+
+    num_threads =3D int(d.getVar("BB_NUMBER_THREADS"))
+
+    visited_docs =3D set()
+
+    index =3D {"documents": []}
+
+    spdx_tar_path =3D rootfs_deploydir / (rootfs_name + ".spdx.tar.zst")
+    with bb.compress.zstd.open(spdx_tar_path, "w", num_threads=3Dnum_thr=
eads) as f:
+        with tarfile.open(fileobj=3Df, mode=3D"w|") as tar:
+            def collect_spdx_document(path):
+                nonlocal tar
+                nonlocal spdx_deploydir
+                nonlocal source_date_epoch
+                nonlocal index
+
+                package_archs =3D d.getVar("SSTATE_ARCHS").split()
+                package_archs.reverse()
+
+                if path in visited_docs:
+                    return
+
+                visited_docs.add(path)
+
+                with path.open("rb") as f:
+                    doc, _, sha1 =3D oe.sbom.search_doc(f, [])
+                    f.seek(0)
+
+                    if doc['documentNamespace'] in visited_docs:
+                        return
+
+                    bb.note("Adding SPDX document %s" % path)
+                    visited_docs.add(doc['documentNamespace'])
+                    info =3D tar.gettarinfo(fileobj=3Df)
+
+                    info.name =3D doc['name'] + ".spdx.json"
+                    info.uid =3D 0
+                    info.gid =3D 0
+                    info.uname =3D "root"
+                    info.gname =3D "root"
+
+                    if source_date_epoch is not None and info.mtime > in=
t(source_date_epoch):
+                        info.mtime =3D int(source_date_epoch)
+
+                    tar.addfile(info, f)
+
+                    index["documents"].append({
+                        "filename": info.name,
+                        "documentNamespace": doc['documentNamespace'],
+                        "sha1": sha1,
+                    })
+                if 'imports' in doc:
+                    for ref in doc['imports']:
+                        ref_path =3D oe.sbom.doc_find_by_namespace(spdx_=
deploydir, package_archs, ref['definingDocument'])
+                        if not ref_path:
+                            bb.fatal("Cannot find any SPDX file for docu=
ment %s" % ref['definingDocument'])
+                        collect_spdx_document(ref_path)
+
+            collect_spdx_document(image_spdx_path)
+
+            index["documents"].sort(key=3Dlambda x: x["filename"])
+
+            index_str =3D io.BytesIO(json.dumps(
+                index,
+                sort_keys=3DTrue,
+                indent=3Dget_json_indent(d),
+            ).encode("utf-8"))
+
+            info =3D tarfile.TarInfo()
+            info.name =3D "index.json"
+            info.size =3D len(index_str.getvalue())
+            info.uid =3D 0
+            info.gid =3D 0
+            info.uname =3D "root"
+            info.gname =3D "root"
+
+            tar.addfile(info, fileobj=3Dindex_str)
+
+
 python sdk_host_combine_spdx() {
     return
 }
--=20
2.42.0


