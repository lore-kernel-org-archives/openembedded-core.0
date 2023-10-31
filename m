Return-Path: <louis.rannou@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 394E0C4708E
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 22:48:15 +0000 (UTC)
Received: from 16.mo583.mail-out.ovh.net (16.mo583.mail-out.ovh.net [87.98.174.144])
 by mx.groups.io with SMTP id smtpd.web10.9389.1698792489638308483
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 15:48:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 87.98.174.144, mailfrom: louis.rannou@syslinbit.com)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.108.4.44])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 166FF287A5
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 22:48:08 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-nzml2 (unknown [10.110.208.94])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 688241FDBB;
	Tue, 31 Oct 2023 22:48:07 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.108])
	by ghost-submission-6684bf9d7b-nzml2 with ESMTPSA
	id 4GDTEyeEQWUYnR8APQBgzw
	(envelope-from <louis.rannou@syslinbit.com>); Tue, 31 Oct 2023 22:48:07 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-108S002bf031180-bbc7-4a01-9298-57cced29fc53,
                    E382B8EC8DEDBA5F41C2577A0B4F295D8A9180D4) smtp.auth=louis.rannou@syslinbit.com
X-OVh-ClientIp: 45.81.62.9
From: Louis Rannou <louis.rannou@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	jpewhacker@gmail.com,
	Samantha Jalabert <samantha.jalabert@syslinbit.com>,
	Louis Rannou <louis.rannou@syslinbit.com>
Subject: [OE-core][RFC v2 11/12] create-spdx-3.0: support for License profile
Date: Tue, 31 Oct 2023 23:47:32 +0100
Message-ID: <20231031224733.367227-12-louis.rannou@syslinbit.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231031224733.367227-1-louis.rannou@syslinbit.com>
References: <20231031224733.367227-1-louis.rannou@syslinbit.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9522861412599324125
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddtfedgtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepnfhouhhishcutfgrnhhnohhuuceolhhouhhishdrrhgrnhhnohhusehshihslhhinhgsihhtrdgtohhmqeenucggtffrrghtthgvrhhnpeegjefgfeeiveeifeekveefueelkeegueeitdettdevgfehheevlefhveevhedvudenucfkphepuddvjedrtddrtddruddpgeehrdekuddriedvrdelpdefjedrheelrddugedvrddutdeknecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeolhhouhhishdrrhgrnhhnohhusehshihslhhinhgsihhtrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheekfedpmhhouggvpehsmhhtphhouhht
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 22:48:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189887

From: Samantha Jalabert <samantha.jalabert@syslinbit.com>

Add classes AnyLicenseInfo, LicenseExpression and SimpleLicensingText. Su=
ppose
inheritance of AnyLicenseInfo in LicenseExpression and SimpleLicensingTex=
t

Add the option to enable Licensing Profile: SPDX_ENABLE_LICENSING =3D "1"

Add methods to SPDX3SpdxDocument to return the list of existing
SPDX3LicenseExpression and SPDX3SimpleLicensingText

Split function convert_license_to_spdx into three separate functions and =
adapt
them to match spdx3.0 classes

Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
Signed-off-by: Louis Rannou <louis.rannou@syslinbit.com>
---
 meta/classes/create-spdx-3.0.bbclass | 197 +++++++++++++++++----------
 meta/lib/oe/spdx3.py                 |  22 +++
 2 files changed, 148 insertions(+), 71 deletions(-)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
index 3ef01783a7..270d812abc 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -200,77 +200,102 @@ python() {
         d.setVar("SPDX_LICENSE_DATA", data)
 }
=20
-def convert_license_to_spdx(lic, document, d, existing=3D{}):
+def add_extracted_license(d, document, ident, name):
     from pathlib import Path
-    import oe.spdx
+    import oe.spdx3
=20
-    license_data =3D d.getVar("SPDX_LICENSE_DATA")
-    extracted =3D {}
+    extracted_info =3D oe.spdx3.SPDX3SimpleLicensingText()
+    extracted_info.name =3D name
+    extracted_info.licenseText =3D None
=20
-    def add_extracted_license(ident, name):
-        nonlocal document
+    if name =3D=3D "PD":
+        # Special-case this.
+        extracted_info.licenseText =3D "Software released to the public =
domain"
+    else:
+        # Seach for the license in COMMON_LICENSE_DIR and LICENSE_PATH
+        for directory in [d.getVar('COMMON_LICENSE_DIR')] + (d.getVar('L=
ICENSE_PATH') or '').split():
+            try:
+                with (Path(directory) / name).open(errors=3D"replace") a=
s f:
+                    extracted_info.licenseText =3D f.read()
+                    break
+            except FileNotFoundError:
+                pass
+        if extracted_info.licenseText is None:
+            # If it's not SPDX or PD, then NO_GENERIC_LICENSE must be se=
t
+            filename =3D d.getVarFlag('NO_GENERIC_LICENSE', name)
+            if filename:
+                filename =3D d.expand("${S}/" + filename)
+                with open(filename, errors=3D"replace") as f:
+                    extracted_info.licenseText =3D f.read()
+            else:
+                bb.fatal("Cannot find any text for license %s" % name)
=20
-        if name in extracted:
-            return
+    return extracted_info
=20
-        extracted_info =3D oe.spdx.SPDX3ExtractedLicensingInfo()
-        extracted_info.name =3D name
-        extracted_info.licenseId =3D ident
-        extracted_info.extractedText =3D None
+def convert(d, l, document):
+    import oe.spdx3
=20
-        if name =3D=3D "PD":
-            # Special-case this.
-            extracted_info.extractedText =3D "Software released to the p=
ublic domain"
-        else:
-            # Seach for the license in COMMON_LICENSE_DIR and LICENSE_PA=
TH
-            for directory in [d.getVar('COMMON_LICENSE_DIR')] + (d.getVa=
r('LICENSE_PATH') or '').split():
-                try:
-                    with (Path(directory) / name).open(errors=3D"replace=
") as f:
-                        extracted_info.extractedText =3D f.read()
-                        break
-                except FileNotFoundError:
-                    pass
-            if extracted_info.extractedText is None:
-                # If it's not SPDX or PD, then NO_GENERIC_LICENSE must b=
e set
-                filename =3D d.getVarFlag('NO_GENERIC_LICENSE', name)
-                if filename:
-                    filename =3D d.expand("${S}/" + filename)
-                    with open(filename, errors=3D"replace") as f:
-                        extracted_info.extractedText =3D f.read()
-                else:
-                    bb.fatal("Cannot find any text for license %s" % nam=
e)
+    license_data =3D d.getVar("SPDX_LICENSE_DATA")
=20
-        extracted[name] =3D extracted_info
-        document.hasExtractedLicensingInfos.append(extracted_info)
+    if l =3D=3D "(" or l =3D=3D ")":
+        return l
=20
-    def convert(l):
-        if l =3D=3D "(" or l =3D=3D ")":
-            return l
+    if l =3D=3D "&":
+        return "AND"
=20
-        if l =3D=3D "&":
-            return "AND"
+    if l =3D=3D "|":
+        return "OR"
=20
-        if l =3D=3D "|":
-            return "OR"
+    if l =3D=3D "CLOSED":
+        return "NONE"
=20
-        if l =3D=3D "CLOSED":
-            return "NONE"
+    spdx_license =3D d.getVarFlag("SPDXLICENSEMAP", l) or l
=20
-        spdx_license =3D d.getVarFlag("SPDXLICENSEMAP", l) or l
-        if spdx_license in license_data["licenses"]:
-            return spdx_license
+    if spdx_license in license_data["licenses"]:
+        lic =3D oe.spdx3.SPDX3LicenseExpression()
+        lic.licenseExpression =3D spdx_license
+        lic.licenseListVersion =3D d.getVar("SPDX_LICENSE_DATA")["licens=
eListVersion"]
+        return lic
+    else:
+        spdx_license =3D "LicenseText-" + l
+        return add_extracted_license(d, document, spdx_license, l)
=20
-        try:
-            spdx_license =3D existing[l]
-        except KeyError:
-            spdx_license =3D "LicenseRef-" + l
-            add_extracted_license(spdx_license, l)
=20
-        return spdx_license
+def convert_license_to_spdx(lic, document, d, existing=3D{}):
+    import oe.spdx3
=20
+    licenses_found =3D []
+    licenses_id =3D []
+   =20
     lic_split =3D lic.replace("(", " ( ").replace(")", " ) ").replace("|=
", " | ").replace("&", " & ").split()
+    for l in lic_split:
+        licenses_found.append(convert(d, l, document))
+   =20
+    for element in licenses_found:
+
+        existing_licenses =3D document.get_licenses()
+
+        if isinstance(element, oe.spdx3.SPDX3LicenseExpression):
+            lic_type =3D "LicenseExpression"
+        else:
+            lic_type =3D "SimpleLicenseText"
+
+        if isinstance(element, oe.spdx3.SPDX3AnyLicenseInfo) and not exi=
sting_licenses:
+            element.spdxId =3D new_spdxid(d, document, lic_type, "1")
+            licenses_id.append(element.spdxId)
+            document.element.append(element)
+        elif isinstance(element, oe.spdx3.SPDX3AnyLicenseInfo):
+            for existinglic in existing_licenses:
+                if ("licenseExpression" in element.properties() and "lic=
enseExpression" in existinglic.properties() and element.licenseExpression=
 =3D=3D existinglic.licenseExpression) or \
+                ("licenseText" in element.properties() and "licenseText"=
 in existinglic.properties() and element.licenseText =3D=3D existinglic.l=
icenseText):
+                    licenses_id.append(existinglic.spdxId)
+                    break
+
+            element.spdxId =3D new_spdxid(d, document, lic_type, str(len=
(existing_licenses) + 1))
+            licenses_id.append(element.spdxId)
+            document.element.append(element)
=20
-    return ' '.join(convert(l) for l in lic_split)
+    return licenses_id
=20
 def process_sources(d):
     pn =3D d.getVar('PN')
@@ -362,11 +387,31 @@ def add_package_files(d, doc, spdx_pkg, topdir, get=
_spdxid, get_types, *, archiv
                 hashSha256.hashValue =3D bb.utils.sha256_file(filepath)
                 spdx_file.verifiedUsing.append(hashSha256)
=20
-                # TODO: Rework when License Profile implemented
-                #if "SOURCE" in spdx_file.fileTypes:
-                #    extracted_lics =3D extract_licenses(filepath)
-                #    if extracted_lics:
-                #        spdx_file.licenseInfoInFiles =3D extracted_lics
+                if d.getVar("SPDX_ENABLE_LICENSING") =3D=3D "1" and \
+                "source" in get_types(filepath):
+                    extracted_lics =3D extract_licenses(filepath)
+                    if extracted_lics:
+                        for lic in extracted_lics:
+                            current_licenses =3D doc.get_licenses_exp()
+                            if current_licenses:
+                                for c_lic in current_licenses:
+                                    if lic =3D=3D c_lic.licenseExpressio=
n:
+                                        create_relationship(d, doc, spdx=
_file, "declaredLicense", c_lic)
+                                        break
+
+                                l =3D oe.spdx3.SPDX3LicenseExpression()
+                                l.licenseExpression =3D lic
+                                l.licenseListVersion =3D d.getVar("SPDX_=
LICENSE_DATA")["licenseListVersion"]
+                                l.spdxId =3D new_spdxid(d, doc, "License=
Expression", str(len(current_licenses) +1))
+                                doc.element.append(l)
+                                create_relationship(d, doc, spdx_file, "=
declaredLicense", l)
+                            else:
+                                l =3D oe.spdx3.SPDX3LicenseExpression()
+                                l.licenseExpression =3D lic
+                                l.spdxId =3D new_spdxid(d, doc, "License=
Expression", "1")
+                                l.licenseListVersion =3D d.getVar("SPDX_=
LICENSE_DATA")["licenseListVersion"]
+                                doc.element.append(l)
+                                create_relationship(d, doc, spdx_file, "=
declaredLicense", l)
=20
                 doc.element.append(spdx_file)
=20
@@ -574,10 +619,13 @@ python do_create_spdx() {
     homepage =3D d.getVar("HOMEPAGE")
     if homepage:
         recipe.homePage =3D homepage
-# TODO: Rework when License Profile implemented
-#    license =3D d.getVar("LICENSE")
-#    if license:
-#        recipe.licenseDeclared =3D convert_license_to_spdx(license, doc=
, d)
+
+    if d.getVar("SPDX_ENABLE_LICENSING") =3D=3D "1":
+        _license =3D d.getVar("LICENSE")
+        if _license:
+            licenseDeclared =3D convert_license_to_spdx(_license, doc, d=
)
+            for l in licenseDeclared:
+                create_relationship(d, doc, recipe, "declaredLicense", l=
)
=20
     summary =3D d.getVar("SUMMARY")
     if summary:
@@ -623,9 +671,14 @@ python do_create_spdx() {
=20
     doc_sha1 =3D oe.sbom.write_doc(d, doc, doc, d.getVar("SSTATE_PKGARCH=
"), "recipes", indent=3Dget_json_indent(d))
=20
-    #TODO: references
-
-#    found_licenses =3D {license.name:recipe_ref.externalDocumentId + ":=
" + license.licenseId for license in doc.hasExtractedLicensingInfos}
+    # TODO: Recipe_ref not working with image_spdx_archive
+    #recipe_ref =3D oe.spdx3.SPDX3ExternalMap()
+    #recipe_ref.externalId =3D recipe.spdxId
+    #recipe_hash =3D oe.spdx3.SPDX3Hash()
+    #recipe_hash.algorithm =3D "sha1"
+    #recipe_hash.hashValue =3D doc_sha1
+    #recipe_ref.verifiedUsing.append(recipe_hash)
+    #recipe_ref.definingDocument =3D get_doc_namespace(d, doc)
=20
     if not recipe_spdx_is_native(doc, recipe):
         bb.build.exec_func("read_subpackage_metadata", d)
@@ -643,8 +696,7 @@ python do_create_spdx() {
             generate_creationInfo(d, doc)
=20
             # TODO: Rework when License Profile implemented
-            # package_doc.creationInfo.licenseListVersion =3D d.getVar("=
SPDX_LICENSE_DATA")["licenseListVersion"]
-            # package_doc.externalDocumentRefs.append(recipe_ref)
+            #doc.imports.append(recipe_ref)
=20
             package_license =3D d.getVar("LICENSE:%s" % package) or d.ge=
tVar("LICENSE")
=20
@@ -653,9 +705,12 @@ python do_create_spdx() {
             spdx_package.spdxId =3D new_spdxid(d, doc, "package", pkg_na=
me)
             spdx_package.name =3D pkg_name
             spdx_package.packageVersion =3D d.getVar("PV")
-            # TODO: Rework when License Profile implemented
-            #spdx_package.licenseDeclared =3D convert_license_to_spdx(pa=
ckage_license, package_doc, d, found_licenses)
-            spdx_package.suppliedBy =3D [ d.getVar("SPDX_SUPPLIER") ]
+            spdx_package.suppliedBy.append(get_supplier(d, doc))
+
+            if d.getVar("SPDX_ENABLE_LICENSING") =3D=3D "1":
+                licenseDeclared =3D convert_license_to_spdx(package_lice=
nse, doc, d)
+                for l in licenseDeclared:
+                    create_relationship(d, doc, spdx_package, "declaredL=
icense", l)
=20
             doc.element.append(spdx_package)
=20
diff --git a/meta/lib/oe/spdx3.py b/meta/lib/oe/spdx3.py
index 9ab57ac015..0e00c7854e 100644
--- a/meta/lib/oe/spdx3.py
+++ b/meta/lib/oe/spdx3.py
@@ -286,6 +286,14 @@ class SPDX3SpdxDocument(SPDX3Bundle):
=20
         return json.load(f, cls=3DDecoder)
=20
+    def get_licenses(self):
+        licenses =3D []
+        for el in self.element:
+            if isinstance(el, SPDX3AnyLicenseInfo):
+                licenses.append(el)
+
+        return licenses
+
 #
 # Profile: Software - Datatypes
 #
@@ -323,6 +331,20 @@ class SPDX3Package(SPDX3SoftwareArtifact):
 class SPDX3File(SPDX3SoftwareArtifact):
     pass
=20
+#
+# Profile: Simple Licensing
+#
+
+class SPDX3AnyLicenseInfo(SPDX3Element):
+    pass
+
+class SPDX3LicenseExpression(SPDX3AnyLicenseInfo):
+    licenseExpression =3D _String()
+    licenseListVersion =3D _String()
+
+class SPDX3SimpleLicensingText(SPDX3AnyLicenseInfo):
+    licenseText =3D _String()
+
 #
 # OpenEmbedded base class
 #
--=20
2.42.0


