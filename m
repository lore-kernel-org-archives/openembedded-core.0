Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C834CC433F5
	for <webhook@archiver.kernel.org>; Sat, 25 Sep 2021 17:10:24 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web12.9243.1632589823475898634
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Sep 2021 10:10:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17,
 mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout02.t-online.de (Postfix) with SMTP id 69DBA7FFE
	for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Sep 2021 19:10:21 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.154.167.53]) by fwd88.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1mUBBp-2AV7AH0; Sat, 25 Sep 2021 19:10:18 +0200
From: MarkusVolk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: MarkusVolk <f_l_k@t-online.de>
Subject: [OE-core][PATCH] wic:direct.py: ignore invalid mountpoints during
 fstab update
Date: Sat, 25 Sep 2021 19:09:52 +0200
Message-Id: <20210925170952.144140-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1632589818-00001485-4E154A04/0/0 CLEAN NORMAL
X-TOI-MSGID: d6732308-3bfa-4eaf-8e6c-c290534fd793
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Sep 2021 17:10:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156350

wic fstab-update creates invalid entries for partitons that are not suppo=
sed to
be mounted from userspace e.g u-boot partitions.

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
index 9d10ec01d0..15fa47356f 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -117,7 +117,7 @@ class DirectPlugin(ImagerPlugin):
         updated =3D False
         for part in self.parts:
             if not part.realnum or not part.mountpoint \
-               or part.mountpoint =3D=3D "/":
+               or part.mountpoint =3D=3D "/" or not part.mountpoint.star=
tswith('/'): \
                 continue
=20
             if part.use_uuid:
--=20
2.25.1


