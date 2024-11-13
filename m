Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78AEDD41C3E
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 13:14:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11063.1731503674105428929
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 05:14:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87EB81655
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 05:15:03 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3F8193F66E
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 05:14:33 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] scripts/checklayer: check for SECURITY.md
Date: Wed, 13 Nov 2024 13:14:29 +0000
Message-Id: <20241113131429.2349997-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 13:14:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207100

Add a check for a SECURITY.md file (or similar) to yocto-check-layer, as
knowing where to report security issues is important.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/lib/checklayer/cases/common.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/scripts/lib/checklayer/cases/common.py b/scripts/lib/checkla=
yer/cases/common.py
index 97b16f78c8e..2da3d9d77a3 100644
--- a/scripts/lib/checklayer/cases/common.py
+++ b/scripts/lib/checklayer/cases/common.py
@@ -40,6 +40,19 @@ class CommonCheckLayer(OECheckLayerTestCase):
         email_regex =3D re.compile(r"[^@]+@[^@]+")
         self.assertTrue(email_regex.match(data))
=20
+    def test_security(self):
+        """
+        Test that the layer has a SECURITY.md (or similar) file.
+        """
+        if self.tc.layer['type'] =3D=3D LayerType.CORE:
+            raise unittest.SkipTest("Core layer's SECURITY is top level"=
)
+
+        security =3D os.path.join(self.tc.layer['path'], 'SECURITY')
+        security_glob =3D os.path.join(self.tc.layer['path'], 'SECURITY.=
*')
+
+        files =3D glob.glob(security) + glob.glob(security_glob)
+        self.assertTrue(files, msg=3D"Layer doesn't contain a SECURITY.m=
d file.")
+
     def test_parse(self):
         check_command('Layer %s failed to parse.' % self.tc.layer['name'=
],
                       'bitbake -p')
--=20
2.34.1


