Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF470FEEF55
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 21:03:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92009.1775595785215274849
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 14:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=J5g5SJf9;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06536353C
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Apr 2026 14:02:59 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 69DB63F7D8
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Apr 2026 14:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775595784; bh=5znjWh/AnddNerciQiOnFHuxW+kgZi7H8ApkGrIX7oc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=J5g5SJf9QrfFX4SOBfZDR7AyMisG1u8OxNooSofGRQyNVZWuzpmyNn2Q1BfjeqZuY
	 Q2OKivbFPbMVorKM4CAlMO8FYyWuz/yD0Ini8geVWpfJCvQMTeK7mlywvHUbdCFqSL
	 GazD5NxU+5UTfqdCqp38cG+ql/b7mxpHguGl9cLM=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/7] sbom-cve-check-config.inc: move to meta/conf/
Date: Tue,  7 Apr 2026 22:02:22 +0100
Message-ID: <20260407210226.2375631-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260407210226.2375631-1-ross.burton@arm.com>
References: <20260407210226.2375631-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 21:03:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234782

This file is used by classes and recipes, so it's best to put it into
conf/ instead of alongside the recipe.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/sbom-cve-check.bbclass                      | 2 +-
 .../sbom-cve-check =3D> conf}/sbom-cve-check-config.inc           | 0
 .../sbom-cve-check/sbom-cve-check-update-db.inc                 | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/{recipes-devtools/sbom-cve-check =3D> conf}/sbom-cve-check-c=
onfig.inc (100%)

diff --git a/meta/classes-recipe/sbom-cve-check.bbclass b/meta/classes-re=
cipe/sbom-cve-check.bbclass
index 4abc427c58..0534833ebe 100644
--- a/meta/classes-recipe/sbom-cve-check.bbclass
+++ b/meta/classes-recipe/sbom-cve-check.bbclass
@@ -6,7 +6,7 @@
 # Or it is possible to add this line in local.conf:
 # OE_FRAGMENTS +=3D "core/yocto/sbom-cve-check"
=20
-require recipes-devtools/sbom-cve-check/sbom-cve-check-config.inc
+require conf/sbom-cve-check-config.inc
=20
 SBOM_CVE_CHECK_DEPLOYDIR =3D "${WORKDIR}/sbom-cve-check/image-deploy"
=20
diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-config.i=
nc b/meta/conf/sbom-cve-check-config.inc
similarity index 100%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-config.in=
c
rename to meta/conf/sbom-cve-check-config.inc
diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-d=
b.inc b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
index 7ada67363d..fbdc561e8c 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
@@ -4,7 +4,7 @@ INHIBIT_DEFAULT_DEPS =3D "1"
 EXCLUDE_FROM_WORLD =3D "1"
=20
 inherit native
-require sbom-cve-check-config.inc
+require conf/sbom-cve-check-config.inc
=20
 SBOM_CVE_CHECK_DB_NAME[doc] =3D "Database name, which is the Git reposit=
ory directory name. \
     The git repository will be stored in ${SBOM_CVE_CHECK_DEPLOY_DB_DIR)=
/"
--=20
2.43.0


