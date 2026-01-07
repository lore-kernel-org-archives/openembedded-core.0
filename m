Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F75DCFD65C
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 15:38:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8704.1767800290962706149
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 07:38:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE1B6497
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 07:38:03 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3C2EF3F5A1
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 07:38:10 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] alsa-utils: dynamically split the packages instead of doing it manually
Date: Wed,  7 Jan 2026 15:38:02 +0000
Message-ID: <20260107153803.2905889-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107153803.2905889-1-ross.burton@arm.com>
References: <20260107153803.2905889-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 15:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229010

Instead of hard-coding a long list of packages and the FILES, we can
use do_split_packages to do the bulk of the work for us.

Leave the SUMMARY (and add some which were missing) and the FILES that
are needed to catch extra files for each package.

This removes the alsa-utils-scripts package which only existed to isolate
the bash depedencies, and instead adds separate -alsaconf and -alsa-info
packages for each of the scripts.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../alsa/alsa-utils_1.2.15.bb                 | 120 +++++++-----------
 1 file changed, 45 insertions(+), 75 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb b/meta/rec=
ipes-multimedia/alsa/alsa-utils_1.2.15.bb
index e528591ec6..84b196a020 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb
@@ -9,7 +9,13 @@ SECTION =3D "console/utils"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552 \
                     file://alsactl/utils.c;beginline=3D3;endline=3D18;md=
5=3D96cc06a4cebe5eb7975688ffb0e65642"
-DEPENDS =3D "alsa-lib ncurses libsamplerate0"
+DEPENDS =3D "alsa-lib ncurses libsamplerate0 bash"
+
+SRC_URI =3D "https://www.alsa-project.org/files/pub/utils/alsa-utils-${P=
V}.tar.bz2 \
+           file://0001-alsactl-fix-build-when-in-subdirectory.patch"
+SRC_URI[sha256sum] =3D "d3183d2ed2d69e9143c5beb97036267c3fdabfe8bfbea8bc=
6863f17b1f0b568e"
+
+inherit autotools gettext pkgconfig manpages
=20
 PACKAGECONFIG ??=3D "udev"
=20
@@ -23,90 +29,54 @@ PACKAGECONFIG[bat] =3D "--enable-bat,--disable-bat,ff=
twf"
 PACKAGECONFIG[udev] =3D ",--with-udev-rules-dir=3D/unwanted/rules.d,udev=
"
 PACKAGECONFIG[manpages] =3D "--enable-rst2man --enable-xmlto, --disable-=
rst2man --disable-xmlto, python3-docutils-native xmlto-native docbook-xml=
-dtd4-native docbook-xsl-stylesheets-native"
=20
-# alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
-SRC_URI =3D "https://www.alsa-project.org/files/pub/utils/alsa-utils-${P=
V}.tar.bz2 \
-	   file://0001-alsactl-fix-build-when-in-subdirectory.patch"
-SRC_URI[sha256sum] =3D "d3183d2ed2d69e9143c5beb97036267c3fdabfe8bfbea8bc=
6863f17b1f0b568e"
-
-inherit autotools gettext pkgconfig manpages
-
-# This are all packages that we need to make. Also, the now empty alsa-u=
tils
-# ipk depends on them.
-
-ALSA_UTILS_PKGS =3D "\
-             ${@bb.utils.contains('PACKAGECONFIG', 'bat', 'alsa-utils-al=
sabat', '', d)} \
-             alsa-utils-alsamixer \
-             alsa-utils-alsatplg \
-             alsa-utils-midi \
-             alsa-utils-aplay \
-             alsa-utils-amixer \
-             alsa-utils-aconnect \
-             alsa-utils-iecset \
-             alsa-utils-speakertest \
-             alsa-utils-aseqnet \
-             alsa-utils-aseqdump \
-             alsa-utils-aseqsend \
-             alsa-utils-alsactl \
-             alsa-utils-alsaloop \
-             alsa-utils-alsaucm \
-             alsa-utils-scripts \
-             alsa-utils-nhltdmicinfo \
-            "
-
-PACKAGES +=3D "${ALSA_UTILS_PKGS}"
-RDEPENDS:${PN} +=3D "${ALSA_UTILS_PKGS}"
-
+# alsa-utils is an empty meta-package
 FILES:${PN} =3D ""
-ALLOW_EMPTY:alsa-utils =3D "1"
-FILES:alsa-utils-alsabat     =3D "${bindir}/alsabat"
-FILES:alsa-utils-alsatplg    =3D "${bindir}/alsatplg ${libdir}/alsa-topo=
logy"
-FILES:alsa-utils-aplay       =3D "${bindir}/aplay ${bindir}/arecord ${bi=
ndir}/axfer"
-FILES:alsa-utils-amixer      =3D "${bindir}/amixer"
-FILES:alsa-utils-alsamixer   =3D "${bindir}/alsamixer"
-FILES:alsa-utils-speakertest =3D "${bindir}/speaker-test ${datadir}/soun=
ds/alsa/ ${datadir}/alsa/speaker-test/"
-FILES:alsa-utils-midi        =3D "${bindir}/aplaymidi* ${bindir}/arecord=
midi* ${bindir}/amidi"
-FILES:alsa-utils-aconnect    =3D "${bindir}/aconnect"
-FILES:alsa-utils-aseqnet     =3D "${bindir}/aseqnet"
-FILES:alsa-utils-aseqsend    =3D "${bindir}/aseqsend"
-FILES:alsa-utils-iecset      =3D "${bindir}/iecset"
-FILES:alsa-utils-alsactl     =3D "${sbindir}/alsactl */udev/rules.d/90-a=
lsa-restore.rules */*/udev/rules.d/90-alsa-restore.rules ${systemd_unitdi=
r} ${localstatedir}/lib/alsa ${datadir}/alsa/init/"
-FILES:alsa-utils-aseqdump    =3D "${bindir}/aseqdump"
-FILES:alsa-utils-alsaloop    =3D "${bindir}/alsaloop"
-FILES:alsa-utils-alsaucm     =3D "${bindir}/alsaucm */udev/rules.d/89-al=
sa-ucm.rules */*/udev/rules.d/89-alsa-ucm.rules"
-FILES:alsa-utils-scripts     =3D "${sbindir}/alsaconf \
-               ${sbindir}/alsa-info.sh \
-               ${sbindir}/alsabat-test.sh \
-              "
-FILES:alsa-utils-nhltdmicinfo =3D "${bindir}/nhlt-dmic-info"
+ALLOW_EMPTY:${PN} =3D "1"
=20
-SUMMARY:alsa-utils-alsabat      =3D "Command-line sound tester for ALSA =
sound card driver"
-SUMMARY:alsa-utils-alsatplg     =3D "Converts topology text files into b=
inary format for kernel"
-SUMMARY:alsa-utils-aplay        =3D "Play (and record) sound files using=
 ALSA"
-SUMMARY:alsa-utils-amixer       =3D "Command-line control for ALSA mixer=
 and settings"
-SUMMARY:alsa-utils-alsamixer    =3D "ncurses-based control for ALSA mixe=
r and settings"
-SUMMARY:alsa-utils-speakertest  =3D "ALSA surround speaker test utility"
-SUMMARY:alsa-utils-midi         =3D "Miscellaneous MIDI utilities for AL=
SA"
-SUMMARY:alsa-utils-aconnect     =3D "ALSA sequencer connection manager"
-SUMMARY:alsa-utils-aseqnet      =3D "Network client/server for ALSA sequ=
encer"
-SUMMARY:alsa-utils-iecset       =3D "ALSA utility for setting/showing IE=
C958 (S/PDIF) status bits"
-SUMMARY:alsa-utils-alsactl      =3D "Saves/restores ALSA-settings in /et=
c/asound.state"
-SUMMARY:alsa-utils-aseqdump     =3D "Shows the events received at an ALS=
A sequencer port"
-SUMMARY:alsa-utils-alsaloop     =3D "ALSA PCM loopback utility"
-SUMMARY:alsa-utils-alsaucm      =3D "ALSA Use Case Manager"
-SUMMARY:alsa-utils-scripts      =3D "Shell scripts that show help info a=
nd create ALSA configuration files"
-SUMMARY:alsa-utils-nhltdmicinfo =3D "Dumps microphone array information =
from ACPI NHLT table"
+FILES:${PN}-alsabat      =3D "${sbindir}/alsabat-test.sh"
+FILES:${PN}-alsactl      =3D "*/udev/rules.d/90-alsa-restore.rules */*/u=
dev/rules.d/90-alsa-restore.rules ${systemd_unitdir} ${localstatedir}/lib=
/alsa ${datadir}/alsa/init/"
+FILES:${PN}-alsatplg     =3D "${libdir}/alsa-topology"
+FILES:${PN}-amidi        =3D "${bindir}/amidi ${bindir}/aplaymidi* ${bin=
dir}/arecordmidi*"
+FILES:${PN}-aplay        =3D "${bindir}/aplay ${bindir}/arecord ${bindir=
}/axfer"
+FILES:${PN}-speaker-test =3D "${datadir}/sounds/alsa/"
=20
-RRECOMMENDS:alsa-utils-alsactl =3D "alsa-states"
+SUMMARY:${PN}-aconnect       =3D "ALSA sequencer connection manager"
+SUMMARY:${PN}-alsabat        =3D "Command-line sound tester for ALSA sou=
nd card driver"
+SUMMARY:${PN}-alsaconf       =3D "ALSA driver configurator script"
+SUMMARY:${PN}-alsactl        =3D "Saves/restores ALSA-settings in /etc/a=
sound.state"
+SUMMARY:${PN}-alsa-info      =3D "Gather information about ALSA subsyste=
m"
+SUMMARY:${PN}-alsaloop       =3D "ALSA PCM loopback utility"
+SUMMARY:${PN}-alsamixer      =3D "ncurses-based control for ALSA mixer a=
nd settings"
+SUMMARY:${PN}-alsatplg       =3D "Converts topology text files into bina=
ry format for kernel"
+SUMMARY:${PN}-alsaucm        =3D "ALSA Use Case Manager"
+SUMMARY:${PN}-amidi          =3D "Miscellaneous MIDI utilities for ALSA"
+SUMMARY:${PN}-amixer         =3D "Command-line control for ALSA mixer an=
d settings"
+SUMMARY:${PN}-aplay          =3D "Play (and record) sound files using AL=
SA"
+SUMMARY:${PN}-aseqdump       =3D "Shows the events received at an ALSA s=
equencer port"
+SUMMARY:${PN}-aseqnet        =3D "Network client/server for ALSA sequenc=
er"
+SUMMARY:${PN}-aseqsend       =3D "Send arbitrary messages to ALSA seqenc=
er port"
+SUMMARY:${PN}-iecset         =3D "ALSA utility for setting/showing IEC95=
8 (S/PDIF) status bits"
+SUMMARY:${PN}-nhlt-dmic-info =3D "Dumps microphone array information fro=
m ACPI NHLT table"
+SUMMARY:${PN}-speaker-test   =3D "ALSA surround speaker test utility"
=20
-do_install() {
-	autotools_do_install
+RRECOMMENDS:${PN}-alsactl =3D "alsa-states"
=20
+do_install:append() {
 	# If udev is disabled, we told configure to install the rules
 	# in /unwanted, so we can remove them now. If udev is enabled,
 	# then /unwanted won't exist and this will have no effect.
 	rm -rf ${D}/unwanted
 }
=20
+python populate_packages:prepend() {
+    pn =3D d.getVar("PN")
+    packages =3D do_split_packages(d, d.getVar("bindir"), r"^([^.]+).*$"=
, pn + "-%s", "alsa-utils tool %s", extra_depends=3D"")
+    packages +=3D do_split_packages(d, d.getVar("sbindir"), r"^([^.]+).*=
$", pn + "-%s", "alsa-utils tool %s", extra_depends=3D"")
+    d.setVar("RDEPENDS:" + pn, " ".join(packages))
+}
+
 PROVIDES =3D "alsa-utils-alsaconf alsa-utils-scripts"
=20
-RDEPENDS:${PN}-scripts +=3D "bash"
+RDEPENDS:${PN}-alsa-info +=3D "bash"
+RDEPENDS:${PN}-alsabat +=3D "bash"
+RDEPENDS:${PN}-alsaconf +=3D "bash"
--=20
2.43.0


