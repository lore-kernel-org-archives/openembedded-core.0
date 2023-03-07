Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59274C678D5
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 20:09:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.4620.1678219772749369692
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 12:09:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BFEE113E;
	Tue,  7 Mar 2023 12:10:15 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 398EB3F71A;
	Tue,  7 Mar 2023 12:09:31 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] oeqa/selftest/imagefeatures: add test for man-db
Date: Tue,  7 Mar 2023 20:09:29 +0000
Message-Id: <20230307200929.2872767-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 20:09:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178119

Add a test to verify that manpages are built with api-documentation
enabled, and apropos works on the target (so mandb has been ran).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeq=
a/selftest/cases/imagefeatures.py
index af38150613b..bdd4d3200e2 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -299,3 +299,25 @@ SKIP_RECIPE[busybox] =3D "Don't build this"
         result =3D glob.glob(images)
         with open(result[1],"r") as f:
                 self.assertEqual(len(f.read().strip()),0)
+
+    def test_mandb(self):
+        """
+        Test that an image containing manpages has working man and aprop=
os commands.
+        """
+        config =3D """
+DISTRO_FEATURES:append =3D " api-documentation"
+CORE_IMAGE_EXTRA_INSTALL =3D "man-pages kmod-doc"
+"""
+        self.write_config(config)
+        bitbake("core-image-minimal")
+
+        with runqemu('core-image-minimal', ssh=3DFalse, runqemuparams=3D=
'nographic') as qemu:
+            # This manpage is provided by man-pages
+            status, output =3D qemu.run_serial("apropos 8859")
+            self.assertEqual(status, 1, 'Failed to run apropos: %s' % (o=
utput))
+            self.assertIn("iso_8859_15", output)
+
+            # This manpage is provided by kmod
+            status, output =3D qemu.run_serial("man --pager=3Dcat modpro=
be")
+            self.assertEqual(status, 1, 'Failed to run man: %s' % (outpu=
t))
+            self.assertIn("force-modversion", output)
--=20
2.34.1


