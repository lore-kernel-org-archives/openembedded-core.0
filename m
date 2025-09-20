Return-Path: <osama.abdelkader@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC529CAC5A7
	for <webhook@archiver.kernel.org>; Sat, 20 Sep 2025 17:27:44 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.14143.1758389264158045453
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Sep 2025 10:27:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kzC+/aIB;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: osama.abdelkader@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3f1aff41e7eso1555986f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Sep 2025 10:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758389262; x=1758994062; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ry2q7Y7jbgCBT7uGXGyRXNNeCJVxXPqV+Wb1Xg6bHDM=;
        b=kzC+/aIBCLNccV9aD6Gb4A2MrUN/Mw9++dehWrxAPoyiKw9jIeRgHw4GWhNayLQ1Lh
         6UVBe5KnTg61B6FXfepHwFaIIRSkeCSu2PSvxBkqpuHlFuP9robi+3tkNki2cESTwb+D
         B33EKTOtHsaXxN4N1B7zypJhBigN7StGAhr70dtCiD6/wlkW2nZQTOPSclpB8cueuJpD
         Wz8pTZ0jBQyXE7txYlZwoyHum+dnu7y1IoAsw/AM64R1Cv1KuvS4VT8Y62njBgv9kldR
         fc8XuHj2xf/afy6/EIvApR2DUKRbHPTufowE24uNHip2l/MDySD0bNejt9ZO+JIhFXrb
         7wOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758389262; x=1758994062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ry2q7Y7jbgCBT7uGXGyRXNNeCJVxXPqV+Wb1Xg6bHDM=;
        b=V6lBs2/vSFCTaa6+nZMvaruB8+eI3kFcLeJ5QLPIz5g4VYBP4dqorEfBr/eyD+m7xl
         D+Qlu1gYg8j9KOQDc7oqK0sy/8EyLy8PWVQY9yYY6rasLUM5dKvLWxwzUwhUxyvkSW0Q
         ZbGWzCgejzDJuuA6LZD7K8mJpvVekejJ/gwEO7Jv2fx/+RcT7xpiqn+OFPTBuP8LM9+u
         EagLsYJyUyV0D0pR/SkFBOZQg3sN7xDhkgSWuTWGTj8r90B4FOdqm2CEWE1veQwt8PVl
         PJMGg/ztQS8YpB7sqFUo/MtVwnsEjM/wZhyMZoWvFPFZFuZilYgopcFk1dmAloq7W/+R
         qe8Q==
X-Gm-Message-State: AOJu0YxA3Tj76Ka08OceplLb12MrJUEAS51eSX1X7OUSf918Gz1t3hKW
	YteAmLpSOcC5UVqwes9u3EYEmNbIkiHfdD12utw+oUurUYR25YHK8VlJ0cwFFFod+Dc=
X-Gm-Gg: ASbGncvfV2Yzth9SpZ2qSulB2snZqXnUAFnCv+YMEqjxczNA/ydVia7a5OvT3aLeqXR
	TmkIyq9FU+5gLh4WbOMA3cb6b12rdQ09ZIrbtip+NvyDJR31jvoxxQre5RB1GQjPdkzOly59/ai
	BFwBwtq1mPKTyaHIMq9mmWIJKlOuOCMU9M7F80bHOPa+25ekTf+SJmAQNArmtXPl2VtZQakjhwm
	KFcuQISv3zhDGoAgIGCKxO9xvs5EbAXwt5JPgUKcX01d+dnXCvNvx18k8J8gC4ZM4gbPTvTNpSA
	MHmv6Rz3/kg8NAcfiaqzehpWVS0nd3oT4OFcPhZqyGkoonbSWng11s7uSiiFProd0jwpq2Uq4hP
	6mpNRJXQA1N1/CgYBTAYUyhWwbr5QnSlW+dRybWKIsa3PRkgMWq6NqLPwx+7hT/lWrn0Mm6dzN4
	HEPVk=
X-Google-Smtp-Source: AGHT+IGPUpIO8kwSmBhgnX3Wznf0i8/cbh38me4g70oQafzM75H8kDxVY+AJpjiptkebx8ca0qUVNg==
X-Received: by 2002:a05:6000:2509:b0:3e7:46bf:f89d with SMTP id ffacd0b85a97d-3ee87ac9a0bmr6809926f8f.44.1758389262389;
        Sat, 20 Sep 2025 10:27:42 -0700 (PDT)
Received: from osama.. ([156.223.20.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbc7300sm12249027f8f.34.2025.09.20.10.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 10:27:41 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Ross.Burton@arm.com
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] go: remove duplicate arch map in sdk test
Date: Sat, 20 Sep 2025 20:27:33 +0300
Message-ID: <20250920172733.61631-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Sep 2025 17:27:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223783

ARCH_MAP is duplicating an existing map in meta/lib/oe/go.py
use oe.go map_arch instead.

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 meta/lib/oeqa/sdk/cases/go.py | 31 +++++--------------------------
 1 file changed, 5 insertions(+), 26 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/go.py b/meta/lib/oeqa/sdk/cases/go.py
index 9c15124f6a..a050df7a9f 100644
--- a/meta/lib/oeqa/sdk/cases/go.py
+++ b/meta/lib/oeqa/sdk/cases/go.py
@@ -12,6 +12,7 @@ from oeqa.core.utils.path import remove_safe
 from oeqa.sdk.case import OESDKTestCase
 
 from oeqa.utils.subprocesstweak import errors_have_output
+from oe.go import map_arch
 errors_have_output()
 
 class GoCompileTest(OESDKTestCase):
@@ -55,22 +56,6 @@ class GoCompileTest(OESDKTestCase):
 class GoHostCompileTest(OESDKTestCase):
     td_vars = ['MACHINE', 'SDK_SYS', 'TARGET_ARCH']
 
-    # Architecture mapping from Yocto/Poky to Go
-    ARCH_MAP = {
-        'aarch64': 'arm64',
-        'cortexa57': 'arm64',  # ARM Cortex-A57 is ARM64
-        'cortexa72': 'arm64',  # ARM Cortex-A72 is ARM64
-        'cortexa53': 'arm64',  # ARM Cortex-A53 is ARM64
-        'x86_64': 'amd64',
-        'i586': '386',
-        'i686': '386',
-        'mips': 'mips',
-        'mipsel': 'mipsle',
-        'powerpc64': 'ppc64',
-        'powerpc64le': 'ppc64le',
-        'riscv64': 'riscv64',
-    }
-
     @classmethod
     def setUpClass(self):
         # Copy test.go file to SDK directory (same as GCC test uses files_dir)
@@ -94,12 +79,8 @@ class GoHostCompileTest(OESDKTestCase):
         sdksys = self.td.get("SDK_SYS")
         arch = sdksys.split('-')[0]
 
-        # Handle ARM variants
-        if arch.startswith('arm'):
-            return 'arm'
-
         # Use mapping for other architectures
-        return self.ARCH_MAP.get(arch, arch)
+        return map_arch(arch)
 
     def test_go_cross_compile(self):
         """Test Go cross-compilation for target"""
@@ -117,12 +98,10 @@ class GoHostCompileTest(OESDKTestCase):
         # Clean up files with dynamic architecture names
         files = [os.path.join(self.tc.sdk_dir, f) \
                 for f in ['test.go', 'go.mod', 'go.sum']]
-        # Add architecture-specific files using the same mapping
-        for arch in self.ARCH_MAP.values():
+        # Add common architecture-specific files that might be created
+        common_archs = ['arm64', 'arm', 'amd64', '386', 'mips', 'mipsle', 'ppc64', 'ppc64le', 'riscv64']
+        for arch in common_archs:
             files.extend([os.path.join(self.tc.sdk_dir, f) \
                          for f in ['test-%s' % arch, 'hello-go-%s' % arch]])
-        # Add 'arm' for ARM variants
-        files.extend([os.path.join(self.tc.sdk_dir, f) \
-                     for f in ['test-arm', 'hello-go-arm']])
         for f in files:
             remove_safe(f)
-- 
2.43.0


