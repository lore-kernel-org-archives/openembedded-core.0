Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B50C55822
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 19:53:55 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29326.1785700422013768987
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 12:53:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=SRpF8+6m;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-20260802195338239a389133000207c0-_l408l@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260802195338239a389133000207c0
        for <openembedded-core@lists.openembedded.org>;
        Sun, 02 Aug 2026 21:53:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=UHh2HNYQjhFHHJq7QwwouJ4Ed/KBTUt+6sL2o91Y2vs=;
 b=SRpF8+6msAHjKAWpHHhAjFNEcgHzufQiRyxnb6mpmWvtXnKX0qYfvW7YRGBYlp5YX66mVi
 AqgHfDLEr5cAtlPQ0SokimquOFKlanVnGx+LYczoaI+CKDqwPMLt1Yi2Pi8ppbO+adQbwPU4
 J54xYD/LJgSbESx6HsPbwCUMyHphZ9Ls6OkzdzR05JEvxCtYrOf4omQure5NOZm3MvKmjAQN
 pFIFvtPj/6Adi2KIisgVGdsM1F3kyUIMT9Wo+14YlDoti/YIU0oEsMGrXU8te19AsohjWZdZ
 BrHlhTFYO2wCNpp6BKY5IU34dUzCbg4ppgqOBcyEbL8RMz7LFz695mlA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 01/14] qemuboot: make do_write_qemuboot_conf a standalone sstate task
Date: Sun,  2 Aug 2026 21:52:48 +0200
Message-ID: <20260802195324.64533-2-adrian.freihofer@siemens.com>
In-Reply-To: <20260802195324.64533-1-adrian.freihofer@siemens.com>
References: <20260802195324.64533-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 19:53:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242576

From: Adrian Freihofer <adrian.freihofer@siemens.com>

There seems to be still some corner cases where the qemuboot.conf file
is not deployed reliably.

Previously do_write_qemuboot_conf wrote its output into IMGDEPLOYDIR,
which is shared with do_image_complete. The conf file only reached
DEPLOY_DIR_IMAGE when do_image_complete ran, so for example running:

  bitbake <image> -c write_qemuboot_conf --force

had no visible effect on the deployed conf.

Introduce a dedicated QEMUBOOTCONFDEPLOYDIR and register
do_write_qemuboot_conf as a proper SSTATE task with its own
sstate-inputdirs/sstate-outputdirs pair pointing at DEPLOY_DIR_IMAGE.
A matching do_write_qemuboot_conf_setscene task handles sstate restores.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/qemuboot.bbclass | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/qemuboot.bbclass
index d1794c7899..1ced9b9b73 100644
--- a/meta/classes-recipe/qemuboot.bbclass
+++ b/meta/classes-recipe/qemuboot.bbclass
@@ -126,6 +126,11 @@ QB_DRIVE_TYPE ?= "/dev/sd"
 
 inherit image-artifact-names
 
+# Dedicated deploy directory for the qemuboot config, separate from IMGDEPLOYDIR
+# so that do_write_qemuboot_conf can be its own sstate task and deploy its
+# output to DEPLOY_DIR_IMAGE independently of do_image_complete.
+QEMUBOOTCONFDEPLOYDIR = "${WORKDIR}/deploy-${PN}-qemubootconf"
+
 # Create qemuboot.conf
 addtask do_write_qemuboot_conf after do_rootfs before do_image
 do_write_qemuboot_conf[depends] += "${@ '' if bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE')) else (d.getVar('KERNEL_DEPLOY_DEPEND') or '')}"
@@ -140,12 +145,22 @@ def qemuboot_vars(d):
 
 do_write_qemuboot_conf[vardeps] += "${@' '.join(qemuboot_vars(d))}"
 do_write_qemuboot_conf[vardepsexclude] += "TOPDIR"
+do_write_qemuboot_conf[dirs] = "${QEMUBOOTCONFDEPLOYDIR}"
+do_write_qemuboot_conf[cleandirs] = "${QEMUBOOTCONFDEPLOYDIR}"
+do_write_qemuboot_conf[stamp-extra-info] = "${MACHINE_ARCH}"
+SSTATETASKS += "do_write_qemuboot_conf"
+do_write_qemuboot_conf[sstate-inputdirs] = "${QEMUBOOTCONFDEPLOYDIR}"
+do_write_qemuboot_conf[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
+python do_write_qemuboot_conf_setscene () {
+    sstate_setscene(d)
+}
+addtask do_write_qemuboot_conf_setscene
 python do_write_qemuboot_conf() {
     import configparser
 
-    qemuboot = "%s/%s.qemuboot.conf" % (d.getVar('IMGDEPLOYDIR'), d.getVar('IMAGE_NAME'))
+    qemuboot = "%s/%s.qemuboot.conf" % (d.getVar('QEMUBOOTCONFDEPLOYDIR'), d.getVar('IMAGE_NAME'))
     if d.getVar('IMAGE_LINK_NAME'):
-        qemuboot_link = "%s/%s.qemuboot.conf" % (d.getVar('IMGDEPLOYDIR'), d.getVar('IMAGE_LINK_NAME'))
+        qemuboot_link = "%s/%s.qemuboot.conf" % (d.getVar('QEMUBOOTCONFDEPLOYDIR'), d.getVar('IMAGE_LINK_NAME'))
     else:
         qemuboot_link = ""
     finalpath = d.getVar("DEPLOY_DIR_IMAGE")
-- 
2.55.0


