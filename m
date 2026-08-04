Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA6F3C55838
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 16:58:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21212.1785862693819165164
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 09:58:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=YzcPvhB4;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13F781476
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 09:58:09 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B1BB53F66F
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 09:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785862693; bh=j/nsyXJmZcylBcuPCaLzk5Hl3XXF8cpRnotmhalaTZ4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YzcPvhB4U4QJ1VjbyYq5Wc2SEXCPtn0vkOa9x+GNjYivLn2OeUd9SVPY+Vq1hxwY3
	 Edjyjch0vYl8d4TcRO8bRWDCiqxlSabZcXqgNu1XDEE1duyEoauF+sfMFNK49qsW14
	 FIXlyLSAqHjvPCl3VWRVsroZkM44ApgZ6qGeObrs=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/9] classes/cargo_c: inherit cargo_common
Date: Tue,  4 Aug 2026 17:58:00 +0100
Message-ID: <20260804165803.598030-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804165803.598030-1-ross.burton@arm.com>
References: <20260804165803.598030-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 16:58:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242786

This class is an alternative to cargo.bbclass, and now the dependencies
have moved to cargo_common.bbclass it can inherit that class directly.

As cargo.bbclass sets B, we can set it in cargo_c.bbclass.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/cargo_c.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cargo_c.bbclass b/meta/classes-recipe/ca=
rgo_c.bbclass
index e91ee1d9fc0..18574b73cb2 100644
--- a/meta/classes-recipe/cargo_c.bbclass
+++ b/meta/classes-recipe/cargo_c.bbclass
@@ -9,7 +9,7 @@
 ## This class is used by any recipes that want to compile a C ABI compat=
ible
 ## library with header and pkg config file
=20
-inherit cargo pkgconfig
+inherit cargo_common pkgconfig
=20
 # the binaries we will use
 CARGO_C_BUILD =3D "cargo-cbuild"
@@ -18,6 +18,8 @@ CARGO_C_INSTALL =3D "cargo-cinstall"
 # We need cargo-c to compile for the target
 BASEDEPENDS:append =3D " cargo-c-native"
=20
+B =3D "${WORKDIR}/build"
+
 do_compile[progress] =3D "outof:\s+(\d+)/(\d+)"
 cargo_c_do_compile() {
     oe_cargo_fix_env
--=20
2.43.0


