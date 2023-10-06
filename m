Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC304E81DE9
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 11:22:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10251.1696591326206759730
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 04:22:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4F4A11FB;
	Fri,  6 Oct 2023 04:22:44 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5989E3F5A1;
	Fri,  6 Oct 2023 04:22:05 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 4/4] busybox: use ttyrun to run getty only if the terminal exists
Date: Fri,  6 Oct 2023 12:22:01 +0100
Message-Id: <20231006112201.1081909-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231006112201.1081909-1-ross.burton@arm.com>
References: <20231006112201.1081909-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 11:22:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188760

From: Ross Burton <ross.burton@arm.com>

Wrap calls to start_getty with ttyrun, so that getty isn't started if
the device doesn't exist.  As we know start_getty is only called when
the device exists we can remove the partial workaround for this problem
in that scripts too.

This neatly obsoletes SERIAL_CONSOLES_CHECK, whose sole purpose was to
check what terminals are present at boot and rewrite inittab.  Notably,
this meant that SERIAL_CONSOLES_CHECK made using a read-only rootfs
impossible.

(From OE-Core rev: 950ecaabc04836efc346be0ac7e0331e2378872b)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../busybox/busybox-inittab_1.36.1.bb         | 46 +++++--------------
 1 file changed, 12 insertions(+), 34 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox-inittab_1.36.1.bb b/meta/r=
ecipes-core/busybox/busybox-inittab_1.36.1.bb
index 868d7a230f6..462c9bb9c5f 100644
--- a/meta/recipes-core/busybox/busybox-inittab_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox-inittab_1.36.1.bb
@@ -15,14 +15,17 @@ do_compile() {
 do_install() {
 	install -d ${D}${sysconfdir}
 	install -D -m 0644 ${WORKDIR}/inittab ${D}${sysconfdir}/inittab
-	tmp=3D"${SERIAL_CONSOLES}"
-	[ -n "$tmp" ] && echo >> ${D}${sysconfdir}/inittab
-	for i in $tmp
-	do
-		j=3D`echo ${i} | sed s/\;/\ /g`
-		id=3D`echo ${i} | sed -e 's/^.*;//' -e 's/;.*//'`
-		echo "$id::respawn:${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/in=
ittab
-	done
+
+    CONSOLES=3D"${SERIAL_CONSOLES}"
+    for s in $CONSOLES
+    do
+        speed=3D$(echo $s | cut -d\; -f 1)
+        device=3D$(echo $s | cut -d\; -f 2)
+        label=3D$(echo $device | sed -e 's/tty//' | tail --bytes=3D5)
+
+        echo "$label::respawn:${sbindir}/ttyrun $device ${base_bindir}/s=
tart_getty $speed $device vt102" >> ${D}${sysconfdir}/inittab
+    done
+
 	if [ "${USE_VT}" =3D "1" ]; then
 		cat <<EOF >>${D}${sysconfdir}/inittab
 # ${base_sbindir}/getty invocations for the runlevels.
@@ -45,32 +48,6 @@ EOF
=20
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
-        tmp=3D"${SERIAL_CONSOLES_CHECK}"
-        for i in $tmp
-        do
-                j=3D`echo ${i} | sed -e s/^.*\;//g -e s/\:.*//g`
-                k=3D`echo ${i} | sed s/^.*\://g`
-                if [ -z "`grep ${j} /proc/consoles`" ]; then
-                        if [ -z "${k}" ] || [ -z "`grep ${k} /proc/conso=
les`" ] || [ ! -e /dev/${j} ]; then
-                                sed -i -e /^.*${j}\ /d -e /^.*${j}$/d /e=
tc/inittab
-                        fi
-                fi
-        done
-        kill -HUP 1
-else
-        exit 1
-fi
-}
=20
 # SERIAL_CONSOLES is generally defined by the MACHINE .conf.
 # Set PACKAGE_ARCH appropriately.
@@ -79,6 +56,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 FILES:${PN} =3D "${sysconfdir}/inittab"
 CONFFILES:${PN} =3D "${sysconfdir}/inittab"
=20
+RDEPENDS:${PN} =3D "ttyrun"
 RCONFLICTS:${PN} =3D "sysvinit-inittab"
=20
 USE_VT ?=3D "1"
--=20
2.34.1


