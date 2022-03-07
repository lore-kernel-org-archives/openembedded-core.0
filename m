Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3A45C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 13:01:56 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.25861.1646658113891632984
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 05:01:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Iyq8X9zK;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646658111; i=@fujitsu.com;
	bh=N2PQnoLabBwCZuBvesAExctyWhsGziOMWNLH+BZFgEo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Iyq8X9zK7my2/ctDZQNaWY8iAGZZ0UOg7xXL56gmpIJZtgL18B2NMUOkxOThZv6T0
	 REPLQnPbYThDvGX6iK2AZ1VaCCICcfbX4wQuwEjGuvRTQJENJ1o9UffobrXXMSru1X
	 df2xk0B/qcV/VVSf0ne4innXMRvaukki7qSBV1Vqzqf2fDYerGN4ejxGHpVFFq0Hm6
	 yG9o7nGGlGZ5s2uXXEr2KeFUB+exDK4YTnYENoslM41sbOskRiNiBwa5iscF3XmJig
	 ajC+OGG7llBi9B22W0SfF2d19yJDPwlP3v3xO2AVWPMBmVhhU1GpF3EPKky5s6XZ+I
	 imUdw3iZEV31w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8ORqGvPpJZ
  ksOWPlMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmtHz/QVzwUvJit6XoQ2ME8S7GDk5hAQeM0ps
  7EzpYuQCss8zSaxaPJkZwjnOKPHuynd2kCo2ATWJ6bdusHYxcnCICOhJXP0nChJmFlCRePG7B
  6xEWMBK4vvVk4wgJSxA8dMbskBMXgEnif/zakEqJAQUJKY8fM8MYvMKCEqcnPmEBWKKhMTBFy
  +YIWoUJWZfbmaBsCskZs1qY4Kw1SSuntvEPIGRfxaS9llI2hcwMq1itEsqykzPKMlNzMzRNTQ
  w0DU0NNU1N9Q1tDTQS6zSTdRLLdVNTs0rKUoESusllhfrpRYX6xVX5ibnpOjlpZZsYgQGZUqx
  +74djC/6fuodYpTkYFIS5b3+VzVJiC8pP6UyI7E4I76oNCe1+BCjDAeHkgQvP4NakpBgUWp6a
  kVaZg4wQmDSEhw8SiK8IV+AWnmLCxJzizPTIVKnGBWlxHkVGIH6BEASGaV5cG2wqLzEKCslzM
  vIwMAgxFOQWpSbWYIq/4pRnINRSZiXC2QKT2ZeCdz0V0CLmYAWV9kqgSwuSURISTUwbVTdXV+
  yU8XMX/36n36v/TGyS8rZ507c9d9Vws5htsdqq1elbKl3cq7lvFaRKSl1Nrz52eYlx/YHHmdv
  3Ih+de5G4p73NnfXWZzYe8VrWXUSr5T9S8OtrRWBq7caFX6uWxSXJhNyx4hpOV8M/x13ZbZzB
  W/fBDJ7FWlt3fHF2+v0/x8alTUun16EmDe5x3423MEbYN4oGz9/xaQ5K3k/SO4oimgw27CjJ7
  jSJ7k+e+eHAw0Lj51lm5weYrL1rv3pTrGTvf/YYxqsOq86lLiqaql7f2sIXeY85fmNkJ0Ot9f
  fSstNs5+cf0i6r67qUHSYjuOzPzNX/S/h9ClwX+Gc0PVNoOuirG+Tytbn6SVKLMUZiYZazEXF
  iQDw1tvoRQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-528.messagelabs.com!1646658111!30789!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21712 invoked from network); 7 Mar 2022 13:01:51 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Mar 2022 13:01:51 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id D7222100189
	for <openembedded-core@lists.openembedded.org>;
 Mon,  7 Mar 2022 13:01:50 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id CA984100183
	for <openembedded-core@lists.openembedded.org>;
 Mon,  7 Mar 2022 13:01:50 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 7 Mar 2022 13:01:31 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] cmake: upgrade 3.22.2 -> 3.22.3
Date: Mon, 7 Mar 2022 21:01:22 +0800
Message-ID: <1646658082-56264-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 13:01:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162816

refresh 0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch

Changelog:
==========
* The :command:'while' command again ignores errors in condition evaluation
  as CMake 3.21 and below did.  This bug was fixed in 3.22.0, but exposed
  errors in existing projects.  The fix has been reverted to restore
  compatibility.  The fix may be restored in a future version of CMake
  via a policy.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{cmake-native_3.22.2.bb => cmake-native_3.22.3.bb}      | 0
 meta/recipes-devtools/cmake/cmake.inc                       | 2 +-
 ...akeDetermineSystem-use-oe-environment-vars-to-load.patch | 6 +++---
 .../cmake/{cmake_3.22.2.bb => cmake_3.22.3.bb}              | 0
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.22.2.bb => cmake-native_3.22.3.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.22.2.bb => cmake_3.22.3.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.22.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.22.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.22.2.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.22.3.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index a8bd4311c4..d500321138 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[sha256sum] = "3c1c478b9650b107d452c5bd545c72e2fad4e37c09b89a1984b9a2f46df6aced"
+SRC_URI[sha256sum] = "9f8469166f94553b6978a16ee29227ec49a2eb5ceb608275dec40d8ae0d1b5a0"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
index 9609f5f7c2..9a2287f517 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
@@ -1,4 +1,4 @@
-From e75f76b00cc9c1cfc231c5e731e975552f5dd13e Mon Sep 17 00:00:00 2001
+From 89f6c846f02ad6d30b9ebb7eaaaa4fb6f9cec054 Mon Sep 17 00:00:00 2001
 From: Cody P Schafer <dev@codyps.com>
 Date: Thu, 27 Apr 2017 11:35:05 -0400
 Subject: [PATCH] CMakeDetermineSystem: use oe environment vars to load default
@@ -25,10 +25,10 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  1 file changed, 7 insertions(+)
 
 diff --git a/Modules/CMakeDetermineSystem.cmake b/Modules/CMakeDetermineSystem.cmake
-index bae270de..5bb6bc0d 100644
+index 8c7af067..ade2b189 100644
 --- a/Modules/CMakeDetermineSystem.cmake
 +++ b/Modules/CMakeDetermineSystem.cmake
-@@ -111,6 +111,13 @@ else()
+@@ -112,6 +112,13 @@ else()
    endif()
  endif()
  
diff --git a/meta/recipes-devtools/cmake/cmake_3.22.2.bb b/meta/recipes-devtools/cmake/cmake_3.22.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.22.2.bb
rename to meta/recipes-devtools/cmake/cmake_3.22.3.bb
-- 
2.25.1


