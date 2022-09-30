Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C68C433FE
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 04:18:26 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web09.2088.1664511504429728091
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 21:18:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82,
 mailfrom: f_l_k@t-online.de)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout05.t-online.de (Postfix) with SMTP id 3F5A718376
	for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 06:18:22 +0200 (CEST)
Received: from flk-MS-7C91.. ([84.163.45.187]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oe7Tg-4X0Kfp0; Fri, 30 Sep 2022 06:18:20 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCHv2] wic-imager-direct.py: use fstab update also for
 root device
Date: Fri, 30 Sep 2022 06:18:07 +0200
Message-Id: <20220930041807.2509199-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1664511500-C2B221D1-795304F0/0/0 CLEAN NORMAL
X-TOI-MSGID: 5d6ccd85-b8b9-47a8-9af0-1b38ba0db7d3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 04:18:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171205

wic imager is able to add entries for the partitions to fstab. This patch=
 also
creates an entry for the root device, which was previously ignored. The r=
oot
device entry can now optionally be uuid or label based.

The stock fstab file provided by base-files.bb already contains an entry =
for the
root device. The result looks something like this:

/dev/root / auto defaults 1 1
proc /proc proc defaults 0 0
devpts /dev/pts devpts mode=3D0620,ptmxmode=3D0666,gid=3D5 0 0
tmpfs /run tmpfs mode=3D0755,nodev,nosuid,strictatime 0 0
tmpfs /var/volatile tmpfs defaults 0 0

UUID=3D055A-69B5 /boot vfat defaults 0 0
UUID=3D0eb2df23-3638-4bbf-b045-9a425cb45954 / ext4 defaults 0 0

To avoid duplicate root device entries in fstab for wic images, the "/dev=
/root"
line is removed during the update.

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


