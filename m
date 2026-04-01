Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86AD510F6FD9
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 16:28:04 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17437.1775060880096107760
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 09:28:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qItU4N1I;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id ECF2A4E42897
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Apr 2026 16:27:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD6E1602BF;
	Wed,  1 Apr 2026 16:27:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BA0CC1045021C;
	Wed,  1 Apr 2026 18:27:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775060876; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=i/4Uug2XX6KnoW1jIbDv+t5ZIwlskI67sKkR15ur62Y=;
	b=qItU4N1IODMYtTZQ6hfEqmVuPuCuQ7DGcBYvoWRe6L4fCGzqxRr1GtUyhxg+tvgy/KgpBK
	SvAVI2pISOLmpxeJqY1Smy2eMpiaw6AsabatgirjXnUvS5Vzu4yJrCY1+hRx61qvmW5zbQ
	tgnFUgktbOHatEIfhVQRzeKifTR03bZe5CtRJXI3/cozvTxDwhoeJiKa6tyazRxm1dJ6fd
	6XjU2CAWdqCk0KG5vc0hsfAsq9ad3XxuTvnsynqXVPJfVAlSjTODlJRQXcWrzkA9TQrXpq
	LyDbkbQ3wn9n15jOpBmiCjJjioekhJ6rhMf6YRJGbsYUaNylsORxA+L80KZKdQ==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Wed, 01 Apr 2026 18:27:51 +0200
Subject: [PATCH] sbom-cve-check-update-db: Fix do_populate_lic failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-fix-lic-sbom-cve-check-v1-1-29f854d1837f@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDMBCF4VeRWXcgSgikryJdmMmoY72UjEpBf
 PfGuvzgnP8A5SSs8CwOSLyLyjJnlI8CqG/mjlFiNlSmcsaaElv54iiEGpYJaWeknumNzkdnm+i
 tDxby+ZM4L//h+nVbtzAwrVcNzvMHZSdiC3oAAAA=
X-Change-ID: 20260401-fix-lic-sbom-cve-check-69d64ad949b4
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, rybczynska@gmail.com, 
 ross.burton@arm.com, peter.marko@siemens.com, jpewhacker@gmail.com, 
 olivier.benjamin@bootlin.com, antonin.godard@bootlin.com, 
 mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com, 
 Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.1
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 16:28:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234446

The `do_populate_lic` task was failing because it runs after `do_patch`,
but the indirect dependency on `do_unpack` was lost when the `do_patch`
task was deleted.

It is safe, and even preferable, to retain the `do_patch` task, as this
allows users to apply patches to their CVE databases.

Follow-up to commit 8ef22ad9e302f86b2da4fa81541a464e95b9ef3c
("sbom-cve-check: Add class for post-build CVE analysis").

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 meta/classes-recipe/sbom-cve-check.bbclass                        | 4 ++--
 meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/sbom-cve-check.bbclass b/meta/classes-recipe/sbom-cve-check.bbclass
index a5dc262c6aab..741dded57210 100644
--- a/meta/classes-recipe/sbom-cve-check.bbclass
+++ b/meta/classes-recipe/sbom-cve-check.bbclass
@@ -105,8 +105,8 @@ do_sbom_cve_check[sstate-inputdirs] = "${SBOM_CVE_CHECK_DEPLOYDIR}"
 do_sbom_cve_check[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
 do_sbom_cve_check[depends] += " \
     python3-sbom-cve-check-native:do_populate_sysroot \
-    sbom-cve-check-update-cvelist-native:do_unpack \
-    sbom-cve-check-update-nvd-native:do_unpack \
+    sbom-cve-check-update-cvelist-native:do_patch \
+    sbom-cve-check-update-nvd-native:do_patch \
 "
 
 python do_sbom_cve_check_setscene() {
diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
index 4e9cef96e8ea..a318e2c40ea9 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
@@ -9,7 +9,6 @@ require sbom-cve-check-config.inc
 SBOM_CVE_CHECK_DB_NAME[doc] = "Database name, which is the Git repository directory name. \
     The git repository will be stored in ${SBOM_CVE_CHECK_DEPLOY_DB_DIR)/"
 
-deltask do_patch
 deltask do_configure
 deltask do_compile
 deltask do_install

---
base-commit: c56990178b31b893fbf695eaf6b67de501e9d2e9
change-id: 20260401-fix-lic-sbom-cve-check-69d64ad949b4

Best regards,
--  
Benjamin Robin <benjamin.robin@bootlin.com>


