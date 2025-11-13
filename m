Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F1BCD6E48
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 12:28:47 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22640.1763036924164861703
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 04:28:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=GHmHr/GM;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20251113122842d41ae928a5000207e1-tiunvs@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20251113122842d41ae928a5000207e1
        for <openembedded-core@lists.openembedded.org>;
        Thu, 13 Nov 2025 13:28:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Z1y9XxPEn7BECRD5mWb9LJjaorYNkXpcVHy3UbYeQ6k=;
 b=GHmHr/GMkcAaeOE8jG8cNdwX/2Pf7Ac2yXl37C7TBeqFY/kE4EXz34418mtgMXjyS5OcIz
 KgeuHRBoy55Nrjaq7YxMQvoLjl0VuyHgAYQfwfAr6xZgkF6y7jYLBqinBq/4X9Kl/80pW6OM
 oOzDvV/8p6tMYI5uGqSoi/IAtJtqLm8xte0/53LCtaMJuMy6P7g+mAMUkvKlmhBT1qMidfBv
 XC3FOok90VXtNAlw2gKTc2mJulllq/bbgl7gXxx/m1/ZWgSLduv3r2eo1Gpn8hdot6NcJsvq
 En6+7Ly8xtGPvmZRVjbuhx1w827zpQ2Q2bgg/oqzUWi6AzS3b8NOMpzw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 5/9] go: add sdk test
Date: Thu, 13 Nov 2025 13:28:02 +0100
Message-Id: <20251113122806.16769-6-peter.marko@siemens.com>
In-Reply-To: <20251113122806.16769-1-peter.marko@siemens.com>
References: <20251113122806.16769-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 12:28:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226243

From: Osama Abdelkader <osama.abdelkader@gmail.com>

- Add meta/lib/oeqa/sdk/cases/go.py with GoCompileTest and GoHostCompileTest classes
- Test validates Go cross-compilation toolchain functionality
- Includes native compilation, cross-compilation, and Go module support
- Uses dynamic architecture detection for portability

(From OE-Core rev: 17015f692a6bf3697a89db51bbc4673a5efa1497)

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/lib/oeqa/sdk/cases/go.py | 128 ++++++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)
 create mode 100644 meta/lib/oeqa/sdk/cases/go.py

diff --git a/meta/lib/oeqa/sdk/cases/go.py b/meta/lib/oeqa/sdk/cases/go.py
new file mode 100644
index 00000000000..9c15124f6ad
--- /dev/null
+++ b/meta/lib/oeqa/sdk/cases/go.py
@@ -0,0 +1,128 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import os
+import shutil
+import unittest
+
+from oeqa.core.utils.path import remove_safe
+from oeqa.sdk.case import OESDKTestCase
+
+from oeqa.utils.subprocesstweak import errors_have_output
+errors_have_output()
+
+class GoCompileTest(OESDKTestCase):
+    td_vars = ['MACHINE', 'TARGET_ARCH']
+
+    @classmethod
+    def setUpClass(self):
+        # Copy test.go file to SDK directory (same as GCC test uses files_dir)
+        shutil.copyfile(os.path.join(self.tc.files_dir, 'test.go'),
+                        os.path.join(self.tc.sdk_dir, 'test.go'))
+
+    def setUp(self):
+        target_arch = self.td.get("TARGET_ARCH")
+        # Check for go-cross-canadian package (uses target architecture)
+        if not self.tc.hasHostPackage("go-cross-canadian-%s" % target_arch):
+            raise unittest.SkipTest("GoCompileTest class: SDK doesn't contain a Go cross-canadian toolchain")
+
+        # Additional runtime check for go command availability
+        try:
+            self._run('which go')
+        except Exception as e:
+            raise unittest.SkipTest("GoCompileTest class: go command not available: %s" % str(e))
+
+    def test_go_build(self):
+        """Test Go build command (native compilation)"""
+        self._run('cd %s; go build -o test test.go' % self.tc.sdk_dir)
+
+    def test_go_module(self):
+        """Test Go module creation and building"""
+        # Create a simple Go module
+        self._run('cd %s; go mod init hello-go' % self.tc.sdk_dir)
+        self._run('cd %s; go build -o hello-go' % self.tc.sdk_dir)
+
+    @classmethod
+    def tearDownClass(self):
+        files = [os.path.join(self.tc.sdk_dir, f) \
+                for f in ['test.go', 'test', 'hello-go', 'go.mod', 'go.sum']]
+        for f in files:
+            remove_safe(f)
+
+class GoHostCompileTest(OESDKTestCase):
+    td_vars = ['MACHINE', 'SDK_SYS', 'TARGET_ARCH']
+
+    # Architecture mapping from Yocto/Poky to Go
+    ARCH_MAP = {
+        'aarch64': 'arm64',
+        'cortexa57': 'arm64',  # ARM Cortex-A57 is ARM64
+        'cortexa72': 'arm64',  # ARM Cortex-A72 is ARM64
+        'cortexa53': 'arm64',  # ARM Cortex-A53 is ARM64
+        'x86_64': 'amd64',
+        'i586': '386',
+        'i686': '386',
+        'mips': 'mips',
+        'mipsel': 'mipsle',
+        'powerpc64': 'ppc64',
+        'powerpc64le': 'ppc64le',
+        'riscv64': 'riscv64',
+    }
+
+    @classmethod
+    def setUpClass(self):
+        # Copy test.go file to SDK directory (same as GCC test uses files_dir)
+        shutil.copyfile(os.path.join(self.tc.files_dir, 'test.go'),
+                        os.path.join(self.tc.sdk_dir, 'test.go'))
+
+    def setUp(self):
+        target_arch = self.td.get("TARGET_ARCH")
+        # Check for go-cross-canadian package (uses target architecture)
+        if not self.tc.hasHostPackage("go-cross-canadian-%s" % target_arch):
+            raise unittest.SkipTest("GoHostCompileTest class: SDK doesn't contain a Go cross-canadian toolchain")
+
+        # Additional runtime check for go command availability
+        try:
+            self._run('which go')
+        except Exception as e:
+            raise unittest.SkipTest("GoHostCompileTest class: go command not available: %s" % str(e))
+
+    def _get_go_arch(self):
+        """Get Go architecture from SDK_SYS"""
+        sdksys = self.td.get("SDK_SYS")
+        arch = sdksys.split('-')[0]
+
+        # Handle ARM variants
+        if arch.startswith('arm'):
+            return 'arm'
+
+        # Use mapping for other architectures
+        return self.ARCH_MAP.get(arch, arch)
+
+    def test_go_cross_compile(self):
+        """Test Go cross-compilation for target"""
+        goarch = self._get_go_arch()
+        self._run('cd %s; GOOS=linux GOARCH=%s go build -o test-%s test.go' % (self.tc.sdk_dir, goarch, goarch))
+
+    def test_go_module_cross_compile(self):
+        """Test Go module cross-compilation"""
+        goarch = self._get_go_arch()
+        self._run('cd %s; go mod init hello-go' % self.tc.sdk_dir)
+        self._run('cd %s; GOOS=linux GOARCH=%s go build -o hello-go-%s' % (self.tc.sdk_dir, goarch, goarch))
+
+    @classmethod
+    def tearDownClass(self):
+        # Clean up files with dynamic architecture names
+        files = [os.path.join(self.tc.sdk_dir, f) \
+                for f in ['test.go', 'go.mod', 'go.sum']]
+        # Add architecture-specific files using the same mapping
+        for arch in self.ARCH_MAP.values():
+            files.extend([os.path.join(self.tc.sdk_dir, f) \
+                         for f in ['test-%s' % arch, 'hello-go-%s' % arch]])
+        # Add 'arm' for ARM variants
+        files.extend([os.path.join(self.tc.sdk_dir, f) \
+                     for f in ['test-arm', 'hello-go-arm']])
+        for f in files:
+            remove_safe(f)

