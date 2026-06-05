Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D0FCD6E7C
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 12:05:18 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6553.1780661113992281166
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 05:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=CMkb3OFa;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20260605120512dcfa6d1f3100020751-hrl3ln@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260605120512dcfa6d1f3100020751
        for <openembedded-core@lists.openembedded.org>;
        Fri, 05 Jun 2026 14:05:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=trAHtfgjZK5HLk8mcpfslC5Brmx8k6iO/2I3IjqM/jI=;
 b=CMkb3OFacfnPxXInrSkFv7Qw2V58fI8UhuSEU7d/m4Onk/jIx72jTPnL1vZTyjsYTEI/Bh
 2uCrr1nvmcx98xHCBXCvPuHE8FWLJk2xJCe0VBN7fsGp3LDCn3FlDHbTx3qAt5nB/Lc3sDKi
 xx8ubxxAfQcWaEhv8wUOPWbECvhktm4d+T37nbLZdPDlTNXBdSopYu6Sonbm8ffVd2Fpi9u0
 xMkl+3l5Y94+HWsCKtNOH5lCtKrlJWozaW/hvVuoJDMKS5EfNiwEgOZd+JXQbxZOqSxLFB90
 aGXXTTzBpB41+RaQrHvbtF4Ke+x0l7reQBvIQskeVsE1C7mXeL/IrMYg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 1/2] rootfs: move tasks using image_list_installed_packages to postuninstall
Date: Fri,  5 Jun 2026 14:04:55 +0200
Message-ID: <20260605120456.130264-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 12:05:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238165

From: Peter Marko <peter.marko@siemens.com>

Since some packages can be uninstalled, any task querying installed
packages should be run only after both installation and uninstallation
is completed.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes-recipe/license_image.bbclass | 2 +-
 meta/classes/vex.bbclass                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/license_image.bbclass b/meta/classes-recipe/license_image.bbclass
index 95e0a9ba2e..1ecd8f88bc 100644
--- a/meta/classes-recipe/license_image.bbclass
+++ b/meta/classes-recipe/license_image.bbclass
@@ -353,7 +353,7 @@ def get_deployed_files(man_file):
             dep_files.append(os.path.basename(f))
     return dep_files
 
-ROOTFS_POSTPROCESS_COMMAND:prepend = "write_package_manifest license_create_manifest "
+ROOTFS_POSTUNINSTALL_COMMAND:prepend = "write_package_manifest license_create_manifest "
 POPULATE_SDK_POST_HOST_COMMAND:prepend = "write_sdk_host_package_manifest license_create_sdk_host_manifest "
 POPULATE_SDK_POST_TARGET_COMMAND:prepend = "write_sdk_target_package_manifest license_create_sdk_target_manifest "
 do_rootfs[recrdeptask] += "do_populate_lic"
diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
index 4c36cab581..71be705fc1 100644
--- a/meta/classes/vex.bbclass
+++ b/meta/classes/vex.bbclass
@@ -211,7 +211,7 @@ python vex_write_rootfs_manifest () {
     bb.plain("Image VEX JSON report stored in: %s" % manifest_name)
 }
 
-ROOTFS_POSTPROCESS_COMMAND:prepend = "vex_write_rootfs_manifest "
+ROOTFS_POSTUNINSTALL_COMMAND:prepend = "vex_write_rootfs_manifest "
 do_rootfs[recrdeptask] += "do_generate_vex "
 do_populate_sdk[recrdeptask] += "do_generate_vex "
 

