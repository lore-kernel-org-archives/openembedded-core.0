Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECDEAC77B72
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 07:05:00 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.47937.1681715091823307632
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Apr 2023 00:04:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rXH3c3RT;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681715090; i=@fujitsu.com;
	bh=INDxEEM1fknOzI5DfgprUGGrmlqr3NZhLbaPZTcb4SM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=rXH3c3RTRTmdJ8w8XX8cWuer0cO9uX3E/aX0+3sGtZEckGG0GgqHc7fjBCOPdH7t+
	 C65u4VCfGonbVJke1/n83mCZbEH06zx51MxYQc0rpKuxbTnFDhChG7IzEogwAfECsi
	 hbIqCi2JfYWWFtre0Azfj1IUfReKSyAjtp8gwGycmfRInpN2RjJ6DwynJhpLBcvS8e
	 BEIWAwyhUAe8lSsesJzvh62zcqP3jRul3cA6kW3rxx/RvFn097Cxo9FZxd3jAHSjBX
	 YguYMsTMh/3LTHkd+dhrMFaHFnPXZ+lNT9AVPQzQV2KzuOC630htJkmGFxyhiY9zo2
	 x05JHjvJJgmzQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8OxWXfie5s
  Ug5n9+hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bCj1PZCl5zVJy8/Z2xgfEPexcjF4eQwANG
  iY8X7jFBOFeYJA7OuMcC4exllFh1r4m1i5GTg01ASuLG/f9sXYwcHCICehJX/4mChJkFVCRe/
  O5hB7GFBRwkXn7rAytnEVCVuH3rBStIOa+Ak8Sbg/kgYQkBBYkpD98zg9icAs4SuybfZgOxhY
  BKfj1dAzaGV0BQ4uTMJywQ4yUkDr54wQzRqygx+3IzC4RdKdH64ReUrSZx9dwm5gmMgrOQtM9
  C0r6AkWkVo2lxalFZapGuhV5SUWZ6RkluYmaOXmKVbqJeaqlueWpxia6RXmJ5sV5qcbFecWVu
  ck6KXl5qySZGYOCmFKs93sG4te+v3iFGSQ4mJVHeF6nWKUJ8SfkplRmJxRnxRaU5qcWHGGU4O
  JQkeBte26QICRalpqdWpGXmAKMIJi3BwaMkwmv8DCjNW1yQmFucmQ6ROsWoKCXO++cNUEIAJJ
  FRmgfXBovcS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEea+9AJrCk5lXAjf9FdBiJqDFckp
  gi0sSEVJSDUw9JR+yzoQ0/HzVfCFs3+1mSz7r8/ws33dZyR7LKuDPcVyyj+H7PeOCOZkWAVX+
  xl19Vxz4srb4Hv5wKvfw3o3aIjar9mo4X7901it2/RM9EVemzONyTZXWQpdubYmPjAl4p5V98
  qUCs9bapvmXrz+TeTXtwPoMDtvFRkf4n3dV7dc41v1YmadP/lH7886opZYtpdcnb+1IZEzZLh
  Z+4mZY4bve8uO/Dk3OET7J7cEstPXgdvn6N/t3fXs866LLn04z9cRa1Y+rI9pEA356//B3u/d
  je/K/XDYht9WqjxoXp15Rif+78vr2ioNijA//zZXn3HDvnVXoi10OcZYL5ecaWu+tcbzF5nzw
  xtKvi/8psRRnJBpqMRcVJwIAt1htA1cDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-565.messagelabs.com!1681715089!430127!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19575 invoked from network); 17 Apr 2023 07:04:49 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-16.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 07:04:49 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 77D85153
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 08:04:49 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 6B947151
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 08:04:49 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 08:04:48 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] tcsh: upgrade 6.24.07 -> 6.24.10
Date: Mon, 17 Apr 2023 15:04:32 +0800
Message-ID: <1681715072-18848-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681715072-18848-1-git-send-email-wangmy@fujitsu.com>
References: <1681715072-18848-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:05:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180142

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
   - Avoid non-default settings in system-wide init files.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-shells/tcsh/{tcsh_6.24.07.bb => tcsh_6.24.10.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-shells/tcsh/{tcsh_6.24.07.bb => tcsh_6.24.10.bb} (94%)

diff --git a/meta-oe/recipes-shells/tcsh/tcsh_6.24.07.bb b/meta-oe/recipes-shells/tcsh/tcsh_6.24.10.bb
similarity index 94%
rename from meta-oe/recipes-shells/tcsh/tcsh_6.24.07.bb
rename to meta-oe/recipes-shells/tcsh/tcsh_6.24.10.bb
index f136c06b7..abeb6e803 100644
--- a/meta-oe/recipes-shells/tcsh/tcsh_6.24.07.bb
+++ b/meta-oe/recipes-shells/tcsh/tcsh_6.24.10.bb
@@ -13,7 +13,7 @@ SRC_URI = " \
     file://0001-Enable-system-malloc-on-all-linux.patch \
     file://0002-Add-debian-csh-scripts.patch \
 "
-SRC_URI[sha256sum] = "74e4e9805cbd9413ed34b4ffa1d72fc8d0ef81a5b79476854091416ce9336995"
+SRC_URI[sha256sum] = "13475c0fbeb74139d33ed793bf00ffbbb2ac2dc9fb1d44467a410760aba36664"
 
 EXTRA_OEMAKE += "CC_FOR_GETHOST='${BUILD_CC}'"
 inherit autotools
-- 
2.34.1


