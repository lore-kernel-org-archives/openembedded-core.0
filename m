Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BABF9C02184
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 08:29:02 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.40580.1736843332539817542
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:28:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Vue/OuCK;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736843333; x=1768379333;
  h=from:to:cc:subject:date:message-id;
  bh=uD8hmAtdGz9JtT/IXm5Bdr4pyYb+jC/gLHIJZmWdoNk=;
  b=Vue/OuCKIHmGRmiYXn+3f4EmcEt9dMWhO7G3y7JtTmYhdQVJjHdGb1hJ
   +nP8So2YkOe47syrdxhZ2MfRzOxxQJEH+vCdxeGbUigykCrtOPHz+CwuG
   s27U03L5yixstxTdhmCOMkVKwxPGUneAPF20wUi9/n5cA3dwKeQxZJ5GT
   mqxh5pYSRCyhUquduwAXrIuqU6nY5NdJ619wdqu3rd3SsML3iweiFluhU
   93etMF7RTNOSQkzAFiKYmaoYKXUeIp613n03g1YwJa+xAqZOZ+UsyIv3U
   Ypu6gMrVM12nPvD/50Ls7bjOnXLvyGXORy1wVSoKKAUQZRb+VzSISdqhF
   w==;
X-CSE-ConnectionGUID: Cc0XimTOTeOrVgs8icmvKg==
X-CSE-MsgGUID: O2fBwNkJTn2SJVWTurG25w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="186435816"
X-IronPort-AV: E=Sophos;i="6.12,313,1728918000"; 
   d="scan'208";a="186435816"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 17:28:36 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5F31AD4808
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 17:28:34 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3912EBF4BA
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 17:28:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A942B20071A35
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 17:28:33 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1ECE91A000B;
	Tue, 14 Jan 2025 16:28:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [PATCH] [OE-core] [PATCH v2] ncurses: Fix install conflict when enable multilib.
Date: Tue, 14 Jan 2025 16:28:28 +0800
Message-Id: <1736843308-4094-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28922.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28922.006
X-TMASE-Result: 10-0.410800-10.000000
X-TMASE-MatchedRID: BoYRaA2j95xxFlVx+W7c0AkbCeJRcz4zuw1VED4royYIzRqIBWkBLO4F
	rhD6LAW/0S0M0e/x7cvj2hhsFJdmFSNvqM5/miSs8t4fUUGeErTBOVz0Jwcxl6vCrG0TnfVUvqn
	FtM6Nq/LQGlxIVvV/XoAy6p60ZV62G2i4y8P2xXmtIWznhjjBtfoLR4+zsDTtnlVv2XS+do943G
	jC+656DJZQR5Y9FP6TuvPyk72FB0SDCDXRLCAhHd6SsuG1aIheo4OJu3oM0ltyelx/6jLLOFz3n
	duBolfQ0mw48P9E/mjyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 08:29:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209783

From: Wang Mingyu <wangmy@fujitsu.com>

After enable multilib in armv8, there are differences in the terminfo files between lib32 and lib64 packages.

The differences of kbs between ncurses-terminfo nad lib32-ncurses-terminfo are as follows:
--- armv7ahf-neon-pokymllib32-linux-gnueabi/lib32-ncurses/6.5/image/usr/share/terminfo/x/xterm+kbs2025-01-14 03:45:45.669478283 +0000
+++ cortexa57-poky-linux/ncurses/6.5/image/usr/share/terminfo/x/xterm+kbs2025-01-14 01:18:20.497366368 +0000
@@ -1 +1 @@
-%8xterm+kbs|fragment for backspace key??????????????????????????????????????????????????????????????????????????????????????????????????????????????
\ No newline at end of file
+%8xterm+kbs|fragment for backspace key??????????????????????????????????????????????????????????????????????????????????????????????????????????????
\ No newline at end of file

After consulting with the upstream of ncurses, it is possible to specify kbs by setting --with-xterm-kbs=XXX.
Based on the instructions in https://github.com/ThomasDickey/ncurses-snapshots/blob/master/configure#L9810,
it is appropriate to add --with-xterm-kbs=del.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/ncurses/ncurses.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index e96ee075bd..3f93550cf9 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -70,6 +70,7 @@ ncurses_configure() {
 	        --without-debug \
 	        --without-ada \
 	        --without-gpm \
+		--with-xterm-kbs=del \
 	        --enable-hard-tabs \
 	        --enable-xmc-glitch \
 	        --enable-colorfgbg \
-- 
2.43.0


