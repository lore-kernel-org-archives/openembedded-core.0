Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.6317.1630684837703759500
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 09:00:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E81A1063
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 09:00:37 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE5083F766
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 09:00:36 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/4] create-spdx: embed unknown license texts
Date: Fri,  3 Sep 2021 17:00:32 +0100
Message-Id: <20210903160033.3141022-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903160033.3141022-1-ross.burton@arm.com>
References: <20210903160033.3141022-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

For licenses which are not known to SPDX, find and embed the actual
license text in an ExtractedLicesingInfo block.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/create-spdx.bbclass | 51 +++++++++++++++++++++++---------
 1 file changed, 37 insertions(+), 14 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.=
bbclass
index 529dee22918..cbb9239991c 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -51,21 +51,49 @@ python() {
 }
=20
 def convert_license_to_spdx(lic, document, d):
+    from pathlib import Path
     import oe.spdx
=20
+    available_licenses =3D d.getVar("AVAILABLE_LICENSES").split()
     license_data =3D d.getVar("SPDX_LICENSE_DATA")
+    extracted =3D {}
=20
-    def add_extracted_license(ident, name, text):
+    def add_extracted_license(ident, name):
         nonlocal document
=20
-        spdx_lic =3D oe.spdx.SPDXExtractedLicensingInfo()
-        spdx_lic.name =3D name
-        spdx_lic.licenseId =3D ident
-        spdx_lic.extractedText =3D text
-
-        document.hasExtractedLicensingInfos.append(spdx_lic)
+        if name in extracted:
+            return
+
+        extracted_info =3D oe.spdx.SPDXExtractedLicensingInfo()
+        extracted_info.name =3D name
+        extracted_info.licenseId =3D ident
+
+        if name =3D=3D "PD":
+            # Special-case this.
+            extracted_info.extractedText =3D "Software released to the p=
ublic domain"
+        elif name in available_licenses:
+            # This license can be found in COMMON_LICENSE_DIR or LICENSE=
_PATH
+            for directory in [d.getVar('COMMON_LICENSE_DIR')] + d.getVar=
('LICENSE_PATH').split():
+                try:
+                    with (Path(directory) / name).open(errors=3D"replace=
") as f:
+                        extracted_info.extractedText =3D f.read()
+                        break
+                except Exception as e:
+                    # Error out, as the license was in available_license=
s so
+                    # should be on disk somewhere.
+                    bb.error(f"Cannot find text for license {name}: {e}"=
)
+        else:
+            # If it's not SPDX, or PD, or in available licenses, then NO=
_GENERIC_LICENSE must be set
+            filename =3D d.getVarFlag('NO_GENERIC_LICENSE', name)
+            if filename:
+                filename =3D d.expand("${S}/" + filename)
+                with open(filename, errors=3D"replace") as f:
+                    extracted_info.extractedText =3D f.read()
+            else:
+                bb.error(f"Cannot find any text for license {name}")
=20
-        return True
+        extracted[name] =3D extracted_info
+        document.hasExtractedLicensingInfos.append(extracted_info)
=20
     def convert(l):
         if l =3D=3D "(" or l =3D=3D ")":
@@ -82,12 +110,7 @@ def convert_license_to_spdx(lic, document, d):
             return spdx_license
=20
         spdx_license =3D "LicenseRef-" + l
-
-        if l =3D=3D "PD":
-            add_extracted_license(spdx_license, l, "Software released to=
 the public domain")
-        elif add_extracted_license(spdx_license, l, "This software is li=
censed under the %s license" % l):
-            pass
-            #bb.warn("No SPDX License found for %s. Creating a place hol=
der" % l)
+        add_extracted_license(spdx_license, l)
=20
         return spdx_license
=20
--=20
2.25.1

