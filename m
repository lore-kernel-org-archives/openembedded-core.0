Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1026EC43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 07:45:48 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.6509.1657611937287245746
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 00:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=t6+SFMhs;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657611935; i=@fujitsu.com;
	bh=lajGMv1Jv/iOt9ZaCYdcIfZzcn3N1GJSZNrTa8tMRk4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=t6+SFMhsF1NPydork1FdnqjXLsSiwugYDCgYXp0dgBfYMq1LRFZzFY6Nus4ZR7NmB
	 qpS/FZgU6cXeA5CyTcMcpBzZecjHp5G+Nzf38ZiD+EE3f8yyVe1b6NqopMQqeICnQr
	 zKbtxAMlIfezODmMrJHcs0jJZsH07cdq2SLKcLf30GXJPpmS5slKOX9OXtCLx/Z2An
	 UXAt97uu1lwcSwZO1C4xBj+nUpOUYyjNcBtu5+MoI51NR8foq4OrlkzREx6fr4K0XE
	 SJBYHEZoskdBJ++Z4SUeqPgBbkG54dpMHI8f/YTbnI1ie2nnGVLCgoUx4yQCjWZbzN
	 4ycQXYPlgMHRw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORpDtP7Wy
  SwaetBhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aPOT2MBbM4K7ZMvsXcwLiWo4uRi0NI4AGj
  xJ1D81khnEtMEk3zbrBAOHsYJWZ8uMPWxcjJwSagJjH91g2gKg4OEQE9iav/REHCzAIqEi9+9
  7CD2MICrhKn1s5lASlhEVCVePYqDSTMK+Ak8ebkAkYQW0JAQWLKw/fMIDangLNE4+9DTCC2EF
  BN14+v7BD1ghInZz5hgRgvIXHwxQtmiF5FidmXm1kg7AqJGTO2sUHYahJXz21insAoOAtJ+yw
  k7QsYmVYx2iQVZaZnlOQmZuboGhoY6BoamupaWgIpS73EKt1EvdRS3bz8opIMXUO9xPJivdTi
  Yr3iytzknBS9vNSSTYzAME4pTi7fwbh93y+9Q4ySHExKorx50meThPiS8lMqMxKLM+KLSnNSi
  w8xynBwKEnw2qgA5QSLUtNTK9Iyc4AxBZOW4OBREuE1UQZK8xYXJOYWZ6ZDpE4xKkqJ8wqoAi
  UEQBIZpXlwbbA4vsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmHcayBSezLwSuOmvgBYzAS2
  WizwDsrgkESEl1cAUKrvmcbC5+EQ3/62OcbpCSw581zjLwM9gezef8W5rr2/VhD2dr6xW1pT+
  6H1wbXZxdKfFobn5/fYrH25xYlzudi4s+cZEr3V5jfy8G/L4+bp+mTwpfr1T4cGp7Zrfa+cJP
  9rl53ijdH561sfbxnGT1s3tOiWWOHH9eX0Dy68Z9yztDE2tT/St7cu0lvFNv378yEGuBztKqg
  8qJQtx7PPsWmWfqWzi/7SffYnMiotXZz6c9+/lO24+m3uufhm31wlEvb52LjNny6bPess7Vz9
  adnDGkuObDhgIXd6a+CFr2YQeoZi2+sMvpx9SOvPj/QEuy9YVGdWrNQ+YV/K0si15kZzcG6j7
  T0dBJUNq5bRUJZbijERDLeai4kQAOu9Cy14DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-732.messagelabs.com!1657611934!83955!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11162 invoked from network); 12 Jul 2022 07:45:34 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-20.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Jul 2022 07:45:34 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 2BFFF1AE
	for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 08:45:34 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 20B827C
	for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 08:45:34 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 12 Jul 2022 08:45:32 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-jsonschema: upgrade 4.6.1 -> 4.7.1
Date: Tue, 12 Jul 2022 15:44:59 +0800
Message-ID: <1657611899-30825-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657611899-30825-1-git-send-email-wangmy@fujitsu.com>
References: <1657611899-30825-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 07:45:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167903

Minor tweak of the PyPI hyperlink names

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-jsonschema_4.6.1.bb => python3-jsonschema_4.7.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonschema_4.6.1.bb => python3-jsonschema_4.7.1.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.6.1.bb b/meta/recipes-devtools/python/python3-jsonschema_4.7.1.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-jsonschema_4.6.1.bb
rename to meta/recipes-devtools/python/python3-jsonschema_4.7.1.bb
index 5a5c80c821..f17f28a57f 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.6.1.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.7.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
 
-SRC_URI[sha256sum] = "ec2802e6a37517f09d47d9ba107947589ae1d25ff557b925d83a321fc2aa5d3b"
+SRC_URI[sha256sum] = "25203dbebd62a1179f810f14339f7a638baaf279b5cc3b738a58c3744af56d65"
 
 inherit pypi python_hatchling
 
-- 
2.25.1


