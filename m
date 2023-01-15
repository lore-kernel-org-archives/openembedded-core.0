Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1387FC3DA78
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 05:26:07 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.134826.1673760364959868673
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jan 2023 21:26:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MipaSle2;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673760363; i=@fujitsu.com;
	bh=xhBNi5louHjXnUaRGYFowvyfxg39ecmWXoI/BOfSLlU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=MipaSle27Z7UQ74lelhK8J+AB4cbSPCK7vQhHYbucxsOuSSAckO5gjeuk2osz3WH1
	 DfI5KnfJACeQy/Cl+zzuEMLuQgMoUE9AVZ8r7Dg3K4aJe2zcHlfbKqF4Hjailr3fXl
	 aQ2PiSVfhwmJtKXEnOWg0SQGOONxGNKZAepCn6h4YvRuuO5CDSfK4Ygra/4GlNYpo6
	 BqsUETuPwf5HZJR9fS25Sx4VQK4L9bIbxu9aH/1QyJWoSguMuUs8o2AuCuaKgc2f+4
	 Wp32CsB+k6EVd/VqJ4KKSLcVw0sQMt0W7QIP++uFOC2vOMfC1kbRl323zeILe5m5LC
	 S1R/JwRevVoig==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORpJvVdzj
  Z4NROEYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeP+jXksBT85Ki49msXYwNjN0cXIxSEk8IBR
  4uGVw+wQzmUmiUezFrJAOHsZJU6v6wZyODnYBKQkbtz/z9bFyMEhIqAncfWfKEiYWUBF4sXvH
  nYQW1jAQeJG0042EJtFQFVi5s+njCA2r4CjxIy2qUwgtoSAgsSUh++ZQWxOASeJw9s/sYLYQk
  A1s6auY4eoF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdKtH74BWWrSVw9t4l5AqPgLCTts5C
  0L2BkWsVoXpxaVJZapGtooJdUlJmeUZKbmJmjl1ilm6iXWqqbl19UkqFrqJdYXqyXWlysV1yZ
  m5yTopeXWrKJERi+KcUpF3cwPln2R+8QoyQHk5Iob+S3Q8lCfEn5KZUZicUZ8UWlOanFhxhlO
  DiUJHg3NB5OFhIsSk1PrUjLzAHGEkxagoNHSYRXuwMozVtckJhbnJkOkTrFqCglzvuiByghAJ
  LIKM2Da4PF7yVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrxPQabwZOaVwE1/BbSYCWhxSP1
  BkMUliQgpqQamdOaJ/h7Bbqy7pB9X+zPtqe/QO3HnzCS/j9cTVpksTUg4u1iH16utlj/g1a46
  s1dCZbaKRae0Txd+DTnQJ2mv9S7+zcw5iiyX0jnra3rDJxwJSNF/vtf5UvGlY/93bfwW4pFnI
  +kk+1X2clxzMOctO5X69ZMjK/gV24xVTnpt5vc+xJPI1Cjvr3VYkfWJNzeD3tzXu/3tzjH/MJ
  asle4yPvwlZlrW/baTE7e7XCwMffRPhPepDN/jPzIn7dJqbjWf+ne4SeHGlwTDzKT7uw4wFdx
  IOn3evYZ/nnnu6q33g1uqTJfozBTbEST5ZNuZnNwTnJU36zdM+bP5P0vndp/IGpMjb4MEGWxW
  2P/XmKfEUpyRaKjFXFScCACmC1FJWgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-732.messagelabs.com!1673760361!12731!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5982 invoked from network); 15 Jan 2023 05:26:02 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-21.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Jan 2023 05:26:02 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id C07101AF
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:26:01 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id B4DCB7B
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:26:01 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 15 Jan 2023 05:25:59 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pbr: upgrade 5.11.0 -> 5.11.1
Date: Sun, 15 Jan 2023 13:25:38 +0800
Message-ID: <1673760341-2623-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673760341-2623-1-git-send-email-wangmy@fujitsu.com>
References: <1673760341-2623-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:26:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175878

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog
=========
* Run PBR integration on Ubuntu Focal too
* Remove numpy dependencies
* Tie recursion calls to Dist object, not module
* Update tox.ini to work with tox 4

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pbr_5.11.0.bb => python3-pbr_5.11.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pbr_5.11.0.bb => python3-pbr_5.11.1.bb} (33%)

diff --git a/meta/recipes-devtools/python/python3-pbr_5.11.0.bb b/meta/recipes-devtools/python/python3-pbr_5.11.1.bb
similarity index 33%
rename from meta/recipes-devtools/python/python3-pbr_5.11.0.bb
rename to meta/recipes-devtools/python/python3-pbr_5.11.1.bb
index 16967f6d17..520dbef8dd 100644
--- a/meta/recipes-devtools/python/python3-pbr_5.11.0.bb
+++ b/meta/recipes-devtools/python/python3-pbr_5.11.1.bb
@@ -1,4 +1,4 @@
 inherit setuptools3
 require python-pbr.inc
 
-SRC_URI[sha256sum] = "b97bc6695b2aff02144133c2e7399d5885223d42b7912ffaec2ca3898e673bfe"
+SRC_URI[sha256sum] = "aefc51675b0b533d56bb5fd1c8c6c0522fe31896679882e1c4c63d5e4a0fccb3"
-- 
2.25.1


