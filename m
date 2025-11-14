Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3119CE7B05
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 12:42:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16917.1763124141684373428
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Nov 2025 04:42:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 730981063
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 04:42:13 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BB4E83F5A1
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 04:42:20 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] nfs-utils: clean up sbin installation
Date: Fri, 14 Nov 2025 12:42:17 +0000
Message-ID: <20251114124218.3595920-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 12:42:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226294

There's no need to sed the Makefiles as there's an option to simply
respect sbindir.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb b/met=
a/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb
index 08e7dd89003..fcbbadd914a 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb
@@ -51,6 +51,7 @@ EXTRA_OECONF =3D "--with-statduser=3Drpcuser \
                 --with-statdpath=3D/var/lib/nfs/statd \
                 --with-pluginpath=3D${libdir}/libnfsidmap \
                 --with-rpcgen=3D${HOSTTOOLS_DIR}/rpcgen \
+                --disable-sbin-override \
                "
=20
 LDFLAGS +=3D "-lsqlite3 -levent"
@@ -117,9 +118,8 @@ FILES:${PN}-staticdev +=3D "${libdir}/libnfsidmap/*.a=
"
 FILES:${PN} +=3D "${systemd_unitdir} ${libdir}/libnfsidmap/ ${nonarch_li=
bdir}/modprobe.d"
=20
 do_configure:prepend() {
-	sed -i -e 's,sbindir =3D .*,sbindir =3D ${base_sbindir},g' \
-		-e 's,udev_rulesdir =3D .*,udev_rulesdir =3D ${nonarch_base_libdir}/ud=
ev/rules.d/,g' \
-		${S}/utils/mount/Makefile.am ${S}/utils/nfsdcltrack/Makefile.am \
+	# Upstream hardcodes the rules directory to /usr/lib/udev/rules.d/
+	sed -i -e 's,udev_rulesdir =3D .*,udev_rulesdir =3D ${nonarch_base_libd=
ir}/udev/rules.d/,g' \
 		${S}/systemd/Makefile.am ${S}/tools/nfsrahead/Makefile.am
 }
=20
--=20
2.43.0


