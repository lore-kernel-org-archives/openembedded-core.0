Return-Path: <l.stach@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D51C43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 18:20:22 +0000 (UTC)
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76247.1783016415349249579
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 11:20:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.200.13, mailfrom: l.stach@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 7A8B4202635;
	Thu, 02 Jul 2026 20:20:12 +0200 (CEST)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <l.stach@pengutronix.de>)
	id 1wfM1E-005mnR-17;
	Thu, 02 Jul 2026 20:20:12 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Subject: [PATCH 2/2] seatd: use readyfd2sd to get rid of systemd service startup races
Date: Thu,  2 Jul 2026 20:20:12 +0200
Message-ID: <20260702182012.2240881-2-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702182012.2240881-1-l.stach@pengutronix.de>
References: <20260702182012.2240881-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 18:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240066

Currently systemd has no insight into the startup state of the seatd serv=
er
process, so it might start dependant services too early, causing them to
fail due to being unable to connect to seatd.

Use the readyfd2sd adapter to convert the seatd s6 ready notification to
systemd-notify and switch the service to the notify type to allow systemd
to defer dependant service startup until seatd is ready to accept request=
s.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 ...yfd2sd-to-notify-systemd-about-servi.patch | 34 +++++++++++++++++++
 meta/recipes-core/seatd/seatd_0.9.3.bb        |  3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/seatd/seatd/0001-systemd-use-readyf=
d2sd-to-notify-systemd-about-servi.patch

diff --git a/meta/recipes-core/seatd/seatd/0001-systemd-use-readyfd2sd-to=
-notify-systemd-about-servi.patch b/meta/recipes-core/seatd/seatd/0001-sy=
stemd-use-readyfd2sd-to-notify-systemd-about-servi.patch
new file mode 100644
index 000000000000..59b880bb6f13
--- /dev/null
+++ b/meta/recipes-core/seatd/seatd/0001-systemd-use-readyfd2sd-to-notify=
-systemd-about-servi.patch
@@ -0,0 +1,34 @@
+From b4aa488bd43577ebbf4df5eb1272c724b32bffa9 Mon Sep 17 00:00:00 2001
+From: Lucas Stach <l.stach@pengutronix.de>
+Date: Fri, 7 Nov 2025 21:37:01 +0100
+Subject: [PATCH] systemd: use readyfd2sd to notify systemd about service
+ startup
+
+Currently the example systemd service is racy, as systemd has no insight
+into the startup state of the seatd process. Use the readyfd2sd adapter
+in the service file to let systemd know when seatd is operational.
+
+Upstream-Status: Submitted [https://lists.sr.ht/~kennylevinsen/seatd-dev=
el/patches/70377]
+---
+ contrib/systemd/seatd.service | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/contrib/systemd/seatd.service b/contrib/systemd/seatd.servi=
ce
+index 0460e9e20644..d0b45933b463 100644
+--- a/contrib/systemd/seatd.service
++++ b/contrib/systemd/seatd.service
+@@ -3,9 +3,9 @@ Description=3DSeat management daemon
+ Documentation=3Dman:seatd(1)
+=20
+ [Service]
+-Type=3Dsimple
++Type=3Dnotify
+ # Specify the group you'd like to grant access to seatd
+-ExecStart=3Dseatd -g seat
++ExecStart=3Dreadyfd2sd -- seatd -g seat -n %%n
+ Restart=3Dalways
+ RestartSec=3D1
+=20
+--=20
+2.47.3
+
diff --git a/meta/recipes-core/seatd/seatd_0.9.3.bb b/meta/recipes-core/s=
eatd/seatd_0.9.3.bb
index d0802eee6041..304f72ab0846 100644
--- a/meta/recipes-core/seatd/seatd_0.9.3.bb
+++ b/meta/recipes-core/seatd/seatd_0.9.3.bb
@@ -7,6 +7,7 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D715a99d2dd552e6188e74d4ed2914=
d5a"
=20
 SRC_URI =3D "git://git.sr.ht/~kennylevinsen/seatd;protocol=3Dhttps;branc=
h=3Dmaster \
+           file://0001-systemd-use-readyfd2sd-to-notify-systemd-about-se=
rvi.patch \
            file://init"
 SRCREV =3D "daa8196e10b180b8b0caeafa8e5f860eb1bd6706"
=20
@@ -29,7 +30,7 @@ PACKAGECONFIG ?=3D " \
 "
=20
 PACKAGECONFIG[libseat-builtin] =3D "-Dlibseat-builtin=3Denabled,-Dlibsea=
t-builtin=3Ddisabled"
-PACKAGECONFIG[systemd] =3D "-Dlibseat-logind=3Dsystemd,,systemd"
+PACKAGECONFIG[systemd] =3D "-Dlibseat-logind=3Dsystemd,,systemd,readyfd2=
sd"
=20
 do_install:append() {
         if [ "${VIRTUAL-RUNTIME_init_manager}" !=3D "systemd" ]; then
--=20
2.47.3


