Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4564FCD11BF
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 00:35:23 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.7888.1711413318489816682
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 17:35:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ltx54wy8;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711413319; x=1742949319;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=kdrjr8uP+L6uoAPVe3JK9xWwbQ0MH3vdhIWGPdxQ+eM=;
  b=ltx54wy8CDLOYE9kv+RmTBceAtiFtfki5sexp/Kn/dgAhLa9uYImmvOL
   q+Qwhw4S8PRpVNITXrZVyvsz+MpufMelT5USsWmCxnTiSf/1QnDn6SJFE
   oQvSoSxC+aTKC8LWz2BGEE3JHiVTMm0AXP2z/r7tHKR4QxJZHC13hjoZ2
   SU9DA/XCfj0HKEcWeOdQ4VGUNyffN+M9zmsthXuon4RYb1dZ4qexwYUcg
   3qfv5c1sd6lpWfPX75mgxrcTNT3SYDrHAZpmA5biprSkMWzixZDZ54pmP
   d6+IYHOePURH3FGEnynbst/Ioh7ncAWpPTU1ogKHi3q3qMFb+7HFIXj04
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="153359485"
X-IronPort-AV: E=Sophos;i="6.07,154,1708354800"; 
   d="scan'208";a="153359485"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:35:16 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id DD8CF10A32F
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:35:13 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1684BD7B64
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:35:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8AB2220097BFD
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:35:12 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 33FA81A006A;
	Tue, 26 Mar 2024 08:35:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-Core] [PATCH 03/34] bind: upgrade 9.18.24 -> 9.18.25
Date: Tue, 26 Mar 2024 08:34:21 +0800
Message-Id: <1711413292-3025-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28274.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28274.003
X-TMASE-Result: 10-2.031700-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrdwX/SSKrKHi15eNIExieaXM0
	MGWEYTja5dRKIQyvaba23rZKbYc8bSWfqL2WP1wRzfqlpbtmcWhUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmis1RWeqLGIw4qIkSpQVZGCJHUt5D5Wmcl33Nl3elSfsrZGA
	D5GwW8hpZR1NgzltyqeTjw/FyRX6QfE8yM4pjsDwtuKBGekqUpnH7sbImOEBTzrxhZe/RV21MFa
	7Hu3S9YEY02yO+V+DDRIZ0qevSj9im0tOsxNOchEl3sM5aj/go0kMib74Cf3lAA9EYMhgP5nuKc
	iYUIxYPsfZ9V6Q6rCZgvUoiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 00:35:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197493

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Create the pruning task in the dns_cache_flush(), so
 the cache pruning still works after the flush.
-Improve the TTL-based cleaning by removing the expired
 headers from the heap, so they don't block the next
 cleaning round and clean more than a single item for
 each new addition to the RBTDB.
-Revert change 6319 and decrease lock contention during
 RBTDB tree pruning by not cleaning up nodes recursively
 within a single prune_tree() call.
-Address use after free in expire_lru_headers.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../bind/{bind_9.18.24.bb => bind_9.18.25.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.24.bb => bind_9.18.25.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.24.bb b/meta/recipes-connectivity/bind/bind_9.18.25.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.24.bb
rename to meta/recipes-connectivity/bind/bind_9.18.25.bb
index 2874990320..cc35604aba 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.24.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.25.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "709d73023c9115ddad3bab65b6c8c79a590196d0d114f5d0ca2533dbd52ddf66"
+SRC_URI[sha256sum] = "5a4a70432a33d009f0e6e9dbb328aae7a5e27507e98e28bf3c0c6b250ccb2ab3"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.34.1


