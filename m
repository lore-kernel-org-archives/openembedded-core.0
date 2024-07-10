Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D7D9C3DA51
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 09:44:19 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.10226.1720604654824863149
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 02:44:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rS6+DQ2s;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1720604654; x=1752140654;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=G3xhwR1F+f001D3mVhzu+WPygzjFAZTnvZckw5CYp70=;
  b=rS6+DQ2skMh3sLfAiJvJz6N9Dc/4Su6KBAygm2AovaoqQJoDMR1JK59P
   bfPwBZ3gdhgcI9GFJdz96zlHuFU5AlfTQBjfoLJqoWnEFcH5LFzzt+gWN
   itLzRqwwOSOBczLNvhvTJpfLvGqQu9ZgFLsjwMWA+tDqRJY04a3vEK3Va
   6d2S2v05tkN5ArYFid19f8g0NMgzY4oP57g+FU0oinxQIuRpRpPa7MOiu
   MDdoywX4kIlBhWIBkNE45oVko8eTn2excdyPyPlVgJaTazWkmO2N8W6Mz
   W1GPBWEs9jTPc6U9ILmDpejhGXtoa7t7x/sVc/YW1Lj8O0ZWBFVywbGgb
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="153920538"
X-IronPort-AV: E=Sophos;i="6.09,197,1716217200"; 
   d="scan'208";a="153920538"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 18:44:12 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7D6FFDB3AE
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:10 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id CD0F12084A
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:09 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 689102005018E
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:09 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 186691A0002;
	Wed, 10 Jul 2024 17:44:09 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/30] createrepo-c: upgrade 1.1.2 -> 1.1.3
Date: Wed, 10 Jul 2024 17:43:28 +0800
Message-Id: <1720604634-23406-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
References: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28520.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28520.006
X-TMASE-Result: 10--0.414400-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJonyuXBiUcuzxOjf3A4DTYuF9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrdjUt5E4cA0VfYLEqJ84/0fqSdCVzj8WWc88Mr4s0lpPQp03DY6c8b5IuM
	y3KhK/0TJmRIaViJEfyRKWqhoNN5AyTrXKhZpi+R0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 09:44:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201699

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 spec: Package Python examples

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{createrepo-c_1.1.2.bb => createrepo-c_1.1.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_1.1.2.bb => createrepo-c_1.1.3.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_1.1.2.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_1.1.3.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_1.1.2.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_1.1.3.bb
index 85b2901d50..2e08449812 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_1.1.2.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_1.1.3.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;p
            file://0001-include-rpm-rpmstring.h.patch \
            "
 
-SRCREV = "0ce71adda8a33ede9e9d21b7c18cc58d5a495849"
+SRCREV = "e93766dfc30f39b16d41f2d0eb130c92c16993ab"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


