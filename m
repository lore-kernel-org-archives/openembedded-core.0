Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83AAEC369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 15:48:49 +0000 (UTC)
Received: from forward102a.mail.yandex.net (forward102a.mail.yandex.net [178.154.239.85])
 by mx.groups.io with SMTP id smtpd.web10.23256.1744731251388605534
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 08:34:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yandex.ru header.s=mail header.b=nUPbiMAT;
 spf=pass (domain: yandex.ru, ip: 178.154.239.85, mailfrom: denisova.olga.k@yandex.ru)
Received: from mail-nwsmtp-smtp-production-main-54.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-54.vla.yp-c.yandex.net [IPv6:2a02:6b8:c0f:4d95:0:640:af03:0])
	by forward102a.mail.yandex.net (Yandex) with ESMTPS id 1B3F360CAF
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 18:34:08 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-54.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 7YJBQe2LbSw0-mHssoFo4;
	Tue, 15 Apr 2025 18:34:07 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1744731247; bh=fsABN2AKU3S9a7lPzF8jtPi+BjkIO35q5IJV2WyV8rA=;
	h=Message-Id:Date:Cc:Subject:To:From;
	b=nUPbiMATgTDE3X/FjpqnfU0RiTuJPeEbTzi5DQF6gIEJt8+CvBCX/0FeBGv31Izwq
	 tLtVcztw93I9bJTd3Dukt6TRnZ+lGajCCrQzbXUuh7Zzmlq9c8us8tuY1PCvBnZS8o
	 7X2d1Dr1/Adxr5IoF2K7gK9MgL1zl33L/2YmBHBA=
Authentication-Results: mail-nwsmtp-smtp-production-main-54.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: denisova-ok <denisova.olga.k@yandex.ru>
To: openembedded-core@lists.openembedded.org
Cc: denisova-ok <denisova.olga.k@yandex.ru>
Subject: [PATCH] buildstats.py: extend diskstats support for NVMe and flexible token count
Date: Tue, 15 Apr 2025 18:34:04 +0300
Message-Id: <20250415153404.12404-1-denisova.olga.k@yandex.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 15:48:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214950

Added support for NVMe devices in the diskstats regex pattern to ensure s=
tats are properly collected from devices like nvme0n1.

Relaxed the check for the number of fields in /proc/diskstats from an exa=
ct match (14) to a minimum check (at least 14), to handle kernel variatio=
ns and additional fields gracefully.

Signed-off-by: denisova-ok <denisova.olga.k@yandex.ru>
---
 lib/oe/buildstats.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/oe/buildstats.py b/lib/oe/buildstats.py
index 1ffe679801..359ad2a460 100644
--- a/lib/oe/buildstats.py
+++ b/lib/oe/buildstats.py
@@ -66,7 +66,7 @@ class SystemStats:
         self.min_seconds =3D 1.0 - self.tolerance
=20
         self.meminfo_regex =3D re.compile(rb'^(MemTotal|MemFree|Buffers|=
Cached|SwapTotal|SwapFree):\s*(\d+)')
-        self.diskstats_regex =3D re.compile(rb'^([hsv]d.|mtdblock\d|mmcb=
lk\d|cciss/c\d+d\d+.*)$')
+        self.diskstats_regex =3D re.compile(rb'^([hsv]d.|mtdblock\d|mmcb=
lk\d|cciss/c\d+d\d+|nvme\d+n\d+.*)$')
         self.diskstats_ltime =3D None
         self.diskstats_data =3D None
         self.stat_ltimes =3D None
@@ -94,7 +94,7 @@ class SystemStats:
                                (b'MemTotal', b'MemFree', b'Buffers', b'C=
ached', b'SwapTotal', b'SwapFree')]) + b'\n')
=20
     def _diskstats_is_relevant_line(self, linetokens):
-        if len(linetokens) !=3D 14:
+        if len(linetokens) < 14:
             return False
         disk =3D linetokens[2]
         return self.diskstats_regex.match(disk)
--=20
2.34.1


