Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B53CD129E
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 07:10:57 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.130856.1712646648325041376
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:10:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nWWJVOGc;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1712646648; x=1744182648;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=W1qYBsdjPI9mxjD5lVmLUZiv596Gt0ZEylxBGwk/RLg=;
  b=nWWJVOGcbI1GVXRR4NG5L4rol17aL2t4BwhGt2Q3/aZ6LEBWdF7ttNM0
   PocsDLm4ekefjkHJtEgglLDaj2oA0q1qy5vrkylb8jUBw8XhxCqRVIco6
   PcqPESx1CxjOR0Xsd92+REM3WZyzSv9iJfsWIh1pkfb6Z4MsgfBDPn3u5
   JHjr1IhpNSyCe4b7vP0oMHx4vSGtWyXT9WTKm/4BwFd2eW/2QsgzGbruF
   vtSEE3KXtXIVr7cVedSnGnvK5Yspnl7hibjSu9ehtcVWkBsSg0MoJve/q
   Iokie4AroZpqDHI+LYkKbf+7ujakQZHW+9X4i6zJoASvORJ+b6lda/IFY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="143488792"
X-IronPort-AV: E=Sophos;i="6.07,188,1708354800"; 
   d="scan'208";a="143488792"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:10:45 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C31C4DCC04
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:43 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id EF060FD771
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 840C94018B
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:42 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 320FE1A0002;
	Tue,  9 Apr 2024 15:10:42 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 17/33] libxmu: upgrade 1.1.4 -> 1.2.0
Date: Tue,  9 Apr 2024 15:10:04 +0800
Message-Id: <1712646620-16608-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28306.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28306.005
X-TMASE-Result: 10--1.863300-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrGEfoClqBl84AIXlMppp3X1br
	GDkZHQlehJtbBPDn7Juo1ACkZzz9VoLu3EYhzbawa87CDXaKRVJUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmiL1vtt3X2p0WeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNXiltRsZXo+3WtAvzl0JTNCUMxmAJ+iUNbIWTCU8AyHx6K+8kLpwRx63FKvIga+sTiAlq
	/yAsI2jXYMV2suy5z7Fn4KR0iUwvJltc/b1pfHmU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 07:10:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198035

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Use XtAsprintf to simplify os_name string generation
-Remove "#ifndef notdef" checks
-XmuReadBitmapDataFromFile: set close-on-exec when opening files
-configure: Use LT_INIT from libtool 2 instead of deprecated AC_PROG_LIBTOOL
-src/Makefile.am: Remove hardcoded -D_BSD_SOURCE
-configure: raise minimum autoconf requirement to 2.70

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxmu_1.1.4.bb => libxmu_1.2.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxmu_1.1.4.bb => libxmu_1.2.0.bb} (89%)

diff --git a/meta/recipes-graphics/xorg-lib/libxmu_1.1.4.bb b/meta/recipes-graphics/xorg-lib/libxmu_1.2.0.bb
similarity index 89%
rename from meta/recipes-graphics/xorg-lib/libxmu_1.1.4.bb
rename to meta/recipes-graphics/xorg-lib/libxmu_1.2.0.bb
index 3aae4030b7..d97bc7a3dd 100644
--- a/meta/recipes-graphics/xorg-lib/libxmu_1.1.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxmu_1.2.0.bb
@@ -27,4 +27,4 @@ FILES:libxmuu = "${libdir}/libXmuu.so.*"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[sha256sum] = "210de3ab9c3e9382572c25d17c2518a854ce6e2c62c5f8315deac7579e758244"
+SRC_URI[sha256sum] = "072026fe305889538e5b0c5f9cbcd623d2c27d2b85dcd37ca369ab21590b6963"
-- 
2.34.1


