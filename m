Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A2BBD1A62B
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 13:11:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9657.1767964301292872045
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 05:11:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22CA4FEC
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Jan 2026 05:11:34 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8C06E3F6A8
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Jan 2026 05:11:40 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/11] numactl: use libtool to install test binaries
Date: Fri,  9 Jan 2026 13:11:25 +0000
Message-ID: <20260109131130.3006446-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109131130.3006446-1-ross.burton@arm.com>
References: <20260109131130.3006446-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 13:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229111

If libtool builds a binary it's best to use libtool to install it, as
otherwise you might install a wrapper script or need to make assumptions
about where libtool has put the real binary (as this isn't always .libs)

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/numactl/numactl_2.0.19.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/numactl/numactl_2.0.19.bb b/meta/recipe=
s-support/numactl/numactl_2.0.19.bb
index 5ac9380c6c..38c09199c3 100644
--- a/meta/recipes-support/numactl/numactl_2.0.19.bb
+++ b/meta/recipes-support/numactl/numactl_2.0.19.bb
@@ -40,7 +40,7 @@ do_install_ptest() {
=20
     [ ! -d ${D}/${PTEST_PATH}/test ] && mkdir -p ${D}/${PTEST_PATH}/test
     for i in $test_binaries; do
-        install -m 0755 ${B}/test/.libs/$i ${D}${PTEST_PATH}/test
+        ${B}/libtool --mode=3Dinstall install -m 0755 ${B}/test/$i ${D}$=
{PTEST_PATH}/test
     done
=20
     local test_scripts=3D"checktopology checkaffinity printcpu regress r=
egress2 \
@@ -50,7 +50,7 @@ do_install_ptest() {
     done
=20
     install -m 0755 ${UNPACKDIR}/Makefile ${D}${PTEST_PATH}/
-    install -m 0755 ${B}/.libs/numactl ${D}${PTEST_PATH}/
+    ${B}/libtool --mode=3Dinstall install -m 0755 ${B}/numactl ${D}${PTE=
ST_PATH}/
 }
=20
 RDEPENDS:${PN}-ptest =3D "bash"
--=20
2.43.0


