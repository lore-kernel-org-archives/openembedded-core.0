Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB7F1C55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 16:58:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21213.1785862694178102193
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 09:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=FvAUdaz8;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BAF42165C
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 09:58:09 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6C68B3F66F
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 09:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785862693; bh=OKY5qFwMntA9PsvoyvdllbPyOkepXTL1hwu8nxS1QxA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FvAUdaz85QzUPh9ja9BDGjP3YwuN4w08GI9E2VYScyUreN3hwkIWcXw4P37vjhR2B
	 2blNx5KquEN1vEeK+Tvkunl0LJPRpbAI/hOEmZuA0315K9OCrW7+mEXIKU2Rhw1OUx
	 eRor5Q7qX7U/dkWOMU4/g1EIoPaksMN273kdte5A=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/9] classes/cargo-c: remove CARGO_C_BUILD/CARGO_C_INSTALL variables
Date: Tue,  4 Aug 2026 17:58:01 +0100
Message-ID: <20260804165803.598030-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804165803.598030-1-ross.burton@arm.com>
References: <20260804165803.598030-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 16:58:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242787

There's no point in having variables to control what cargo-c binaries
are executed as there are no alternatives.

The cargo class does this because it is used when bootstrapping cargo.
This isn't needed to build cargo-c, but the pattern was copied into this
class.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/cargo_c.bbclass | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/meta/classes-recipe/cargo_c.bbclass b/meta/classes-recipe/ca=
rgo_c.bbclass
index 18574b73cb2..e68ac93a610 100644
--- a/meta/classes-recipe/cargo_c.bbclass
+++ b/meta/classes-recipe/cargo_c.bbclass
@@ -11,10 +11,6 @@
=20
 inherit cargo_common pkgconfig
=20
-# the binaries we will use
-CARGO_C_BUILD =3D "cargo-cbuild"
-CARGO_C_INSTALL =3D "cargo-cinstall"
-
 # We need cargo-c to compile for the target
 BASEDEPENDS:append =3D " cargo-c-native"
=20
@@ -25,16 +21,13 @@ cargo_c_do_compile() {
     oe_cargo_fix_env
     export RUSTFLAGS=3D"${RUSTFLAGS}"
     bbnote "Using rust targets from ${RUST_TARGET_PATH}"
-    bbnote "cargo-cbuild =3D $(which ${CARGO_C_BUILD})"
-    bbnote "${CARGO_C_BUILD} cbuild ${CARGO_BUILD_FLAGS}"
-    "${CARGO_C_BUILD}" cbuild ${CARGO_BUILD_FLAGS}
+    cargo-cbuild cbuild ${CARGO_BUILD_FLAGS}
 }
=20
 cargo_c_do_install() {
     oe_cargo_fix_env
     export RUSTFLAGS=3D"${RUSTFLAGS}"
-    bbnote "cargo-cinstall =3D $(which ${CARGO_C_INSTALL})"
-    "${CARGO_C_INSTALL}" cinstall ${CARGO_BUILD_FLAGS} \
+    cargo-cinstall cinstall ${CARGO_BUILD_FLAGS} \
         --destdir ${D} \
         --prefix ${prefix} \
         --libdir ${libdir} \
--=20
2.43.0


