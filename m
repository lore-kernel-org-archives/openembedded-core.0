Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C452C2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 19:15:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7166.1747854899188126107
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 12:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB3FF1515
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 12:14:44 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 714853F673
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 12:14:58 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] rust: consolidate rust-llvm dependencies
Date: Wed, 21 May 2025 20:14:48 +0100
Message-ID: <20250521191449.1486927-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521191449.1486927-1-ross.burton@arm.com>
References: <20250521191449.1486927-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 19:15:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217056

There's no need to have multiple overrides for this, as BBCLASSEXTEND
will automatically map the dependencies as needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/rust/rust_1.85.1.bb | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust_1.85.1.bb b/meta/recipes-dev=
tools/rust/rust_1.85.1.bb
index 583437f1f3e..6411e43c961 100644
--- a/meta/recipes-devtools/rust/rust_1.85.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.85.1.bb
@@ -7,17 +7,12 @@ LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D9c0fae516f=
e8aaea2fb601db4800daf7"
 inherit rust
 inherit cargo_common
=20
-DEPENDS +=3D "file-native"
-DEPENDS:append:class-native =3D " rust-llvm-native"
-DEPENDS:append:class-nativesdk =3D " nativesdk-rust-llvm"
-
+DEPENDS +=3D "file-native rust-llvm"
 # native rust uses cargo/rustc from binary snapshots to bootstrap
 # but everything else should use our native builds
 DEPENDS:append:class-target =3D " cargo-native rust-native"
 DEPENDS:append:class-nativesdk =3D " cargo-native rust-native"
=20
-DEPENDS +=3D "rust-llvm (=3D${PV})"
-
 RDEPENDS:${PN}:append:class-target =3D " gcc g++ binutils"
=20
 # Otherwise we'll depend on what we provide
--=20
2.43.0


