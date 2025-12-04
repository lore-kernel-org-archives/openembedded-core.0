Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C28DD216AD
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 16:18:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47920.1764865107502490652
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 08:18:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C700E339
	for <openembedded-core@lists.openembedded.org>; Thu,  4 Dec 2025 08:18:19 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BA22A3F66E
	for <openembedded-core@lists.openembedded.org>; Thu,  4 Dec 2025 08:18:26 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] binutils-testsuite: fix ld tests that check for enable_libctf
Date: Thu,  4 Dec 2025 16:18:18 +0000
Message-ID: <20251204161820.1339988-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204161820.1339988-1-ross.burton@arm.com>
References: <20251204161820.1339988-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 16:18:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227302

The ld tests expect that the Makefile is being used and has written to
ld/enabling.exp. As we don't do that, manually write the file with the
right content.

This fixes the ld/testsuite/ld-ctf/ctf.exp tests.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/binutils/binutils-testsuite_2.45.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils-testsuite_2.45.bb b/=
meta/recipes-devtools/binutils/binutils-testsuite_2.45.bb
index 4e393c4e4d6..53693334345 100644
--- a/meta/recipes-devtools/binutils/binutils-testsuite_2.45.bb
+++ b/meta/recipes-devtools/binutils/binutils-testsuite_2.45.bb
@@ -45,6 +45,8 @@ python check_prepare() {
         content.append('set target_triplet {0}'.format(suffix_sys(d.getV=
ar("TARGET_SYS"))))
         content.append("set development true")
         content.append("set experimental false")
+        # This is normally written into ld/enablings.exp
+        content.append("set enable_libctf yes")
=20
         content.append(d.expand('set CXXFILT "${TARGET_PREFIX}c++filt"')=
)
         content.append(d.expand('set CC "${TARGET_PREFIX}gcc --sysroot=3D=
${STAGING_DIR_TARGET} ${TUNE_CCARGS}"'))
--=20
2.43.0


