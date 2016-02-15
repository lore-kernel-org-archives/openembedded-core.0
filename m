Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AD4C2731DB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 15:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1FFkosV015293 for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 15:46:50 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id fvkuzqby2EWv
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 15:46:50 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1FFkkVW015288
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 15:46:47 GMT
Message-ID: <1455551206.16142.422.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Feb 2016 15:46:46 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] oeqa: Update to handle domain specific references in build logs
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
X-List-Received-Date: Mon, 15 Feb 2016 15:46:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

With the addition of the task name to recipe output, the sanity tests
need updates where they are looking for specific messages.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index 94ca79c..42ae9d0 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -8,6 +8,11 @@ from oeqa.utils.decorators import testcase
 
 class BitbakeTests(oeSelfTest):
 
+    def getline(self, res, line):
+        for l in res.output.split('\n'):
+            if line in l:
+                return l
+
     @testcase(789)
     def test_run_bitbake_from_dir_1(self):
         os.chdir(os.path.join(self.builddir, 'conf'))
@@ -63,7 +68,8 @@ class BitbakeTests(oeSelfTest):
         result = bitbake('man -c patch', ignore_status=True)
         self.delete_recipeinc('man')
         bitbake('-cclean man')
-        self.assertTrue("ERROR: Function failed: patch_do_patch" in result.output, msg = "Though no man-1.5h1-make.patch file exists, bitbake didn't output any err. message. bitbake output: %s" % result.output)
+        line = self.getline(result, "Function failed: patch_do_patch")
+        self.assertTrue(line and line.startswith("ERROR:"), msg = "Though no man-1.5h1-make.patch file exists, bitbake didn't output any err. message. bitbake output: %s" % result.output)
 
     @testcase(1354)
     def test_force_task_1(self):
@@ -135,7 +141,8 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
         self.assertEqual(result.status, 1, msg="Command succeded when it should have failed. bitbake output: %s" % result.output)
         self.assertTrue('Fetcher failure: Unable to find file file://invalid anywhere. The paths that were searched were:' in result.output, msg = "\"invalid\" file \
 doesn't exist, yet no error message encountered. bitbake output: %s" % result.output)
-        self.assertTrue('ERROR: Function failed: Fetcher failure for URL: \'file://invalid\'. Unable to fetch URL from any source.' in result.output, msg = "\"invalid\" file \
+        line = self.getline(result, 'Function failed: Fetcher failure for URL: \'file://invalid\'. Unable to fetch URL from any source.')
+        self.assertTrue(line and line.startswith("ERROR:"), msg = "\"invalid\" file \
 doesn't exist, yet fetcher didn't report any error. bitbake output: %s" % result.output)
 
     @testcase(171)
diff --git a/meta/lib/oeqa/selftest/buildhistory.py b/meta/lib/oeqa/selftest/buildhistory.py
index 38bcd72..674da62 100644
--- a/meta/lib/oeqa/selftest/buildhistory.py
+++ b/meta/lib/oeqa/selftest/buildhistory.py
@@ -38,7 +38,7 @@ class BuildhistoryBase(oeSelfTest):
         if expect_error:
             self.assertEqual(result.status, 1, msg="Error expected for global config '%s' and target config '%s'" % (global_config, target_config))
             search_for_error = re.search(error_regex, result.output)
-            self.assertTrue(search_for_error, msg="Could not find desired error in output: %s" % error_regex)
+            self.assertTrue(search_for_error, msg="Could not find desired error in output: %s (%s)" % (error_regex, result.output))
         else:
             self.assertEqual(result.status, 0, msg="Command 'bitbake %s' has failed unexpectedly: %s" % (target, result.output))
 
diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index 6167fb2..602d95f 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -74,6 +74,10 @@ class DiskMonTest(oeSelfTest):
         self.assertTrue('WARNING: The free space' in res.output, msg = "A warning should have been displayed for disk monitor is set to WARN: %s" %res.output)
 
 class SanityOptionsTest(oeSelfTest):
+    def getline(self, res, line):
+        for l in res.output.split('\n'):
+            if line in l:
+                return l
 
     @testcase(927)
     def test_options_warnqa_errorqa_switch(self):
@@ -85,7 +89,8 @@ class SanityOptionsTest(oeSelfTest):
         self.write_recipeinc('xcursor-transparent-theme', 'PACKAGES += \"${PN}-dbg\"')
         res = bitbake("xcursor-transparent-theme", ignore_status=True)
         self.delete_recipeinc('xcursor-transparent-theme')
-        self.assertTrue("ERROR: QA Issue: xcursor-transparent-theme-dbg is listed in PACKAGES multiple times, this leads to packaging errors." in res.output, msg=res.output)
+        line = self.getline(res, "QA Issue: xcursor-transparent-theme-dbg is listed in PACKAGES multiple times, this leads to packaging errors.")
+        self.assertTrue(line and line.startswith("ERROR:"), msg=res.output)
         self.assertEqual(res.status, 1, msg = "bitbake reported exit code %s. It should have been 1. Bitbake output: %s" % (str(res.status), res.output))
         self.write_recipeinc('xcursor-transparent-theme', 'PACKAGES += \"${PN}-dbg\"')
         self.append_config('ERROR_QA_remove = "packages-list"')
@@ -93,15 +98,18 @@ class SanityOptionsTest(oeSelfTest):
         bitbake("xcursor-transparent-theme -ccleansstate")
         res = bitbake("xcursor-transparent-theme")
         self.delete_recipeinc('xcursor-transparent-theme')
-        self.assertTrue("WARNING: QA Issue: xcursor-transparent-theme-dbg is listed in PACKAGES multiple times, this leads to packaging errors." in res.output, msg=res.output)
+        line = self.getline(res, "QA Issue: xcursor-transparent-theme-dbg is listed in PACKAGES multiple times, this leads to packaging errors.")
+        self.assertTrue(line and line.startswith("WARNING:"), msg=res.output)
 
     @testcase(278)
     def test_sanity_userspace_dependency(self):
         self.write_config('WARN_QA_append = " unsafe-references-in-binaries unsafe-references-in-scripts"')
         bitbake("-ccleansstate gzip nfs-utils")
         res = bitbake("gzip nfs-utils")
-        self.assertTrue("WARNING: QA Issue: gzip" in res.output, "WARNING: QA Issue: gzip message is not present in bitbake's output: %s" % res.output)
-        self.assertTrue("WARNING: QA Issue: nfs-utils" in res.output, "WARNING: QA Issue: nfs-utils message is not present in bitbake's output: %s" % res.output)
+        line = self.getline(res, "QA Issue: gzip")
+        self.assertTrue(line and line.startswith("WARNING:"), "WARNING: QA Issue: gzip message is not present in bitbake's output: %s" % res.output)
+        line = self.getline(res, "QA Issue: nfs-utils")
+        self.assertTrue(line and line.startswith("WARNING:"), "WARNING: QA Issue: nfs-utils message is not present in bitbake's output: %s" % res.output)
 
 class BuildhistoryTests(BuildhistoryBase):
 
@@ -114,7 +122,7 @@ class BuildhistoryTests(BuildhistoryBase):
     def test_buildhistory_buildtime_pr_backwards(self):
         self.add_command_to_tearDown('cleanup-workdir')
         target = 'xcursor-transparent-theme'
-        error = "ERROR: QA Issue: Package version for package %s went backwards which would break package feeds from (.*-r1 to .*-r0)" % target
+        error = "ERROR:.*QA Issue: Package version for package %s went backwards which would break package feeds from (.*-r1.* to .*-r0.*)" % target
         self.run_buildhistory_operation(target, target_config="PR = \"r1\"", change_bh_location=True)
         self.run_buildhistory_operation(target, target_config="PR = \"r0\"", change_bh_location=False, expect_error=True, error_regex=error)
 



