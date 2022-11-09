Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4103C43219
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 19:31:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.1444.1668022308418623914
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 11:31:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 404601FB;
	Wed,  9 Nov 2022 11:31:54 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D69A3F703;
	Wed,  9 Nov 2022 11:31:47 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 08/15] oeqa/selftest/overlayfs: overlayfs: skip x86-specific tests
Date: Wed,  9 Nov 2022 19:31:28 +0000
Message-Id: <20221109193135.291048-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109193135.291048-1-ross.burton@arm.com>
References: <20221109193135.291048-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 19:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173041

For now, not all machines have a default wks file, so mark the tests
which need a wks as being specific to qemux86-64.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/overlayfs.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/se=
lftest/cases/overlayfs.py
index 57a8c8bdb6e..dfd9f1486d0 100644
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -7,6 +7,7 @@
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, runqemu
 from oeqa.core.decorator import OETestTag
+from oeqa.core.decorator.data import skipIfNotMachine
=20
 def getline_qemu(out, line):
     for l in out.split('\n'):
@@ -333,6 +334,8 @@ EXTRA_IMAGE_FEATURES +=3D "package-management"
         self.assertTrue("overlayfs-etc" in res.output, msg=3Dres.output)
         self.assertTrue("package-management" in res.output, msg=3Dres.ou=
tput)
=20
+    # https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14963
+    @skipIfNotMachine("qemux86-64", "tests are qemux86-64 specific curre=
ntly")
     def test_image_feature_is_missing(self):
         """
         Summary:   Overlayfs-etc class is not applied when image feature=
 is not set
@@ -368,9 +371,11 @@ OVERLAYFS_ETC_DEVICE =3D "/dev/sda3"
             line =3D getline_qemu(output, "upperdir=3D/data/overlay-etc/=
upper")
             self.assertFalse(line, msg=3Doutput)
=20
+    @skipIfNotMachine("qemux86-64", "tests are qemux86-64 specific curre=
ntly")
     def test_sbin_init_preinit(self):
         self.run_sbin_init(False)
=20
+    @skipIfNotMachine("qemux86-64", "tests are qemux86-64 specific curre=
ntly")
     def test_sbin_init_original(self):
         self.run_sbin_init(True)
=20
@@ -419,6 +424,7 @@ OVERLAYFS_ETC_DEVICE =3D "/dev/sda3"
             line =3D getline_qemu(output, testFile)
             self.assertTrue(line and line.startswith(testFile), msg=3Dou=
tput)
=20
+    @skipIfNotMachine("qemux86-64", "tests are qemux86-64 specific curre=
ntly")
     def test_lower_layer_access(self):
         """
         Summary:   Test that lower layer of /etc is available read-only =
when configured
--=20
2.34.1


