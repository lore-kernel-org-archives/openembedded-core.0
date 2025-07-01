Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E002FC8303D
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 13:38:33 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.11126.1751377112323370167
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 06:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bKv1DPoT;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b3226307787so2466052a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 06:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751377111; x=1751981911; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vx5SrB+YC6BWP/OG1dATpsjWF69gjMjgAuXB+DKCdMI=;
        b=bKv1DPoT7TxgVTwr/RzBH0iy4rgnyBBlqKwkxzDnK+2zA8O0Xw8EFvKyoJecvhffSl
         V+eTtzM15MUTgQf4GdZGM/ud23KQIGuQyX5yDsmA4duCM2hOaYExUgvTC3XF0zfhqtii
         NXBqBZ7LZS9vYh3+qIMwpIVAJCVVaL2frxYE9nkegj6XexerX1xtIF5rmD/fpWFXr1S2
         et4Nj7mLevnuYso2edTZPUABXfs4lgzeM9pgN8xF9MiSWjzOKmfkkcD8C+mKWAg4hqc2
         uMMDwaVVSHo0xGEL9s2FYBeisgN/0v/haRd7/GN0QekwnGnnpK0SHbEr7PsnAFANPmI/
         RMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751377111; x=1751981911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vx5SrB+YC6BWP/OG1dATpsjWF69gjMjgAuXB+DKCdMI=;
        b=k1/VqQqfzF8JRGg8YOUvPwq6YzT4xWJLMgOsPZNAh8GQHJ8uQIjURTOXStKthmhOg6
         ZN+hXORaQLbvQwK6WA1KZJkYhcAoQmtqBakbFxk9tV9LF4ICJVx/SNmpzAgWMFhvhN7l
         3Z0jR4CsYQShBs68omCDBSahR8JuRb/5oQUUaZFuWE98oFapTiVA53iTqb5g2gPgPMwt
         g9uoqwr++loK5uXBpR1E3A17s0eMI4Gu1C8M41PeJ0wqFU3rmSh2+bTv8+TLBvLiL/ls
         HxVfyxrOnn1FxgQpbazJ3qd2QGGi+P+sKQmLyxmXpCH1OR98v5cnN6eID13n65CDXNjf
         AdJQ==
X-Gm-Message-State: AOJu0YwwtRk+S2PLOagHJzBfs+2hdh+wP7AU53q70UwySpQAaHeP1F8M
	vME9lfKaG6L9GhMsc4y+yfGBjgTNv5J9ajbOZ3cKiT0gFeO2W0jF4T+kvDzZ9/M4sw/Xi0unA9u
	Lf0Ib
X-Gm-Gg: ASbGncu7vQIxgV85lSgYrO94JQU8N61vA7NJcc/feLR/eENjrsW216H0U7sRiJGzXKm
	+e8eNfA+evgaytW8oyM4B9oZxakLqBUgCWmMHqqu0Suormklo0QRyxP9nXup0V7u3ncWGSo7rW6
	WmQXwljUSztTmX5Bqg4ypf0BhEZZXtdKO7EkUxT7ftTFWMqWaGDaJCCPI7mk3bBp7wRJKe2N9Tp
	Gh7WCsOHQDLjYQ9jdrMiIMMInNRGShTRntTMy2G6ex0qKoK0738ZAfwWNsP75hOb3bZ+sP++8+/
	mUF5o0DBlw9P/+5b8QFkfESH/yuRJq9Z1VOfNJDYgE0RP4aoaLqlNg==
X-Google-Smtp-Source: AGHT+IFjxx3e3hvKL9/Wlj+wy3fBHXkm3hNUstmDri9BA6ld06LRvpxJbCVFkekn+sbkg3V4EBwW7w==
X-Received: by 2002:a17:90b:3e87:b0:311:c1ec:7cfb with SMTP id 98e67ed59e1d1-318c92b793emr22557654a91.21.1751377111428;
        Tue, 01 Jul 2025 06:38:31 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34f8:320a:2e39:118e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c152331fsm11466117a91.44.2025.07.01.06.38.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 06:38:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 10/11] oeqa/sstatetests: Improve/fix sstate creation tests
Date: Tue,  1 Jul 2025 06:38:08 -0700
Message-ID: <4951d08046f66e905e6ab4bdd7af347c7ed14c64.1751376952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751376952.git.steve@sakoman.com>
References: <cover.1751376952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 13:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219581

From: Richard Purdie <richard.purdie@linuxfoundation.org>

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
(cherry picked from commit 5b9263040013199c5cb480125d5ca349f5d6dc55)
Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 78 ++++++++-------------
 1 file changed, 30 insertions(+), 48 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 7231115a6b..08f94b168a 100644
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
+                    badperms.append("%s: %s vs %s" % (os.path.join(root, directory), mode, 0o775))
 
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
-- 
2.43.0


