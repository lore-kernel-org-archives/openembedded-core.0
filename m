Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BCF0D1A626
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 13:11:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9627.1767964299396844749
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 05:11:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C4BDFEC
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Jan 2026 05:11:32 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6BE8E3F6A8
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Jan 2026 05:11:38 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/11] libevent: use libtool to install test binaries
Date: Fri,  9 Jan 2026 13:11:22 +0000
Message-ID: <20260109131130.3006446-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109131130.3006446-1-ross.burton@arm.com>
References: <20260109131130.3006446-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 13:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229108

If libtool builds a binary it's best to use libtool to install it, as
otherwise you might install a wrapper script or need to make assumptions
about where libtool has put the real binary (as this isn't always .libs)

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/libevent/libevent_2.1.12.bb | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-support/libevent/libevent_2.1.12.bb b/meta/reci=
pes-support/libevent/libevent_2.1.12.bb
index 2fadf10943..4e32b5217e 100644
--- a/meta/recipes-support/libevent/libevent_2.1.12.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.12.bb
@@ -52,12 +52,8 @@ do_install:append() {
 }
=20
 do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/test
-	for file in ${B}/test/.libs/regress ${B}/test/.libs/test*
-	do
-		install -m 0755 $file ${D}${PTEST_PATH}/test
-	done
-
+        install -d ${D}${PTEST_PATH}/test
+        ${B}/libtool --mode=3Dinstall install ${B}/test/regress ${D}${PT=
EST_PATH}/test/
         # handle multilib
         sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
 }
--=20
2.43.0


