Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B90A7C56203
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 16:03:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43651.1785945820398347781
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 09:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=N30e0Ivw;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 571D91476
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Aug 2026 09:03:35 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E98953F632
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Aug 2026 09:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785945819; bh=yrNnpREIOYhM014D57OQ6tmkxj5r4Dq9j0WeKFIzmjg=;
	h=From:To:Subject:Date:From;
	b=N30e0IvwGuIogu9LxV0Da25tB8ubXGqOKRUHEuldi08aVkt8m0ROnixzD+lcWx3OD
	 D0Ymqn0zJvMFGeOIaBA4YWBYhUPl/DsfdlXPoB9n8GP3IxatOL2R74oUyaj9XThzLg
	 zwfWZQv6btWW5a0UzSxm3O0wEfw6t85DIyj9UlgM=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] oeqa/selftest/glibc: remove obsolete parallel make assignment
Date: Wed,  5 Aug 2026 17:03:17 +0100
Message-ID: <20260805160320.41908-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 16:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242872

glibc doesn't use EGLIBCPARALLELISM so this didn't do anything.

The glibc check target serialises timing-sensitive tests (nptl and rt)
so this wouldn't have done anything meaningful anyway.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/glibc.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/glibc.py b/meta/lib/oeqa/selfte=
st/cases/glibc.py
index a65afb1367e..b8efa22fdac 100644
--- a/meta/lib/oeqa/selftest/cases/glibc.py
+++ b/meta/lib/oeqa/selftest/cases/glibc.py
@@ -58,8 +58,6 @@ class GlibcSelfTestBase(OESelftestTestCase, OEPTestResu=
ltTestCase):
             features.append('TOOLCHAIN_TEST_HOST =3D "{0}"'.format(ssh))
             features.append('TOOLCHAIN_TEST_HOST_USER =3D "root"')
             features.append('TOOLCHAIN_TEST_HOST_PORT =3D "22"')
-            # force single threaded test execution
-            features.append('EGLIBCPARALLELISM:task-check:pn-glibc-tests=
uite =3D "PARALLELMFLAGS=3D"-j1""')
         self.write_config("\n".join(features))
=20
         start_time =3D time.time()
--=20
2.43.0


