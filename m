Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A701C05052
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:41:58 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.7591.1690875708998498311
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="105999773"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="105999773"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:41:47 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3C248CA1E9
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Aug 2023 16:41:45 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 681C3D5FE4
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Aug 2023 16:41:44 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7BC6C2FC86F7;
	Tue,  1 Aug 2023 16:41:43 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] xxhash: upgrade 0.8.1 -> 0.8.2
Date: Tue,  1 Aug 2023 15:41:19 +0800
Message-Id: <1690875687-21573-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875687-21573-1-git-send-email-wangmy@fujitsu.com>
References: <1690875687-21573-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27786.005
X-TMASE-Result: 10--5.424500-10.000000
X-TMASE-MatchedRID: 19A9OAtP7iyjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytP3Eb4+bLT+kfa
	JN32C3Plbn+bq+W8j6VyvMd5Xb/bq6/Elphzpf1L30kDaWZBE1RX3+fkhmeDZCt+gViu+UDkkrI
	9/WPu3jfBo6qhB6MT9nEsDIz4E/u3EuYl3YX/IW4/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365brwwTP2r1yKG9NBnRu48ed1tnFZPAvryPsrEmhNGttNTXWQVF5ufnJoAIXlMppp3X62fq
	JaIHNA0/ylbX2Ykg6ardyzPyxaOVOJzPEoBEMUKaDCzqDR7DPaxZOddVMlEZwIZ++dWnH7bnptr
	8PnHpyni8zVgXoAltlPcOF1Vw1gmC24oEZ6SpSkj80Za3RRg8DX6+oABBaPS1/X5ZxTH62hrpuZ
	azgtxGzIIs8EqaW0HGt+PJNRVOlI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 07:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185202

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- fix  : XXH3 S390x vector implementation
- fix  : PowerPC vector compilation with IBM XL compiler
- perf : improved WASM speed by x2/x3 using SIMD128
- perf : improved speed (+20%) for XXH3 on ARM NEON
- cli  : Fix filename contain /LF character
- cli  : Support # comment lines in --check files
- cli  : Support commands --binary and --ignore-missing
- build: fix -Og compilation
- build: fix pkgconfig generation with cmake
- build: fix icc compilation
- build: fix cmake install directories
- build: new build options XXH_NO_XXH3, XXH_SIZE_OPT and XXH_NO_STREAM to reduce binary size
- build: dedicated install targets
- build: support DISPATCH mode in cmake
- portability: fix x86dispatch when building with Visual + clang-cl
- portability: SVE vector implementation of XXH3
- portability: compatibility with freestanding environments, using XXH_NO_STDLIB
- portability: can build on Haiku
- portability: validated on m68k and risc-v
- doc  : XXH3 specification
- doc  : improved doxygen documentation
- misc : dedicated sanity test binary

License-Update: Copyright year updated to 2021

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xxhash/{xxhash_0.8.1.bb => xxhash_0.8.2.bb}             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/xxhash/{xxhash_0.8.1.bb => xxhash_0.8.2.bb} (82%)

diff --git a/meta/recipes-support/xxhash/xxhash_0.8.1.bb b/meta/recipes-support/xxhash/xxhash_0.8.2.bb
similarity index 82%
rename from meta/recipes-support/xxhash/xxhash_0.8.1.bb
rename to meta/recipes-support/xxhash/xxhash_0.8.2.bb
index 222ba7b77c..f16b183c95 100644
--- a/meta/recipes-support/xxhash/xxhash_0.8.1.bb
+++ b/meta/recipes-support/xxhash/xxhash_0.8.2.bb
@@ -3,14 +3,14 @@ DESCRIPTION = "xxHash is an extremely fast non-cryptographic hash algorithm, \
 working at speeds close to RAM limits."
 HOMEPAGE = "http://www.xxhash.com/"
 LICENSE = "BSD-2-Clause & GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=cdfe7764d5685d8e08b3df302885d7f3 \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=13be6b481ff5616f77dda971191bb29b \
                     file://cli/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                   "
+                    "
 
 SRC_URI = "git://github.com/Cyan4973/xxHash.git;branch=release;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-SRCREV = "35b0373c697b5f160d3db26b1cbb45a0d5ba788c"
+SRCREV = "bbb27a5efb85b92a0486cf361a8635715a53f6ba"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


