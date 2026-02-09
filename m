Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 617D3E81BB7
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 12:56:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46777.1770641796567723867
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 04:56:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4511339
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 04:56:29 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B2DF43F740
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 04:56:35 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 7/9] pkgconf: small cleanups
Date: Mon,  9 Feb 2026 12:56:25 +0000
Message-ID: <20260209125628.640221-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260209125628.640221-1-ross.burton@arm.com>
References: <20260209125628.640221-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 12:56:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230794

There's no need to --with-pkg-confg-dir as the default is the same and
correct.

Don't append BBCLASSEXTEND, there's no need.

Sync pkg-config-native with the pkg-config recipe so that it sets
the variables in the same way.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in | 3 ++-
 meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb             | 5 ++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in b=
/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in
index 0d736fe4d4..8addefbb80 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in
+++ b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in
@@ -1,6 +1,7 @@
 #! /bin/sh
=20
-PKG_CONFIG_PATH=3D"@PATH_NATIVE@$EXTRA_NATIVE_PKGCONFIG_PATH"
+export PKG_CONFIG_PATH=3D"@PATH_NATIVE@$EXTRA_NATIVE_PKGCONFIG_PATH"
+export PKG_CONFIG_LIBDIR=3D"@LIBDIR_NATIVE@"
 unset PKG_CONFIG_SYSROOT_DIR
=20
 pkg-config "$@"
diff --git a/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb b/meta/recipe=
s-devtools/pkgconf/pkgconf_2.5.1.bb
index 12ca075b5d..e3500431b3 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb
@@ -24,8 +24,6 @@ SRC_URI[sha256sum] =3D "cd05c9589b9f86ecf044c10a2269822=
bc9eb001eced2582cfffd658b0a
=20
 inherit autotools
=20
-EXTRA_OECONF +=3D "--with-pkg-config-dir=3D'${libdir}/pkgconfig:${datadi=
r}/pkgconfig'"
-
 do_install:append () {
     # Install a wrapper which deals, as much as possible with pkgconf vs
     # pkg-config compatibility issues.
@@ -36,6 +34,7 @@ do_install:append:class-native () {
     # Install a pkg-config-native wrapper that will use the native sysro=
ot instead
     # of the MACHINE sysroot, for using pkg-config when building native =
tools.
     sed -e "s|@PATH_NATIVE@|${PKG_CONFIG_PATH}|" \
+        -e "s|@LIBDIR_NATIVE@|${PKG_CONFIG_LIBDIR}|" \
         < ${UNPACKDIR}/pkg-config-native.in > ${B}/pkg-config-native
     install -m755 ${B}/pkg-config-native ${D}${bindir}/pkg-config-native
     sed -e "s|@PATH_NATIVE@|${PKG_CONFIG_PATH}|" \
@@ -53,7 +52,7 @@ RPROVIDES:${PN} +=3D "pkgconfig(pkg-config)"
 FILES:${PN}-dev:remove =3D "${datadir}/aclocal"
 FILES:${PN} +=3D "${datadir}/aclocal"
=20
-BBCLASSEXTEND +=3D "native nativesdk"
+BBCLASSEXTEND =3D "native nativesdk"
=20
 pkgconf_sstate_fixup_esdk () {
    if [ "${BB_CURRENTTASK}" =3D "populate_sysroot_setscene" -a "${WITHIN=
_EXT_SDK}" =3D "1" ] ; then
--=20
2.43.0


