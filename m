Return-Path: <l.stach@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB312C44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:13:59 +0000 (UTC)
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3081.1784110428368245362
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:13:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.200.13, mailfrom: l.stach@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 6311F20221B;
	Wed, 15 Jul 2026 12:13:45 +0200 (CEST)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <l.stach@pengutronix.de>)
	id 1wjwcb-001v6M-0r;
	Wed, 15 Jul 2026 12:13:45 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Subject: [PATCH v2 1/2] readyfd2sd: add recipe
Date: Wed, 15 Jul 2026 12:13:44 +0200
Message-ID: <20260715101345.274000-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 10:13:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240943

Some services, such as seatd, only implement the s6 init ready notificati=
ons.
readyfd2sd translates those notifications to the systemd-notify format to
make them usable with the systemd init system.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
v2:
- add maintainers entry
- add check for systemd distro feature
---
 meta/conf/distro/include/maintainers.inc       |  1 +
 meta/recipes-core/readyfd2sd/readyfd2sd_git.bb | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 meta/recipes-core/readyfd2sd/readyfd2sd_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 07e840ac34dc..bf1c15db6596 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -768,6 +768,7 @@ RECIPE_MAINTAINER:pn-quilt-native =3D "Robert Yang <l=
iezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-quota =3D "Unassigned <unassigned@yoctoproject.org>=
"
 RECIPE_MAINTAINER:pn-re2c =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-readline =3D "Hongxu Jia <hongxu.jia@windriver.com>=
"
+RECIPE_MAINTAINER:pn-readyfd2sd =3D "Lucas Stach <yocto@pengutronix.de>"
 RECIPE_MAINTAINER:pn-repo =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-resolvconf =3D "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-rgb =3D "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-core/readyfd2sd/readyfd2sd_git.bb b/meta/recipe=
s-core/readyfd2sd/readyfd2sd_git.bb
new file mode 100644
index 000000000000..4f16a0ee65e3
--- /dev/null
+++ b/meta/recipes-core/readyfd2sd/readyfd2sd_git.bb
@@ -0,0 +1,15 @@
+SUMMARY =3D "s6 readyfd to systemd sd_notify adapter"
+DESCRIPTION =3D "${SUMMARY}"
+HOMEPAGE =3D "https://git.sr.ht/~kennylevinsen/readyfd2sd"
+SECTION =3D "base"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc50481d620cb912754d78d319eeec=
30a"
+
+REQUIRED_DISTRO_FEATURES =3D "systemd"
+DEPENDS =3D "systemd"
+
+PV =3D "0.1+git"
+SRC_URI =3D "git://git.sr.ht/~kennylevinsen/readyfd2sd;protocol=3Dhttps;=
branch=3Dmaster"
+SRCREV =3D "87c99ce10dca3f3c3e5c3a0d994ee7892e952b61"
+
+inherit meson pkgconfig systemd features_check
--=20
2.47.3


