Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A44D37E2E
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 13:09:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9555.1768396184260439304
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 05:09:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F00211515
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 05:09:36 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5635B3F59E
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 05:09:43 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libinput: expand PACKAGECONFIG
Date: Wed, 14 Jan 2026 13:09:39 +0000
Message-ID: <20260114130939.3263867-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 13:09:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229325

The 1.30 release added support for Lua plugins, so add a
disabled-by-default PACKAGECONFIG for the Lua plugin support.

Move mtdev from being always on to an enabled-by-default PACKAGECONFIG.

Merge the udevdir evaluation directly into EXTRA_OEMESON, there's no
need for it to be a separate variable.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/wayland/libinput_1.30.1.bb | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/wayland/libinput_1.30.1.bb b/meta/reci=
pes-graphics/wayland/libinput_1.30.1.bb
index 8309d33304..8d80e1ac62 100644
--- a/meta/recipes-graphics/wayland/libinput_1.30.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.30.1.bb
@@ -10,7 +10,7 @@ SECTION =3D "libs"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbab4ac7dc1c10bc0fb037dc76c46e=
f8a"
=20
-DEPENDS =3D "libevdev udev mtdev"
+DEPENDS =3D "libevdev udev"
=20
 SRC_URI =3D "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=
=3Dhttps;branch=3D1.30-branch;tag=3D${PV} \
            file://run-ptest \
@@ -22,6 +22,7 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+\.\d+\.(?!9=
\d+)\d+)"
 inherit meson pkgconfig lib_package ptest
=20
 # Patch out build directory, otherwise it leaks into ptest binary
+# https://gitlab.freedesktop.org/libinput/libinput/-/issues/1230
 do_configure:append() {
     sed -i -e "s,${WORKDIR},,g" config.h
     if [ -e "litest-config.h" ]; then
@@ -29,14 +30,14 @@ do_configure:append() {
     fi
 }
=20
-PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests',=
 '', d)}"
-PACKAGECONFIG[libwacom] =3D "-Dlibwacom=3Dtrue,-Dlibwacom=3Dfalse,libwac=
om"
+PACKAGECONFIG ??=3D "mtdev ${@bb.utils.contains('PTEST_ENABLED', '1', 't=
ests', '', d)}"
 PACKAGECONFIG[gui] =3D "-Ddebug-gui=3Dtrue,-Ddebug-gui=3Dfalse,cairo gtk=
+3 wayland-native"
+PACKAGECONFIG[lua] =3D "-Dlua-plugins=3Denabled,-Dlua-plugins=3Ddisabled=
,lua"
+PACKAGECONFIG[libwacom] =3D "-Dlibwacom=3Dtrue,-Dlibwacom=3Dfalse,libwac=
om"
+PACKAGECONFIG[mtdev] =3D "-Dmtdev=3Dtrue,-Dmtdev=3Dfalse,mtdev"
 PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue -Dinstall-tests=3Dtrue,-Dtests=3D=
false -Dinstall-tests=3Dfalse"
=20
-UDEVDIR =3D "`pkg-config --variable=3Dudevdir udev`"
-
-EXTRA_OEMESON +=3D "-Dudev-dir=3D${UDEVDIR} \
+EXTRA_OEMESON +=3D "-Dudev-dir=3D$(pkg-config --variable=3Dudevdir udev)=
 \
                   -Ddocumentation=3Dfalse \
                   -Dzshcompletiondir=3Dno"
=20
--=20
2.43.0


