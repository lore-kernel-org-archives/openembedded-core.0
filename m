Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DBFE105D986
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 21:03:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92010.1775595785699574496
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 14:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=bNUWylG0;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93F81353C
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Apr 2026 14:02:59 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 016993F7D8
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Apr 2026 14:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775595785; bh=cw1VkFH4Y/eSbeEbWhOe7fAAh77LQp1tgQKf4txZA3M=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bNUWylG0tj592uVnj3AsGeTJ2tuP3olGmOTepzQMZF4v7/UhipNEEnRt1pDIzPy2h
	 2JSF+p61VjQxen8CD1YQ6A67svu9aLYxvLECkSVwnDjq7oDBdBoxsBomwoMG+NKBL4
	 hl2evDgulIGDL31VS2pp6BICvJZb2dlUw2smhxEk=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 4/7] classes/sbom-cve-check: refactor do_sbom_cve_check
Date: Tue,  7 Apr 2026 22:02:23 +0100
Message-ID: <20260407210226.2375631-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260407210226.2375631-1-ross.burton@arm.com>
References: <20260407210226.2375631-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 21:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234783

Extract the bulk of the logic to a separate function, so the task just
has to pass a few variables.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/sbom-cve-check.bbclass | 27 +++++++++++++---------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/meta/classes-recipe/sbom-cve-check.bbclass b/meta/classes-re=
cipe/sbom-cve-check.bbclass
index 0534833ebe..a24d34b896 100644
--- a/meta/classes-recipe/sbom-cve-check.bbclass
+++ b/meta/classes-recipe/sbom-cve-check.bbclass
@@ -43,28 +43,23 @@ SBOM_CVE_CHECK_EXPORT_SUMMARY[doc] =3D "Export config=
uration to generate a human-r
 SBOM_CVE_CHECK_EXPORT_SUMMARY[type] ?=3D "summary"
 SBOM_CVE_CHECK_EXPORT_SUMMARY[ext] ?=3D ".cve.txt"
=20
-python do_sbom_cve_check() {
-    """
-    Task: Run sbom-cve-check analysis on SBOM.
-    """
+
+def run_sbom_cve_check(d, sbom_path, export_base_name, export_link_name=3D=
None):
     import os
     import bb
     from oe.cve_check import update_symlinks
=20
     if not bb.data.inherits_class("create-spdx-3.0", d):
-        bb.fatal("Cannot execute sbom-cve-check missing create-spdx-3.0 =
inherit.")
+        bb.fatal("Cannot execute sbom-cve-check: missing create-spdx-3.0=
 inherit.")
=20
-    sbom_path =3D d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.spdx.=
json")
     dl_db_dir =3D d.getVar("SBOM_CVE_CHECK_DEPLOY_DB_DIR")
-    deploy_dir =3D d.getVar("SBOM_CVE_CHECK_DEPLOYDIR")
-    img_link_name =3D d.getVar("IMAGE_LINK_NAME")
-    img_name =3D d.getVar("IMAGE_NAME")
+    out_deploy_dir =3D d.getVar("SBOM_CVE_CHECK_DEPLOYDIR")
=20
     export_files =3D []
     for export_var in d.getVar("SBOM_CVE_CHECK_EXPORT_VARS").split():
         export_ext =3D d.getVarFlag(export_var, "ext")
-        export_path =3D f"{deploy_dir}/{img_name}{export_ext}"
-        export_link =3D f"{deploy_dir}/{img_link_name}{export_ext}"
+        export_path =3D f"{out_deploy_dir}/{export_base_name}{export_ext=
}"
+        export_link =3D f"{out_deploy_dir}/{export_link_name}{export_ext=
}" if export_link_name else None
         export_type =3D d.getVarFlag(export_var, "type")
         export_files.append((export_type, export_path, export_link))
=20
@@ -96,6 +91,16 @@ python do_sbom_cve_check() {
         bb.note(f"sbom-cve-check exported: {export_file}")
         if export_link:
             update_symlinks(export_file, export_link)
+
+
+python do_sbom_cve_check() {
+    """
+    Task: Run sbom-cve-check analysis on SBOM.
+    """
+    sbom_path =3D d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.spdx.=
json")
+    image_name =3D d.getVar("IMAGE_NAME")
+    link_name =3D d.getVar("IMAGE_LINK_NAME")
+    run_sbom_cve_check(d, sbom_path, image_name, link_name)
 }
=20
 addtask do_sbom_cve_check after do_create_image_sbom_spdx before do_buil=
d
--=20
2.43.0


