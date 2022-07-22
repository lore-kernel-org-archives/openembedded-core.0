Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D32CC43334
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 13:14:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.7510.1658495689900764657
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 06:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4FC31063;
	Fri, 22 Jul 2022 06:14:49 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A312B3F70D;
	Fri, 22 Jul 2022 06:14:48 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] oeqa/selftest: rename git.py to intercept.py
Date: Fri, 22 Jul 2022 14:14:45 +0100
Message-Id: <20220722131445.2147132-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Jul 2022 13:14:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168407

By naming this test class git.py, any attempt to import GitPython (as
needed by oelib.buildhistory) failed.

As this class exercises the intercepts, rename it to intercept.py.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/{git.py =3D> intercept.py} | 0
 meta/lib/oeqa/selftest/cases/oelib/buildhistory.py    | 6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/lib/oeqa/selftest/cases/{git.py =3D> intercept.py} (100%)

diff --git a/meta/lib/oeqa/selftest/cases/git.py b/meta/lib/oeqa/selftest=
/cases/intercept.py
similarity index 100%
rename from meta/lib/oeqa/selftest/cases/git.py
rename to meta/lib/oeqa/selftest/cases/intercept.py
diff --git a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py b/meta/li=
b/oeqa/selftest/cases/oelib/buildhistory.py
index 802a91a4886..33bd6df2f3f 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
@@ -3,6 +3,7 @@
 #
=20
 import os
+import sys
 from oeqa.selftest.case import OESelftestTestCase
 import tempfile
 import operator
@@ -11,15 +12,14 @@ from oeqa.utils.commands import get_bb_var
 class TestBlobParsing(OESelftestTestCase):
=20
     def setUp(self):
-        import time
         self.repo_path =3D tempfile.mkdtemp(prefix=3D'selftest-buildhist=
ory',
             dir=3Dget_bb_var('TOPDIR'))
=20
         try:
             from git import Repo
             self.repo =3D Repo.init(self.repo_path)
-        except ImportError:
-            self.skipTest('Python module GitPython is not present')
+        except ImportError as e:
+            self.skipTest('Python module GitPython is not present (%s)  =
(%s)' % (e, sys.path))
=20
         self.test_file =3D "test"
         self.var_map =3D {}
--=20
2.34.1


