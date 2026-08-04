Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC17C56201
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 16:58:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21233.1785862692161052914
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 09:58:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=ABslkqp8;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9CDB165C
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 09:58:07 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5BC673F66F
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 09:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785862691; bh=m2yVo8OuCPKS1d21oM8BTwjKWivskcDDewi0hnViFzg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ABslkqp8J3lxo7WJsoMw4Q2bwtkR+c5rErxYl0rf7yWVrem9UPTe0DH/dCkNmlgRj
	 DWiIStkeolTyKUk0zJtSszsY9W77Do5v4zhDvZk6aIVyjbNxFe2HxMXVQ+NGHmYXgX
	 cuKYHkBvpi2NLQH/WPv8r9TLt1tcmDVOUbrsOdDs=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/9] classes/cargo: consolidate dependencies
Date: Tue,  4 Aug 2026 17:57:58 +0100
Message-ID: <20260804165803.598030-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804165803.598030-1-ross.burton@arm.com>
References: <20260804165803.598030-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 16:58:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242784

Move the dependencies from cargo to cargo_common: if cargo is being used
in any way then you need to depend on cargo-native.

Inherit rust instead of rust-common or rust-target-config: rust inherits
rust-common that inherits rust-target-config, and rust.bbclass simply
adds the dependency on rust-native. This means we can drop the explicit
rust dependencies to avoid duplication.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/cargo.bbclass        | 9 ---------
 meta/classes-recipe/cargo_common.bbclass | 4 +++-
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/carg=
o.bbclass
index 31e655650cc..628dbc98f18 100644
--- a/meta/classes-recipe/cargo.bbclass
+++ b/meta/classes-recipe/cargo.bbclass
@@ -10,19 +10,10 @@
 ## Cargo.
=20
 inherit cargo_common
-inherit rust-target-config
=20
 # the binary we will use
 CARGO =3D "cargo"
=20
-# We need cargo to compile for the target
-BASEDEPENDS:append =3D " cargo-native"
-
-# Ensure we get the right rust variant
-DEPENDS:append:class-target =3D " rust-native ${RUSTLIB_DEP}"
-DEPENDS:append:class-nativesdk =3D " rust-native ${RUSTLIB_DEP}"
-DEPENDS:append:class-native =3D " rust-native"
-
 # Enable build separation
 B =3D "${WORKDIR}/build"
=20
diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-reci=
pe/cargo_common.bbclass
index 0fb6844d932..f58bd80728c 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -15,7 +15,9 @@
 ##
=20
 # add crate fetch support
-inherit rust-common
+inherit rust
+
+BASEDEPENDS:append =3D " cargo-native"
=20
 # In case something fails in the build process, give a bit more feedback=
 on
 # where the issue occured
--=20
2.43.0


