Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 701C3D2F35E
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 18:46:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66777.1768329995533703789
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 10:46:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E1F6497
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:46:28 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B75683F59E
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:46:34 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemd-compat-units: generate masks at build time
Date: Tue, 13 Jan 2026 18:46:32 +0000
Message-ID: <20260113184632.3953060-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 18:46:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229291

Originally, this recipe masked the units at rootfs-time by looking to see
if the init script to be masked existed, and masking it if so.

That however suffers from a race condition where the postinst script may
be executed before the package that provides a script has been installed
so this was changed to be an on-target postinst[1], so we know that all
of the packages have been installed.

However, this now means that you can't have an image that install this
package _and_ is read-only, because we have an on-target postinst to
execute.

There's also another problem that with on-target package management, it
would be possible to install a package that should be masked after the
postinst has been executed, so the mask won't exist.

Taking a step back, a systemd unit mask is just a symlink to /dev/null
with the right name in the right path.  So instead of masking in a post-
install script, we can generate all the masks at build-time.

This change reduces this package to just a number of symlinks, with no
post-install scripts.

[ YOCTO #16109 ]
[1] oe-core e88f22da19 ("systemd-compat-units: execute postinst on target=
")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../systemd/systemd-compat-units.bb           | 34 ++++---------------
 1 file changed, 6 insertions(+), 28 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/rec=
ipes-core/systemd/systemd-compat-units.bb
index d6da34e9b8..6839101037 100644
--- a/meta/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta/recipes-core/systemd/systemd-compat-units.bb
@@ -2,18 +2,14 @@ SUMMARY =3D "Enhances systemd compatilibity with existi=
ng SysVinit scripts"
 HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/systemd"
 LICENSE =3D "MIT"
=20
-PACKAGE_WRITE_DEPS +=3D "systemd-systemctl-native"
+DEPENDS =3D "systemd-systemctl-native"
+INHIBIT_DEFAULT_DEPS =3D "1"
=20
 S =3D "${UNPACKDIR}"
=20
 inherit features_check
=20
-INHIBIT_DEFAULT_DEPS =3D "1"
-
-ALLOW_EMPTY:${PN} =3D "1"
-
-REQUIRED_DISTRO_FEATURES +=3D "systemd"
-REQUIRED_DISTRO_FEATURES +=3D "usrmerge"
+REQUIRED_DISTRO_FEATURES =3D "systemd"
=20
 SYSTEMD_DISABLED_SYSV_SERVICES =3D " \
   busybox-udhcpc \
@@ -24,26 +20,8 @@ SYSTEMD_DISABLED_SYSV_SERVICES =3D " \
   syslog.busybox \
 "
=20
-pkg_postinst_ontarget:${PN} () {
-
-	test -d $D${sysconfdir}/init.d  ||  exit 0
-	cd $D${sysconfdir}/init.d
-
-	echo "Disabling the following sysv scripts: "
-
-	if [ -n "$D" ]; then
-		OPTS=3D"--root=3D$D"
-	else
-		OPTS=3D""
-	fi
-
-	for i in ${SYSTEMD_DISABLED_SYSV_SERVICES} ; do
-		if [ -e $i -o -e $i.sh ]  &&   ! [ -e $D${sysconfdir}/systemd/system/$=
i.service -o -e $D${systemd_system_unitdir}/$i.service ] ; then
-			echo -n "$i: "
-			systemctl $OPTS mask $i.service
-		fi
+do_install() {
+	for unit in ${SYSTEMD_DISABLED_SYSV_SERVICES} ; do
+		systemctl --root ${D} mask $unit
 	done
-	echo
 }
-
-RDEPENDS:${PN} =3D "systemd"
--=20
2.43.0


