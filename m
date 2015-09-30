Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3C3B777072
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 13:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8UDkels006789 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:46:40 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id h0qmxnnybuFC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:46:40 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8UDkSAk006752
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:46:39 +0100
Message-ID: <1443620788.5162.82.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Sep 2015 14:46:28 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] oeqa/selftest/sstatetests: Add check for same sigs for SDKMACHINE
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
X-List-Received-Date: Wed, 30 Sep 2015 13:46:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Extend one of the sstate tests to also ensure that changing SDKMACHINE doesn't 
change the target task checksums.

Also fix a typo and improve debugging by turning the diff filtering off
in all cases (if the test fails, we want to full list).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/sstatetests.py
index c4efc47..1940e66 100644
--- a/meta/lib/oeqa/selftest/sstatetests.py
+++ b/meta/lib/oeqa/selftest/sstatetests.py
@@ -211,6 +211,8 @@ class SStateTests(SStateBase):
         they're built on a 32 or 64 bit system. Rather than requiring two different 
         build machines and running a builds, override the variables calling uname()
         manually and check using bitbake -S.
+        
+        Also check that SDKMACHINE changing doesn't change any of these stamps.
         """
 
         topdir = get_bb_var('TOPDIR')
@@ -219,6 +221,7 @@ class SStateTests(SStateBase):
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
 BUILD_ARCH = \"x86_64\"
 BUILD_OS = \"linux\"
+SDKMACHINE = \"x86_64\"
 """)
         self.track_for_cleanup(topdir + "/tmp-sstatesamehash")
         bitbake("core-image-sato -S none")
@@ -226,6 +229,7 @@ BUILD_OS = \"linux\"
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
 BUILD_ARCH = \"i686\"
 BUILD_OS = \"linux\"
+SDKMACHINE = \"i686\"
 """)
         self.track_for_cleanup(topdir + "/tmp-sstatesamehash2")
         bitbake("core-image-sato -S none")
@@ -233,11 +237,16 @@ BUILD_OS = \"linux\"
         def get_files(d):
             f = []
             for root, dirs, files in os.walk(d):
+                if "core-image-sato" in root:
+                        # SDKMACHINE changing will change do_rootfs/do_testimage/do_build stamps of core-image-sato itself
+                        # which is safe to ignore
+                        continue
                 f.extend(os.path.join(root, name) for name in files)
             return f
         files1 = get_files(topdir + "/tmp-sstatesamehash/stamps/")
         files2 = get_files(topdir + "/tmp-sstatesamehash2/stamps/")
         files2 = [x.replace("tmp-sstatesamehash2", "tmp-sstatesamehash").replace("i686-linux", "x86_64-linux").replace("i686" + targetvendor + "-linux", "x86_64" + targetvendor + "-linux", ) for x in files2]
+        self.maxDiff = None
         self.assertItemsEqual(files1, files2)
 
 
@@ -271,11 +280,12 @@ NATIVELSBSTRING = \"DistroB\"
         files1 = get_files(topdir + "/tmp-sstatesamehash/stamps/")
         files2 = get_files(topdir + "/tmp-sstatesamehash2/stamps/")
         files2 = [x.replace("tmp-sstatesamehash2", "tmp-sstatesamehash") for x in files2]
+        self.maxDiff = None
         self.assertItemsEqual(files1, files2)
 
     def test_sstate_allarch_samesigs(self):
         """
-        The sstate checksums off allarch packages should be independent of whichever 
+        The sstate checksums of allarch packages should be independent of whichever 
         MACHINE is set. Check this using bitbake -S.
         Also, rather than duplicate the test, check nativesdk stamps are the same between
         the two MACHINE values.



