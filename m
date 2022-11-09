Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F050AC352A1
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 19:31:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.1441.1668022304434199059
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 11:31:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BED423A;
	Wed,  9 Nov 2022 11:31:50 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A91353F703;
	Wed,  9 Nov 2022 11:31:43 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 02/15] oeqa/core/decorator: add decorators to skip based on HOST_ARCH
Date: Wed,  9 Nov 2022 19:31:22 +0000
Message-Id: <20221109193135.291048-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109193135.291048-1-ross.burton@arm.com>
References: <20221109193135.291048-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 19:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173035

There are already decorators to skip on the value of MACHINE, but for
flexibility it's better to skip based on the target architecture. This
means, for example, the ISO image tests could skip if the architecture
isn't x86.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/core/decorator/data.py | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/meta/lib/oeqa/core/decorator/data.py b/meta/lib/oeqa/core/de=
corator/data.py
index 3ce10e54999..de881e097ab 100644
--- a/meta/lib/oeqa/core/decorator/data.py
+++ b/meta/lib/oeqa/core/decorator/data.py
@@ -194,3 +194,27 @@ class skipIfQemu(OETestDecorator):
         self.logger.debug("Checking if qemu MACHINE")
         if self.case.td.get('MACHINE', '').startswith('qemu'):
              self.case.skipTest('Test only runs on real hardware')
+
+@registerDecorator
+class skipIfArch(OETestDecorator):
+    """
+    Skip test if HOST_ARCH is present in the tuple specified.
+    """
+
+    attrs =3D ('archs',)
+    def setUpDecorator(self):
+        arch =3D self.case.td['HOST_ARCH']
+        if arch in self.archs:
+             self.case.skipTest('Test skipped on %s' % arch)
+
+@registerDecorator
+class skipIfNotArch(OETestDecorator):
+    """
+    Skip test if HOST_ARCH is not present in the tuple specified.
+    """
+
+    attrs =3D ('archs',)
+    def setUpDecorator(self):
+        arch =3D self.case.td['HOST_ARCH']
+        if arch not in self.archs:
+             self.case.skipTest('Test skipped on %s' % arch)
--=20
2.34.1


