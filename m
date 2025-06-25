Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 578BBC7115C
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 13:52:40 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.15856.1750859552983175075
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jun 2025 06:52:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VMgeboXI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a54690d369so5804120f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 06:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750859551; x=1751464351; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cJqezQHi4cyTkHGxxox1mH/485pIFKKc0PeGK+ogIMM=;
        b=VMgeboXIAPdNrL7bz6xDmVMkunsBcCnwUV598bO35C2Nfq3g1SSfM0M1Y2vInC+HnG
         BBTCKF1uwDz//Rxu74/kYZ9VSKnoRpDD5VLF6WmteoRnoWyF0mlZk9ZqLKHXisDc+jqJ
         Xf5zKPIYrsphlmTr/1VuGweupNM1Kfdi00MEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750859551; x=1751464351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJqezQHi4cyTkHGxxox1mH/485pIFKKc0PeGK+ogIMM=;
        b=d1L9gExlYuRNB2wcYuGA4nDPsvvPsqm4KqWVjt1bK9SNDmCHEljn5gHP0JovevU8Nv
         grDXBvEnMLd2pmAw9mGY6IfVcoRdno8+qBJHa2esRg5bK9a5V7jd8h5Mj0FtzBWFed2X
         tG1GLEhntrcQDVO8YormHU2mB8nb2Sx0w5A7n7jjbazNs62VuWZYFHT3+DVj+febWhy6
         hA6mWiiwwVlouErdIhlyCOKLNokvErRj2ckFtiW4tcWKSKcteiIzXUIuu8p1rvsOQz06
         awvmR0LNj41tiV9jNB+wUFaUSm5rJRUdjLpC5MMKaGVHGjvVIM9ximc4r3tN+/BxgwgM
         5Xtg==
X-Gm-Message-State: AOJu0Yz3C0vXNC84MoB9nb5f+2Dzor5cVhumKaUpfs+9HauLtiJQLDfO
	XHcuuVCt69aX5zQ3uVAhJL7npH0Yl/GMB2DkyV0+9UVyZQx7nKYuDtnWm8a1wSkGicu3dzOJOSk
	eNMnw
X-Gm-Gg: ASbGncs8gZeuSCVDgYmsuUNOYyzMmurjnj9h8zk0b+PaTwykEQoWtMtfELb11lM9670
	akvPgmeJ8sTiblLtuqzkjrHRQmTXq4JYDhx8x+hCYaGZoZ40Ct4+PVdoTnP9PUyaKsNs7wVnZvj
	9SCqh1eOyZOYNcQp8b+xd2wDbX2titjbH9TWIi5tdps6PPNfN9MJ8MVmarZ3PvFOkNcPyngRLak
	dKsiwvzad9aqJD6SI5IR/k0WCDUOOvBkBtGKYyce1mEDC5QySI5vsswn8TFI4Krvr3BUgvLixeF
	CLcOGRZVAv0MgNOAtB9Tao/qeldUSEXpxMfwynadS+k42VlYMGEzPTomhTdDQdAKRPS2oOZfTxj
	W3QDJkAHH2mtl3co=
X-Google-Smtp-Source: AGHT+IGDCW1Y9/eUb8S4U4OvoU9etgJSKaMs7Gv6VcGUGv1HtKt6Z3onz9JKypAme+vZgABPIoURIA==
X-Received: by 2002:a5d:5e81:0:b0:3a4:ed2f:e80c with SMTP id ffacd0b85a97d-3a6ed644c28mr2523360f8f.31.1750859550726;
        Wed, 25 Jun 2025 06:52:30 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f1c1:2228:ff4c:9514])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e810b140sm4657419f8f.80.2025.06.25.06.52.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 06:52:29 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] oeqa/sstatetests: Improve/fix sstate creation tests
Date: Wed, 25 Jun 2025 14:52:27 +0100
Message-ID: <20250625135227.3106042-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250625135227.3106042-1-richard.purdie@linuxfoundation.org>
References: <20250625135227.3106042-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 13:52:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219321

There are multiple problems with the sstate creation tests. They currently both execute
twice, once to check one set of files, then another. We can do this together in one
test which makes the code easier to follow.

The common test function also has parameters which were always the same value, so
those can be simplified.

We can use the umask context manager from bb.utils to simplfy the umask code.

The badperms test was actually broken, it was detecting bad permissions, then
ignoring them. This patch fixes that regression too and allows the check to
operate (relying on a separate fix to sstate umask handling).

The result should be an easier to understand couple of test cases which should
also function correctly and be more reliable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 78 ++++++++-------------
 1 file changed, 30 insertions(+), 48 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 7231115a6b9..b22e498320b 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -83,55 +83,43 @@ class SStateBase(OESelftestTestCase):
         return result
 
     # Test sstate files creation and their location and directory perms
-    def run_test_sstate_creation(self, targets, distro_specific=True, distro_nonspecific=True, temp_sstate_location=True, should_pass=True):
-        self.config_sstate(temp_sstate_location, [self.sstate_path])
+    def run_test_sstate_creation(self, targets, hostdistro_specific):
+        self.config_sstate(True, [self.sstate_path])
+
+        bitbake(['-cclean'] + targets)
 
-        if  self.temp_sstate_location:
-            bitbake(['-cclean'] + targets)
-        else:
-            bitbake(['-ccleansstate'] + targets)
-
-        # We need to test that the env umask have does not effect sstate directory creation
-        # So, first, we'll get the current umask and set it to something we know incorrect
-        # See: sstate_task_postfunc for correct umask of os.umask(0o002)
-        import os
-        def current_umask():
-            current_umask = os.umask(0)
-            os.umask(current_umask)
-            return current_umask
-
-        orig_umask = current_umask()
         # Set it to a umask we know will be 'wrong'
-        os.umask(0o022)
+        with bb.utils.umask(0o022):
+            bitbake(targets)
 
-        bitbake(targets)
-        file_tracker = []
-        results = self.search_sstate('|'.join(map(str, targets)), distro_specific, distro_nonspecific)
-        if distro_nonspecific:
-            for r in results:
-                if r.endswith(("_populate_lic.tar.zst", "_populate_lic.tar.zst.siginfo", "_fetch.tar.zst.siginfo", "_unpack.tar.zst.siginfo", "_patch.tar.zst.siginfo")):
-                    continue
-                file_tracker.append(r)
-        else:
-            file_tracker = results
+        # Distro specific files
+        distro_specific_files = self.search_sstate('|'.join(map(str, targets)), True, False)
 
-        if should_pass:
-            self.assertTrue(file_tracker , msg="Could not find sstate files for: %s" % ', '.join(map(str, targets)))
+        # Distro non-specific
+        distro_non_specific_files = []
+        results = self.search_sstate('|'.join(map(str, targets)), False, True)
+        for r in results:
+            if r.endswith(("_populate_lic.tar.zst", "_populate_lic.tar.zst.siginfo", "_fetch.tar.zst.siginfo", "_unpack.tar.zst.siginfo", "_patch.tar.zst.siginfo")):
+                continue
+            distro_non_specific_files.append(r)
+
+        if hostdistro_specific:
+            self.assertTrue(distro_specific_files , msg="Could not find sstate files for: %s" % ', '.join(map(str, targets)))
+            self.assertFalse(distro_non_specific_files, msg="Found sstate files in the wrong place for: %s (found %s)" % (', '.join(map(str, targets)), str(distro_non_specific_files)))
         else:
-            self.assertTrue(not file_tracker , msg="Found sstate files in the wrong place for: %s (found %s)" % (', '.join(map(str, targets)), str(file_tracker)))
+            self.assertTrue(distro_non_specific_files , msg="Could not find sstate files for: %s" % ', '.join(map(str, targets)))
+            self.assertFalse(distro_specific_files, msg="Found sstate files in the wrong place for: %s (found %s)" % (', '.join(map(str, targets)), str(distro_specific_files)))
 
         # Now we'll walk the tree to check the mode and see if things are incorrect.
         badperms = []
         for root, dirs, files in os.walk(self.sstate_path):
             for directory in dirs:
-                if (os.stat(os.path.join(root, directory)).st_mode & 0o777) != 0o775:
-                    badperms.append(os.path.join(root, directory))
+                mode = os.stat(os.path.join(root, directory)).st_mode & 0o777
+                if mode != 0o775:
+                    badperms.append("%s: %s vs %s" % (os.path.join(root, directory), mode, o0775))
 
-        # Return to original umask
-        os.umask(orig_umask)
-
-        if should_pass:
-            self.assertTrue(badperms , msg="Found sstate directories with the wrong permissions: %s (found %s)" % (', '.join(map(str, targets)), str(badperms)))
+        # Check badperms is empty
+        self.assertFalse(badperms , msg="Found sstate directories with the wrong permissions: %s (found %s)" % (', '.join(map(str, targets)), str(badperms)))
 
     # Test the sstate files deletion part of the do_cleansstate task
     def run_test_cleansstate_task(self, targets, distro_specific=True, distro_nonspecific=True, temp_sstate_location=True):
@@ -256,17 +244,11 @@ class SStateTests(SStateBase):
         bitbake("dbus-wait-test -c unpack")
 
 class SStateCreation(SStateBase):
-    def test_sstate_creation_distro_specific_pass(self):
-        self.run_test_sstate_creation(['binutils-cross-'+ self.tune_arch, 'binutils-native'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True)
-
-    def test_sstate_creation_distro_specific_fail(self):
-        self.run_test_sstate_creation(['binutils-cross-'+ self.tune_arch, 'binutils-native'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True, should_pass=False)
-
-    def test_sstate_creation_distro_nonspecific_pass(self):
-        self.run_test_sstate_creation(['linux-libc-headers'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True)
+    def test_sstate_creation_distro_specific(self):
+        self.run_test_sstate_creation(['binutils-cross-'+ self.tune_arch, 'binutils-native'], hostdistro_specific=True)
 
-    def test_sstate_creation_distro_nonspecific_fail(self):
-        self.run_test_sstate_creation(['linux-libc-headers'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True, should_pass=False)
+    def test_sstate_creation_distro_nonspecific(self):
+        self.run_test_sstate_creation(['linux-libc-headers'], hostdistro_specific=False)
 
 class SStateCleanup(SStateBase):
     def test_cleansstate_task_distro_specific_nonspecific(self):

