Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A05DBC44516
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 14:05:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6662.1784124314484786377
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 07:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=p1cmWzTm;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 752B81477
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 07:05:09 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 552FC3F7B4
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 07:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784124313; bh=KO45LcOZ63T4ymF2B5mMzrSU/8o8iAhlFjOXT5M66ys=;
	h=From:To:Subject:Date:From;
	b=p1cmWzTm4Zfp39uoQqUy6+TEXbxJOOGaokeIXsLZc0R/o/96naVdrdWvEGM+8chXX
	 QkgewUwP7+mPbbf5qZSyli6tlJi3P9zN0YRwNGA5/RWMJJuxZeUAP5xMCQa4ErZYu2
	 jwmywjKosYl6eHRaUBVDBLQ+cgPDAd8CMM26eQtg=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/12] libxml2: clean up xmlconf mode fixups
Date: Wed, 15 Jul 2026 15:04:56 +0100
Message-ID: <20260715140507.2329605-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 14:05:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240960

The xmlconf files are executable and there is a lot of them, which means
in ptest builds every file is opened in case it's an ELF.

Currently we chmod -x the xmlconf tree in do_configure which modifies
the source tree in every build.  Instead, we can just tell the cp to not
preserve the modes when copying the tree in do_install_ptest.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/libxml/libxml2_2.15.3.bb | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2_2.15.3.bb b/meta/recipes-co=
re/libxml/libxml2_2.15.3.bb
index 096a719d1c4..369f27ad2b2 100644
--- a/meta/recipes-core/libxml/libxml2_2.15.3.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.3.bb
@@ -57,15 +57,11 @@ PACKAGE_BEFORE_PN +=3D "${PN}-utils"
 FILES:${PN}-staticdev +=3D "${PYTHON_SITEPACKAGES_DIR}/*.a"
 FILES:${PN}-utils =3D "${bindir}/*"
=20
-do_configure:prepend () {
-	# executables take longer to package: these should not be executable
-	find ${S}/xmlconf/ -type f -exec chmod -x {} \+
-}
-
 do_install_ptest () {
     oe_runmake DESTDIR=3D${D} ptestdir=3D${PTEST_PATH} install-test-data
=20
-	cp -r ${S}/xmlconf ${D}${PTEST_PATH}
+	# executables take longer to package: these should not be executable
+	cp -r --no-preserve=3Dmode ${S}/xmlconf ${D}${PTEST_PATH}
 }
=20
 # with musl we need to enable icu support explicitly for these tests
--=20
2.43.0


