Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4627C4321E
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:29:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.705.1648751367615235700
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5506E139F
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:27 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 071163F885
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:26 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 19/23] oeqa/selftest/wic: cleanup WicTestCase.setUpLocal
Date: Thu, 31 Mar 2022 19:29:11 +0100
Message-Id: <20220331182915.22128-19-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331182915.22128-1-ross.burton@arm.com>
References: <20220331182915.22128-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 18:29:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163860

Use os.path.join to construct paths, and invoke bitbake once instead of
three times.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest=
/cases/wic.py
index 2eb80ac1941..6da70b8c287 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -75,22 +75,18 @@ class WicTestCase(OESelftestTestCase):
=20
     def setUpLocal(self):
         """This code is executed before each test method."""
-        self.resultdir =3D self.builddir + "/wic-tmp/"
+        self.resultdir =3D os.path.join(self.builddir, "wic-tmp")
         super(WicTestCase, self).setUpLocal()
=20
         # Do this here instead of in setUpClass as the base setUp does s=
ome
         # clean up which can result in the native tools built earlier in
         # setUpClass being unavailable.
         if not WicTestCase.image_is_ready:
-            if get_bb_var('USE_NLS') =3D=3D 'yes':
-                bitbake('wic-tools')
-            else:
-                self.skipTest('wic-tools cannot be built due its (intlto=
ol|gettext)-native dependency and NLS disable')
+            if get_bb_var('USE_NLS') !=3D 'yes':
+                self.skipTest('wic-tools needs USE_NLS=3Dyes')
=20
-            bitbake('core-image-minimal')
-            bitbake('core-image-minimal-mtdutils')
+            bitbake('wic-tools core-image-minimal core-image-minimal-mtd=
utils')
             WicTestCase.image_is_ready =3D True
-
         rmtree(self.resultdir, ignore_errors=3DTrue)
=20
     def tearDownLocal(self):
--=20
2.25.1


