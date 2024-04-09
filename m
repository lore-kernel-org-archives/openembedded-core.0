Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A13ACD129F
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 07:10:58 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.130861.1712646654990847562
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:10:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=H5MSoEJl;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1712646655; x=1744182655;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=9w09LalEnoCzKaZdq6kgq33axLXhsWFWEfrpYXdQRzQ=;
  b=H5MSoEJlzHJu7OLSms3kCXr+b6yBuyvc6CVnjhsvN3WyK5KRxzm4RnV9
   WlNNLFgN48EARYYXu6Je+J4ADE0jJ2fxcKVpoOUskTcViKHrnwkjLllXU
   Ts9e08TMC+lgaTMMmXx2/LhIFrG5zDj1N0C4CUcigstr68V7dyIsJ7Hcb
   6XLRWdq6wTHlX0IzhCBh7sehMoS+gs8ezZRhqoD9j5aTLz6szYCbKkyHm
   /wUa3dOEg/gvlfpdTyUoiro63bEi7UdbHC6nPEbnwMPHGpmxNuf4PlGO+
   kb7feK8FZGUTFIpRSISiItsHGCpu8Hep4y+CTVo9U6mazHQCsqP4vOQYg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="143011368"
X-IronPort-AV: E=Sophos;i="6.07,189,1708354800"; 
   d="scan'208";a="143011368"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:10:46 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F0AC2A2354
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:44 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id DE952E6168
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:43 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6603620097BD1
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:43 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 13EB41A0002;
	Tue,  9 Apr 2024 15:10:43 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 18/33] llvm: upgrade 18.1.2 -> 18.1.3
Date: Tue,  9 Apr 2024 15:10:05 +0800
Message-Id: <1712646620-16608-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28306.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28306.006
X-TMASE-Result: 10-3.020600-10.000000
X-TMASE-MatchedRID: Sudfee3ORQqjz0nOeth/ye6bo2/Lq3c2nJdsOLB4zv4H4DTIEE89jMEj
	oFgm7EFK+SSaqR6S8TTy/xvBdh9ijdIGVceD+uxrEzEoOqAAVLMFeeAjqMW+lyfchOGXbVQ3OZI
	W98PNU9j6jdpb6Ct634u5LnX5kwATPubnqD2XLwjy3h9RQZ4StAmWvXEqQTm5wLkNMQzGl5AUfQ
	gp6GFqhgMK9XdTA/p4dGbnxna4j51QE6ibPblV0QvBTB90+he+gYiw1ArHIduAI7Mvq/sL509xK
	/1qe6pEYW/lHr6WyzlQVmxLxqLMcBtybdvWAMHw3QqJN4m15UF9LQinZ4QefPcjNeVeWlqY+gtH
	j7OwNO2FR9Hau8GO7lHIEmonsMt8cnEMo2PNusRsP4AKwW5t/FXU2H/5yqHc3d5PgkzcJj08u5w
	vYJkrGZK8xQ2iaT7Yk9tClIA1EXHDmfHba4uSKWJbZ4D2dIMgU8mdcvbI1h2S6jzjuXTm0MTMzI
	CazP4UehYtaVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 07:10:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198047

From: Wang Mingyu <wangmy@fujitsu.com>

0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
refreshed for 18.1.3

Changelog:
============
-DFixes tsan failures for glibc's LoongArch and certain RISC-V ports when
 fstat is used.
-transform.structured.convert_to_loops now properly deletes its target op.
-Fix a llvm.usub.with.overflow.i128 wrong code generation regression that
 was introduced with LLVM 18.1.0.
-MemorySanitizer on Linux can now run even when maximum-entropy address-space
 layout randomization is configured globally
-Fixed a Clang 18.x regression which increased binary size and stack usage with
 -ftrivial-auto-var-init.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...mMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch | 6 +++---
 meta/recipes-devtools/llvm/llvm_git.bb                      | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
index 48af6fc283..a5c53b6657 100644
--- a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
+++ b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
@@ -1,4 +1,4 @@
-From 86940d87026432683fb6741cd8a34d3b9b18e40d Mon Sep 17 00:00:00 2001
+From 3b30a9bda88374e8f03bf96e972aee5bd214b98b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 27 Nov 2020 10:11:08 +0000
 Subject: [PATCH] AsmMatcherEmitter: sort ClassInfo lists by name as well
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/llvm/utils/TableGen/AsmMatcherEmitter.cpp b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-index ccf0959389b..1f801e83b7d 100644
+index 73724e662f9e..1ca9c73415db 100644
 --- a/llvm/utils/TableGen/AsmMatcherEmitter.cpp
 +++ b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-@@ -359,7 +359,10 @@ public:
+@@ -361,7 +361,10 @@ public:
      // name of a class shouldn't be significant. However, some of the backends
      // accidentally rely on this behaviour, so it will have to stay like this
      // until they are fixed.
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index e1d5fc47a1..c4fd73f2d7 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -17,14 +17,14 @@ inherit cmake pkgconfig
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
-PV = "18.1.2${VER_SUFFIX}"
+PV = "18.1.3${VER_SUFFIX}"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "26a1d6601d727a96f4301d0d8647b5a42760ae0c"
+SRCREV = "c13b7485b87909fcf739f62cfa382b55407433c0"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-- 
2.34.1


