Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734E3C5516E
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 19:00:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19407.1785438013773040027
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 12:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=cKxGMD62;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD8C2165C
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 12:00:08 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8A01B3F66F
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 12:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785438012; bh=gRY9suxsnXtFxtgfIEmSEdUtrzI5g0UneQrAvwLpHhc=;
	h=From:To:Subject:Date:From;
	b=cKxGMD62soDGQlGdIhiof+qv5Y90PhvvGrY2BVGkHgSy6M2BHeRsTpXf6/V3pAvUq
	 I6ekpmkDrTU6CjyZuQ4WmL4G8KF+/lzaXFnvPSOzPJqJWt9JKmC0p9QRfWlcBL1O7/
	 9WRgh4e5Pz/eQOk4yQuUO6tzGmKBkQffWbmGytps=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] cargo: centralise anti-vendoring environment variables
Date: Thu, 30 Jul 2026 20:00:03 +0100
Message-ID: <20260730190007.2440254-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 19:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242371

The cargo recipe has exports to stop the libssh2-sys (and git2-sys, but
disabled) crate from vendoring the C code into the built binary and
instead link to the shared libraries that we already have built.

This is desirable because it means that we have a single copy of say
libssh2 on the system that can be updated easily, instead of potentially
multiple different versions embedded in rust binaries.

This isn't specific to cargo, so move it into cargo_common so that all
recipes that build crates don't vendor C code.

The git2-sys linking was disabled due to incompatibilities with older
versions, but this appears to be historical now and git2-sys will link
dynamically if the library can be found. Force this by exporting the
variable so it refuses to build if it can't link.

Add anti-vendoring exports for libsqlite3-sys, openssl-sys, and
zstd-sys.  Also explicitly tell pkg-config-sys that we'd prefer to never
build vendorered code, and link dynamically not statically.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/cargo_common.bbclass   | 23 ++++++++++++++++++++++
 meta/recipes-devtools/rust/cargo_1.96.1.bb |  9 ---------
 2 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-reci=
pe/cargo_common.bbclass
index c1fe6a24ed6..a21c5423642 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -226,6 +226,29 @@ oe_cargo_fix_env () {
 	export HOST_CFLAGS=3D"${BUILD_CFLAGS}"
 	export HOST_CXXFLAGS=3D"${BUILD_CXXFLAGS}"
 	export HOST_AR=3D"${BUILD_AR}"
+
+	# Tell crates to use system libraries instead of vendoring C code
+
+	# git2-rs
+	export LIBGIT2_NO_VENDOR=3D"1"
+
+	# libssh2-sys
+	export LIBSSH2_SYS_USE_PKG_CONFIG=3D"1"
+
+	# libsqlite3-sys
+	export LIBSQLITE3_SYS_USE_PKG_CONFIG=3D"1"
+
+	# openssl-sys
+	export OPENSSL_NO_VENDOR=3D"1"
+
+	# pkg-config-rs. Crates can still override the dynamic linking
+	# but try to dynamically link to system libraries.
+	# https://docs.rs/pkg-config/latest/pkg_config/
+	export SYSTEM_DEPS_BUILD_INTERNAL=3D"never"
+	export PKG_CONFIG_ALL_DYNAMIC=3D"1"
+
+	# zstd-sys
+	export ZSTD_SYS_USE_PKG_CONFIG=3D"1"
 }
=20
 EXTRA_OECARGO_PATHS ??=3D ""
diff --git a/meta/recipes-devtools/rust/cargo_1.96.1.bb b/meta/recipes-de=
vtools/rust/cargo_1.96.1.bb
index 16f8a76310b..179ed2bbb56 100644
--- a/meta/recipes-devtools/rust/cargo_1.96.1.bb
+++ b/meta/recipes-devtools/rust/cargo_1.96.1.bb
@@ -72,15 +72,6 @@ do_install:append:class-nativesdk() {
=20
 FILES:${PN} +=3D "${base_prefix}/environment-setup.d"
=20
-# Disabled due to incompatibility with libgit2 0.28.x (https://github.co=
m/rust-lang/git2-rs/issues/458, https://bugs.gentoo.org/707746#c1)
-# as shipped by Yocto Dunfell.
-# According to https://github.com/rust-lang/git2-rs/issues/458#issuecomm=
ent-522567539, there are no compatibility guarantees between
-# libgit2-sys and arbitrary system libgit2 versions, so better keep this=
 turned off.
-#export LIBGIT2_SYS_USE_PKG_CONFIG =3D "1"
-
-# Needed for pkg-config to be used
-export LIBSSH2_SYS_USE_PKG_CONFIG =3D "1"
-
 # When building cargo-native we don't have cargo-native to use and depen=
d on,
 # so we must use the locally set up snapshot to bootstrap the build.
 BASEDEPENDS:remove:class-native =3D "cargo-native"
--=20
2.43.0


