Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44EEDCCD183
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 12:45:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.42442.1760359529849754547
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 05:45:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6185312FC
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 05:45:21 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F314F3F738
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 05:45:28 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] glibc: only install nscd if it's been enabled
Date: Mon, 13 Oct 2025 13:45:15 +0100
Message-ID: <20251013124515.2362058-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251013124515.2362058-1-ross.burton@arm.com>
References: <20251013124515.2362058-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 12:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224781

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
index d4941a21a10..3d721d8f69f 100644
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


