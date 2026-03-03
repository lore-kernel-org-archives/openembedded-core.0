Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74663EDA69F
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 16:46:50 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23072.1772556404466736164
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 08:46:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=oyMDAag8;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C0AFB4E42503;
	Tue,  3 Mar 2026 16:46:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 97A1A5FF29;
	Tue,  3 Mar 2026 16:46:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5D17A10369761;
	Tue,  3 Mar 2026 17:46:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772556402; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YCUN2SiA5iOxo05INqDVEoimISEP/tC0oCRlDRbMDLU=;
	b=oyMDAag8ZKVNaAL7rdpiuqQOMemBAVi61F5hcv9HjbBMw2fO74cU/YOP8UkrZuFH4XVDKI
	w8XEDYEVP/dkMttmkZIhBaixVibgg19+Q8j2LQuz4T7i7jCExMmJOcLzBaeu1JB49JWGcK
	J3/X0rBKnO6omZvv4kxhJjTFQvWRi+EricYBn7vmYke7b7RSrPNCihU0Qakys2tp4on6HP
	WdXYiy4tpMS6rtm1UevNcELdIFby6lQrity/VMcs9bEUQmsFRVAjH65dlJvYSjk5f4sb4H
	ACC8DYccVOElzFGch1sOuHmGHq0kxfu7KrUpUykDyMO7vJfFSrY8QjqqCR8aQw==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Tue, 03 Mar 2026 17:46:17 +0100
Subject: [PATCH scarthgap 3/3] meta: fix generation of kernel CONFIG_ in
 SPDX3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-backport-fixes-scarthgap-v1-3-2dc803f921a9@bootlin.com>
References: <20260303-backport-fixes-scarthgap-v1-0-2dc803f921a9@bootlin.com>
In-Reply-To: <20260303-backport-fixes-scarthgap-v1-0-2dc803f921a9@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com, richard.purdie@linuxfoundation.org, 
 JPEWhacker@gmail.com, thomas.petazzoni@bootlin.com, pascal.eberhard@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 16:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232328

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
Furthermore, update oeqa selftest to execute do_create_spdx instead
of removed function.

Also only execute this task if create-spdx-3.0 was inherited,
previously this code could be executed if create-spdx-2.2 is
inherited.

Fixes: 1fff29a04287 ("kernel.bbclass: Add task to export kernel configuration to SPDX")
Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
(cherry picked from commit 8417f4a186e78a9d309541f5d0e711178bb80488)
---
 meta/classes-recipe/kernel.bbclass   | 27 +++++++++++++++------------
 meta/lib/oeqa/selftest/cases/spdx.py |  2 +-
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 39e198864e40..618324f75ff6 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -870,14 +870,13 @@ addtask deploy after do_populate_sysroot do_packagedata
 
 EXPORT_FUNCTIONS do_deploy
 
-python __anonymous() {
-    inherits = (d.getVar("INHERIT") or "")
-    if "create-spdx" in inherits:
-        bb.build.addtask('do_create_kernel_config_spdx', 'do_populate_lic do_deploy', 'do_create_spdx', d)
-}
+do_create_spdx:append() {
+    def create_kernel_config_spdx(d):
+        if not bb.data.inherits_class("create-spdx-3.0", d):
+            return
+        if d.getVar("SPDX_INCLUDE_KERNEL_CONFIG", True) != "1":
+            return
 
-python do_create_kernel_config_spdx() {
-    if d.getVar("SPDX_INCLUDE_KERNEL_CONFIG", True) == "1":
         import oe.spdx30
         import oe.spdx30_tasks
         from pathlib import Path
@@ -909,9 +908,11 @@ python do_create_kernel_config_spdx() {
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
@@ -930,9 +931,11 @@ python do_create_kernel_config_spdx() {
             [kernel_build]
         )
 
-        oe.sbom30.write_jsonld_doc(d, build_objset, deploydir / pkg_arch / "recipes" / f"recipe-{pn}.spdx.json")
+        oe.sbom30.write_jsonld_doc(d, build_objset, path)
+
+    create_kernel_config_spdx(d)
 }
-do_create_kernel_config_spdx[depends] = "virtual/kernel:do_configure"
+do_create_spdx[depends] += "virtual/kernel:do_configure"
 
 # Add using Device Tree support
 inherit kernel-devicetree
diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index 035f3fe33636..3373988ca403 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -298,7 +298,7 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
         objset = self.check_recipe_spdx(
             kernel_recipe,
             spdx_path,
-            task="do_create_kernel_config_spdx",
+            task="do_create_spdx",
             extraconf="""\
                 INHERIT += "create-spdx"
                 SPDX_INCLUDE_KERNEL_CONFIG = "1"

-- 
2.53.0


