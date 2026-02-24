Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E7DEFB81E
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 09:17:39 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16415.1771924648979353383
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 01:17:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=DUt29TxY;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6D685C143E0
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 09:17:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EBE7F5FD9D;
	Tue, 24 Feb 2026 09:17:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B858410368F28;
	Tue, 24 Feb 2026 10:17:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771924646; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=JEcUmwmgILvh7A7a0JgTtVhpmusM9qIuuA8TwluM8rc=;
	b=DUt29TxYGWl6QNtHOwHkEMdlGgAW/7zgsI+FIJMmhH0dlOTrT6NjMbErQ3PA5GKyJ0sTfp
	jVGBSpFdK4c+bhbGON+/hty8UXf8bfzOItRPYTvJBsroPm3An6T9aT0GzsK7ytfpvd8DKQ
	ySFa8aNhmnhtPomkBNsRI7UQAGD1UJujl3HbdD/yLly0ii5uCQCigQatYvQ8h5Wak+Y57o
	0qMEZE8W9HqqcmwCVlFEg3gdRm4BZTOLodqx66S8roUIXFGy6eF/iQ8+Z+B6s06+UOoTYe
	lB8AsR6jkqOM0ZgkqkuBucsFfwNyAjdXBa8hYadxkgxF9MplkrdgJQIEle7NIQ==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Tue, 24 Feb 2026 10:17:19 +0100
Subject: [PATCH v3] meta: fix generation of kernel CONFIG_ in SPDX3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-fix-kernel-config-spdx-v3-1-011b7badd942@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNwQ6CMAyA4VchOzvDOqnBk+9hPMDWwSJuZCMLh
 vDuDk56MB7/pv26sEjBUmSXYmGBko3WuxzyUDDVN64jbnVuBiVgCUJyY2f+oOBo4Mo7YzseRz3
 zugaQtUTC2rB8PAbKmzt8u+fubZx8eO1/ktimf8kkuOAnoxFVU6m20tfW+2mw7qj8k21ogk8If
 0KQIQTCihSIM5pvaF3XN9L7bUIHAQAA
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
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 09:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231752

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

Fixes: 228a968e7c47 ("kernel.bbclass: Add task to export kernel configuration to SPDX")
Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
Changes in v3:
- Move the code inside a function declared inside do_create_spdx(),
  this way we can declare variables safely and use return.
- Link to v2: https://lore.kernel.org/r/20260216-fix-kernel-config-spdx-v2-1-62e65ec2176f@bootlin.com

Changes in v2:
- Update spdx oeqa selftest
- Link to v1: https://lore.kernel.org/r/20260213-fix-kernel-config-spdx-v1-1-4fd66ca5cb5d@bootlin.com
---
 meta/classes-recipe/kernel.bbclass   | 27 +++++++++++++++------------
 meta/lib/oeqa/selftest/cases/spdx.py |  2 +-
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index f989b31c477c..222a5d74f7bf 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -864,14 +864,13 @@ addtask deploy after do_populate_sysroot do_packagedata
 
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
@@ -903,9 +902,11 @@ python do_create_kernel_config_spdx() {
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
@@ -924,9 +925,11 @@ python do_create_kernel_config_spdx() {
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
index 41ef52fce1ca..5830d7c0872a 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -369,7 +369,7 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
         objset = self.check_recipe_spdx(
             kernel_recipe,
             spdx_path,
-            task="do_create_kernel_config_spdx",
+            task="do_create_spdx",
             extraconf="""\
                 INHERIT += "create-spdx"
                 SPDX_INCLUDE_KERNEL_CONFIG = "1"

---
base-commit: 3a8f0075d52cb653118774baa03aa8d5231f943c
change-id: 20260213-fix-kernel-config-spdx-99223936e69f

Best regards,
-- 
Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>


