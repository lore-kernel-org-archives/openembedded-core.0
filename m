Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B8CC433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 08:22:29 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web08.4811.1665476544650614273
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 01:22:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=W33XIALA;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665476543; i=@fujitsu.com;
	bh=CadG+gGlzG2pvVkTNhnS4SMUDEBpH/FDWXmHpN7LIo0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=W33XIALAPC2ZpvjRvQ2gBqtCf+JCJmnjWktf5kx47DMr3V2nqKGlVe7o45fJXmr+o
	 5xSGKbcHbR0qtUVWGS0m6nloSyLEZ6bENWFsTIBpvbaYUzmb4tm/hnKH9QcKZV0nWY
	 pU6wlk/tHYF3o12Ch28LL8MN12iHtD/tD/Za9iWnzqbSwqqjsqTpGy3+oVwNnVi1Id
	 FxyKutslVGAh6Z/81AO02CzjYc5OtKmMsSTMuGK0Rxj1tT7rjK3HNpsAYWJIY/08sA
	 MM2pJT0GY2hZ4TJnSp1gva+hIFNcQmM9jlBODyK8z/6kR7UchAocVB1rwGvVZ8sQw5
	 N1StFaHIrj5gQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8ORqLtP3TX
  Z4N9/ZYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeP6n9/sBS85KpZv6WJrYGzk6GLk5BASeMwo
  ce1ncBcjF5B9jUni+dqbrBDOHkaJUzsmsoBUsQmoSUy/dQMowcEhIqAncfWfKEiYWUBF4sXvH
  nYQW1jARuLYyXYmEJtFQFXi/PNNYOW8Ak4SEw5WgoQlBBQkpjx8zwwS5hRwlmhYGghxgpPEur
  Mb2EBsXgFBiZMzn7BATJeQOPjiBTNEq6LE7MvNLBB2hcSsWW1MELaaxNVzm5gnMArOQtI+C0n
  7AkamVYxWSUWZ6RkluYmZObqGBga6hoamuma6hmaWeolVuol6qaW65anFJbqGeonlxXqpxcV6
  xZW5yTkpenmpJZsYgeGbUsy2cgfjyr6feocYJTmYlER5rz53SRbiS8pPqcxILM6ILyrNSS0+x
  CjDwaEkwftC1TVZSLAoNT21Ii0zBxhLMGkJDh4lEd6lKkBp3uKCxNzizHSI1ClGXY6ZX9sOMA
  ux5OXnpUqJ87apARUJgBRllObBjYDF9SVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrwrQKb
  wZOaVwG16BXQEE9ARJ686gRxRkoiQkmpgci/QTu8xDEjeaDtt7ynb+QXB21g/lRRa7QjLZS1f
  KKWWXDS7I8BZN+v0wtozhg+jtj5v0Eo4bLDMT8Yl50F798ae5i+JEZGhPJNuHJ34acdbbb3+f
  3JLZwSGtGo7uDbcUOfcfYFRjrfXvHg9y9O7PM5bT61l+H5t88FXBxcai+mX5z7Y+fFpgfQ1l3
  g718BJZ5NUWXj5/T/OnS3Ez+tpcmg5byJbmONkdo21N89GskU7r59169ILi3+z/JYUsv809nK
  4Ihe9IsR1v9WCbxJc5ScqH0z9NlN5xaFGv1OGhz5vuxPwN+msfrHuxDLelJKkg69fe63Ss78f
  3/r6LXcya7z1zHKV2fbdB57vejBLiaU4I9FQi7moOBEA2T8teWYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-587.messagelabs.com!1665476542!292391!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1039 invoked from network); 11 Oct 2022 08:22:22 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Oct 2022 08:22:22 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 3A4F1100191
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:22:22 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 2EAA2100043
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:22:22 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 11 Oct 2022 09:22:20 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] sqlite3: upgrade 3.39.3 -> 3.39.4
Date: Tue, 11 Oct 2022 16:21:48 +0800
Message-ID: <1665476508-16543-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665476508-16543-1-git-send-email-wangmy@fujitsu.com>
References: <1665476508-16543-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 08:22:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171610

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sqlite/{sqlite3_3.39.3.bb => sqlite3_3.39.4.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.39.3.bb => sqlite3_3.39.4.bb} (86%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.39.3.bb b/meta/recipes-support/sqlite/sqlite3_3.39.4.bb
similarity index 86%
rename from meta/recipes-support/sqlite/sqlite3_3.39.3.bb
rename to meta/recipes-support/sqlite/sqlite3_3.39.4.bb
index fce497e0e1..fefab16e64 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.39.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.39.4.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "7868fb3082be3f2cf4491c6fba6de2bddcbc293a35fefb0624ee3c13f01422b9"
+SRC_URI[sha256sum] = "f31d445b48e67e284cf206717cc170ab63cbe4fd7f79a82793b772285e78fdbb"
 
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_IGNORE += "CVE-2019-19242"
-- 
2.25.1


