Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B531C4708D
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 16:16:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.17883.1673021784744207298
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 08:16:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A0B6113E;
	Fri,  6 Jan 2023 08:17:06 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C86843F71A;
	Fri,  6 Jan 2023 08:16:23 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] elfutils: disable deprecation errors in all builds, not just native
Date: Fri,  6 Jan 2023 16:16:21 +0000
Message-Id: <20230106161621.1288055-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 16:16:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175598

The curl-related deprecation errors affect all builds not just native,
so set CFLAGS instead of BUILD_CFLAGS.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.188.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.188.bb b/meta/reci=
pes-devtools/elfutils/elfutils_0.188.bb
index c94e36071cd..084908a38c0 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.188.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.188.bb
@@ -34,7 +34,7 @@ EXTRA_OECONF =3D "--program-prefix=3Deu-"
=20
 BUILD_CFLAGS +=3D "-Wno-error=3Dstringop-overflow"
 # compatibility with curl 7.87; can be removed when elfutils upstream fi=
xes the deprecation fails
-BUILD_CFLAGS +=3D "-Wno-error=3Ddeprecated-declarations"
+CFLAGS:append =3D " -Wno-error=3Ddeprecated-declarations"
=20
 DEPENDS_BZIP2 =3D "bzip2-replacement-native"
 DEPENDS_BZIP2:class-target =3D "bzip2"
--=20
2.34.1


