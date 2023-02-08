Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D1EBC636CC
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:21:54 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.3125.1675840909917555521
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:21:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qc5vtZsS;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso716844wms.5
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O7vWQMVMiRWQPgdTGpz7jpbP2caDhyxsIAUG76N4j5Q=;
        b=qc5vtZsSWxfz2ifsywoEV4RaU04PusYXv6COy8cHfE0jLh+kbTCTkfG3A/e5vFHuJo
         MIZ0zIYpCf9eEqwEKbUZcYovPGN+DnTXt/fh4GY0N0qIHlNp1WQGwoLf8TS8evVpFj/u
         ERtGrcRaaZ5VKaDAKIC9n/9F1PSbqp441KapXj371viozQbDt23QgnoESjXPuzGUS9Np
         GIEUMzG0+I6LrAcFCB9i0/cMj0w5Z8iYu6FLtzJKMd5w6YbqNUenQUOJb7RuTy8NjoKE
         YfwG50ai/BWCOm+/y+2IhXIvJ8D5P7geJi9PgyjOEg+eX3BXduw3nmyW5mxaRt6jFO2n
         sUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O7vWQMVMiRWQPgdTGpz7jpbP2caDhyxsIAUG76N4j5Q=;
        b=yGCmcAVNFY+BiMTDgWFe8em3/vJZleLqbPqc+pLvvkn6yc0bOq4yGzoP4qvNPkpPDQ
         6kl7bDWvRgbRdA48oj1kjSwpH6itYB1Y8PKgN6LYcgsOEPXdAbajscQPJ3psdf5ojXRT
         XLS+tkC4cP9hrvfAZvxKRenuLdmmygK1NAxEnfoMcjjzO1FyvEtpMAmom5x6mXjfnXup
         +3S3vATHXv8xkHvQl54bqD0JUXZ5tRa0TOgpIodAoUvD7nbaeAcVgsyDPLJ7Nwkpo9qh
         dOmFbWMVwRu4T9YgnO31t1HeUtiPRo3jrPXoksHWENTctDKqaFKRSDgo5Q1glUuwXca0
         76bw==
X-Gm-Message-State: AO0yUKVefGuTcv9sg/gyzKPmn2PXR1MVvFoczG62sC5pG8KuCTib5mzF
	mIOwoInAfmBCA8eRE8yju+RJDi2zDkE=
X-Google-Smtp-Source: AK7set+Iqx97jty3/jAXhkp9AEdAVrPusH/xU4gRX9GPXKd1GT6yCnQYIZNcNuWFX7PIVw6inIHJ1A==
X-Received: by 2002:a05:600c:16c5:b0:3d6:ecc4:6279 with SMTP id l5-20020a05600c16c500b003d6ecc46279mr5643792wmn.27.1675840907964;
        Tue, 07 Feb 2023 23:21:47 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:21:47 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/52] ifupdown: update 0.8.43 -> 0.8.41
Date: Wed,  8 Feb 2023 08:20:52 +0100
Message-Id: <20230208072143.2930292-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:21:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176841

Do not apply patch conditionally, there is no need for that,
and conditional patches are problematic with upgrades and devtool.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Define-FNM_EXTMATCH-for-musl.patch   |  8 +++-----
 ...not-use-dpkg-for-determining-OS-type.patch |  3 ++-
 .../0001-ifupdown-skip-wrong-test-case.patch  | 12 +++++-------
 ...t-rely-on-dpkg-architecture-to-set-a.patch | 10 ++++------
 .../ifupdown/files/tweak-ptest-script.patch   | 19 +++++++++++--------
 ...{ifupdown_0.8.39.bb => ifupdown_0.8.41.bb} |  8 ++++----
 6 files changed, 29 insertions(+), 31 deletions(-)
 rename meta/recipes-core/ifupdown/{ifupdown_0.8.39.bb => ifupdown_0.8.41.bb} (92%)

diff --git a/meta/recipes-core/ifupdown/files/0001-Define-FNM_EXTMATCH-for-musl.patch b/meta/recipes-core/ifupdown/files/0001-Define-FNM_EXTMATCH-for-musl.patch
index 7bf02ea536..6c4ed526bf 100644
--- a/meta/recipes-core/ifupdown/files/0001-Define-FNM_EXTMATCH-for-musl.patch
+++ b/meta/recipes-core/ifupdown/files/0001-Define-FNM_EXTMATCH-for-musl.patch
@@ -1,4 +1,4 @@
-From ff714d6461569d69b253089110ec659e4ebec248 Mon Sep 17 00:00:00 2001
+From 8dfbcf02e424ba1fdef587d81c9e08a37ab8c1b6 Mon Sep 17 00:00:00 2001
 From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
 Date: Tue, 2 Jul 2019 20:10:42 +0200
 Subject: [PATCH] Define FNM_EXTMATCH for musl
@@ -24,12 +24,13 @@ function); did you mean 'FNM_NOMATCH'?
 Upstream-Status: Submitted [https://salsa.debian.org/debian/ifupdown/merge_requests/5]
 
 Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
+
 ---
  archcommon.h | 4 ++++
  1 file changed, 4 insertions(+)
 
 diff --git a/archcommon.h b/archcommon.h
-index fe99950..f257f9d 100644
+index 818b0b6..ad9cd1a 100644
 --- a/archcommon.h
 +++ b/archcommon.h
 @@ -1,5 +1,9 @@
@@ -42,6 +43,3 @@ index fe99950..f257f9d 100644
  bool execable(const char *);
  
  #define iface_is_link() (!_iface_has(ifd->real_iface, ":."))
--- 
-2.17.1
-
diff --git a/meta/recipes-core/ifupdown/files/0001-Makefile-do-not-use-dpkg-for-determining-OS-type.patch b/meta/recipes-core/ifupdown/files/0001-Makefile-do-not-use-dpkg-for-determining-OS-type.patch
index 57c8d04fd7..6e15a25224 100644
--- a/meta/recipes-core/ifupdown/files/0001-Makefile-do-not-use-dpkg-for-determining-OS-type.patch
+++ b/meta/recipes-core/ifupdown/files/0001-Makefile-do-not-use-dpkg-for-determining-OS-type.patch
@@ -1,10 +1,11 @@
-From 7ace0656bd325f9e7749f2cde641eddc057bc98a Mon Sep 17 00:00:00 2001
+From 7fe516cbaf9fda09d99dcb54d4645367cffc8a4d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 9 Jan 2020 15:38:06 +0100
 Subject: [PATCH] Makefile: do not use dpkg for determining OS type
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-core/ifupdown/files/0001-ifupdown-skip-wrong-test-case.patch b/meta/recipes-core/ifupdown/files/0001-ifupdown-skip-wrong-test-case.patch
index c751e4fab0..9ae24da51e 100644
--- a/meta/recipes-core/ifupdown/files/0001-ifupdown-skip-wrong-test-case.patch
+++ b/meta/recipes-core/ifupdown/files/0001-ifupdown-skip-wrong-test-case.patch
@@ -1,4 +1,4 @@
-From 98243deface88614e3f332c4a85d04a9abce55ff Mon Sep 17 00:00:00 2001
+From 782d8a869c266820d0f34974436f244f67afaea7 Mon Sep 17 00:00:00 2001
 From: Zqiang <qiang.zhang@windriver.com>
 Date: Mon, 19 Apr 2021 14:15:45 +0800
 Subject: [PATCH] ifupdown: skip wrong test case
@@ -10,23 +10,21 @@ and are skipped directly.
 Upstream-Status: Inappropriate [oe-core specific]
 
 Signed-off-by: Zqiang <qiang.zhang@windriver.com>
+
 ---
  tests/testbuild-linux | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/testbuild-linux b/tests/testbuild-linux
-index 1181ea0..5f148eb 100755
+index 2fa1b8b..2c69856 100755
 --- a/tests/testbuild-linux
 +++ b/tests/testbuild-linux
 @@ -3,7 +3,7 @@
  dir=tests/linux
  
  result=true
--for test in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18; do
-+for test in 1 2 3 4 5 6 7 8 9 10 11 16 17 18; do
+-for test in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19; do
++for test in 1 2 3 4 5 6 7 8 9 10 11 16 17 18 19; do
  	if [ -e $dir/testcase.$test ]; then
  		args="$(cat $dir/testcase.$test | sed -n 's/^# RUN: //p')"
  	else
--- 
-2.17.1
-
diff --git a/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch b/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch
index d1c3d260ed..7b4b761e6a 100644
--- a/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch
+++ b/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch
@@ -1,7 +1,7 @@
-From 40257d65b338b6e2ed9d89d6fa7c7b8701a4c311 Mon Sep 17 00:00:00 2001
+From fc8e8d4cb19ff30e69aa1855332544f1017f974c Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Wed, 6 Aug 2014 14:54:12 -0400
-Subject: [PATCH 1/2] defn2[c|man]: don't rely on dpkg-architecture to set arch
+Subject: [PATCH] defn2[c|man]: don't rely on dpkg-architecture to set arch
 
 In yocto we'll always be cross compiling, and we'll always
 be building on linux for linux (vs. *BSD, hurd, etc.)
@@ -13,13 +13,14 @@ like the loopback device not being configured/enabled.
 
 Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
 Upstream-Status: Pending
+
 ---
  defn2c.pl   | 6 +++---
  defn2man.pl | 6 +++---
  2 files changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/defn2c.pl b/defn2c.pl
-index 8798dc2..f2551c7 100755
+index fa7a02e..bb4987d 100755
 --- a/defn2c.pl
 +++ b/defn2c.pl
 @@ -2,9 +2,9 @@
@@ -52,6 +53,3 @@ index 6ddcfdd..c9c4dd0 100755
  
  # declarations
  my $line;
--- 
-2.17.1
-
diff --git a/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch b/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch
index ea88a9086a..fa6bb84df3 100644
--- a/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch
+++ b/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch
@@ -1,14 +1,19 @@
-Tweak tests of ifupdown to make it work with oe-core ptest framework.
+From a6bb2ac5f521c678abbbdb1960d28f750f4357a6 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Mon, 3 Feb 2020 17:33:11 +0800
+Subject: [PATCH] Tweak tests of ifupdown to make it work with oe-core ptest
+ framework.
 
 Upstream-Status: Inappropriate [oe-core specific]
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
 ---
  tests/testbuild-linux | 11 ++++++-----
  1 file changed, 6 insertions(+), 5 deletions(-)
 
 diff --git a/tests/testbuild-linux b/tests/testbuild-linux
-index 5f148eb..d9b1698 100755
+index 2c69856..05f0703 100755
 --- a/tests/testbuild-linux
 +++ b/tests/testbuild-linux
 @@ -1,6 +1,7 @@
@@ -19,8 +24,8 @@ index 5f148eb..d9b1698 100755
 +dir=$curdir/linux
  
  result=true
- for test in 1 2 3 4 5 6 7 8 9 10 11 16 17 18; do
-@@ -12,7 +13,7 @@ for test in 1 2 3 4 5 6 7 8 9 10 11 16 17 18; do
+ for test in 1 2 3 4 5 6 7 8 9 10 11 16 17 18 19; do
+@@ -12,7 +13,7 @@ for test in 1 2 3 4 5 6 7 8 9 10 11 16 17 18 19; do
          echo "Testcase $test: $args"
  
  	exitcode=0
@@ -29,7 +34,7 @@ index 5f148eb..d9b1698 100755
                  >$dir/up-res-out.$test 2>$dir/up-res-err.$test || exitcode=$?
  
          (echo "exit code: $exitcode";
-@@ -20,7 +21,7 @@ for test in 1 2 3 4 5 6 7 8 9 10 11 16 17 18; do
+@@ -20,7 +21,7 @@ for test in 1 2 3 4 5 6 7 8 9 10 11 16 17 18 19; do
           echo "====stderr===="; cat $dir/up-res-err.$test) > $dir/up-res.$test
  
  	exitcode=0
@@ -38,7 +43,7 @@ index 5f148eb..d9b1698 100755
                 >$dir/down-res-out.$test 2>$dir/down-res-err.$test || exitcode=$?
  
          (echo "exit code: $exitcode";
-@@ -28,9 +29,9 @@ for test in 1 2 3 4 5 6 7 8 9 10 11 16 17 18; do
+@@ -28,9 +29,9 @@ for test in 1 2 3 4 5 6 7 8 9 10 11 16 17 18 19; do
           echo "====stderr===="; cat $dir/down-res-err.$test) > $dir/down-res.$test
  
          if diff -ub $dir/up.$test $dir/up-res.$test && diff -ub $dir/down.$test $dir/down-res.$test; then
@@ -50,5 +55,3 @@ index 5f148eb..d9b1698 100755
                  result=false
          fi
          echo "=========="
---
-2.17.1
diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.39.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.41.bb
similarity index 92%
rename from meta/recipes-core/ifupdown/ifupdown_0.8.39.bb
rename to meta/recipes-core/ifupdown/ifupdown_0.8.41.bb
index 7096bc94d7..5dbd6193b8 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.39.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.41.bb
@@ -8,15 +8,15 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https;branch=master \
-           file://defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch \
            file://99_network \
+           file://run-ptest \
            file://0001-Define-FNM_EXTMATCH-for-musl.patch \
            file://0001-Makefile-do-not-use-dpkg-for-determining-OS-type.patch \
-           file://run-ptest \
            file://0001-ifupdown-skip-wrong-test-case.patch \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'file://tweak-ptest-script.patch', '', d)} \
+           file://defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch \
+           file://tweak-ptest-script.patch \
            "
-SRCREV = "be91dd267b4a8db502a6bbf5758563f7048b8078"
+SRCREV = "369d9d3c13a0c56ad09fd4f13b4a80eb9a94e270"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


