Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D87CF77AF0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 16:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v37GluE8012035; 
	Fri, 7 Apr 2017 17:47:59 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id yNH3CPiYGIYw; Fri,  7 Apr 2017 17:47:59 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v37Gfqie011513
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 7 Apr 2017 17:41:53 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cwWxM-0000QD-Rk; Fri, 07 Apr 2017 17:41:52 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Apr 2017 17:41:48 +0100
Message-Id: <1491583311-1551-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/4] selftest/sstatetests: Replace glibc-initial with linux-libc-headers
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
X-List-Received-Date: Fri, 07 Apr 2017 16:48:02 -0000

The intent in these tests was to find something early in the bootstrap
process to run tests against which didn't require long build times.
This breaks with the removal of the glibc-initial do_build target.
Replacing it with linux-libc-headers seems like a good choice
and simplifies the conditionals too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/sstatetests.py | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/sstatetests.py
index 5814815..e35ddff 100644
--- a/meta/lib/oeqa/selftest/sstatetests.py
+++ b/meta/lib/oeqa/selftest/sstatetests.py
@@ -49,15 +49,11 @@ class SStateTests(SStateBase):
 
     @testcase(976)
     def test_sstate_creation_distro_nonspecific_pass(self):
-        # glibc-initial is intended only for the glibc C library
-        if self.tclibc == 'glibc':
-            self.run_test_sstate_creation(['glibc-initial'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True)
+        self.run_test_sstate_creation(['linux-libc-headers'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True)
 
     @testcase(1375)
     def test_sstate_creation_distro_nonspecific_fail(self):
-        # glibc-initial is intended only for the glibc C library
-        if self.tclibc == 'glibc':
-            self.run_test_sstate_creation(['glibc-initial'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True, should_pass=False)
+        self.run_test_sstate_creation(['linux-libc-headers'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True, should_pass=False)
 
     # Test the sstate files deletion part of the do_cleansstate task
     def run_test_cleansstate_task(self, targets, distro_specific=True, distro_nonspecific=True, temp_sstate_location=True):
@@ -79,23 +75,17 @@ class SStateTests(SStateBase):
     @testcase(977)
     def test_cleansstate_task_distro_specific_nonspecific(self):
         targets = ['binutils-cross-'+ self.tune_arch, 'binutils-native']
-        # glibc-initial is intended only for the glibc C library
-        if self.tclibc == 'glibc':
-            targets.append('glibc-initial')
+        targets.append('linux-libc-headers')
         self.run_test_cleansstate_task(targets, distro_specific=True, distro_nonspecific=True, temp_sstate_location=True)
 
     @testcase(1376)
     def test_cleansstate_task_distro_nonspecific(self):
-        # glibc-initial is intended only for the glibc C library
-        if self.tclibc == 'glibc':
-            self.run_test_cleansstate_task(['glibc-initial'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True)
+        self.run_test_cleansstate_task(['linux-libc-headers'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True)
 
     @testcase(1377)
     def test_cleansstate_task_distro_specific(self):
         targets = ['binutils-cross-'+ self.tune_arch, 'binutils-native']
-        # glibc-initial is intended only for the glibc C library
-        if self.tclibc == 'glibc':
-            targets.append('glibc-initial')
+        targets.append('linux-libc-headers')
         self.run_test_cleansstate_task(targets, distro_specific=True, distro_nonspecific=False, temp_sstate_location=True)
 
 
-- 
2.7.4


