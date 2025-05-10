Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51474C3ABD2
	for <webhook@archiver.kernel.org>; Sat, 10 May 2025 08:44:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6808.1746866648478773331
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 May 2025 01:44:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F06AF153B
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:43:56 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8A9123F5A1
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:44:07 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/23] oeqa/sdkext/context: align hasHostPackage with parent class
Date: Sat, 10 May 2025 09:43:38 +0100
Message-ID: <20250510084400.269726-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250510084400.269726-1-ross.burton@arm.com>
References: <20250510084400.269726-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 08:44:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216253

This subclass overrides hasHostPackage() but back in 2018[1] the parent
class's method gained a regex argument.

[1] oe-core 595e9922cdb ("oeqa/sdk: fixes related to hasPackage semantics=
")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/sdkext/context.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/sdkext/context.py b/meta/lib/oeqa/sdkext/conte=
xt.py
index 2ac2bf6ff73..2da57e2ccff 100644
--- a/meta/lib/oeqa/sdkext/context.py
+++ b/meta/lib/oeqa/sdkext/context.py
@@ -12,11 +12,11 @@ class OESDKExtTestContext(OESDKTestContext):
=20
     # FIXME - We really need to do better mapping of names here, this at
     # least allows some tests to run
-    def hasHostPackage(self, pkg):
+    def hasHostPackage(self, pkg, regex=3DFalse):
         # We force a toolchain to be installed into the eSDK even if its=
 minimal
         if pkg.startswith("packagegroup-cross-canadian-"):
             return True
-        return self._hasPackage(self.host_pkg_manifest, pkg)
+        return self._hasPackage(self.host_pkg_manifest, pkg, regex)
=20
 class OESDKExtTestContextExecutor(OESDKTestContextExecutor):
     _context_class =3D OESDKExtTestContext
--=20
2.43.0


