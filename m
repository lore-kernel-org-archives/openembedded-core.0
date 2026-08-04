Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35739C56205
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 16:58:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21211.1785862692875506295
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 09:58:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=SFBwGdIR;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 593141476
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 09:58:08 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0CAB43F66F
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 09:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785862692; bh=hFRNAIDIyO1aI7ZN3d6e+BbGb9+O8/l5/YGuKJzsDfY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SFBwGdIRh0CD3d+1QTLHk1mgJImq5Op7BkU+wE7GLwtmnGmVRtlcPYHpJupeGtBcW
	 QHnOalQZWbGPtT1MSaSV/l+LGXE4BTn0pVnNsSk31etEK65THcndPDdFq+7xrLzfvw
	 sVwXYvm8i0mZw0ACZFg3utHhyoXw3Ld7sgHuRCl4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/9] rust: clean up dependencies
Date: Tue,  4 Aug 2026 17:57:59 +0100
Message-ID: <20260804165803.598030-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804165803.598030-1-ross.burton@arm.com>
References: <20260804165803.598030-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 16:58:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242785

The rust recipe inherits cargo_common which now depends on rust-native
and cargo-native, so we can just remove those dependencies in the native
case instead of having to handle target/nativesdk.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/rust/rust_1.96.1.bb | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust_1.96.1.bb b/meta/recipes-dev=
tools/rust/rust_1.96.1.bb
index f8f47b04142..7d1761c562c 100644
--- a/meta/recipes-devtools/rust/rust_1.96.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.96.1.bb
@@ -12,21 +12,19 @@ inherit rust
 inherit cargo_common
=20
 DEPENDS +=3D "llvm"
+
 # native rust uses cargo/rustc from binary snapshots to bootstrap
 # but everything else should use our native builds
-DEPENDS:append:class-target =3D " cargo-native rust-native"
-DEPENDS:append:class-nativesdk =3D " cargo-native rust-native"
+DEPENDS:remove:class-native =3D "cargo-native"
+INHIBIT_DEFAULT_RUST_DEPS:class-native =3D "1"
+
+PROVIDES:class-native =3D "virtual/${TARGET_PREFIX}rust"
=20
 RDEPENDS:${PN}:append:class-target =3D " gcc g++ binutils"
=20
 PACKAGECONFIG ??=3D "llvm-shared"
 PACKAGECONFIG[llvm-shared] =3D ",,,"
=20
-# Otherwise we'll depend on what we provide
-INHIBIT_DEFAULT_RUST_DEPS:class-native =3D "1"
-# We don't need to depend on gcc-native because yocto assumes it exists
-PROVIDES:class-native =3D "virtual/${TARGET_PREFIX}rust"
-
 S =3D "${RUSTSRC}"
 # Separate build directory from the shared source tree so that multiple
 # variants (target, native, nativesdk) don't conflict in the source dir.
--=20
2.43.0


