Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E19FC4332F
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 09:32:39 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web09.4900.1666085558700467854
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Oct 2022 02:32:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YTY1nC95;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: thomas.perrot@bootlin.com)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7331FE0007;
	Tue, 18 Oct 2022 09:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666085556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1nU0bPPovjUVvHwaSk3OFc7Ax1IFKW2bOIthVNz+Sa8=;
	b=YTY1nC95DjJ1BjQNRusm0F2mYp4Z2He/NMnwFB1MjHp42cQjsOHu+nuernM+WM6bR/89zb
	nmMZYJn+aBWAGO4MWQfvwYNxMwR0yRnsiXt12aGXktDigmP6O1NPzdpqYgGEJfBry4zKKU
	4+NHMnR9NFatXrdjwssd6DfQDWQqlu3zUMkclaYGXMuKq7bkQ0j6DXXsRtuHvGanLH28pY
	rOv5U9dx5VART14o9iVBhderZ6WbVi5UBqgBkl5LiVb7RFnNaB7jtRQvsD34mUSmZkAZCs
	DWOmVCeAriYCPzzil2/yV56Ug4+K5pLJ8//V3iOYEbGKAK+WGBSAilgiRxNV+Q==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] qemu.inc: add virtio input in required dependencies
Date: Tue, 18 Oct 2022 11:32:27 +0200
Message-Id: <20221018093227.3753321-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 09:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171936

From: Thomas Perrot <thomas.perrot@bootlin.com>

Otherwise, it isn't possible to interact with the UI of images
that provide graphic support.

This issue only occurs when NO_RECOMMENDATIONS = "1" for Qemu
targets which are kernel-modules in MACHINE_EXTRA_RRECOMMENDS.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta/conf/machine/include/qemu.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 0d71bcbbad0d..dabe7ed8f386 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -10,6 +10,8 @@ XSERVER ?= "xserver-xorg \
             xf86-video-fbdev \
             "
 
+MACHINE_EXTRA_RDEPENDS += "kernel-module-virtio-input"
+
 MACHINE_FEATURES = "alsa bluetooth usbgadget screen vfat"
 
 MACHINEOVERRIDES =. "qemuall:"
-- 
2.37.3


