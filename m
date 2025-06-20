Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDFD1C77B7F
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 08:08:55 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.2779.1750406928901185603
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jun 2025 01:08:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=StETzAXc;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-2025062008084516404f089e3ad9c530-awgxsm@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2025062008084516404f089e3ad9c530
        for <openembedded-core@lists.openembedded.org>;
        Fri, 20 Jun 2025 10:08:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=2C5/drcqhX73RDPnMTxoAcEhdNjVGxWuM35wzHdCCvc=;
 b=StETzAXcY2Keas7oUfzGAgCgWpeS/ZQMGzwXSqhA80Y6Mee6trkcPIc2vDfybekn5+8UB/
 uRWFOODQwvbHWAUNmInDmQW3bh1OuCcWbW/ic80/RAEBnRD3X+1wW7ONn8XWWW1q5REysrqK
 eXAwt/z1eCIZacuf0RYznSfV13YHTFaRyTPddMl41qHQ6FrKuM4caXe0q1sctuiQXeIw7LL7
 7BYNzCX/sR5sCHVx8CRUHg0KBvCPfLdzy1X3sZ0XNjsxgb3FMvqkNwFmW7wg8b54c5KuBBVP
 TidWR4cCHZEcQGZ9xJGDDZDX/7HwTYOLQh96tZ1WEV82SixcHHXKwsxw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 3/5] beaglebone-yocto: remove redundant boot files
Date: Fri, 20 Jun 2025 10:08:20 +0200
Message-ID: <20250620080840.562802-4-adrian.freihofer@siemens.com>
In-Reply-To: <20250620080840.562802-1-adrian.freihofer@siemens.com>
References: <20250620080840.562802-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 08:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219106

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The beaglebone-yocto MACHINE uses wic to create the final image. The wks
file defines a boot partition like that:
  part /boot --source bootimg_partition --ondisk mmcblk0

This copies the files listed in IMAGE_BOOT_FILES variable from the
DEPLOY_DIR_IMAGE to the dedicated boot partition. Therefore installing
the kernel and the u-boot also into the rootfs is redundant.
This is tested on a beaglebone-black:
* Without this commit: systemd boots. Unmounting /boot shows the useless
  artifacts in the rootfs /boot directory.
* With this commit: The system boots. Unmounting /boot leads to an empty
  /boot directory.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta-yocto-bsp/conf/machine/beaglebone-yocto.conf | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf b/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
index 321d2c27c2a..4ebb771323f 100644
--- a/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
+++ b/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
@@ -18,9 +18,6 @@ WKS_FILE ?= "beaglebone-yocto.wks"
 # Setting this variable to "1" switches from zImage kernel to FIT image kernel
 FIT_IMAGE_KERNEL ?= "0"
 
-# Note: This is redundant if wic creates a separate /boot partition
-MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "${@'linux-yocto-fitimage' if d.getVar('FIT_IMAGE_KERNEL') == '1' else 'kernel-image kernel-devicetree'}"
-
 KERNEL_CLASSES += "${@'kernel-fit-extra-artifacts' if d.getVar('FIT_IMAGE_KERNEL') == '1' else ''}"
 do_image_wic[depends] += "\
     mtools-native:do_populate_sysroot \
-- 
2.49.0


