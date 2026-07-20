Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 209E5C44529
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 19:45:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5985.1784576720688113073
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 12:45:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=uYriarBp;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC4291476
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 12:45:15 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B13763F99C
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 12:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784576720; bh=hRcaHkuRpWyJCOaIcXaAXcQfX2k1+7pQzrKHr1lfKdM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=uYriarBp5frrmQVadc10A80eKFatoNMAQPLnSLtWSHHybpa+/TXWjMoZb0BFVjZDA
	 F/6zlLdE49R4gZzBFyjGXwOYZMl0v9qiX20cwe1fX4QBVRb6Z/4OwlAaQpLAVAwM/4
	 JxEgr69Z2l+zjz0aWAxkOqB8+vG+oTbcsJlUq/cg=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] classes/cargo: remove BUILD_MODE, replace with CARGO_PROFILE
Date: Mon, 20 Jul 2026 20:45:10 +0100
Message-ID: <20260720194510.3193319-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720194510.3193319-1-ross.burton@arm.com>
References: <20260720194510.3193319-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 19:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241489

The BUILD_MODE variable appears to be a way to select the Cargo build pro=
file
that is used, but it can't be assigned because it and other pieces of
code base their logic on the value of DEBUG_BUILD.

Instead of a BUILD_MODE variable that is "--release" or "" depending on
the value of DEBUG_BUILD, replace it with a clear CARGO_PROFILE variable
that selects the profile to use. The default has the same behaviour as be=
fore:
either "release" or "dev" based on DEBUG_BUILD.

This profile is then passed to cargo, and used to construct paths in the
build tree (with the caveat that the "dev" profile puts files in "debug")=
.

[1] https://doc.rust-lang.org/cargo/reference/profiles.html

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/cargo.bbclass | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/carg=
o.bbclass
index 8e05a820af4..b34f3ce0cd7 100644
--- a/meta/classes-recipe/cargo.bbclass
+++ b/meta/classes-recipe/cargo.bbclass
@@ -31,18 +31,28 @@ B =3D "${WORKDIR}/build"
 export RUST_BACKTRACE =3D "1"
=20
 RUSTFLAGS ??=3D ""
-BUILD_MODE =3D "${@['--release', ''][d.getVar('DEBUG_BUILD') =3D=3D '1']=
}"
+
+# The cargo profile to use. Defaults to release or dev based on DEBUG_BU=
ILD, but
+# can be set to any valid profile.
+# https://doc.rust-lang.org/cargo/reference/profiles.html
+CARGO_PROFILE ?=3D "${@oe.utils.vartrue('DEBUG_BUILD', 'dev', 'release',=
 d)}"
+
 # --frozen flag will prevent network access (which is required since onl=
y
 # the do_fetch step is authorized to access network)
 # and will require an up to date Cargo.lock file.
 # This force the package being built to already ship a Cargo.lock, in th=
e end
 # this is what we want, at least, for reproducibility of the build.
-CARGO_BUILD_FLAGS =3D "-v --frozen --target ${RUST_HOST_SYS} ${BUILD_MOD=
E} --manifest-path=3D${CARGO_MANIFEST_PATH}"
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
=20
-# This is based on the content of CARGO_BUILD_FLAGS and generally will n=
eed to
-# change if CARGO_BUILD_FLAGS changes.
-BUILD_DIR =3D "${@['release', 'debug'][d.getVar('DEBUG_BUILD') =3D=3D '1=
']}"
 CARGO_TARGET_SUBDIR =3D "${RUST_HOST_SYS}/${BUILD_DIR}"
+
 oe_cargo_build () {
 	export RUSTFLAGS=3D"${RUSTFLAGS}"
 	bbnote "Using rust targets from ${RUST_TARGET_PATH}"
--=20
2.43.0


