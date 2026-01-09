Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C636D1A627
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 13:11:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9658.1767964302665399088
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 05:11:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87D5CFEC
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Jan 2026 05:11:35 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EF7783F6A8
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Jan 2026 05:11:41 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/11] libpng: use libtool to install test binaries
Date: Fri,  9 Jan 2026 13:11:27 +0000
Message-ID: <20260109131130.3006446-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109131130.3006446-1-ross.burton@arm.com>
References: <20260109131130.3006446-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 13:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229113

If libtool builds a binary it's best to use libtool to install it, as
otherwise you might install a wrapper script or need to make assumptions
about where libtool has put the real binary (as this isn't always .libs)

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-multimedia/libpng/libpng_1.6.53.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.53.bb b/meta/recip=
es-multimedia/libpng/libpng_1.6.53.bb
index 956cd243b1..a43283eae7 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.53.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.53.bb
@@ -48,8 +48,9 @@ do_install_ptest() {
     install -m 755 ${S}/contrib/tools/*.sh ${D}${PTEST_PATH}/src/contrib=
/tools
     install -m 644 ${S}/contrib/tools/*.c ${S}/contrib/tools/*.h ${D}${P=
TEST_PATH}/src/contrib/tools
=20
-    # Install .libs directory binaries to ptest path
-    install -m 755 ${B}/.libs/pngtest ${B}/.libs/pngstest ${B}/.libs/png=
image ${B}/.libs/pngunknown ${B}/.libs/pngvalid ${D}${PTEST_PATH}/src
+    for file in $(makefile-getvar ${B}/Makefile check_PROGRAMS); do
+        ${B}/libtool --mode=3Dinstall install ${B}/$file ${D}${PTEST_PAT=
H}/src
+    done
=20
     # Copy png files to ptest path
     cd ${S} && find contrib -name '*.png' | cpio -pd ${D}${PTEST_PATH}/s=
rc
--=20
2.43.0


