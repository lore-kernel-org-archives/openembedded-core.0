Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F747C27C5F
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:16:01 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.5643.1716369333968958930
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HguQnxv3;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369338; x=1747905338;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Nr10erJcTgafP39UTOvFWXLgVZvrkhiaxWADgsJ4cjI=;
  b=HguQnxv3JIT3WFeqc0C1/PXdU+5eLvXVUv3g1wVAK3p11I7otRehF6DS
   U5hx6YDNVRfoS+knrFAwvmnOC7aUVTNN/LshSBnFEbATgKMhmELxAUTZz
   TydmrVB/1LG65UR7sPZmJC5JNgvRpqr2ff5Zx+oa/ah0bTUodNNuBjFps
   gQV0p0PKQ25BjBisw7rhWqari95teMatvdNLi/TDk+nMHZccVtUTFmtmI
   ZG8kJQUBrcuqbauzBTvFxqjBNLZIenCHjZgQMyZS/egMA9k+JK63eFA9b
   cVPeifRaR/c3DpWEEr3/IwUuhfZZ2ypQ/xU/W+P4SHhbWTj8MbltQbkdo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="147548980"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="147548980"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:37 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 63A20CD7E5
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:35 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 933F74DAB7
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2501B20097E68
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C58371A000B;
	Wed, 22 May 2024 17:15:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 27/42] nghttp2: upgrade 1.61.0 -> 1.62.0
Date: Wed, 22 May 2024 17:14:34 +0800
Message-Id: <1716369289-22526-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10--3.111300-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBoOe42HKVRDr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3FCedixYXzOrNBd
	ORIzcI4ZLRjw0OM3u1nk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6C93
	2x7Y8owzVNZAnR3YLTjPCI/dPhemKEkS6VfN3etmZb71dEmqcr0UWFT/44sMoaGUMBEu0K4/UaO
	HZvDq5QP9l2oLpkjjGCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199721

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/nghttp2/nghttp2/releases/tag/v1.62.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nghttp2/{nghttp2_1.61.0.bb => nghttp2_1.62.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nghttp2/{nghttp2_1.61.0.bb => nghttp2_1.62.0.bb} (91%)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.61.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.62.0.bb
similarity index 91%
rename from meta/recipes-support/nghttp2/nghttp2_1.61.0.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.62.0.bb
index ad85576dcb..5a820d8cd5 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.61.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.62.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz"
-SRC_URI[sha256sum] = "c0e660175b9dc429f11d25b9507a834fb752eea9135ab420bb7cb7e9dbcc9654"
+SRC_URI[sha256sum] = "26798308fa0a12dabdb7ba8c77f74383019d3a0f1f36d25958b836af22474958"
 
 inherit cmake manpages python3native github-releases
 PACKAGECONFIG[manpages] = ""
-- 
2.34.1


