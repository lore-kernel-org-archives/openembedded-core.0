Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E944C021AA
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 07:41:28 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.14627.1739864484748024222
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 23:41:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=i5B5M0Qe;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739864485; x=1771400485;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ZsOegFKyDtqseUtttKIK1qoTFrqXF3EDMHqKRSCza9U=;
  b=i5B5M0Qe2b5+qW+Y7PTd5NH3bYRtcHNG2JhU69PcyBu6kaqP0klm+ew1
   YAC3aOH/OOo9xHEhsQmVdLfLnoz1ZPpO8qSPbl8fsRIy6l3Qrs6twyFnE
   //ydMKdzg4AA3J4JtAHCV+u5kw+Rm+7OUgMjZo44j5HAmOWhgZkH2oXsd
   ROrM9JTpjR74psEfep1G2EfO+zonoEhzPOBWKa6mWYoqRqHZSSP0LNoQu
   DgM4mROBy3DeIKgkX5oepQ2TXe9x9N9N2Ui70qKADx+H4NuSBwZ1SGTqd
   2objucgzYRNk66uKd4dS2vaEa5AP5fBPAOQSOW4TLgLg984vVdVhu+OvQ
   Q==;
X-CSE-ConnectionGUID: WyB4nHD2Rm++Cpn/413PdQ==
X-CSE-MsgGUID: GTMZqqkCTfq8SAvEGQ/ulQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="177697673"
X-IronPort-AV: E=Sophos;i="6.13,295,1732546800"; 
   d="scan'208";a="177697673"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:41:22 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D8466E428A
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9D479D50AE
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:19 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3F8641A000B;
	Tue, 18 Feb 2025 15:41:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/32] fmt: upgrade 11.1.1 -> 11.1.3
Date: Tue, 18 Feb 2025 15:39:07 +0800
Message-Id: <1739864375-21394-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211568

From: Wang Mingyu <wangmy@fujitsu.com>

fix-gcc9.patch
removed since it's included in 11.1.3

Changelog:
=========
- Fixed compilation on GCC 9.4
- Worked around an internal compiler error when using C++20 modules with GCC
  14.2 and earlier
- Worked around a bug in GCC 6
- Fixed an issue caused by instantiating 'formatter<const T>'
- Fixed formatting into 'std::ostreambuf_iterator' when using format string
  compilation
- Restored a constraint on the map formatter so that it correctly reports as
  unformattable when the element is
- Reduced the size of format specs
- Readded 'args()' to 'fmt::format_context'
- Fixed a bogus MSVC warning
- Fixed a pedantic mode error in the CMake config
- Fixed ABI compatibility with earlier 11.x versions
- Added 'wchar_t' support to the 'std::bitset' formatter
- Prefixed CMake components with 'fmt-' to simplify usage of {fmt} via
  'add_subdirectory'
- Updated docs for meson
- Fixed a compilation error in chrono on nvcc
- Fixed various warnings

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/fmt/files/fix-gcc9.patch | 26 -------------------
 .../fmt/{fmt_11.1.1.bb => fmt_11.1.3.bb}      |  5 ++--
 2 files changed, 2 insertions(+), 29 deletions(-)
 delete mode 100644 meta/recipes-devtools/fmt/files/fix-gcc9.patch
 rename meta/recipes-devtools/fmt/{fmt_11.1.1.bb => fmt_11.1.3.bb} (84%)

diff --git a/meta/recipes-devtools/fmt/files/fix-gcc9.patch b/meta/recipes-devtools/fmt/files/fix-gcc9.patch
deleted file mode 100644
index 1d67f7094d..0000000000
--- a/meta/recipes-devtools/fmt/files/fix-gcc9.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 5f0572acdca120e11f6d810765d7a6a3c593fcbb Mon Sep 17 00:00:00 2001
-From: Victor Zverovich <viz@meta.com>
-Date: Sat, 18 Jan 2025 09:00:22 -0800
-Subject: [PATCH] Workaround a compilation error on gcc 9.4
-
-Upstream-Status: Backport [5f0572acdca120e11f6d810765d7a6a3c593fcbb]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- include/fmt/format.h | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/include/fmt/format.h b/include/fmt/format.h
-index 9cd523a9e6a5..4466b4f4d24b 100644
---- a/include/fmt/format.h
-+++ b/include/fmt/format.h
-@@ -227,7 +227,9 @@ FMT_CONSTEXPR inline void abort_fuzzing_if(bool condition) {
- #if defined(FMT_USE_STRING_VIEW)
- template <typename Char> using std_string_view = std::basic_string_view<Char>;
- #else
--template <typename T> struct std_string_view {};
-+template <typename Char> struct std_string_view {
-+  operator basic_string_view<Char>() const;
-+};
- #endif
- 
- template <typename Char, Char... C> struct string_literal {
diff --git a/meta/recipes-devtools/fmt/fmt_11.1.1.bb b/meta/recipes-devtools/fmt/fmt_11.1.3.bb
similarity index 84%
rename from meta/recipes-devtools/fmt/fmt_11.1.1.bb
rename to meta/recipes-devtools/fmt/fmt_11.1.3.bb
index cfacd81a11..9a2ee396dd 100644
--- a/meta/recipes-devtools/fmt/fmt_11.1.1.bb
+++ b/meta/recipes-devtools/fmt/fmt_11.1.3.bb
@@ -4,9 +4,8 @@ HOMEPAGE = "https://fmt.dev"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b9257785fc4f3803a4b71b76c1412729"
 
-SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https \
-           file://fix-gcc9.patch"
-SRCREV = "e3ddede6c4ee818825c4e5a6dfa1d384860c27d9"
+SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https"
+SRCREV = "9cf9f38eded63e5e0fb95cd536ba51be601d7fa2"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


