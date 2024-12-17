Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94097E77188
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 08:58:35 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.77347.1734425914528569039
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 00:58:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Uz5B4S81;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734425914; x=1765961914;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=tW4yKQSwsR5tjekPvWXN2NWZ2fN9VFvABs1L5khXI3Q=;
  b=Uz5B4S81OBybW8qADTWhoBTopl0o9MN0FQn1dxURtidOIPVa/VjVJAD9
   HpmwIUu8VD2JcgeureC77vwZHVbx/RkorYeGCd/P844AN+tzEqo8QArZd
   XUlUrDFNtEbgI7deo6AOWxWvZyZFiP+l3HEraKR1tO6w2f+LBgy4NBj6f
   lbTrGwr/Si/iQU9ZiR7XOb6QNs4KbvF8oIwP1fzK8BRAh3qfo0gvQyRL1
   KoyOzqi82slsXp3ILMnFkLK+oNKbhwnXXoaie8bzyTvjFXrUGKrNxWoSp
   ZA7LsI1HjemOU8zfvTFYD1HF8JKypk9+R61JX5W0D280eXg3Uuct8URxf
   g==;
X-CSE-ConnectionGUID: tt75R8JiSyWIfuGVSghsFA==
X-CSE-MsgGUID: 5dxttgC0SpWTYO02Q7F+fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="171353580"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="171353580"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 17:58:32 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 875EBD4808
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:30 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5C9E8D9003
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id ECD2A2007CDE4
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:29 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 896BC1A000B;
	Tue, 17 Dec 2024 16:58:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 10/21] libxau: upgrade 1.0.11 -> 1.0.12
Date: Tue, 17 Dec 2024 16:57:56 +0800
Message-Id: <1734425887-18069-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
References: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10--4.376600-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrMVx/3ZYby79maFqC6epLc4rq
	nYTxkVFKV9Eeika6dU3j0Peziy7gJtFMBnmJRh/JRcGHEV0WBxAMDKjaL38DqAAheUymmndfVus
	YORkdCV6Em1sE8Ofsm6jUAKRnPP1WxEEtnnH5KRc/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bnzcnJbvQR/KgDLqnrRlXrZ8nn9tnqel2MZW5ai5WKly3kRLR+OLC1+trmAp2O0TQ5p6V
	bIQvjuStxYwbNRlJHtNe6oCI7NG3io3TljCVCaFH+ZumlFsJ8b/BBy6dgfcAReTgELyM5vm/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 08:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208814

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- XauDisposeAuth: remove void casts from functions that return void
- unifdef hpux
- Autest.c includes Xauth.h that depends on other headers.
- Allow to use POSIX.2 compliant sed(1)
- Also test for explicit_memset(3) support
- Gcc < 11 doesn't allow opt. deallocator arg for __attribute((malloc))
- gitlab CI: run meson build with both gcc & clang compilers
- Allow building with clang after aec9d7266777e0b9243ef0f112fe0e07256bd446
- Xauth.h: add access & malloc attributes to function prototypes add Meson build system
- Set close-on-exec when opening files
- Require LT_INIT from libtool 2 instead of deprecated AC_PROG_LIBTOOL

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../xorg-lib/{libxau_1.0.11.bb => libxau_1.0.12.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxau_1.0.11.bb => libxau_1.0.12.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb b/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb
rename to meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb
index f1b492c39f..b52b28914b 100644
--- a/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb
+++ b/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb
@@ -20,4 +20,4 @@ XORG_PN = "libXau"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "f3fa3282f5570c3f6bd620244438dbfbdd580fc80f02f549587a0f8ab329bbeb"
+SRC_URI[sha256sum] = "74d0e4dfa3d39ad8939e99bda37f5967aba528211076828464d2777d477fc0fb"
-- 
2.43.0


