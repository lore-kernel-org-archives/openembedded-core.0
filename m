Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCF6FC77B6F
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:58:38 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.40594.1681117117997100408
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:58:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Qc1xNj1R;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681117116; i=@fujitsu.com;
	bh=Z6ae3ebvo+zz7Kz5CUzFqCkMR+N+DM2hhvR3Hh8WPeQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Qc1xNj1RnUTFnkJJFPfg7A/WbImrk+LGUndF7IQE9XQ4L1pH+O8QDKrGXA//fVenP
	 8YtLGdiFjSV1O6wiq08ujFeuTUserA5f3jr48Vyfl8eJAbPU6vyOy2SPpLZHA4Y1T3
	 HPo9CF90JxAtzg9fYxXElDNRsowZicjrZR11LLKiLBZw4NdWerbTpLhuUVfI9Tq+zu
	 PBn53LQm6CVLiPVyEmOqQiqMQ42pv+/yUFxJ4eFY8MM/onYnZKrGiq9CS7SyCCxnOC
	 XxIWNAIaEuWjsWwpS5w21NdyyEGbP7JS3yY4sFrSygndsyRTs6iTLswmprkUJGCDm2
	 LrJ55wOol7fEQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORpLv7vHG
  KwadDfBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bnlPKC/xwVS98WNzDO4uhi5OIQEnjAKHFr
  xWNmCOcyk8TKiTuhnD2MEsvWvWLsYuTkYBOQkrhx/z9bFyMHh4iAnsTVf6IgYWYBFYkXv3vYQ
  cLCAjYSn25HgIRZBFQlFj4/yARi8wo4Sez8/hFsioSAgsSUh++ZQWxOAWeJS32rWEBsIaCaWR
  PnQNULSpyc+YQFYryExMEXL5ghehUlZl9uZoGwKyQapx9igrDVJK6e28Q8gVFwFpL2WUjaFzA
  yrWI0L04tKkst0jU010sqykzPKMlNzMzRS6zSTdRLLdXNyy8qydA11EssL9ZLLS7WK67MTc5J
  0ctLLdnECAzclOKkOzsYd/b91TvEKMnBpCTK28VlnCLEl5SfUpmRWJwRX1Sak1p8iFGGg0NJg
  tfgLFBOsCg1PbUiLTMHGEUwaQkOHiUR3ixgJAnxFhck5hZnpkOkTjEqSonzcoAkBEASGaV5cG
  2wyL3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZh322GgKTyZeSVw018BLWYCWszlYgCyuCQ
  RISXVwMTdJ8h4Sc/r2n3Jm/mxWvzVcf2m4jejv+i+fGryVCJ847IFLdGCvdF1eqm/VYsNfa9N
  8V2j+pYj/tjdpcxHnngZGXOvKl2X3PFqz7Mv0UF71bx2zMp022u1feK+C6/05vwWTO0pOakjU
  qZrVvE33PPTxgnrDszxYPu9aOHn7/wBrDLb34tOl7WY8nPT0SjbDxPvlTR5ekyS+th/IU/tn3
  bWkeO3mh/kVO1Y0rPmweRmfaN6h18nd8e5/avd7BzPobNkpxjXef639pMXNv6Ykv5nh6dPtOv
  MDvGT4kruq3wVI7dMDt4U0bJqz7K6mazLJ/+/8kdcs3PjoVzRo8F+/olTetV3fP86genOA7up
  9QeUWIozEg21mIuKEwHpl+jiVwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-728.messagelabs.com!1681117114!327174!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2306 invoked from network); 10 Apr 2023 08:58:35 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-16.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:58:35 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id A92661CD
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:58:34 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 9DB8A1C8
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:58:34 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:58:33 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libpcap: upgrade 1.10.3 -> 1.10.4
Date: Mon, 10 Apr 2023 16:58:17 +0800
Message-ID: <1681117100-24726-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681117100-24726-1-git-send-email-wangmy@fujitsu.com>
References: <1681117100-24726-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 08:58:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179849

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libpcap/{libpcap_1.10.3.bb => libpcap_1.10.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.10.3.bb => libpcap_1.10.4.bb} (95%)

diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.3.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
similarity index 95%
rename from meta/recipes-connectivity/libpcap/libpcap_1.10.3.bb
rename to meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
index eb0a650130..27b167c21f 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.3.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5eb289217c160e2920d2e35bddc36453 \
 DEPENDS = "flex-native bison-native"
 
 SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.gz"
-SRC_URI[sha256sum] = "2a8885c403516cf7b0933ed4b14d6caa30e02052489ebd414dc75ac52e7559e6"
+SRC_URI[sha256sum] = "ed19a0383fad72e3ad435fd239d7cd80d64916b87269550159d20e47160ebe5f"
 
 inherit autotools binconfig-disabled pkgconfig
 
-- 
2.34.1


