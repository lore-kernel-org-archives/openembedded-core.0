Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A0A2CD98FE
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:45:40 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10215.1781682330348685482
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:45:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=R2/+x1kK;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45eeea039ebso3094276f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 00:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781682329; x=1782287129; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHu/pj2OoYR7mRByLTukfMMeD1rwHNfR+xDnMO2jW4o=;
        b=R2/+x1kKnwQlfYg/uXdfSG/TbwW/btaKUMxMUlRj+ENddZTDbMqRAKCW1VJHTh+mQ6
         Nx5GpQyHUnBhWEGH1KCv1CFQwCUL+7yuhJGsJ0ug2A5iFiWL4CtDwnpwbfp9rjbR2wbL
         W9HLMLwBkvlILn1gXpBGqXQiGuRrf+IInZM1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682329; x=1782287129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xHu/pj2OoYR7mRByLTukfMMeD1rwHNfR+xDnMO2jW4o=;
        b=QlOaMmJm00//9lflxTZnfjfQw6VCvql2c2NQg9bYnuXsepiHQtj+32hchwBQE1Nj7y
         VdX52yCL+FH7hoHXrNoLB2PliJzObpXp6VYzYiyfpfDjQmjfU/Kki/EUQSspHJFhITwq
         JEVlGNZ5oHXJJafRrKR59iqnAI1K5ZECUIkw/cgM434O+Sqa1GJAZ48OScTEl3Yi9tIl
         jjp/KZ7gzgwaofnyja5LYwjhFIIC7dT9ta1UF29qR5z/YL2zuvcqs656U68PRdA1NC/x
         rK0SItrhqrh8qVpJ2eh4u+aYTgX99B5bBxBsUWkE9xK4076NG9LqREM2koeVz4sS+DCZ
         ufcw==
X-Gm-Message-State: AOJu0YzVwFFvjVmsADsngX085ekgVjiv0sreB9w8si4DGuSWyMLXO32b
	o2CMGicsTP+JN4efMyYPCpSSflzwbqdu0c3vtENdBZipGPkenRF34gp3fodgUrmlObKIS3Te0DQ
	FYubS
X-Gm-Gg: AfdE7cm8YE7PruXtkgkff+wDF2aCM00uiOTy4I4tv66tqLUtMKX2fW/ahKVf5g16OHc
	jTVpjHsb+pOBdy9QZ65q8lgHv4wrKwQ25SjHJEZJRtNEixx7kXoQ4YAS3V+4qEfngBqKkY5gWBt
	qVbGqp/0wyOz/Tx941Gjjeaflex7j/A38szamzvfqqe9SB2F3YG3HxcZF1MPe+6pqMxArGBl9X5
	VetjhqjrqBYvaAlzLrZBJA+2mMndYBAVhcKznV6ykUCgtnq/kx1Rus0cuxedFDz8Ad9UiWdKfsL
	pptud3cp+tvui05krSLHQ6M4wFzNn9QgXIONfmhhwL3KToULUWCC22ytAdg6H1OYBZRYdihNytP
	/gGIiFIDcSXyviKqCKna7V4rfNwZi5nRwuk0Kl7a7OIm51MMCghd+LkEYkp304UEBSqM1NI+PXW
	VFCyjZbwJiNdZFInvIzNigIpWvRaeV1gCO7Qr8+w7/RozLpZ4MCV8nQFbvqRxJg2ZMibxpsva5i
	AjiEG08hxEz+T0CqVqG46j+MZ2T
X-Received: by 2002:a05:6000:18a5:b0:460:edd:ca89 with SMTP id ffacd0b85a97d-46238ac9fd2mr5098536f8f.26.1781682328642;
        Wed, 17 Jun 2026 00:45:28 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bc19bde07170effe.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bc19:bde0:7170:effe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619b9b7750sm23483215f8f.6.2026.06.17.00.45.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:45:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/30] meta: fix generation of kernel CONFIG_ in SPDX3
Date: Wed, 17 Jun 2026 09:44:40 +0200
Message-ID: <22e8bc2bcfe762c83c00b73a33384e63548e82c0.1781682189.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781682189.git.yoann.congal@smile.fr>
References: <cover.1781682189.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:45:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238987

From: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>

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

(cherry picked from commit 8417f4a186e78a9d309541f5d0e711178bb80488)

Fixes: 1fff29a04287 ("kernel.bbclass: Add task to export kernel configuration to SPDX")
Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/kernel.bbclass   | 27 +++++++++++++++------------
 meta/lib/oeqa/selftest/cases/spdx.py |  2 +-
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 39e198864e4..618324f75ff 100644
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
index 035f3fe3363..3373988ca40 100644
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

