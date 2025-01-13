Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFEC4C02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 14:09:26 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.17375.1736777358486530910
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 06:09:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Iw1zVkXC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so31115055e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 06:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736777356; x=1737382156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wTXsuTTMthRSqBpbR/HAIpoFfyJz3vJF1a9/nNkXlJo=;
        b=Iw1zVkXCQ2jZRScVM4V2Vdn1taQfzqGQXRiFwoXa3+9exMLxmgW+51cWvVKPFKD2j4
         5sg25AeLGswtuB7c8czlq6nF8JZKesqGM3rG52So8pRpJOjunzwmCL2p8q8WDgOJZY5K
         yvYebMMCgcEHq5lNB8X9HRMaxOxHfC8xCGGd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736777356; x=1737382156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wTXsuTTMthRSqBpbR/HAIpoFfyJz3vJF1a9/nNkXlJo=;
        b=azd/zrsVjlGE8LRR8RDAWGGCtwUPxiP+sfrQxB8uA1Gl3Lo3FMA3FYcMfFbT0QSm7U
         NdHrvv92/ixzTfH/er178EbD/AKCkYeh5cbkbRipKt8WxWRK9E3/u6hlo/2qf8sYhox6
         lpNraHw6Lx/GQHX4Rtmotq2Jibgyaxu0pvvWR5MfrY2d5uQs5XftnruzWXlTXjGr9xY2
         4Y+KBzreGShEmKAQDYRyCcQ+LJOJUpKZWGAVviombvhO5Q7IIZXsd2PQjf9ynr40ww6/
         UVCXC2EhYEvPupJUss1hS3c0nddb/qkfZLy+R6Q4zW8DJVU7a5ensPdcHgnkK1ex6skA
         D62w==
X-Gm-Message-State: AOJu0YzYlnt9xl+jmtzXokQINFrx2uCL9HW3VdsioDAqPeLlWxMLZ+Ng
	LMdgtAn7y9aAgaFNNrXdDi3kY5i+i9TGV7PfbqJxhQGgmZ3IS8E22BXEm9qPJLKVmCcXrbjbHAb
	laAo=
X-Gm-Gg: ASbGncscUMgCIwrOPBMyNbwl0XxVCq445slTALTpYpRpoy1nW4iIr7fUr1bKSxoPCZJ
	WVzhrz3m6U1MVvGQaXI1c9mAnu4Gj1xb9RzrY0U8bkNbxVlxIJO6i2pu91tA/XGwM/JN6hR09Gh
	IzRrYQVRS9Au2d4/OkW29Zkoinm4ZPYgCnLPy5u6Bh/Lt2VbwCfmcQ+BHOHtAipGZfkkgxsmMIU
	lrmGl0VH2ZVXPwgD+4GcRLUj7bm+YKNQyXRa2ea5iq92xTdwjttHNoNLisD5QrlHpLNItnUdlMg
	AlRAWhy6LA==
X-Google-Smtp-Source: AGHT+IGLaubALoS+rBQZ8Oe6cKqlFIosQ5SFtdeZxSy9OYgGW5oWwFENtMGIBKq5NAQL0YxlKIf/MQ==
X-Received: by 2002:a05:600c:1d14:b0:436:5fc9:309d with SMTP id 5b1f17b1804b1-436e26f6d81mr141303815e9.30.1736777356414;
        Mon, 13 Jan 2025 06:09:16 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8c02:7837:65dd:9212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9d8faa5sm146641125e9.1.2025.01.13.06.09.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 06:09:15 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/sstatetests: Cover aarch64 SDKMACHINE in tests
Date: Mon, 13 Jan 2025 14:09:14 +0000
Message-ID: <20250113140914.2389549-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 14:09:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209728

We want to ensure ARM nativesdk signatures match those for the 32 and 64 bit
x86 versions. Add a test to ensure this is the case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 26 ++++++++++++++-------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index fa0172dd6d2..51642445669 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -367,13 +367,7 @@ class SStateCacheManagement(SStateBase):
         self.run_test_sstate_cache_management_script('m4', global_config,  target_config, ignore_patterns=['populate_lic'])
 
 class SStateHashSameSigs(SStateBase):
-    def test_sstate_32_64_same_hash(self):
-        """
-        The sstate checksums for both native and target should not vary whether
-        they're built on a 32 or 64 bit system. Rather than requiring two different
-        build machines and running a builds, override the variables calling uname()
-        manually and check using bitbake -S.
-        """
+    def sstate_hashtest(self, sdkmachine):
 
         self.write_config("""
 MACHINE = "qemux86"
@@ -391,10 +385,10 @@ MACHINE = "qemux86"
 TMPDIR = "${TOPDIR}/tmp-sstatesamehash2"
 BUILD_ARCH = "i686"
 BUILD_OS = "linux"
-SDKMACHINE = "i686"
+SDKMACHINE = "%s"
 PACKAGE_CLASSES = "package_rpm package_ipk package_deb"
 BB_SIGNATURE_HANDLER = "OEBasicHash"
-""")
+""" % sdkmachine)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash2")
         bitbake("core-image-weston -S none")
 
@@ -414,6 +408,20 @@ BB_SIGNATURE_HANDLER = "OEBasicHash"
         self.maxDiff = None
         self.assertCountEqual(files1, files2)
 
+    def test_sstate_32_64_same_hash(self):
+        """
+        The sstate checksums for both native and target should not vary whether
+        they're built on a 32 or 64 bit system. Rather than requiring two different
+        build machines and running a builds, override the variables calling uname()
+        manually and check using bitbake -S.
+        """
+        self.sstate_hashtest("i686")
+
+    def test_sstate_sdk_arch_same_hash(self):
+        """
+        Similarly, test an arm SDK has the same hashes
+        """
+        self.sstate_hashtest("aarch64")
 
     def test_sstate_nativelsbstring_same_hash(self):
         """

