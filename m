Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 993A0EA3C4E
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 16:26:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.136576.1775751988830639898
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 09:26:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Hj6HYmbv;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A94E61C25
	for <openembedded-core@lists.openembedded.org>; Thu,  9 Apr 2026 09:26:22 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0E9A83F641
	for <openembedded-core@lists.openembedded.org>; Thu,  9 Apr 2026 09:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775751988; bh=OlEmW7jzJals1XFIEB1Tg4p9uiLV8ZucmBoHsZSE8cA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Hj6HYmbv76athivj9CicbRDHJvXrv1ropHpKYaBO/8EMUQrCX13dLd6bC36hwehJo
	 gQ4ANtQa8J+EOmPxlKR0uWdURY9mrOff0jeoeaZXIWaErbFM9H9WG87Cu8X8Qa82AU
	 tqNd9oj9+eyLXN1xXSTdQfq/Alck9g42IPTIwP9M=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] classes/sbom-cve-check: add variable to control the scope of the CVE scan
Date: Thu,  9 Apr 2026 17:26:22 +0100
Message-ID: <20260409162622.3307731-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409162622.3307731-1-ross.burton@arm.com>
References: <20260409162622.3307731-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:26:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234936

Unless told otherwise, sbom-cve-check will only report on issues found
in target recipes.  Whilst this is the behaviour we want for image-based
scanning, it's not the designed bevhaviour for recipe-based scanning.

Add a new variable SBOM_CVE_CHECK_SCAN_SCOPE that is used as the value
passed with --export-process-native.  Default this to "target" so the
normal behaviour is unchanged, but set it to "both" in the
sbom-cve-check-recipe class.

[1] https://sbom-cve-check.readthedocs.io/en/latest/export.html#export-op=
tions

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/sbom-cve-check-common.bbclass | 9 ++++++++-
 meta/classes/sbom-cve-check-recipe.bbclass | 3 +++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sbom-cve-check-common.bbclass b/meta/classes/sb=
om-cve-check-common.bbclass
index 3db189d60de..6963ad71c61 100644
--- a/meta/classes/sbom-cve-check-common.bbclass
+++ b/meta/classes/sbom-cve-check-common.bbclass
@@ -6,6 +6,10 @@ require conf/sbom-cve-check-config.inc
=20
 SBOM_CVE_CHECK_DEPLOYDIR =3D "${WORKDIR}/sbom-cve-check/image-deploy"
=20
+SBOM_CVE_CHECK_SCAN_SCOPE ?=3D "target"
+SBOM_CVE_CHECK_SCAN_SCOPE[doc] =3D "Whether to scan target and native, j=
ust target, or just native. \
+    Valid values are both, target, native."
+
 SBOM_CVE_CHECK_EXTRA_ARGS[doc] =3D "Allow to specify extra arguments to =
sbom-cve-check. \
     For example to add export flags for filtering (e.g., only export vul=
nerable CVEs). \
 "
@@ -54,6 +58,7 @@ def run_sbom_cve_check(d, sbom_path, export_base_name, =
export_link_name=3DNone):
=20
     dl_db_dir =3D d.getVar("SBOM_CVE_CHECK_DEPLOY_DB_DIR")
     out_deploy_dir =3D d.getVar("SBOM_CVE_CHECK_DEPLOYDIR")
+    scan_scope =3D d.getVar("SBOM_CVE_CHECK_SCAN_SCOPE")
=20
     export_files =3D []
     for export_var in d.getVar("SBOM_CVE_CHECK_EXPORT_VARS").split():
@@ -70,7 +75,9 @@ def run_sbom_cve_check(d, sbom_path, export_base_name, =
export_link_name=3DNone):
         d.expand("${STAGING_BINDIR_NATIVE}/sbom-cve-check"),
         "--sbom-path",
         sbom_path,
-        "--disable-auto-updates"
+        "--disable-auto-updates",
+        "--export-process-native",
+        scan_scope,
     ]
=20
     for export_type, export_file, export_link in export_files:
diff --git a/meta/classes/sbom-cve-check-recipe.bbclass b/meta/classes/sb=
om-cve-check-recipe.bbclass
index 904ce57f5cc..c80b8ac83ff 100644
--- a/meta/classes/sbom-cve-check-recipe.bbclass
+++ b/meta/classes/sbom-cve-check-recipe.bbclass
@@ -9,6 +9,9 @@
=20
 inherit sbom-cve-check-common
=20
+# Recipe-based scanning should cover both target and native components.
+SBOM_CVE_CHECK_SCAN_SCOPE =3D "both"
+
 python do_sbom_cve_check_recipe() {
     """
     Task: Run sbom-cve-check analysis on a recipe SBOM.
--=20
2.43.0


