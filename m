Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5487DC87FD2
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 11:26:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.19480.1754393181327837991
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 04:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 988AD339
	for <openembedded-core@lists.openembedded.org>; Tue,  5 Aug 2025 04:26:12 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4AC913F673
	for <openembedded-core@lists.openembedded.org>; Tue,  5 Aug 2025 04:26:20 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 1/2] dbus: use the systemd class to handle the unit files
Date: Tue,  5 Aug 2025 12:26:13 +0100
Message-ID: <20250805112614.594165-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 11:26:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221470

Originally, the dbus recipe couldn't use the systemd class because there
was a circular dependency between systemd and dbus.

However, since systemd v209 in 2014[1] systemd hasn't needed libdbus, as
it has it's own implementation of the client library. DBus does not use
the systemd libraries, so there is no circular dependency.

The dbus build was already was installing the service and socket files,
so we are installing them again. Remove the installation of the units.

Manually mask dbus-1.service by simply creating a symlink, instead of
depending on systemctl and using an postinstall script.

Signed-off-by: Ross Burton <ross.burton@arm.com>

[1] dbus: 718db96199 ("core: convert PID 1 to libsystemd-bus")
---
 meta/recipes-core/dbus/dbus_1.16.2.bb | 32 +++++++--------------------
 1 file changed, 8 insertions(+), 24 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus_1.16.2.bb b/meta/recipes-core/db=
us/dbus_1.16.2.bb
index 1876ea8a944..4fc590eb39e 100644
--- a/meta/recipes-core/dbus/dbus_1.16.2.bb
+++ b/meta/recipes-core/dbus/dbus_1.16.2.bb
@@ -46,16 +46,11 @@ DEPENDS =3D "expat virtual/libintl"
 RDEPENDS:${PN} +=3D "${PN}-common ${PN}-tools"
 RDEPENDS:${PN}:class-native =3D ""
=20
-inherit useradd update-rc.d
+inherit systemd useradd update-rc.d
=20
 INITSCRIPT_NAME =3D "dbus-1"
 INITSCRIPT_PARAMS =3D "start 02 5 3 2 . stop 20 0 1 6 ."
=20
-python __anonymous() {
-    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False,=
 d):
-        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
-}
-
 PACKAGES =3D+ "${PN}-lib ${PN}-common ${PN}-tools"
=20
 USERADD_PACKAGES =3D "dbus-common"
@@ -103,16 +98,7 @@ FILES:${PN}-dev +=3D "${libdir}/dbus-1.0/include ${bi=
ndir}/dbus-test-tool ${datadi
=20
 RDEPENDS:${PN}-ptest +=3D "bash make dbus"
=20
-PACKAGE_WRITE_DEPS +=3D "${@bb.utils.contains('DISTRO_FEATURES','systemd=
 sysvinit','systemd-systemctl-native','',d)}"
 pkg_postinst:dbus() {
-	# If both systemd and sysvinit are enabled, mask the dbus-1 init script
-        if ${@bb.utils.contains('DISTRO_FEATURES','systemd sysvinit','tr=
ue','false',d)}; then
-		if [ -n "$D" ]; then
-			OPTS=3D"--root=3D$D"
-		fi
-		systemctl $OPTS mask dbus-1.service
-	fi
-
 	if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
 		/etc/init.d/populate-volatile.sh update
 	fi
@@ -134,22 +120,20 @@ do_install:append:class-target() {
 		install -d ${D}${sysconfdir}/init.d
 		sed 's:@bindir@:${bindir}:' < ${UNPACKDIR}/dbus-1.init > ${S}/dbus-1.i=
nit.sh
 		install -m 0755 ${S}/dbus-1.init.sh ${D}${sysconfdir}/init.d/dbus-1
+
 		install -d ${D}${sysconfdir}/default/volatiles
 		echo "d messagebus messagebus 0755 /run/dbus none" \
 		     > ${D}${sysconfdir}/default/volatiles/99_dbus
-	fi
=20
-	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', =
d)}; then
-		for i in dbus.target.wants sockets.target.wants multi-user.target.want=
s; do \
-			install -d ${D}${systemd_system_unitdir}/$i; done
-		install -m 0644 ${B}/bus/dbus.service ${B}/bus/dbus.socket ${D}${syste=
md_system_unitdir}/
-		ln -fs ../dbus.socket ${D}${systemd_system_unitdir}/dbus.target.wants/=
dbus.socket
-		ln -fs ../dbus.socket ${D}${systemd_system_unitdir}/sockets.target.wan=
ts/dbus.socket
-		ln -fs ../dbus.service ${D}${systemd_system_unitdir}/multi-user.target=
.wants/dbus.service
+		if ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'true', 'false', d=
)}; then
+			# symlink dbus-1.service to /dev/null to "mask" the service, This ens=
ures
+			# that if systemd and sysv init systems are both enabled, systemd doe=
sn't
+			# start two system buses (one from init.d/dbus-1, one from dbus.servi=
ce).
+			ln -s /dev/null ${D}${systemd_system_unitdir}/dbus-1.service
+		fi
 	fi
=20
 	mkdir -p ${D}${localstatedir}/lib/dbus
-
 	chown messagebus:messagebus ${D}${localstatedir}/lib/dbus
=20
 	if [ "${@bb.utils.contains('PACKAGECONFIG', 'traditional-activation', '=
1', '0', d)}" =3D "1" ]
--=20
2.43.0


