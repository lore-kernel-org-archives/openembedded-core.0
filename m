Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40F5CCD1A4
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 13:27:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.15403.1760707640544526516
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 06:27:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34EA51595
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 06:27:12 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B92183F66E
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 06:27:19 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] libstd-rs: remove redundant CARGO_TARGET_DIR
Date: Fri, 17 Oct 2025 14:27:16 +0100
Message-ID: <20251017132717.3074920-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225021

The cargo class already sets this, so there's no need to set it again.

The value set by cargo.bbclass is actually ${B}/target, so update the
do_install task to match.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/rust/libstd-rs_1.90.0.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/rust/libstd-rs_1.90.0.bb b/meta/recipe=
s-devtools/rust/libstd-rs_1.90.0.bb
index b39ec0ab390..8af93bec579 100644
--- a/meta/recipes-devtools/rust/libstd-rs_1.90.0.bb
+++ b/meta/recipes-devtools/rust/libstd-rs_1.90.0.bb
@@ -34,7 +34,6 @@ CARGO_BUILD_FLAGS +=3D "--features '${CARGO_FEATURES}'"
 CARGO_VENDORING_DIRECTORY =3D "${RUSTSRC}/vendor"
=20
 do_compile:prepend () {
-    export CARGO_TARGET_DIR=3D"${B}"
     # For Rust 1.13.0 and newer
     export RUSTC_BOOTSTRAP=3D"1"
 }
@@ -45,8 +44,8 @@ do_install () {
     # With the incremental build support added in 1.24, the libstd deps =
directory also includes dependency
     # files that get installed. Those are really only needed to incremen=
tally rebuild the libstd library
     # itself and don't need to be installed.
-    rm -f ${B}/${RUST_TARGET_SYS}/${BUILD_DIR}/deps/*.d
-    cp ${B}/${RUST_TARGET_SYS}/${BUILD_DIR}/deps/* ${D}${rustlibdir}
+    rm -f ${B}/target/${RUST_TARGET_SYS}/${BUILD_DIR}/deps/*.d
+    cp ${B}/target/${RUST_TARGET_SYS}/${BUILD_DIR}/deps/* ${D}${rustlibd=
ir}
 }
=20
 BBCLASSEXTEND =3D "nativesdk"
--=20
2.43.0


