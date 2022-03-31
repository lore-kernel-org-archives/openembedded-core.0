Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D048BC433EF
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:29:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.680.1648751360894993401
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98F461596
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:20 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4AEC73F718
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:20 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/23] oeqa/selftest/wic: don't hardcode kernel image type in
 test_wic_rm
Date: Thu, 31 Mar 2022 19:28:59 +0100
Message-Id: <20220331182915.22128-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331182915.22128-1-ross.burton@arm.com>
References: <20220331182915.22128-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 18:29:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163848

Don't assume bzImage, resepct KERNEL_IMAGETYPE.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest=
/cases/wic.py
index 317b80ea27b..eb376e1e2c5 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1337,21 +1337,23 @@ class Wic2(WicTestCase):
         self.assertEqual(1, len(images))
=20
         sysroot =3D get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
+        # Not bulletproof but hopefully sufficient
+        kerneltype =3D get_bb_var('KERNEL_IMAGETYPE', 'virtual/kernel')
=20
         # list directory content of the first partition
         result =3D runCmd("wic ls %s:1 -n %s" % (images[0], sysroot))
-        self.assertIn('\nBZIMAGE        ', result.output)
+        self.assertIn('\n%s        ' % kerneltype.upper(), result.output=
)
         self.assertIn('\nEFI          <DIR>     ', result.output)
=20
-        # remove file
-        runCmd("wic rm %s:1/bzimage -n %s" % (images[0], sysroot))
+        # remove file. EFI partitions are case-insensitive so exercise t=
hat too
+        runCmd("wic rm %s:1/%s -n %s" % (images[0], kerneltype.lower(), =
sysroot))
=20
         # remove directory
         runCmd("wic rm %s:1/efi -n %s" % (images[0], sysroot))
=20
         # check if they're removed
         result =3D runCmd("wic ls %s:1 -n %s" % (images[0], sysroot))
-        self.assertNotIn('\nBZIMAGE        ', result.output)
+        self.assertNotIn('\n%s        ' % kerneltype.upper(), result.out=
put)
         self.assertNotIn('\nEFI          <DIR>     ', result.output)
=20
     def test_mkfs_extraopts(self):
--=20
2.25.1


