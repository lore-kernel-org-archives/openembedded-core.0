Return-Path: <louis.rannou@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C16C00142
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 22:48:15 +0000 (UTC)
Received: from 17.mo581.mail-out.ovh.net (17.mo581.mail-out.ovh.net [188.165.35.227])
 by mx.groups.io with SMTP id smtpd.web11.9579.1698792488756633472
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 15:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 188.165.35.227, mailfrom: louis.rannou@syslinbit.com)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.109.146.19])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 424EF28121
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 22:48:07 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-nzml2 (unknown [10.110.208.94])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B6D9C1FDB1;
	Tue, 31 Oct 2023 22:48:06 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.108])
	by ghost-submission-6684bf9d7b-nzml2 with ESMTPSA
	id IMZzKCaEQWUYnR8APQBgzw
	(envelope-from <louis.rannou@syslinbit.com>); Tue, 31 Oct 2023 22:48:06 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-108S0021d806b43-465c-417a-beb0-897e0397c366,
                    E382B8EC8DEDBA5F41C2577A0B4F295D8A9180D4) smtp.auth=louis.rannou@syslinbit.com
X-OVh-ClientIp: 45.81.62.9
From: Louis Rannou <louis.rannou@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	jpewhacker@gmail.com,
	Samantha Jalabert <samantha.jalabert@syslinbit.com>,
	Louis Rannou <louis.rannou@syslinbit.com>
Subject: [OE-core][RFC v2 10/12] create-spdx-3.0: Use FQDN spdx ids
Date: Tue, 31 Oct 2023 23:47:31 +0100
Message-ID: <20231031224733.367227-11-louis.rannou@syslinbit.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231031224733.367227-1-louis.rannou@syslinbit.com>
References: <20231031224733.367227-1-louis.rannou@syslinbit.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9522579937684348381
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddtfedgtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepnfhouhhishcutfgrnhhnohhuuceolhhouhhishdrrhgrnhhnohhusehshihslhhinhgsihhtrdgtohhmqeenucggtffrrghtthgvrhhnpeegjefgfeeiveeifeekveefueelkeegueeitdettdevgfehheevlefhveevhedvudenucfkphepuddvjedrtddrtddruddpgeehrdekuddriedvrdelpdefjedrheelrddugedvrddutdeknecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeolhhouhhishdrrhgrnhhnohhusehshihslhhinhgsihhtrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheekuddpmhhouggvpehsmhhtphhouhht
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 22:48:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189886

From: Samantha Jalabert <samantha.jalabert@syslinbit.com>

Create a function to generate spdxIds
Create a function to generate relationship and remove add_relationship me=
thod
Implement both functions

Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
Signed-off-by: Louis Rannou <louis.rannou@syslinbit.com>
---
 meta/classes/create-spdx-3.0.bbclass | 73 ++++++++++++++++++++--------
 meta/lib/oe/spdx3.py                 | 27 ----------
 2 files changed, 53 insertions(+), 47 deletions(-)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
index 2cd91dd791..3ef01783a7 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -42,6 +42,10 @@ SPDX_SUPPLIER[doc] =3D "The SPDX PackageSupplier field=
 for SPDX packages created f
     is the contact information for the person or organization who is doi=
ng the \
     build."
=20
+def new_spdxid(d, doc, *suffix):
+    pn =3D d.getVar("PN")
+    return "/".join([get_doc_namespace(d, doc), pn] + list(suffix))
+
 def extract_licenses(filename):
     import re
=20
@@ -83,21 +87,21 @@ def generate_creationInfo(d, document, comment=3DNone=
):
=20
     tool =3D oe.spdx3.SPDX3Tool()
     tool.name =3D "OpenEmbedded Core create-spdx.bbclass"
-    tool.spdxId =3D "spdx-" + d.getVar("PN") + ":SPDXRef-Actor-" + tool.=
name.replace(" ", "")
+    tool.spdxId =3D new_spdxid(d, document, "Actor", tool.name.replace("=
 ", ""))
     tool.creationInfo =3D document.creationInfo
     document.element.append(tool)
     document.creationInfo.createdUsing.append(tool)
=20
     organization =3D oe.spdx3.SPDX3Organization()
     organization.name =3D d.getVar("SPDX_ORG")
-    organization.spdxId =3D "spdx-" + d.getVar("PN") + ":SPDXRef-Actor-"=
 + organization.name.replace(" ", "")
+    organization.spdxId =3D new_spdxid(d, document, "Actor", organizatio=
n.name.replace(" ", ""))
     organization.creationInfo =3D document.creationInfo
     document.element.append(organization)
     document.creationInfo.createdBy.append(organization)
=20
     person =3D oe.spdx3.SPDX3Person()
     person.name =3D "Person: N/A ()"
-    person.spdxId =3D "spdx-" + d.getVar("PN") + ":SPDXRef-Actor-" + per=
son.name.replace(" ", "")
+    person.spdxId =3D new_spdxid(d, document, "Actor", person.name.repla=
ce(" ", ""))
     document.creationInfo.createdBy.append(person)
     document.element.append(person)
=20
@@ -124,7 +128,7 @@ def get_supplier(d, doc=3DNone):
         raise KeyError("%r is not a valid SPDX agent type" % agentType)
=20
     agent.name =3D agentName
-    agent.spdxId =3D "spdx-" + d.getVar("PN") + ":SPDXRef-Actor-" + agen=
t.name.replace(" ", "")
+    agent.spdxId =3D new_spdxid(d, doc, "Actor", agent.name)
     agent.creationInfo =3D doc.creationInfo
=20
     return agent
@@ -136,9 +140,35 @@ def create_annotation(d, doc, recipe, comment):
     c.annotationType =3D "other"
     c.subject =3D recipe.spdxId
     c.statement =3D comment
+    c.spdxId =3D new_spdxid(d, doc, "annotation", comment)
=20
     doc.element.append(c)
=20
+def create_relationship(d, doc, _from, relationshipType, to):
+    import oe.spdx3
+
+    if isinstance(_from, oe.spdx3.SPDX3Element):
+        _from =3D _from.spdxId
+   =20
+    if isinstance(to, oe.spdx3.SPDX3Element):
+        to =3D to.spdxId
+
+    for el in doc.element:
+        if isinstance(el, oe.spdx3.SPDX3Relationship) and \
+        el._from =3D=3D _from and \
+        el.relationshipType =3D=3D relationshipType:
+            el.to.append(to)
+            return el.spdxId
+   =20
+    r =3D oe.spdx3.SPDX3Relationship()
+    r.spdxId =3D new_spdxid(d, doc, "Relationship", relationshipType)
+    r._from =3D _from
+    r.to.append(to)
+    r.relationshipType =3D relationshipType
+
+    doc.element.append(r)
+    return r.spdxId
+
 def recipe_spdx_is_native(doc, recipe):
     import oe.spdx3
=20
@@ -340,7 +370,7 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_s=
pdxid, get_types, *, archiv
=20
                 doc.element.append(spdx_file)
=20
-                doc.add_relationship(spdx_pkg, "contains", spdx_file)
+                create_relationship(d, doc, spdx_pkg, "contains", spdx_f=
ile)
=20
                 spdx_files.append(spdx_file)
                 file_counter +=3D 1
@@ -386,14 +416,14 @@ def collect_dep_recipes(d, doc, spdx_recipe):
         dep_recipes.append(oe.sbom.DepRecipe(spdx_dep_doc, spdx_dep_sha1=
, spdx_dep_recipe))
=20
         dep_recipe_ref =3D oe.spdx3.SPDX3ExternalMap()
-        dep_recipe_ref.externalId =3D "DocumentRef-%s" % spdx_dep_doc["n=
ame"]
+        dep_recipe_ref.externalId =3D spdx_dep_doc["spdxId"]
         hashSha1 =3D oe.spdx3.SPDX3Hash()
         hashSha1.algorithm =3D "sha1"
         hashSha1.hashValue =3D spdx_dep_sha1
         dep_recipe_ref.verifiedUsing.append(hashSha1)
=20
         doc.imports.append(dep_recipe_ref)
-        doc.add_relationship("%s:%s" % (dep_recipe_ref.externalId, spdx_=
dep_recipe["spdxId"]), "buildDependency", spdx_recipe)
+        create_relationship(d, doc, dep_recipe_ref.externalId, "buildDep=
endency", spdx_recipe)
=20
     # return dep_recipes
=20
@@ -415,7 +445,7 @@ def add_download_packages(d, doc, recipe):
         for name in f.names:
             package =3D oe.spdx3.SPDX3Package()
             package.name =3D "%s-source-%d" % (d.getVar("PN"), download_=
idx + 1)
-            package.spdxId =3D oe.sbom.get_download_spdxid(d, download_i=
dx + 1)
+            package.spdxId =3D new_spdxid(d, doc, "source", str(download=
_idx + 1))
=20
             if f.type =3D=3D "file":
                 continue
@@ -446,8 +476,8 @@ def add_download_packages(d, doc, recipe):
             package.downloadLocation =3D uri
             doc.element.append(package)
=20
-            doc.add_relationship(doc, "describes", package)
-            doc.add_relationship(package, "buildDependency", recipe)
+            create_relationship(d, doc, doc, "describes", package)
+            create_relationship(d, doc, package, "buildDependency", reci=
pe)
=20
 def collect_direct_deps(d, dep_task):
     current_task =3D "do_" + d.getVar("BB_CURRENTTASK")
@@ -529,10 +559,11 @@ python do_create_spdx() {
=20
     doc.name =3D "recipe-" + d.getVar("PN")
     doc.documentNamespace =3D get_doc_namespace(d, doc)
+    doc.spdxId =3D new_spdxid(d, doc, "Document")
     generate_creationInfo(d, doc)
=20
     recipe =3D oe.spdx3.SPDX3Package()
-    recipe.spdxId =3D oe.sbom.get_recipe_spdxid(d)
+    recipe.spdxId =3D new_spdxid(d, doc, "Recipe")
     recipe.name =3D d.getVar("PN")
     recipe.packageVersion =3D d.getVar("PV")
     recipe.suppliedBy.append(get_supplier(d, doc))
@@ -564,7 +595,7 @@ python do_create_spdx() {
=20
     doc.element.append(recipe)
=20
-    doc.add_relationship(doc, "describes", recipe)
+    create_relationship(d, doc, doc, "describes", recipe)
=20
     add_download_packages(d, doc, recipe)
=20
@@ -578,7 +609,7 @@ python do_create_spdx() {
                 doc,
                 recipe,
                 spdx_workdir,
-                lambda file_counter: "SPDXRef-SourceFile-%s-%d" % (d.get=
Var("PN"), file_counter),
+                lambda file_counter: new_spdxid(d, doc, "sourcefile", st=
r(file_counter)),
                 lambda filepath: ["source"],
                 ignore_dirs=3D[".git"],
                 ignore_top_level_dirs=3D["temp"],
@@ -608,6 +639,7 @@ python do_create_spdx() {
             pkg_name =3D d.getVar("PKG:%s" % package) or package
             doc.name =3D pkg_name
             doc.documentNamespace =3D get_doc_namespace(d, doc)
+            doc.spdxId =3D new_spdxid(d, doc, "Document")
             generate_creationInfo(d, doc)
=20
             # TODO: Rework when License Profile implemented
@@ -618,7 +650,7 @@ python do_create_spdx() {
=20
             spdx_package =3D oe.spdx3.SPDX3Package()
=20
-            spdx_package.spdxId =3D oe.sbom.get_package_spdxid(pkg_name)
+            spdx_package.spdxId =3D new_spdxid(d, doc, "package", pkg_na=
me)
             spdx_package.name =3D pkg_name
             spdx_package.packageVersion =3D d.getVar("PV")
             # TODO: Rework when License Profile implemented
@@ -627,8 +659,8 @@ python do_create_spdx() {
=20
             doc.element.append(spdx_package)
=20
-            doc.add_relationship(recipe, "generates", spdx_package)
-            doc.add_relationship(doc, "describes", spdx_package)
+            create_relationship(d, doc, recipe, "generates", spdx_packag=
e)
+            create_relationship(d, doc, doc, "describes", spdx_package)
=20
             package_archive =3D deploy_dir_spdx / "packages" / (doc.name=
 + ".tar.zst")
             with optional_tarfile(package_archive, archive_packaged) as =
archive:
@@ -637,7 +669,7 @@ python do_create_spdx() {
                     doc,
                     spdx_package,
                     pkgdest / package,
-                    lambda file_counter: oe.sbom.get_packaged_file_spdxi=
d(pkg_name, file_counter),
+                    lambda file_counter: new_spdxid(d, doc, "package", p=
kg_name, "file", str(file_counter)),
                     lambda filepath: ["executable"],
                     ignore_top_level_dirs=3D['CONTROL', 'DEBIAN'],
                     archive=3Darchive,
@@ -961,12 +993,13 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, =
rootfs_spdxid, packages, spdx
     doc =3D oe.spdx3.SPDX3SpdxDocument()
     doc.name =3D rootfs_name
     doc.documentNamespace =3D get_doc_namespace(d, doc)
+    doc.spdxId =3D new_spdxid(d, doc, "Document")
     generate_creationInfo(d, doc)
=20
     image =3D oe.spdx3.SPDX3Package()
     image.name =3D d.getVar("PN")
     image.packageVersion =3D d.getVar("PV")
-    image.spdxId =3D rootfs_spdxid
+    image.spdxId =3D new_spdxid(d, doc, "image", rootfs_spdxid)
     image.suppliedBy.append(get_supplier(d, doc))
=20
     doc.element.append(image)
@@ -997,7 +1030,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, r=
ootfs_spdxid, packages, spdx
         for p in j_pkg_pkgs['Package']:
             if p['name'] =3D=3D name:
                 pkg_ref =3D oe.spdx3.SPDX3ExternalMap()
-                pkg_ref.externalId =3D "DocumentRef-%s" % j_pkg_doc['nam=
e']
+                pkg_ref.externalId =3D j_pkg_doc['spdxId']
                 pkg_ref.definingDocument =3D j_pkg_doc['documentNamespac=
e']
                 hashSha1 =3D oe.spdx3.SPDX3Hash()
                 hashSha1.algorithm =3D "sha1"
@@ -1005,7 +1038,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, =
rootfs_spdxid, packages, spdx
                 pkg_ref.verifiedUsing.append(hashSha1)
=20
                 doc.imports.append(pkg_ref)
-                doc.add_relationship(image, "contains", "%s:%s" % (pkg_r=
ef.externalId, p['spdxId']))
+                create_relationship(d, doc, image, "contains", pkg_ref.e=
xternalId)
                 break
         else:
             bb.fatal("Unable to find package with name '%s' in SPDX file=
 %s" % (name, pkg_spdx_path))
diff --git a/meta/lib/oe/spdx3.py b/meta/lib/oe/spdx3.py
index 1a404e0b43..9ab57ac015 100644
--- a/meta/lib/oe/spdx3.py
+++ b/meta/lib/oe/spdx3.py
@@ -134,33 +134,6 @@ class SPDX3Element(SPDXObject):
                     main.update({key: value})
         return main
=20
-    def add_relationship(self, _from, relationship, _to):
-        if isinstance(_from, SPDX3Element):
-            from_spdxid =3D _from.spdxId
-        else:
-            from_spdxid =3D _from
-
-        if isinstance(_to, SPDX3Element):
-            to_spdxid =3D _to.spdxId
-        else:
-            to_spdxid =3D _to
-
-        for element in self.element:
-            if isinstance(element, SPDX3Relationship) \
-            and element._from =3D=3D from_spdxid \
-            and element.relationshipType =3D=3D relationship:
-                element.to.append(to_spdxid)
-                return element.spdxId
-
-        r =3D SPDX3Relationship(
-            _from=3Dfrom_spdxid,
-            relationshipType=3Drelationship,
-            to =3D [to_spdxid]
-        )
-
-        self.element.append(r)
-        return r.spdxId
-
     def find_external_map(self, sourceDocumentNamespace):
         for i in self.imports:
             if i.definingDocument =3D=3D sourceDocumentNamespace:
--=20
2.42.0


