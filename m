Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A57D2CE0E
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 17:18:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.24262.1729617509266284512
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Oct 2024 10:18:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C23A497
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 10:18:58 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2B8083F71E
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 10:18:28 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] oeqa/selftest/rust: skip on all MIPS platforms
Date: Tue, 22 Oct 2024 18:18:25 +0100
Message-Id: <20241022171826.1292640-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 17:18:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206167

As per "The rustc book"[1], mips*-unknown-linux-* are "tier 3" targets:

  Tier 3 targets are those which the Rust codebase has support for, but
  which the Rust project does not build or test automatically, so they
  may or may not work.

We already skip qemumips in this selftest, but we're now also seeing
failures with qemumips64 so refactor the test to skip all machines where
the architecture is mips or mips64.

[1] https://doc.rust-lang.org/nightly/rustc/platform-support.html

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/rust.py | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftes=
t/cases/rust.py
index 88d7bb95189..fab6267b155 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -3,6 +3,7 @@ import os
 import subprocess
 import time
 from oeqa.core.decorator import OETestTag
+from oeqa.core.decorator.data import skipIfArch
 from oeqa.core.case import OEPTestResultTestCase
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars=
, runqemu, Command
@@ -38,15 +39,12 @@ def parse_results(filename):
 @OETestTag("toolchain-user")
 @OETestTag("runqemu")
 class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCa=
se):
+
+    @skipIfArch(['mips', 'mips64'])
     def test_rust(self, *args, **kwargs):
         # Disable Rust Oe-selftest
         #self.skipTest("The Rust Oe-selftest is disabled.")
=20
-        # Skip mips32 target since it is unstable with rust tests
-        machine =3D get_bb_var('MACHINE')
-        if machine =3D=3D "qemumips":
-            self.skipTest("The mips32 target is skipped for Rust Oe-self=
test.")
-
         # build remote-test-server before image build
         recipe =3D "rust"
         start_time =3D time.time()
--=20
2.34.1


