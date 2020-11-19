Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7293.1605782296416251099
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2020 02:38:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41BB41396
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2020 02:38:15 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E21463F718
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2020 02:38:14 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] cve-check: show real PN/PV
Date: Thu, 19 Nov 2020 10:38:09 +0000
Message-Id: <20201119103813.2726273-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The output currently shows the remapped product and version fields,
which may not be the actual recipe name/version. As this report is about
recipes, use the real values.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/cve-check.bbclass | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbcl=
ass
index 25cefda92eb..d843e7c4ace 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -208,6 +208,9 @@ def check_cves(d, patched_cves):
     """
     from distutils.version import LooseVersion
=20
+    pn =3D d.getVar("PN")
+    real_pv =3D d.getVar("PV")
+
     cves_unpatched =3D []
     # CVE_PRODUCT can contain more than one product (eg. curl/libcurl)
     products =3D d.getVar("CVE_PRODUCT").split()
@@ -217,7 +220,7 @@ def check_cves(d, patched_cves):
     pv =3D d.getVar("CVE_VERSION").split("+git")[0]
=20
     # If the recipe has been whitlisted we return empty lists
-    if d.getVar("PN") in d.getVar("CVE_CHECK_PN_WHITELIST").split():
+    if pn in d.getVar("CVE_CHECK_PN_WHITELIST").split():
         bb.note("Recipe has been whitelisted, skipping check")
         return ([], [], [])
=20
@@ -286,12 +289,12 @@ def check_cves(d, patched_cves):
                         vulnerable =3D vulnerable_start or vulnerable_en=
d
=20
                 if vulnerable:
-                    bb.note("%s-%s is vulnerable to %s" % (product, pv, =
cve))
+                    bb.note("%s-%s is vulnerable to %s" % (pn, real_pv, =
cve))
                     cves_unpatched.append(cve)
                     break
=20
             if not vulnerable:
-                bb.note("%s-%s is not vulnerable to %s" % (product, pv, =
cve))
+                bb.note("%s-%s is not vulnerable to %s" % (pn, real_pv, =
cve))
                 # TODO: not patched but not vulnerable
                 patched_cves.add(cve)
=20
--=20
2.25.1

