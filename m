Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF6FC56202
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 16:58:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21209.1785862690352603610
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 09:58:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=ZPF0mHEE;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5BC21476
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 09:58:05 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5382A3F66F
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 09:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785862689; bh=twSgCRYh+pWQxkgNTcPmDQZfPWAp89omajrL+vWGLx0=;
	h=From:To:Subject:Date:From;
	b=ZPF0mHEEw7voSMp43q/Bm0p5WWEd8m5KneWz8ogOfVpmfSa0nRysmtfFRKzzkvZLR
	 J319oBbHB5YZboSuPQM5oQxX9zgKLNxId07ARdF323NtXy4Fi1HPaq0WT0+F2cOHJs
	 oklW/wZryF4nDwg5RX3EB0F1zDTDuVuVCOxu9lwA=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/9] classes/cargo_common: move PKG_CONFIG_ALLOW_CROSS export to oe_cargo_fix_env
Date: Tue,  4 Aug 2026 17:57:55 +0100
Message-ID: <20260804165803.598030-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 16:58:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242781

This export is used to tell the pkg-config-rs crate how to behave, so is
only needed at build time.  Move the export to oe_cargo_fix_env() along
with the other variables so that the exports are localised and not
global.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/cargo_common.bbclass | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-reci=
pe/cargo_common.bbclass
index a21c5423642..95739122a59 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -20,11 +20,6 @@ inherit rust-common
 # Where we download our registry and dependencies to
 export CARGO_HOME =3D "${UNPACKDIR}/cargo_home"
=20
-# The pkg-config-rs library used by cargo build scripts disables itself =
when
-# cross compiling unless this is defined. We set up pkg-config appropria=
tely
-# for cross compilation, so tell it we know better than it.
-export PKG_CONFIG_ALLOW_CROSS =3D "1"
-
 # Don't instruct cargo to use crates downloaded by bitbake. Some rust pa=
ckages,
 # for example the rust compiler itself, come with their own vendored sou=
rces.
 # Specifying two [source.crates-io] will not work.
@@ -241,11 +236,15 @@ oe_cargo_fix_env () {
 	# openssl-sys
 	export OPENSSL_NO_VENDOR=3D"1"
=20
-	# pkg-config-rs. Crates can still override the dynamic linking
-	# but try to dynamically link to system libraries.
+	# pkg-config-rs.
 	# https://docs.rs/pkg-config/latest/pkg_config/
-	export SYSTEM_DEPS_BUILD_INTERNAL=3D"never"
+	# In cross pkg-config-rs disables itself unless this is defined to tell=
 it
+	# we have set up sysroots appropriately.
+	export PKG_CONFIG_ALLOW_CROSS=3D"1"
+	# Crates can still override the dynamic linking but try to dynamically =
link
+	# to system libraries.
 	export PKG_CONFIG_ALL_DYNAMIC=3D"1"
+	export SYSTEM_DEPS_BUILD_INTERNAL=3D"never"
=20
 	# zstd-sys
 	export ZSTD_SYS_USE_PKG_CONFIG=3D"1"
--=20
2.43.0


