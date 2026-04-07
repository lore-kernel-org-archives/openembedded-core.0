Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B967105D988
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 21:03:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92011.1775595786318526239
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 14:03:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=SFeF8LaU;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2714C353C
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Apr 2026 14:03:00 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8CFF73F7D8
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Apr 2026 14:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775595785; bh=tm6rYgLTnTClL5VG48x4S6WJNMZx3ryuiezooRnN34c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SFeF8LaUwwxQsjBU2o22EW/f703RTjBdha9ZHGEeRui+R2XlPA31TYDW/pUzckIyg
	 NhhOVqM3lLsQ4iMuUS6gVS3O7tXT4jYRcDlt9lbg8BH5tGeWk1CMLlXpCfMFPTLKET
	 +bD5fwC+a1x26EYpZLfcIRcYTTIUV77mOUUDY0wI=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 5/7] classes/sbom-cve-check: extract the database dependencies to a variable
Date: Tue,  7 Apr 2026 22:02:24 +0100
Message-ID: <20260407210226.2375631-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260407210226.2375631-1-ross.burton@arm.com>
References: <20260407210226.2375631-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 21:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234784

This tidies up the dependencies, allowing for future tasks that will
need the same dependencies.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/sbom-cve-check.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/sbom-cve-check.bbclass b/meta/classes-re=
cipe/sbom-cve-check.bbclass
index a24d34b896..c861a7965f 100644
--- a/meta/classes-recipe/sbom-cve-check.bbclass
+++ b/meta/classes-recipe/sbom-cve-check.bbclass
@@ -43,6 +43,10 @@ SBOM_CVE_CHECK_EXPORT_SUMMARY[doc] =3D "Export configu=
ration to generate a human-r
 SBOM_CVE_CHECK_EXPORT_SUMMARY[type] ?=3D "summary"
 SBOM_CVE_CHECK_EXPORT_SUMMARY[ext] ?=3D ".cve.txt"
=20
+SBOM_CVE_CHECK_UPDATE_DB_DEPENDENCIES ?=3D " \
+    sbom-cve-check-update-cvelist-native:do_patch \
+    sbom-cve-check-update-nvd-native:do_patch \
+"
=20
 def run_sbom_cve_check(d, sbom_path, export_base_name, export_link_name=3D=
None):
     import os
@@ -111,8 +115,7 @@ do_sbom_cve_check[sstate-inputdirs] =3D "${SBOM_CVE_C=
HECK_DEPLOYDIR}"
 do_sbom_cve_check[sstate-outputdirs] =3D "${DEPLOY_DIR_IMAGE}"
 do_sbom_cve_check[depends] +=3D " \
     python3-sbom-cve-check-native:do_populate_sysroot \
-    sbom-cve-check-update-cvelist-native:do_patch \
-    sbom-cve-check-update-nvd-native:do_patch \
+    ${SBOM_CVE_CHECK_UPDATE_DB_DEPENDENCIES} \
 "
=20
 python do_sbom_cve_check_setscene() {
--=20
2.43.0


