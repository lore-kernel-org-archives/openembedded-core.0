Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90CFEE36A0
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 09:26:51 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68026.1770974807464857140
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 01:26:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=yeNtyzdV;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 33DB71A0EC0
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 09:26:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 01F31606CC;
	Fri, 13 Feb 2026 09:26:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7FED510368E2C;
	Fri, 13 Feb 2026 10:26:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770974804; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=hYk/Xdmc1XSmsLxMspTmGYozm6bqWweAwqbfs53yTCM=;
	b=yeNtyzdVr2lb0QMYdcKoFNZm7vl+NGLePzDnadvGPR+I8Sih3lDntXNwL7J/NSWKFQo3Vu
	YOm54THnRkfXyCMuHY8HbY54ht/8n73u79uA+mRtnFFUagYsA46ng/MADsLMf9R3fCw6vj
	cAtf8MWzxBF+GQU9D1ziVLMSi0GDf292YK818s95FUdx6QdnIl/8Yp9R/6GhuvjshIXR0w
	AFK6TJYxfhSy+5lOEPin6lN+WEpXN/Wdi/11yA55np5zee8JtXNqMX4l4JyrUDSJqP/7pg
	yrpCMdcZHRr2YWPR05ViqQoFRIp5SRrjf+tYPEU7S3tsLFEuHTLLJYJHB2QmPQ==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Fri, 13 Feb 2026 10:26:34 +0100
Subject: [PATCH] meta: fix generation of kernel CONFIG_ in SPDX3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-fix-kernel-config-spdx-v1-1-4fd66ca5cb5d@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvyJ7bkFXEOwr0SFqraVQUYgg/HvSc
 WBmXqhchCuM6oXCt1RJsYMZFKzHEndG2ToDaXKajMUgD55cIl+4phhkx5q3B70nst46dj5Aj3P
 hbv7jaW7tA4LujP9oAAAA
X-Change-ID: 20260213-fix-kernel-config-spdx-99223936e69f
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com, kamel.bouhara@bootlin.com, 
 mathieu.dubois-briand@bootlin.com, jeremie.dautheribes@bootlin.com, 
 thomas.petazzoni@bootlin.com, antonin.godard@bootlin.com, 
 pascal.eberhard@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 09:26:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231105

With the current solution, using a separate task
(do_create_kernel_config_spdx) there is a dependency issue. Sometimes
the final rootfs SBOM does not contain the CONFIG_ values.

do_create_kernel_config_spdx is executed after do_create_spdx which
deploys the SPDX file. do_create_kernel_config_spdx calls
oe.sbom30.find_root_obj_in_jsonld to read from the deploy directory,
which is OK, but the do_create_kernel_config_spdx ends up writing to
this deployed file (updating it).

do_create_rootfs_spdx has an explicit dependency to all do_create_spdx
tasks, but there is nothing that prevents executing
do_create_kernel_config_spdx after do_create_rootfs_spdx.

To fix it, instead, now read from the workdir, and write to the
workdir, and do the processing from the do_create_spdx task:
we append to the do_create_spdx task.

Also only execute this task if create-spdx-3.0 was inherited,
previously this code could be executed if create-spdx-2.2 is
inherited.

Fixes: 228a968e7c47 ("kernel.bbclass: Add task to export kernel configuration to SPDX")
Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 meta/classes-recipe/kernel.bbclass | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index f989b31c477c..ce43f6c13036 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -864,13 +864,9 @@ addtask deploy after do_populate_sysroot do_packagedata
 
 EXPORT_FUNCTIONS do_deploy
 
-python __anonymous() {
-    inherits = (d.getVar("INHERIT") or "")
-    if "create-spdx" in inherits:
-        bb.build.addtask('do_create_kernel_config_spdx', 'do_populate_lic do_deploy', 'do_create_spdx', d)
-}
-
-python do_create_kernel_config_spdx() {
+do_create_spdx:append() {
+    if not bb.data.inherits_class("create-spdx-3.0", d):
+        return
     if d.getVar("SPDX_INCLUDE_KERNEL_CONFIG", True) == "1":
         import oe.spdx30
         import oe.spdx30_tasks
@@ -903,9 +899,11 @@ python do_create_kernel_config_spdx() {
         except Exception as e:
             bb.error(f"Failed to parse kernel config file: {e}")
 
-        build, build_objset = oe.sbom30.find_root_obj_in_jsonld(
-            d, "recipes", f"recipe-{pn}", oe.spdx30.build_Build
-        )
+        path = oe.sbom30.jsonld_arch_path(d, pkg_arch, "recipes", f"recipe-{pn}", deploydir=deploydir)
+        build_objset = oe.sbom30.load_jsonld(d, path, required=True)
+        build = build_objset.find_root(oe.spdx30.build_Build)
+        if not build:
+            bb.fatal("No root %s found in %s" % (oe.spdx30.build_Build.__name__, path))
 
         kernel_build = build_objset.add_root(
             oe.spdx30.build_Build(
@@ -924,9 +922,9 @@ python do_create_kernel_config_spdx() {
             [kernel_build]
         )
 
-        oe.sbom30.write_jsonld_doc(d, build_objset, deploydir / pkg_arch / "recipes" / f"recipe-{pn}.spdx.json")
+        oe.sbom30.write_jsonld_doc(d, build_objset, path)
 }
-do_create_kernel_config_spdx[depends] = "virtual/kernel:do_configure"
+do_create_spdx[depends] += "virtual/kernel:do_configure"
 
 # Add using Device Tree support
 inherit kernel-devicetree

---
base-commit: 3a8f0075d52cb653118774baa03aa8d5231f943c
change-id: 20260213-fix-kernel-config-spdx-99223936e69f

Best regards,
-- 
Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>


