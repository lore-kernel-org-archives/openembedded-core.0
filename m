Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB20C44507
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 21:02:48 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1114.1784149360992804559
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 14:02:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=BQSi0qcW;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20260715210239b0f4e68c4100020790-d00pni@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260715210239b0f4e68c4100020790
        for <openembedded-core@lists.openembedded.org>;
        Wed, 15 Jul 2026 23:02:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=IqO2yeWrYYVIpwnZxjHdx62hqLTCL3/Ua5P1xlgn224=;
 b=BQSi0qcWrsVdh2w+KkLKoI0nJ+/lSVeH2Y3tsEpeA8kSdUEFUdbur5CfAS8uW4CSpXbPeP
 z2aTPTwHFGo6YWs5CxQjfJZbWyRXGiHRKvim3oCO06AHkoJjycSEttCodRxkj3wHM8DjiMKl
 3p1YFGqW4gPEGmmPce/BC6+Kd9s2e58VIt07IMBqdJiDBgArs5eY19abdmnrmCfydu3weJWM
 5RT0/j86BG0EPmWjSjR1DvI5vd0NnSnSdmHrErrRu6Pb3V2RkW9chjGRDoefyiqVNw5fajU2
 IaA4b3Q2CScN+TkQYbBjaIyf1TWF/6s0D6hz3TRCk4Xk6CSMm8cQaNOA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 2/2] rootfs: move tasks using image_list_installed_packages to postuninstall
Date: Wed, 15 Jul 2026 23:02:08 +0200
Message-ID: <20260715210208.4995-2-peter.marko@siemens.com>
In-Reply-To: <20260715210208.4995-1-peter.marko@siemens.com>
References: <20260715210208.4995-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 21:02:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241039

From: Peter Marko <peter.marko@siemens.com>

Since some packages can be uninstalled, any task querying installed
packages should be run only after both installation and uninstallation
is completed.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: c3097962ac925538e99b17b771c541950a8b8c26)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes-recipe/license_image.bbclass | 2 +-
 meta/classes/vex.bbclass                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/license_image.bbclass b/meta/classes-recipe/license_image.bbclass
index b18a64d2bc3..e934c74d246 100644
--- a/meta/classes-recipe/license_image.bbclass
+++ b/meta/classes-recipe/license_image.bbclass
@@ -294,7 +294,7 @@ def get_deployed_files(man_file):
             dep_files.append(os.path.basename(f))
     return dep_files
 
-ROOTFS_POSTPROCESS_COMMAND:prepend = "write_package_manifest license_create_manifest "
+ROOTFS_POSTUNINSTALL_COMMAND:prepend = "write_package_manifest license_create_manifest "
 do_rootfs[recrdeptask] += "do_populate_lic"
 
 python do_populate_lic_deploy() {
diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
index eac68ca6289..97213ea3497 100644
--- a/meta/classes/vex.bbclass
+++ b/meta/classes/vex.bbclass
@@ -229,7 +229,7 @@ python vex_write_rootfs_manifest () {
     bb.plain("Image VEX JSON report stored in: %s" % manifest_name)
 }
 
-ROOTFS_POSTPROCESS_COMMAND:prepend = "vex_write_rootfs_manifest "
+ROOTFS_POSTUNINSTALL_COMMAND:prepend = "vex_write_rootfs_manifest "
 do_rootfs[recrdeptask] += "do_generate_vex "
 do_populate_sdk[recrdeptask] += "do_generate_vex "
 

