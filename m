Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 85954760AD
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Feb 2016 17:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u17HAT4q000450 for <openembedded-core@lists.openembedded.org>;
	Sun, 7 Feb 2016 17:10:47 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id P9fSCagXdYDX
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Feb 2016 17:10:47 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u17HAi8q000508
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 7 Feb 2016 17:10:45 GMT
Message-ID: <1454865043.27087.321.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 07 Feb 2016 17:10:43 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] sstatetests: Fix after change to sstate populate_lic SWSPEC
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
X-List-Received-Date: Sun, 07 Feb 2016 17:10:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=9fd214d2e7a931cfb46f40cb76d49aeb07af612e
changed SSTATE_SWSPEC, correctly however it did mean that some sstate files
now appear where the tests don't expect them. Filter the test results
to ignore the correct behaviour.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/sstatetests.py
index dd9f44e..643dd38 100644
--- a/meta/lib/oeqa/selftest/sstatetests.py
+++ b/meta/lib/oeqa/selftest/sstatetests.py
@@ -23,7 +23,16 @@ class SStateTests(SStateBase):
             bitbake(['-ccleansstate'] + targets)
 
         bitbake(targets)
-        file_tracker = self.search_sstate('|'.join(map(str, targets)), distro_specific, distro_nonspecific)
+        file_tracker = []
+        results = self.search_sstate('|'.join(map(str, targets)), distro_specific, distro_nonspecific)
+        if distro_nonspecific:
+            for r in results:
+                if r.endswith(("_populate_lic.tgz", "_populate_lic.tgz.siginfo", "_fetch.tgz.siginfo", "_unpack.tgz.siginfo", "_patch.tgz.siginfo")):
+                    continue
+                file_tracker.append(r)
+        else:
+            file_tracker = results
+
         if should_pass:
             self.assertTrue(file_tracker , msg="Could not find sstate files for: %s" % ', '.join(map(str, targets)))
         else:
@@ -87,7 +96,13 @@ class SStateTests(SStateBase):
         bitbake(['-ccleansstate'] + targets)
 
         bitbake(targets)
-        self.assertTrue(self.search_sstate('|'.join(map(str, [s + '.*?\.tgz$' for s in targets])), distro_specific=False, distro_nonspecific=True) == [], msg="Found distro non-specific sstate for: %s" % ', '.join(map(str, targets)))
+        results = self.search_sstate('|'.join(map(str, [s + '.*?\.tgz$' for s in targets])), distro_specific=False, distro_nonspecific=True)
+        filtered_results = []
+        for r in results:
+            if r.endswith(("_populate_lic.tgz", "_populate_lic.tgz.siginfo")):
+                continue
+            filtered_results.append(r)
+        self.assertTrue(filtered_results == [], msg="Found distro non-specific sstate for: %s (%s)" % (', '.join(map(str, targets)), str(filtered_results)))
         file_tracker_1 = self.search_sstate('|'.join(map(str, [s + '.*?\.tgz$' for s in targets])), distro_specific=True, distro_nonspecific=False)
         self.assertTrue(len(file_tracker_1) >= len(targets), msg = "Not all sstate files ware created for: %s" % ', '.join(map(str, targets)))
 



