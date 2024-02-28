Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2462BC54E5F
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:42 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.8393.1709105607655153432
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pcQE/brv;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105612; x=1740641612;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=LWOD0uq0E+0cQV+9Hsblul2jaiGjE5Vm+eG8PYwkOoU=;
  b=pcQE/brvf+KPDWeHGfjBQ4rHhx/xsBPkrkMLWz+olILb98522a9c/rjS
   sRo4FRt4WVxp9u9bsniGkiNA6Ob3AtVgdewWJL2ZhekxFxN74ybces+3v
   47YFq6q4+O73T7h095tdR/bz4yEloVDDGb39Avo8ubHeqWXf/6zo525Uw
   gyhnq6G5saLo5chGjmy+MVitxFtnUY3GEOyphFkzdtrtZIIimziLM5Xnr
   byV+wfkr8OWLxTbOWnr3jLO/bVcQnjWa5p/OCZNYXW2T4vWYNtXeiSUmh
   23yE4H7UBlBiWzDHqi63lSxfG3AUbcMIjDszQO7U2T7EvOfHYKIXytCz8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="138665589"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="138665589"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:30 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C901FA028B
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:28 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 010C6CFAC8
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 76CB340FD2
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:27 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 216871A006A;
	Wed, 28 Feb 2024 15:33:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 22/48] lighttpd: upgrade 1.4.73 -> 1.4.74
Date: Wed, 28 Feb 2024 15:32:29 +0800
Message-Id: <1709105575-24259-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10--3.423300-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mra/fioJ9l4Hgq1yV4xvXIIukD
	BMmb59I04CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2bxrAG2Om7p2EXo
	uQwO8rUmxfbhqGxLk+4Ay6p60ZV62To3UJuRLIoQBpRCTkRk5SfoLR4+zsDTtvG0VHndRxgIQlf
	Ergmrt1C1aMKyOY8rrq0NgalEQzPuoGPHA95H7H8IVzpXLftzQBofrJTF5vHZCMMnhRWFbjJoNo
	DBPRx4lHwDSPs4QranyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196345

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 http://www.lighttpd.net/2024/2/19/1.4.74/

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lighttpd/{lighttpd_1.4.73.bb => lighttpd_1.4.74.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.73.bb => lighttpd_1.4.74.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.73.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.74.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.73.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.74.bb
index ea83a4b507..7460d3d716 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.73.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.74.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://lighttpd \
            "
 
-SRC_URI[sha256sum] = "818816d0b314b0aa8728a7076513435f6d5eb227f3b61323468e1f10dbe84ca8"
+SRC_URI[sha256sum] = "5c08736e83088f7e019797159f306e88ec729abe976dc98fb3bed71b9d3e53b5"
 
 DEPENDS = "virtual/crypt"
 
-- 
2.34.1


