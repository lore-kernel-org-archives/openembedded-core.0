Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D590876104
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 20:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8GKrEVa011082 for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 21:53:14 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jK6PNpDfA61R
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 21:53:14 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8GKr1Y5011079
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 21:53:13 +0100
Message-ID: <1442436781.26666.167.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Sep 2015 21:53:01 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] oeqa/sstatetests: Add test for nativesdk stamp invariance with MACHINE
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
X-List-Received-Date: Wed, 16 Sep 2015 20:53:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

nativesdk-glbic should not rebuild when you change MACHINE but
it was. We've fixed that, now add tests to ensure this doesn't
happen again.

Rather than add yet another stamps test, extend one of the 
existing ones to cover this instead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/sstatetests.py
index 6906b21..c4efc47 100644
--- a/meta/lib/oeqa/selftest/sstatetests.py
+++ b/meta/lib/oeqa/selftest/sstatetests.py
@@ -3,6 +3,7 @@ import unittest
 import os
 import re
 import shutil
+import glob
 
 import oeqa.utils.ftools as ftools
 from oeqa.selftest.base import oeSelfTest
@@ -276,6 +277,8 @@ NATIVELSBSTRING = \"DistroB\"
         """
         The sstate checksums off allarch packages should be independent of whichever 
         MACHINE is set. Check this using bitbake -S.
+        Also, rather than duplicate the test, check nativesdk stamps are the same between
+        the two MACHINE values.
         """
 
         topdir = get_bb_var('TOPDIR')
@@ -286,18 +289,20 @@ TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
 MACHINE = \"qemux86\"
 """)
         self.track_for_cleanup(topdir + "/tmp-sstatesamehash")
-        bitbake("world -S none")
+        bitbake("world meta-toolchain -S none")
         self.write_config("""
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
 MACHINE = \"qemuarm\"
 """)
         self.track_for_cleanup(topdir + "/tmp-sstatesamehash2")
-        bitbake("world -S none")
+        bitbake("world meta-toolchain -S none")
 
         def get_files(d):
             f = []
             for root, dirs, files in os.walk(d):
                 for name in files:
+                    if "meta-environment" in root or "cross-canadian" in root:
+                        continue
                     if "do_build" not in name:
                         f.append(os.path.join(root, name))
             return f
@@ -306,3 +311,12 @@ MACHINE = \"qemuarm\"
         files2 = [x.replace("tmp-sstatesamehash2", "tmp-sstatesamehash") for x in files2]
         self.maxDiff = None
         self.assertItemsEqual(files1, files2)
+
+        nativesdkdir = os.path.basename(glob.glob(topdir + "/tmp-sstatesamehash/stamps/*-nativesdk*-linux")[0])
+
+        files1 = get_files(topdir + "/tmp-sstatesamehash/stamps/" + nativesdkdir)
+        files2 = get_files(topdir + "/tmp-sstatesamehash2/stamps/" + nativesdkdir)
+        files2 = [x.replace("tmp-sstatesamehash2", "tmp-sstatesamehash") for x in files2]
+        self.maxDiff = None
+        self.assertItemsEqual(files1, files2)
+        



