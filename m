Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7326C4167E
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 19:31:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.1442.1668022305156005768
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 11:31:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC599D6E;
	Wed,  9 Nov 2022 11:31:50 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 555BB3F703;
	Wed,  9 Nov 2022 11:31:44 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 03/15] oeqa/selftest/buildoptions: skip test_read_only_image on qemuarm64
Date: Wed,  9 Nov 2022 19:31:23 +0000
Message-Id: <20221109193135.291048-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109193135.291048-1-ross.burton@arm.com>
References: <20221109193135.291048-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 19:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173036

qemuarm64 currently uses SERIAL_CONSOLES_CHECK but this is incompatible
with read-only rootfs under sysvinit.  Until qemuarm64 doesn't use this,
skip the test on qemuarm64.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/buildoptions.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa=
/selftest/cases/buildoptions.py
index ee3e28d74bf..01ea4dce395 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -11,6 +11,7 @@ import shutil
 import tempfile
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.selftest.cases.buildhistory import BuildhistoryBase
+from oeqa.core.decorator.data import skipIfMachine
 from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars
 import oeqa.utils.ftools as ftools
=20
@@ -49,6 +50,8 @@ class ImageOptionsTests(OESelftestTestCase):
             loglines =3D "".join(f.readlines())
         self.assertIn("ccache", loglines, msg=3D"No match for ccache in =
%s log.do_compile. For further details: %s" % (recipe , log_compile))
=20
+    # https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14962
+    @skipIfMachine("qemuarm64", "fails on qemuarm64 (uses SERIAL_CONSOLE=
S_CHECK)")
     def test_read_only_image(self):
         distro_features =3D get_bb_var('DISTRO_FEATURES')
         if not ('x11' in distro_features and 'opengl' in distro_features=
):
--=20
2.34.1


