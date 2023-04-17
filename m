Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4139DC77B7C
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 08:05:11 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.48714.1681718703929614308
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Apr 2023 01:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jmIvF6qY;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681718702; i=@fujitsu.com;
	bh=fNGi5ELoD/vdsetMNcgyvJq59Wsfa9zf1K6w0AsyJ+M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jmIvF6qYL6dK4EO6m1Tu+PEZU7Iz2fr3T8RYcX8sF9FMnIYpfwJXvvOmIVf58xib0
	 16jptqamMVRcErMXeI/lRW2Xle5IeUplCclKaAzajtAzFOVvxO09hCvU/e8B5L92n5
	 K55NovQmd9YXzMChGKrsLAhFmbl1K+HJM06wP9F0H+bPo8i8rd/yaxFySP9Efzn4FL
	 cMly/Q7qpX4gqGLGF6eVMAELNkP7+HXxdCjobTVOTDvjJukUVW248IXns2nh9b2ymo
	 0nohLf7vrqz+I18qACz8ue6TemnBCMIlxjJRiv3Mxk3eiGW0UMHZzvWk2GMQ7Vh2AX
	 4STRhrSRvZJgA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORpLv2r02
  Kwb/9mhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0b3/b2sBY84KtreLGRpYGzi6GLk5BASeMAo
  0beSuYuRC8i+wiSx9u5MVghnL6PEp5Mb2UGq2ASkJG7c/8/WxcjBISKgJ3H1nyhImFlAReLF7
  x6wEmEBE4lfj+4ygdgsAqoSDz7dYwSxeQWcJI7d7QKLSwgoSEx5+J4ZxOYUcJY4cWwmC8QRTh
  JLl91nhqgXlDg58wkLxHwJiYMvXjBD9CpKzL7czAJhV0q0fvgFZatJXD23iXkCo+AsJO2zkLQ
  vYGRaxWhWnFpUllqka6iXVJSZnlGSm5iZo5dYpZuol1qqm5dfVJIBlEosL9ZLLS7WK67MTc5J
  0ctLLdnECAzdlOLE2zsYl/f+1TvEKMnBpCTK+yLVOkWILyk/pTIjsTgjvqg0J7X4EKMMB4eSB
  O/LnzYpQoJFqempFWmZOcA4gklLcPAoifAaPwNK8xYXJOYWZ6ZDpE4xKkqJ877+A5QQAElklO
  bBtcFi9xKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV52YCIQ4snMK4Gb/gpoMRPQYjklsMU
  liQgpqQam/f06db4GS2M3bo6/df3JbtlkUZU8AeMjGzT+ixW9lNL3t4o6ous7deXu70Xzo1xO
  bPZfsu3QuXbHgrL9FRFW/D0RYcVaO90K+zjDTx/8pbZQfdL5C4+Ttjv9qnhW36gYz1AyIVfqg
  u+rNUc6/63yX27yYKrVVFWdrVE+ayeuCp4adfVozNNiOY47jgt2/uTIzP857WO+l1l35LyOw5
  YG5ms1N91ZuzX87j9Wya557pJJhc2zf+16v8nu/Y1Nr41bj3Ptn1IvqC7brfy4sSuhWu3F63m
  5kt3rdJ4uMnr2vnHuCp1/V4x7fbXuTtr+kD9X8axLZuRSrr0LM/3XPsp62qHSJ/h+vtIUs5U6
  KTdeKrEUZyQaajEXFScCAORc6VpYAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-732.messagelabs.com!1681718701!221737!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26519 invoked from network); 17 Apr 2023 08:05:01 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-3.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 08:05:01 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 1CCF91B3
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 09:05:01 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 10F731AC
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 09:05:01 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 09:04:59 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ofono: upgrade 2.0 -> 2.1
Date: Mon, 17 Apr 2023 16:04:31 +0800
Message-ID: <1681718671-19418-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681718671-19418-1-git-send-email-wangmy@fujitsu.com>
References: <1681718671-19418-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 08:05:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180150

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-connectivity/ofono/{ofono_2.0.bb => ofono_2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/ofono/{ofono_2.0.bb => ofono_2.1.bb} (95%)

diff --git a/meta/recipes-connectivity/ofono/ofono_2.0.bb b/meta/recipes-connectivity/ofono/ofono_2.1.bb
similarity index 95%
rename from meta/recipes-connectivity/ofono/ofono_2.0.bb
rename to meta/recipes-connectivity/ofono/ofono_2.1.bb
index afd43d26f3..0ecac9e11c 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.0.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.1.bb
@@ -13,7 +13,7 @@ SRC_URI = "\
     file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch \
     file://0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch \
 "
-SRC_URI[sha256sum] = "b0a31bf4d8ff3030c4aef9f8413df999c54df9db2ff0a1d3ec1710e0a9d1a49e"
+SRC_URI[sha256sum] = "92913dcce9a15cac2174daca249457716a0ec036878d22035e83af0e19e79c52"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
-- 
2.34.1


