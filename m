Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7753AFEEF2D
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 21:03:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92008.1775595784674426486
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 14:03:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=fWGDQf7W;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D8CD353E
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Apr 2026 14:02:58 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D29803F7D8
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Apr 2026 14:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775595784; bh=9AYRw16KtkIBBg7pjtC/50sy89BdQwAyVc7sVD8hAeE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fWGDQf7Wn/ylkxLgXDyBDxfQF7qAtM1DvoHv1635m9XOgYwRM5WjXRm6sjdXhTgDr
	 Av+8F9YHbVZ6xyFR7Y0LMakUiC1DK4ZN3rHyfZjlOl/UZ/xmlKOp37yjGCc4ZTvEs8
	 vohE7gb9sm84WJE/h+n350Md2Tmp+6tLa/7wQMdA=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/7] sbom-cve-check-update-db: Fix unpack removing other databases
Date: Tue,  7 Apr 2026 22:02:21 +0100
Message-ID: <20260407210226.2375631-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260407210226.2375631-1-ross.burton@arm.com>
References: <20260407210226.2375631-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 21:03:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234781

From: Benjamin Robin <benjamin.robin@bootlin.com>

Previously, `UNPACKDIR` was set to `${SBOM_CVE_CHECK_DEPLOY_DB_DIR}`,
which points to the `./databases/` directory and may contain multiple
databases. Since `do_unpack` cleans the `${UNPACKDIR}` directory,
`UNPACKDIR` must only contain a single database.

To address this, set `UNPACKDIR` to
`${SBOM_CVE_CHECK_DEPLOY_DB_DIR}/${SBOM_CVE_CHECK_DB_NAME}` and
configure `destsuffix` to an empty string. However, it is currently not
possible to set `BB_GIT_DEFAULT_DESTSUFFIX` to an empty string, so
`destsuffix` is configured through the SRC_URI instead.

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
Tested-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../sbom-cve-check/sbom-cve-check-update-cvelist-native.bb    | 2 +-
 .../sbom-cve-check/sbom-cve-check-update-db.inc               | 3 +--
 .../sbom-cve-check/sbom-cve-check-update-nvd-native.bb        | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-c=
velist-native.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-up=
date-cvelist-native.bb
index ce204db6c5..3387122165 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-=
native.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-=
native.bb
@@ -3,7 +3,7 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
=20
 HOMEPAGE =3D "https://github.com/CVEProject/cvelistV5"
-SRC_URI =3D "git://github.com/CVEProject/cvelistV5.git;branch=3Dmain;pro=
tocol=3Dhttps"
+SRC_URI =3D "git://github.com/CVEProject/cvelistV5.git;branch=3Dmain;pro=
tocol=3Dhttps;destsuffix=3D"
 SBOM_CVE_CHECK_DB_NAME =3D "cvelist"
=20
 # 2026-03-19_baseline
diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-d=
b.inc b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
index a318e2c40e..7ada67363d 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
@@ -15,6 +15,5 @@ deltask do_install
 deltask do_populate_sysroot
=20
 # Directly unpack the fetched CVE database to the deploy directory.
-UNPACKDIR =3D "${SBOM_CVE_CHECK_DEPLOY_DB_DIR}"
+UNPACKDIR =3D "${SBOM_CVE_CHECK_DEPLOY_DB_DIR}/${SBOM_CVE_CHECK_DB_NAME}=
"
 S =3D "${UNPACKDIR}"
-BB_GIT_DEFAULT_DESTSUFFIX =3D "${SBOM_CVE_CHECK_DB_NAME}"
diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-n=
vd-native.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update=
-nvd-native.bb
index 30c7868b2a..c868ba09c1 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-nati=
ve.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-nati=
ve.bb
@@ -1,9 +1,9 @@
 SUMMARY =3D "Updates the NVD CVE database"
 LICENSE =3D "cve-tou"
-LIC_FILES_CHKSUM =3D "file://${SBOM_CVE_CHECK_DB_NAME}/LICENSES/cve-tou.=
md;md5=3Dbc5bbf146f01e20ece63d83c8916d8fb"
+LIC_FILES_CHKSUM =3D "file://LICENSES/cve-tou.md;md5=3Dbc5bbf146f01e20ec=
e63d83c8916d8fb"
=20
 HOMEPAGE =3D "https://github.com/fkie-cad/nvd-json-data-feeds"
-SRC_URI =3D "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=3D=
main;protocol=3Dhttps"
+SRC_URI =3D "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=3D=
main;protocol=3Dhttps;destsuffix=3D"
 SBOM_CVE_CHECK_DB_NAME =3D "nvd-fkie"
=20
 # v2026.03.19-010002
--=20
2.43.0


