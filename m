Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2323DCCD199
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 05:57:48 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.9284.1760680656213474471
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 22:57:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=f0WZ3T/w;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760680656; x=1792216656;
  h=from:to:subject:date:message-id;
  bh=FdmVYidioDkiEefy/yvPVN8ogVIC0FXHLWlDkHliCQw=;
  b=f0WZ3T/wjoWNx6F7MF3z/mOmDQAXtq32YaVwnrhP9NHtk/iN084jR5ZO
   qEBXbAhCORVx0g8CxsnDIF3BhiIBVN+CY0ZJ85k6z6PMatIpExfs9ovCS
   YtETvduofHT6kvYJwu8KcCfW05IVUIiHqVPrZ6qXXMLCb2s77sBEImCMH
   Ot6JWTxnqtV5NyGtyQJ4VjeZim8v8W6EwMS/e9TQpc75AW2AZR9QcKRl+
   xRMvPA7GYd5ElJn8iaAFLXZlgZ0/G3Ga7behz/rivOuPJP/jYfoq/nwj1
   hmB0QRHSSyuxR2Bi16ZPGwV79zl7S0oRND/Za3UcqQ69vZ0Q5gPtpUZTr
   Q==;
X-CSE-ConnectionGUID: UrndW3OZSE2uCT0d5T9u5A==
X-CSE-MsgGUID: TL4QCBbaTEytTvHorRWCzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="195176229"
X-IronPort-AV: E=Sophos;i="6.19,234,1754924400"; 
   d="scan'208";a="195176229"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 14:57:34 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 8270B1C00092
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 05:57:34 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 3A2A7C01601
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 05:57:34 +0000 (UTC)
Received: from zhengrq-VirtualBox.fnst-internet.local (unknown [10.193.135.3])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 5B92720002AB
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 05:57:32 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] llvm: multilib-header fix for llvm/Config/llvm-config.h
Date: Fri, 17 Oct 2025 13:57:24 +0800
Message-Id: <20251017055724.21328-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 05:57:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224994

Fix following conflicts when enabling multilib.

Error: Transaction test error:
  file /usr/include/llvm/Config/llvm-config.h conflicts between attempted installs of lib32-llvm-dev-21.1.3-r1.core2_32 and llvm-dev-21.1.3-r1.x86_64_v3

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta/recipes-devtools/clang/llvm_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/llvm_git.bb b/meta/recipes-devtools/clang/llvm_git.bb
index 2f47af8d7a..96ea383731 100644
--- a/meta/recipes-devtools/clang/llvm_git.bb
+++ b/meta/recipes-devtools/clang/llvm_git.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=8a15a0759ef07f2682d2ba4b893c9afe"
 
 DEPENDS = "llvm-tblgen-native libffi libxml2 zlib zstd"
 
-inherit cmake pkgconfig lib_package
+inherit cmake pkgconfig lib_package multilib_header
 
 OECMAKE_SOURCEPATH = "${S}/llvm"
 
@@ -109,6 +109,8 @@ do_install:append() {
 
     # Reproducibility fixes
     sed -i -e 's,${WORKDIR},,g' ${D}/${libdir}/cmake/llvm/LLVMConfig.cmake
+
+    oe_multilib_header llvm/Config/llvm-config.h
 }
 
 do_install:append:class-native() {
-- 
2.43.0


