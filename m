Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.6316.1630684837605573153
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 09:00:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33FFD1FB
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 09:00:36 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D272D3F766
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 09:00:35 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/4] create-spdx: transform license list into a dict for faster lookups
Date: Fri,  3 Sep 2021 17:00:30 +0100
Message-Id: <20210903160033.3141022-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

spdx-licenses.json contains an array of licenses objects. As we'll be
searching it often, convert that to a dictionary when we parse it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/create-spdx.bbclass | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.=
bbclass
index a590ab596ac..73ccb3c990f 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -44,7 +44,10 @@ python() {
         return
=20
     with open(d.getVar("SPDX_LICENSES"), "r") as f:
-        d.setVar("SPDX_LICENSE_DATA", json.load(f))
+        data =3D json.load(f)
+        # Transform the license array to a dictionary
+        data["licenses"] =3D {l["licenseId"]: l for l in data["licenses"=
]}
+        d.setVar("SPDX_LICENSE_DATA", data)
 }
=20
 def convert_license_to_spdx(lic, document, d):
@@ -55,9 +58,8 @@ def convert_license_to_spdx(lic, document, d):
     def add_extracted_license(ident, name, text):
         nonlocal document
=20
-        for lic_data in license_data["licenses"]:
-            if lic_data["licenseId"] =3D=3D ident:
-                return False
+        if ident in license_data["licenses"]:
+            return False
=20
         spdx_lic =3D oe.spdx.SPDXExtractedLicensingInfo()
         spdx_lic.name =3D name
@@ -79,9 +81,8 @@ def convert_license_to_spdx(lic, document, d):
             return "OR"
=20
         spdx_license =3D d.getVarFlag("SPDXLICENSEMAP", l) or l
-        for lic_data in license_data["licenses"]:
-            if lic_data["licenseId"] =3D=3D spdx_license:
-                return spdx_license
+        if spdx_license in license_data["licenses"]:
+            return spdx_license
=20
         spdx_license =3D "LicenseRef-" + l
=20
--=20
2.25.1

