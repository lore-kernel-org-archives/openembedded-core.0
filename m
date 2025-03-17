Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 771D1C35FF3
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 17:09:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.58563.1742231334866016600
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 10:08:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2339E13D5
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 10:09:03 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E4CBD3F694
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 10:08:53 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/5] libcap: clean up configuration variables
Date: Mon, 17 Mar 2025 17:08:45 +0000
Message-ID: <20250317170848.4153724-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250317170848.4153724-1-ross.burton@arm.com>
References: <20250317170848.4153724-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 17:09:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213113

There's no need to set PACKAGECONFIG:class-native as we disable PAM in
the native DISTRO_FEATURES.

No need to set COPTS, since "Canonicalize build system"[1] the exported
CFLAGS/CPPFLAGS/LDFLAGS are respected.

Merge multiple make arguments into EXTRA_OEMAKE to remove duplication.

SYSTEM_HEADERS is not used upstream, remove.

[1] 2762c2c1a8c98d9012fcd40f20d133493a0b3219

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/libcap/libcap_2.74.bb | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-support/libcap/libcap_2.74.bb b/meta/recipes-su=
pport/libcap/libcap_2.74.bb
index c2738533799..a1da8311b27 100644
--- a/meta/recipes-support/libcap/libcap_2.74.bb
+++ b/meta/recipes-support/libcap/libcap_2.74.bb
@@ -23,11 +23,10 @@ UPSTREAM_CHECK_URI =3D "https://www.kernel.org/pub/li=
nux/libs/security/linux-privs
 inherit lib_package
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
-PACKAGECONFIG:class-native ??=3D ""
-
 PACKAGECONFIG[pam] =3D "PAM_CAP=3Dyes,PAM_CAP=3Dno,libpam"
=20
 EXTRA_OEMAKE =3D " \
+  ${PACKAGECONFIG_CONFARGS} \
   INDENT=3D  \
   lib=3D'${baselib}' \
   RAISE_SETFCAP=3Dno \
@@ -35,23 +34,16 @@ EXTRA_OEMAKE =3D " \
   USE_GPERF=3Dyes \
 "
=20
-EXTRA_OEMAKE:append:class-target =3D " SYSTEM_HEADERS=3D${STAGING_INCDIR=
}"
-
 do_compile() {
-	unset CFLAGS BUILD_CFLAGS
 	oe_runmake \
-		${PACKAGECONFIG_CONFARGS} \
 		AR=3D"${AR}" \
 		CC=3D"${CC}" \
 		RANLIB=3D"${RANLIB}" \
-                OBJCOPY=3D"${OBJCOPY}" \
-		COPTS=3D"${CFLAGS}" \
-		BUILD_COPTS=3D"${BUILD_CFLAGS}"
+		OBJCOPY=3D"${OBJCOPY}"
 }
=20
 do_install() {
 	oe_runmake install \
-		${PACKAGECONFIG_CONFARGS} \
 		DESTDIR=3D"${D}" \
 		prefix=3D"${prefix}" \
 		SBINDIR=3D"${sbindir}"
--=20
2.43.0


