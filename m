Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77714EDF142
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 08:47:30 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15902.1771231645639859306
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Feb 2026 00:47:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=cUs1QzhA;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AAFD04E40E59;
	Mon, 16 Feb 2026 08:47:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 82135606CF;
	Mon, 16 Feb 2026 08:47:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 75DED10369095;
	Mon, 16 Feb 2026 09:47:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771231643; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=yDG4dxVOF3TYzS8/1uFfA2GfX9ynocaM4bweqnRIgUE=;
	b=cUs1QzhARpA2u6z+Au2GVKT3X1ly/q1PabTnbjYX+vmXfb4DGLPYmSQvtEcJVgE4VG+Kyh
	TCmcaKErpbaHiQLOFDusa2DIQo8C7iCkS9aM1xWXMSlyfTNfSeq1DV/fTCrp1gMO/NyLUn
	cmGIi7rNiOw0JK0DHnm/MLgpDadiK0H4WEjug4Los1IlRkcMV77LNWwrGJcDqES8yN6x7c
	JBiPAmplCPPQiH2J0hEPlAsHPw+P5p2yKkbs0ir7LncnlpSc6NSYoknQSGcJ5j4+Ke9B0n
	kow7hmkl3uk1nSEYPzKIEX3G/CrmpNsEYbkQwkLokLQQ7zPXFKIpobMg4jSPaQ==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Mon, 16 Feb 2026 09:47:19 +0100
Subject: [PATCH v2] meta: fix generation of kernel CONFIG_ in SPDX3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-fix-kernel-config-spdx-v2-1-62e65ec2176f@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6DIBBFr2Jm3WkEKwld9R6NC4VBJ7VgwBAb4
 91LvUCX7+f/93dIFJkS3KsdImVOHHwBeanATL0fCdkWBllLVUvRoOMNXxQ9zWiCdzxiWuyGWkv
 Z6EaR0g7KeIlUmqf42RWeOK0hfs6fLH7pX2UWKPDmrFKmb83Q2scQwjqzv5rwhu44ji8bOKQKv
 gAAAA==
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
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 08:47:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231188

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
Changes in v2:
- Update spdx oeqa selftest
- Link to v1: https://lore.kernel.org/r/20260213-fix-kernel-config-spdx-v1-1-4fd66ca5cb5d@bootlin.com
---
 meta/classes-recipe/kernel.bbclass   | 22 ++++++++++------------
 meta/lib/oeqa/selftest/cases/spdx.py |  2 +-
 2 files changed, 11 insertions(+), 13 deletions(-)

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


