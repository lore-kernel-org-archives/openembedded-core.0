Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E788C25B7A
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:15:09 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.5631.1716369307721400700
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WQTzCovb;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369308; x=1747905308;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=QDr7NzAscInLmgIsRCs4+KPE7gbmPQDi9UWnN2Yuxvc=;
  b=WQTzCovbxMBNdwyLyMN5xVjS65dbd1axGrNEYribpaC1u/b2RMnzqghZ
   FGEBHI4/9ZaktBF9NMgWl49Oz8lPDTFyOoZ1kiOoBK5RUqk0nCauBhGgt
   4CFcD+kiD85JJIixgA7ruEbgEPv24dp0M++3IfcdznLBGZDbfFZMO8qym
   6r8BPoiK4Tx0eJ5EeadglIP2ui78hK/pKDM1lskB06hM+CXbej+8QVqPk
   2Wlm4KlC3bCNHKlUmAfnXmIfCzWv97AN+Fy3T5reYqpUqEdB/Lju+R+2/
   VQbfloMxmJx7nzfXkJe1QUpoGV8QP4cy3O3bVKEw9XQR9tITdCxJfHZhE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="158981264"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="158981264"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:06 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1D230DBD9C
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:03 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5BB25D16FC
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id DB6DA21CB3A
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:01 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 854541A000B;
	Wed, 22 May 2024 17:15:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/42] bind: upgrade 9.18.26 -> 9.18.27
Date: Wed, 22 May 2024 17:14:10 +0800
Message-Id: <1716369289-22526-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10--1.040600-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrqJNAg+VJy+te/1kW39cvjL6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtII5V1ACIyZtnHqx
	sBjV0bTYPTJ94iLTbSs6gK9/y/z7S1pVckLHgk0KeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNc4FzPgxXCdirH7keQGrFdRfPRCbpnJcZiGfgf6MMHbz1MKjEB98rNW+roB713T2pFc2A
	BYAN1LahdZlndmk6r7uT0bpe0m4OlLvHqPi046FU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:15:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199698

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
* Skip to next RRSIG if signature has expired or is in
  the future rather than failing immediately.
* Implement signature jitter for dnssec-policy.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../bind/{bind_9.18.26.bb => bind_9.18.27.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.26.bb => bind_9.18.27.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.26.bb b/meta/recipes-connectivity/bind/bind_9.18.27.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.26.bb
rename to meta/recipes-connectivity/bind/bind_9.18.27.bb
index b99f92537c..98b8bb5513 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.26.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.27.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "75ffee52731e9604c849b658df29e927f1c4f01d5a71ea3ebcbeb63702cb6651"
+SRC_URI[sha256sum] = "ea3f3d8cfa2f6ae78c8722751d008f54bc17a3aed2be3f7399eb7bf5f4cda8f1"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.34.1


