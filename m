Return-Path: <throos@amazon.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E94D6C02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 12:44:50 +0000 (UTC)
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
 by mx.groups.io with SMTP id smtpd.web11.42541.1737549882051787471
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jan 2025 04:44:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=YWKctaFc;
 spf=pass (domain: amazon.de, ip: 72.21.196.25, mailfrom: prvs=11060a133=throos@amazon.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1737549882; x=1769085882;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ebfETT/OazM7FNgwJXI2zSSYZFDFuJgJYav7ER8Vl5I=;
  b=YWKctaFcQbSYyYHkWfAwbxv1pFPQh1AaZyBdmkMAL/sSUDnN9ueeAfiC
   USVjp/kWnLCmuDiIiKsE1Hj8Yib/zCwY8t30ykwTSfT8tqQ90WiWa+VG+
   nrWDTNF5zerCSu6vdymulwuY2wwDBrcG6uQIEDAxqbb0iJQ2HzXZIcY/j
   Y=;
X-IronPort-AV: E=Sophos;i="6.13,225,1732579200"; 
   d="scan'208";a="460682471"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-2101.iad2.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 12:44:20 +0000
Received: from EX19MTAEUC002.ant.amazon.com [10.0.10.100:41048]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.37.156:2525] with esmtp (Farcaster)
 id 503b8563-8915-4f66-8c7c-ff016cffe5b1; Wed, 22 Jan 2025 12:44:18 +0000 (UTC)
X-Farcaster-Flow-ID: 503b8563-8915-4f66-8c7c-ff016cffe5b1
Received: from EX19D016EUC001.ant.amazon.com (10.252.51.169) by
 EX19MTAEUC002.ant.amazon.com (10.252.51.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Wed, 22 Jan 2025 12:44:18 +0000
Received: from u182adcbddbfb55.ant.amazon.com (10.1.213.20) by
 EX19D016EUC001.ant.amazon.com (10.252.51.169) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Wed, 22 Jan 2025 12:44:16 +0000
From: <throos@amazon.de>
To: <openembedded-core@lists.openembedded.org>
CC: Thomas Roos <throos@amazon.de>
Subject: [poky][master][PATCH v2] gcc-sanitizers.inc: Workaround for aarch64
Date: Wed, 22 Jan 2025 13:44:07 +0100
Message-ID: <20250122124407.258555-1-throos@amazon.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.1.213.20]
X-ClientProxiedBy: EX19D035UWA002.ant.amazon.com (10.13.139.60) To
 EX19D016EUC001.ant.amazon.com (10.252.51.169)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 12:44:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210148

From: Thomas Roos <throos@amazon.de>

When using the -fsanitize=address  CXX_FLAG for a program compiled for
aarch64 / arm64

This is happing:
MemorySanitizer: CHECK failed: sanitizer_allocator_primary64.h:133 "((kSpaceBeg))
 == ((address_range.Init(TotalSpaceSize, PrimaryAllocatorName, kSpaceBeg)))"
 (0xe00000000000, 0xfffffffffffffff4) (tid=51745)

With -DSANITIZER_CAN_USE_ALLOCATOR64=0 this is not happening and
potenial bugs are detected.

ARM32 does not require this patch.

More info about the issue in this thread:
https://github.com/llvm/llvm-project/issues/65144

Signed-off-by: Thomas Roos <throos@amazon.de>
---
 meta/recipes-devtools/gcc/gcc-sanitizers.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index 8c98e9cf8a..3b044e3571 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -11,6 +11,10 @@ EXTRA_OECONF_PATHS = "\
     --with-build-sysroot=${STAGING_DIR_TARGET} \
 "
 
+# Workaround for this issue: https://github.com/llvm/llvm-project/issues/65144 on aarch64
+# compiler-rt/sanitizers/aarch64: CHECK failed: sanitizer_allocator_primary64.h:133
+CXXFLAGS:append:aarch64 = " -DSANITIZER_CAN_USE_ALLOCATOR64=0"
+
 do_configure () {
     rm -rf ${B}/${TARGET_SYS}/libsanitizer/
     mkdir -p ${B}/${TARGET_SYS}/libsanitizer/
-- 
2.34.1


