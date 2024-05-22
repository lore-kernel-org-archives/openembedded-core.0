Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A53D1C27C6E
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:16:01 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.5646.1716369339336930463
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=E8WPrQz/;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369339; x=1747905339;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=LUEBKVpKJxpTeO877aqLBXU9zXAzuEeoWFR5GeffdWY=;
  b=E8WPrQz/iOCJlyZ3ntX569MTtF9xOf2rp6dh+Z+uU1npUY4tAf8yUD1j
   qJOJDU8ZTV7QyIhghm7ZIBCb8uArlGRRJGeJo0IWfSAIggM6T5UG7xvK5
   9dkD5jlEYFA4ps+yqlxAJz5be5X1zgRXM0+PG+OXwL/AIamMxB/H53//H
   FpxxDCLjDEUD8JWs3BbtqRIlH7Tine5M+dhj+GSkgNTDazFUwGIkQWQSl
   CeMGwHWN2QxxAXonHX6kANvuyeOQ9Cq4Dz3GvpbrVsctGDfpt9iqcBw7e
   tKkavQ+EUv3+X7RKupXIcSYNUthFLtYGPFGOo8HRKTdF6pFGuz6WmAlw0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="138358183"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="138358183"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:36 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id D75FBD29F6
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:34 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 13138D530A
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9E9FF21D01D
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4B10F1A000B;
	Wed, 22 May 2024 17:15:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 24/42] llvm: upgrade 18.1.5 -> 18.1.6
Date: Wed, 22 May 2024 17:14:31 +0800
Message-Id: <1716369289-22526-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10-4.381400-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yUIIxwDaU5mrG24YVeuZGmPfKapXkCLRBTNV
	+wj8Pzk/90A/B/ncx159+b2UAY3sBlGkPFPB4CMJgd/NYmefR6iTjlc0Xf11TlcZNuxCoduS7yS
	RrJJClQtsUGY2Uh/STlR2OE7gJsUjnuCGum6P72L8dMpK2wMYwnIa+KQSxiLwB/FMznsE8cO/BR
	68O365bn9eOltIlLtrNBSSiEcvHFps0AdMQbxPpepx23gbuS5505SDu2UGfe8V7J/IpF+hrQOiV
	FpF7nSJfwBiuMCJwTJ5OPD8XJFfpB8TzIzimOwPC24oEZ6SpSmcfuxsiY4QFLMlOhe423JX8e1X
	VWHBjvfTHh8J5P7ZLTaeVzTgiuyKWLmTbycc/wKOf9sDDqDUB1tACnLdT21kJVZqpB0Y8H7dOb4
	CTsGJY+x9n1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199722

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fixes issues where LLVM is either generating the incorrect thunk for a
  function with aligned parameters or didn't correctly pass through the
  return value when StructRet was used.
- -Xclang -target-feature -Xclang +unaligned-scalar-mem can be used to enable
  unaligned scalar memory accesses for CPUs that do not support unaligned
  vector accesses. -mno-strict-align will enable unaligned scalar and vector
  memory accesses.
- Don't replace an aliasee with an alias that has weak linkage. This avoids
  incorrect linkage that can lead to using the wrong symbols during linking time.
- This patch fixes build failures when compiling AVX512 code using
  -march=native on machines without AVX512.
- Fixes crash in AArch64 backend when having true or false as operand for a
  fcmp instruction on IR level.
- Fixes compiler crash when user specifies -mno-evex512 with AVX512 features
  but no AVX512VL.
- Fixes a bug that tries to do VBROADCAST_LOAD for f16 without AVX2.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/llvm/{llvm_18.1.5.bb => llvm_18.1.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/llvm/{llvm_18.1.5.bb => llvm_18.1.6.bb} (98%)

diff --git a/meta/recipes-devtools/llvm/llvm_18.1.5.bb b/meta/recipes-devtools/llvm/llvm_18.1.6.bb
similarity index 98%
rename from meta/recipes-devtools/llvm/llvm_18.1.5.bb
rename to meta/recipes-devtools/llvm/llvm_18.1.6.bb
index 9c80b46b60..189f5b1146 100644
--- a/meta/recipes-devtools/llvm/llvm_18.1.5.bb
+++ b/meta/recipes-devtools/llvm/llvm_18.1.6.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
            file://llvm-config \
            "
-SRC_URI[sha256sum] = "3591a52761a7d390ede51af01ea73abfecc4b1d16445f9d019b67a57edd7de56"
+SRC_URI[sha256sum] = "bd4b4cb6374bcd5fc5a3ba60cb80425d29da34f316b8821abc12c0db225cf6b4"
 
 UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
 UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


