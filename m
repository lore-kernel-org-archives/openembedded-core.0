Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7EB5C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 16:43:14 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web12.13705.1644338593670250104
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 08:43:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18,
 mailfrom: f_l_k@t-online.de)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout04.t-online.de (Postfix) with SMTP id E5C2479D
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Feb 2022 17:43:10 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.35.191]) by fwd84.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nHTaA-25Obs90; Tue, 8 Feb 2022 17:43:10 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [OE-core][PATCH] seatd: build systemd backend if DISTRO_FEATURE
 systemd is set
Date: Tue,  8 Feb 2022 17:42:59 +0100
Message-Id: <20220208164259.4017-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1644338590-00009E39-B934156D/0/0 CLEAN NORMAL
X-TOI-MSGID: f86e27e2-8852-4b93-a47d-dd215f567ea0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 16:43:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161523

Add libsystemd dependency if we have systemd in DISTRO_FEATURES.
This is needed to build the systemd backend. Projects that use seatd
to hook into logind (e.g. wlroots) fail to properly login without it.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-core/seatd/seatd_0.6.3.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/seatd/seatd_0.6.3.bb b/meta/recipes-core/s=
eatd/seatd_0.6.3.bb
index 0e1a79dddf..abc8583087 100644
--- a/meta/recipes-core/seatd/seatd_0.6.3.bb
+++ b/meta/recipes-core/seatd/seatd_0.6.3.bb
@@ -13,9 +13,13 @@ S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig update-rc.d
=20
-PACKAGECONFIG ?=3D "libseat-builtin"
+PACKAGECONFIG ?=3D " \
+	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
+	libseat-builtin \
+"
=20
 PACKAGECONFIG[libseat-builtin] =3D "-Dlibseat-builtin=3Denabled,-Dlibsea=
t-builtin=3Ddisabled"
+PACKAGECONFIG[systemd] =3D ",,systemd"
=20
 do_install:append() {
         if [ "${VIRTUAL-RUNTIME_init_manager}" !=3D "systemd" ]; then
@@ -26,4 +30,3 @@ do_install:append() {
 INITSCRIPT_NAME =3D "seatd"
 INITSCRIPT_PARAMS =3D "start 9 5 2 . stop 20 0 1 6 ."
 INHIBIT_UPDATERCD_BBCLASS =3D "${@oe.utils.conditional('VIRTUAL-RUNTIME_=
init_manager', 'systemd', '1', '', d)}"
-
--=20
2.25.1


