Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3504E7735C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2016 12:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u51CZslL006905; Wed, 1 Jun 2016 13:35:54 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ORVgKk-iD5k7; Wed,  1 Jun 2016 13:35:54 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u51CZpZd006886
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 1 Jun 2016 13:35:52 +0100
Received: from richard by hex with local (Exim 4.86)
	(envelope-from <richard@rpsys.net>)
	id 1b85NH-0000lb-FZ; Wed, 01 Jun 2016 13:35:51 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2016 13:35:36 +0100
Message-Id: <1464784540-2786-18-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 18/22] selftest/devtool: Compare sets instead of arrays on AssertEqual
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
X-List-Received-Date: Wed, 01 Jun 2016 12:36:01 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Sets are safer when comparing internal elements and positions are not
important. This commit avoid errors observed on python3 builds as reported
on the below bugzilla entry.

[YOCTO #9661]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/devtool.py | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 6d2417e..deb3090 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -818,28 +818,28 @@ class DevtoolTests(DevtoolBase):
 
         # Check bbappend contents
         result = runCmd('git rev-parse HEAD', cwd=tempsrcdir)
-        expectedlines = ['SRCREV = "%s"\n' % result.output,
-                         '\n',
-                         'SRC_URI = "%s"\n' % git_uri,
-                         '\n']
+        expectedlines = set(['SRCREV = "%s"\n' % result.output,
+                             '\n',
+                             'SRC_URI = "%s"\n' % git_uri,
+                             '\n'])
         with open(bbappendfile, 'r') as f:
-            self.assertEqual(expectedlines, f.readlines())
+            self.assertEqual(expectedlines, set(f.readlines()))
 
         # Check we can run it again and bbappend isn't modified
         result = runCmd('devtool update-recipe -m srcrev %s -a %s' % (testrecipe, templayerdir))
         with open(bbappendfile, 'r') as f:
-            self.assertEqual(expectedlines, f.readlines())
+            self.assertEqual(expectedlines, set(f.readlines()))
         # Drop new commit and check SRCREV changes
         result = runCmd('git reset HEAD^', cwd=tempsrcdir)
         result = runCmd('devtool update-recipe -m srcrev %s -a %s' % (testrecipe, templayerdir))
         self.assertFalse(os.path.exists(os.path.join(appenddir, testrecipe)), 'Patch directory should not be created')
         result = runCmd('git rev-parse HEAD', cwd=tempsrcdir)
-        expectedlines = ['SRCREV = "%s"\n' % result.output,
-                         '\n',
-                         'SRC_URI = "%s"\n' % git_uri,
-                         '\n']
+        expectedlines = set(['SRCREV = "%s"\n' % result.output,
+                             '\n',
+                             'SRC_URI = "%s"\n' % git_uri,
+                             '\n'])
         with open(bbappendfile, 'r') as f:
-            self.assertEqual(expectedlines, f.readlines())
+            self.assertEqual(expectedlines, set(f.readlines()))
         # Put commit back and check we can run it if layer isn't in bblayers.conf
         os.remove(bbappendfile)
         result = runCmd('git commit -a -m "Change the Makefile"', cwd=tempsrcdir)
@@ -848,12 +848,12 @@ class DevtoolTests(DevtoolBase):
         self.assertIn('WARNING: Specified layer is not currently enabled in bblayers.conf', result.output)
         self.assertFalse(os.path.exists(os.path.join(appenddir, testrecipe)), 'Patch directory should not be created')
         result = runCmd('git rev-parse HEAD', cwd=tempsrcdir)
-        expectedlines = ['SRCREV = "%s"\n' % result.output,
-                         '\n',
-                         'SRC_URI = "%s"\n' % git_uri,
-                         '\n']
+        expectedlines = set(['SRCREV = "%s"\n' % result.output,
+                             '\n',
+                             'SRC_URI = "%s"\n' % git_uri,
+                             '\n'])
         with open(bbappendfile, 'r') as f:
-            self.assertEqual(expectedlines, f.readlines())
+            self.assertEqual(expectedlines, set(f.readlines()))
         # Deleting isn't expected to work under these circumstances
 
     @testcase(1370)
-- 
2.5.0


