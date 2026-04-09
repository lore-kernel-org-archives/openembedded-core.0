Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD11BEA3C4E
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 16:26:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.136575.1775751988159787124
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 09:26:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=mLc4tma7;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 079A31E2F
	for <openembedded-core@lists.openembedded.org>; Thu,  9 Apr 2026 09:26:22 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5D6663F641
	for <openembedded-core@lists.openembedded.org>; Thu,  9 Apr 2026 09:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775751987; bh=2GQS1AtY/i9GkvkfOAiH7cnrxiu+ioQBILZPeurLkEc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mLc4tma76zldmriXgzNH1Ux4k38e2Z/q/D3DPpnqt3A7vz5LB/X5P0dx5VRzoG2R6
	 7C2c5Mr7NGiSYRv0Uug414DH4qIAkPHPlTzuA5tFgFrOJ1/osyqBOBST9Mhb0tgpRz
	 pSaJ/hkuGRCaz+kvpNs95myOgao5F9oRpObgzJy4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] python3-sbom-cve-check: fix the version attribute in the Yocto-style JSON
Date: Thu,  9 Apr 2026 17:26:21 +0100
Message-ID: <20260409162622.3307731-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409162622.3307731-1-ross.burton@arm.com>
References: <20260409162622.3307731-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:26:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234935

The type of the version was an integer, but it should be a string.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...-correct-type-for-the-version-attrib.patch | 31 +++++++++++++++++++
 .../python3-sbom-cve-check_1.2.0.bb           |  2 ++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/sbom-cve-check/files/0001-expor=
t_yocto-use-correct-type-for-the-version-attrib.patch

diff --git a/meta/recipes-devtools/sbom-cve-check/files/0001-export_yocto=
-use-correct-type-for-the-version-attrib.patch b/meta/recipes-devtools/sb=
om-cve-check/files/0001-export_yocto-use-correct-type-for-the-version-att=
rib.patch
new file mode 100644
index 00000000000..392f0b99ea7
--- /dev/null
+++ b/meta/recipes-devtools/sbom-cve-check/files/0001-export_yocto-use-co=
rrect-type-for-the-version-attrib.patch
@@ -0,0 +1,31 @@
+From 1a5ae49c520d3569ed12f0c6373b4223d428f92b Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Thu, 9 Apr 2026 11:55:19 +0100
+Subject: [PATCH] export_yocto: use correct type for the version attribut=
e
+
+This should be a string, not an integer:
+
+https://git.openembedded.org/openembedded-core/tree/meta/classes/cve-che=
ck.bbclass?h=3Dyocto-5.2.4#n235
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/sbom_cve_check/export/export_yocto.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/sbom_cve_check/export/export_yocto.py b/src/sbom_cve_ch=
eck/export/export_yocto.py
+index c8261f4..78d72c0 100644
+--- a/src/sbom_cve_check/export/export_yocto.py
++++ b/src/sbom_cve_check/export/export_yocto.py
+@@ -172,7 +172,7 @@ class YoctoCveCheckExport(BaseExport):
+         :return: Generator context.
+         """
+         yield
+-        json_obj =3D {"version": 1, "package": self._packages}
++        json_obj =3D {"version": "1", "package": self._packages}
+         with self._open_output_as_text() as f:
+             json.dump(json_obj, f, indent=3D2)
+=20
+--=20
+2.43.0
+
diff --git a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_=
1.2.0.bb b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.=
2.0.bb
index 070e8789713..2a09d8ea4c3 100644
--- a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.2.0.b=
b
+++ b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.2.0.b=
b
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D570a9b3749dd04=
63a1778803b12a6dce"
 PYPI_PACKAGE =3D "sbom_cve_check"
 SRC_URI[sha256sum] =3D "0b01474c541fb4b9d29d36f86fae6d0f27ff2b991fcb59b2=
fbeb70c1eaa09664"
=20
+SRC_URI +=3D "file://0001-export_yocto-use-correct-type-for-the-version-=
attrib.patch"
+
 inherit pypi python_hatchling
=20
 RDEPENDS:${PN} +=3D " \
--=20
2.43.0


