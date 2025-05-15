Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4A78C3ABD8
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 04:32:52 +0000 (UTC)
Received: from forward101b.mail.yandex.net (forward101b.mail.yandex.net [178.154.239.148])
 by mx.groups.io with SMTP id smtpd.web10.2042.1747342691761785516
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 13:58:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yandex.ru header.s=mail header.b=LzSxGn3d;
 spf=pass (domain: yandex.ru, ip: 178.154.239.148, mailfrom: denisova.olga.k@yandex.ru)
Received: from mail-nwsmtp-smtp-production-main-60.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-60.sas.yp-c.yandex.net [IPv6:2a02:6b8:c11:109b:0:640:c015:0])
	by forward101b.mail.yandex.net (Yandex) with ESMTPS id B6EE260B66
	for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 23:58:07 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-60.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 6wPJF53Lc8c0-BNykDa51;
	Thu, 15 May 2025 23:58:07 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1747342687; bh=Pb0XOK1dBz+pw02tX/mQaffQGSia21oYmJQGwTN5j7Y=;
	h=Message-Id:Date:Cc:Subject:To:From;
	b=LzSxGn3diak/1f5rid/uRRtLUz8GDyqcW0o1WHwp5UGW3XGirfHiOBuGrBYkpShfn
	 DKi6Xj3Jev2jxEJLPa7c1s7Z0blERDICsF/bXvL15Zy1vH9rGtqQ3zd6P/QSzlKB4t
	 1usejgjLW477b5DD4stPQLDfJtrL5s2Znmf08gqs=
Authentication-Results: mail-nwsmtp-smtp-production-main-60.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: denisova-ok <denisova.olga.k@yandex.ru>
To: openembedded-core@lists.openembedded.org
Cc: Olga Denisova <denisova.olga.k@yandex.ru>
Subject: [OE-core][PATCH v2] buildstats.py: Add tracking of network I/O per interface
Date: Thu, 15 May 2025 23:57:52 +0300
Message-Id: <20250515205752.6127-1-denisova.olga.k@yandex.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 04:32:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216719

From: Olga Denisova <denisova.olga.k@yandex.ru>

This patch extends SystemStats to collect and store data from /proc/net/d=
ev. It extracts per-interface received and transmitted bytes, calculates =
deltas between samples, and stores them for further analysis.

Useful for identifying network bottlenecks during long-running builds.

Sample output: https://drive.google.com/file/d/1PwC65VAQswPaJC95g08EOIEEF=
bIqkyhC/view?usp=3Dsharing

The file presents a sample log file generated as a result of applying the=
 patch. The entries in the log file follow the format:
<timestamp>
<interface0>: <received_bytes>, <transmitted_bytes>, <receive_delta>, <tr=
ansmit_delta>
<interface1>: <received_bytes>, <transmitted_bytes>, <receive_delta>, <tr=
ansmit_delta>
...

Each entry reflects the state of network interfaces at a fixed point in t=
ime, including the cumulative number of bytes received and transmitted, a=
s well as their deltas (differences) compared to the previous measurement=
.

The collected data can be useful for network analysis in a number of scen=
arios:

- The maintenance or convergence of the receive_delta or transmit_delta v=
alues of an interface towards a constant may indicate the achievement of =
the network interface's maximum load or a server's upload speed limit, wh=
ich could potentially point to a network bottleneck.
- Network load indicators may suggest congestion in the data transmission=
 channel, and this information could potentially be used for adaptive man=
agement of the do_fetch task execution.
- The receive_delta and transmit_delta values can be useful in analyzing =
overall I/O load, as they help clarify the nature of the load =E2=80=94 w=
hether it's network-related or disk-related.

v2:
- Added sample output into the commit message
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


