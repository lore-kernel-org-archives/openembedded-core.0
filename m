Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A74CDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 17:03:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.132579.1697475818581751736
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 10:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F11B1FB;
	Mon, 16 Oct 2023 10:04:18 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2A2F03F64C;
	Mon, 16 Oct 2023 10:03:37 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] man-db: add RRECOMMENDS on glibc-utils for iconv
Date: Mon, 16 Oct 2023 18:03:34 +0100
Message-Id: <20231016170334.3505926-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 17:03:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189307

From: Ross Burton <ross.burton@arm.com>

Sometimes man will want to call iconv to convert character encodings, so
recommend glibc-utils on glibc systems for that binary.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/man-db/man-db_2.11.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/man-db/man-db_2.11.2.bb b/meta/recipes=
-extended/man-db/man-db_2.11.2.bb
index 3884a531a6a..76e3786b269 100644
--- a/meta/recipes-extended/man-db/man-db_2.11.2.bb
+++ b/meta/recipes-extended/man-db/man-db_2.11.2.bb
@@ -52,7 +52,9 @@ FILES:${PN}-dev +=3D "${libdir}/man-db/libman.so ${libd=
ir}/${BPN}/libmandb.so"
=20
 RDEPENDS:${PN} +=3D "groff"
 RRECOMMENDS:${PN} +=3D "less"
-RPROVIDES:${PN} +=3D " man"
+# iconv from glibc-utils can be used to transform encoding
+RRECOMMENDS:${PN}:append:libc-glibc =3D " glibc-utils"
+RPROVIDES:${PN} +=3D "man"
=20
 def compress_pkg(d):
     if bb.utils.contains("INHERIT", "compress_doc", True, False, d):
--=20
2.34.1


