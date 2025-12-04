Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F82D216AB
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 16:18:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47919.1764865106882075782
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 08:18:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22AF21575
	for <openembedded-core@lists.openembedded.org>; Thu,  4 Dec 2025 08:18:19 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 15E1E3F66E
	for <openembedded-core@lists.openembedded.org>; Thu,  4 Dec 2025 08:18:25 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] binutils-testsuite: unset SOURCE_DATE_EPOCH when running the tests
Date: Thu,  4 Dec 2025 16:18:17 +0000
Message-ID: <20251204161820.1339988-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204161820.1339988-1-ross.burton@arm.com>
References: <20251204161820.1339988-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 16:18:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227301

The replacing_non_deterministic_member() test in ar.exp explicitly needs
SOURCE_DATE_EPOCH to be unset:

  # This test expects SOURCE_DATE_EPOCH to not be set in the environment

I hope that the test harness could just unset this in advance of running
the tests, but until this is upstreamed we can unset it.

This fixes the test:

  ptestresult.binutils.replacing non-deterministic member (wrong size, ex=
pected: 920)

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/binutils/binutils-testsuite_2.45.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils-testsuite_2.45.bb b/=
meta/recipes-devtools/binutils/binutils-testsuite_2.45.bb
index fe6b8c6f404..4e393c4e4d6 100644
--- a/meta/recipes-devtools/binutils/binutils-testsuite_2.45.bb
+++ b/meta/recipes-devtools/binutils/binutils-testsuite_2.45.bb
@@ -75,6 +75,10 @@ do_check[prefuncs] +=3D "check_prepare"
 do_check[nostamp] =3D "1"
 do_check() {
     export LC_ALL=3DC
+
+    # Needs to be unset for binutils/testsuite/bintils-all/ar.exp:replac=
ing_non_deterministic_member() to pass.
+    unset SOURCE_DATE_EPOCH
+
     for i in ${CHECK_TARGETS}; do
         (cd ${B}/$i/testsuite; runtest \
             --tool $i \
--=20
2.43.0


