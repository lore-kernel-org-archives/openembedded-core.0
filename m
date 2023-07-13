Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E58FFC001DC
	for <webhook@archiver.kernel.org>; Thu, 13 Jul 2023 19:19:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1537.1689275941235141467
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jul 2023 12:19:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AA601570;
	Thu, 13 Jul 2023 12:19:43 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 52D323F67D;
	Thu, 13 Jul 2023 12:19:00 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] qemuarm: pin kernel to 6.1
Date: Thu, 13 Jul 2023 20:18:58 +0100
Message-Id: <20230713191858.1810907-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jul 2023 19:19:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184247

From: Ross Burton <ross.burton@arm.com>

The 6.4 kernel causes parselog failures when Xorg starts:

 (II) FBDEV(0): checking modes against framebuffer device...
 (II) FBDEV(0): 	mode "640x480" test failed
 (II) FBDEV(0): 	mode "640x480" test failed
 (II) FBDEV(0): 	mode "640x480" test failed
 (II) FBDEV(0): 	mode "640x480" test failed
 (II) FBDEV(0): 	mode "640x480" not found

It appears to be specific to qemuarm without GL. Until this is resolved,
pin the qemuarm BSP to 6.1.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/machine/qemuarm.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.c=
onf
index aa9ce882035..75cfbaf74b6 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -29,4 +29,8 @@ QB_ROOTFS_OPT =3D "-drive id=3Ddisk0,file=3D@ROOTFS@,if=
=3Dnone,format=3Draw -device virtio
 QB_SERIAL_OPT =3D "-device virtio-serial-device -chardev null,id=3Dvirtc=
on -device virtconsole,chardev=3Dvirtcon"
 QB_TCPSERIAL_OPT =3D "-device virtio-serial-device -chardev socket,id=3D=
virtcon,port=3D@PORT@,host=3D127.0.0.1 -device virtconsole,chardev=3Dvirt=
con"
=20
+# 6.4 causes Xorg to fail to read the virtio framebuffer so stick with 6=
.1 until
+# that is resolved.
+PREFERRED_VERSION_linux-yocto ??=3D "6.1%"
+
 KMACHINE:qemuarm =3D "qemuarma15"
--=20
2.34.1


