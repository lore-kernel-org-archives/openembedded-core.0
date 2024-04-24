Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FF55C25B7A
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:15 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.11723.1713948185262143713
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=G6R0qLko;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948185; x=1745484185;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=efGw+xQ73RXYcHgAhYjrJ9H5emUzhw6ctXztGoGux9c=;
  b=G6R0qLkoFmrLvOlfXkywMQnBeIyMz3jxGSTAj4HPUpw7Rp77IVVufpxZ
   7jHRyCdWL/8G49lsXL+18MgVcTDWy9bYUyxZBeyAiOQNk32YQlN8ECrPU
   GUD3iaEoZLcXyhMRrZLd6GO0RYcee8Yjt1RwevAwGn2yEs2vYuF6Z4lHv
   FvJFMubak/ra8cItZ49S1P9tK0BW/glZrC3J2aJgVgCObzkPAXKwZZ/+e
   YVufM1lYlr9EDvbk7fryvIUJyd08AowcCBfBP/2ms6h4HM9Vy/LuxkX/9
   aDc57TEtntp4sjoZ1v+iY2RAOb6Z6byAbTcghhnx5sJ0q1fj+dpBG+kkC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="135830460"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="135830460"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:43:02 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 84A29D4C24
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:00 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B32709E181
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 357F2202CE12E
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D56D31A000A;
	Wed, 24 Apr 2024 16:42:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/38] lttng-ust: upgrade 2.13.7 -> 2.13.8
Date: Wed, 24 Apr 2024 16:42:09 +0800
Message-Id: <1713948152-13501-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10--5.807300-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mregIHHX2L4YzebsVFPGXfZJQz
	at6Nit3obn+bq+W8j6VUUUB6BpF8mJ9nuD9AwGu7A9lly13c/gHVy4hHC3/gyLKw8Hx0EGitKpT
	dEP51ULiGN/nQcKVf4OaffHI8kAmis1RWeqLGIw65x7uAXGEprdUEOicf335WUWiFWI7bq8Gem2
	vw+cenKeLzNWBegCW24nmFeyfGnuMLbigRnpKlKSPzRlrdFGDwowYA2CAx8gByaTWPLDm1lsYnq
	CraiJNeEdP6ZhabCyWdVXlWkTsV9w==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198660

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Add close_range wrapper to liblttng-ust-fd.so
* ust-tracepoint-event: Add static check of sequences length type
* lttng-ust(3): Fix wrong len_type for sequence
* Fix: libc wrapper: use initial-exec for malloc_nesting TLS

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lttng/{lttng-ust_2.13.7.bb => lttng-ust_2.13.8.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.13.7.bb => lttng-ust_2.13.8.bb} (95%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.13.7.bb b/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb
similarity index 95%
rename from meta/recipes-kernel/lttng/lttng-ust_2.13.7.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb
index 9509185bad..dddd3a5004 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.13.7.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb
@@ -34,7 +34,7 @@ SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-Makefile.am-update-rpath-link.patch \
            "
 
-SRC_URI[sha256sum] = "5fb4f17c307c8c1b79c68561e89be9562d07e7425bf40e728c4d66755342a5eb"
+SRC_URI[sha256sum] = "d4ef98dab9a37ad4f524ccafdfd50af4f266039b528dd5afabce78e49024d937"
 
 CVE_PRODUCT = "ust"
 
-- 
2.34.1


