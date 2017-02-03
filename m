Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BEF596E5FB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2017 10:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v13AfPcL025268; Fri, 3 Feb 2017 10:41:25 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id AB9KkPbb7a86; Fri,  3 Feb 2017 10:41:25 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v13AfMKH025262
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 3 Feb 2017 10:41:24 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cZbIw-00060h-QV; Fri, 03 Feb 2017 10:41:22 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Feb 2017 10:41:19 +0000
Message-Id: <1486118480-23064-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] oeqa/runtime: Improve failure log output
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Feb 2017 10:41:29 -0000

Printing a message which says "configure failed" without the log output
is effectively useless. If a command fails, print the output by default
and simplify the calling code which makes debugging any of these failures
much easier.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/buildcvs.py           | 11 +++--------
 meta/lib/oeqa/runtime/cases/buildgalculator.py    |  7 ++-----
 meta/lib/oeqa/runtime/cases/buildiptables.py      | 11 +++--------
 meta/lib/oeqa/runtime/utils/targetbuildproject.py |  6 +++++-
 4 files changed, 13 insertions(+), 22 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/buildcvs.py b/meta/lib/oeqa/runtime/cases/buildcvs.py
index 341eb49..c3f3acc 100644
--- a/meta/lib/oeqa/runtime/cases/buildcvs.py
+++ b/meta/lib/oeqa/runtime/cases/buildcvs.py
@@ -25,11 +25,6 @@ class BuildCvsTest(OERuntimeTestCase):
                       'Test requires tools-sdk to be in IMAGE_FEATURES')
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_cvs(self):
-        self.assertEqual(self.project.run_configure(), 0,
-                        msg="Running configure failed")
-
-        self.assertEqual(self.project.run_make(), 0,
-                        msg="Running make failed")
-
-        self.assertEqual(self.project.run_install(), 0,
-                        msg="Running make install failed")
+        self.project.run_configure()
+        self.project.run_make()
+        self.project.run_install()
diff --git a/meta/lib/oeqa/runtime/cases/buildgalculator.py b/meta/lib/oeqa/runtime/cases/buildgalculator.py
index 0bd76f9..7c9d4a3 100644
--- a/meta/lib/oeqa/runtime/cases/buildgalculator.py
+++ b/meta/lib/oeqa/runtime/cases/buildgalculator.py
@@ -24,8 +24,5 @@ class GalculatorTest(OERuntimeTestCase):
                       'Test requires tools-sdk to be in IMAGE_FEATURES')
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_galculator(self):
-        self.assertEqual(self.project.run_configure(), 0,
-                        msg="Running configure failed")
-
-        self.assertEqual(self.project.run_make(), 0,
-                        msg="Running make failed")
+        self.project.run_configure()
+        self.project.run_make()
diff --git a/meta/lib/oeqa/runtime/cases/buildiptables.py b/meta/lib/oeqa/runtime/cases/buildiptables.py
index bae8039..002b16c 100644
--- a/meta/lib/oeqa/runtime/cases/buildiptables.py
+++ b/meta/lib/oeqa/runtime/cases/buildiptables.py
@@ -25,14 +25,9 @@ class BuildIptablesTest(OERuntimeTestCase):
                       'Test requires tools-sdk to be in IMAGE_FEATURES')
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_iptables(self):
-        self.assertEqual(self.project.run_configure(), 0,
-                        msg="Running configure failed")
-
-        self.assertEqual(self.project.run_make(), 0,
-                        msg="Running make failed")
-
-        self.assertEqual(self.project.run_install(), 0,
-                        msg="Running make install failed")
+        self.project.run_configure()
+        self.project.run_make()
+        self.project.run_install()
 
     @classmethod
     def tearDownClass(self):
diff --git a/meta/lib/oeqa/runtime/utils/targetbuildproject.py b/meta/lib/oeqa/runtime/utils/targetbuildproject.py
index 1ed5789..551b0b6 100644
--- a/meta/lib/oeqa/runtime/utils/targetbuildproject.py
+++ b/meta/lib/oeqa/runtime/utils/targetbuildproject.py
@@ -33,4 +33,8 @@ class TargetBuildProject(BuildProject):
     # The timeout parameter of target.run is set to 0
     # to make the ssh command run with no timeout.
     def _run(self, cmd):
-        return self.target.run(cmd, 0)[0]
+        ret = self.target.run(cmd, 0)
+        msg = "Command %s failed with exit code %s: %s" % (cmd, ret[0], ret[1])
+        if ret[0] != 0:
+            raise Exception(msg)
+        return ret[0]
-- 
2.7.4


