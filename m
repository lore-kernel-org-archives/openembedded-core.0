Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2623C3ABDA
	for <webhook@archiver.kernel.org>; Sat, 10 May 2025 08:44:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6619.1746866647576159237
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 May 2025 01:44:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B7F4153B
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:43:56 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D9FB13F5A1
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:44:06 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/23] oeqa/sdk/context: fix multilib handling bug in hasTargetPackage
Date: Sat, 10 May 2025 09:43:37 +0100
Message-ID: <20250510084400.269726-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250510084400.269726-1-ross.burton@arm.com>
References: <20250510084400.269726-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 08:44:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216252

hasTargetPackage has some logic to automatically multilibify package
names if needed (for example, so that gtk+3 becomes lib32-gtk+3).

Due to a logic bug if multilib was True but there were no multilibs
configured then this prepended "-" to the package name, which won't
exist.  This resulted in tests being skipped as the dependent packages
are not installed.

Solve this by only prepending to the package name if requested and if a
multilib environment has been detected.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/sdk/context.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/sdk/context.py b/meta/lib/oeqa/sdk/context.py
index d968cfa2be9..d4fdd832070 100644
--- a/meta/lib/oeqa/sdk/context.py
+++ b/meta/lib/oeqa/sdk/context.py
@@ -47,7 +47,7 @@ class OESDKTestContext(OETestContext):
         return self._hasPackage(self.host_pkg_manifest, pkg, regex=3Dreg=
ex)
=20
     def hasTargetPackage(self, pkg, multilib=3DFalse, regex=3DFalse):
-        if multilib:
+        if multilib and self.multilib:
             pkg =3D self.multilib + '-' + pkg
         return self._hasPackage(self.target_pkg_manifest, pkg, regex=3Dr=
egex)
=20
--=20
2.43.0


