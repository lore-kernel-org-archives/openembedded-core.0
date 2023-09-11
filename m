Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 064D9EE57DF
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 10:26:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.55304.1694427978082057540
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Sep 2023 03:26:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEC37D75;
	Mon, 11 Sep 2023 03:26:54 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 285FD3F5A1;
	Mon, 11 Sep 2023 03:26:17 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/3] machine/qemu*: add modesetting drivers to XSERVER
Date: Mon, 11 Sep 2023 11:26:14 +0100
Message-Id: <20230911102614.377841-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230911102614.377841-1-ross.burton@arm.com>
References: <20230911102614.377841-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 10:26:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187488

From: Ross Burton <ross.burton@arm.com>

The modesetting driver works well in qemu, so install it by default. The
plain framebuffer has been buggy in recent 6.4 kernels, a sign that it's
not getting much testing. The Xorg modesetting driver that can use more
powerful virtualised hardware is much better.

We override the default XSERVER because we want to pull in the GLX
extension to exercise that.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/machine/include/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/inclu=
de/qemu.inc
index 0d71bcbbad0..14feb867906 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -8,6 +8,7 @@ PREFERRED_PROVIDER_virtual/libgles3 ?=3D "mesa"
 XSERVER ?=3D "xserver-xorg \
             ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driv=
er-swrast xserver-xorg-extension-glx', '', d)} \
             xf86-video-fbdev \
+            xf86-video-modesetting \
             "
=20
 MACHINE_FEATURES =3D "alsa bluetooth usbgadget screen vfat"
--=20
2.34.1


