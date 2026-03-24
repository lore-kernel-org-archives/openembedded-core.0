Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA11BE9A762
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 10:28:55 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16737.1774348135083024515
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 03:28:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ibvliUA6;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8ECAAC58098;
	Tue, 24 Mar 2026 10:29:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 57FD06011D;
	Tue, 24 Mar 2026 10:28:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B1A89104511DF;
	Tue, 24 Mar 2026 11:28:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774348132; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JPSuBkFZ16hR/7VneGzqtbehfW1Q3WEsl2UxMW/BKpY=;
	b=ibvliUA6xf1MDU4dllXlbNzd1VLcw/99WRojrrcHMGojKspUw1CPxqp43Y91edAWS+CTvZ
	VQotwvEqAQhskTF8ZDMaWbpzbHBYND/+zOWJLbMFMO0Umv+ib2Ga3dGxsXkhpBLJEgQiSO
	2PZMVStIksDomGsozYR1kzVtQh+gl74NJHJGkpWGNxhI6T3LDBgDVnyXFVxoSPYxgcRu9S
	8mzdZ3bLLJ9VKY4+Gpgp9MNZvYNILwnWNW/LzrHoJ0Au5+2gl2rZCA2fPn7EOxYVkOH9ZG
	2OoBc5UZjFOA7AI8EB/cehGD21DJDYAtHPPYQkaRujZaSFvvajGZvjfhDp9GtA==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Tue, 24 Mar 2026 11:28:37 +0100
Subject: [PATCH v8 2/2] sbom-cve-check: allows to use network and internal
 fetcher
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-add-sbom-cve-check-v8-2-6c2e84e637ad@bootlin.com>
References: <20260324-add-sbom-cve-check-v8-0-6c2e84e637ad@bootlin.com>
In-Reply-To: <20260324-add-sbom-cve-check-v8-0-6c2e84e637ad@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, rybczynska@gmail.com, 
 ross.burton@arm.com, peter.marko@siemens.com, jpewhacker@gmail.com, 
 olivier.benjamin@bootlin.com, antonin.godard@bootlin.com, 
 mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com, 
 Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15-dev
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 10:28:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233785

For advanced usage of sbom-cve-check, allow users to leverage the
internal fetcher (e.g., for downloading annotation databases).

Introduce the SBOM_CVE_CHECK_INTERNAL_FETCHER configuration variable
to control this behavior. When set to 1, the do_sbom_cve_check task
is granted network access and the task is always run (nostamp = 1).

Additionally, allow overriding the default download location for
databases fetched by the internal fetcher by introducing the
SBOM_CVE_CHECK_DATABASES_DIR Yocto variable.

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 meta/classes-recipe/sbom-cve-check.bbclass         | 26 ++++++++++++++++------
 .../sbom-cve-check/sbom-cve-check-config.inc       | 15 +++++++++++++
 2 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/meta/classes-recipe/sbom-cve-check.bbclass b/meta/classes-recipe/sbom-cve-check.bbclass
index 3a23888ed6b4..a5c23142b7df 100644
--- a/meta/classes-recipe/sbom-cve-check.bbclass
+++ b/meta/classes-recipe/sbom-cve-check.bbclass
@@ -49,7 +49,6 @@ python do_sbom_cve_check() {
 
     sbom_path = d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.spdx.json")
     vex_manifest_path = d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.json")
-    dl_db_dir = d.getVar("SBOM_CVE_CHECK_DEPLOY_DB_DIR")
     deploy_dir = d.getVar("SBOM_CVE_CHECK_DEPLOYDIR")
     img_link_name = d.getVar("IMAGE_LINK_NAME")
     img_name = d.getVar("IMAGE_NAME")
@@ -62,16 +61,21 @@ python do_sbom_cve_check() {
         export_type = d.getVarFlag(export_var, "type")
         export_files.append((export_type, export_path, export_link))
 
-    cmd_env = os.environ.copy()
-    cmd_env["SBOM_CVE_CHECK_DATABASES_DIR"] = dl_db_dir
-
     cmd_args = [
         d.expand("${STAGING_BINDIR_NATIVE}/sbom-cve-check"),
         "--sbom-path",
         sbom_path,
-        "--disable-auto-updates"
     ]
 
+    cmd_env = os.environ.copy()
+    if int(d.getVar("SBOM_CVE_CHECK_INTERNAL_FETCHER")):
+        db_dir = d.getVar("SBOM_CVE_CHECK_DATABASES_DIR")
+        if db_dir:
+            cmd_env["SBOM_CVE_CHECK_DATABASES_DIR"] = db_dir
+    else:
+        cmd_args.append("--disable-auto-updates")
+        cmd_env["SBOM_CVE_CHECK_DATABASES_DIR"] = d.getVar("SBOM_CVE_CHECK_DEPLOY_DB_DIR")
+
     # Assume that SPDX_INCLUDE_VEX is set globally to "all", and not only for the
     # image recipe, which is very unlikely. This is not an issue to include the
     # VEX manifest even if not needed.
@@ -97,6 +101,12 @@ python do_sbom_cve_check() {
         update_symlinks(export_file[1], export_file[2])
 }
 
+python() {
+    if int(d.getVar("SBOM_CVE_CHECK_INTERNAL_FETCHER")):
+        d.setVarFlag("do_sbom_cve_check", "network", "1")
+        d.setVarFlag("do_sbom_cve_check", "nostamp", "1")
+}
+
 addtask do_sbom_cve_check after do_create_image_sbom_spdx before do_build
 
 SSTATETASKS += "do_sbom_cve_check"
@@ -105,8 +115,10 @@ do_sbom_cve_check[sstate-inputdirs] = "${SBOM_CVE_CHECK_DEPLOYDIR}"
 do_sbom_cve_check[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
 do_sbom_cve_check[depends] += " \
     python3-sbom-cve-check-native:do_populate_sysroot \
-    sbom-cve-check-update-cvelist-native:do_unpack \
-    sbom-cve-check-update-nvd-native:do_unpack \
+    ${@oe.utils.conditional('SBOM_CVE_CHECK_INTERNAL_FETCHER','0',' \
+        sbom-cve-check-update-cvelist-native:do_unpack \
+        sbom-cve-check-update-nvd-native:do_unpack \
+    ','',d)} \
 "
 
 python do_sbom_cve_check_setscene() {
diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-config.inc b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-config.inc
index d337cef2355c..dd8fb5db11a1 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-config.inc
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-config.inc
@@ -3,3 +3,18 @@
 SBOM_CVE_CHECK_DEPLOY_DB_DIR ??= "${DEPLOY_DIR}/sbom-cve-check/databases"
 SBOM_CVE_CHECK_DEPLOY_DB_DIR[doc] = "Path to the directory where the CVE databases, \
     fetched by the sbom-cve-check-update-* recipes, are extracted for use."
+
+SBOM_CVE_CHECK_DATABASES_DIR ??= ""
+SBOM_CVE_CHECK_DATABASES_DIR[doc] = "Allows to configure the directory where the \
+    CVE databases are extracted for use, if fetched by sbom-cve-check itself. \
+    This variable is only used if SBOM_CVE_CHECK_INTERNAL_FETCHER is set to 1. \
+"
+
+SBOM_CVE_CHECK_INTERNAL_FETCHER ?= "0"
+SBOM_CVE_CHECK_INTERNAL_FETCHER[doc] = "Set to 1 to use sbom-cve-check internal fetcher. \
+    In this case sbom-cve-check task will have access to network, and the downloaded \
+    databases are stored in the default location or in the directory specified by \
+    SBOM_CVE_CHECK_DATABASES_DIR if not empty. \
+    This is useful, if a user needs network access during execution (e.g., to download \
+    annotation databases), they can set `SBOM_CVE_CHECK_ALLOW_NETWORK` to "1". \
+"

-- 
2.53.0


