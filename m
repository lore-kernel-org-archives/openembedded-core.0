Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A98C41513
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 09:44:29 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.10234.1720604659026825604
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 02:44:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UihwABHl;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1720604658; x=1752140658;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=UZprK5TJa9b13JZJ7GqusC+RqMruGBDya3NsJihNpJc=;
  b=UihwABHlZpRDv/WsNfeZ5m8HxgPF4yzFJYf6kDBQX+r+6oygz2JggWz9
   Jdzlj3Y+O7PhFeko1FBEBnFJZNjdF6/SwY4Kf81VBIcjMZVS+ti2TbhlE
   PBo55onuOvJyM1VOLLzgFVjig1nJmWl2VjmZXcsUmUsjn9rDmpQtm4HNT
   b0Iyc2YBK2RSX24MkPs1rDmK6hDp+hoApJod87rcmYXWMrQqZerOip23t
   +/YksMl9v4ILuqas649DAslU3K2BbXRN9je9nIcunBA83fBz5dKcH0VXu
   BS2G+XNy8ImYrpw461qXZDAZGgaKTQPrRUTHdsR7A4+xtPzEwIhWeE2mG
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="153920547"
X-IronPort-AV: E=Sophos;i="6.09,197,1716217200"; 
   d="scan'208";a="153920547"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 18:44:16 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C1AB6C68E1
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:14 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1A1E4D510E
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A5DC4220028
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 55F0C1A000C;
	Wed, 10 Jul 2024 17:44:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/30] libdnf: upgrade 0.73.1 -> 0.73.2
Date: Wed, 10 Jul 2024 17:43:37 +0800
Message-Id: <1720604634-23406-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
References: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28520.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28520.006
X-TMASE-Result: 10-1.370100-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrJ4cwIYL6KudbZOaNxHud3uaG
	g/Bit59t52j//fdMI2tGz27Qd5AiYNGETJv1/WyOP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6wYUB/Gxrq/A+Ic2U8xeYHyGOiXr1rOL51e7Xbb6Im2n0tCKdnhB58I/9UW5M5dRN2X4
	hUU77xnuTCMddcL/gjxlblqLlYqXIr+AMV+t8rG09EYLngSaiGTtl0Us+/7DapTbSmBklDhTMX4
	PLUgynonVPlD9onHwDQjTty1MEscKB6emgdGhF9aeNrKaTNfCn+v9v52ZIoWjoAf389xF3XFSk9
	HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 09:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201710

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- context: use rpmtsAddReinstallElement() when doing a reinstall
- MergedTransaction: Fix invalid memory access when dropping items
- ConfigParser: fix use-out-of-scope leaks
- Since we use rpmtsAddReinstallElement rpm also uninstalls the package
- Fix countme bucket calculation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libdnf/{libdnf_0.73.1.bb => libdnf_0.73.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.73.1.bb => libdnf_0.73.2.bb} (97%)

diff --git a/meta/recipes-devtools/libdnf/libdnf_0.73.1.bb b/meta/recipes-devtools/libdnf/libdnf_0.73.2.bb
similarity index 97%
rename from meta/recipes-devtools/libdnf/libdnf_0.73.1.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.73.2.bb
index 3ab840b1b0..ed433d4a9f 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.73.1.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.73.2.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;p
            file://armarch.patch \
            "
 
-SRCREV = "0120e70747dcf05e716792e2e846c62eccd44319"
+SRCREV = "86bbb159732e43dd6dff98c96e99382843f7c63b"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


