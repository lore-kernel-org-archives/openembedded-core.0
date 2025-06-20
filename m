Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2AFBC77B7C
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 08:08:55 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.2781.1750406928918605516
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jun 2025 01:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=EHFXdFkD;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-2025062008084520d084ed3f76601e49-jvrgwv@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2025062008084520d084ed3f76601e49
        for <openembedded-core@lists.openembedded.org>;
        Fri, 20 Jun 2025 10:08:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=diI4R72fzEjqu7bGBpvpzKZ/nHAnTAWy41pI2s3uDl8=;
 b=EHFXdFkDSj7nENLFByICUbq+PZl0KTW0V15YqIcJ466RFInX/l56bOWbMEsO61+yaMjxPA
 hFl681tPUbL2vuBhUchX13ocSSyWTJq7dEetrQr8EYZwuJ7B9Qx3BfoWwYtnUpa2ybKbe/cm
 qw5NlS4zvQWNm3/0t35vMAv77Mncm63Dn/VHk5cKYF0SuY7/nXEn+Sy29jGP7ApqtptGthtU
 5g6p7OkE6jB9G8NhHA9blcqxHIHVyAI0xQ1eRhV8cMtPhZM2JiB8MVgrQtPFmywMKQ/2zhBf
 lZoQksLiGTicQgI+4LD/ADpSEhfIbkZKduQ1nbaC2fT3ZtOnkVr8GIdA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/5] beaglebone-yocto: support initramfs in qemu
Date: Fri, 20 Jun 2025 10:08:18 +0200
Message-ID: <20250620080840.562802-2-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219110

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Support booting with initramfs also in Qemu.
If INITRAMFS_IMAGE is defined, Qemu gets it via -initrd parameter.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta-yocto-bsp/conf/machine/beaglebone-yocto.conf | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf b/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
index db9cfec497a..d4b72361650 100644
--- a/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
+++ b/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
@@ -46,7 +46,10 @@ QB_SYSTEM_NAME = "qemu-system-arm"
 QB_MACHINE = "-machine virt"
 QB_CPU = "-cpu cortex-a15"
 QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0 systemd.mask=systemd-networkd"
-QB_OPT_APPEND = "-device virtio-rng-device"
+QB_OPT_APPEND = "\
+    -device virtio-rng-device \
+    ${@' -initrd %s/%s.%s' % (d.getVar('DEPLOY_DIR_IMAGE'), d.getVar('INITRAMFS_IMAGE_NAME'), d.getVar('INITRAMFS_FSTYPES')) if d.getVar('INITRAMFS_IMAGE') else ''} \
+"
 QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
 QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
 QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
-- 
2.49.0


