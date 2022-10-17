Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB9FAC43219
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 13:32:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.40874.1666013537509519161
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Oct 2022 06:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64E8A113E;
	Mon, 17 Oct 2022 06:32:23 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 97FEB3F67D;
	Mon, 17 Oct 2022 06:32:16 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/3] zlib: do out-of-tree builds
Date: Mon, 17 Oct 2022 14:32:10 +0100
Message-Id: <20221017133211.212616-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017133211.212616-1-ross.burton@arm.com>
References: <20221017133211.212616-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 13:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171910

zlib supports out-of-tree builds, so do them.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/zlib/zlib_1.2.12.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/zlib/zlib_1.2.12.bb b/meta/recipes-core/zl=
ib/zlib_1.2.12.bb
index 2491cb941f5..9ec78b95be0 100644
--- a/meta/recipes-core/zlib/zlib_1.2.12.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.12.bb
@@ -30,9 +30,12 @@ RDEPENDS:${PN}-ptest +=3D "make"
=20
 inherit ptest
=20
+B =3D "${WORKDIR}/build"
+
 do_configure() {
-	LDCONFIG=3Dtrue ./configure --prefix=3D${prefix} --shared --libdir=3D${=
libdir} --uname=3DGNU
+	LDCONFIG=3Dtrue ${S}/configure --prefix=3D${prefix} --shared --libdir=3D=
${libdir} --uname=3DGNU
 }
+do_configure[cleandirs] +=3D "${B}"
=20
 do_compile() {
 	oe_runmake shared
--=20
2.34.1


