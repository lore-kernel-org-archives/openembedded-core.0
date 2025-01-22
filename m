Return-Path: <throos@amazon.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2334CC02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 11:17:00 +0000 (UTC)
Received: from smtp-fw-52003.amazon.com (smtp-fw-52003.amazon.com [52.119.213.152])
 by mx.groups.io with SMTP id smtpd.web10.41121.1737544618673991056
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jan 2025 03:16:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=MD+UwMD6;
 spf=pass (domain: amazon.de, ip: 52.119.213.152, mailfrom: prvs=11060a133=throos@amazon.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1737544619; x=1769080619;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7WmsTDtB7xWchaT2kvFmLwLwDSph52sRbZQsqWmEDFI=;
  b=MD+UwMD6aS1EGPI/6386JDVu3ywieotemp94RaGOGSawNoZDpsi1Zc0F
   7o0INYONobOpnIcPWsASqtX0J2T/0lefbka/ENy7RryamyRzapoVXS4J9
   FaqfjKq0y1ZeBAqewySLkAkqnLvx9pWBRPPpVHDrRFOXpcgVGPEOoUE2y
   A=;
X-IronPort-AV: E=Sophos;i="6.13,225,1732579200"; 
   d="scan'208";a="59609296"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-52003.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 11:16:56 +0000
Received: from EX19MTAEUC001.ant.amazon.com [10.0.43.254:31701]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.7.13:2525] with esmtp (Farcaster)
 id fd59e1c9-b587-4e69-8488-53bd7197da95; Wed, 22 Jan 2025 11:16:55 +0000 (UTC)
X-Farcaster-Flow-ID: fd59e1c9-b587-4e69-8488-53bd7197da95
Received: from EX19D016EUC001.ant.amazon.com (10.252.51.169) by
 EX19MTAEUC001.ant.amazon.com (10.252.51.155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Wed, 22 Jan 2025 11:16:55 +0000
Received: from u182adcbddbfb55.ant.amazon.com (10.1.213.30) by
 EX19D016EUC001.ant.amazon.com (10.252.51.169) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Wed, 22 Jan 2025 11:16:53 +0000
From: <throos@amazon.de>
To: <openembedded-core@lists.openembedded.org>
CC: Thomas Roos <throos@amazon.de>
Subject: [poky][master][PATCH] gcc-sanitizers.inc: Workaround for aarch64
Date: Wed, 22 Jan 2025 12:16:42 +0100
Message-ID: <20250122111642.155310-1-throos@amazon.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.1.213.30]
X-ClientProxiedBy: EX19D033UWC002.ant.amazon.com (10.13.139.196) To
 EX19D016EUC001.ant.amazon.com (10.252.51.169)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 11:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210144

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
 meta/recipes-devtools/gcc/gcc-sanitizers.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index 8c98e9cf8a..ae05ae6dfd 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -11,6 +11,8 @@ EXTRA_OECONF_PATHS = "\
     --with-build-sysroot=${STAGING_DIR_TARGET} \
 "
 
+CXXFLAGS:append:aarch64 = " -DSANITIZER_CAN_USE_ALLOCATOR64=0"
+
 do_configure () {
     rm -rf ${B}/${TARGET_SYS}/libsanitizer/
     mkdir -p ${B}/${TARGET_SYS}/libsanitizer/
-- 
2.34.1


