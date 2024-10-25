Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2833ED1170E
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 05:40:05 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.5580.1729834801253357882
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 22:40:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TxrBi2bY;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1729834802; x=1761370802;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7E/lO7GpVu1yDMeqQQxipZ51ZUP3OWwb0ZOvwtjg2Qg=;
  b=TxrBi2bYny0LWQ3beWwF94ZEKzr6+OtlYH30mlTY3492SvNEofs/ku5S
   ImS4BvyMn5kdI+1uru61qnOscxQ+NO0rVjCzUraFlSrbjH9lQS4kplSH1
   5uP752YoDY01ZL06gRMohkGb/TX3eTCcoNObVFEw38k1S9DPbMz7TyWBN
   PBmyN1zCYwkeYlELZZZp5bKeg4/a2idWKqp31yxO1N8Ql6dk1ztI4ZoM1
   jSPj6p2fY5cEOF/QGmNn4lEsuL55oW+XXPlwU0ZZO1SHMr2zZX3tXMRiU
   R6na9LhQGDRDc5VYHlOCEaoq9sRtJREZWMHTBIAx0aXX1iD0WSzdw9WgF
   A==;
X-CSE-ConnectionGUID: bZznHsMUTJm4pAnK9u0QeA==
X-CSE-MsgGUID: WPVeFf/nQxughFzE2BT0Lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="178015451"
X-IronPort-AV: E=Sophos;i="6.11,231,1725289200"; 
   d="scan'208";a="178015451"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 14:39:59 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 01A66C68E1
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:57 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3F248D9698
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C7A9F1022B
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 742951A01E9;
	Fri, 25 Oct 2024 13:39:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/22] llvm: upgrade 19.1.0 -> 19.1.2
Date: Fri, 25 Oct 2024 13:39:18 +0800
Message-Id: <1729834769-4717-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
References: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28752.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28752.005
X-TMASE-Result: 10--1.781600-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSCysPB8dBBorYIP
	FubbBVyAoTssFGSH7W3mn3xyPJAJoh2P280ZiGmR031Nfxfj2zMgX2Xt4pvYkbxrAG2Om7p2bbF
	FIHQbXOukxJuVk5oxMrc/ZCLk5Aaur78SC5iivxwURSScn+QSXt8dWDYdvqmpM6seg7X1WbaOhz
	Oa6g8KrR5Wno69aRpfyO6gLFPK0XXPQ6h6KprYB0EcXJHqfPrI7KD0mMM8vn/qX0wru2iWTZm2b
	tbhqnlLCtu4PdgkIXXyjpjnDUy2kB0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuEVM/dBEMBtjA
	KW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 05:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206330

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://discourse.llvm.org/t/llvm-19-1-2-released/82550

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/llvm/{llvm_19.1.0.bb => llvm_19.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/llvm/{llvm_19.1.0.bb => llvm_19.1.2.bb} (98%)

diff --git a/meta/recipes-devtools/llvm/llvm_19.1.0.bb b/meta/recipes-devtools/llvm/llvm_19.1.2.bb
similarity index 98%
rename from meta/recipes-devtools/llvm/llvm_19.1.0.bb
rename to meta/recipes-devtools/llvm/llvm_19.1.2.bb
index 35e7f4c07f..7128d1e71e 100644
--- a/meta/recipes-devtools/llvm/llvm_19.1.0.bb
+++ b/meta/recipes-devtools/llvm/llvm_19.1.2.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
            file://llvm-config \
            "
-SRC_URI[sha256sum] = "5042522b49945bc560ff9206f25fb87980a9b89b914193ca00d961511ff0673c"
+SRC_URI[sha256sum] = "3666f01fc52d8a0b0da83e107d74f208f001717824be0b80007f529453aa1e19"
 UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
 UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.34.1


