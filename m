Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6013F76324
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 13:05:15 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 27 Jul 2015 06:05:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,554,1432623600"; d="scan'208";a="530926418"
Received: from rmoore5-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.162])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Jul 2015 06:05:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jul 2015 14:04:03 +0100
Message-Id: <e6e4c682268e6b0fa943d212970f0223228f1c9e.1438001581.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1438001581.git.paul.eggleton@linux.intel.com>
References: <cover.1438001581.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1438001581.git.paul.eggleton@linux.intel.com>
References: <cover.1438001581.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 08/11] oeqa/selftest/imagefeatures: fix SSH without password tests
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
X-List-Received-Date: Mon, 27 Jul 2015 13:05:15 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

* We need to set EXTRA_IMAGE_FEATURES outright or existing values will
  affect the test
* For test case 1107 we need "empty-root-password" to match the behaviour
  described in the test case
* For test case 1115 we shouldn't be able to connect as root with the
  features we are setting

Test cases 1107 and 1115 have been updated in Testopia to match.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/imagefeatures.py | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/imagefeatures.py b/meta/lib/oeqa/selftest/imagefeatures.py
index d48435f..20cc58d 100644
--- a/meta/lib/oeqa/selftest/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/imagefeatures.py
@@ -25,7 +25,7 @@ class ImageFeatures(oeSelfTest):
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         """
 
-        features = 'EXTRA_IMAGE_FEATURES += "ssh-server-openssh empty-root-password"\n'
+        features = 'EXTRA_IMAGE_FEATURES = "ssh-server-openssh empty-root-password allow-empty-password"\n'
         features += 'INHERIT += "extrausers"\n'
         features += 'EXTRA_USERS_PARAMS = "useradd -p \'\' {}; usermod -s /bin/sh {};"'.format(self.test_user, self.test_user)
 
@@ -46,12 +46,14 @@ class ImageFeatures(oeSelfTest):
     def test_all_users_can_connect_via_ssh_without_password(self):
         """
         Summary:     Check if all users can connect via ssh without password
-        Expected:    1. Connection to the image via ssh using root or tester user without providing a password should be allowed.
+        Expected: 1. Connection to the image via ssh using root user without providing a password should NOT be allowed.
+                  2. Connection to the image via ssh using tester user without providing a password should be allowed.
         Product:     oe-core
         Author:      Ionut Chisanovici <ionutx.chisanovici@intel.com>
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         """
-        features = 'EXTRA_IMAGE_FEATURES += "ssh-server-openssh allow-empty-password"\n'
+
+        features = 'EXTRA_IMAGE_FEATURES = "ssh-server-openssh allow-empty-password"\n'
         features += 'INHERIT += "extrausers"\n'
         features += 'EXTRA_USERS_PARAMS = "useradd -p \'\' {}; usermod -s /bin/sh {};"'.format(self.test_user, self.test_user)
 
@@ -66,7 +68,10 @@ class ImageFeatures(oeSelfTest):
             for user in [self.root_user, self.test_user]:
                 ssh = SSHControl(ip=qemu.ip, logfile=qemu.sshlog, user=user)
                 status, output = ssh.run("true")
-                self.assertEqual(status, 0, 'ssh to user tester failed with %s' % output)
+                if user == 'root':
+                    self.assertNotEqual(status, 0, 'ssh to user root was allowed when it should not have been')
+                else:
+                    self.assertEqual(status, 0, 'ssh to user tester failed with %s' % output)
 
 
     @testcase(1114)
-- 
2.1.0


