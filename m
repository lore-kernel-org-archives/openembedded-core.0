Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 744261076386
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 16:54:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18238.1775062494165100836
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 09:54:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=tOHVkqTy;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B440C2308
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Apr 2026 09:54:47 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 338E03F7D8
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Apr 2026 09:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775062493; bh=coa4jEosFmC83koi0OKl0eaIVK+aZd4WqXZHdsJ0sZc=;
	h=From:To:Subject:Date:From;
	b=tOHVkqTycRvZCoosj1Ibo4pFoM3rR7s+PiEbFTu5Gj7uFc16nEUn8ytavLpM+aF4P
	 Fy6bLBN57s5BZRH5XZdVAe231vzlcNCHcqGMPz1jsx2b7Mr6Hik1wKUNY+HV/TETAr
	 AM3GywQa2q81Y525aWfsfzW4uHRf59v9FVUf9grw=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] classes/sbom-cve-check: use named variables when iterating
Date: Wed,  1 Apr 2026 17:54:46 +0100
Message-ID: <20260401165447.2852846-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 16:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234447

Little cleanups: unpack when iterating to avoid needing to use indexes,
and only update symlinks if update_link is not None.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/sbom-cve-check.bbclass | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/sbom-cve-check.bbclass b/meta/classes-re=
cipe/sbom-cve-check.bbclass
index 2e79dee5716..4244ee657a8 100644
--- a/meta/classes-recipe/sbom-cve-check.bbclass
+++ b/meta/classes-recipe/sbom-cve-check.bbclass
@@ -71,9 +71,9 @@ python do_sbom_cve_check() {
         "--disable-auto-updates"
     ]
=20
-    for export_file in export_files:
+    for export_type, export_file, export_link in export_files:
         cmd_args.extend(
-            ["--export-type", export_file[0], "--export-path", export_fi=
le[1]]
+            ["--export-type", export_type, "--export-path", export_file]
         )
=20
     cmd_args.extend(d.getVar("SBOM_CVE_CHECK_EXTRA_ARGS").split())
@@ -85,9 +85,10 @@ python do_sbom_cve_check() {
         bb.error(f"sbom-cve-check failed: {e}")
         return
=20
-    for export_file in export_files:
-        bb.note(f"sbom-cve-check exported: {export_file[1]}")
-        update_symlinks(export_file[1], export_file[2])
+    for export_type, export_file, export_link in export_files:
+        bb.note(f"sbom-cve-check exported: {export_file}")
+        if export_link:
+            update_symlinks(export_file, export_link)
 }
=20
 addtask do_sbom_cve_check after do_create_image_sbom_spdx before do_buil=
d
--=20
2.43.0


