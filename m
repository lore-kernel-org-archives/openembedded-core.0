Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E68EAC43219
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 19:31:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.1505.1668022310967994057
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 11:31:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA41F23A;
	Wed,  9 Nov 2022 11:31:56 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 432613F703;
	Wed,  9 Nov 2022 11:31:50 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 12/15] oeqa/selftest/runtime_test: only run the virgl tests on qemux86-64
Date: Wed,  9 Nov 2022 19:31:32 +0000
Message-Id: <20221109193135.291048-12-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109193135.291048-1-ross.burton@arm.com>
References: <20221109193135.291048-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 19:31:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173045

These tests should be able to work on qemuarm64, but this is untested
and the runners will need configuration.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa=
/selftest/cases/runtime_test.py
index fe83b248f35..ae797249562 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -10,7 +10,7 @@ from oeqa.core.decorator import OETestTag
 import os
 import tempfile
 import oe.lsb
-from oeqa.core.decorator.data import skipIfNotQemu
+from oeqa.core.decorator.data import skipIfNotQemu, skipIfNotMachine
=20
 class TestExport(OESelftestTestCase):
=20
@@ -202,6 +202,8 @@ class TestImage(OESelftestTestCase):
         bitbake('core-image-full-cmdline socat')
         bitbake('-c testimage core-image-full-cmdline')
=20
+    # https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14966
+    @skipIfNotMachine("qemux86-64", "test needs qemux86-64")
     def test_testimage_virgl_gtk_sdl(self):
         """
         Summary: Check host-assisted accelerate OpenGL functionality in =
qemu with gtk and SDL frontends
@@ -243,6 +245,7 @@ class TestImage(OESelftestTestCase):
         bitbake('core-image-minimal')
         bitbake('-c testimage core-image-minimal')
=20
+    @skipIfNotMachine("qemux86-64", "test needs qemux86-64")
     def test_testimage_virgl_headless(self):
         """
         Summary: Check host-assisted accelerate OpenGL functionality in =
qemu with egl-headless frontend
--=20
2.34.1


