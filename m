Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B06F2C64EBE
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:01 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.38689.1650283869312374866
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 05:11:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=K9udJznW;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650283867; i=@fujitsu.com;
	bh=wKun6XqX3JjJzhB1boz02U4phvD19J5r0mnhvQ2Xeng=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=K9udJznWAd6lc8SlmJa8yiJnI5f2MnOAa4jeRbyAVocwsdXq19HdvApb0Iqyr8Gnv
	 ToFCQQgHexJYb6xG1OAyANmLWpu/NW5VLAterba3aa5qnSfZCEVTDSwZGZdJq6AyLw
	 VYls26X7/HclD36DIyik1aYj1yjyV167CHTMJvnofCwXNlmz7/DdTxEAIcIaafpr+q
	 VDk3CuP1etsRO+ExvnMQ+bzt+tS9hhh9DWNsXkWJu3qTrV0KCW3zXozystmNys9cRc
	 fzeOm407Wwbpc52QLsn9IfxoAUtGdu72MSKq5wG9g2o2OUxOqmpob280zqq6V2zxku
	 OoULiRv8tl2GQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MxRTcqNDb
  JYE2rvsWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmjG1aTJjQYd2RcfzM4wNjE/Uuhi5OIQEZjFJ
  LHjwnRXC2cMocWHBSeYuRk4ONgE1iem3bgAlODhEBPQkrv4TBQkzC6hIvPjdww5iCwtYSXx4s
  pYNxGYRUJW4+/E2WJxXwEni55QOFhBbQkBBYsrD98wQcUGJkzOfsEDMkZA4+OIFM0SNosTsy8
  1Q9RUSs2a1MU1g5J2FpGUWkpYFjEyrGO2SijLTM0pyEzNzdA0NDHQNDU11zcx0DS0N9RKrdBP
  1Ukt1k1PzSooSgdJ6ieXFeqnFxXrFlbnJOSl6eaklmxiBoZZS7LR/B+PTvp96hxglOZiURHn/
  +8YmCfEl5adUZiQWZ8QXleakFh9ilOHgUJLgbQkAygkWpaanVqRl5gDDHiYtwcGjJMLLEQiU5
  i0uSMwtzkyHSJ1iNObYueXyXmaOq1eu7GUWYsnLz0uVEud9EgxUKgBSmlGaBzcIFo+XGGWlhH
  kZGRgYhHgKUotyM0tQ5V8xinMwKgnzioYATeHJzCuB2/cK6BQmoFO2z48EOaUkESEl1cC0QfQ
  V377bZmcEytpfnGy9PH91U2vysp7TT0u9o/bsWLPXXXtRpcI5lvmuMy+45f1zsr104UMac96l
  v4sO71nBvPuAycV7pw9Ges09y/smgfns7p6XSzzP+/+6zfJeiDPS4Xro3cJHnTcfPbidxrn8I
  VdanOWXuJmCRyxkSyPT/K/MsBfpEcl1W7pOeFvRecuE2MM7Ci0v7ahoKVG/wZvtufiQfvolXz
  1bM53AcD+9zq+cmo3ieqv2upQmvzy2i4fNU6ximuFmEYm194wfp88/UWFsv+XZuQ0VuhXXXS6
  +KLvSLeLgGudw+3a79oWou3KBugKNQpk/7C6c2uPnmyeuPHnyqe6qd7MnTq/fudZciaU4I9FQ
  i7moOBEAQD8t0UIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-528.messagelabs.com!1650283866!236400!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21536 invoked from network); 18 Apr 2022 12:11:06 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-21.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 18 Apr 2022 12:11:06 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23ICB3Sd030835
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 13:11:06 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 18 Apr 2022 13:11:02 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] boost: upgrade 1.78.0 -> 1.79.0
Date: Mon, 18 Apr 2022 20:10:52 +0800
Message-ID: <1650283855-16427-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164586

0001-futex-fix-build-on-32-bit-architectures-using-64-bit.patch
de657e01635306085488290ea83de541ec393f8b.patch
removed since they're included in 1.79.0

Changelog:
https://www.boost.org/users/history/version_1_79_0.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{boost-1.78.0.inc => boost-1.79.0.inc}    |  2 +-
 ...on-32-bit-architectures-using-64-bit.patch | 36 -------------------
 ...7e01635306085488290ea83de541ec393f8b.patch | 30 ----------------
 .../{boost_1.78.0.bb => boost_1.79.0.bb}      |  2 --
 4 files changed, 1 insertion(+), 69 deletions(-)
 rename meta/recipes-support/boost/{boost-1.78.0.inc => boost-1.79.0.inc} (90%)
 delete mode 100644 meta/recipes-support/boost/boost/0001-futex-fix-build-on-32-bit-architectures-using-64-bit.patch
 delete mode 100644 meta/recipes-support/boost/boost/de657e01635306085488290ea83de541ec393f8b.patch
 rename meta/recipes-support/boost/{boost_1.78.0.bb => boost_1.79.0.bb} (67%)

diff --git a/meta/recipes-support/boost/boost-1.78.0.inc b/meta/recipes-support/boost/boost-1.79.0.inc
similarity index 90%
rename from meta/recipes-support/boost/boost-1.78.0.inc
rename to meta/recipes-support/boost/boost-1.79.0.inc
index 729a47b54f..f90c463931 100644
--- a/meta/recipes-support/boost/boost-1.78.0.inc
+++ b/meta/recipes-support/boost/boost-1.79.0.inc
@@ -12,7 +12,7 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "https://boostorg.jfrog.io/artifactory/main/release/${PV}/source/${BOOST_P}.tar.bz2"
-SRC_URI[sha256sum] = "8681f175d4bdb26c52222665793eef08490d7758529330f98d3b29dd0735bccc"
+SRC_URI[sha256sum] = "475d589d51a7f8b3ba2ba4eda022b170e562ca3b760ee922c146b6c65856ef39"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "release/(?P<pver>.*)/source/"
diff --git a/meta/recipes-support/boost/boost/0001-futex-fix-build-on-32-bit-architectures-using-64-bit.patch b/meta/recipes-support/boost/boost/0001-futex-fix-build-on-32-bit-architectures-using-64-bit.patch
deleted file mode 100644
index 20dc3ca54e..0000000000
--- a/meta/recipes-support/boost/boost/0001-futex-fix-build-on-32-bit-architectures-using-64-bit.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From b15d8d0754bb545ba10d0cfba8bbfdfb22a62c38 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 20 Feb 2022 22:03:14 -0800
-Subject: [PATCH] futex: fix build on 32-bit architectures using 64-bit time_t
-
-Fix the following build failure on 32-bit architectures using 64-bit
-time_t (e.g. riscv32):
-| ./boost/fiber/detail/futex.hpp:31:23: error: use of undeclared identifier 'SYS_futex'
-|     return ::syscall( SYS_futex, addr, op, x, nullptr, nullptr, 0);
-|                       ^
-| 1 error generated.
-
-Upstream-Status: Submitted [https://github.com/boostorg/fiber/pull/292]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- boost/fiber/detail/futex.hpp | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/boost/fiber/detail/futex.hpp b/boost/fiber/detail/futex.hpp
-index e64bd5990..d0353e9e5 100644
---- a/boost/fiber/detail/futex.hpp
-+++ b/boost/fiber/detail/futex.hpp
-@@ -12,6 +12,10 @@
- 
- #include <boost/fiber/detail/config.hpp>
- 
-+#ifndef SYS_futex
-+#define SYS_futex SYS_futex_time64
-+#endif
-+
- #if BOOST_OS_LINUX
- extern "C" {
- #include <linux/futex.h>
--- 
-2.35.1
-
diff --git a/meta/recipes-support/boost/boost/de657e01635306085488290ea83de541ec393f8b.patch b/meta/recipes-support/boost/boost/de657e01635306085488290ea83de541ec393f8b.patch
deleted file mode 100644
index 867ec03ba6..0000000000
--- a/meta/recipes-support/boost/boost/de657e01635306085488290ea83de541ec393f8b.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From de657e01635306085488290ea83de541ec393f8b Mon Sep 17 00:00:00 2001
-From: Leonardo Neumann <leonardo@neumann.dev.br>
-Date: Mon, 13 Dec 2021 01:07:20 -0300
-Subject: [PATCH] Fix missing sys/stat.h include on musl-based systems
-
-Boost 1.78.0 fails to build on musl-based systems because musl does
-not include sys/stat.h by default.
-
-Fixes #161 ("Boost compiler error")
-Upstream-Status: Submitted [https://github.com/boostorg/interprocess/pull/162]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- include/boost/interprocess/permissions.hpp | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/boost/interprocess/permissions.hpp b/boost/interprocess/permissions.hpp
-index ab55411e..0b21a685 100644
---- a/boost/interprocess/permissions.hpp
-+++ b/boost/interprocess/permissions.hpp
-@@ -29,6 +29,10 @@
- 
- #include <boost/interprocess/detail/win32_api.hpp>
- 
-+#else
-+
-+#include <sys/stat.h>
-+
- #endif
- 
- #endif   //#ifndef BOOST_INTERPROCESS_DOXYGEN_INVOKED
diff --git a/meta/recipes-support/boost/boost_1.78.0.bb b/meta/recipes-support/boost/boost_1.79.0.bb
similarity index 67%
rename from meta/recipes-support/boost/boost_1.78.0.bb
rename to meta/recipes-support/boost/boost_1.79.0.bb
index 58be9dcf12..dd5d6eadd6 100644
--- a/meta/recipes-support/boost/boost_1.78.0.bb
+++ b/meta/recipes-support/boost/boost_1.79.0.bb
@@ -5,6 +5,4 @@ SRC_URI += "file://boost-CVE-2012-2677.patch \
            file://boost-math-disable-pch-for-gcc.patch \
            file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
            file://0001-dont-setup-compiler-flags-m32-m64.patch \
-           file://de657e01635306085488290ea83de541ec393f8b.patch \
-           file://0001-futex-fix-build-on-32-bit-architectures-using-64-bit.patch \
            "
-- 
2.25.1


