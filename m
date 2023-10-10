Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFBBCCD80C1
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 12:55:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.90237.1696942504459618523
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 05:55:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2869C1FB;
	Tue, 10 Oct 2023 05:55:44 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EA70D3F762;
	Tue, 10 Oct 2023 05:55:02 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH v2 1/4] oeqa/selftest: don't skip test_read_only_image on qemuarm64
Date: Tue, 10 Oct 2023 13:54:55 +0100
Message-Id: <20231010125458.167900-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 12:55:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188889

From: Ross Burton <ross.burton@arm.com>

There's no need to skip this test anymore, as skipping on qemuarm64 was
a proxy for "uses SERIAL_CONSOLES_CHECK" which no longer exists.

[ YOCTO #14962 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/buildoptions.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa=
/selftest/cases/buildoptions.py
index 01ea4dce395..104448442ad 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -50,8 +50,6 @@ class ImageOptionsTests(OESelftestTestCase):
             loglines =3D "".join(f.readlines())
         self.assertIn("ccache", loglines, msg=3D"No match for ccache in =
%s log.do_compile. For further details: %s" % (recipe , log_compile))
=20
-    # https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14962
-    @skipIfMachine("qemuarm64", "fails on qemuarm64 (uses SERIAL_CONSOLE=
S_CHECK)")
     def test_read_only_image(self):
         distro_features =3D get_bb_var('DISTRO_FEATURES')
         if not ('x11' in distro_features and 'opengl' in distro_features=
):
--=20
2.34.1


