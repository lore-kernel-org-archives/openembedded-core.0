Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9F6006E666
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0HBHrXU020595 for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:17:53 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8RLwjoN4Dp24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:17:53 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0HBHlsJ020591
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:17:48 GMT
Message-ID: <1453029467.27999.17.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Jan 2016 11:17:47 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] selftest/buildhistory: Improve test to remove sources of error
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
X-List-Received-Date: Sun, 17 Jan 2016 11:17:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

When we add buildhistory, we expect do_rootfs to rerun, but depending
on IMAGE_FSTYPES, the number of tasks which would execute after
do_rootfs varies (e.g. live would add do_bootimg and we recently
added do_image).

Therefore limit the test to -c rootfs and then we're clear that only
one task should re-run.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index 64ced15..6167fb2 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -122,7 +122,7 @@ class BuildhistoryTests(BuildhistoryBase):
     def test_buildhistory_does_not_change_signatures(self):
         """
         Summary:     Ensure that buildhistory does not change signatures
-        Expected:    Only 'do_rootfs' and 'do_build' tasks are rerun
+        Expected:    Only 'do_rootfs' task should be rerun
         Product:     oe-core
         Author:      Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
@@ -139,12 +139,12 @@ class BuildhistoryTests(BuildhistoryBase):
 
         features = 'TMPDIR = "%s"\n' % tmpdir1
         self.write_config(features)
-        bitbake('core-image-sato -S none')
+        bitbake('core-image-sato -S none -c rootfs')
 
         features = 'TMPDIR = "%s"\n' % tmpdir2
         features += 'INHERIT += "buildhistory"\n'
         self.write_config(features)
-        bitbake('core-image-sato -S none')
+        bitbake('core-image-sato -S none -c rootfs')
 
         def get_files(d):
             f = []
@@ -161,24 +161,20 @@ class BuildhistoryTests(BuildhistoryBase):
         f2 = set(files2)
         sigdiff = f1 - f2
 
-        self.assertEqual(len(sigdiff), 2, 'Expected 2 signature differences. Out: %s' % list(sigdiff))
+        self.assertEqual(len(sigdiff), 1, 'Expected 1 signature differences. Out: %s' % list(sigdiff))
 
         unexpected_diff = []
 
-        # No new signatures should appear apart from do_rootfs and do_build
+        # No new signatures should appear apart from do_rootfs
         found_do_rootfs_flag = False
-        found_do_build_flag = False
 
         for sig in sigdiff:
             if 'do_rootfs' in sig:
                 found_do_rootfs_flag = True
-            elif 'do_build' in sig:
-                found_do_build_flag = True
             else:
                 unexpected_diff.append(sig)
 
         self.assertTrue(found_do_rootfs_flag, 'Task do_rootfs did not rerun.')
-        self.assertTrue(found_do_build_flag, 'Task do_build did not rerun')
         self.assertFalse(unexpected_diff, 'Found unexpected signature differences. Out: %s' % unexpected_diff)
 
 



