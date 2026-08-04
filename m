Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C4DC561F8
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 16:58:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21232.1785862691617575847
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 09:58:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=A4DXXTNQ;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 043391476
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 09:58:07 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AB4693F66F
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 09:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785862691; bh=OtAV9CDQm3VaojLG/5RiZ0a1aY3IySsXxKFJFfR0HgA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=A4DXXTNQEZMAiFuZGLyMGa0Qet/SrHN6rSaOwLKVPLL/i0nQ8tb97dC1s+202T2aI
	 fuqfeuq0Ju35DwYftqoZQuxS700pRg4YrJ7oRFESCGPXW2E/iFA2ca6LpY/TwkaqW6
	 RPsKTxrlAdBWVtTx4xxe94dGX3twLIhGY6zljD7w=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/9] classes/cargo: move general assignments to cargo_common.bbclass
Date: Tue,  4 Aug 2026 17:57:57 +0100
Message-ID: <20260804165803.598030-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804165803.598030-1-ross.burton@arm.com>
References: <20260804165803.598030-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 16:58:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242783

The cargo integration is split into two classes so that recipes can
inherit cargo_common if they can't use cargo directly to build, for
example when using meson+cargo or building rust itself.

However, a number of variables where in cargo.bbclass when they should
really be in cargo_common.bbclass: move the assignments so that the
cargo.bbclass simply inherits cargo_common, sets B, and implements the
compile/install tasks.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/cargo.bbclass        | 27 ----------------------
 meta/classes-recipe/cargo_common.bbclass | 29 ++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 27 deletions(-)

diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/carg=
o.bbclass
index b34f3ce0cd7..31e655650cc 100644
--- a/meta/classes-recipe/cargo.bbclass
+++ b/meta/classes-recipe/cargo.bbclass
@@ -26,33 +26,6 @@ DEPENDS:append:class-native =3D " rust-native"
 # Enable build separation
 B =3D "${WORKDIR}/build"
=20
-# In case something fails in the build process, give a bit more feedback=
 on
-# where the issue occured
-export RUST_BACKTRACE =3D "1"
-
-RUSTFLAGS ??=3D ""
-
-# The cargo profile to use. Defaults to release or dev based on DEBUG_BU=
ILD, but
-# can be set to any valid profile.
-# https://doc.rust-lang.org/cargo/reference/profiles.html
-CARGO_PROFILE ?=3D "${@oe.utils.vartrue('DEBUG_BUILD', 'dev', 'release',=
 d)}"
-
-# --frozen flag will prevent network access (which is required since onl=
y
-# the do_fetch step is authorized to access network)
-# and will require an up to date Cargo.lock file.
-# This force the package being built to already ship a Cargo.lock, in th=
e end
-# this is what we want, at least, for reproducibility of the build.
-CARGO_BUILD_FLAGS =3D "-v --frozen --target ${RUST_HOST_SYS} --profile=3D=
${CARGO_PROFILE} --manifest-path=3D${CARGO_MANIFEST_PATH}"
-
-# The build directory is named after the profile, apart from the dev pro=
file
-# which uses 'debug'.
-def cargo_build_directory(d):
-    profile =3D d.getVar("CARGO_PROFILE")
-    return "debug" if profile =3D=3D "dev" else profile
-BUILD_DIR =3D "${@cargo_build_directory(d)}"
-
-CARGO_TARGET_SUBDIR =3D "${RUST_HOST_SYS}/${BUILD_DIR}"
-
 oe_cargo_build () {
 	export RUSTFLAGS=3D"${RUSTFLAGS}"
 	bbnote "Using rust targets from ${RUST_TARGET_PATH}"
diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-reci=
pe/cargo_common.bbclass
index 95739122a59..0fb6844d932 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -17,6 +17,35 @@
 # add crate fetch support
 inherit rust-common
=20
+# In case something fails in the build process, give a bit more feedback=
 on
+# where the issue occured
+export RUST_BACKTRACE =3D "1"
+
+# Flags passed to all invocations of rustc
+# https://doc.rust-lang.org/cargo/reference/config.html#buildrustflags
+RUSTFLAGS ??=3D ""
+
+# The cargo profile to use. Defaults to release or dev based on DEBUG_BU=
ILD, but
+# can be set to any valid profile.
+# https://doc.rust-lang.org/cargo/reference/profiles.html
+CARGO_PROFILE ?=3D "${@oe.utils.vartrue('DEBUG_BUILD', 'dev', 'release',=
 d)}"
+
+# --frozen flag will prevent network access (which is required since onl=
y
+# the do_fetch step is authorized to access network)
+# and will require an up to date Cargo.lock file.
+# This force the package being built to already ship a Cargo.lock, in th=
e end
+# this is what we want, at least, for reproducibility of the build.
+CARGO_BUILD_FLAGS =3D "-v --frozen --target ${RUST_HOST_SYS} --profile=3D=
${CARGO_PROFILE} --manifest-path=3D${CARGO_MANIFEST_PATH}"
+
+# The build directory is named after the profile, apart from the dev pro=
file
+# which uses 'debug'.
+def cargo_build_directory(d):
+    profile =3D d.getVar("CARGO_PROFILE")
+    return "debug" if profile =3D=3D "dev" else profile
+BUILD_DIR =3D "${@cargo_build_directory(d)}"
+
+CARGO_TARGET_SUBDIR =3D "${RUST_HOST_SYS}/${BUILD_DIR}"
+
 # Where we download our registry and dependencies to
 export CARGO_HOME =3D "${UNPACKDIR}/cargo_home"
=20
--=20
2.43.0


