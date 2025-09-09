Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C676CAC582
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 19:50:05 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.1.1757447395637374879
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 12:49:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G0koJKVq;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7722c88fc5fso5523174b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 12:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757447395; x=1758052195; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DZnB5Z+blzRVZJRJhvVpIolWlX6wYXLuMg5sMVjxbL8=;
        b=G0koJKVq4zT7/6S32JdWR/H3GirCObIS1y71UvTqax2Vg4pbyTc/IM7ZaOe41PIFzn
         LvmGKlHHUmU1Wv2GOlsABPYQwawBB4S5/i2wohoWm9dS1heihZLNBrz734RIUV0xRz5s
         uVRdbhi/rOH2voJFmSz5jMYi/S53IsEBLN4NTjf9+yRXnOpV5aM18GRHl/yqka5cBhtF
         avmDj8FXAQDcxJ9TNlVycZ16lnFJIC/GwmqHfhVg5jlKD6dLMaDszptsQ4Y/50Fnv39W
         DQdi8QDbwzecIgR882I4G545pX+YUqUc3rO/BFWxs7R3J9xUf9/Ue+eQcwrDn4J6crQG
         32kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757447395; x=1758052195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DZnB5Z+blzRVZJRJhvVpIolWlX6wYXLuMg5sMVjxbL8=;
        b=YRLhwxa+iOpErSdeD1TZw6xYv6zizFCHfhYNcgtHO+xrp6+QNHTLgzQeiY89apxSgf
         5lFH42Vhr9qbPSlM8cgDL2X1d37yCzTJNSHhKUNh8ML/qoe8g/DaH7wsS4cJhA1Vpszm
         35iye9Ym/q7860GSuGo3LbFBUiLGp2OVQI5+ego3zOiGtlh0Mz8d1H6+WR+i3c5XbqK3
         rkHDmhC3ebGaohpxIgjeHfxtrksnMyljVRGkh/KVAUmSuwASmgXxCgYPjvhaX1h5q/jt
         0WtOP7fFmMuKJ8Dh8gWnA9TCXjmwS2bKcSOzt3RKRlP9dajhWk1CGHDd5HjaikHFKrQH
         4sLA==
X-Gm-Message-State: AOJu0Ywdr8LuRdCVimrG5VRbuPM8R/H13gHNSAfeHNvLFtLR4GLCUThv
	J5wtnH+0qWKIm+ycMZ0+Te4uDe0JkUCBAK8mP/RD8BWj5xHVMRTldf95dk/oEfQ+
X-Gm-Gg: ASbGncvqiZcilH6pjLBVW1wwWz2N3IYWvXNaWH4tS4253PjVzxCzxMbiw3BEjzQCihS
	GMuvLmvgNEb5HyHEHvSdE8+P4xI1hsgJ2OYY074IZyfpRPtr5UYw8BcwijSFz1u6LUJTDRhO+Mx
	mUEeyWNiykHKlUm3vZ7/eeGOPcY4ij/HWwIEgP5UkMrA+yvoeqKeCinjAOiA9F+cBeqUWyABhFv
	oev6sP/J3mISe/Isy1oePBFVH4gu52j49P3+hXQfRlSdp8TwklkXLS3Cgu16EOZlXRrA7JCgGJA
	AaoOmlqjKuDwZqOIu8PdPQQf8rQXY+gilEP6hOTZtG0hD4iK1zU9JhE65Ar4BBfTwoWheNvhA0K
	r8cxM/ciW0SoWA1jaf6Jqj54i92cM5ljHGnwwpCjGkETRmZH8cTamj7LeQ3rjubvgwd+x75sbph
	jmctDo0nMNONkIJG/0onVJFrVSPSlPd7u6brXOqBEWoGEBni1RV98=
X-Google-Smtp-Source: AGHT+IGhfounzAxZsZ8wUuUEMoHqaF63u9Ah5gqkX17opSl5y9raR8PfIf2moJM8IGsVl8W/QjLOww==
X-Received: by 2002:a05:6a20:2583:b0:250:c76d:1cd8 with SMTP id adf61e73a8af0-2533f8c9498mr19714199637.20.1757447394710;
        Tue, 09 Sep 2025 12:49:54 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::d0a7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b548a6cdabbsm504277a12.54.2025.09.09.12.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 12:49:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3] python: Skip NODEV portion of test_makedev when linked to musl
Date: Tue,  9 Sep 2025 12:49:52 -0700
Message-ID: <20250909194952.2947206-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 19:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223139

backport the upstreamed patch which is available in 3.14+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Update patch with newly filed GH issue report for this problem
v3: Replace the patch with the backported one

 ...DEV-portion-of-test_makedev-when-lin.patch | 24 +++++++++++++++++++
 .../python3/test_posix_nodev_disable.patch    | 16 -------------
 .../recipes-devtools/python/python3_3.13.7.bb |  4 +---
 3 files changed, 25 insertions(+), 19 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/0001-gh-90548-Skip-NODEV-portion-of-test_makedev-when-lin.patch
 delete mode 100644 meta/recipes-devtools/python/python3/test_posix_nodev_disable.patch

diff --git a/meta/recipes-devtools/python/python3/0001-gh-90548-Skip-NODEV-portion-of-test_makedev-when-lin.patch b/meta/recipes-devtools/python/python3/0001-gh-90548-Skip-NODEV-portion-of-test_makedev-when-lin.patch
new file mode 100644
index 00000000000..4390e086d0f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-gh-90548-Skip-NODEV-portion-of-test_makedev-when-lin.patch
@@ -0,0 +1,24 @@
+From 2dc5e9f4c82888dbe21bd1eadb4b59b0efa9608c Mon Sep 17 00:00:00 2001
+From: Zachary Ware <zach@python.org>
+Date: Sat, 6 Sep 2025 13:20:12 -0500
+Subject: [PATCH] gh-90548: Skip NODEV portion of test_makedev when linked to musl
+
+Upstream-Status: Backport [https://github.com/python/cpython/pull/138593]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Lib/test/test_posix.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Lib/test/test_posix.py b/Lib/test/test_posix.py
+index c9cbe15..bfc1e2b 100644
+--- a/Lib/test/test_posix.py
++++ b/Lib/test/test_posix.py
+@@ -757,7 +757,7 @@ class PosixTester(unittest.TestCase):
+             self.assertRaises((ValueError, OverflowError), posix.makedev, x, minor)
+             self.assertRaises((ValueError, OverflowError), posix.makedev, major, x)
+ 
+-        if sys.platform == 'linux':
++        if sys.platform == 'linux' and not support.linked_to_musl():
+             NODEV = -1
+             self.assertEqual(posix.major(NODEV), NODEV)
+             self.assertEqual(posix.minor(NODEV), NODEV)
diff --git a/meta/recipes-devtools/python/python3/test_posix_nodev_disable.patch b/meta/recipes-devtools/python/python3/test_posix_nodev_disable.patch
deleted file mode 100644
index 85767e1e898..00000000000
--- a/meta/recipes-devtools/python/python3/test_posix_nodev_disable.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Disable part of test_posix.test_makedev that depends on the NODEV
-macro being defined (missing on musl).
-
-Upstream-Status: Submitted [https://github.com/python/cpython/pull/31794]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/Lib/test/test_posix.py
-+++ b/Lib/test/test_posix.py
-@@ -757,7 +757,7 @@ class PosixTester(unittest.TestCase):
-             self.assertRaises((ValueError, OverflowError), posix.makedev, x, minor)
-             self.assertRaises((ValueError, OverflowError), posix.makedev, major, x)
- 
--        if sys.platform == 'linux':
-+        if False:
-             NODEV = -1
-             self.assertEqual(posix.major(NODEV), NODEV)
-             self.assertEqual(posix.minor(NODEV), NODEV)
diff --git a/meta/recipes-devtools/python/python3_3.13.7.bb b/meta/recipes-devtools/python/python3_3.13.7.bb
index a42b2c2a2d2..c682f1288ec 100644
--- a/meta/recipes-devtools/python/python3_3.13.7.bb
+++ b/meta/recipes-devtools/python/python3_3.13.7.bb
@@ -30,9 +30,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-test_active_children-skip-problematic-test.patch \
            file://0001-test_readline-skip-limited-history-test.patch \
            file://0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch \
-           "
-SRC_URI:append:libc-musl = "\
-           file://test_posix_nodev_disable.patch \
+           file://0001-gh-90548-Skip-NODEV-portion-of-test_makedev-when-lin.patch \
            "
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \

