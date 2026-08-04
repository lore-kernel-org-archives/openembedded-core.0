Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07489C55ABF
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 16:58:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21215.1785862695556574604
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 09:58:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=NhfAsAUn;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21CE51476
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 09:58:11 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C24533F66F
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 09:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785862695; bh=8bXbbaioeXBZs/w6m3RznA9M55fY66i988Oq/Hb/Bf8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NhfAsAUn+/Ut8W6VD2RzDsUgX3HyfhvOLtnJF2mD5pjsOaBnB6yDZnRJ7eTXDyXVj
	 WF+lbfr1dWhRh4ZrPtKE+7dyL0Y2i3JRnDdKn1+Cew18uJPbJd+QQbabC1NR5oBBHJ
	 jZYd6ZtK4YF8VXuUPBFwPrz/23CBT1nE6U8JI2Bc=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 9/9] classes/cargo: merge oe_cargo_build into cargo_do_compile
Date: Tue,  4 Aug 2026 17:58:03 +0100
Message-ID: <20260804165803.598030-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804165803.598030-1-ross.burton@arm.com>
References: <20260804165803.598030-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 16:58:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242789

A layer of indirection between cargo_do_compile() and actually calling
cargo isn't needed, so merge oe_cargo_build into cargo_do_compile.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/cargo.bbclass | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/carg=
o.bbclass
index 628dbc98f18..586071988a9 100644
--- a/meta/classes-recipe/cargo.bbclass
+++ b/meta/classes-recipe/cargo.bbclass
@@ -17,7 +17,8 @@ CARGO =3D "cargo"
 # Enable build separation
 B =3D "${WORKDIR}/build"
=20
-oe_cargo_build () {
+do_compile[progress] =3D "outof:\s+(\d+)/(\d+)"
+cargo_do_compile () {
 	export RUSTFLAGS=3D"${RUSTFLAGS}"
 	bbnote "Using rust targets from ${RUST_TARGET_PATH}"
 	bbnote "cargo =3D $(which ${CARGO})"
@@ -25,11 +26,6 @@ oe_cargo_build () {
 	"${CARGO}" build ${CARGO_BUILD_FLAGS} ${PACKAGECONFIG_CONFARGS} "$@"
 }
=20
-do_compile[progress] =3D "outof:\s+(\d+)/(\d+)"
-cargo_do_compile () {
-	oe_cargo_build
-}
-
 cargo_do_install () {
 	local have_installed=3Dfalse
 	for tgt in "${B}/target/${CARGO_TARGET_SUBDIR}/"*; do
--=20
2.43.0


