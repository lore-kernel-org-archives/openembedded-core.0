Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E63FD1A623
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 13:11:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9629.1767964302082472760
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 05:11:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3052FEC
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Jan 2026 05:11:34 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3F0593F6A8
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Jan 2026 05:11:41 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/11] popt: use libtool to install test binaries
Date: Fri,  9 Jan 2026 13:11:26 +0000
Message-ID: <20260109131130.3006446-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109131130.3006446-1-ross.burton@arm.com>
References: <20260109131130.3006446-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 13:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229112

If libtool builds a binary it's best to use libtool to install it, as
otherwise you might install a wrapper script or need to make assumptions
about where libtool has put the real binary (as this isn't always .libs)

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/popt/popt_1.19.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/popt/popt_1.19.bb b/meta/recipes-suppor=
t/popt/popt_1.19.bb
index b1d8bea790..525bf553b1 100644
--- a/meta/recipes-support/popt/popt_1.19.bb
+++ b/meta/recipes-support/popt/popt_1.19.bb
@@ -22,10 +22,9 @@ do_compile_ptest() {
 }
=20
 do_install_ptest() {
-    install ${B}/tests/.libs/test* ${D}/${PTEST_PATH}
-    install ${B}/tests/.libs/tdict ${D}/${PTEST_PATH}
-    install ${B}/tests/testit.sh ${D}/${PTEST_PATH}
-    install ${B}/tests/test-poptrc ${D}/${PTEST_PATH}
+    for f in test1 test2 tdict test3 testit.sh test-poptrc; do
+        ${B}/libtool --mode=3Dinstall install ${B}/tests/$f ${D}/${PTEST=
_PATH}
+    done
 }
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


