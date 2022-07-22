Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0AF7C433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 11:13:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.6524.1658488386205457616
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 04:13:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8EEAA1063;
	Fri, 22 Jul 2022 04:13:05 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 90A163F70D;
	Fri, 22 Jul 2022 04:13:04 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] zlib: remove historical movement of libz.so to /lib
Date: Fri, 22 Jul 2022 12:13:01 +0100
Message-Id: <20220722111301.2143531-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Jul 2022 11:13:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168401

Historically there's been a split between /lib for early boot and
/usr/lib for everything else, but with modern systems this split is
meaningless and incomplete. If a minimal system for early boot is
needed, it should be a full minimal system in a initramfs.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/zlib/zlib_1.2.12.bb | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/meta/recipes-core/zlib/zlib_1.2.12.bb b/meta/recipes-core/zl=
ib/zlib_1.2.12.bb
index e9217031375..77e7a4937fa 100644
--- a/meta/recipes-core/zlib/zlib_1.2.12.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.12.bb
@@ -39,16 +39,4 @@ do_install_ptest() {
 	install ${B}/examplesh ${D}${PTEST_PATH}
 }
=20
-# Move zlib shared libraries for target builds to $base_libdir so the li=
brary
-# can be used in early boot before $prefix is mounted.
-do_install:append:class-target() {
-	if [ ${base_libdir} !=3D ${libdir} ]
-	then
-		mkdir -p ${D}/${base_libdir}
-		mv ${D}/${libdir}/libz.so.* ${D}/${base_libdir}
-		libname=3D`readlink ${D}/${libdir}/libz.so`
-		ln -sf ${@oe.path.relative("${libdir}", "${base_libdir}")}/$libname ${=
D}${libdir}/libz.so
-	fi
-}
-
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


