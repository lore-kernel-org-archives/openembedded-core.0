Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9EF4F483C8
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 16:12:47 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21526.1774282357659753159
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 09:12:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Am+Bc3a0;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2C1291A2FA5;
	Mon, 23 Mar 2026 16:12:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C787D5FEF6;
	Mon, 23 Mar 2026 16:12:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 04CB810451095;
	Mon, 23 Mar 2026 17:12:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774282354; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fiq0TslCDP6qVywVk3XDqatUkK/lVx/xZcTpWow40X4=;
	b=Am+Bc3a0bGjnus6Q1u6UfA+Fy304LFXGsrP+D5mrAdJuinmssPFOC8/qySYX7nzKJ+8wIz
	wpnz4lETnaRkwH8LvsnCXq+DZPlFbphD1LXpYKQ7sHyNPCR4sCb9FAPSWUobrEE378LY8w
	wuaGgh79awr1wgDnc2WuL64+GM9O8JBue3Ld1hrZZWhYAXmIJg9tOjxbJE9RuQ9o9jlK5f
	Ry8lWe3kSbxr74KkuyZjNlstagp6a4MGe8eSlyvtqSbk/+KRGIlrnOByFReNuX5AFQTV4w
	QN9Fhv/TYBXNpYQLK3CbnFli5CxdFYmN+fZTdGS4/t+Nwa+zeOENHUCwQyR9FQ==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Mon, 23 Mar 2026 17:12:22 +0100
Subject: [PATCH v7 2/2] sbom-cve-check: allows to use network and internal
 fetcher
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-add-sbom-cve-check-v7-2-870eb8e145ad@bootlin.com>
References: <20260323-add-sbom-cve-check-v7-0-870eb8e145ad@bootlin.com>
In-Reply-To: <20260323-add-sbom-cve-check-v7-0-870eb8e145ad@bootlin.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 16:12:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233748

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
index 536bbe17c020..c51ea4575985 100644
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
-    sbom-cve-check-update-cvelist-native:do_install \
-    sbom-cve-check-update-nvd-native:do_install \
+    ${@oe.utils.conditional('SBOM_CVE_CHECK_INTERNAL_FETCHER','0',' \
+        sbom-cve-check-update-cvelist-native:do_install \
+        sbom-cve-check-update-nvd-native:do_install \
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


