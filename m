Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D16BCC433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:29:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.703.1648751366006022797
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3B211596
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:26 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 74C923F718
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:26 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 18/23] oeqa/selftest/oescripts: refactor skipping logic
Date: Thu, 31 Mar 2022 19:29:10 +0100
Message-Id: <20220331182915.22128-18-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331182915.22128-1-ross.burton@arm.com>
References: <20220331182915.22128-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 18:29:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163859

OEScriptTests currently skips if cairo isn't present, and does a build
of core-image-minimal.  This is only required for the
OEPybootchartguyTests tests, so move that logic there so that the
OEListPackageconfigTests run even if cairo isn't available.

This leaves OEScriptTests as a simple class containing the scripts_dir
assignment, which can then be reused by other tests to avoid code
duplication.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/oescripts.py | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/se=
lftest/cases/oescripts.py
index b3261e512f5..cd687816c83 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -34,21 +34,19 @@ class BuildhistoryDiffTests(BuildhistoryBase):
         if expected_endlines:
             self.fail('Missing expected line endings:\n  %s' % '\n  '.jo=
in(expected_endlines))
=20
-@unittest.skipUnless(importlib.util.find_spec("cairo"), "Python cairo mo=
dule is not present")
 class OEScriptTests(OESelftestTestCase):
+    scripts_dir =3D os.path.join(get_bb_var('COREBASE'), 'scripts')
+
+@unittest.skipUnless(importlib.util.find_spec("cairo"), "Python cairo mo=
dule is not present")
+class OEPybootchartguyTests(OEScriptTests):
=20
     @classmethod
     def setUpClass(cls):
         super(OEScriptTests, cls).setUpClass()
-        import cairo
         bitbake("core-image-minimal -c rootfs -f")
         cls.tmpdir =3D get_bb_var('TMPDIR')
         cls.buildstats =3D cls.tmpdir + "/buildstats/" + sorted(os.listd=
ir(cls.tmpdir + "/buildstats"))[-1]
=20
-    scripts_dir =3D os.path.join(get_bb_var('COREBASE'), 'scripts')
-
-class OEPybootchartguyTests(OEScriptTests):
-
     def test_pybootchartguy_help(self):
         runCmd('%s/pybootchartgui/pybootchartgui.py  --help' % self.scri=
pts_dir)
=20
@@ -65,9 +63,7 @@ class OEPybootchartguyTests(OEScriptTests):
         self.assertTrue(os.path.exists(self.tmpdir + "/charts.pdf"))
=20
=20
-class OEGitproxyTests(OESelftestTestCase):
-
-    scripts_dir =3D os.path.join(get_bb_var('COREBASE'), 'scripts')
+class OEGitproxyTests(OEScriptTests):
=20
     def test_oegitproxy_help(self):
         try:
--=20
2.25.1


