Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A6EAC3ABD6
	for <webhook@archiver.kernel.org>; Sat, 10 May 2025 08:44:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6621.1746866651564143697
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 May 2025 01:44:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 350591595
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:44:00 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C490B3F5A1
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:44:10 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/23] oeqa/sdk/kmod: skip test in eSDKs
Date: Sat, 10 May 2025 09:43:43 +0100
Message-ID: <20250510084400.269726-10-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250510084400.269726-1-ross.burton@arm.com>
References: <20250510084400.269726-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 08:44:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216258

At the moment we can't run this test inside an eSDK as it needs the
kernel-devsrc recipe to be present.  Skip the test until this has been
resolved.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/sdk/cases/kmod.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oeqa/sdk/cases/kmod.py b/meta/lib/oeqa/sdk/cases/km=
od.py
index af9fcf5150d..0aa6f702e44 100644
--- a/meta/lib/oeqa/sdk/cases/kmod.py
+++ b/meta/lib/oeqa/sdk/cases/kmod.py
@@ -9,6 +9,7 @@ import subprocess
 import tempfile
=20
 from oeqa.sdk.case import OESDKTestCase
+from oeqa.sdkext.context import OESDKExtTestContext
 from oeqa.utils.subprocesstweak import errors_have_output
 errors_have_output()
=20
@@ -17,6 +18,9 @@ class KernelModuleTest(OESDKTestCase):
     Test that out-of-tree kernel modules build.
     """
     def test_cryptodev(self):
+        if isinstance(self.tc, OESDKExtTestContext):
+            self.skipTest(f"{self.id()} does not support eSDK (https://b=
ugzilla.yoctoproject.org/show_bug.cgi?id=3D15850)")
+
         self.ensure_target_package("kernel-devsrc")
         # These targets need to be built before kernel modules can be bu=
ilt.
         self._run("make -j -C $OECORE_TARGET_SYSROOT/usr/src/kernel prep=
are scripts")
--=20
2.43.0


