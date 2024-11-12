Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE781D41D7C
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:25:35 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.82731.1731403530232645377
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=B8Isd2np;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403530; x=1762939530;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=GygY0uUdUiP1jpyB2w46JOIjsMxH4Tdtgsd94SUbSM8=;
  b=B8Isd2npI2y+FX/mtH6NUpckHLXNI63MztOUKdhIahMtLxXUFyEERezc
   JHWfCwU8iG/8H+b4C/dV8K9fuSXK7sfJeYcVioBp0nL5Jzv6j++pXrPcn
   1M+1dKrAagq1/FnLUkdPYOlmpHq/RVnMOAZdRI7pHPUpXkaPnT4aY/JAF
   Y6tfpp5NLndPv93dlxrppCdHU0IIOx7OKjusYIC337KhXMtC6xkMYssaR
   k39mPCAXbmKA+oPREXKzS7swPK0nbWqtj5UDxCUXnC3W2CCxZnJzorkiL
   /66SmDYk0x5oUCxRH75pVXcJwJyfh5OeYs+378m+wnK9KDXoY3E6puyf7
   Q==;
X-CSE-ConnectionGUID: cahID4lNRbaa/4Gq/TVoSw==
X-CSE-MsgGUID: MXG7bwXoR2eZrt+ZoEzXZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="179257975"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="179257975"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:28 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1FEEBDBBCC
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:26 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A95D1D5062
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3B0056BCC2
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:25 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DD7BA1A000A;
	Tue, 12 Nov 2024 17:25:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 19/47] libtraceevent: upgrade 1.8.3 -> 1.8.4
Date: Tue, 12 Nov 2024 17:24:15 +0800
Message-Id: <1731403483-21399-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10--1.474800-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorSqU
	3RD+dVC4hjf50HClX+Dmn3xyPJAJopGZilTi8ctStw+xHnsmQjPzndiJkHFMhEgxSQxzSLAbIY6
	e+Xi1ah+GOq73doEniIAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzzQt5N32atBhil0
	StAsnUy2orP5A/BBo5YiI/eIkhNYkxQGggl//0syxlNazqI+9PBPgtCnQSgpChqPsW4rL/izLnq
	ZlysIrtiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207006

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libtraceevent_1.8.3.bb => libtraceevent_1.8.4.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/libtraceevent/{libtraceevent_1.8.3.bb => libtraceevent_1.8.4.bb} (93%)

diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.3.bb b/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.4.bb
similarity index 93%
rename from meta/recipes-kernel/libtraceevent/libtraceevent_1.8.3.bb
rename to meta/recipes-kernel/libtraceevent/libtraceevent_1.8.4.bb
index 68174305f2..7a33da37c2 100644
--- a/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.3.bb
+++ b/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.4.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97
                     file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd"
 SECTION = "libs"
 
-SRCREV = "645a883516e343ee970ebb80398cfd7b7dbd227e"
+SRCREV = "bd47bd544c9ebc9f44bd88c2b2f2049230741058"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;branch=${BPN};protocol=https \
           "
 
-- 
2.34.1


