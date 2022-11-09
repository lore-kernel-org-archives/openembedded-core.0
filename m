Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB0F1C4321E
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 19:31:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.1447.1668022311626606594
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 11:31:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86A4B1FB;
	Wed,  9 Nov 2022 11:31:57 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E3CD83F703;
	Wed,  9 Nov 2022 11:31:50 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 13/15] oeqa/selftest/wic: skip more tests on aarch64
Date: Wed,  9 Nov 2022 19:31:33 +0000
Message-Id: <20221109193135.291048-13-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109193135.291048-1-ross.burton@arm.com>
References: <20221109193135.291048-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 19:31:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173046

test_rawcopy_plugin_qemu and test_wic_image_type are x86-specific
currently as the .wks uses x86-specific bootloaders.

This can be fixed, but that can come later.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest=
/cases/wic.py
index 0d664d7c395..8abe6918f3f 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -817,7 +817,8 @@ class Wic2(WicTestCase):
                                       self.resultdir))
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wicte=
stdisk-*direct"))))
=20
-    @only_for_arch(['i586', 'i686', 'x86_64', 'aarch64'])
+    # TODO this test could also work on aarch64
+    @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_wic_image_type(self):
         """Test building wic images by bitbake"""
         config =3D 'IMAGE_FSTYPES +=3D "wic"\nWKS_FILE =3D "wic-image-mi=
nimal"\n'\
@@ -1042,7 +1043,8 @@ class Wic2(WicTestCase):
             size =3D int(size[:-3])
             self.assertGreaterEqual(size, 204800)
=20
-    @only_for_arch(['i586', 'i686', 'x86_64', 'aarch64'])
+    # TODO this test could also work on aarch64
+    @only_for_arch(['i586', 'i686', 'x86_64'])
     @OETestTag("runqemu")
     def test_rawcopy_plugin_qemu(self):
         """Test rawcopy plugin in qemu"""
--=20
2.34.1


