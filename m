Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE26CFD30B
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 22:15:13 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3766.1763849704496930246
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Nov 2025 14:15:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BWf+xc7R;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3437af8444cso3357885a91.2
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 14:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763849704; x=1764454504; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t2Wu5upEIt31uD6NYTGUXrMt1NMTgYemKiO1IPKfYkk=;
        b=BWf+xc7R4yg6V3kNYOjJrptpAgCaIoUJodNWUlMKDj2GMYQcvAR2WVNsCyGImYLMSi
         mejpwWQoAt2oJw+aSolIJ62t+fxIFGn3pD5npqZJra23xpxV9zCA+YeHI1EikFolgZgI
         srEI3A6v0G9lmnT7JQqUB2HPMM0ECBLCcxHgnoFmHzV8qeDIpe208p5Q9tUS8SjlJwVS
         ahcI63SSR+iRBh7HTVCCKBkjKNzFWlfNKcnhuLlbSFOSJq0G+kQ/BczDAIpIuhQ0h82I
         HjALJr2retSIvrQ/Fg0G1MVGj6enK0ViJm9SQICAe3uu0G7OOFaithcQmwezTFOqzdfE
         tvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763849704; x=1764454504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t2Wu5upEIt31uD6NYTGUXrMt1NMTgYemKiO1IPKfYkk=;
        b=MENvnmjZAyWMRKv4nvA/8icTh+TN1bwdXDwkefewFgZWOsKsQq4tCLRQcCHkpvuPso
         YoKB4Imli2WfHaAFqm7aEfQIbtBS+swbP9rdHDqopBoNZo7UsMHDqj+Hfug2YI6LRT1/
         ytqfsmzd/xlV4xcZcengt6PONOIdfqLbfGo/rGEm13avWRUkB2jp6RbwIS72Ah02W+tx
         PlxNf3C9lVfdftqKUYL5LXkL35ucArlr1G6FWCSLYqASdpJvF6aC/YV/SsdbDZCYn7y2
         E1Aaua97As/mtj+w/XGu9O7DuS71beVb8GJNBWtIpUkBpwlSNgIesDdaSVFmnrgw2dWN
         nIhg==
X-Gm-Message-State: AOJu0Ywe3Iv7SisQwCIk+uJPULRhITq4KB/Y3sGjCTCFFTnWGYe+98wG
	XO0vNLZQnlt58tTuR5RS4dZ2w/jYHdCuGscnPUzrKPsEZndF0sJeGYt2CV6nTsUVw+jEKMCOAgJ
	3IFQb
X-Gm-Gg: ASbGncsjiKi+1zTx4zXRJS4Jrt2JhAfiwn2nDh2TlWNUU7jxmXCfetfSkk12OS9SpOE
	lay7y9qdS3j1PWnMoEeifZ7joUaF+VSfVfqBKDqvuNz+LuJCiRQZKk2MJJk5iF2xWrqmC7Zy/E0
	XzjTS8OIUa2y2/nWhdok9gXsPqZXQPfhQ2eTFabvOPDJ4NvhzCLQ2uv9pz3qx80L1LhO0YrOJC2
	dk3+Axr10lyJ4/u2wthCOSZdLJygv2CG+kNDQDRVf8ZL/+2kqOCjGm2d47DlwW96ocy0YgZtmJq
	37CiK2H2vKuBN580vU3NUzWie8zp8eFaP5gH/flsz/zdg8iswV6CekDeQ6o8rWmL5xvwAI1nz6L
	gonoD71RttrVx6lUfBFPf5N1ja68vNFQy3C92CbM9cE6AkKvIOdNwe/P8o8seYi9a/NxnZjBmxo
	NtHA==
X-Google-Smtp-Source: AGHT+IHbmUFEr6Mltunj99J+0Av7igdzEYkZpWFclJgCNh3CwpJjnN1aw3tPvvq2++Mn60qK5HNY7w==
X-Received: by 2002:a17:90b:1dd1:b0:341:8ca8:ae64 with SMTP id 98e67ed59e1d1-34733f51faamr7771860a91.35.1763849703660;
        Sat, 22 Nov 2025 14:15:03 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:a812:a9e4:3291:bb61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345af26d8b1sm7158274a91.3.2025.11.22.14.15.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 14:15:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/21] go: add sdk test
Date: Sat, 22 Nov 2025 14:14:22 -0800
Message-ID: <506f4e8c99b164673ba7d1c19e10d240f4df0376.1763849517.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763849517.git.steve@sakoman.com>
References: <cover.1763849517.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 22:15:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226714

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


