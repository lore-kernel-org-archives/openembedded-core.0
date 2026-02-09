Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6409DE81BC0
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 12:56:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46681.1770641794653962244
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 04:56:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE5E4339
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 04:56:27 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BF53B3F740
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 04:56:33 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 4/9] classes/pkgconfig: move variable exports to the class
Date: Mon,  9 Feb 2026 12:56:22 +0000
Message-ID: <20260209125628.640221-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260209125628.640221-1-ross.burton@arm.com>
References: <20260209125628.640221-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 12:56:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230791

All recipes that use pkg-config should be inheriting the class so this
is a no-op change for those, and for recipes that do not use pkg-config
will no longer need to rebuild if these variables are changed.

Any recipes that use pkg-config but do not inherit the class will fail
to build, and this is intentional: those recipes should inherit the class=
.

This commit is simply the move of the exports, the values do not change.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/pkgconfig.bbclass |  7 +++++++
 meta/conf/bitbake.conf                | 14 +++++++-------
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/meta/classes-recipe/pkgconfig.bbclass b/meta/classes-recipe/=
pkgconfig.bbclass
index 1e1f3824dd..ea91338d34 100644
--- a/meta/classes-recipe/pkgconfig.bbclass
+++ b/meta/classes-recipe/pkgconfig.bbclass
@@ -6,3 +6,10 @@
=20
 DEPENDS:prepend =3D "pkgconfig-native "
=20
+export PKG_CONFIG_DIR
+export PKG_CONFIG_PATH
+export PKG_CONFIG_LIBDIR
+export PKG_CONFIG_SYSROOT_DIR
+export PKG_CONFIG_DISABLE_UNINSTALLED
+export PKG_CONFIG_SYSTEM_LIBRARY_PATH
+export PKG_CONFIG_SYSTEM_INCLUDE_PATH
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index da873c3f4e..be76c88cce 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -768,13 +768,13 @@ BUILDCFG_NEEDEDVARS[type] =3D "list"
=20
 # Other
=20
-export PKG_CONFIG_DIR =3D "${STAGING_DIR_HOST}${libdir}/pkgconfig"
-export PKG_CONFIG_PATH =3D "${PKG_CONFIG_DIR}:${STAGING_DATADIR}/pkgconf=
ig"
-export PKG_CONFIG_LIBDIR =3D "${PKG_CONFIG_DIR}"
-export PKG_CONFIG_SYSROOT_DIR =3D "${STAGING_DIR_HOST}"
-export PKG_CONFIG_DISABLE_UNINSTALLED =3D "yes"
-export PKG_CONFIG_SYSTEM_LIBRARY_PATH =3D "${base_libdir}:${libdir}"
-export PKG_CONFIG_SYSTEM_INCLUDE_PATH =3D "${includedir}"
+PKG_CONFIG_DIR =3D "${STAGING_DIR_HOST}${libdir}/pkgconfig"
+PKG_CONFIG_PATH =3D "${PKG_CONFIG_DIR}:${STAGING_DATADIR}/pkgconfig"
+PKG_CONFIG_LIBDIR =3D "${PKG_CONFIG_DIR}"
+PKG_CONFIG_SYSROOT_DIR =3D "${STAGING_DIR_HOST}"
+PKG_CONFIG_DISABLE_UNINSTALLED =3D "yes"
+PKG_CONFIG_SYSTEM_LIBRARY_PATH =3D "${base_libdir}:${libdir}"
+PKG_CONFIG_SYSTEM_INCLUDE_PATH =3D "${includedir}"
=20
 # Don't allow git to chdir up past WORKDIR or TMPDIR so that it doesn't =
detect the OE
 # repository when building a recipe.
--=20
2.43.0


