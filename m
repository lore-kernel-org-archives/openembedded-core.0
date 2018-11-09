Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 111226C203
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 14:29:18 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f1-v6so3893843wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Nov 2018 06:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=NrqbrpHlzF7njQe4/s5+NhQJ1qma0fStJGJ8lpzTS5M=;
	b=A1VyqQZJB3LQ05lgRESOXAlxjPI+lA1WmA8FfPz3cIuIRqPwciORAGzQ+Pt0K/jIag
	eRlzuKG6Smz2hIaJpVMupgU+mmkwbmgj37nSNbbKOvExfA5dZE7BQYF9OX3lVvRZnIYy
	zxP21qrr6AhF2ST7CBC5abiFshjZ9A66y7Udg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=NrqbrpHlzF7njQe4/s5+NhQJ1qma0fStJGJ8lpzTS5M=;
	b=Ur4L/uK2d1iXLxUjonOVV6TcUXkJ4YFYekigHp2Fn4hNZfaPUt7apeJRvhMycsljuh
	t91omEvXxTZyoikMmfLq9g/5j4g1yp6DsBus6tI2zCNOOSYzNTLUGWhSeJ+ExIqvXqz3
	KjYvnDJ008pDTLv/Wdg4DhGFuS5WNxSJ+n41sw1Ph5BQc097/k6OBvPUZGS6QlnZtjbq
	uTw62xPQ+utDoCX0cTfkjLgA+gtdC9q2Of/lE38O4A9t4taSJfKD/zzMg3yJdwda/smD
	MQ3i7v8BOTQQW3PjoiRFRteNMzfmczwwZOdjkhIr2cPn++sOqpicX+XfqGSnEm90lFhv
	eDbQ==
X-Gm-Message-State: AGRZ1gLjY7+HtA0/bW5WBKGHadPRI+ycXxLXtEXw1CPwzlxxM9cujq2u
	OQ/NZ4mbeiJLPSWsh6TC4zTyxWuGBFM=
X-Google-Smtp-Source: AJdET5fl700qFImYYVif9NFDqRURtAytgNwnJ4AVpwvMbJFZZwA21//eL6djk0WGPfowmjBR7aHQcA==
X-Received: by 2002:a1c:4d3:: with SMTP id 202-v6mr5146228wme.67.1541773759079;
	Fri, 09 Nov 2018 06:29:19 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h16-v6sm7713764wrb.73.2018.11.09.06.29.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Nov 2018 06:29:18 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Nov 2018 14:29:05 +0000
Message-Id: <20181109142912.23102-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
References: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 05/12] oeqa/runtime/cases: Improve test dependency information
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
X-List-Received-Date: Fri, 09 Nov 2018 14:29:19 -0000

Add the OEHasPackage decorator to a variety of tests so they determine
automatically if they should run against a given image.

To ensure tests can do this we need to move target operations such
as scp commands into the tests and out of the class startup/teardown.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/date.py   |  2 ++
 meta/lib/oeqa/runtime/cases/df.py     |  2 ++
 meta/lib/oeqa/runtime/cases/ptest.py  |  2 ++
 meta/lib/oeqa/runtime/cases/python.py |  8 ++------
 meta/lib/oeqa/runtime/cases/rpm.py    | 26 ++++++++++----------------
 meta/lib/oeqa/runtime/cases/scp.py    |  2 ++
 meta/lib/oeqa/runtime/cases/ssh.py    |  2 ++
 meta/lib/oeqa/runtime/cases/stap.py   |  2 ++
 meta/lib/oeqa/runtime/cases/xorg.py   |  2 ++
 9 files changed, 26 insertions(+), 22 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/date.py b/meta/lib/oeqa/runtime/cases/date.py
index ece7338de73..0887b831f42 100644
--- a/meta/lib/oeqa/runtime/cases/date.py
+++ b/meta/lib/oeqa/runtime/cases/date.py
@@ -3,6 +3,7 @@ import re
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.oeid import OETestID
+from oeqa.runtime.decorator.package import OEHasPackage
 
 class DateTest(OERuntimeTestCase):
 
@@ -18,6 +19,7 @@ class DateTest(OERuntimeTestCase):
 
     @OETestID(211)
     @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['coreutils', 'busybox'])
     def test_date(self):
         (status, output) = self.target.run('date +"%Y-%m-%d %T"')
         msg = 'Failed to get initial date, output: %s' % output
diff --git a/meta/lib/oeqa/runtime/cases/df.py b/meta/lib/oeqa/runtime/cases/df.py
index aecc32d7ce3..e0b6bb839d1 100644
--- a/meta/lib/oeqa/runtime/cases/df.py
+++ b/meta/lib/oeqa/runtime/cases/df.py
@@ -1,11 +1,13 @@
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.oeid import OETestID
+from oeqa.runtime.decorator.package import OEHasPackage
 
 class DfTest(OERuntimeTestCase):
 
     @OETestID(234)
     @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['coreutils', 'busybox'])
     def test_df(self):
         cmd = "df / | sed -n '2p' | awk '{print $4}'"
         (status,output) = self.target.run(cmd)
diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index 77ae7b6b863..0972a583eeb 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -5,6 +5,7 @@ from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.oeid import OETestID
 from oeqa.core.decorator.data import skipIfNotFeature
+from oeqa.runtime.decorator.package import OEHasPackage
 from oeqa.utils.logparser import Lparser, Result
 
 class PtestRunnerTest(OERuntimeTestCase):
@@ -52,6 +53,7 @@ class PtestRunnerTest(OERuntimeTestCase):
     @OETestID(1600)
     @skipIfNotFeature('ptest', 'Test requires ptest to be in DISTRO_FEATURES')
     @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['ptest-runner'])
     @unittest.expectedFailure
     def test_ptestrunner(self):
         status, output = self.target.run('which ptest-runner', 0)
diff --git a/meta/lib/oeqa/runtime/cases/python.py b/meta/lib/oeqa/runtime/cases/python.py
index 4419a9f6394..66ab4d25f37 100644
--- a/meta/lib/oeqa/runtime/cases/python.py
+++ b/meta/lib/oeqa/runtime/cases/python.py
@@ -1,16 +1,12 @@
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.oeid import OETestID
+from oeqa.runtime.decorator.package import OEHasPackage
 
 class PythonTest(OERuntimeTestCase):
-    @classmethod
-    def setUpClass(cls):
-        import unittest
-        if "python3-core" not in cls.tc.image_packages:
-            raise unittest.SkipTest("Python3 not on target")
-
     @OETestID(965)
     @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['python3-core'])
     def test_python3(self):
         cmd = "python3 -c \"import codecs; print(codecs.encode('Uryyb, jbeyq', 'rot13'))\""
         status, output = self.target.run(cmd)
diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/cases/rpm.py
index 1e5e4631d37..0213c4b57e8 100644
--- a/meta/lib/oeqa/runtime/cases/rpm.py
+++ b/meta/lib/oeqa/runtime/cases/rpm.py
@@ -10,11 +10,6 @@ from oeqa.core.utils.path import findFile
 
 class RpmBasicTest(OERuntimeTestCase):
 
-    @classmethod
-    def setUpClass(cls):
-        if cls.tc.td['PACKAGE_CLASSES'].split()[0] != 'package_rpm':
-            cls.skipTest('Tests require image to be build from rpm')
-
     @OETestID(960)
     @OEHasPackage(['rpm'])
     @OETestDepends(['ssh.SSHTest.test_ssh'])
@@ -34,30 +29,25 @@ class RpmInstallRemoveTest(OERuntimeTestCase):
 
     @classmethod
     def setUpClass(cls):
-        if cls.tc.td['PACKAGE_CLASSES'].split()[0] != 'package_rpm':
-            cls.skipTest('Tests require image to be build from rpm')
-
         pkgarch = cls.td['TUNE_PKGARCH'].replace('-', '_')
         rpmdir = os.path.join(cls.tc.td['DEPLOY_DIR'], 'rpm', pkgarch)
         # Pick base-passwd-doc as a test file to get installed, because it's small
         # and it will always be built for standard targets
         rpm_doc = 'base-passwd-doc-*.%s.rpm' % pkgarch
+        if not os.path.exists(rpmdir):
+            return
         for f in fnmatch.filter(os.listdir(rpmdir), rpm_doc):
-            test_file = os.path.join(rpmdir, f)
-        dst = '/tmp/base-passwd-doc.rpm'
-        cls.tc.target.copyTo(test_file, dst)
-
-    @classmethod
-    def tearDownClass(cls):
-        dst = '/tmp/base-passwd-doc.rpm'
-        cls.tc.target.run('rm -f %s' % dst)
+            cls.test_file = os.path.join(rpmdir, f)
+        cls.dst = '/tmp/base-passwd-doc.rpm'
 
     @OETestID(192)
     @OETestDepends(['rpm.RpmBasicTest.test_rpm_help'])
     def test_rpm_install(self):
+        self.tc.target.copyTo(self.test_file, self.dst)
         status, output = self.target.run('rpm -ivh /tmp/base-passwd-doc.rpm')
         msg = 'Failed to install base-passwd-doc package: %s' % output
         self.assertEqual(status, 0, msg=msg)
+        self.tc.target.run('rm -f %s' % self.dst)
 
     @OETestID(194)
     @OETestDepends(['rpm.RpmInstallRemoveTest.test_rpm_install'])
@@ -118,6 +108,8 @@ class RpmInstallRemoveTest(OERuntimeTestCase):
         msg =  'Failed to find database files under /var/lib/rpm/ as __db.xxx'
         self.assertEqual(0, status, msg=msg)
 
+        self.tc.target.copyTo(self.test_file, self.dst)
+
         # Remove the package just in case
         self.target.run('rpm -e base-passwd-doc')
 
@@ -131,6 +123,8 @@ class RpmInstallRemoveTest(OERuntimeTestCase):
             msg = 'Failed to remove base-passwd-doc package. Reason: {}'.format(output)
             self.assertEqual(0, status, msg=msg)
 
+        self.tc.target.run('rm -f %s' % self.dst)
+
         # if using systemd this should ensure all entries are flushed to /var
         status, output = self.target.run("journalctl --sync")
         # Get the amount of entries in the log file
diff --git a/meta/lib/oeqa/runtime/cases/scp.py b/meta/lib/oeqa/runtime/cases/scp.py
index f488a6175bb..8f895da95a2 100644
--- a/meta/lib/oeqa/runtime/cases/scp.py
+++ b/meta/lib/oeqa/runtime/cases/scp.py
@@ -4,6 +4,7 @@ from tempfile import mkstemp
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.oeid import OETestID
+from oeqa.runtime.decorator.package import OEHasPackage
 
 class ScpTest(OERuntimeTestCase):
 
@@ -20,6 +21,7 @@ class ScpTest(OERuntimeTestCase):
 
     @OETestID(220)
     @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['openssh-scp', 'dropbear'])
     def test_scp_file(self):
         dst = '/tmp/test_scp_file'
 
diff --git a/meta/lib/oeqa/runtime/cases/ssh.py b/meta/lib/oeqa/runtime/cases/ssh.py
index eca167969a7..0b1ea7bcc25 100644
--- a/meta/lib/oeqa/runtime/cases/ssh.py
+++ b/meta/lib/oeqa/runtime/cases/ssh.py
@@ -1,11 +1,13 @@
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.oeid import OETestID
+from oeqa.runtime.decorator.package import OEHasPackage
 
 class SSHTest(OERuntimeTestCase):
 
     @OETestID(224)
     @OETestDepends(['ping.PingTest.test_ping'])
+    @OEHasPackage(['dropbear', 'openssh-sshd'])
     def test_ssh(self):
         (status, output) = self.target.run('uname -a')
         self.assertEqual(status, 0, msg='SSH Test failed: %s' % output)
diff --git a/meta/lib/oeqa/runtime/cases/stap.py b/meta/lib/oeqa/runtime/cases/stap.py
index 96e197a2d68..747c1d95177 100644
--- a/meta/lib/oeqa/runtime/cases/stap.py
+++ b/meta/lib/oeqa/runtime/cases/stap.py
@@ -4,6 +4,7 @@ from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.oeid import OETestID
 from oeqa.core.decorator.data import skipIfNotFeature
+from oeqa.runtime.decorator.package import OEHasPackage
 
 class StapTest(OERuntimeTestCase):
 
@@ -22,6 +23,7 @@ class StapTest(OERuntimeTestCase):
     @skipIfNotFeature('tools-profile',
                       'Test requires tools-profile to be in IMAGE_FEATURES')
     @OETestDepends(['kernelmodule.KernelModuleTest.test_kernel_module'])
+    @OEHasPackage(['systemtap'])
     def test_stap(self):
         cmds = [
             'cd /usr/src/kernel && make scripts prepare',
diff --git a/meta/lib/oeqa/runtime/cases/xorg.py b/meta/lib/oeqa/runtime/cases/xorg.py
index 2124813e3c2..82521c69ac2 100644
--- a/meta/lib/oeqa/runtime/cases/xorg.py
+++ b/meta/lib/oeqa/runtime/cases/xorg.py
@@ -2,6 +2,7 @@ from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.oeid import OETestID
 from oeqa.core.decorator.data import skipIfNotFeature
+from oeqa.runtime.decorator.package import OEHasPackage
 
 class XorgTest(OERuntimeTestCase):
 
@@ -9,6 +10,7 @@ class XorgTest(OERuntimeTestCase):
     @skipIfNotFeature('x11-base',
                       'Test requires x11 to be in IMAGE_FEATURES')
     @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['xserver-nodm-init'])
     def test_xorg_running(self):
         cmd ='%s | grep -v xinit | grep [X]org' % self.tc.target_cmds['ps']
         status, output = self.target.run(cmd)
-- 
2.17.1


