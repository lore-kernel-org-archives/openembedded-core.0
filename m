Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97CABC2BD09
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 08:27:50 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.135705.1719217663870802198
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 01:27:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TNOcgTxm;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719217664; x=1750753664;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/EdAmzoFsrFTm7Edy4LEubtOkEHrwoM380SfC5axUQI=;
  b=TNOcgTxmWSSQRtkvO5Rc0/dP3AungdRWLSnYab4yavH9DPWhDoAKvSxS
   xV9UT2JxIiESbLNUKdOXh2xjxdlydCsM54cyOeJ9/xMXu06PaKKWbRAKe
   AppyTvUE5QGiQqB4zsX6qZiGAjMjsetKYIPl2W5Q3xalVrdRoPU8gy9Oo
   FGc/tQNs+taz1ToNaYEJH7St9lGxLZ2Y4GkZHfJlJIfmczP6PJddPNu35
   2+npQnrIkKZx3ZqaAjhIa3ll9Gu2+SLwtZeu3fChRI0vQWT9vPoaK2qUY
   8w7Mw4flpMhCtG+sfaPoqbOFZSzoKXNYpnXyulN87Q3c7Y/+vm7Bbe8sg
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="143596037"
X-IronPort-AV: E=Sophos;i="6.08,261,1712588400"; 
   d="scan'208";a="143596037"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 17:27:42 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4C04EE428A
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 17:27:40 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 92C32D21AB
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 17:27:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1F6BD2007CA9A
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 17:27:39 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id ADC1F1A0002;
	Mon, 24 Jun 2024 16:27:38 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] rt-tests: upgrade 2.6 -> 2.7
Date: Mon, 24 Jun 2024 16:27:20 +0800
Message-Id: <1719217640-2921-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719217640-2921-1-git-send-email-wangmy@fujitsu.com>
References: <1719217640-2921-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28476.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28476.006
X-TMASE-Result: 10--1.937600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yY6MisxJraxHkdS3kPlaZyXfUZT83lbkEO79
	DJRUi35pyfN0KynvEPL6sV6aK5FCibVQ6XPWwtdyEXjPIvKd74AL//VMxXlyEzQQTVweW/TMhQ6
	YZNvnIb/nk+PPhXCmbP0o/1pwjPyzHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w60GG
	M6bDspusfxGTZ+5WDpw7hfeZkczEfj7/Bx5TKOi09z1Dr2jxXkVReX+1kw3koTpkVgqY1xWIGOk
	b+mUBoSKo8tQnv2WDyCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 08:27:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201069

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
refreshed for 2.7

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch  | 4 ++--
 meta/recipes-rt/rt-tests/rt-tests.inc                         | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
index a1fc9e26a0..d5bd7fe523 100644
--- a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
+++ b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
@@ -18,8 +18,8 @@ diff --git a/Makefile b/Makefile
 index 223a839..a735584 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -1,6 +1,6 @@
- VERSION = 2.6
+@@ -2,6 +2,6 @@
+ VERSION = 2.7
 -CC = $(CROSS_COMPILE)gcc
 -AR = $(CROSS_COMPILE)ar
 +CC ?= $(CROSS_COMPILE)gcc
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 70315c4694..3fbdfa2038 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,5 +1,5 @@
-SRCREV = "217cd8518c5f7777d490892aa9c765a6b2782cb5"
-PV = "2.6"
+SRCREV = "5bd94923ffda2ab326d081926dbfc6775fb5050b"
+PV = "2.7"
 PE = "1"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=main;protocol=https"
-- 
2.34.1


