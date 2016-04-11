Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id DF047601D3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 17:33:20 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id n3so114400398wmn.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 10:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=JiQqtqTleJ2UhcHl8Th7blJoFlDbyx09PaTg3RCF2/0=;
	b=zEzGSeRKjlreIwd+vhDTT04YIS18oRy6ZrGk1pXwISee9oy3BwkkBc0RVi45HS46y0
	cyeikbkrl2Oy7hf1yMXOpSLN+JZuu9aSTYAypo+VgUscqtGO9q98BTuG3Hne/NdcXAOI
	UnrMwev99Coq8fqyImskXFStx9tuhuBNAEBbMLk5asaD5cNautv7lSGo7/gCBRZEdDKZ
	xpDuISlUkjaC6xqU4YUI9U+6rcetmnPZ//GdFlp5aL81qLP+XuV44fkmF3xLN+9Lv0dp
	aQxZpCi0ipVOsSBoonx+JdSFLssUSp1x9adNSUU35EP0egKZSDY467/AZRhPqwuP9u2R
	sstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=JiQqtqTleJ2UhcHl8Th7blJoFlDbyx09PaTg3RCF2/0=;
	b=mxWk+N1qrHfY3kgTemiPB//OJk0e6hZ1MIHa/nTvR9cHSOboi9ajCBtjI+B30qBqhD
	TmSPelOg6SwzeJH10qBKgTiUDVLQkK+1d6cNEZMVsPCDfr9xhKgUkoAKy2O7rdwbuKEp
	+X81B4gx4ET2rxFzjNXLWW9Aai4AqHbyBalaR89L4ousWqiIZtdkHYvWn1rNXG4m5AtN
	fc9Lmpn23PokmZpqgy+aASxMyhdtTAnZHjdFRTkzTfriLJAsC1TEjZwkZspXGdMKRqjD
	FzitYPt8FWKaWb98BiXkZXSxAiijoLkOHMor1Q1XglhAdAK2MyKROFvNlI5Bgta9c9+U
	SZxQ==
X-Gm-Message-State: AD7BkJIt6lNQMJ7Eh0oCkcGrZd88a3cQd2Y1baeOI85LLxu5Ayfy0EXYirwdkw2Wz6dS/9Xv
X-Received: by 10.28.32.5 with SMTP id g5mr18871653wmg.79.1460396000460;
	Mon, 11 Apr 2016 10:33:20 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	cb2sm29006528wjc.16.2016.04.11.10.33.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Apr 2016 10:33:19 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Apr 2016 18:33:16 +0100
Message-Id: <1460395996-31906-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] oeqa/selftest/sstatetests: split 32/64 build host from no-op action tests
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
X-List-Received-Date: Mon, 11 Apr 2016 17:33:23 -0000

As more variables were being added it made sense to split this test into two:
one quick test that verifies that the host being 32-bit or 64-bit doesn't impact
the hashes, and another which compares stamps for two builds with several
variables changed and classes inherited.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/sstatetests.py | 80 +++++++++++++++++++++++++++++------
 1 file changed, 68 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/sstatetests.py
index c02d16d..d41b1d3 100644
--- a/meta/lib/oeqa/selftest/sstatetests.py
+++ b/meta/lib/oeqa/selftest/sstatetests.py
@@ -4,6 +4,7 @@ import os
 import re
 import shutil
 import glob
+import subprocess
 
 import oeqa.utils.ftools as ftools
 from oeqa.selftest.base import oeSelfTest
@@ -226,9 +227,6 @@ class SStateTests(SStateBase):
         they're built on a 32 or 64 bit system. Rather than requiring two different
         build machines and running a builds, override the variables calling uname()
         manually and check using bitbake -S.
-
-        Also check that SDKMACHINE and PARALLEL_MAKE changing doesn't change any
-        of these stamps.
         """
 
         topdir = get_bb_var('TOPDIR')
@@ -239,9 +237,6 @@ TMPDIR = "${TOPDIR}/tmp-sstatesamehash"
 BUILD_ARCH = "x86_64"
 BUILD_OS = "linux"
 SDKMACHINE = "x86_64"
-PARALLEL_MAKE = "-j 1"
-DL_DIR = "${TOPDIR}/download1"
-TIME = "111111"
 """)
         self.track_for_cleanup(topdir + "/tmp-sstatesamehash")
         bitbake("core-image-sato -S none")
@@ -251,9 +246,6 @@ TMPDIR = "${TOPDIR}/tmp-sstatesamehash2"
 BUILD_ARCH = "i686"
 BUILD_OS = "linux"
 SDKMACHINE = "i686"
-PARALLEL_MAKE = "-j 2"
-DL_DIR = "${TOPDIR}/download2"
-TIME = "222222"
 """)
         self.track_for_cleanup(topdir + "/tmp-sstatesamehash2")
         bitbake("core-image-sato -S none")
@@ -279,7 +271,7 @@ TIME = "222222"
     def test_sstate_nativelsbstring_same_hash(self):
         """
         The sstate checksums should be independent of whichever NATIVELSBSTRING is
-        detected. Rather than requiring two different build machines and running 
+        detected. Rather than requiring two different build machines and running
         builds, override the variables manually and check using bitbake -S.
         """
 
@@ -311,7 +303,7 @@ NATIVELSBSTRING = \"DistroB\"
     @testcase(1368)
     def test_sstate_allarch_samesigs(self):
         """
-        The sstate checksums of allarch packages should be independent of whichever 
+        The sstate checksums of allarch packages should be independent of whichever
         MACHINE is set. Check this using bitbake -S.
         Also, rather than duplicate the test, check nativesdk stamps are the same between
         the two MACHINE values.
@@ -359,7 +351,7 @@ MACHINE = \"qemuarm\"
     @testcase(1369)
     def test_sstate_sametune_samesigs(self):
         """
-        The sstate checksums of two identical machines (using the same tune) should be the 
+        The sstate checksums of two identical machines (using the same tune) should be the
         same, apart from changes within the machine specific stamps directory. We use the
         qemux86copy machine to test this. Also include multilibs in the test.
         """
@@ -402,3 +394,67 @@ DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
         files2 = [x.replace("tmp-sstatesamehash2", "tmp-sstatesamehash") for x in files2]
         self.maxDiff = None
         self.assertItemsEqual(files1, files2)
+
+
+    def test_sstate_noop_samesigs(self):
+        """
+        The sstate checksums of two builds with these variables changed or
+        classes inherits should be the same.
+        """
+
+        topdir = get_bb_var('TOPDIR')
+        targetvendor = get_bb_var('TARGET_VENDOR')
+        self.write_config("""
+TMPDIR = "${TOPDIR}/tmp-sstatesamehash"
+BB_NUMBER_THREADS = "1"
+PARALLEL_MAKE = "-j 1"
+DL_DIR = "${TOPDIR}/download1"
+TIME = "111111"
+DATE = "20161111"
+""")
+        self.track_for_cleanup(topdir + "/tmp-sstatesamehash")
+        bitbake("world meta-toolchain -S none")
+        self.write_config("""
+TMPDIR = "${TOPDIR}/tmp-sstatesamehash2"
+BB_NUMBER_THREADS = "2"
+PARALLEL_MAKE = "-j 2"
+DL_DIR = "${TOPDIR}/download2"
+TIME = "222222"
+DATE = "20161212"
+INHERIT += "buildstats-summary buildhistory"
+""")
+        self.track_for_cleanup(topdir + "/tmp-sstatesamehash2")
+        bitbake("world meta-toolchain -S none")
+
+        def get_files(d):
+            f = {}
+            for root, dirs, files in os.walk(d):
+                for name in files:
+                    name, shash = name.rsplit('.', 1)
+                    # Extract just the machine and recipe name
+                    base = os.sep.join(root.rsplit(os.sep, 2)[-2:] + [name])
+                    f[base] = shash
+            return f
+        files1 = get_files(topdir + "/tmp-sstatesamehash/stamps/")
+        files2 = get_files(topdir + "/tmp-sstatesamehash2/stamps/")
+        # Remove items that are identical in both sets
+        for k,v in files1.viewitems() & files2.viewitems():
+            del files1[k]
+            del files2[k]
+        if not files1 and not files2:
+            # No changes, so we're done
+            return
+
+        for k in files1.viewkeys() | files2.viewkeys():
+            if k in files1 and k in files2:
+                print "%s differs:" % k
+                print subprocess.check_output(("bitbake-diffsigs",
+                                               topdir + "/tmp-sstatesamehash/stamps/" + k + "." + files1[k],
+                                               topdir + "/tmp-sstatesamehash2/stamps/" + k + "." + files2[k]))
+            elif k in files1 and k not in files2:
+                print "%s in files1" % k
+            elif k not in files1 and k in files2:
+                print "%s in files2" % k
+            else:
+                assert "shouldn't reach here"
+        self.fail("sstate hashes not identical.")
-- 
2.8.0.rc3


