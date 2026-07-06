Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3E7AC4450A
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:22 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156292.1783358234757512994
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eRJtUKbM;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47afb758487so351206f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358233; x=1783963033; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hZwqwoSzSO0OcfF0AcxYyN2q7H33YnL543DJ6THmD3Y=;
        b=eRJtUKbM+Q7nLlSeU0w2LKTGFevqD+zNwJ/svL4diSr7X7QyYjJVRw+dNnPSDd0mgM
         QZ4N5ZS2KUtOMb3z5+zRPumM/JqC+Rz1BNHUY2NYMNGU2A/Trwu/ztVUifbSvase/gX1
         pDWtYY5SPcyuT9sbYYStsq8w9ZRd+WWdmhQL+NrKZau2AxFM8Etbe54DioAOooCWuTgE
         HYheJ+x9xLDk8tE7qJqkIAPiaWBOMCr87A/6kNWS8Wq/d9xqr/oEkV4Ges33xfv5ndB/
         hMXW1XYCBJDC+cTHL8vhbD679TdhSCkkmOaxsxMMMXqA7sXWUlGSFh77VbOHgVX89r1v
         CnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358233; x=1783963033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hZwqwoSzSO0OcfF0AcxYyN2q7H33YnL543DJ6THmD3Y=;
        b=DdVBP+lOpGJVviXRN1X4EN4gfijQC0mtRlUS2GQEgtGHlTKY7QJMJKRQ9PlbBjPF39
         1jfQ3dJ2Wb0qWEjftuBaUDNg/buodogIKqU8RC5n7PHze7VPx/Bc7Iym+20HXR+fEYxp
         MMWxTIt7AQb7iqwLCO01bnOnxKlAvxJ2e+gXQnEMTXMOlj7jFi1L+HKnq+DcNak4gcF3
         FaRPV7lhBUeibDLD3JpijAdfI0MpMZpWREs4F4a9A3cAaOXCoHe4T8Vc6mAZkKacgCYT
         z+HHkv7hrXwwNjYE4BG2DF8RNi6KrlPXHfdc/+cJz72BbokJiay5s85W1l/tyOuRToTl
         FPJQ==
X-Gm-Message-State: AOJu0YyPiOH93P8MOLuvJ7QqcXK6fe1nmpaxmvAct7IU8J5E8Ldwtrqa
	FP0Tp1Necp92Xqyd7wnCtLZP9JuEFnL/WVYqbvsz61pWAXT7ThlIrQg+40r+CQ==
X-Gm-Gg: AfdE7cm5OPajOWU9cyr9H9/NRnXJH4vEwu+X90aaOZwePruRZ/7g9mbn4HvDD9r3w7w
	aWTynxze1kqQaFJ4JI6CvEYXidYDabgZ7QpyUdO0SzaD9QgMoAJE+1o+wq2ga41kZ5cTSSYfKoF
	HQzMkLnI36NjnX/PVMZmDh6P31mmlwPgIumVfzKq2k7MENrcHLHP6zvn1f7CfOSubDr4clwebDx
	VlvT+h4rNejJ6n7Tf0n+VHCXq7vsMCcHrhSyrLHcQwBFS+oGMHSGcBH3rHHBjxPV9LHoLqTLQii
	ZHNdRXzyoP25Cedgi6S3gt/FLLNt2WpYngjw9CcFtrGuipKA+WKo/ArTOBK92W1gq9jd5FDyytd
	iOLtgkCg9BsdUk1dFWRmuH53MHg33qN8IVUHh0tYgojU2gDtbNRVL3OMFwgJfdWtaUP5daVow0O
	sWKMtcMN3A4rK6NjLOCg8tYE+2AiojYQC/EKFIJJc1PeeczX5Z
X-Received: by 2002:a05:600c:3514:b0:493:b7cb:c5f with SMTP id 5b1f17b1804b1-493df05f8d4mr15477675e9.11.1783358232678;
        Mon, 06 Jul 2026 10:17:12 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/45] fmt: upgrade 12.1.0 -> 12.2.0
Date: Mon,  6 Jul 2026 19:16:24 +0200
Message-ID: <20260706171701.70536-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240296

From: Alexander Kanavin <alex@linutronix.de>

License-Update: clarify presence of fmt exception:
https://github.com/fmtlib/fmt/commit/91d1aced0a846161135310249664506b4a56e196

Backport a patch to address 32 bit x86 fails (which do not have a native int128 type).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ix-fallback-uint128-bitwise-not-4813.patch | 42 +++++++++++++++++++
 ...01-Workaround-an-ABI-issue-in-spdlog.patch |  8 ++--
 .../fmt/{fmt_12.1.0.bb => fmt_12.2.0.bb}      | 10 +++--
 3 files changed, 52 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-devtools/fmt/fmt/0001-Fix-fallback-uint128-bitwise-not-4813.patch
 rename meta/recipes-devtools/fmt/{fmt_12.1.0.bb => fmt_12.2.0.bb} (60%)

diff --git a/meta/recipes-devtools/fmt/fmt/0001-Fix-fallback-uint128-bitwise-not-4813.patch b/meta/recipes-devtools/fmt/fmt/0001-Fix-fallback-uint128-bitwise-not-4813.patch
new file mode 100644
index 0000000000..ef5c6e9f82
--- /dev/null
+++ b/meta/recipes-devtools/fmt/fmt/0001-Fix-fallback-uint128-bitwise-not-4813.patch
@@ -0,0 +1,42 @@
+From d838c8c7923730afb751350ecac2b169256f1445 Mon Sep 17 00:00:00 2001
+From: Vinay Kumar <vkslog69@gmail.com>
+Date: Thu, 18 Jun 2026 12:22:12 +0530
+Subject: [PATCH] Fix fallback uint128 bitwise not (#4813)
+
+Upstream-Status: Backport [https://github.com/fmtlib/fmt/commit/588b3a0f8f6a8bcf2a959cae882d5b2703e86737]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ include/fmt/format.h | 3 +++
+ test/format-test.cc  | 5 +++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/include/fmt/format.h b/include/fmt/format.h
+index f33c8b87..ca95f6df 100644
+--- a/include/fmt/format.h
++++ b/include/fmt/format.h
+@@ -326,6 +326,9 @@ class uint128 {
+       -> uint128 {
+     return {lhs.hi_ & rhs.hi_, lhs.lo_ & rhs.lo_};
+   }
++  friend constexpr auto operator~(const uint128& n) -> uint128 {
++    return {~n.hi_, ~n.lo_};
++  }
+   friend FMT_CONSTEXPR auto operator+(const uint128& lhs, const uint128& rhs)
+       -> uint128 {
+     auto result = uint128(lhs);
+diff --git a/test/format-test.cc b/test/format-test.cc
+index 61a53c72..7e48b751 100644
+--- a/test/format-test.cc
++++ b/test/format-test.cc
+@@ -81,6 +81,11 @@ TEST(uint128_test, minus) {
+   EXPECT_EQ(n - 2, 40);
+ }
+ 
++TEST(uint128_test, bitwise_not) {
++  auto n = ~uint128(0x123456789abcdef0, 0x0fedcba987654321);
++  EXPECT_EQ(n, uint128(0xedcba9876543210f, 0xf0123456789abcde));
++}
++
+ TEST(uint128_test, plus_assign) {
+   auto n = uint128(32);
+   n += uint128(10);
diff --git a/meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-in-spdlog.patch b/meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-in-spdlog.patch
index 442506f834..afae644d49 100644
--- a/meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-in-spdlog.patch
+++ b/meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-in-spdlog.patch
@@ -1,4 +1,4 @@
-From 32f4a4a634c99d4e00cc6149786a9180ad651f76 Mon Sep 17 00:00:00 2001
+From 6ee6b54766c50ae8df9478efd91075543e89f66e Mon Sep 17 00:00:00 2001
 From: Victor Zverovich <viz@meta.com>
 Date: Sat, 22 Mar 2025 06:57:04 -0700
 Subject: [PATCH] Workaround an ABI issue in spdlog
@@ -10,10 +10,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/include/fmt/format.h b/include/fmt/format.h
-index 4a653007..82f80efd 100644
+index 5044befd..f33c8b87 100644
 --- a/include/fmt/format.h
 +++ b/include/fmt/format.h
-@@ -793,7 +793,9 @@ enum { inline_buffer_size = 500 };
+@@ -774,7 +774,9 @@ enum { inline_buffer_size = 500 };
   * converted to `std::string` with `to_string(out)`.
   */
  template <typename T, size_t SIZE = inline_buffer_size,
@@ -24,7 +24,7 @@ index 4a653007..82f80efd 100644
  class basic_memory_buffer : public detail::buffer<T> {
   private:
    T store_[SIZE];
-@@ -2746,7 +2748,7 @@ class bigint {
+@@ -2769,7 +2771,7 @@ class bigint {
    }
  
   public:
diff --git a/meta/recipes-devtools/fmt/fmt_12.1.0.bb b/meta/recipes-devtools/fmt/fmt_12.2.0.bb
similarity index 60%
rename from meta/recipes-devtools/fmt/fmt_12.1.0.bb
rename to meta/recipes-devtools/fmt/fmt_12.2.0.bb
index 22cab6f138..ca8fcb66ec 100644
--- a/meta/recipes-devtools/fmt/fmt_12.1.0.bb
+++ b/meta/recipes-devtools/fmt/fmt_12.2.0.bb
@@ -1,14 +1,16 @@
 SUMMARY = "open-source formatting library for C++"
 DESCRIPTION = "{fmt} is an open-source formatting library for C++. It can be used as a safe and fast alternative to (s)printf and iostreams."
 HOMEPAGE = "https://fmt.dev"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b9257785fc4f3803a4b71b76c1412729"
+LICENSE = "MIT-with-fmt-exception"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6ec080902ed8f82f5a97ed13e8042634 \
+                    file://doc/LICENSE-exception;md5=b9257785fc4f3803a4b71b76c1412729"
 
-SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https;tag=${PV} \
+SRC_URI = "git://github.com/fmtlib/fmt;branch=main;protocol=https;tag=${PV} \
            file://0001-Workaround-an-ABI-issue-in-spdlog.patch \
            file://run-ptest \
+           file://0001-Fix-fallback-uint128-bitwise-not-4813.patch \
            "
-SRCREV = "407c905e45ad75fc29bf0f9bb7c5c2fd3475976f"
+SRCREV = "1be298e1bd68957e4cd352e1f676f00e07dcfb57"
 
 inherit cmake ptest
 
-- 
2.47.3


