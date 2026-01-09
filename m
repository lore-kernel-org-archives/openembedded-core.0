Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 891ACD1A62F
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 13:11:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9656.1767964300614703488
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 05:11:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CE92FEC
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Jan 2026 05:11:33 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CFA793F6A8
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Jan 2026 05:11:39 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/11] lzo: use libtool to install test binaries
Date: Fri,  9 Jan 2026 13:11:24 +0000
Message-ID: <20260109131130.3006446-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109131130.3006446-1-ross.burton@arm.com>
References: <20260109131130.3006446-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 13:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229110

If libtool builds a binary it's best to use libtool to install it, as
otherwise you might install a wrapper script or need to make assumptions
about where libtool has put the real binary (as this isn't always .libs)

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/lzo/lzo_2.10.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/lzo/lzo_2.10.bb b/meta/recipes-support/=
lzo/lzo_2.10.bb
index dbe789b4e6..fbf9f2dbac 100644
--- a/meta/recipes-support/lzo/lzo_2.10.bb
+++ b/meta/recipes-support/lzo/lzo_2.10.bb
@@ -23,10 +23,10 @@ EXTRA_OECONF =3D "--enable-shared"
=20
 do_install_ptest() {
 	t=3D${D}${PTEST_PATH}
-	cp ${S}/util/check.sh $t
-	cp ${B}/minilzo/testmini $t
-	for i in tests/align tests/chksum lzotest/lzotest examples/simple
-		do cp ${B}/`dirname $i`/.libs/`basename $i` $t; \
+	install ${S}/util/check.sh $t
+	install ${B}/minilzo/testmini $t
+	for i in tests/align tests/chksum lzotest/lzotest examples/simple; do
+		${B}/libtool --mode=3Dinstall install ${B}/$i $t
 	done
 }
=20
--=20
2.43.0


