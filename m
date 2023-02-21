Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DB9C64ED9
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 10:19:26 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.38670.1676974755476153092
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 02:19:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SJS5na4H;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676974753; i=@fujitsu.com;
	bh=ff/ICYEKUE1tMdJPtnv+4L1jEyazqG/1a4YjDhrbqj0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=SJS5na4H/xmptrMQj7zaiGPfaEfgTFBPlL6PJc5XOsiDL1Pgl8BjF67nxg7xJy6jT
	 GQE7VMIOHBoSNdHDMDty/XkuWmUIxSBo8od6wVrSEw2r+ZEsn6lo/0xHBKhFJfAFDU
	 6R4lEmQY7HOSLtwdzzjJLtkWDaYYntoy4/ATOIT/TtV8AhN5nuPQEsuM1tx7b77gzs
	 yxMd7MQa/gTB6rX0Zla7et/D8FgLKLjkvMha0wPbrcPNKwozihUEv5L1n7ljVelLe2
	 AVEk+tDJ9aoEDkr+65rzF/SJCoeXiYwi/ggTZ5G53r9L0bA1+IHtx2CYLRe05GoXLy
	 incv27cyqLxSA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8OxWXfhrC/
  JBpeP81rc+fmO3YHR49zGFYwBjFGsmXlJ+RUJrBk7rr1nKljKUfFh5WL2BsZd7F2MXBxCAg8Y
  Jf58/sgC4VxhkmhoOs8M4exllFh5ciZbFyMnB5uAlMSN+/+BbA4OEQE9iav/REHCzAIqEi9+9
  7CD2MIClhLXrk1lArFZBFQlDnc/ZQWxeQWcJL5f2A1WIyGgIDHl4XtmiLigxMmZT1gg5khIHH
  zxghmiRlFi9uVmFgi7UqL1wy8oW03i6rlNzBMY+WchaZ+FpH0BI9MqRrPi1KKy1CJdQ0u9pKL
  M9IyS3MTMHL3EKt1EvdRS3fLU4hJdQ73E8mK91OJiveLK3OScFL281JJNjMBgTClmPb6DcVbf
  X71DjJIcTEqivN9OfU4W4kvKT6nMSCzOiC8qzUktPsQow8GhJMHrN/1LspBgUWp6akVaZg4wM
  mDSEhw8SiK8dV1Aad7igsTc4sx0iNQpRkUpcd5JM4ASAiCJjNI8uDZYNF5ilJUS5mVkYGAQ4i
  lILcrNLEGVf8UozsGoJMxbATKFJzOvBG76K6DFTECL3X98AFlckoiQkmpgOtuj8NzcL6dx6w3
  +q7m6q9+tsZ8aklsWIyVok5CoM3Opt9TUYsvEvwaqDE8fnCyZf/20tOa53Vsu/F/8iF/r1qGz
  S895T0p6xZD5wM7/+YHci+viA9dau5rfEFKqySz/r3vQrvqlZ8tP/0VlNhM2VLOc/1685/zGs
  7u311rxSi85nbVF/0x63HHt08fjlP9obp8wy01q6m05FhM330oNq/elMxISqt9HufcsfbLYYC
  HL3YteiorquTbOizaYh6pxTy6J8ak4Y9DoE645b47hiZLgnOfHLoqaxy6JvsSvtr2/7JlOBJ8
  Nf8rUc4WJZs9/6eXPvf6S/0apmP7zRKmoiZ1VsnteOfyombWAX+CsEktxRqKhFnNRcSIA7M9n
  PEEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-591.messagelabs.com!1676974752!526608!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29267 invoked from network); 21 Feb 2023 10:19:13 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-3.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Feb 2023 10:19:13 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id CE89E153
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 10:19:12 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id B9FEC151
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 10:19:12 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 21 Feb 2023 10:19:11 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] curl: upgrade 7.88.0 -> 7.88.1
Date: Tue, 21 Feb 2023 18:18:53 +0800
Message-ID: <1676974737-24910-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 10:19:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177482

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/curl/{curl_7.88.0.bb => curl_7.88.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/curl/{curl_7.88.0.bb => curl_7.88.1.bb} (98%)

diff --git a/meta/recipes-support/curl/curl_7.88.0.bb b/meta/recipes-support/curl/curl_7.88.1.bb
similarity index 98%
rename from meta/recipes-support/curl/curl_7.88.0.bb
rename to meta/recipes-support/curl/curl_7.88.1.bb
index 749bda815c..0930d229d2 100644
--- a/meta/recipes-support/curl/curl_7.88.0.bb
+++ b/meta/recipes-support/curl/curl_7.88.1.bb
@@ -14,7 +14,7 @@ SRC_URI = " \
     file://run-ptest \
     file://disable-tests \
 "
-SRC_URI[sha256sum] = "fd17432cf28714a4cf39d89e26b8ace0d8901199fe5d01d75eb0ae3bbfcc731f"
+SRC_URI[sha256sum] = "1dae31b2a7c1fe269de99c0c31bb488346aab3459b5ffca909d6938249ae415f"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.34.1


