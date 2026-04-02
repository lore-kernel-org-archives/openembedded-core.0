Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E96D6AAEE
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 16:25:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.413.1775147119321507069
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 09:25:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=sF//9SQd;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBF8A3328;
	Thu,  2 Apr 2026 09:25:12 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3E34C3F915;
	Thu,  2 Apr 2026 09:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775147118; bh=oHCbA38Da0OdGhZ6mTdNAMaFf1hMgyS6RD6GHp4aBHI=;
	h=From:To:Cc:Subject:Date:From;
	b=sF//9SQdKLW22o/IRruQ5QRpgC+r0rMwR4w/QM7RTtCITIv2qAucw7Tbt1gSduYfs
	 QfdY0/Ds1Huejp3m+/FnziBckCQHDAeKxJFaun/C3KZ6QGwjxgw64OqWGGJsH496ow
	 GPv6DyOnVrjayNO8UNiw3I3sZMdyqQkR+CZ3Q7C4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: benjamin.robin@bootlin.com
Subject: [RFC PATCH 1/3] sbom-cve-check: refactor do_sbom_cve_check
Date: Thu,  2 Apr 2026 17:25:08 +0100
Message-ID: <20260402162510.1945892-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 16:25:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234546

Extract the bulk of the logic to a separate function, so the task just
has to pass a few variables.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/sbom-cve-check.bbclass | 29 +++++++++++++---------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/meta/classes-recipe/sbom-cve-check.bbclass b/meta/classes-re=
cipe/sbom-cve-check.bbclass
index 4abc427c58..fef6f0c2aa 100644
--- a/meta/classes-recipe/sbom-cve-check.bbclass
+++ b/meta/classes-recipe/sbom-cve-check.bbclass
@@ -43,28 +43,24 @@ SBOM_CVE_CHECK_EXPORT_SUMMARY[doc] =3D "Export config=
uration to generate a human-r
 SBOM_CVE_CHECK_EXPORT_SUMMARY[type] ?=3D "summary"
 SBOM_CVE_CHECK_EXPORT_SUMMARY[ext] ?=3D ".cve.txt"
=20
-python do_sbom_cve_check() {
-    """
-    Task: Run sbom-cve-check analysis on SBOM.
-    """
+
+def run_sbom_cve_check(d, recipe_name, link_name=3DNone):
     import os
     import bb
-    from oe.cve_check import update_symlinks
=20
     if not bb.data.inherits_class("create-spdx-3.0", d):
-        bb.fatal("Cannot execute sbom-cve-check missing create-spdx-3.0 =
inherit.")
+        bb.fatal("Cannot execute sbom-cve-check: missing create-spdx-3.0=
 inherit.")
=20
-    sbom_path =3D d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.spdx.=
json")
+    image_deploy_dir =3D d.getVar("DEPLOY_DIR_IMAGE")
+    sbom_path =3D d.expand(f"{image_deploy_dir}/{recipe_name}.spdx.json"=
)
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
+        export_path =3D f"{out_deploy_dir}/{recipe_name}{export_ext}"
+        export_link =3D f"{out_deploy_dir}/{link_name}{export_ext}" if l=
ink_name else None
         export_type =3D d.getVarFlag(export_var, "type")
         export_files.append((export_type, export_path, export_link))
=20
@@ -96,6 +92,15 @@ python do_sbom_cve_check() {
         bb.note(f"sbom-cve-check exported: {export_file}")
         if export_link:
             update_symlinks(export_file, export_link)
+
+
+python do_sbom_cve_check() {
+    """
+    Task: Run sbom-cve-check analysis on SBOM.
+    """
+    image_name =3D d.getVar("IMAGE_NAME")
+    link_name =3D d.getVar("IMAGE_LINK_NAME")
+    run_sbom_cve_check(d, image_name, link_name, sbom_path)
 }
=20
 addtask do_sbom_cve_check after do_create_image_sbom_spdx before do_buil=
d
--=20
2.47.1


