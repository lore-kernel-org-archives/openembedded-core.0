Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5384CC87FCB
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 11:26:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.19130.1754393181713373236
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 04:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 400DE1424
	for <openembedded-core@lists.openembedded.org>; Tue,  5 Aug 2025 04:26:13 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E82093F673
	for <openembedded-core@lists.openembedded.org>; Tue,  5 Aug 2025 04:26:20 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 2/2] dbus: add message-bus PACKAGECONFIG
Date: Tue,  5 Aug 2025 12:26:14 +0100
Message-ID: <20250805112614.594165-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250805112614.594165-1-ross.burton@arm.com>
References: <20250805112614.594165-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 11:26:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221471

There's no need to build an actual message bus in native or nativesdk
environments, as if DBus is needed in those environments then it will be
used to connect to the existing session or system bus.

Add a PACKAGECONFIG for the message bus, and wrap the packaging logic
with a PACKAGECONFIG check.

Expat is only needed by the bus, so this reduces the mandatory build
dependencies in the native case.

This means we can merge the overridden do_install appends, as native and
nativesdk don't have the message bus enabled so they don't install
dbus-launch.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/dbus/dbus_1.16.2.bb | 56 ++++++++++++---------------
 1 file changed, 24 insertions(+), 32 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus_1.16.2.bb b/meta/recipes-core/db=
us/dbus_1.16.2.bb
index 4fc590eb39e..abe4196d9ad 100644
--- a/meta/recipes-core/dbus/dbus_1.16.2.bb
+++ b/meta/recipes-core/dbus/dbus_1.16.2.bb
@@ -27,12 +27,13 @@ EXTRA_OEMESON =3D "-Dxml_docs=3Ddisabled \
                 "
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11'=
, d)} \
-                   traditional-activation user-session \
+                   message-bus traditional-activation user-session \
                   ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', ''=
, d)} \
                   "
 PACKAGECONFIG:class-native =3D ""
 PACKAGECONFIG:class-nativesdk =3D ""
=20
+PACKAGECONFIG[message-bus] =3D "-Dmessage_bus=3Dtrue,-Dmessage_bus=3Dfal=
se,expat"
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Denabled -Dsystemd_system_unitdir=
=3D${systemd_system_unitdir},-Dsystemd=3Ddisabled,systemd"
 PACKAGECONFIG[x11] =3D "-Dx11_autolaunch=3Denabled,-Dx11_autolaunch=3Ddi=
sabled, virtual/libx11 libsm"
 PACKAGECONFIG[traditional-activation] =3D "-Dtraditional_activation=3Dtr=
ue,-Dtraditional_activation=3Dfalse"
@@ -42,7 +43,7 @@ PACKAGECONFIG[audit] =3D "-Dlibaudit=3Denabled,-Dlibaud=
it=3Ddisabled,audit"
 PACKAGECONFIG[selinux] =3D "-Dselinux=3Denabled,-Dselinux=3Ddisabled,lib=
selinux"
 PACKAGECONFIG[tests] =3D "-Dmodular_tests=3Denabled -Dinstalled_tests=3D=
true,-Dmodular_tests=3Ddisabled -Dinstalled_tests=3Dfalse,glib-2.0"
=20
-DEPENDS =3D "expat virtual/libintl"
+DEPENDS =3D "virtual/libintl"
 RDEPENDS:${PN} +=3D "${PN}-common ${PN}-tools"
 RDEPENDS:${PN}:class-native =3D ""
=20
@@ -115,26 +116,31 @@ systemctl =3D '${bindir}/systemctl'
 EOF
 }
=20
-do_install:append:class-target() {
-	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false',=
 d)}; then
-		install -d ${D}${sysconfdir}/init.d
-		sed 's:@bindir@:${bindir}:' < ${UNPACKDIR}/dbus-1.init > ${S}/dbus-1.i=
nit.sh
-		install -m 0755 ${S}/dbus-1.init.sh ${D}${sysconfdir}/init.d/dbus-1
+do_install:append() {
+	if ${@bb.utils.contains('PACKAGECONFIG', 'message-bus', 'true', 'false'=
, d)}; then
+		if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false'=
, d)}; then
+			install -d ${D}${sysconfdir}/init.d
+			sed 's:@bindir@:${bindir}:' < ${UNPACKDIR}/dbus-1.init > ${S}/dbus-1.=
init.sh
+			install -m 0755 ${S}/dbus-1.init.sh ${D}${sysconfdir}/init.d/dbus-1
=20
-		install -d ${D}${sysconfdir}/default/volatiles
-		echo "d messagebus messagebus 0755 /run/dbus none" \
-		     > ${D}${sysconfdir}/default/volatiles/99_dbus
+			install -d ${D}${sysconfdir}/default/volatiles
+			echo "d messagebus messagebus 0755 /run/dbus none" \
+			    > ${D}${sysconfdir}/default/volatiles/99_dbus
=20
-		if ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'true', 'false', d=
)}; then
-			# symlink dbus-1.service to /dev/null to "mask" the service, This ens=
ures
-			# that if systemd and sysv init systems are both enabled, systemd doe=
sn't
-			# start two system buses (one from init.d/dbus-1, one from dbus.servi=
ce).
-			ln -s /dev/null ${D}${systemd_system_unitdir}/dbus-1.service
+			if ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'true', 'false', =
d)}; then
+				# symlink dbus-1.service to /dev/null to "mask" the service, This en=
sures
+				# that if systemd and sysv init systems are both enabled, systemd do=
esn't
+				# start two system buses (one from init.d/dbus-1, one from dbus.serv=
ice).
+				ln -s /dev/null ${D}${systemd_system_unitdir}/dbus-1.service
+			fi
 		fi
-	fi
=20
-	mkdir -p ${D}${localstatedir}/lib/dbus
-	chown messagebus:messagebus ${D}${localstatedir}/lib/dbus
+		mkdir -p ${D}${localstatedir}/lib/dbus
+		chown messagebus:messagebus ${D}${localstatedir}/lib/dbus
+	else
+		# This gets installed even if the bus is disabled
+		rm -rf ${D}${localstatedir}
+	fi
=20
 	if [ "${@bb.utils.contains('PACKAGECONFIG', 'traditional-activation', '=
1', '0', d)}" =3D "1" ]
 	then
@@ -146,20 +152,6 @@ do_install:append:class-target() {
 	rm -rf ${D}${runtimedir}
 }
=20
-do_install:append:class-native() {
-	# dbus-launch has no X support so lets not install it in case the host
-	# has a more featured and useful version
-	rm -f ${D}${bindir}/dbus-launch
-}
-
-do_install:append:class-nativesdk() {
-	# dbus-launch has no X support so lets not install it in case the host
-	# has a more featured and useful version
-	rm -f ${D}${bindir}/dbus-launch
-
-	# Remove /run to avoid QA error
-	rm -rf ${D}${runtimedir}
-}
 BBCLASSEXTEND =3D "native nativesdk"
=20
 CVE_PRODUCT +=3D "d-bus_project:d-bus freedesktop:dbus freedesktop:libdb=
us"
--=20
2.43.0


