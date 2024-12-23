Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D124C02183
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 09:11:33 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.10442.1734945082255578133
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 01:11:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UfPjPgEF;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734945082; x=1766481082;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=g/x+i0GeXCtdAVLX6WoSyVKpFhP2ZFTZs72eUKvwqGg=;
  b=UfPjPgEFYLcQNpwE24EOpp5H7zpPTMFqv6cuXgFxAyLkUWzP0WaXOGGN
   rY3ts+rps+E9g5rJFxD4LZEOK5vc54uTQ54giK4n1ZuXRlNHrO36Ex3w1
   7CJwO4gV6YscgzHteXm0oAil5qPBGpxcWd/39aisgqSuIllAVQDu/lqTy
   ZiHRlq/5sBY1/SEwBjzmvBRiHIjscggGNfoZwTq5FfsaAuNTwPMkebIBI
   pmpjfJc6Uo1H+dbrkmKeq8Zxzg7wG1yKQPFBJzqmtQF97+gUIxUDWxK0h
   ZkrBxK5OCDIzGth8ghdrdsEtRBL6/84YgR8tQD0ML+hh+yrrIAhipXy2E
   Q==;
X-CSE-ConnectionGUID: gEOf+MbLQe65Dj7C9JIYqA==
X-CSE-MsgGUID: HZRXgLLTRmK6jovLbj3O3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="184685037"
X-IronPort-AV: E=Sophos;i="6.12,256,1728918000"; 
   d="scan'208";a="184685037"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 18:11:20 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 11F0CD4C3C
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:18 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id D75C2D4C3B
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 750C91021B
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:17 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1D21D1A006C;
	Mon, 23 Dec 2024 17:11:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/22] llvm: upgrade 19.1.5 -> 19.1.6
Date: Mon, 23 Dec 2024 17:10:47 +0800
Message-Id: <1734945065-4373-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
References: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28876.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28876.006
X-TMASE-Result: 10--8.830800-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyv+Aw16GgqpO1X6
	4CEqn/8vMIz5Yq3+RADVMJCZKkTk5fXNEkgZOg/OxOIv4/oKgyA0000sN/tt6Tb9TB28Ubkijd2
	iUNcC8/6DCeOM3xHH+8Yoh/qEF/tVATh1ufKMwlpO5y1KmK5bJRSLgSFq3TnjS411xkMup5TnAw
	8yp081LOIC7d1yHZHYAFFvfoi/CJWqX913xn/oMjo39wOA02Lh4SkIdSwphgZcTkKj9pRvYKPFj
	JEFr+olwXCBO/GKkVr3FLeZXNZS4DjAdLIal4R6ohmjEMAkj4ZaTesIthJe4Fk+jq8mrTJk6Vyp
	5znuInLyldsnilkK7Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 09:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209018

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- [SimpleLoopUnswitch] Fix LCSSA phi node invalidation
- [AggressiveInstCombine] Use APInt and avoid truncation when folding loads
- [WebAssembly] Handle symbols in .init_array sections
- [WebAssembly] Support multiple .init_array fragments when writing Wasm objects
- [cmake] Use DetectTestCompiler from openmp directory
- [offload] Define LIBOMPTARGET_OPENMP_*_FOLDER in standalone builds
- [offload] Define OPENMP_TEST*_FLAGS in standalone builds
- [offload] [test] Add "omp" test dependency only when present
- [offload] Include CheckCXXCompilerFlag in CMake
- [offload] - Fix issue with standalone debug offload build
- [lld][WebAssembly] Fix use of uninitialized stack data with --wasm64
- [Clang][perf-training] Fix clean command in perf-helper.py

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/llvm/{llvm_19.1.5.bb => llvm_19.1.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/llvm/{llvm_19.1.5.bb => llvm_19.1.6.bb} (98%)

diff --git a/meta/recipes-devtools/llvm/llvm_19.1.5.bb b/meta/recipes-devtools/llvm/llvm_19.1.6.bb
similarity index 98%
rename from meta/recipes-devtools/llvm/llvm_19.1.5.bb
rename to meta/recipes-devtools/llvm/llvm_19.1.6.bb
index de534aa283..003676a652 100644
--- a/meta/recipes-devtools/llvm/llvm_19.1.5.bb
+++ b/meta/recipes-devtools/llvm/llvm_19.1.6.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
            file://llvm-config \
            "
-SRC_URI[sha256sum] = "bd8445f554aae33d50d3212a15e993a667c0ad1b694ac1977f3463db3338e542"
+SRC_URI[sha256sum] = "e3f79317adaa9196d2cfffe1c869d7c100b7540832bc44fe0d3f44a12861fa34"
 UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
 UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


