Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF80FEEF56
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 15:01:31 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.83543.1775574081490728134
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 08:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=VFPe8KZI;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F11964E42947
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Apr 2026 15:01:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C6EFC603C7;
	Tue,  7 Apr 2026 15:01:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 93A5F1045022E;
	Tue,  7 Apr 2026 17:01:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775574075; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=U3rW18y7CJjfa1c/0vJQ7UsCj1OzHnZJxJ/7fO5nk0A=;
	b=VFPe8KZImsWpIBsEe2nSWvPRlwRWFIPBbhoNYK4l9E1u4VRYM1AdIEs47ecjgkOi4+6AbX
	KXzAiLH1letBhmCu+K/5xJ1ElVDvB3BcF3gKAaOEfQesk71USOtbXXZKCwyVJ3SbYLbUxX
	eUshAYMzXcnxvqO930frdor8CFJdnP3SwYqDGXSf9aDfFGtsXA5AH320p0JB4+OX7nafGV
	ApQoy3Ihh+ICMxH9a4Bd8afiZ1J7pbpA1jojL21pkSTY9JQhbL9e+Hs3PLmzrqvoU8lfeD
	pO/piQs6Ga1K8LQ+CTpSHnq3v6eeJSo+fTq4HUetDbljJZex39Sp1BqMtY3bPA==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Tue, 07 Apr 2026 17:01:07 +0200
Subject: [PATCH v2 1/2] sbom-cve-check-update-db: Fix do_populate_lic
 failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-fix-lic-sbom-cve-check-v2-1-f69da412fd67@bootlin.com>
References: <20260407-fix-lic-sbom-cve-check-v2-0-f69da412fd67@bootlin.com>
In-Reply-To: <20260407-fix-lic-sbom-cve-check-v2-0-f69da412fd67@bootlin.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 15:01:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234745

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
index 6c62a5119dea..4abc427c58f2 100644
--- a/meta/classes-recipe/sbom-cve-check.bbclass
+++ b/meta/classes-recipe/sbom-cve-check.bbclass
@@ -106,8 +106,8 @@ do_sbom_cve_check[sstate-inputdirs] = "${SBOM_CVE_CHECK_DEPLOYDIR}"
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

-- 
2.53.0


