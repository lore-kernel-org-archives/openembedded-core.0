Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0516DC433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 13:55:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.7130.1641909344399282185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 05:55:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6110A1FB
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 05:55:43 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B3AA3F774
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 05:55:42 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest: add test that kernels build with defconfig
Date: Tue, 11 Jan 2022 13:55:40 +0000
Message-Id: <20220111135540.2874535-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 13:55:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160401

The standard linux-yocto builds using config fragments, but it's a
supported option to use the standard defconfig.

However, our enhanced config checking means that defconfig will often
cause configure warnings.  Add a test suite that exercises a defconfig
build is successful without any warnings.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../oeqa/selftest/cases/kerneldevelopment.py  | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/kerneldevelopment.py b/meta/lib=
/oeqa/selftest/cases/kerneldevelopment.py
index b1623a1885..a0e770071c 100644
--- a/meta/lib/oeqa/selftest/cases/kerneldevelopment.py
+++ b/meta/lib/oeqa/selftest/cases/kerneldevelopment.py
@@ -1,6 +1,6 @@
 import os
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import runCmd, get_bb_var
+from oeqa.utils.commands import bitbake, runCmd, get_bb_var
 from oeqa.utils.git import GitRepo
=20
 class KernelDev(OESelftestTestCase):
@@ -65,3 +65,21 @@ class KernelDev(OESelftestTestCase):
         self.assertTrue(os.path.exists(readme))
         result =3D runCmd('tail -n 1 %s' % readme)
         self.assertEqual(result.output, patch_content)
+
+
+class KernelConfigs(OESelftestTestCase):
+    def test_defconfig(self):
+        """
+        Test that a kernel build with the default defconfig doesn't prod=
uce any
+        build warnings from the config checker.
+        """
+        self.write_config('''
+KCONF_AUDIT_LEVEL =3D "1"
+KMETA_AUDIT_WERROR =3D "1"
+KBUILD_DEFCONFIG =3D "unset"
+KBUILD_DEFCONFIG:aarch64 =3D "defconfig"
+KBUILD_DEFCONFIG:x86-64 =3D "x86_64_defconfig"
+# BSPs can append KERNEL_FEATURES, so force it empty so we just use defc=
onfig
+KERNEL_FEATURES:forcevariable =3D ""
+''')
+        bitbake('virtual/kernel -c kernel_configcheck -f')
--=20
2.25.1


