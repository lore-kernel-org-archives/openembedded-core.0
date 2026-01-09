Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F462D1A62D
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 13:11:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9655.1767964299847609708
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 05:11:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B36241684
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Jan 2026 05:11:32 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 285D63F6A8
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Jan 2026 05:11:39 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/11] libpcre: use libtool to install test binaries
Date: Fri,  9 Jan 2026 13:11:23 +0000
Message-ID: <20260109131130.3006446-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109131130.3006446-1-ross.burton@arm.com>
References: <20260109131130.3006446-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 13:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229109

If libtool builds a binary it's best to use libtool to install it, as
otherwise you might install a wrapper script or need to make assumptions
about where libtool has put the real binary (as this isn't always .libs)

Also use install instead of cp to install more files.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/libpcre/libpcre_8.45.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/libpcre/libpcre_8.45.bb b/meta/recipes-=
support/libpcre/libpcre_8.45.bb
index 67327065e4..c5ecbd8cf2 100644
--- a/meta/recipes-support/libpcre/libpcre_8.45.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.45.bb
@@ -59,11 +59,11 @@ do_install_ptest() {
 	t=3D${D}${PTEST_PATH}
 	cp ${UNPACKDIR}/Makefile $t
 	cp -r ${S}/testdata $t
-	for i in pcre_stringpiece_unittest pcregrep pcretest; \
-	  do cp ${B}/.libs/$i $t; \
+	for i in pcre_stringpiece_unittest pcregrep pcretest; do
+		${B}/libtool --mode=3Dinstall install ${B}/$i $t/
 	done
-	for i in RunTest RunGrepTest test-driver; \
-	  do cp ${S}/$i $t; \
+	for i in RunTest RunGrepTest test-driver; do
+		install ${S}/$i $t
 	done
 	# Skip the fr_FR locale test. If the locale fr_FR is found, it is teste=
d.
 	# If not found, the test is skipped. The test program assumes fr_FR is =
non-UTF-8
--=20
2.43.0


