Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F59A108B91C
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 12:27:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11420.1774009661286809298
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 05:27:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2600165C
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 05:27:34 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 799E93F7BD
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 05:27:40 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] class/pkgconfig: use pkgconf instead of pkgconfig
Date: Fri, 20 Mar 2026 12:27:29 +0000
Message-ID: <20260320122732.1630715-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320122732.1630715-1-ross.burton@arm.com>
References: <20260320122732.1630715-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 12:27:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233603

The last meaningful change to freedesktop.org pkgconfig was in 2019, but
pkgconf is actively maintained.

Major distributions such as Fedora (and derivates), Debian (ditto), Arch
Linux, Buildroot, and Alpine have all moved to pkgconf already.

There's a subtle behaviour change between pkgconfig and pkgconf, whereas
pkgconfig appends the sysroot to PKG_CONFIG_SYSTEM_INCLUDE_PATH pkgconf
does not, so we need to sysroot-prefix those variables.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/pkgconfig.bbclass          | 6 +++---
 meta/conf/distro/include/default-providers.inc | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/pkgconfig.bbclass b/meta/classes-recipe/=
pkgconfig.bbclass
index c0d91393b36..4912b9904ba 100644
--- a/meta/classes-recipe/pkgconfig.bbclass
+++ b/meta/classes-recipe/pkgconfig.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
=20
-DEPENDS:prepend =3D "pkgconfig-native "
+DEPENDS:prepend =3D "pkgconf-native "
=20
 export PKG_CONFIG_PATH ?=3D ""
 export PKG_CONFIG_LIBDIR ?=3D "${STAGING_LIBDIR}/pkgconfig:${STAGING_DAT=
ADIR}/pkgconfig"
@@ -12,5 +12,5 @@ export PKG_CONFIG_LIBDIR ?=3D "${STAGING_LIBDIR}/pkgcon=
fig:${STAGING_DATADIR}/pkgc
 export PKG_CONFIG_SYSROOT_DIR ?=3D "${STAGING_DIR_HOST}"
 export PKG_CONFIG_DISABLE_UNINSTALLED ?=3D "yes"
=20
-export PKG_CONFIG_SYSTEM_LIBRARY_PATH ?=3D "${base_libdir}:${libdir}"
-export PKG_CONFIG_SYSTEM_INCLUDE_PATH ?=3D "${includedir}"
+export PKG_CONFIG_SYSTEM_LIBRARY_PATH ?=3D "${STAGING_BASELIBDIR}:${STAG=
ING_LIBDIR}"
+export PKG_CONFIG_SYSTEM_INCLUDE_PATH ?=3D "${STAGING_INCDIR}"
diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/d=
istro/include/default-providers.inc
index 5101ad78f88..c0a5d1c75e5 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -56,9 +56,9 @@ PREFERRED_PROVIDER_getopt ?=3D "util-linux-getopt"
 PREFERRED_PROVIDER_openssl ?=3D "openssl"
 PREFERRED_PROVIDER_openssl-native ?=3D "openssl-native"
 PREFERRED_PROVIDER_nativesdk-openssl ?=3D "nativesdk-openssl"
-PREFERRED_PROVIDER_pkgconfig ?=3D "pkgconfig"
-PREFERRED_PROVIDER_nativesdk-pkgconfig ?=3D "nativesdk-pkgconfig"
-PREFERRED_PROVIDER_pkgconfig-native ?=3D "pkgconfig-native"
+PREFERRED_PROVIDER_pkgconfig ?=3D "pkgconf"
+PREFERRED_PROVIDER_nativesdk-pkgconfig ?=3D "nativesdk-pkgconf"
+PREFERRED_PROVIDER_pkgconfig-native ?=3D "pkgconf-native"
 PREFERRED_RPROVIDER_initd-functions ?=3D "initscripts"
=20
 PREFERRED_PROVIDER_nativesdk-mesa ?=3D "nativesdk-mesa"
--=20
2.43.0


