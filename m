Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5820FEA854D
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 11:57:35 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12497.1773057446395853010
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 04:57:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=HenOfZZD;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id ABF64C42878;
	Mon,  9 Mar 2026 11:57:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5B0E35FFB8;
	Mon,  9 Mar 2026 11:57:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 56DDF10369B9E;
	Mon,  9 Mar 2026 12:57:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773057443; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SQlxseyaGbHFdvs8o9DVV5NAZ3NUuwDy4xtxwQ+FTjA=;
	b=HenOfZZDC7rOoRTSOa+L0jMPgcxAwWK4ymPtnlYAKtSkRl/7R3UI3CtTk3wWls7CBLyBR5
	v2KLl0/WBaUSGkOvMC4VhqjPut7BM398DN6W2TjSRsPZTIcDAMMEudlr79HUOJEPbTSj40
	EGyG8lh0cjMn1ZjWaqhZYrfcYYMCdA6vA6S7U1jJx1pCAEhCUX8A+IwOyCat5G/NKFdZSA
	47gXchi/UyDu7Pdq88SaFEVfct0AK5zOIFtEnCfqg2yuPR4JMgSJLw/bXO2na9VhzYihnB
	9LTS7OgvzVbJnSCMB4spOrC9nF/pMPsUSasMZXBkTZIqGpw0RhgIvjzciXz66g==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Mon, 09 Mar 2026 12:57:11 +0100
Subject: [PATCH RFC 2/2] sbom-cve-check: VEX class is no longer mandatory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-add-sbom-cve-check-p2b-v1-2-09165cddfcf1@bootlin.com>
References: <20260309-add-sbom-cve-check-p2b-v1-0-09165cddfcf1@bootlin.com>
In-Reply-To: <20260309-add-sbom-cve-check-p2b-v1-0-09165cddfcf1@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, peter.marko@siemens.com, jpewhacker@gmail.com, 
 olivier.benjamin@bootlin.com, antonin.godard@bootlin.com, 
 mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com, 
 Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 11:57:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232701

Execute `sbom-cve-check` with the generated VEX manifest only if
enabled and if `SPDX_INCLUDE_VEX` is set to a value other than "all".
When `SPDX_INCLUDE_VEX=all`, the SPDX 3.0 file already contains all
the necessary information for CVE analysis, making the VEX manifest
redundant.

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 meta/classes-recipe/sbom-cve-check.bbclass | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/sbom-cve-check.bbclass b/meta/classes-recipe/sbom-cve-check.bbclass
index 2ab29001008a..3709fa98d97e 100644
--- a/meta/classes-recipe/sbom-cve-check.bbclass
+++ b/meta/classes-recipe/sbom-cve-check.bbclass
@@ -41,8 +41,6 @@ python do_sbom_cve_check() {
     import bb
     from oe.cve_check import update_symlinks
 
-    if not bb.data.inherits_class("vex", d):
-        bb.fatal("Cannot execute sbom-cve-check missing vex inherit.")
     if not bb.data.inherits_class("create-spdx-3.0", d):
         bb.fatal("Cannot execute sbom-cve-check missing create-spdx-3.0 inherit.")
 
@@ -68,10 +66,14 @@ python do_sbom_cve_check() {
         d.expand("${STAGING_BINDIR_NATIVE}/sbom-cve-check"),
         "--sbom-path",
         sbom_path,
-        "--yocto-vex-manifest",
-        vex_manifest_path,
     ]
 
+    # Assume that SPDX_INCLUDE_VEX is set globally to "all", and not only for the
+    # image recipe, which is very unlikely. This is not an issue to include the
+    # VEX manifest even if not needed.
+    if bb.data.inherits_class("vex", d) and d.getVar("SPDX_INCLUDE_VEX") != "all":
+        cmd_args.extend(["--yocto-vex-manifest", vex_manifest_path])
+
     for export_file in export_files:
         cmd_args.extend(
             ["--export-type", export_file[0], "--export-path", export_file[1]]

-- 
2.53.0


