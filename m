Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E4DC3ABD7
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:02 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.45968.1747040637466043731
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=O9bu0Nu3;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040639; x=1778576639;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7yPbXDpRz+Spt3tMP1AY768x8P0bLRit1FNCLaT37SQ=;
  b=O9bu0Nu3zvwMY6pFiZjs7MWlJouLPO8+rtK7Ob6Vi/qNaqbBME628QCO
   X3WBXlJYrHdLeOhDj41QNf5FyOHIse/uLf4PRWjPyzaI02b5b+xS9wzSx
   r53M0zeVALi7219s+n+5+M4uqoklPxVjbQ/VqJb0WbEhh4IbEict3i8id
   05eulEhN63LE0uLDYq+ezWaqjU49bcbViys2xV4jIRDVpK17xn6K0PoKf
   o+NIWJLToi5jVg5M1wxnQqJsIrFH4KplAYL57/afRWjV3w21fQsN6M8pB
   kRONV48AsMKXRftmfQAWenslFqgAkQXsKeLqGdO+aPoE39ySjOTTXyDNn
   w==;
X-CSE-ConnectionGUID: RTL47uDSScqtyB2i/kCkgA==
X-CSE-MsgGUID: uGjtosw1RkShw1YWu4Dzjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="187121895"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="187121895"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:03:57 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id F19BCD5059
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B05BED5045
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:55 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 49ABE1A009A;
	Mon, 12 May 2025 17:03:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 14/56] fmt: upgrade 11.1.4 -> 11.2.0
Date: Mon, 12 May 2025 17:02:57 +0800
Message-Id: <1747040619-7566-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216308

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Added the 's' specifier for 'std::error_code'. It allows formatting an error
  message as a string.
- Fixed formatting of 'std::chrono::local_time' and 'tm'
- Added diagnostics for cases when timezone information is not available.
- Deprecated 'fmt::localtime' in favor of 'std::localtime'.
- Fixed compilation with GCC 15 and C++20 modules enabled
- Fixed handling of named arguments in format specs
- Added error reporting for duplicate named arguments
- Fixed formatting of 'long' with 'FMT_BUILTIN_TYPES=0'
- Optimized 'text_style' using bit packing
- Added support for incomplete types
- Fixed a flush issue in 'fmt::print' when using libstdc++
- Fixed 'fmt::println' usage with 'FMT_ENFORCE_COMPILE_STRING' and legacy
- Removed legacy header 'fmt/core.h' from docs
- Worked around limitations of '__builtin_strlen' during constant evaluation
- Worked around a bug in MSVC v141
- Removed the 'fmt_detail' namespace
- Removed specializations of 'std::is_floating_point' in tests
- Fixed a CMake error when setting 'CMAKE_MODULE_PATH' in the pedantic mode
- Updated the Bazel config

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/fmt/{fmt_11.1.4.bb => fmt_11.2.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/fmt/{fmt_11.1.4.bb => fmt_11.2.0.bb} (89%)

diff --git a/meta/recipes-devtools/fmt/fmt_11.1.4.bb b/meta/recipes-devtools/fmt/fmt_11.2.0.bb
similarity index 89%
rename from meta/recipes-devtools/fmt/fmt_11.1.4.bb
rename to meta/recipes-devtools/fmt/fmt_11.2.0.bb
index 1bcf758fd9..b2b8c575c8 100644
--- a/meta/recipes-devtools/fmt/fmt_11.1.4.bb
+++ b/meta/recipes-devtools/fmt/fmt_11.2.0.bb
@@ -4,9 +4,9 @@ HOMEPAGE = "https://fmt.dev"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b9257785fc4f3803a4b71b76c1412729"
 
-SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https \
+SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https;tag=${PV}\
            file://0001-Workaround-an-ABI-issue-in-spdlog.patch"
-SRCREV = "123913715afeb8a437e6388b4473fcc4753e1c9a"
+SRCREV = "40626af88bd7df9a5fb80be7b25ac85b122d6c21"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


