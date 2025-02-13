Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A8CC021A9
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 20:02:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.3753.1739476938939129083
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 12:02:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27BAC1682
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 12:02:39 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 37BD23F58B
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 12:02:18 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] systemd-serialgetty: use existing unit files in systemd
Date: Thu, 13 Feb 2025 20:02:10 +0000
Message-ID: <20250213200212.1694055-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250213200212.1694055-1-ross.burton@arm.com>
References: <20250213200212.1694055-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 20:02:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211366

Now that systemd isn't deleting the serial-getty@.service unit template
files, we can simply symlink to the files provided by systemd instead of
shipping a copy of them in this recipe.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../systemd/systemd-serialgetty.bb            | 12 +----
 .../systemd-serialgetty/serial-getty@.service | 45 -------------------
 2 files changed, 1 insertion(+), 56 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd-serialgetty/serial-=
getty@.service

diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/reci=
pes-core/systemd/systemd-serialgetty.bb
index 7b525b10f0c..3798b07b1a8 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -10,12 +10,6 @@ LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/co=
mmon-licenses/GPL-2.0-only;m
 # should only be used if the generator is not appropriate.
=20
 SERIAL_CONSOLES ?=3D "115200;ttyS0"
-SERIAL_TERM ?=3D "linux"
-
-SRC_URI =3D "file://serial-getty@.service"
-
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
=20
 # As this package is tied to systemd, only build it when we're also buil=
ding systemd.
 inherit features_check
@@ -25,11 +19,7 @@ REQUIRED_DISTRO_FEATURES +=3D "usrmerge"
 do_install() {
 	if [ ! -z "${SERIAL_CONSOLES}" ] ; then
 		default_baudrate=3D`echo "${SERIAL_CONSOLES}" | sed 's/\;.*//'`
-		install -d ${D}${systemd_system_unitdir}/
 		install -d ${D}${sysconfdir}/systemd/system/getty.target.wants/
-		install -m 0644 ${S}/serial-getty@.service ${D}${systemd_system_unitdi=
r}/
-		sed -i -e "s/\@BAUDRATE\@/$default_baudrate/g" ${D}${systemd_system_un=
itdir}/serial-getty@.service
-		sed -i -e "s/\@TERM\@/${SERIAL_TERM}/g" ${D}${systemd_system_unitdir}/=
serial-getty@.service
=20
 		tmp=3D"${SERIAL_CONSOLES}"
 		for entry in $tmp ; do
@@ -52,7 +42,7 @@ do_install() {
 }
=20
 # This is a machine specific file
-FILES:${PN} =3D "${systemd_system_unitdir}/*.service ${sysconfdir}"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+FILES:${PN} =3D "${sysconfdir}"
=20
 ALLOW_EMPTY:${PN} =3D "1"
diff --git a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.=
service b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.ser=
vice
deleted file mode 100644
index b16fe1188e7..00000000000
--- a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
+++ /dev/null
@@ -1,45 +0,0 @@
-#  SPDX-License-Identifier: LGPL-2.1+
-#
-#  This file is part of systemd.
-#
-#  systemd is free software; you can redistribute it and/or modify it
-#  under the terms of the GNU Lesser General Public License as published=
 by
-#  the Free Software Foundation; either version 2.1 of the License, or
-#  (at your option) any later version.
-
-[Unit]
-Description=3DSerial Getty on %I
-Documentation=3Dman:agetty(8) man:systemd-getty-generator(8)
-Documentation=3Dhttp://0pointer.de/blog/projects/serial-console.html
-PartOf=3Ddev-%i.device
-ConditionPathExists=3D/dev/%i
-After=3Ddev-%i.device systemd-user-sessions.service plymouth-quit-wait.s=
ervice getty-pre.target
-After=3Drc-local.service
-
-# If additional gettys are spawned during boot then we should make
-# sure that this is synchronized before getty.target, even though
-# getty.target didn't actually pull it in.
-Before=3Dgetty.target
-IgnoreOnIsolate=3Dyes
-
-# IgnoreOnIsolate causes issues with sulogin, if someone isolates
-# rescue.target or starts rescue.service from multi-user.target or
-# graphical.target.
-Conflicts=3Drescue.service
-Before=3Drescue.service
-
-[Service]
-Environment=3D"TERM=3D@TERM@"
-ExecStart=3D-/sbin/agetty -8 -L %I @BAUDRATE@ $TERM
-Type=3Didle
-Restart=3Dalways
-UtmpIdentifier=3D%I
-TTYPath=3D/dev/%I
-TTYReset=3Dyes
-TTYVHangup=3Dyes
-KillMode=3Dprocess
-IgnoreSIGPIPE=3Dno
-SendSIGHUP=3Dyes
-
-[Install]
-WantedBy=3Dgetty.target
--=20
2.43.0


