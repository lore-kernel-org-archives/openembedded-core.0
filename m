Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B40D0C4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 19:31:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.1503.1668022309000663329
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 11:31:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0CF823A;
	Wed,  9 Nov 2022 11:31:54 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 49F013F703;
	Wed,  9 Nov 2022 11:31:48 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 09/15] oeqa/selftest/package: generalise test_gdb_hardlink_debug()
Date: Wed,  9 Nov 2022 19:31:29 +0000
Message-Id: <20221109193135.291048-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109193135.291048-1-ross.burton@arm.com>
References: <20221109193135.291048-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 19:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173042

When the trivial test binary, which just calls printf(), is compiled for
aarch64 with -O2 -D_FORTIFY=3D2 (as is the default configuration), gdb
resolves main() to the inlined printf() wrapper in stdio2.h instead of
main.c, so the test fails.

Presumably, this is due to debugging being unreliable with -O2. Solve
this problem by not caring where the main() breakpoint resolves to, just
check that it was resolved at all.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/package.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/self=
test/cases/package.py
index 2d1b48a15df..482a7c02ad4 100644
--- a/meta/lib/oeqa/selftest/cases/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -135,8 +135,10 @@ class PackageTests(OESelftestTestCase):
                     self.logger.error("No debugging symbols found. GDB r=
esult:\n%s" % output)
                     return False
=20
-                # Check debugging symbols works correctly
-                elif re.match(r"Breakpoint 1.*hello\.c.*4", l):
+                # Check debugging symbols works correctly. Don't look fo=
r a
+                # source file as optimisation can put the breakpoint ins=
ide
+                # stdio.h.
+                elif "Breakpoint 1 at" in l:
                     return True
=20
             self.logger.error("GDB result:\n%d: %s", status, output)
--=20
2.34.1


