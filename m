Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75AC1FEEF28
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 21:03:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92013.1775595787740693766
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 14:03:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=aXGLBnMx;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F13E353C
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Apr 2026 14:03:01 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B02063F7D8
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Apr 2026 14:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775595787; bh=owRpomKFSAsLmLIxrd+KeXJf7LfW0ZMsCQ7PRgkrtGI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=aXGLBnMxsaRjOdwYKFPoI4lS3KzrWSBDqD7bmOgBwl4kdziVvaYAZEssYfeXoUpl5
	 CgbtxJWySB3ecBF9+G7CTemA3W5JMbkr4dzwFlDSjNtVK5d+q8JmlEN9tlOSWnDtys
	 ayWwymBeWr+oXhW1v8pPaWvuSgcZcYxVryY8kSPM=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 7/7] classes/sbom-cve-check-recipe: add recipe-scanning class
Date: Tue,  7 Apr 2026 22:02:26 +0100
Message-ID: <20260407210226.2375631-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260407210226.2375631-1-ross.burton@arm.com>
References: <20260407210226.2375631-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 21:03:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234786

Add a second sbom-cve-check class that scans the recipe-SBOM, unlike
sbom-cve-check.bbclass which scans specifically an image's SBOM.

In most cases, image-derived SBOM scanning is preferred as this is able
to analyse the actual content of the image, e.g. reporting just the
kernel issues that have actually been compiled into the image (for
linux-yocto 6.18.19, this reduces the CVE count from 108 to 52).

However, for metrics or other specific purposes it might be useful to
scan a recipe-SPDX, so add a class that can do this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/sbom-cve-check-recipe.bbclass | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta/classes/sbom-cve-check-recipe.bbclass

diff --git a/meta/classes/sbom-cve-check-recipe.bbclass b/meta/classes/sb=
om-cve-check-recipe.bbclass
new file mode 100644
index 0000000000..904ce57f5c
--- /dev/null
+++ b/meta/classes/sbom-cve-check-recipe.bbclass
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: MIT
+
+# Perform CVE analysis on recipe SBOMs using sbom-cve-check.
+#
+# This will analyse the entire SBOM for the recipe, so the recipe itself=
 and
+# all of the dependencies. It is expected that for most purposes
+# sbom-cve-check.bbclass is preferred as that will analyse what is deplo=
yed
+# in an image.
+
+inherit sbom-cve-check-common
+
+python do_sbom_cve_check_recipe() {
+    """
+    Task: Run sbom-cve-check analysis on a recipe SBOM.
+    """
+    sbom_path =3D d.expand("${DEPLOY_DIR_IMAGE}/${SPDX_RECIPE_SBOM_NAME}=
.spdx.json")
+    recipe =3D d.getVar("SPDX_RECIPE_SBOM_NAME")
+    run_sbom_cve_check(d, sbom_path, recipe)
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
+    ${SBOM_CVE_CHECK_UPDATE_DB_DEPENDENCIES} \
+"
+
+python do_sbom_cve_check_recipe_setscene() {
+    sstate_setscene(d)
+}
+addtask do_sbom_cve_check_recipe_setscene
--=20
2.43.0


