Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F115FFCE083
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 13:45:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70256.1772113506694007525
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 05:45:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDED01516
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 05:44:59 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C1DC43F62B
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 05:45:05 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] classes/pkgconfig: move assignments
Date: Thu, 26 Feb 2026 13:45:00 +0000
Message-ID: <20260226134500.3646422-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 13:45:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232025

Move the pkg-config-specific assignments (PKG_CONFIG_LIBDIR, etc) out of
bitbake.conf and into pkgconfig.bbclass.

Note that the assignments now have to be ?=3D so that recipes such as
gdb-cross-canadian-* can build. This is because previously the assignment
order of PKG_CONFIG_PATH was:

1) bitbake.conf
2) cross-canadian.bbclass

But with this new layout it is:

1) cross-canadian.bbclass
2) pkgconfig.bbclass

If pkgconfig does a hard assign then it replaces any assignments that
have happened already.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/pkgconfig.bbclass | 14 +++++++-------
 meta/conf/bitbake.conf                |  8 --------
 2 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/meta/classes-recipe/pkgconfig.bbclass b/meta/classes-recipe/=
pkgconfig.bbclass
index ea91338d345..98b63420135 100644
--- a/meta/classes-recipe/pkgconfig.bbclass
+++ b/meta/classes-recipe/pkgconfig.bbclass
@@ -6,10 +6,10 @@
=20
 DEPENDS:prepend =3D "pkgconfig-native "
=20
-export PKG_CONFIG_DIR
-export PKG_CONFIG_PATH
-export PKG_CONFIG_LIBDIR
-export PKG_CONFIG_SYSROOT_DIR
-export PKG_CONFIG_DISABLE_UNINSTALLED
-export PKG_CONFIG_SYSTEM_LIBRARY_PATH
-export PKG_CONFIG_SYSTEM_INCLUDE_PATH
+export PKG_CONFIG_DIR ?=3D "${STAGING_DIR_HOST}${libdir}/pkgconfig"
+export PKG_CONFIG_PATH ?=3D "${PKG_CONFIG_DIR}:${STAGING_DATADIR}/pkgcon=
fig"
+export PKG_CONFIG_LIBDIR ?=3D "${PKG_CONFIG_DIR}"
+export PKG_CONFIG_SYSROOT_DIR ?=3D "${STAGING_DIR_HOST}"
+export PKG_CONFIG_DISABLE_UNINSTALLED ?=3D "yes"
+export PKG_CONFIG_SYSTEM_LIBRARY_PATH ?=3D "${base_libdir}:${libdir}"
+export PKG_CONFIG_SYSTEM_INCLUDE_PATH ?=3D "${includedir}"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index aa6b5bbf9a0..194fa5246d2 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -768,14 +768,6 @@ BUILDCFG_NEEDEDVARS[type] =3D "list"
=20
 # Other
=20
-PKG_CONFIG_DIR =3D "${STAGING_DIR_HOST}${libdir}/pkgconfig"
-PKG_CONFIG_PATH =3D "${PKG_CONFIG_DIR}:${STAGING_DATADIR}/pkgconfig"
-PKG_CONFIG_LIBDIR =3D "${PKG_CONFIG_DIR}"
-PKG_CONFIG_SYSROOT_DIR =3D "${STAGING_DIR_HOST}"
-PKG_CONFIG_DISABLE_UNINSTALLED =3D "yes"
-PKG_CONFIG_SYSTEM_LIBRARY_PATH =3D "${base_libdir}:${libdir}"
-PKG_CONFIG_SYSTEM_INCLUDE_PATH =3D "${includedir}"
-
 # Don't allow git to chdir up past WORKDIR or TMPDIR so that it doesn't =
detect the OE
 # repository when building a recipe.
 export GIT_CEILING_DIRECTORIES =3D "${WORKDIR}:${TMPDIR}"
--=20
2.43.0


