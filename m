Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42918C54E64
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:42 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.8395.1709105612164643064
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JNHrmJct;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105612; x=1740641612;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=2aNJz7d3FLczFO8aKelcBdT55ketVGqxkwJCly0Xvtk=;
  b=JNHrmJct7XZMpbeJRa5Fap1/G/9/huLZ6wZBrS6hO1v/oc7zysuLTQbI
   wPWaFbCnoI9hOjwAQzngqK26hWcS9J+/XKBVopE5eet30GX36lZWgTiGx
   RHw7UdCrMc6HNLnEyUtPN+yW6kyiNqEngAwT7Ns9VhBRmyOwtlMnbVgaz
   XoMoHABNyB6CUPk6+MiDdm45oSNUfSFNl57WXtSpdLVf8t8kClxMLhS7t
   nZNtpmA/VUFP8LZ52szOcE/UgtLcRdqkoz6bOcNj78A+3pJbH8gyq45jK
   t6iZ6k8Ghm1bs2tYoEGRj1oGmr44NYBUSyeH7ShkpFfhOE+K7ivO3pZr1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="138291815"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="138291815"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:29 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7217EF0FF2
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:27 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A1BE0D5CC3
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4026640FD2
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:26 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E26161A006A;
	Wed, 28 Feb 2024 15:33:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 20/48] libxkbfile: upgrade 1.1.2 -> 1.1.3
Date: Wed, 28 Feb 2024 15:32:27 +0800
Message-Id: <1709105575-24259-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10-3.823900-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrMx/XynyqsrsAIXlMppp3X1br
	GDkZHQlehJtbBPDn7Ju58sshuYVZg6ZY4PxfRMWEBe3KRVyu+k2Siza26cvwNFp6v7WJomQQlTz
	ElHFiLsrxitpmz4Mmm6EfeQTpODV8My4jVjbFuDMD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpitqAfZ9rgr9rlRxm3A2wKuhRFJJyf5BJe3QfwsVk0UbvqwGfCk7KUs0UHR
	MqXPlRc9nTErwjolwJRhXiu1xQtece6936O0BVBgEPbtz7Df8K9oHbgxfLwq2HjLO/F7kHKNCVK
	m14ZHUytZZl7Nxf0xogeppQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196346

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-configure: Use LT_INIT from libtool 2 instead of deprecated AC_PROG_LIBTOOL
-Set close-on-exec when opening files
-_XkbMakeAtom: remove check for impossible case
-_XkbInitAtoms: check for malloc() failure
-XkbChangeAtomDisplay: stop leaking atom name
-XkbCFReportError: avoid -Wformat-nonliteral warning
-XkbWriteCFile: stop leaking header file ifdef name
-DefaultParser: avoid -Wimplicit-fallthrough warnings
-xkbtext.c: Add tbGetBufferString helper function
-XkbIndentText: Fix -Wsign-compare warning
-Fix -Wsign-compare warnings in xkbtext.c & xkmread.c
-Add a meson build system

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxkbfile_1.1.2.bb => libxkbfile_1.1.3.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbfile_1.1.2.bb => libxkbfile_1.1.3.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb b/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb
rename to meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb
index 58dec8ae95..aab6284384 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb
@@ -13,4 +13,4 @@ DEPENDS += "virtual/libx11 xorgproto"
 PE = "1"
 
 BBCLASSEXTEND = "native"
-SRC_URI[sha256sum] = "b8a3784fac420b201718047cfb6c2d5ee7e8b9481564c2667b4215f6616644b1"
+SRC_URI[sha256sum] = "a9b63eea997abb9ee6a8b4fbb515831c841f471af845a09de443b28003874bec"
-- 
2.34.1


