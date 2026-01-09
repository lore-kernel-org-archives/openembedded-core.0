Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30AD7D1A61F
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 13:11:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9653.1767964297957044398
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 05:11:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93E10FEC
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Jan 2026 05:11:30 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F26CF3F6A8
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Jan 2026 05:11:36 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/11] libusb1: use libtool to install test binaries
Date: Fri,  9 Jan 2026 13:11:20 +0000
Message-ID: <20260109131130.3006446-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 13:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229106

If libtool builds a binary it's best to use libtool to install it, as
otherwise you might install a wrapper script or need to make assumptions
about where libtool has put the real binary (as this isn't always .libs)

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/libusb/libusb1_1.0.29.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libusb/libusb1_1.0.29.bb b/meta/recipes=
-support/libusb/libusb1_1.0.29.bb
index 2f43ee68b7..856e32d1c6 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.29.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.29.bb
@@ -42,7 +42,7 @@ do_compile_ptest() {
 }
=20
 do_install_ptest() {
-    install -m 755 ${B}/tests/stress ${D}${PTEST_PATH}
+    ${B}/libtool --mode=3Dinstall install ${B}/tests/stress ${D}${PTEST_=
PATH}
 }
=20
 FILES:${PN} +=3D "${base_libdir}/*.so.*"
--=20
2.43.0


