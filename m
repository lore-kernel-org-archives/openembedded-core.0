Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 355D5C56203
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 16:58:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21210.1785862690982759962
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 09:58:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=evyF3m2O;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50E1B165C
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 09:58:06 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 05B2D3F66F
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 09:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785862690; bh=O2FPLrxOStcXzRUu0wocSOI7QzysIgGaz8nRHLHE+94=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=evyF3m2OB27ehFidx9iakL8ksB6tawZZxkae0EFLK9sBcCV7KnDli14PveeUzF0ko
	 EzXLY33bIAQ3BhRvIqpjNkEy39+1g3GkAgGIAhTXlFa88MKZS4+tQKJW/l8wAUUD6n
	 TgvtItP/BMqcpRSxo86/7leeQ0RwNmCQzohoAr1o=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/9] classes/rust: remove unused variables
Date: Tue,  4 Aug 2026 17:57:56 +0100
Message-ID: <20260804165803.598030-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804165803.598030-1-ross.burton@arm.com>
References: <20260804165803.598030-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 16:58:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242782

RUSTC_ARCHFLAGS is never passed anywhere, remove it.

RUSTC_BUILD_LDFLAGS is commented out, remove it.

HOST_CFLAGS et al are assigned to the CFLAGS for convenience, but are
not used anywhere and the same values are exported in cargo_common's
oe_cargo_fix_env().

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/rust.bbclass | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/meta/classes-recipe/rust.bbclass b/meta/classes-recipe/rust.=
bbclass
index e727601679a..6407c103941 100644
--- a/meta/classes-recipe/rust.bbclass
+++ b/meta/classes-recipe/rust.bbclass
@@ -8,8 +8,6 @@ inherit rust-common
=20
 RUSTC =3D "rustc"
=20
-RUSTC_ARCHFLAGS +=3D "--target=3D${RUST_HOST_SYS} ${RUSTFLAGS}"
-
 def rust_base_dep(d):
     # Taken from meta/classes/base.bbclass `base_dep_prepend` and modifi=
ed to
     # use rust instead of gcc
@@ -23,26 +21,6 @@ def rust_base_dep(d):
=20
 DEPENDS:append =3D " ${@rust_base_dep(d)}"
=20
-# BUILD_LDFLAGS
-# 	${STAGING_LIBDIR_NATIVE}
-# 	${STAGING_BASE_LIBDIR_NATIVE}
-# BUILDSDK_LDFLAGS
-# 	${STAGING_LIBDIR}
-# 	#{STAGING_DIR_HOST}
-# TARGET_LDFLAGS ?????
-#RUSTC_BUILD_LDFLAGS =3D "\
-#	--sysroot ${STAGING_DIR_NATIVE} \
-#	-L${STAGING_LIBDIR_NATIVE}	\
-#	-L${STAGING_BASE_LIBDIR_NATIVE}	\
-#"
-
-# XXX: for some reason bitbake sets BUILD_* & TARGET_* but uses the bare
-# variables for HOST. Alias things to make it easier for us.
-HOST_LDFLAGS  ?=3D "${LDFLAGS}"
-HOST_CFLAGS   ?=3D "${CFLAGS}"
-HOST_CXXFLAGS ?=3D "${CXXFLAGS}"
-HOST_CPPFLAGS ?=3D "${CPPFLAGS}"
-
 rustlib_suffix =3D "${TUNE_ARCH}${TARGET_VENDOR}-${TARGET_OS}/rustlib/${=
RUST_HOST_SYS}/lib"
 # Native sysroot standard library path
 rustlib_src =3D "${prefix}/lib/${rustlib_suffix}"
--=20
2.43.0


