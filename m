Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 003CFC433EF
	for <webhook@archiver.kernel.org>; Sat, 25 Sep 2021 18:01:51 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.9550.1632592910128261838
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Sep 2021 11:01:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22,
 mailfrom: f_l_k@t-online.de)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout12.t-online.de (Postfix) with SMTP id BEA737F48
	for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Sep 2021 20:01:44 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.154.167.53]) by fwd75.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1mUBzc-4YUj6f0; Sat, 25 Sep 2021 20:01:44 +0200
From: MarkusVolk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: MarkusVolk <f_l_k@t-online.de>
Subject: [OE-core][PATCH v2] wic:direct.py: ignore invalid mountpoints during
 fstab update
Date: Sat, 25 Sep 2021 20:01:37 +0200
Message-Id: <20210925180137.148011-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1632592904-00001454-1A169DFD/0/0 CLEAN NORMAL
X-TOI-MSGID: d8d69e7c-d709-4b65-aa33-fe0ca14728b7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Sep 2021 18:01:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156352

wic fstab-update creates invalid entries for partitons that are not suppo=
sed to
be mounted from userspace eg u-boot partitions.

The following lines were added to fstab on a rock-pi-4:
/dev/mmcblk1p1 loader1 vfat defaults 0 0
/dev/mmcblk1p2 reserved1 vfat defaults 0 0
/dev/mmcblk1p3 reserved2 vfat defaults 0 0
/dev/mmcblk1p4 loader2 vfat defaults 0 0
/dev/mmcblk1p5 atf vfat defaults 0 0
/dev/mmcblk1p6 /boot vfat defaults 0 0

With this patch only valid entries should be added
/dev/mmcblk1p6 /boot vfat defaults 0 0

Signed-off-by: MarkusVolk <f_l_k@t-online.de>
---
 scripts/lib/wic/plugins/imager/direct.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/p=
lugins/imager/direct.py
index 9d10ec01d0..495518fac8 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -117,7 +117,7 @@ class DirectPlugin(ImagerPlugin):
         updated =3D False
         for part in self.parts:
             if not part.realnum or not part.mountpoint \
-               or part.mountpoint =3D=3D "/":
+               or part.mountpoint =3D=3D "/" or not part.mountpoint.star=
tswith('/'):
                 continue
=20
             if part.use_uuid:
--=20
2.25.1


