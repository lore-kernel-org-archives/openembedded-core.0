Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60926D6AAF0
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 16:25:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.411.1775147120588388121
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 09:25:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=s+5shWpk;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34B6F34A9;
	Thu,  2 Apr 2026 09:25:14 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9DD763F915;
	Thu,  2 Apr 2026 09:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775147120; bh=dz7DAKzC0Elcpim4m68Xs/MMdCZKboQRcwX1dElF6VI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s+5shWpktXUZK4dAY+WJ3xEiSXJmqXiYyw07oOVamqc6w2FBlgnQhbwx/ALKI9DBp
	 HTLv1uQXzSWgQNkuzZInVlCx+dS5B5gU++bECIsA5PV5pVykIGR/S05LxLL5gf1q2i
	 Cm/1vOLkia3pM/Hl/3ycqjjzP5mI68xmBv6h/eCI=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: benjamin.robin@bootlin.com
Subject: [RFC PATCH 3/3] sbom-cve-check: add prototype recipe scanning task
Date: Thu,  2 Apr 2026 17:25:10 +0100
Message-ID: <20260402162510.1945892-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260402162510.1945892-1-ross.burton@arm.com>
References: <20260402162510.1945892-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 16:25:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234548

Add a new task, sbom_cve_check_recipe, that will do a CVE scan of the
SPDX for the specified recipe.

This is mainly useful for top-level or aggregration packages (e.g.
meta-world-recipe-sbom) as it follows dependencies, so running it on a
single package (e.g. curl) will also show CVEs for its dependencies
(e.g. zlib).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/sbom-cve-check.bbclass | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/meta/classes/sbom-cve-check.bbclass b/meta/classes/sbom-cve-=
check.bbclass
index fef6f0c2aa..fc89ab9799 100644
--- a/meta/classes/sbom-cve-check.bbclass
+++ b/meta/classes/sbom-cve-check.bbclass
@@ -94,6 +94,9 @@ def run_sbom_cve_check(d, recipe_name, link_name=3DNone=
):
             update_symlinks(export_file, export_link)
=20
=20
+#
+# Scan the SBOM of an image.
+#
 python do_sbom_cve_check() {
     """
     Task: Run sbom-cve-check analysis on SBOM.
@@ -119,3 +122,29 @@ python do_sbom_cve_check_setscene() {
     sstate_setscene(d)
 }
 addtask do_sbom_cve_check_setscene
+
+
+#
+# Scan the SBOM of a recipe.
+#
+
+python do_sbom_cve_check_recipe() {
+    recipe =3D d.getVar("SPDX_RECIPE_SBOM_NAME")
+    run_sbom_cve_check(d, recipe)
+}
+
+addtask do_sbom_cve_check_recipe after do_create_recipe_sbom
+
+SSTATETASKS +=3D "do_sbom_cve_check_recipe"
+do_sbom_cve_check_recipe[cleandirs] =3D "${SBOM_CVE_CHECK_DEPLOYDIR}"
+do_sbom_cve_check_recipe[sstate-inputdirs] =3D "${SBOM_CVE_CHECK_DEPLOYD=
IR}"
+do_sbom_cve_check_recipe[sstate-outputdirs] =3D "${DEPLOY_DIR_IMAGE}"
+do_sbom_cve_check_recipe[depends] +=3D " \
+    python3-sbom-cve-check-native:do_populate_sysroot \
+    sbom-cve-check-update-cvelist-native:do_unpack \
+    sbom-cve-check-update-nvd-native:do_unpack \
+"
+python do_sbom_cve_check_recipe_setscene() {
+    sstate_setscene(d)
+}
+addtask do_sbom_cve_check_recipe_setscene
--=20
2.47.1


