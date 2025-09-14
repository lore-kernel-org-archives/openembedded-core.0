Return-Path: <osama.abdelkader@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0697ACA0EE8
	for <webhook@archiver.kernel.org>; Sun, 14 Sep 2025 18:26:01 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.14936.1757874360139234055
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Sep 2025 11:26:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EO1jShPb;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: osama.abdelkader@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3dad6252eacso1404193f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 11:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757874358; x=1758479158; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TPO3d5uoBLb2VNXGQuqk5CvGelhwVLhKwd7IR+BJak=;
        b=EO1jShPbhCEH0fq8G+EBwIYcVY5f4Ow4j/hAiOspPyrSPT/l6zurSYOZJVLU8xE/lb
         ZXRge7ABvixTomxNLvT93nlFIDgLAWY4fD6os2ZLc8H6ON1OnE7VMqDIMer85rdlTaZf
         o8red/BAJfCXmVhf6ri8PcAFbsTfku5dfUtzvKOMeUKUYD2ZkVHmwN9zbwW3DUdESvkd
         bPmlTbgedVR65toc3dILSoj+Cmp36a3Ij6aIKLYUUGpV8Pk7ak5GNe4teTGL/YPt+x2Y
         JFFJdhjs+wYJVS0u/ETQaABHjTToXswcGNTbx4AHpkNj9x8Yytsogwma+bCqhl1KfnM5
         +l+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757874358; x=1758479158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TPO3d5uoBLb2VNXGQuqk5CvGelhwVLhKwd7IR+BJak=;
        b=slk75k9+nm0nwSLbFg/CmixgqEX1jyKmZNb4kSnML/h4y1Y3/Va2nBZlT0aw4WadUz
         1O+KSpfmlrvcxLLMPSDanoGN2CmfN0E2celsUu5seObH2EW0/odVmG9N/6yK1HdSfPBN
         0lHUudil2EywIkBn75Rh7Zxt6BN8W4gzvPNWMnparb9k/OZGKOJ8VoSWxwFdn7f3zrnj
         H2kuGW72AA8xYUNcLeIrBI+7afkmDG7fuT+Nw8gDBMl7ICT9ue1SPdTDG2YyaRST2VrI
         dKjUlZAc/iun2UWF/bhRb2lBABZ9mPh45lQ0ifoo0XatAsjB9TkAgFi4wdG8G6b9/Af8
         Zq3w==
X-Gm-Message-State: AOJu0YwSnAe1/+57wOtGJSqIquweA80tIsz//MDr1iCA727jUzo2myVj
	3RL9ANQKmU3C/IdqWdxU6bmV1/Tn3/74fRtk/49fgh7yyyj3L6PvR3rJY2HtGA==
X-Gm-Gg: ASbGnctw8GcNlCtb1O7o/zIoECW9HX+ICuyvB/Qm6pBqBhd7UIZfcKKeq+NfIvXaMUw
	Brm6zKDQitQzn+OfWQJSunVLADogN464JPo/B6lgjPeonaO8AT5odRWKCACD8i9aFusZNRy+R+v
	NrnZAyi6Xz2Crfa347ymuZZQZ2e1S2q6DBFBjqtfLsa8JD/7G5vnUTNyTV3Az2J0/q2VlNEa4Pm
	jpK4Fixf/AZo65/kajvncgaGeRX5PMs1sDSbw3CAk1lTKaUSpfFpyr+TcyLhlLiDGtb8mOQenjQ
	naM7toozTr4NtrnyWHoU6PAJ311KaPojgPEgbiiiNf6ZkUqVx4Y8FWTQhqyxEbdcyUbGye+3glR
	npjRnvJnKj5FhWohD+7veMk4qgL6Tz0MIwjaRQJhhIhR9uL5Oxl96Ah10NqJrHJ42FtB01j6mvM
	HvAD0=
X-Google-Smtp-Source: AGHT+IFU+rpybMJkbITh60XZwmLAIOoJywgZLZ5uBfy2xBxisK3vxAOT4/d7inKjD4upBp3TaoBVCA==
X-Received: by 2002:a05:6000:2012:b0:3e7:441e:c9e1 with SMTP id ffacd0b85a97d-3e765793127mr7876445f8f.18.1757874358188;
        Sun, 14 Sep 2025 11:25:58 -0700 (PDT)
Received: from osama.. ([156.223.20.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e037c4490sm144833575e9.19.2025.09.14.11.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 11:25:57 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com,
	mathieu.dubois-briand@bootlin.com
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH v3 2/2] go: add sdk test
Date: Sun, 14 Sep 2025 20:25:50 +0200
Message-ID: <20250914182550.24959-2-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914182550.24959-1-osama.abdelkader@gmail.com>
References: <20250914182550.24959-1-osama.abdelkader@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 18:26:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223369

- Add meta/lib/oeqa/sdk/cases/go.py with GoCompileTest and GoHostCompileTest classes
- Test validates Go cross-compilation toolchain functionality
- Includes native compilation, cross-compilation, and Go module support
- Uses dynamic architecture detection for portability

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
v2: add check for go command, skip tests if not found
v3: add changelog
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


