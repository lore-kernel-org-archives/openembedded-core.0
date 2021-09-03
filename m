Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.5821.1630682635024701076
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 08:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94C05101E
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 08:23:53 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 405423F766
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 08:23:53 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] create-spex: don't duplicate license texts in each package
Date: Fri,  3 Sep 2021 16:23:48 +0100
Message-Id: <20210903152348.3138708-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903152348.3138708-1-ross.burton@arm.com>
References: <20210903152348.3138708-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Instead of putting the full license text for non-SPDX licenses into the
recipe and every package, use links to the recipe from the packages if
possible.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/create-spdx.bbclass | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.=
bbclass
index cbb9239991c..1e0b3605587 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -50,7 +50,7 @@ python() {
         d.setVar("SPDX_LICENSE_DATA", data)
 }
=20
-def convert_license_to_spdx(lic, document, d):
+def convert_license_to_spdx(lic, document, d, existing=3D{}):
     from pathlib import Path
     import oe.spdx
=20
@@ -109,8 +109,11 @@ def convert_license_to_spdx(lic, document, d):
         if spdx_license in license_data["licenses"]:
             return spdx_license
=20
-        spdx_license =3D "LicenseRef-" + l
-        add_extracted_license(spdx_license, l)
+        try:
+            spdx_license =3D existing[l]
+        except KeyError:
+            spdx_license =3D "LicenseRef-" + l
+            add_extracted_license(spdx_license, l)
=20
         return spdx_license
=20
@@ -462,7 +465,14 @@ python do_create_spdx() {
     doc_sha1 =3D oe.sbom.write_doc(d, doc, "recipes")
     dep_recipes.append(oe.sbom.DepRecipe(doc, doc_sha1, recipe))
=20
+    recipe_ref =3D oe.spdx.SPDXExternalDocumentRef()
+    recipe_ref.externalDocumentId =3D "DocumentRef-recipe-" + recipe.nam=
e
+    recipe_ref.spdxDocument =3D doc.documentNamespace
+    recipe_ref.checksum.algorithm =3D "SHA1"
+    recipe_ref.checksum.checksumValue =3D doc_sha1
+
     sources =3D collect_dep_sources(d, dep_recipes)
+    found_licenses =3D {license.name:recipe_ref.externalDocumentId + ":"=
 + license.licenseId for license in doc.hasExtractedLicensingInfos}
=20
     if not is_native:
         bb.build.exec_func("read_subpackage_metadata", d)
@@ -482,13 +492,6 @@ python do_create_spdx() {
             package_doc.creationInfo.creators.append("Tool: OpenEmbedded=
 Core create-spdx.bbclass")
             package_doc.creationInfo.creators.append("Organization: Open=
Embedded ()")
             package_doc.creationInfo.creators.append("Person: N/A ()")
-
-            recipe_ref =3D oe.spdx.SPDXExternalDocumentRef()
-            recipe_ref.externalDocumentId =3D "DocumentRef-recipe-" + re=
cipe.name
-            recipe_ref.spdxDocument =3D doc.documentNamespace
-            recipe_ref.checksum.algorithm =3D "SHA1"
-            recipe_ref.checksum.checksumValue =3D doc_sha1
-
             package_doc.externalDocumentRefs.append(recipe_ref)
=20
             package_license =3D d.getVar("LICENSE:%s" % package) or d.ge=
tVar("LICENSE")
@@ -498,7 +501,7 @@ python do_create_spdx() {
             spdx_package.SPDXID =3D oe.sbom.get_package_spdxid(pkg_name)
             spdx_package.name =3D pkg_name
             spdx_package.versionInfo =3D d.getVar("PV")
-            spdx_package.licenseDeclared =3D convert_license_to_spdx(pac=
kage_license, package_doc, d)
+            spdx_package.licenseDeclared =3D convert_license_to_spdx(pac=
kage_license, package_doc, d, found_licenses)
=20
             package_doc.packages.append(spdx_package)
=20
--=20
2.25.1

