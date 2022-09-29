Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 378F6C433FE
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 12:58:36 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web12.9890.1664456315355013214
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 05:58:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21,
 mailfrom: f_l_k@t-online.de)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout10.t-online.de (Postfix) with SMTP id 6CB1A15119;
	Thu, 29 Sep 2022 14:58:33 +0200 (CEST)
Received: from flk-MS-7C91.. ([84.163.42.234]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1odt7Y-1PGpLl0; Thu, 29 Sep 2022 14:58:33 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] wic-imager-direct.py: use fstab update also for root
 device
Date: Thu, 29 Sep 2022 14:57:50 +0200
Message-Id: <20220929125750.3338743-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1664456313-1F7ED81E-D811A949/0/0 CLEAN NORMAL
X-TOI-MSGID: 9f471465-91c8-4e22-9c4b-da0097bc9d56
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 12:58:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171186

Remove the hardcoded root device entry from fstab when updating to
avoid duplicate entries.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 scripts/lib/wic/plugins/imager/direct.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/p=
lugins/imager/direct.py
index da483daed5..fd86a094d9 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -117,7 +117,7 @@ class DirectPlugin(ImagerPlugin):
         updated =3D False
         for part in self.parts:
             if not part.realnum or not part.mountpoint \
-               or part.mountpoint =3D=3D "/" or not part.mountpoint.star=
tswith('/'):
+               or not part.mountpoint.startswith('/'):
                 continue
=20
             if part.use_uuid:
@@ -145,6 +145,11 @@ class DirectPlugin(ImagerPlugin):
             fstab_lines.append(line)
             updated =3D True
=20
+        for line in fstab_lines:
+            if '/dev/root' in line:
+                fstab_lines.remove(line)
+                updated =3D True
+
         if updated:
             self.updated_fstab_path =3D os.path.join(self.workdir, "fsta=
b")
             with open(self.updated_fstab_path, "w") as f:
--=20
2.34.1


