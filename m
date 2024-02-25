Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5551CC54E49
	for <webhook@archiver.kernel.org>; Sun, 25 Feb 2024 20:48:03 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.6010.1708894075431101356
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 12:47:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WQUNo32X;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-412a5a54adaso652275e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 12:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708894073; x=1709498873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nee2FO1FvOYlCNm8NNiPOoTv0ihY+IO1AgVNzpstOq4=;
        b=WQUNo32XHob6Nx7gHCL2syxx712YC3doQaBOjYFnikgvrQ+cw1lwAr5kJ02LSCYM3+
         SS+Jh5sM5NedJtl9q4hZJHlobQW4UJ18R/CiybTiB0/Lt8cS/XgmpNnV/PQhY7fNSDcb
         ipTJrx8/4b2qVZJrKMcKC3ev5unYOGq6nvUremjOn6KhbO36ddkODZW9UWp6Ood4a2UQ
         y/Yda/wI6tyD/cJCdquuk5iOL46n4OtSgFjh5oy/wH6Z2hSrpTJFRc473L7AxB16yLz9
         5isK8O9qMSpNFbB6dM2c+X7eFKjieAXQallSCYro1KWL8DSRWGKNB+lZ+NrmBmIbLwgo
         wx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708894073; x=1709498873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nee2FO1FvOYlCNm8NNiPOoTv0ihY+IO1AgVNzpstOq4=;
        b=oooONAmtTYaET1eDAPVk4gNgYoq7JylTXabgpFIezn4uDsvbmxIV3nIGdha6PTLqpY
         G6yP+NnJTONEf5nLxf2M9sqlBBaU2sqeKyiWjVXLOQ6cBGfAkE8xRSuIuebOaX9AlGi0
         wdkmQi9/JD5d5uuR39masga0152Tylqoh/V+MX238+J7eYxDVecpZmDQdo0Iiw9V7lQJ
         1cnSoPFEmhLOlM2j/VHo4FjDDBa/fXaZWAsUxOAVwe663+bG45vY1M0PCI4ubpHIcySy
         Yf3jmaBGiobjoPCCH06fomdt72ymuNC/s2ygTHrbqx3ERoa9hXja82qpWtq4bHYKhesd
         pM/Q==
X-Gm-Message-State: AOJu0Yz05WIO+Y4IN4WdzzO74QHbqBmcmlXedG6vKZolrhoPoD+Sb3/L
	NuTILYmM+nRL5XXoqw3F74kmLWpICq/jnCDL0N+sl6dhA7qEKJQbNR/btH0e
X-Google-Smtp-Source: AGHT+IHl7W7+qL1ZOJyFCZKrumLyp2jkgTDJKuM3UDRIl67tNKR7E7SfPmjdio/eHisWR0SjKGZt8Q==
X-Received: by 2002:a5d:4e85:0:b0:33d:87f0:1475 with SMTP id e5-20020a5d4e85000000b0033d87f01475mr3447449wru.62.1708894073604;
        Sun, 25 Feb 2024 12:47:53 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id dq2-20020a0560000cc200b0033b483d1abcsm6005989wrb.53.2024.02.25.12.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 12:47:53 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 4/4] oe-selftest devtool: ide-sdk tests
Date: Sun, 25 Feb 2024 21:47:03 +0100
Message-ID: <20240225204741.650070-5-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240225204741.650070-1-adrian.freihofer@siemens.com>
References: <20240225204741.650070-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 20:48:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196150

Improve the GDB related tests. Verify GDB finds the correct source
files.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 42 +++++++++++++++++++------
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index d37848bdefc..ecff3a9ebdf 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2544,6 +2544,10 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.assertEqual(status, 0, msg="%s failed: %s" % (ptest_cmd, output))
         self.assertIn("PASS: cpp-example-lib", output)
 
+        # Verify remote debugging works
+        self._gdb_cross_debugging(
+            qemu, recipe_name, example_exe, MAGIC_STRING_ORIG)
+
         # Replace the Magic String in the code, compile and deploy to Qemu
         cpp_example_lib_hpp = os.path.join(tempdir, 'cpp-example-lib.hpp')
         with open(cpp_example_lib_hpp, 'r') as file:
@@ -2565,6 +2569,10 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.assertEqual(status, 0, msg="%s failed: %s" % (ptest_cmd, output))
         self.assertIn("PASS: cpp-example-lib", output)
 
+        # Verify remote debugging works wit the modified magic string
+        self._gdb_cross_debugging(
+            qemu, recipe_name, example_exe, MAGIC_STRING_NEW)
+
     def _gdb_cross(self):
         """Verify gdb-cross is provided by devtool ide-sdk"""
         target_arch = self.td["TARGET_ARCH"]
@@ -2578,13 +2586,22 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.assertEqual(r.status, 0)
         self.assertIn("GNU gdb", r.output)
 
-    def _gdb_cross_debugging(self, qemu, recipe_name, example_exe):
+    def _gdb_cross_debugging(self, qemu, recipe_name, example_exe, magic_string):
         """Verify gdb-cross is working
 
         Test remote debugging:
         break main
         run
         continue
+        break CppExample::print_json()
+        continue
+        print CppExample::test_string.compare("cpp-example-lib Magic: 123456789")
+        $1 = 0
+        print CppExample::test_string.compare("cpp-example-lib Magic: 123456789aaa")
+        $2 = -3
+        list cpp-example-lib.hpp:13,13
+        13	    inline static const std::string test_string = "cpp-example-lib Magic: 123456789";
+        continue
         """
         sshargs = '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
         gdbserver_script = os.path.join(self._workspace_scripts_dir(
@@ -2609,10 +2626,21 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.assertIn("gdbserver", r.output)
 
         # Test remote debugging works
-        r = runCmd(
-            gdb_script + " --batch -ex 'break main' --ex 'run' -ex 'continue'")
+        gdb_batch_cmd = " --batch -ex 'break main' -ex 'run'"
+        gdb_batch_cmd += " -ex 'break CppExample::print_json()' -ex 'continue'"
+        gdb_batch_cmd += " -ex 'print CppExample::test_string.compare(\"cpp-example-lib %s\")'" % magic_string
+        gdb_batch_cmd += " -ex 'print CppExample::test_string.compare(\"cpp-example-lib %saaa\")'" % magic_string
+        gdb_batch_cmd += " -ex 'list cpp-example-lib.hpp:13,13'"
+        gdb_batch_cmd += " -ex 'continue'"
+        r = runCmd(gdb_script + gdb_batch_cmd)
+        self.logger.debug("%s %s returned: %s", gdb_script,
+                          gdb_batch_cmd, r.output)
         self.assertEqual(r.status, 0)
         self.assertIn("Breakpoint 1, main", r.output)
+        self.assertIn("$1 = 0", r.output)  # test.string.compare equal
+        self.assertIn("$2 = -3", r.output)  # test.string.compare longer
+        self.assertIn(
+            'inline static const std::string test_string = "cpp-example-lib %s";' % magic_string, r.output)
         self.assertIn("exited normally", r.output)
 
         # Stop the gdbserver
@@ -2689,14 +2717,12 @@ class DevtoolIdeSdkTests(DevtoolBase):
             bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --ide=none' % (
                 recipe_name, testimage, qemu.ip)
             runCmd(bitbake_sdk_cmd)
+            self._gdb_cross()
             self._verify_cmake_preset(tempdir)
             self._devtool_ide_sdk_qemu(tempdir, qemu, recipe_name, example_exe)
             # Verify the oe-scripts sym-link is valid
             self.assertEqual(self._workspace_scripts_dir(
                 recipe_name), self._sources_scripts_dir(tempdir))
-            # Verify GDB is working after devtool ide-sdk
-            self._gdb_cross()
-            self._gdb_cross_debugging(qemu, recipe_name, example_exe)
 
             # meson-example recipe
             recipe_name = "meson-example"
@@ -2707,13 +2733,11 @@ class DevtoolIdeSdkTests(DevtoolBase):
             bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --ide=none' % (
                 recipe_name, testimage, qemu.ip)
             runCmd(bitbake_sdk_cmd)
+            self._gdb_cross()
             self._devtool_ide_sdk_qemu(tempdir, qemu, recipe_name, example_exe)
             # Verify the oe-scripts sym-link is valid
             self.assertEqual(self._workspace_scripts_dir(
                 recipe_name), self._sources_scripts_dir(tempdir))
-            # Verify GDB is working after devtool ide-sdk
-            self._gdb_cross()
-            self._gdb_cross_debugging(qemu, recipe_name, example_exe)
 
     def test_devtool_ide_sdk_code_cmake(self):
         """Verify a cmake recipe works with ide=code mode"""
-- 
2.43.1


