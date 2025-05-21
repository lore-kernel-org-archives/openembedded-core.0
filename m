Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B44C3ABC9
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 03:14:43 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.2730.1747797272352140809
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 20:14:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SEBIFT4b;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747797272; x=1779333272;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pRndjI2doUv06fy62zZM0vzP8FE1w+FdZM4uLBfxXaY=;
  b=SEBIFT4bGMoklw6CX8G0LwvR0iTEoGYBKdWgkA/O1e9gkXYSuwBQF2S+
   xT23Dwd2C3bMfPdVXIboTAlyfvvYa6h+lUgMvNpJNZP9kvdwppGTvoUlW
   W6eko+1r1Hd1rrddx8YOOcIBDRjanY0PLZ7F7DkoMCmVs6YtWaYlLaT7b
   DKG2aRKoUKQf23ITr8HjMcC1a/gyXjcehuRRL4z9ZL/YI4V+z3XMiQ0go
   X8SDWUTZKU2VBYiUff57WErn8rgcYfbiEQ7p38gNAcs2oeGpaFdG7+D7Z
   Eiv13yh7fISrnmjy/XQGPOfjawGTweklD+WdxoT5rEoYTGDWjv+cJ5nhZ
   Q==;
X-CSE-ConnectionGUID: HTAfyMYQStOC+PYIUR0n1Q==
X-CSE-MsgGUID: HSPDfULuS3650JhEsJjwLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="200167280"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="200167280"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 12:14:30 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0BDC3D501E
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 12:14:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B3E87CFA38
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 12:14:27 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AEDD71A0071;
	Wed, 21 May 2025 11:14:26 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH] clang: multilib-header fix for llvm/Config/llvm-config.h and clang/Config/config.h
Date: Wed, 21 May 2025 11:14:12 +0800
Message-ID: <20250521031413.1566-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 03:14:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216962

Error: Transaction test error:
  file /usr/include/clang/Config/config.h conflicts between attempted installs of
lib32-clang-dev-20.1.4-r0.core2_32 and clang-dev-20.1.4-r0.core2_64
  file /usr/include/llvm/Config/llvm-config.h conflicts between attempted
installs of lib32-clang-dev-20.1.4-r0.core2_32 and clang-dev-20.1.4-r0.core2_64

reproduce steps:
1. Add in local.conf the following lines:

  MACHINE ?= "qemux86-64"

  require conf/multilib.conf

  MULTILIBS ?= "multilib:lib32"

  DEFAULTTUNE:virtclass-multilib-lib32 ?= "core2-32"

2. add lib32-llvm-dev llvm-dev to core-image-minimal.bb

  IMAGE_INSTALL = "packagegroup-core-boot ${CORE_IMAGE_EXTRA_INSTALL} lib32-clang-dev clang-dev"

3. $ bitbake core-image-minimal

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index b41b700292..d083dae28b 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -22,7 +22,7 @@ INHIBIT_DEFAULT_DEPS:class-native = "1"
 LDFLAGS:append:class-target:riscv32 = " -Wl,--no-as-needed -latomic -Wl,--as-needed"
 LDFLAGS:append:class-target:mips = " -Wl,--no-as-needed -latomic -Wl,--as-needed"
 
-inherit cmake pkgconfig python3native python3targetconfig
+inherit cmake pkgconfig python3native python3targetconfig multilib_header
 
 OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "BOTH"
 
@@ -236,6 +236,9 @@ do_install:append() {
             install -Dm 0755 ${B}${BINPATHPREFIX}/bin/$t ${D}${bindir}/$t
         fi
     done
+
+    oe_multilib_header llvm/Config/llvm-config.h
+    oe_multilib_header clang/Config/config.h
 }
 
 do_install:append:class-target () {
-- 
2.43.0


