Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B4B7D7F8D3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2020 20:20:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 00GKJjmT017628
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 16 Jan 2020 12:19:55 -0800
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 16 Jan 2020 12:19:34 -0800
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Jan 2020 15:19:33 -0500
Message-ID: <20200116201933.29628-1-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH] logrotate.py: improve oeqa test implementation
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
X-List-Received-Date: Thu, 16 Jan 2020 20:20:21 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

See bug https://bugzilla.yoctoproject.org/show_bug.cgi?id=13632

Autobuilder tests occasionally fail, reporting that a new logfile
could not be created. While this failure did occur multiple times, it
could not be manually reproduced. However, there are issues with the
implementation of the logrotate.py script that can be fixed. These
changes will help make the failures clearer, should they continue to
occur.

Previously, the test_2_logrotate test would, after running the
logrotate tool, use "ls -al $HOME/logrotate_dir | wc -l" to count
the number of files in the rotation directory and determine if the
rotation was successful. The test to see if there are at least three
files is problematic, because depending on the version of ls used, it
may report the target value of 3 even when there are only hidden files
in the directory, potentially reporting a pass for the test when it
should actually fail. An example with coreutils:

root@qemux86-64:~# ls -al emptydir/
total 2
drwxr-xr-x 2 root root 1024 Jan 14 19:50 .
drwx------ 3 root root 1024 Jan 14 19:50 ..
root@qemux86-64:~#

Where "total" is the number of blocks used. Compare with busybox ls:

root@qemux86-64:~# ls -al emptydir/
drwxr-xr-x    2 root     root          1024 Jan 14 19:54 .
drwx------    3 root     root          1024 Jan 14 19:54 ..
root@qemux86-64:~#

Instead of using ls to verify that a certain number of files exists
in $HOME/logrotate_dir, the tests have been changed to rotate two
specific logs: the log for wtmp and a new logrotate_testfile created
during the second test. Both tests check that the logs are correctly
rotated into $HOME/logrotate_dir by using find and grep on the
expected filename (e.g. "wtmp" when rotated becomes "wtmp.1", so we
check to see that wtmp.1 is present in $HOME/logrotate_dir). In
addition, should the test fail, the directory listing is included in
the log to aid debugging.

Finally, note that while the autobuilder failures that this patch
addresses were only seen during core-image-full-cmdline tests, these
changes were successfully tested on core-image-minimal and
core-image-sato with the manual addition of logrotate and openssh-sshd
to the images.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta/lib/oeqa/runtime/cases/logrotate.py | 57 ++++++++++++++++++------
 1 file changed, 44 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/logrotate.py b/meta/lib/oeqa/runtime/cases/logrotate.py
index bfa57c534a..44e32766c7 100644
--- a/meta/lib/oeqa/runtime/cases/logrotate.py
+++ b/meta/lib/oeqa/runtime/cases/logrotate.py
@@ -18,32 +18,63 @@ class LogrotateTest(OERuntimeTestCase):
     @classmethod
     def tearDownClass(cls):
         cls.tc.target.run('mv -f $HOME/wtmp.oeqabak /etc/logrotate.d/wtmp && rm -rf $HOME/logrotate_dir')
+        cls.tc.target.run('rm -rf /var/log/logrotate_testfile && rm -rf /etc/logrotate.d/logrotate_testfile')
 
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['logrotate'])
-    def test_1_logrotate_setup(self):
+    def test_logrotate_wtmp(self):
+
         status, output = self.target.run('mkdir $HOME/logrotate_dir')
         msg = 'Could not create logrotate_dir. Output: %s' % output
         self.assertEqual(status, 0, msg = msg)
 
-        cmd = ('sed -i "s#wtmp {#wtmp {\\n    olddir $HOME/logrotate_dir#"'
-               ' /etc/logrotate.d/wtmp')
-        status, output = self.target.run(cmd)
-        msg = ('Could not write to logrotate.d/wtmp file. Status and output: '
-               ' %s and %s' % (status, output))
+        status, output = self.target.run('echo "create \n olddir $HOME/logrotate_dir \n include /etc/logrotate.d/wtmp" > /tmp/logrotate-test.conf')
+        msg = ('Could not write to /tmp/logrotate-test.conf')
+        self.assertEqual(status, 0, msg = msg)
+        
+        status, output = self.target.run('echo "/var/log/logrotate_test {\\n missingok \\n monthly \\n rotate 1" > /etc/logrotate.d/logrotate_test')
+        msg = ('Could not write to /etc/logrotate.d/logrotate_test')
         self.assertEqual(status, 0, msg = msg)
 
-    @OETestDepends(['logrotate.LogrotateTest.test_1_logrotate_setup'])
-    def test_2_logrotate(self):
-        status, output = self.target.run('echo "create \n include /etc/logrotate.d" > /tmp/logrotate-test.conf')
         status, output = self.target.run('logrotate -f /tmp/logrotate-test.conf')
-
         msg = ('logrotate service could not be reloaded. Status and output: '
                 '%s and %s' % (status, output))
         self.assertEqual(status, 0, msg = msg)
 
-        _, output = self.target.run('ls -la $HOME/logrotate_dir/ | wc -l')
+        status, output = self.target.run('find $HOME/logrotate_dir -type f | grep wtmp.1')
         msg = ('new logfile could not be created. List of files within log '
                'directory: %s' % (
-                self.target.run('ls -la $HOME/logrotate_dir')[1]))
-        self.assertTrue(int(output)>=3, msg = msg)
+                self.target.run('ls $HOME/logrotate_dir')[1]))
+        self.assertEqual(status, 0, msg = msg)
+       
+    @OETestDepends(['logrotate.LogrotateTest.test_logrotate_wtmp'])
+    def test_logrotate_newlog(self):
+        
+        status, output = self.target.run('echo "oeqa logrotate test file" > /var/log/logrotate_testfile')
+        msg = ('Could not create logrotate test file in /var/log')
+        self.assertEqual(status, 0, msg = msg)
+        
+        status, output = self.target.run('echo "/var/log/logrotate_testfile {\n missingok \n monthly \n rotate 1" > /etc/logrotate.d/logrotate_testfile')
+        msg = ('Could not write to /etc/logrotate.d/logrotate_testfile')
+        self.assertEqual(status, 0, msg = msg)
+
+        status, output = self.target.run('echo "create \n olddir $HOME/logrotate_dir \n include /etc/logrotate.d/logrotate_testfile" > /tmp/logrotate-test2.conf')
+        msg = ('Could not write to /tmp/logrotate_test2.conf')
+        self.assertEqual(status, 0, msg = msg)
+
+        status, output = self.target.run('find $HOME/logrotate_dir -type f | grep logrotate_testfile.1')
+        msg = ('A rotated log for logrotate_testfile is already present in logrotate_dir')
+        self.assertEqual(status, 1, msg = msg)
+
+        status, output = self.target.run('logrotate -f /tmp/logrotate-test2.conf')
+        msg = ('logrotate service could not be reloaded. Status and output: '
+                '%s and %s' % (status, output))
+        self.assertEqual(status, 0, msg = msg)
+
+        status, output = self.target.run('find $HOME/logrotate_dir -type f | grep logrotate_testfile.1')
+        msg = ('new logfile could not be created. List of files within log '
+                'directory: %s' % (
+                 self.target.run('ls $HOME/logrotate_dir')[1]))
+        self.assertEqual(status, 0, msg = msg)
+
+
-- 
2.24.0


