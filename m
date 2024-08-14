Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8642BC3DA4A
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 08:28:09 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.93303.1723624083547390042
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Aug 2024 01:28:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout04.t-online.de (Postfix) with SMTP id 82B057169
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 10:28:01 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.175.216]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1se9MO-1SGzSb0; Wed, 14 Aug 2024 10:28:00 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] systemd: dont set polkit permissions manually
Date: Wed, 14 Aug 2024 10:29:25 +0200
Message-ID: <20240814082925.2666125-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1723624080-C6FFA802-526CAD56/0/0 CLEAN NORMAL
X-TOI-MSGID: c3123ef5-e62c-498d-84e3-7a5374911259
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 08:28:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203309

According to this commit polkit rules should go to ${datadir} instead of =
${sysconfdir}:
https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&id=
=3Dd5e90541f8e35916abc930b2da6de037b23d51a1
Theres no need to adjust the permissions for ${datadir} anymore:
https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&id=
=3D6da0fd21c900e32a0693a6b27d38182f19c8c76c

Dont set polkit permissions manually. This allows to drop the manually
set polkit permissions for all files in meta-openembedded and also for
libvirt in meta-virtualization.

In addition, manually setting the permissions would not be needed for
new recipes anymore.
---
 meta/recipes-core/systemd/systemd_256.bb | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_256.bb b/meta/recipes-core=
/systemd/systemd_256.bb
index 6e3985b94f..d9982eb3a4 100644
--- a/meta/recipes-core/systemd/systemd_256.bb
+++ b/meta/recipes-core/systemd/systemd_256.bb
@@ -370,14 +370,6 @@ do_install() {
 		rm -r ${D}${sysconfdir}/X11
 	fi
=20
-	# If polkit is setup fixup permissions and ownership
-	if ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'true', 'false', d)}=
; then
-		if [ -d ${D}${datadir}/polkit-1/rules.d ]; then
-			chmod 700 ${D}${datadir}/polkit-1/rules.d
-			chown polkitd:root ${D}${datadir}/polkit-1/rules.d
-		fi
-	fi
-
 	# If polkit is not available and a fallback was requested, install a dr=
op-in that allows networkd to
 	# request hostname changes via DBUS without elevating its privileges
 	if ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', '=
true', 'false', d)}; then
@@ -473,7 +465,7 @@ GROUPADD_PARAM:udev =3D "-r render"
 GROUPADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'polkit=
_hostnamed_fallback', '-r systemd-hostname;', '', d)}"
 USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'coredum=
p', '--system -d / -M --shell /sbin/nologin systemd-coredump;', '', d)}"
 USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'network=
d', '--system -d / -M --shell /sbin/nologin systemd-network;', '', d)}"
-USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'polkit'=
, '--system --no-create-home --user-group --home-dir ${sysconfdir}/polkit=
-1 polkitd;', '', d)}"
+USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'polkit'=
, '--system --no-create-home --user-group --home-dir ${datadir}/polkit-1 =
polkitd;', '', d)}"
 USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'resolve=
d', '--system -d / -M --shell /sbin/nologin systemd-resolve;', '', d)}"
 USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'timesyn=
cd', '--system -d / -M --shell /sbin/nologin systemd-timesync;', '', d)}"
 USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'oomd', =
'--system -d / -M --shell /sbin/nologin systemd-oom;', '', d)}"
--=20
2.45.2


