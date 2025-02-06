Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65628C02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 13:31:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.41061.1738848683274686734
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 05:31:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 374E212FC
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Feb 2025 05:31:46 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8926B3F5A1
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Feb 2025 05:31:22 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] nfs-utils: clean up sbin installation
Date: Thu,  6 Feb 2025 13:31:13 +0000
Message-ID: <20250206133114.2974225-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206133114.2974225-1-ross.burton@arm.com>
References: <20250206133114.2974225-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 13:31:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210936

There's no need to sed the Makefiles as there's an option to simply
respect sbindir.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb b/met=
a/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
index ff02a3aea01..4683939bff5 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
@@ -60,6 +60,7 @@ EXTRA_OECONF =3D "--with-statduser=3Drpcuser \
                 --disable-nfsdcltrack \
                 --with-statdpath=3D/var/lib/nfs/statd \
                 --with-rpcgen=3D${HOSTTOOLS_DIR}/rpcgen \
+                --disable-sbin-override \
                "
=20
 LDFLAGS +=3D "-lsqlite3 -levent"
@@ -107,11 +108,6 @@ FILES:${PN}-staticdev +=3D "${libdir}/libnfsidmap/*.=
a"
=20
 FILES:${PN} +=3D "${systemd_unitdir} ${libdir}/libnfsidmap/ ${nonarch_li=
bdir}/modprobe.d"
=20
-do_configure:prepend() {
-	sed -i -e 's,sbindir =3D /sbin,sbindir =3D ${base_sbindir},g' \
-		${S}/utils/mount/Makefile.am
-}
-
 # Make clean needed because the package comes with
 # precompiled 64-bit objects that break the build
 do_compile:prepend() {
--=20
2.43.0


