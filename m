Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC206E81DE5
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 11:22:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10315.1696591325489504926
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 04:22:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 438A2C15;
	Fri,  6 Oct 2023 04:22:44 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AC2473F5A1;
	Fri,  6 Oct 2023 04:22:04 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/4] sysvinit-inittab: use ttyrun to run getty only if the terminal exists
Date: Fri,  6 Oct 2023 12:22:00 +0100
Message-Id: <20231006112201.1081909-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231006112201.1081909-1-ross.burton@arm.com>
References: <20231006112201.1081909-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 11:22:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188759

From: Ross Burton <ross.burton@arm.com>

Wrap calls to start_getty with ttyrun, so that getty isn't started if
the device doesn't exist.  As we know start_getty is only called when
the device exists we can remove the partial workaround for this problem
in that scripts too.

This neatly obsoletes SERIAL_CONSOLES_CHECK, whose sole purpose was to
check what terminals are present at boot and rewrite inittab.  Notably,
this meant that SERIAL_CONSOLES_CHECK made using a read-only rootfs
impossible.

(From OE-Core rev: f4fd17d5a5e4eaa31995d3ca52c871cfbdc0df68)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../sysvinit/sysvinit-inittab/start_getty     | 11 ++++---
 .../sysvinit/sysvinit-inittab_2.88dsf.bb      | 30 ++-----------------
 2 files changed, 7 insertions(+), 34 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty b/me=
ta/recipes-core/sysvinit/sysvinit-inittab/start_getty
index f60409eae3a..f5671ee53d2 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
@@ -1,5 +1,9 @@
 #!/bin/sh
=20
+SPEED=3D$1
+DEVICE=3D$2
+TERM=3D$3
+
 # busybox' getty does this itself, util-linux' agetty needs extra help
 getty=3D"/sbin/getty"
 case $(readlink -f "${getty}") in
@@ -13,9 +17,4 @@ case $(readlink -f "${getty}") in
         ;;
 esac
=20
-if [ -e /sys/class/tty/$2 -a -c /dev/$2 ]; then
-	${setsid:-} ${getty} ${options:-} -L $1 $2 $3
-else
-    # Prevent respawning to fast error if /dev entry does not exist
-    sleep 1000
-fi
+${setsid:-} ${getty} ${options:-} -L $SPEED $DEVICE $TERM
diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/met=
a/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index e70dc705c05..6bbe517df1b 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -28,7 +28,7 @@ do_install() {
         device=3D$(echo $s | cut -d\; -f 2)
         label=3D$(echo $device | sed -e 's/tty//' | tail --bytes=3D5)
=20
-        echo "$label:12345:respawn:${base_bindir}/start_getty $speed $de=
vice vt102" >> ${D}${sysconfdir}/inittab
+        echo "$label:12345:respawn:${sbindir}/ttyrun $device ${base_bind=
ir}/start_getty $speed $device vt102" >> ${D}${sysconfdir}/inittab
     done
=20
     if [ "${USE_VT}" =3D "1" ]; then
@@ -52,33 +52,6 @@ EOF
     fi
 }
=20
-pkg_postinst:${PN} () {
-# run this on host and on target
-if [ "${SERIAL_CONSOLES_CHECK}" =3D "" ]; then
-       exit 0
-fi
-}
-
-pkg_postinst_ontarget:${PN} () {
-# run this on the target
-if [ -e /proc/consoles ]; then
-	tmp=3D"${SERIAL_CONSOLES_CHECK}"
-	for i in $tmp
-	do
-		j=3D`echo ${i} | sed -e s/^.*\;//g -e s/\:.*//g`
-		k=3D`echo ${i} | sed s/^.*\://g`
-		if [ -z "`grep ${j} /proc/consoles`" ]; then
-			if [ -z "${k}" ] || [ -z "`grep ${k} /proc/consoles`" ] || [ ! -e /de=
v/${j} ]; then
-				sed -i -e /^.*${j}\ /d -e /^.*${j}$/d /etc/inittab
-			fi
-		fi
-	done
-	kill -HUP 1
-else
-	exit 1
-fi
-}
-
 # USE_VT and SERIAL_CONSOLES are generally defined by the MACHINE .conf.
 # Set PACKAGE_ARCH appropriately.
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
@@ -89,4 +62,5 @@ CONFFILES:${PN} =3D "${sysconfdir}/inittab"
 USE_VT ?=3D "1"
 SYSVINIT_ENABLED_GETTYS ?=3D "1"
=20
+RDEPENDS:${PN} =3D "ttyrun"
 RCONFLICTS:${PN} =3D "busybox-inittab"
--=20
2.34.1


