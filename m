Return-Path: <osama.abdelkader@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A11CA101F
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 23:22:01 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.1563.1757719312415967730
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Sep 2025 16:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QUBGcWjH;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: osama.abdelkader@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45dfb8e986aso25096575e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 16:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757719311; x=1758324111; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQyR2gUDS7dAg5bUQtukQzdE3h22Ebx2i0jPqhyzJc8=;
        b=QUBGcWjH79RcyWL4dM/44SQK6j5GiXIsQvQBABmZqmBm2eiYU0F4imxHVuZ35cWziX
         itLEIppB0OkZPJ+wEtu/IZIO0x6oJ8NOZ7DVCY9gswWaS6tf2oYAh8vdkR1G4OrxwAT5
         utHKjrh1JN3AOR/bGFZH+RkDbRqBur0nBw7cet0hSPlIVd0h7i59azM6OulJ2GPTO8rU
         8VdhvXYDKR5tuLqIgllswYoe0nCWIGIxHB69YOGBPnTnb975tly/ftsqpqRjYjAoUDUt
         LwUOYNOOsLODHToaPjPANlC6BdxIwI4CwTClYJBDiWst58HqMl/qe06nTOIbb7zuYx4p
         7mLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757719311; x=1758324111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XQyR2gUDS7dAg5bUQtukQzdE3h22Ebx2i0jPqhyzJc8=;
        b=fhi9YDKUdh9NnPJtZKEhs2O/Y0g0JGSlMipvE0cGzL4GZom6/Lqe2zVfJoHNEa37wl
         S8ulxLQpN9XUi/tgmMeOcYTg0cOaITjs/F6R6X2JFXUWOIZx/n9RK0rOKhpRs4KdGn1L
         PP1lMftElhNi1m2xTw03WFQPHPYU5YJQreaiNAk1VIkE2hDX/LSGvjfd5DrGv7OsbiJm
         lc2cHvxIDqLlPXj7QRFYzpjZ0G3GJXdIVecgeq0dPxPbz7w8z2XFBa8tDt4gO0nzqn95
         5SPngzHJmyKL4MEMRZovBcvcQLnfxUBMj2xnCytQldfgdgSljVejt70X/GmuLEonkYw3
         4OEA==
X-Gm-Message-State: AOJu0YwN1p6/HeI3rkeHVXlUeVNFxxzCDIqSpAegW7tqNkJPAoW7vCKT
	X9ixzbHX4/zXXjUk8CuWubHUMuOci+yaSx5TbeeJBaXYhShMjxtD26+xeqlZHQ==
X-Gm-Gg: ASbGncudEh39UVxktZAnmqTlhmJfdUSVIExFLBz2lt95lPD06/S0KwAeRdsNmqTtnQB
	LMDHHxq4+26eXxTEpTps031iVGKxrXwlFZMJC6V9QyBEZW9jmyQrzMbemWgSj/Sz9CTLc6EwIrk
	RAV7t46UHBU/xdgxuijnFN9vH2DroDk8Og2zJEQJ168WNQUZhUWNORQeU2pa0Y1XEk08+QsC95F
	OdgKLvgZNH+2T7gS/ww0r1sqI4SLRlZoCm55b8N8qE1TrteDFZD4Jm7enWbMzgFkCxL+uSOHJM5
	TsSCUGwtdHXQ1BkCdSBFSB5v4MxaGy57qEnaKwt7gpW79k9FVJzc1aj9ManVDdUecf7fnFJEyEv
	PH8LL9TNOUFeDSAM/HCh2ofh03bcUztGzZX3CAGs3HCqbJdaX2CtM+po5ODmzNFvN+rpQyIiTnk
	ouJ/pSTwijjpEn
X-Google-Smtp-Source: AGHT+IH7XXHt+KIdil3kHoVPKkJdt5fLFC5z88K6j5OuQAzIqeyeqqNV65ht4h1pdv9DDVbHZoyKVg==
X-Received: by 2002:a05:600c:470e:b0:45f:27de:cd22 with SMTP id 5b1f17b1804b1-45f27decdb1mr2490155e9.17.1757719310656;
        Fri, 12 Sep 2025 16:21:50 -0700 (PDT)
Received: from osama.. ([41.232.5.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e037c3ce5sm76808145e9.16.2025.09.12.16.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 16:21:50 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH 2/2] go: add sdk test
Date: Sat, 13 Sep 2025 01:21:10 +0200
Message-ID: <20250912232110.1794088-2-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912232110.1794088-1-osama.abdelkader@gmail.com>
References: <20250912232110.1794088-1-osama.abdelkader@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 23:22:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223339

Add Go SDK tests for cross-compilation toolchain

- Add meta/lib/oeqa/sdk/cases/go.py with GoCompileTest and GoHostCompileTest classes
- Test validates go-cross-canadian toolchain functionality
- Includes native compilation, module creation, and cross-compilation tests
- Supports dynamic architecture mapping (aarch64, x86_64, riscv64, etc.)
- Validates both simple Go builds and Go module workflows

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 meta/lib/oeqa/sdk/cases/go.py | 116 ++++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100644 meta/lib/oeqa/sdk/cases/go.py

diff --git a/meta/lib/oeqa/sdk/cases/go.py b/meta/lib/oeqa/sdk/cases/go.py
new file mode 100644
index 0000000000..a6122841f5
--- /dev/null
+++ b/meta/lib/oeqa/sdk/cases/go.py
@@ -0,0 +1,116 @@
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
-- 
2.43.0


