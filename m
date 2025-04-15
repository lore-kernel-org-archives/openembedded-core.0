Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C590FC369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 16:20:39 +0000 (UTC)
Received: from forward102b.mail.yandex.net (forward102b.mail.yandex.net [178.154.239.149])
 by mx.groups.io with SMTP id smtpd.web10.24402.1744733783803007282
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 09:16:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yandex.ru header.s=mail header.b=MdhyndAY;
 spf=pass (domain: yandex.ru, ip: 178.154.239.149, mailfrom: denisova.olga.k@yandex.ru)
Received: from mail-nwsmtp-smtp-production-main-70.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-70.sas.yp-c.yandex.net [IPv6:2a02:6b8:c23:2129:0:640:f8ac:0])
	by forward102b.mail.yandex.net (Yandex) with ESMTPS id 9D60D60A2E
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 19:16:20 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-70.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id JGK00G3LliE0-U5L8Btcg;
	Tue, 15 Apr 2025 19:16:20 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1744733780; bh=E+eKx4gKA1cXT1X62Mj8GaRykqX/Fdmzbh0Dn6wSMns=;
	h=Message-Id:Date:Cc:Subject:To:From;
	b=MdhyndAYBE1kFeNd4tFCm98nbriSKK4sqvzylp/Bc0MXxEUtC7MhGBWxBzpiSU1mG
	 CWwO8BFnBL4+92DqOJKWz/H84bEB6JJnMqU34GruFfu2eru6vwhQ36qZ23ubKD9EhQ
	 fxwBH4O2YrQS8pt4oRNBSnJfoI6my6QNsIjPYjnk=
Authentication-Results: mail-nwsmtp-smtp-production-main-70.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: denisova.olga.k@yandex.ru
To: openembedded-core@lists.openembedded.org
Cc: Olga Denisova <denisova.olga.k@yandex.ru>
Subject: [PATCH] buildstats.py: Add tracking of network I/O per interface
Date: Tue, 15 Apr 2025 19:16:15 +0300
Message-Id: <20250415161615.14743-1-denisova.olga.k@yandex.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 16:20:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214955

From: Olga Denisova <denisova.olga.k@yandex.ru>

This patch extends SystemStats to collect and store data from /proc/net/d=
ev.
It extracts per-interface received and transmitted bytes, calculates delt=
as
between samples, and stores them for further analysis.

Useful for identifying network bottlenecks during long-running builds.

Signed-off-by: denisova-ok <denisova.olga.k@yandex.ru>
---
 lib/oe/buildstats.py | 43 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/lib/oe/buildstats.py b/lib/oe/buildstats.py
index 1ffe679801..6f5dad953c 100644
--- a/lib/oe/buildstats.py
+++ b/lib/oe/buildstats.py
@@ -10,6 +10,7 @@
 import time
 import re
 import bb.event
+from collections import deque
=20
 class SystemStats:
     def __init__(self, d):
@@ -18,7 +19,8 @@ class SystemStats:
         bb.utils.mkdirhier(bsdir)
         file_handlers =3D  [('diskstats', self._reduce_diskstats),
                             ('meminfo', self._reduce_meminfo),
-                            ('stat', self._reduce_stat)]
+                            ('stat', self._reduce_stat),
+                            ('net/dev', self._reduce_net)]
=20
         # Some hosts like openSUSE have readable /proc/pressure files
         # but throw errors when these files are opened. Catch these erro=
r
@@ -47,7 +49,10 @@ class SystemStats:
                 # not strictly necessary, but using it makes the class
                 # more robust should two processes ever write
                 # concurrently.
-                destfile =3D os.path.join(bsdir, '%sproc_%s.log' % ('red=
uced_' if handler else '', filename))
+                if filename =3D=3D 'net/dev':
+                    destfile =3D os.path.join(bsdir, 'reduced_proc_net.l=
og')
+                else:
+                    destfile =3D os.path.join(bsdir, '%sproc_%s.log' % (=
'reduced_' if handler else '', filename))
                 self.proc_files.append((filename, open(destfile, 'ab'), =
handler))
         self.monitor_disk =3D open(os.path.join(bsdir, 'monitor_disk.log=
'), 'ab')
         # Last time that we sampled /proc data resp. recorded disk monit=
oring data.
@@ -72,6 +77,7 @@ class SystemStats:
         self.stat_ltimes =3D None
         # Last time we sampled /proc/pressure. All resources stored in a=
 single dict with the key as filename
         self.last_pressure =3D {"pressure/cpu": None, "pressure/io": Non=
e, "pressure/memory": None}
+        self.net_stats =3D {}
=20
     def close(self):
         self.monitor_disk.close()
@@ -93,6 +99,39 @@ class SystemStats:
                     b' '.join([values[x] for x in
                                (b'MemTotal', b'MemFree', b'Buffers', b'C=
ached', b'SwapTotal', b'SwapFree')]) + b'\n')
=20
+    def _reduce_net(self, time, data, filename):
+        data =3D data.split(b'\n')
+        for line in data[2:]:
+            if b":" not in line:
+                continue
+            try:
+                parts =3D line.split()
+                iface =3D (parts[0].strip(b':')).decode('ascii')
+                receive_bytes =3D int(parts[1])
+                transmit_bytes =3D int(parts[9])
+            except Exception:
+                continue
+
+            if iface not in self.net_stats:
+                self.net_stats[iface] =3D deque(maxlen=3D2)
+                self.net_stats[iface].append((receive_bytes, transmit_by=
tes, 0, 0))
+            prev =3D self.net_stats[iface][-1] if self.net_stats[iface] =
else (0, 0, 0, 0)           =20
+            receive_diff =3D receive_bytes - prev[0]
+            transmit_diff =3D transmit_bytes - prev[1]
+            self.net_stats[iface].append((
+                receive_bytes,
+                transmit_bytes,
+                receive_diff,
+                transmit_diff
+            ))
+
+        result_str =3D "\n".join(
+            f"{iface}: {net_data[-1][0]} {net_data[-1][1]} {net_data[-1]=
[2]} {net_data[-1][3]}"
+            for iface, net_data in self.net_stats.items()
+        ) + "\n"
+
+        return time, result_str.encode('ascii')
+
     def _diskstats_is_relevant_line(self, linetokens):
         if len(linetokens) !=3D 14:
             return False
--=20
2.34.1


