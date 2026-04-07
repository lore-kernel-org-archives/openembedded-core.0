Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C11EF46C7F
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 21:03:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92193.1775595784316163396
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 14:03:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=W13+CvVS;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D94C9353C
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Apr 2026 14:02:57 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4698B3F7D8
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Apr 2026 14:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775595783; bh=CY/XXJJP+FpgGIEFv/giz3JI9Od6jv4nF1bkBYcpiPU=;
	h=From:To:Subject:Date:From;
	b=W13+CvVS9M+VW+xebx7tpvrS77r1Qweb+3HqqTSoVYA4AkA11fjt1Ay8c0ihZgkNJ
	 Xb/ar2PEX/4+ibsrYbhYwv5Y2Fyxh+MsLl8vSzeYcjfKzT7PikK0/yKCeGF9MBwSBw
	 sJfST/rZJj3nu52Fkbd3/inixpjdnIBcITmKHJDI=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/7] sbom-cve-check-update-db: Fix do_populate_lic failure
Date: Tue,  7 Apr 2026 22:02:20 +0100
Message-ID: <20260407210226.2375631-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 21:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234780

From: Benjamin Robin <benjamin.robin@bootlin.com>

The `do_populate_lic` task was failing because it runs after `do_patch`,
but the indirect dependency on `do_unpack` was lost when the `do_patch`
task was deleted.

It is safe, and even preferable, to retain the `do_patch` task, as this
allows users to apply patches to their CVE databases.

Follow-up to commit 8ef22ad9e302f86b2da4fa81541a464e95b9ef3c
("sbom-cve-check: Add class for post-build CVE analysis").

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 meta/classes-recipe/sbom-cve-check.bbclass                    | 4 ++--
 .../sbom-cve-check/sbom-cve-check-update-db.inc               | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/sbom-cve-check.bbclass b/meta/classes-re=
cipe/sbom-cve-check.bbclass
index 6c62a5119d..4abc427c58 100644
--- a/meta/classes-recipe/sbom-cve-check.bbclass
+++ b/meta/classes-recipe/sbom-cve-check.bbclass
@@ -106,8 +106,8 @@ do_sbom_cve_check[sstate-inputdirs] =3D "${SBOM_CVE_C=
HECK_DEPLOYDIR}"
 do_sbom_cve_check[sstate-outputdirs] =3D "${DEPLOY_DIR_IMAGE}"
 do_sbom_cve_check[depends] +=3D " \
     python3-sbom-cve-check-native:do_populate_sysroot \
-    sbom-cve-check-update-cvelist-native:do_unpack \
-    sbom-cve-check-update-nvd-native:do_unpack \
+    sbom-cve-check-update-cvelist-native:do_patch \
+    sbom-cve-check-update-nvd-native:do_patch \
 "
=20
 python do_sbom_cve_check_setscene() {
diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-d=
b.inc b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
index 4e9cef96e8..a318e2c40e 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
@@ -9,7 +9,6 @@ require sbom-cve-check-config.inc
 SBOM_CVE_CHECK_DB_NAME[doc] =3D "Database name, which is the Git reposit=
ory directory name. \
     The git repository will be stored in ${SBOM_CVE_CHECK_DEPLOY_DB_DIR)=
/"
=20
-deltask do_patch
 deltask do_configure
 deltask do_compile
 deltask do_install
--=20
2.43.0


