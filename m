Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9836FC982E1
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 17:41:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3023.1768585291511056856
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 09:41:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58B381682
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 09:41:24 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B2C0F3F59E
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 09:41:30 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] alsa-utils: fix packaging
Date: Fri, 16 Jan 2026 17:41:28 +0000
Message-ID: <20260116174128.1478960-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 17:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229553

In the previous refactoring of this package[1] I forgot to add provides
when merging some packages, which meant that installation of alsa-utils
wouldn't succeed:

  - nothing provides alsa-utils-aplaymidi needed by alsa-utils-1.2.15.1-r=
0.cortexa57 from oe-repo
  - nothing provides alsa-utils-aplaymidi2 needed by alsa-utils-1.2.15.1-=
r0.cortexa57 from oe-repo
  - nothing provides alsa-utils-arecordmidi needed by alsa-utils-1.2.15.1=
-r0.cortexa57 from oe-repo
  - nothing provides alsa-utils-arecordmidi2 needed by alsa-utils-1.2.15.=
1-r0.cortexa57 from oe-repo
  - nothing provides alsa-utils-axfer needed by alsa-utils-1.2.15.1-r0.co=
rtexa57 from oe-repo

This is because the auto-splitting generates a package for each of the
binaries, but there are explicit FILES that take priority which result
in the binaries being in another package.  However, the dependencies
still exist. We could filter the package list after the split, but it is
easier to add RPROVIDES for arecord and a*midi to the relevant packages,
so that the dependencies are satisfied.

Also axfer is a separate tool, so put that in its own package instead of
merging with aplay.

Finally, add a PR, as it appears that dynamically-generated packaging
isn't enough to change the hash, and the wrong packages were being pulled
from sstate.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb b/meta/r=
ecipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
index 927f94afb6..2e85f936fa 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
@@ -11,6 +11,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf3365=
9b29e73d4adb9f9f6552 \
                     file://alsactl/utils.c;beginline=3D3;endline=3D18;md=
5=3D96cc06a4cebe5eb7975688ffb0e65642"
 DEPENDS =3D "alsa-lib ncurses libsamplerate0 bash"
=20
+# Only needed as the dynamic packaging was altered, remove on upgrade
+PR =3D "r1"
+
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
 SRC_URI =3D "https://www.alsa-project.org/files/pub/utils/alsa-utils-${P=
V}.tar.bz2"
 SRC_URI[sha256sum] =3D "5ad79f349e59c30c9a4929ad4995ebee33267473e0e632d7=
c1a30e2b093d3327"
@@ -35,7 +38,7 @@ FILES:${PN}-alsabat      =3D "${sbindir}/alsabat-test.s=
h"
 FILES:${PN}-alsactl      =3D "*/udev/rules.d/90-alsa-restore.rules */*/u=
dev/rules.d/90-alsa-restore.rules ${systemd_unitdir} ${localstatedir}/lib=
/alsa ${datadir}/alsa/init/"
 FILES:${PN}-alsatplg     =3D "${libdir}/alsa-topology"
 FILES:${PN}-amidi        =3D "${bindir}/amidi ${bindir}/aplaymidi* ${bin=
dir}/arecordmidi*"
-FILES:${PN}-aplay        =3D "${bindir}/aplay ${bindir}/arecord ${bindir=
}/axfer"
+FILES:${PN}-aplay        =3D "${bindir}/aplay ${bindir}/arecord"
 FILES:${PN}-speaker-test =3D "${datadir}/sounds/alsa/"
=20
 SUMMARY:${PN}-aconnect       =3D "ALSA sequencer connection manager"
@@ -53,12 +56,16 @@ SUMMARY:${PN}-aplay          =3D "Play (and record) s=
ound files using ALSA"
 SUMMARY:${PN}-aseqdump       =3D "Shows the events received at an ALSA s=
equencer port"
 SUMMARY:${PN}-aseqnet        =3D "Network client/server for ALSA sequenc=
er"
 SUMMARY:${PN}-aseqsend       =3D "Send arbitrary messages to ALSA seqenc=
er port"
+SUMMARY:${PN}-axfer          =3D "Transfer audio data frames"
 SUMMARY:${PN}-iecset         =3D "ALSA utility for setting/showing IEC95=
8 (S/PDIF) status bits"
 SUMMARY:${PN}-nhlt-dmic-info =3D "Dumps microphone array information fro=
m ACPI NHLT table"
 SUMMARY:${PN}-speaker-test   =3D "ALSA surround speaker test utility"
=20
 RRECOMMENDS:${PN}-alsactl =3D "alsa-states"
=20
+RPROVIDES:${PN}-aplay +=3D "${PN}-arecord"
+RPROVIDES:${PN}-amidi +=3D "${PN}-aplaymidi ${PN}-aplaymidi2 ${PN}-areco=
rdmidi ${PN}-arecordmidi2"
+
 do_install:append() {
 	# If udev is disabled, we told configure to install the rules
 	# in /unwanted, so we can remove them now. If udev is enabled,
--=20
2.43.0


