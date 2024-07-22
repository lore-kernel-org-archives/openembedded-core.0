Return-Path: <w.egorov@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE4F6C3DA5D
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 08:58:53 +0000 (UTC)
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by mx.groups.io with SMTP id smtpd.web11.14171.1721638731362124561
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jul 2024 01:58:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=a4 header.b=WuvcT7rR;
 spf=pass (domain: phytec.de, ip: 91.26.50.163, mailfrom: w.egorov@phytec.de)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1721638728; x=1724230728;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=J94et+CTrYVx+nSghDGu58MDihpnFcidRALuvSGpLWk=;
	b=WuvcT7rR0DtifQvxchYhr79yf0TQbZBGQ5+qIOLk6XKl+pj/fonOaz/9giBGnnWH
	4rdlfBPMs7yjVWdecLQeWfkza7paMXdEi91KDfUTX8ofJGPjd/SVXHeWoidOD61p
	FHfSdHXFDcy0H/XQm/1o8Wmhrrl+9ge5dMzu8ZO7y48=;
X-AuditID: ac14000a-03251700000021bc-3c-669e1f48d123
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id A2.8D.08636.84F1E966; Mon, 22 Jul 2024 10:58:48 +0200 (CEST)
Received: from augenblix2.phytec.de (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Mon, 22 Jul
 2024 10:58:48 +0200
From: Wadim Egorov <w.egorov@phytec.de>
To: <openembedded-core@lists.openembedded.org>, <upstream@lists.phytec.de>
Subject: [PATCH] watchdog: Set watchdog_module in default config
Date: Mon, 22 Jul 2024 10:58:40 +0200
Message-ID: <20240722085840.2145487-1-w.egorov@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGLMWRmVeSWpSXmKPExsWyRpKBR9dDfl6awaa3khZ3fr5jt+h+p+7A
	5HFu4wpGj/7uFtYApigum5TUnMyy1CJ9uwSujAPvV7IU/GCr6FrVytrA2MbWxcjJISFgIvFy
	UzdLFyMXh5DAEiaJL+uvM0E4jxklZk/aDFbFJqAucWfDN1YQW0TAS+LduffsXYwcHMICDhKL
	GpRAwiwCqhJ9bzYwgti8ApYS145uYoRYIC8x89J3doi4oMTJmU9YQGxmoHjz1tnMELaExMEX
	L8BsIaD4i0vLWWB6p517zQxhh0ps/bKdaQIj/ywko2YhGTULyagFjMyrGIVyM5OzU4sys/UK
	MipLUpP1UlI3MYLCToSBawdj3xyPQ4xMHIyHGCU4mJVEeJ+8mpsmxJuSWFmVWpQfX1Sak1p8
	iFGag0VJnHd1R3CqkEB6YklqdmpqQWoRTJaJg1OqgdFs9oHTDCUHj9Zp3imX3pJz/lxP69wN
	twyZ+yeLb7jGa2u8+uV7MwPTDKmA0v0GKQHXV946f1hqm2rE/64px7X0cjLObrt2SSgnr6XD
	d4Yh80VplvITvVte5D/adDV+5qa9W6+6zgjepmbKztf3cOrNSF1n9cnrdslLzV0YNGmTfPGj
	uB1Pn/1WYinOSDTUYi4qTgQA4XjNmCkCAAA=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 08:58:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202311

systemd started to warn about used but unset environment variables.
Let us set watchdog_module=none which is used by the watchdog.service to get
rid of the following warning:

  watchdog.service: Referenced but unset environment variable evaluates to an empty string: watchdog_module

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
---
 meta/recipes-extended/watchdog/watchdog-config/watchdog.default | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/watchdog/watchdog-config/watchdog.default b/meta/recipes-extended/watchdog/watchdog-config/watchdog.default
index 647d5abca5..cee5fdc2b6 100644
--- a/meta/recipes-extended/watchdog/watchdog-config/watchdog.default
+++ b/meta/recipes-extended/watchdog/watchdog-config/watchdog.default
@@ -1,2 +1,3 @@
 # Start watchdog at boot time? 0 or 1
 run_watchdog=1
+watchdog_module=none
-- 
2.25.1


