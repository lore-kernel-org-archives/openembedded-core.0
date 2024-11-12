Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85920D32D79
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:26:06 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.82447.1731403559365140206
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eU+PS4Bg;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403559; x=1762939559;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=gkNLsIIFs3Dr9FJmhq1MdckmdRYtC0A3CXiEt0oDbys=;
  b=eU+PS4BgCN5OjKcU4soVf6WewQ+3QfHAzL1BiwOO3hTNl5Awf/mcIc81
   LMo6CbKGvPK8B9EbGe+BjngRqIwrHXJVB+lRQqHueU90TAUfgG+x0aaRT
   xECvBHtOLB3sbjv12vcYqYbpkBQfyCdzW0NrcSJiyiOr6CHz6wAlNajTU
   RjTZLT4kpP+FmQgK0Yr7vOTa/74/cbc8z0ZPWVUjs2JX+XTRLLCx47+Gz
   JKkxsubbqBRoyo+cQP4PQ8MzWrxahR4K8C3AIhKeM1hN18/RaxeaIpVq2
   CDtd19kbHoZlAtTYVrq0TTMu/o6zkF5f5OjfkYkbYZK9txRa3lW+VYcKN
   g==;
X-CSE-ConnectionGUID: VfQmcwyKTgqJOqLdzcGhCw==
X-CSE-MsgGUID: wD91GUGbTTqUJEqxNc85gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="182315592"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="182315592"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:56 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E3AD196742
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:54 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7284E3719F
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0415340996
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A6BF71A000A;
	Tue, 12 Nov 2024 17:25:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 43/47] sqlite3: upgrade 3.46.1 -> 3.47.0
Date: Tue, 12 Nov 2024 17:24:39 +0800
Message-Id: <1731403483-21399-43-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10-2.352200-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSC3IpruVSJ50r6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3HZonBD1OvODMmX
	cyFopTibi8zVgXoAltr8hWd4lAsFlFnjKVTYbDMDEQdG7H66TyHEqm8QYBtMOm4g8Y1Fq31Bqn2
	JhphRZC8V0ZGavLIHZkciStlIoDqAnWPEIeW9ZsbUbbrO0dkn4F9u+/Hz1yLBvJxa08pkIaEJ9G
	KyEFpj/gr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207031

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://www.sqlite.org/releaselog/3_47_0.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sqlite/{sqlite3_3.46.1.bb => sqlite3_3.47.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.46.1.bb => sqlite3_3.47.0.bb} (69%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.46.1.bb b/meta/recipes-support/sqlite/sqlite3_3.47.0.bb
similarity index 69%
rename from meta/recipes-support/sqlite/sqlite3_3.46.1.bb
rename to meta/recipes-support/sqlite/sqlite3_3.47.0.bb
index 62ea4a6ba9..35cc49aee1 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.46.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.47.0.bb
@@ -4,5 +4,5 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "67d3fe6d268e6eaddcae3727fce58fcc8e9c53869bdd07a0c61e38ddf2965071"
+SRC_URI[sha256sum] = "83eb21a6f6a649f506df8bd3aab85a08f7556ceed5dbd8dea743ea003fc3a957"
 
-- 
2.34.1


