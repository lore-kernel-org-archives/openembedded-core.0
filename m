Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10282C3DA7F
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 17:09:52 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.30123.1722791382976150191
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 10:09:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zKXsq4wO;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.182, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3db157cb959so6365830b6e.0
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 10:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722791382; x=1723396182; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZhmLZsb/02XSJHtzcFtnjWsdOausKsPm7xWltNguYo=;
        b=zKXsq4wOLfeYQpkgzMbs2xofajswgkRByUNQLPKtQOKTTMYCIUyNB91KuSi2mKJUb+
         kfVXjn+amg9ymrrRFkrYh/IwR7yF4iJpj9siHogx5mh2J3AcJXFstc8/VzlXlf7Ayxkq
         +NCQ34emvcWEfFa92oW23b6E+qUWoFRExAR+vrat5gQc5KjDGcKQ1oT0mTK9rQmyo65C
         8nXiLGhx/VXaNCXVNvj57nKWhlOm4AOwrdjsnxeGfQaRO7VjgGF9dw+VECo9bEECRzZC
         1qM8llcPReFT0p1C7Q5ZSV+Dd/6iHsnDxQIUoIWtQUbx/h19ur0Z3Zx1Sf1RVmWPX06/
         yynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722791382; x=1723396182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZhmLZsb/02XSJHtzcFtnjWsdOausKsPm7xWltNguYo=;
        b=pRKrFIWUMnsSI9M1boM9erW2voo/AxRt0LBGxXPRpGjD6AO++xdQmWg85yneq2i1KW
         pv9r86E9M/l1zUZdSZAATK+Q4x/5oDaNUpAGfsWt9iPSgpcD2OY+Hh11skE7KhE6/+67
         0oje4a/0WVXY8gJ3sl8djCOHZLITIghRqc9FAxXwl5+uZyrrfL2lB9EpyHZXLAU6DpIJ
         5ji049s88IwKuN9tVwL4le8/E/U9XPou8abqUQLHqEOO0iUoIQ7tPX392r4edgSuUzNs
         yOSU3bsgv2Ksslv5NBMp6JqZMM60tlYPZKURNJmBZwYsGOmWkpOdeO6kuzwMf9y1JFin
         EkQQ==
X-Gm-Message-State: AOJu0Yz/kC5923PbD9vr00FagiDATrtogCnbDe8VIM0o+HoLWSmMWXtH
	QvnMCfupriK7W3Al45VJyQGB7bVVthkd/i8ygs64G7k8PpJU8GR5NUfy6ABy7FVDXeo0uFx7aXt
	Nw5bBFA==
X-Google-Smtp-Source: AGHT+IGwbk0tbAAaMnm/K3JJXIsD6GL7qkjubypC+RXRUodQQxgDJlsk8F9akhHYNyKACpQwf9oZNw==
X-Received: by 2002:a05:6870:304f:b0:254:b337:eebc with SMTP id 586e51a60fabf-26891e9301bmr12945184fac.35.1722791381895;
        Sun, 04 Aug 2024 10:09:41 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ec269d2sm4293225b3a.17.2024.08.04.10.09.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 10:09:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/18] oeqa sdk cases: Skip SDK test cases when TCLIBC is newlib
Date: Sun,  4 Aug 2024 10:09:14 -0700
Message-Id: <99a5ca1c2c2b7b3193710bc681fbf05936025b5b.1722790925.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722790925.git.steve@sakoman.com>
References: <cover.1722790925.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 17:09:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202970

From: Mark Hatle <mark.hatle@amd.com>

Newlib generally requires additional components to function.  Skip the
cases where newlib is known to not work.

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b9934755554e40d9980b90c3d541f4c702203561)
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/sdk/cases/assimp.py          | 4 ++++
 meta/lib/oeqa/sdk/cases/buildcpio.py       | 5 +++++
 meta/lib/oeqa/sdk/cases/buildepoxy.py      | 4 ++++
 meta/lib/oeqa/sdk/cases/buildgalculator.py | 4 ++++
 meta/lib/oeqa/sdk/cases/buildlzip.py       | 5 +++++
 meta/lib/oeqa/sdk/cases/gcc.py             | 4 ++++
 6 files changed, 26 insertions(+)

diff --git a/meta/lib/oeqa/sdk/cases/assimp.py b/meta/lib/oeqa/sdk/cases/assimp.py
index d990b1e97d..4cc30f2672 100644
--- a/meta/lib/oeqa/sdk/cases/assimp.py
+++ b/meta/lib/oeqa/sdk/cases/assimp.py
@@ -19,6 +19,10 @@ class BuildAssimp(OESDKTestCase):
     """
 
     def setUp(self):
+        libc = self.td.get("TCLIBC")
+        if libc in [ 'newlib' ]:
+            raise unittest.SkipTest("CMakeTest class: SDK doesn't contain a supported C library")
+
         if not (self.tc.hasHostPackage("nativesdk-cmake") or
                 self.tc.hasHostPackage("cmake-native")):
             raise unittest.SkipTest("Needs cmake")
diff --git a/meta/lib/oeqa/sdk/cases/buildcpio.py b/meta/lib/oeqa/sdk/cases/buildcpio.py
index 51003b19cd..ab8fc41876 100644
--- a/meta/lib/oeqa/sdk/cases/buildcpio.py
+++ b/meta/lib/oeqa/sdk/cases/buildcpio.py
@@ -17,6 +17,11 @@ class BuildCpioTest(OESDKTestCase):
     """
     Check that autotools will cross-compile correctly.
     """
+    def setUp(self):
+        libc = self.td.get("TCLIBC")
+        if libc in [ 'newlib' ]:
+            raise unittest.SkipTest("AutotoolsTest class: SDK doesn't contain a supported C library")
+
     def test_cpio(self):
         with tempfile.TemporaryDirectory(prefix="cpio-", dir=self.tc.sdk_dir) as testdir:
             tarball = self.fetch(testdir, self.td["DL_DIR"], "https://ftp.gnu.org/gnu/cpio/cpio-2.15.tar.gz")
diff --git a/meta/lib/oeqa/sdk/cases/buildepoxy.py b/meta/lib/oeqa/sdk/cases/buildepoxy.py
index 147ee3e0ee..5b9c36fcec 100644
--- a/meta/lib/oeqa/sdk/cases/buildepoxy.py
+++ b/meta/lib/oeqa/sdk/cases/buildepoxy.py
@@ -18,6 +18,10 @@ class EpoxyTest(OESDKTestCase):
     Test that Meson builds correctly.
     """
     def setUp(self):
+        libc = self.td.get("TCLIBC")
+        if libc in [ 'newlib' ]:
+            raise unittest.SkipTest("MesonTest class: SDK doesn't contain a supported C library")
+
         if not (self.tc.hasHostPackage("nativesdk-meson") or
                 self.tc.hasHostPackage("meson-native")):
             raise unittest.SkipTest("EpoxyTest class: SDK doesn't contain Meson")
diff --git a/meta/lib/oeqa/sdk/cases/buildgalculator.py b/meta/lib/oeqa/sdk/cases/buildgalculator.py
index 178f07472d..28187434a1 100644
--- a/meta/lib/oeqa/sdk/cases/buildgalculator.py
+++ b/meta/lib/oeqa/sdk/cases/buildgalculator.py
@@ -18,6 +18,10 @@ class GalculatorTest(OESDKTestCase):
     Test that autotools and GTK+ 3 compiles correctly.
     """
     def setUp(self):
+        libc = self.td.get("TCLIBC")
+        if libc in [ 'newlib' ]:
+            raise unittest.SkipTest("GTK3Test class: SDK doesn't contain a supported C library")
+
         if not (self.tc.hasTargetPackage("gtk+3", multilib=True) or \
                 self.tc.hasTargetPackage("libgtk-3.0", multilib=True)):
             raise unittest.SkipTest("GalculatorTest class: SDK don't support gtk+3")
diff --git a/meta/lib/oeqa/sdk/cases/buildlzip.py b/meta/lib/oeqa/sdk/cases/buildlzip.py
index b4b7d85b88..afedc25178 100644
--- a/meta/lib/oeqa/sdk/cases/buildlzip.py
+++ b/meta/lib/oeqa/sdk/cases/buildlzip.py
@@ -13,6 +13,11 @@ class BuildLzipTest(OESDKTestCase):
     """
     Test that "plain" compilation works, using just $CC $CFLAGS etc.
     """
+    def setUp(self):
+        libc = self.td.get("TCLIBC")
+        if libc in [ 'newlib' ]:
+            raise unittest.SkipTest("MakefileTest class: SDK doesn't contain a supported C library")
+
     def test_lzip(self):
         with tempfile.TemporaryDirectory(prefix="lzip", dir=self.tc.sdk_dir) as testdir:
             tarball = self.fetch(testdir, self.td["DL_DIR"], "http://downloads.yoctoproject.org/mirror/sources/lzip-1.19.tar.gz")
diff --git a/meta/lib/oeqa/sdk/cases/gcc.py b/meta/lib/oeqa/sdk/cases/gcc.py
index fc28b9c3d4..e810d2c42b 100644
--- a/meta/lib/oeqa/sdk/cases/gcc.py
+++ b/meta/lib/oeqa/sdk/cases/gcc.py
@@ -26,6 +26,10 @@ class GccCompileTest(OESDKTestCase):
                     os.path.join(self.tc.sdk_dir, f))
 
     def setUp(self):
+        libc = self.td.get("TCLIBC")
+        if libc in [ 'newlib' ]:
+            raise unittest.SkipTest("GccCompileTest class: SDK doesn't contain a supported C library")
+
         machine = self.td.get("MACHINE")
         if not (self.tc.hasHostPackage("packagegroup-cross-canadian-%s" % machine) or
                 self.tc.hasHostPackage("^gcc-", regex=True)):
-- 
2.34.1


