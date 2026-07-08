Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF85C44507
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 17:37:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14388.1783532219870928890
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 10:37:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=I3Tk8K3i;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2CFA1D14
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2026 10:36:54 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D5DFB3F905
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2026 10:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783532219; bh=UTRTcmhmkYQfJedBw9fi0LzLh4jk6jDZe7nFHfzvL+E=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=I3Tk8K3ih7YMwRZh94zGIiKGXioZDgYtHiPiHV9Dj3kJ2VmSmcuy9Pt6cGr5osdZY
	 kzqER4INgc2PY1UYzlNKnEfRiZAjnpxmAuBleznIBzshkOgIt7JnUR1hyG0yxS0bfy
	 rRFWrzKUIMx3hh5w6KCu0Dd2w1iGbfeierRcZ7ww=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] glibc: only install nscd if it's been enabled
Date: Wed,  8 Jul 2026 18:36:49 +0100
Message-ID: <20260708173651.1435387-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708173651.1435387-1-ross.burton@arm.com>
References: <20260708173651.1435387-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 17:37:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240501

Whilst the actual nscd binary won't be installed if the PACKAGECONFIG is
disabled, we were still installing the init scripts and configuration
files.  These should be wrapped with PACKAGECONFIG checks.

${localstatedir}/db and makedbs.sh are part of libnss-db not nscd, so
ensure they're still always installed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 41 +++++++++++++----------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-cor=
e/glibc/glibc-package.inc
index d4941a21a1..3d721d8f69 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -98,16 +98,20 @@ do_install() {
 		rm -f ${D}${infodir}/dir
 	fi
=20
-	install -d ${D}${sysconfdir}/init.d
-	install -d ${D}${localstatedir}/db/nscd
-	install -m 0755 ${S}/nscd/nscd.init ${D}${sysconfdir}/init.d/nscd
-	install -m 0755 ${S}/nscd/nscd.conf ${D}${sysconfdir}/nscd.conf
+	install -d ${D}${localstatedir}/db
 	install -m 0755 ${UNPACKDIR}/makedbs.sh ${D}${localstatedir}/db
-	sed -i "s%daemon%start-stop-daemon --start --exec%g" ${D}${sysconfdir}/=
init.d/nscd
-	sed -i "s|\(enable-cache\t\+netgroup\t\+\)yes|\1no|" ${D}${sysconfdir}/=
nscd.conf
=20
-	install -d ${D}${systemd_system_unitdir}
-	install -m 0644 ${S}/nscd/nscd.service ${D}${systemd_system_unitdir}/
+	if ${@bb.utils.contains('PACKAGECONFIG', 'nscd', 'true', 'false', d)}; =
then
+		install -d ${D}${sysconfdir}/init.d
+		install -d ${D}${localstatedir}/db/nscd
+		install -m 0755 ${S}/nscd/nscd.init ${D}${sysconfdir}/init.d/nscd
+		install -m 0755 ${S}/nscd/nscd.conf ${D}${sysconfdir}/nscd.conf
+		sed -i "s%daemon%start-stop-daemon --start --exec%g" ${D}${sysconfdir}=
/init.d/nscd
+		sed -i "s|\(enable-cache\t\+netgroup\t\+\)yes|\1no|" ${D}${sysconfdir}=
/nscd.conf
+
+		install -d ${D}${systemd_system_unitdir}
+		install -m 0644 ${S}/nscd/nscd.service ${D}${systemd_system_unitdir}/
+	fi
=20
 	# The dynamic loader will have been installed into
 	# ${base_libdir}. However, if that isn't going to end up being
@@ -132,18 +136,19 @@ def get_libc_fpu_setting(bb, d):
     return ""
=20
 do_install:append:class-target() {
-	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', =
d)}; then
-		install -d ${D}${nonarch_libdir}/tmpfiles.d
-		echo "d /run/nscd 755 root root -" \
-			> ${D}${nonarch_libdir}/tmpfiles.d/nscd.conf
-	fi
+	if ${@bb.utils.contains('PACKAGECONFIG', 'nscd', 'true', 'false', d)}; =
then
+		if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false',=
 d)}; then
+			install -d ${D}${nonarch_libdir}/tmpfiles.d
+			echo "d /run/nscd 755 root root -" \
+				> ${D}${nonarch_libdir}/tmpfiles.d/nscd.conf
+		fi
=20
-	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false',=
 d)}; then
-		install -d ${D}${sysconfdir}/default/volatiles
-		echo "d root root 0755 /var/run/nscd none" \
-			> ${D}${sysconfdir}/default/volatiles/98_nscd
+		if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false'=
, d)}; then
+			install -d ${D}${sysconfdir}/default/volatiles
+			echo "d root root 0755 /var/run/nscd none" \
+				> ${D}${sysconfdir}/default/volatiles/98_nscd
+		fi
 	fi
-
 }
 do_install:append:aarch64 () {
 	do_install_armmultilib
--=20
2.43.0


