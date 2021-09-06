Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.22743.1630938976917923160
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Sep 2021 07:36:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B61D231B
	for <openembedded-core@lists.openembedded.org>; Mon,  6 Sep 2021 07:36:15 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 606AB3F766
	for <openembedded-core@lists.openembedded.org>; Mon,  6 Sep 2021 07:36:15 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] create-spdx: handle CLOSED license
Date: Mon,  6 Sep 2021 15:36:13 +0100
Message-Id: <20210906143613.702972-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The special CLOSED license means that this is closed source code with
no other licensing assertions.  It's not a generic license in oe-core,
and not a SPDX license, so transform it to NONE explicitly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/create-spdx.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.=
bbclass
index 1e0b3605587..f9d5a13a2f9 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -105,6 +105,9 @@ def convert_license_to_spdx(lic, document, d, existin=
g=3D{}):
         if l =3D=3D "|":
             return "OR"
=20
+        if l =3D=3D "CLOSED":
+            return "NONE"
+
         spdx_license =3D d.getVarFlag("SPDXLICENSEMAP", l) or l
         if spdx_license in license_data["licenses"]:
             return spdx_license
--=20
2.25.1

