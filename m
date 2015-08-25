Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6448F65CCD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 16:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7PGuRdQ015043 for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 17:56:27 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 1wXN3JYKKr2W
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 17:56:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7PGuCXV015036
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 17:56:23 +0100
Message-ID: <1440521772.12105.434.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Aug 2015 17:56:12 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] oeqa: Optimise sstate tests
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
X-List-Received-Date: Tue, 25 Aug 2015 16:56:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We can use "none" here instead of printdiff for some small performance
gains. This also means we can remove the ignore exit code hack which
leads to safer code.

Also drop an unused variable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/sstatetests.py
index 6eacb57..0a76167 100644
--- a/meta/lib/oeqa/selftest/sstatetests.py
+++ b/meta/lib/oeqa/selftest/sstatetests.py
@@ -220,14 +220,14 @@ BUILD_ARCH = \"x86_64\"
 BUILD_OS = \"linux\"
 """)
         self.track_for_cleanup(topdir + "/tmp-sstatesamehash")
-        bitbake("core-image-sato -S printdiff", ignore_status=True)
+        bitbake("core-image-sato -S none")
         self.write_config("""
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
 BUILD_ARCH = \"i686\"
 BUILD_OS = \"linux\"
 """)
         self.track_for_cleanup(topdir + "/tmp-sstatesamehash2")
-        bitbake("core-image-sato -S printdiff", ignore_status=True)
+        bitbake("core-image-sato -S none")
 
         def get_files(d):
             f = []
@@ -249,19 +249,18 @@ BUILD_OS = \"linux\"
         """
 
         topdir = get_bb_var('TOPDIR')
-        targetvendor = get_bb_var('TARGET_VENDOR')
         self.write_config("""
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
 NATIVELSBSTRING = \"DistroA\"
 """)
         self.track_for_cleanup(topdir + "/tmp-sstatesamehash")
-        bitbake("core-image-sato -S printdiff", ignore_status=True)
+        bitbake("core-image-sato -S none")
         self.write_config("""
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
 NATIVELSBSTRING = \"DistroB\"
 """)
         self.track_for_cleanup(topdir + "/tmp-sstatesamehash2")
-        bitbake("core-image-sato -S printdiff", ignore_status=True)
+        bitbake("core-image-sato -S none")
 
         def get_files(d):
             f = []



