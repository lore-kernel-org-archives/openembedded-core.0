Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B38CCC3ABD6
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:12 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.45981.1747040646361447708
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nTDSrwZ9;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040647; x=1778576647;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=sQAvbzTCTNfCVvmjcvzbXgYagvfcPxhu4xRl7ONpg2w=;
  b=nTDSrwZ9tt9Lu5p++1RADTZLndUMvOKlBU0X7T+YYsazzHg47kUtmGpy
   O/QGsIy1MxzstDtKOMRyK1TJ8M7U6T49GFqy8zlWseLtGe9CZ/GnSllEb
   TLRth7EvwNOB7wPW1/2HWK2HUQkt58DP/vC37O/jvUiRWPYHhy875bNBn
   aCyveYw46cdfBVNWTRsN7aHFIOONRvHKZbx9lg4jnvotjrrsOsjAUFNqa
   dP0CUTwygKD07IKOTZHLNZuMTygRiLSpI84oX7HvoN9OeK5CnaQxmSuW2
   QCoeVISbXv1qzWqtS0/Z+w/H83eYln5VTO/kYZTEdgtMVrVTdDicTJFvC
   w==;
X-CSE-ConnectionGUID: CMmKchEMQM2g8yKtIPQp3g==
X-CSE-MsgGUID: l11dZXHUSrKwx1cQ/IeMRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="186489689"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="186489689"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:06 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E2526D6EFC
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:04 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id AD519D5040
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:04 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 465081A00A2;
	Mon, 12 May 2025 17:04:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 52/56] re2c: upgrade 4.1 -> 4.2
Date: Mon, 12 May 2025 17:03:35 +0800
Message-Id: <1747040619-7566-52-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216344

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Added Swift backend
- Added options:
   "--lang swift"
   "--computed-gotos-relative"
- Added configurations:
   "re2c:cgoto:relative", "re2c:computed-gotos:relative"
   "re2c:yyfn:throw"
- Added syntax file code templates:
   "code:cgoto"
   "code:cgoto_data"
   "code:yytarget_filter"
   "code:type_yyctable"
- Added syntax file conditionals:
   ".cgoto.relative"
   ".yyfn.throw"

- Added some C++ benchmarks without submatch extraction.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/re2c/{re2c_4.1.bb => re2c_4.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/re2c/{re2c_4.1.bb => re2c_4.2.bb} (90%)

diff --git a/meta/recipes-support/re2c/re2c_4.1.bb b/meta/recipes-support/re2c/re2c_4.2.bb
similarity index 90%
rename from meta/recipes-support/re2c/re2c_4.1.bb
rename to meta/recipes-support/re2c/re2c_4.2.bb
index 238f95f745..0696080603 100644
--- a/meta/recipes-support/re2c/re2c_4.1.bb
+++ b/meta/recipes-support/re2c/re2c_4.2.bb
@@ -7,7 +7,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "cd7d9bbadb3f04f20da25e20e155655de57beef48e0807266938069f0e322e8b"
+SRC_URI[sha256sum] = "c9dc2b24f340d135a07a1ac63ff53f7f8f74997fed5a4e9132a64050dbc3da1f"
 GITHUB_BASE_URI = "https://github.com/skvadrik/re2c/releases"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


