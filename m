Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14100109B46D
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 13:24:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20277.1774963475834650592
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 06:24:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Zz04Ac+/;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BB5D497F
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 06:24:29 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0E7393F7D8
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 06:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774963475; bh=v+rjWh7ZqFbQEhihh+QpCcPX0PiHbWeXe0uhLTIUDsM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Zz04Ac+/Ny5YJisIPLCPciTkt1qwOo0uj4JcNXlJ6d63X0maoYrQB/1eHbodXo+xq
	 dJFgHKU/chG51OhxUSiUHJ0sbPOCf4FydPxRyUAzyAwVV7DKhc1lAvTEG4iKnCir0p
	 /vVOyW9kD3Dy+gdL9kQMJwjQv8h4fWoxY8H6dQHU=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] classes/sbom-cve-check: remove references to vex.bbclass
Date: Tue, 31 Mar 2026 14:24:28 +0100
Message-ID: <20260331132430.781647-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260331132430.781647-1-ross.burton@arm.com>
References: <20260331132430.781647-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 13:24:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234286

This class has been deleted now, so remove the references to it and the
file that it writes.

This is effectively a no-op change, as the recommended way to run
sbom-cve-check is with SPDX_INCLUDE_VEX=3D"all", which includes all of th=
e
data in the SPDX that the vex class would have generated.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/sbom-cve-check.bbclass | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/classes-recipe/sbom-cve-check.bbclass b/meta/classes-re=
cipe/sbom-cve-check.bbclass
index a5dc262c6aa..2a8429d0b1c 100644
--- a/meta/classes-recipe/sbom-cve-check.bbclass
+++ b/meta/classes-recipe/sbom-cve-check.bbclass
@@ -48,7 +48,6 @@ python do_sbom_cve_check() {
         bb.fatal("Cannot execute sbom-cve-check missing create-spdx-3.0 =
inherit.")
=20
     sbom_path =3D d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.spdx.=
json")
-    vex_manifest_path =3D d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAM=
E}.vex.json")
     dl_db_dir =3D d.getVar("SBOM_CVE_CHECK_DEPLOY_DB_DIR")
     deploy_dir =3D d.getVar("SBOM_CVE_CHECK_DEPLOYDIR")
     img_link_name =3D d.getVar("IMAGE_LINK_NAME")
@@ -72,12 +71,6 @@ python do_sbom_cve_check() {
         "--disable-auto-updates"
     ]
=20
-    # Assume that SPDX_INCLUDE_VEX is set globally to "all", and not onl=
y for the
-    # image recipe, which is very unlikely. This is not an issue to incl=
ude the
-    # VEX manifest even if not needed.
-    if bb.data.inherits_class("vex", d) and d.getVar("SPDX_INCLUDE_VEX")=
 !=3D "all":
-        cmd_args.extend(["--yocto-vex-manifest", vex_manifest_path])
-
     for export_file in export_files:
         cmd_args.extend(
             ["--export-type", export_file[0], "--export-path", export_fi=
le[1]]
--=20
2.43.0


