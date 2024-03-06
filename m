Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13ECAC54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:10 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.14864.1709739728256011142
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HgoyWGLq;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a4532f84144so137478066b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739727; x=1710344527; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zYR+sXKpVtC7qkWB5+hG8mvF5ekFxoClBF4/CPYBr3w=;
        b=HgoyWGLqNO2FY/v+v2Q9gYvABh1ksM4bC2DGPzedSJxjs7numLQVQWiLj53rx6aODD
         xqLqgmvbtbgp+0rBI2aUIicSGLInNHDjbgRiGuXXdsbzibkhjz2ogqjYidXRYSK4ZKLp
         vSdXQm3UvBOoTHy6sT8cHUpx9sMB0JBLn6TlvZwPZu0RjEAvlZySo8Ydl3Q5PjTtgQfa
         td7egeVmO/jeAp52Eeux+sPlpyWplfFDGiEY23FDovF6mM9IaWS9NdsTIAL53H7VmjPR
         pZ5s09CqcdWPH6F7Y3VLHs1nRKDeMgPkj4UU9FpBoHLGNuKIL22Pv6XmESsY2kC8lCnc
         vQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739727; x=1710344527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zYR+sXKpVtC7qkWB5+hG8mvF5ekFxoClBF4/CPYBr3w=;
        b=hESCL6t9n+1WMW0iICS+sInMjl1+QXzCeVj9PTK/73CIqCFtKb/VZv73zaWo/DBrts
         cqVzVmEZ7wqaYOWOkmnnlT9sKK26N+0o7iLX2dNfNPrinLNUFWJ2csvUTp4WMUcb+qfi
         r7wbEhKVgoOy+DhZO81OTt4kDPoWhmC4I8w4t9moI+KAf3iQwpt4Qr7+MIOIAHcXcZRV
         CHuiXBOpw7Y639feH7jkYERGQWd8dfnpESwWEs7IAYFIoaJ+8xUN7DRJ3fosTeOaBZqx
         B2fVJZSbjyGIZp2gqdMnuJ4q7dEk5lg81uJxTQkInSU9lMgY0A/9WYNKADRS0LF25wIe
         rMgg==
X-Gm-Message-State: AOJu0YwHH6cZlxOjF7/cup0IsQeX5qV2P/rBn/ZJXE2VD7MBF4809mNq
	aoaXLnHPg+uAJKv3MjX1t11S65nsBJBQKG9BeQEEPTD+VWXewFJWZIV33992
X-Google-Smtp-Source: AGHT+IFVmURwIHrGEoM5H9IExUWaKb3RPLDmh0YctZbfuF1WcCcDrcVHQhfvzlq0OD18sgEjXOBAGA==
X-Received: by 2002:a17:906:fcc4:b0:a44:bc34:8a0f with SMTP id qx4-20020a170906fcc400b00a44bc348a0fmr9884814ejb.75.1709739726509;
        Wed, 06 Mar 2024 07:42:06 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/47] glib-2.0: upgrade 2.78.3 -> 2.78.4
Date: Wed,  6 Mar 2024 16:41:16 +0100
Message-Id: <20240306154151.3741709-12-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196695

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...t-write-bindir-into-pkg-config-files.patch |  3 +--
 ...0001-Fix-DATADIRNAME-on-uclibc-Linux.patch |  3 +--
 ...-gio-querymodules-as-libexec_PROGRAM.patch |  3 +--
 ...ng-about-deprecated-paths-in-schemas.patch |  3 +--
 ...-correctly-when-building-with-mingw3.patch |  5 ++---
 ...deprecated-distutils-module-to-the-p.patch |  2 +-
 ...ces.c-comment-out-a-build-host-only-.patch |  3 +--
 ...on-Run-atomics-test-on-clang-as-well.patch |  5 ++---
 ...ot-enable-pidfd-features-on-native-g.patch |  5 ++---
 ...dcode-python-path-into-various-tools.patch |  3 +--
 .../glib-2.0/glib-2.0/memory-monitor.patch    | 13 +++++-------
 .../glib-2.0/glib-2.0/native-gtkdoc.patch     | 21 -------------------
 .../glib-2.0/glib-2.0/relocate-modules.patch  |  3 +--
 ...{glib-2.0_2.78.3.bb => glib-2.0_2.78.4.bb} |  3 +--
 14 files changed, 20 insertions(+), 55 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/native-gtkdoc.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.78.3.bb => glib-2.0_2.78.4.bb} (95%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
index 0e5f371cb58..8e6598fbef8 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
@@ -1,4 +1,4 @@
-From cf7df91cc8c3b4811235ef8aec144c5f0cf90bdb Mon Sep 17 00:00:00 2001
+From e7077aa23bfcd31a8e72e39dc93ce4f854678376 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not write $bindir into pkg-config files
@@ -9,7 +9,6 @@ rather than use target paths).
 
 Upstream-Status: Inappropriate [upstream wants the paths in .pc files]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  gio/meson.build  | 16 ++++++++--------
  glib/meson.build |  6 +++---
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
index 1254466063a..eb9dfdbcf99 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
@@ -1,4 +1,4 @@
-From b907a6681c4c24e5d3745538d9fcd471cf1c4c4a Mon Sep 17 00:00:00 2001
+From 9a5d4bf65b658d744d610ee27ecd2ae65b14b158 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
@@ -8,7 +8,6 @@ based systems therefore lets set DATADIRNAME to "share".
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
-
 ---
  m4macros/glib-gettext.m4 | 4 ++++
  1 file changed, 4 insertions(+)
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
index 50d369c24ef..ad69f7ec655 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From 6e2ddcb5465d10618345b12e0b4471ead0f14304 Mon Sep 17 00:00:00 2001
+From 4933aef791857a5aac650b60af800778658b875b Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
@@ -8,7 +8,6 @@ renamer does not cope with library packages with files in ${bindir}
 
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Upstream-Status: Inappropriate [OE specific]
-
 ---
  gio/meson.build | 1 +
  1 file changed, 1 insertion(+)
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
index f810574d973..0e3a62af6a6 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From c8c223045821cac97f798cfa63f19853621a8a2a Mon Sep 17 00:00:00 2001
+From 8ae2e9c2a04e089306693a021149dc6b7d1bd679 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
@@ -9,7 +9,6 @@ messages, and meta/lib/oe/rootfs.py complaints about them.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  gio/glib-compile-schemas.c | 13 -------------
  1 file changed, 13 deletions(-)
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
index e1d2fb0e54f..32b4cea409c 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
@@ -1,11 +1,10 @@
-From bafde4eedc0a22b45e73ee6183b9a11393a1e400 Mon Sep 17 00:00:00 2001
+From c0733f7a91dfe13152abc60c5a3064456b3e9d63 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 13 Feb 2019 15:32:05 +0100
 Subject: [PATCH] Set host_machine correctly when building with mingw32
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  gio/tests/meson.build  | 8 ++++----
  glib/tests/meson.build | 2 +-
@@ -66,7 +65,7 @@ index d80c86e..5329cda 100644
      glib_tests += {
        'gpoll' : {
 diff --git a/meson.build b/meson.build
-index f7e936e..122f8b5 100644
+index 813c9b7..6ee775e 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -54,6 +54,9 @@ else
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-the-deprecated-distutils-module-to-the-p.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-the-deprecated-distutils-module-to-the-p.patch
index 50368ed22cc..b11c283e6d7 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-the-deprecated-distutils-module-to-the-p.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-the-deprecated-distutils-module-to-the-p.patch
@@ -1,4 +1,4 @@
-From 05f0674c93d94fe6b29c1b707980aac469ddcd72 Mon Sep 17 00:00:00 2001
+From a8eb944a10353403241608a084787f6efcbb2eb7 Mon Sep 17 00:00:00 2001
 From: Jordan Williams <jordan@jwillikers.com>
 Date: Fri, 1 Dec 2023 09:53:50 -0600
 Subject: [PATCH] Switch from the deprecated distutils module to the packaging
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
index e4c2f774592..aee29860332 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From 3f05b9418c88bbb83c08b57cc5529b006f26fff4 Mon Sep 17 00:00:00 2001
+From 878e51f82100c698236fda0e069e14ea9249350c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
@@ -8,7 +8,6 @@ not cross-compatible (hardcodes ld and objcopy).
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  gio/tests/resources.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-test-on-clang-as-well.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-test-on-clang-as-well.patch
index 071e4a7c4dc..0b102691141 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-test-on-clang-as-well.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-test-on-clang-as-well.patch
@@ -1,4 +1,4 @@
-From 17d718640ae6f953e5eea714c1bd64eeb6e4799f Mon Sep 17 00:00:00 2001
+From b4b523160ef550a53705fcc45ac6e10d086ce491 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Oct 2019 17:46:26 -0700
 Subject: [PATCH] meson: Run atomics test on clang as well
@@ -9,13 +9,12 @@ Fixes
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  meson.build | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 122f8b5..f055079 100644
+index 6ee775e..8bc5fa7 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -1938,7 +1938,7 @@ atomicdefine = '''
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
index e03f9a3c843..14dcb278e05 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From 7865d698b5d392aac3a3d32e9ebd5fea45017d15 Mon Sep 17 00:00:00 2001
+From 294f3e6e9a0a9f4733e85ed6810d1b743055370b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 16 Sep 2023 22:28:27 +0200
 Subject: [PATCH] meson.build: do not enable pidfd features on native glib
@@ -9,13 +9,12 @@ where these features are not implemented.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
 ---
  meson.build | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index f055079..77d78aa 100644
+index 8bc5fa7..df1fa60 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -981,7 +981,8 @@ if cc.links('''#include <sys/syscall.h>
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch b/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch
index 4b75167da6a..6dff5179c71 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch
@@ -1,11 +1,10 @@
-From 53bcd4b6cd3fe3fe4246914462e6724761eecf51 Mon Sep 17 00:00:00 2001
+From 50636758c73e5e61212a8f801c6c602b8aab5ba7 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  gio/gdbus-2.0/codegen/gdbus-codegen.in | 2 +-
  gobject/glib-genmarshal.in             | 2 +-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/memory-monitor.patch b/meta/recipes-core/glib-2.0/glib-2.0/memory-monitor.patch
index f9dfc5bb05e..4f38509da6f 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/memory-monitor.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/memory-monitor.patch
@@ -1,4 +1,4 @@
-From df7506918efc8748dac8b8398021e1b79d694ba4 Mon Sep 17 00:00:00 2001
+From ce840b6b111e1e109e511f6833d6aa419e2b723a Mon Sep 17 00:00:00 2001
 From: Philip Withnall <philip@tecnocode.co.uk>
 Date: Tue, 23 Jan 2024 11:16:52 +0000
 Subject: [PATCH] Merge branch '2887-memory-monitor-tests' into 'main'
@@ -22,7 +22,7 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  4 files changed, 113 insertions(+), 74 deletions(-)
 
 diff --git a/gio/tests/memory-monitor-dbus.py.in b/gio/tests/memory-monitor-dbus.py.in
-index bf3291847..7aae01e70 100755
+index bf32918..7aae01e 100755
 --- a/gio/tests/memory-monitor-dbus.py.in
 +++ b/gio/tests/memory-monitor-dbus.py.in
 @@ -16,7 +16,6 @@ import sys
@@ -130,7 +130,7 @@ index bf3291847..7aae01e70 100755
  except ImportError as e:
      @unittest.skip("Cannot import %s" % e.name)
 diff --git a/gio/tests/memory-monitor-portal.py.in b/gio/tests/memory-monitor-portal.py.in
-index 748cee850..f570508f9 100755
+index 748cee8..f570508 100755
 --- a/gio/tests/memory-monitor-portal.py.in
 +++ b/gio/tests/memory-monitor-portal.py.in
 @@ -16,7 +16,6 @@ import sys
@@ -222,7 +222,7 @@ index 748cee850..f570508f9 100755
  except ImportError as e:
      @unittest.skip("Cannot import %s" % e.name)
 diff --git a/gio/tests/power-profile-monitor-dbus.py.in b/gio/tests/power-profile-monitor-dbus.py.in
-index 06e594f4a..f955afc80 100755
+index 06e594f..f955afc 100755
 --- a/gio/tests/power-profile-monitor-dbus.py.in
 +++ b/gio/tests/power-profile-monitor-dbus.py.in
 @@ -16,7 +16,6 @@ import sys
@@ -295,7 +295,7 @@ index 06e594f4a..f955afc80 100755
  except ImportError as e:
      @unittest.skip("Cannot import %s" % e.name)
 diff --git a/gio/tests/power-profile-monitor-portal.py.in b/gio/tests/power-profile-monitor-portal.py.in
-index 09e9a450d..ad2abf621 100755
+index 09e9a45..ad2abf6 100755
 --- a/gio/tests/power-profile-monitor-portal.py.in
 +++ b/gio/tests/power-profile-monitor-portal.py.in
 @@ -16,7 +16,6 @@ import sys
@@ -359,6 +359,3 @@ index 09e9a450d..ad2abf621 100755
  
          def test_power_profile_power_saver_enabled_portal_default(self):
              '''power-saver-enabled property default value'''
--- 
-2.34.1
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/native-gtkdoc.patch b/meta/recipes-core/glib-2.0/glib-2.0/native-gtkdoc.patch
deleted file mode 100644
index f56c2b85640..00000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/native-gtkdoc.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-docs/reference: depend on a native gtk-doc
-
-In a cross-compiled environment we don't need a target gtk-doc, but a
-native gtk-doc.
-
-Upstream-Status: Backport [f3ff370d1b24f8afb51cd4e865593d5b678188a9]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-diff --git a/docs/reference/meson.build b/docs/reference/meson.build
-index c417ffecb..67c1dda56 100644
---- a/docs/reference/meson.build
-+++ b/docs/reference/meson.build
-@@ -42,7 +42,7 @@ ignore_decorators = '|'.join(ignore_decorators)
- if get_option('gtk_doc')
-   # Check we have the minimum gtk-doc version required. Older versions won't
-   # generate correct documentation.
--  dependency('gtk-doc', version : '>=1.32.1',
-+  dependency('gtk-doc', version : '>=1.32.1', native: true,
-     fallback : ['gtk-doc', 'dummy_dep'],
-     default_options : ['tests=false'])
- 
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index 95a73298d85..3e79bbf6796 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 03a069cb8066d3e8ef72a43f7b1db5c9625e9cc2 Mon Sep 17 00:00:00 2001
+From f40e89b3852df37959606ee13b1a14ade81fa886 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
@@ -13,7 +13,6 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 Port patch to 2.48
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-
 ---
  gio/giomodule.c | 7 -------
  1 file changed, 7 deletions(-)
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb
similarity index 95%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb
index 6c3e99c6411..58df7bef8fb 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb
@@ -16,13 +16,12 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
            file://0001-Switch-from-the-deprecated-distutils-module-to-the-p.patch \
            file://memory-monitor.patch \
-           file://native-gtkdoc.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \ 
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[sha256sum] = "609801dd373796e515972bf95fc0b2daa44545481ee2f465c4f204d224b2bc21"
+SRC_URI[sha256sum] = "24b8e0672dca120cc32d394bccb85844e732e04fe75d18bb0573b2dbc7548f63"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.39.2


