Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8E43CA5FA5
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 15:15:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.60948.1790608495002026831
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 08:14:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=bmcidDhe;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D342C1655;
	Mon, 28 Sep 2026 08:14:50 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D7D383F763;
	Mon, 28 Sep 2026 08:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790608494; bh=8X6bMvTeOpEfwrJ2Zkj310xNZFrvGnwFozMXV7E5qvs=;
	h=From:To:Cc:Subject:Date:From;
	b=bmcidDheBgUDHISnQJCjEcLVN1H3xhz+k6332fd/oCFigG0Awgma1BmON7dZMAk2V
	 FY5UqWpPplQm9Fbc+an/BqZQGvgc+0Cr5CJAN6dX0DsJqYK63H4eYojUOPw8mECEQC
	 b/kAXw/tShGW3ZXVw2DckmYYj+3fmvuoSUh+c7x4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: enrico.scholz@sigma-chemnitz.de
Subject: [PATCH] classes/cargo_c: use CARGO_C_BUILD_FLAGS for cargo-c flags
Date: Mon, 28 Sep 2026 16:14:47 +0100
Message-ID: <20260928151447.752712-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 15:15:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246771

My previous attempt at cleaning up this recipe[1] moved cargo-c specific
flags to CARGO_BUILD_FLAGS, which meant that they were passed to cargo
if that was also called directly (e.g. via ptest-cargo.bbclass).

Avoid this by using a new varibale CARGO_C_BUILD_FLAGS for cargo-c flags.

[1] oe-core 90792837769 ("classes/cargo-c: pass flags via CARGO_BUILD_FLA=
GS")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/cargo_c.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/cargo_c.bbclass b/meta/classes-recipe/ca=
rgo_c.bbclass
index cd486b20067..ee6efaf0f9b 100644
--- a/meta/classes-recipe/cargo_c.bbclass
+++ b/meta/classes-recipe/cargo_c.bbclass
@@ -16,7 +16,7 @@ BASEDEPENDS:append =3D " cargo-c-native"
=20
 B =3D "${WORKDIR}/build"
=20
-CARGO_BUILD_FLAGS +=3D "\
+CARGO_C_BUILD_FLAGS =3D "\
     --destdir ${D} \
     --prefix ${prefix} \
     --libdir ${libdir} \
@@ -28,13 +28,13 @@ cargo_c_do_compile() {
     oe_cargo_fix_env
     export RUSTFLAGS=3D"${RUSTFLAGS}"
     bbnote "Using rust targets from ${RUST_TARGET_PATH}"
-    cargo-cbuild cbuild ${CARGO_BUILD_FLAGS}
+    cargo-cbuild cbuild ${CARGO_BUILD_FLAGS} ${CARGO_C_BUILD_FLAGS}
 }
=20
 cargo_c_do_install() {
     oe_cargo_fix_env
     export RUSTFLAGS=3D"${RUSTFLAGS}"
-    cargo-cinstall cinstall ${CARGO_BUILD_FLAGS}
+    cargo-cinstall cinstall ${CARGO_BUILD_FLAGS} ${CARGO_C_BUILD_FLAGS}
 }
=20
 EXPORT_FUNCTIONS do_compile do_install
--=20
2.43.0


