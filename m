Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D10ECAC591
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:17:50 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.13233.1757495860281234666
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:17:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KitoCx9Y;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495861; x=1789031861;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ibAfJj3E0WCrG/uvbm/OgoHuEAG9yvvAkbT4HTwuY8A=;
  b=KitoCx9YQLa/QfW0v2qEwQrk/CqpHci+W4BvU7X77mMg4u28WZDwi1HF
   5AxE0OJ/d4U8UeIMfa0CP/KUZ1t0zcSn/TLLpL7mNOKt+u782b/qY4n3Z
   0t8azBs11FVxtiyRcdx3cVjCkD2x+Fj/7EpiGQ8VwZave6pqol1S9eZD1
   ex4veTPAGPw6tFPcchnnH9EQJgMNfAZ/Njb+bU7BtiCnxpV1CWpVInh2b
   VfDdH4wSkP0Y+0s4VDxhQMqcUh3PL5bMC6V6EGPoVUOuwXtGyzsTik9yY
   CykNxPD0TTR4DypGIZKjK0uYO1tUGB6CIZkcLS3LC3zofrZd1hGg7JDzW
   w==;
X-CSE-ConnectionGUID: rL+fwHO7Qlm2jNpLLpr4hA==
X-CSE-MsgGUID: hPFb+YVcSKe7wNOpO0blCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="211787011"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="211787011"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:17:39 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 92DAE1002BB8
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:38 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 4EA4CC011B0
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:38 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTPS id CA7DC406862
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B52721A0087;
	Wed, 10 Sep 2025 17:17:33 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 24/40] nghttp2: upgrade 1.66.0 -> 1.67.0
Date: Wed, 10 Sep 2025 17:16:30 +0800
Message-ID: <20250910091646.998-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250910091646.998-1-wangmy@fujitsu.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223175

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nghttp2/{nghttp2_1.66.0.bb => nghttp2_1.67.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nghttp2/{nghttp2_1.66.0.bb => nghttp2_1.67.0.bb} (84%)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.66.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.67.0.bb
similarity index 84%
rename from meta/recipes-support/nghttp2/nghttp2_1.66.0.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.67.0.bb
index 49d6d7e632..bb31a36c1f 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.66.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.67.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz"
-SRC_URI[sha256sum] = "00ba1bdf0ba2c74b2a4fe6c8b1069dc9d82f82608af24442d430df97c6f9e631"
+SRC_URI[sha256sum] = "d21cf317837f5176b76bed7eded54a4e4583dfa378c9f915913329d9d4a1be86"
 
 inherit cmake manpages python3native github-releases
 
-- 
2.43.0


