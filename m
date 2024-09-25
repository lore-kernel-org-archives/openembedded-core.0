Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2658CC369A2
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:55 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.9324.1727246990065401154
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qSRWNGMq;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246990; x=1758782990;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=uhKIT+rYaX8EkmERbV2FEshAtHNuMSGEpNC7Sjrv3Jc=;
  b=qSRWNGMq/lslbn4NyNSbxZv6bhxYrRlf7DNRHY2uUpd+5b7W8HnR2S8n
   zCFWML+P7QnuiCPSka7dnR4L1c6YVTzKkHosztAA4gO4/7bDtIa4QMVtW
   r684Z8r6aed5xg6jMKIAwFV0HiouiDLEWJOeG781pCxcsuaxmgBha3WGt
   MtOE5T8TdTsBGzd/GkAPQESBgZgRlkR1w+JKQ5cfzdjG+dGJ7Lq4x+dK1
   cJmbtpm8X5+qKG5zdC25uA0Ofu5Xg4D8OJQPzN66KcU0iSGay1TK9Qaeh
   FapcsZPPRo6YT5AAfCiXiGGhYi56br95qqKGwy/ydbO/br06F4V9/dfQs
   Q==;
X-CSE-ConnectionGUID: p/8YfIpHTMuqA27A8W1SIw==
X-CSE-MsgGUID: NismJS6dQGGFJEkN8mRaKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="153715152"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="153715152"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:48 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id BCCEFD8008
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:45 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E1309D8CB6
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id DE56BE2528
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8EC3F1A000A;
	Wed, 25 Sep 2024 14:49:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/47] ell: upgrade 0.68 -> 0.69
Date: Wed, 25 Sep 2024 14:48:36 +0800
Message-Id: <1727246960-20665-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10--4.012500-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqz5q5JB+ib2QS0x
	gwi9EvUeCC8aAmGeO6nqXvXKPBg5BmVjCRquYdk+EXjPIvKd74BUENBIMyKD0eCbuVI7hVbLvIO
	fPEvWQc6gx1wnIrEXsoAy6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSzMxZ6+/gYjA3xdI
	zt6vwvHQoYt/zRSR49BSYz5IQnzEIrpm1tsSdXj7ONftpwCUyukOIRwsBcqJZmhrYm8UZQyaVHe
	4a5nQDziB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204920

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add support for getting remaining microseconds left on a timer.
- Add support for setting link MTU on a network interface.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/ell/{ell_0.68.bb => ell_0.69.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.68.bb => ell_0.69.bb} (88%)

diff --git a/meta/recipes-core/ell/ell_0.68.bb b/meta/recipes-core/ell/ell_0.69.bb
similarity index 88%
rename from meta/recipes-core/ell/ell_0.68.bb
rename to meta/recipes-core/ell/ell_0.69.bb
index 40c057afc2..a9060e3762 100644
--- a/meta/recipes-core/ell/ell_0.68.bb
+++ b/meta/recipes-core/ell/ell_0.69.bb
@@ -15,4 +15,4 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "ddcbf381d758f61a02954bf5d2907c8900462abb7b2dcf45589874978bc10125"
+SRC_URI[sha256sum] = "6cfc0888edc94de9f0623798609587b2cc11b92b892945f317e8d199afe7b12e"
-- 
2.34.1


