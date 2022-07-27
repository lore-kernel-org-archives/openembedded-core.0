Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C95A1C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 13:45:30 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.19923.1658929525576180066
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 06:45:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83,
 mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout07.t-online.de (Postfix) with SMTP id A96FAEA23
	for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 15:45:23 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.44.9]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oGhLk-3tWRIf0; Wed, 27 Jul 2022 15:45:21 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] wic/direct.py: ignore root mountpoint in fstab
 updater
Date: Wed, 27 Jul 2022 15:45:12 +0200
Message-Id: <20220727134512.4033-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1658929521-01447F1E-B18DEA02/0/0 CLEAN NORMAL
X-TOI-MSGID: 9223f8fa-0bce-4f18-a3a9-deb17dd38162
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 13:45:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168561

We already have a root entry in fstab. This commit prevents processing ro=
ot
mountpoint in fstab_updater and thus avoids duplicate entries for root in=
 fstab.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 scripts/lib/wic/plugins/imager/direct.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/p=
lugins/imager/direct.py
index c44159b235..75004ab320 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -117,7 +117,8 @@ class DirectPlugin(ImagerPlugin):
         updated =3D False
         for part in self.parts:
             if not part.realnum or not part.mountpoint \
-               or not part.mountpoint.startswith('/'):
+               or not part.mountpoint.startswith('/') \
+               or part.mountpoint =3D=3D "/":
                 continue
=20
             if part.use_uuid:
--=20
2.34.1


