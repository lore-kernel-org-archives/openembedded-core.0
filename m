Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85054E9A04B
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 20:39:21 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1123.1771447159487415085
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 12:39:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout01.t-online.de (Postfix) with SMTP id 346B41CAA8
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 21:39:16 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.40.86]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vsoKF-12o2dN0; Wed, 18 Feb 2026 21:39:11 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] dbus: disable ptest if using dbus-broker
Date: Wed, 18 Feb 2026 21:38:44 +0100
Message-ID: <20260218203844.2846590-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1771447151-127F649A-E961B488/0/0 CLEAN NORMAL
X-TOI-MSGID: 41136795-a97d-42c2-bdc0-557719755577
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 20:39:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231412

'inherit ptest' adds a runtime dependency on ${PN} that conflicts with
'RCONFLICTS:${PN} =3D "dbus"' in the dbus-broker recipe.

This commit attempts to fix an issue where VIRTUAL-RUNTIME_dbus is set to
'dbus-broker' and ptest is included in DISTRO_FEATURES by installing ptes=
t
only when dbus is used as the daemon.

Otherwise do_rootfs fails with:
Error:
 Problem: package libsdbus-c++-ptest-2.2.1-r0.corei7_64 from oe-repo requ=
ires dbus-broker, but none of the providers can be installed
  - package dbus-broker-37-r0.corei7_64 from @System conflicts with dbus =
provided by dbus-1-1.16.2-r0.corei7_64 from oe-repo
  - package dbus-broker-37-r0.corei7_64 from oe-repo conflicts with dbus =
provided by dbus-1-1.16.2-r0.corei7_64 from oe-repo
  - package dbus-ptest-1.16.2-r0.corei7_64 from oe-repo requires dbus, bu=
t none of the providers can be installed
  - conflicting requests

As far as I know, dbus-broker is only meant to replace the daemon itself,
but it uses the same environment as dbus and is still dependent on parts =
of the
dbus recipe. A more robust solution would therefore be to remove the line
containing RCONFLICTS from 'dbus-broker', since dbus and dbus-broker are =
not
technically mutually exclusive as long as you don't run both at the same =
time.
However, I'm aware that this was done for the sake of cleanliness.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-core/dbus/dbus_1.16.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus_1.16.2.bb b/meta/recipes-core/db=
us/dbus_1.16.2.bb
index abe4196d9a..bc7fe80db2 100644
--- a/meta/recipes-core/dbus/dbus_1.16.2.bb
+++ b/meta/recipes-core/dbus/dbus_1.16.2.bb
@@ -3,7 +3,8 @@ DESCRIPTION =3D "D-Bus is a message bus system, a simple =
way for applications to t
 HOMEPAGE =3D "https://dbus.freedesktop.org"
 SECTION =3D "base"
=20
-inherit meson pkgconfig gettext upstream-version-is-even ptest-gnome
+inherit_defer ${@bb.utils.contains('VIRTUAL-RUNTIME_dbus', 'dbus', 'ptes=
t-gnome', '', d)}
+inherit meson pkgconfig gettext upstream-version-is-even
=20
 LICENSE =3D "AFL-2.1 | GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb0ffc69a965797a3d6686baa153e=
f05 \
--=20
2.52.0


