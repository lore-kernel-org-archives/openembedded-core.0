Return-Path: <osama.abdelkader@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF490CA0EE8
	for <webhook@archiver.kernel.org>; Sun, 14 Sep 2025 17:23:00 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.13891.1757870575155094394
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Sep 2025 10:22:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gAFENiI0;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: osama.abdelkader@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45f2c5ef00fso3324935e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 10:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757870573; x=1758475373; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1z2ycRZcOPaZonkDDEsFMOqmKaty7REddELYiRPNIYg=;
        b=gAFENiI0Y79iaxc+77QYi3UNwj508nl39uFMN9rPuaPB8geV96Qm/+rzMVKV8AbFq8
         XMjVaFIa2s72cE7+Mevhyi3yObqibC/VgrkR6roZEWDPi4374PRJuVsa2zU12O1fdC25
         lmP10rFbMKKwoO/6KB8a/l9ug8ggL7MAWMKTOOhDqqKZRLRCiUHr0y9R1Kgkb1b74QjL
         qw6muzurQNPg+Np/Y8JTov00kAK9Hb2X9pX0qgMh9ha+2rpniEISzE9DjXEqLZ+4JaCs
         z6+dSBYw8bUMUEhyZQQJ+qn6zEpwQUNlvAV31rrbxE4a22RPVy4fQzOyUt2LUuuEXCtc
         gHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757870573; x=1758475373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1z2ycRZcOPaZonkDDEsFMOqmKaty7REddELYiRPNIYg=;
        b=BDv6Rp80wN/HIFdce8AMbmcCxH076FFg2Tnab2kwKxYhgxg5xzO8MGp4stnk/5GZbs
         Ql9QvmbuwHlNkDui4BLJpM4m1y8v++CmFW/HCbCfCiTNgnJLC4miRXtzsNGv8HSEKqQU
         e+lgkK8C6OYJv2/bCZQlxzQWO8/kfqE1FXgVLhgYlwE2UzZ+435QD3nxmfoa6QsJr2XJ
         dYLqNjb492jFMyBIiiWZEQViY6Xt/czecbN3WjsaLE8lRyIpOY4nkeM5sGRSrbTDERfv
         nn/ABHghwQB6T7skPKv99DNEvN6tGZhlXdrLaN5wnT4c00vQfaIbBMVaGikjGnKVAlVp
         hEgw==
X-Gm-Message-State: AOJu0Yy1ETJ9jvcG0y6COcEhMpmF8HeSU505WdFzRliUv4bPOrLn0Jee
	0HpxQFs3/46++u95rA2ASjZ0Fbvo1iwz1jvs604zpCzEWdFNbfB5puy2fQBTgQ==
X-Gm-Gg: ASbGncty2gBMOE21YSifX0gq1lUc+aTk917P76IfMkYIMOFpK8IBzxhmGmxGM74XPoR
	I1JUKQJfNSU+sucmRpRuG1+lW5QFYehY0jPH4Xxe4KPHTEmbhcTYr6TC44GmfDThjJ3bK6AB/f4
	k5vAotyXuzwZaSr7fzd69wv+WRX2lQzDlmGQ3FxV1E+OEavLfFUAGu2u9cYZvH5w1/aCOEIRfnY
	Ev8ieZfzzwAZP45y6g5lvcbWR8zN3iqnLpHPYv2FUPvvzvwVQa3q4fJg4agrSMGizXNUi+xPxJp
	g2KGy0p4UIZ3pW5d1YRcbtDc2QFS9ZMUXdDlpUhi7LhHd79BQDSLbd3NR8uLtgB1a3KpnYqje+f
	MkIId9luOSPg1IAv+SZ1mUWalj4TIzBlex3HUqWMt8H3F51Wo7VaKUlAxCeWqBhgN4Ro2iC3Vqu
	ApAC3YA3yMyuzdXQ==
X-Google-Smtp-Source: AGHT+IELxnB8AipvYT2DMBNvZW2ER3QNfqvIDmtla9e9Jhmy3Y1XEwBZvQc0CRMsVnx3rH4asTJlmw==
X-Received: by 2002:a05:600c:8284:b0:458:c094:8ba5 with SMTP id 5b1f17b1804b1-45f211d5735mr95051355e9.12.1757870573243;
        Sun, 14 Sep 2025 10:22:53 -0700 (PDT)
Received: from osama.. ([156.223.20.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e9b1ab74b8sm3467300f8f.5.2025.09.14.10.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 10:22:51 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com,
	mathieu.dubois-briand@bootlin.com
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH v2 2/2] go: add sdk test
Date: Sun, 14 Sep 2025 19:22:43 +0200
Message-ID: <20250914172243.19403-2-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914172243.19403-1-osama.abdelkader@gmail.com>
References: <20250914172243.19403-1-osama.abdelkader@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 17:23:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223363

- Add meta/lib/oeqa/sdk/cases/go.py with GoCompileTest and GoHostCompileTest classes
- Test validates Go cross-compilation toolchain functionality
- Includes native compilation, cross-compilation, and Go module support
- Uses dynamic architecture detection for portability

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 meta/lib/oeqa/sdk/cases/go.py | 128 ++++++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)
 create mode 100644 meta/lib/oeqa/sdk/cases/go.py

diff --git a/meta/lib/oeqa/sdk/cases/go.py b/meta/lib/oeqa/sdk/cases/go.py
new file mode 100644
index 0000000000..9c15124f6a
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
-- 
2.43.0


