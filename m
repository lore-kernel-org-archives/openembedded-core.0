Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 047FEECAAD1
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 04:12:12 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.7741.1661832730353919101
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 21:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=meMRMXyH;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661832728; i=@fujitsu.com;
	bh=5C6X+6RWjt25AHjsJwJlSUctc/u6nIN4Zuy7/UXOyiA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=meMRMXyHr6sYjLcyExA+2i9gKGKRYXEt0IVGDGGMRtKfRATKZTdJqpd9QM/XRdM0a
	 XTzHLT99jhzGZ2X/4mCKJL6LdydkIzLqw+g8kKVD/sBWolDw3liGdfajM5uSZ3Dh1U
	 KuzUHSYQMmOlBQLt5+h/Pbj8ELtVa2TyjU8QlzIkvr+D9meTu7UDmLB0DEsSHm9M6a
	 ryagvB1iYIBeZufiuOWduml2HtG0uXAa+ls0tUxq2XLxPKEmzHJD6ZWE7PBgRkK5kl
	 b+v20/qXmNfJpY7jOGBBtC5KPiIXxDMotnOH0Jwwad5uhuqdJ7aN4gp9uIMDmFNX7v
	 WJTpyk+a+cS4A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8ORqCvRx5t
  ssC7P4s7Pd+wOjB7nNq5gDGCMYs3MS8qvSGDNuHZvL2PBeo6Kjw1PGBsY97N3MXJxCAk8ZpT4
  s28+I4RznUni7oFrLBDOXkaJpa9+ATmcHGwCahLTb91g7WLk4BAR0JO4+k8UJMwsoCLx4ncPO
  4gtLOAg0d7ziBnEZhFQlfj48hFYK6+Ak8S+T7fBbAkBBYkpD98zQ8QFJU7OfMICMUdC4uCLF8
  wQNYoSsy83Q9VXSuyZ1c8EYatJXD23iXkCI/8sJO2zkLQvYGRaxWidVJSZnlGSm5iZo2toYKB
  raGiqa2ysa2huqZdYpZuol1qqW55aXKJrpJdYXqyXWlysV1yZm5yTopeXWrKJERiUKcWKm3cw
  Tlz5U+8QoyQHk5Io78JW3mQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKEryXu4FygkWp6akVaZk5w
  AiBSUtw8CiJ8Hp3AaV5iwsSc4sz0yFSpxh1OWZ+bTvALMSSl5+XKiXOO6EHqEgApCijNA9uBC
  xaLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5t0AMoUnM68EbtMroCOYgI54uIQb5IiSRIS
  UVAPT5PuLzM4kmby+77vxzU+blS92Rm53YTLiYjjc/CenOj7y7h/Tv4rsLbO3z1x3a9vWjwsY
  s/nCvPmbN5TrdpXW75jeto8189S0e5Hrrvb5d9bNUW66nXHCbIH4sff3l/FN+SJ6IUdpUiMDo
  1Vlj7ej9I/5O+690PJfET/D267i1bk9zbvmnXAIsdVPs8vJyRbkOPn2Wudf6Zu1r8Se2Ucuaa
  ++xfHX+up+DSGFO7HbDszWbpEu3ZHiuOfnXbuEJq8TGjwvjm2xSdXWezezYudG6a/VAst7p2p
  OexozczMHa3qh5uvaWX+nZC09WNDA1OkqcvFkWmfsjAs/2FkaHP40Tco6dJ+1J4rzW+uV+X9C
  lViKMxINtZiLihMBUnNNy1EDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-548.messagelabs.com!1661832727!28199!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3823 invoked from network); 30 Aug 2022 04:12:08 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-19.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Aug 2022 04:12:08 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id B3F5210018D
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 05:12:07 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id A7473100043
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 05:12:07 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 30 Aug 2022 05:12:05 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] lttng-tools: upgrade 2.13.7 -> 2.13.8
Date: Tue, 30 Aug 2022 12:11:48 +0800
Message-ID: <1661832712-12546-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 04:12:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170052

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lttng/{lttng-tools_2.13.7.bb => lttng-tools_2.13.8.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.13.7.bb => lttng-tools_2.13.8.bb} (99%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
similarity index 99%
rename from meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
index 1a972ec836..a814eb79f9 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
@@ -39,7 +39,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://disable-tests.patch \
            "
 
-SRC_URI[sha256sum] = "d17a02e8f178a7cf3403e3c9edfb90ad3a1628e20aa0b5131408ae47f722f08d"
+SRC_URI[sha256sum] = "b1e959579b260790930b20f3c7aa7cefb8a40e0de80d4a777c2bf78c6b353dc1"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
-- 
2.25.1


