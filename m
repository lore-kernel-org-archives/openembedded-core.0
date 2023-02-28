Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB4FFC7EE2E
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 09:49:37 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.19672.1677577774542345824
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 01:49:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MNLwU9Kw;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677577772; i=@fujitsu.com;
	bh=IBw20XqYd+ztQ4s2V9IMi+UYqdSGj6xVjsJa2jTxiFs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=MNLwU9KwyZ/JT8rV7iJ4C6i5NkqTtARSecgBaC2M/AHPUY9RjdmNNOL154jhx7jNz
	 OIGSsdq9bhi7gdjKQZRMM+0UXOXLrP52nHfOil4D+Sq63+jq+DzQFWf7lvEdv9lNpY
	 BjuES+/JIiSEcfKxiXjlPGZaLEZlF6Jmn50gCiBxP661Dljd/NCDmncVFHP3l3SDFM
	 1lHqNS87ZuUK77Kx7tTzTXgF1q2V1nbxcEBOnfkdl6isI7YCfpH7ycn95ZE6GOqeFA
	 zw6rVFxqRY1YV2iRJ0+p/AVEa71qvd0mBCZgGMAsdOo9/BRusnAs8QJPYCx7y2mEUg
	 PKeax5zMwNInw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8ORqKt97m+
  ywX82izs/37E7MHqc27iCMYAxijUzLym/IoE1Y97RP+wF6zkq3s7qZm1gPMvexcjFISTwmFHi
  58JJbBDOdSaJM+u3sEA4exklvux9AlTGycEmICVx4/5/oCoODhEBPYmr/0RBwswCKhIvfveAl
  QgLWErMPH2LFcRmEVCVWNf7CszmFXCSeNM3hwXElhBQkJjy8D0zRFxQ4uTMJywQcyQkDr54wQ
  xRoygx+3IzVH2lROuHX1C2msTVc5uYJzDyz0LSPgtJ+wJGplWM5sWpRWWpRbqGFnpJRZnpGSW
  5iZk5eolVuol6qaW6eflFJRm6hnqJ5cV6qcXFesWVuck5KXp5qSWbGIHBmFKcWLeDcUXfX71D
  jJIcTEqivAlH/yYL8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuDdchooJ1iUmp5akZaZA4wMmLQEB
  4+SCG/0SaA0b3FBYm5xZjpE6hSjopQ4rzZInwBIIqM0D64NFo2XGGWlhHkZGRgYhHgKUotyM0
  tQ5V8xinMwKgnzzj8GNIUnM68EbvoroMVMQIsbrv0BWVySiJCSamDa8neb/nYPy8O/J9kyPrF
  RcuHSPqAbfeu8ZRxD1zLtZS52pbN4sxMlFso/Ea1227Th4veYLQ62ir/PnXkrtPhgy5V3BTdX
  FvC0l77fP2vaFB+XR0lxi3YrSbk/4rlSnbqbKfOJsyDzj7i4V3eemJSfPZKleNSPQeDGput8j
  /eZ8Pc5TNWf1NTqKlX20L/lyf1jp9+muaz//e7FM7+e4ENbmW2Mjn6/t3Ovur/JSzblNUZzUq
  db8Cb//36RI8lU2IyL+8ZE87WewQ6hVk586pf/fl+xSHTihYilEs+kWOf3tMxV/BF0k8F89yZ
  mI6nfZTlq3K83eF6tuGUduEBTf0/X8yVKnGcSeKX2lnatP/pQiaU4I9FQi7moOBEAIWJTuEED
  AAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-745.messagelabs.com!1677577771!246901!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26891 invoked from network); 28 Feb 2023 09:49:31 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-21.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Feb 2023 09:49:31 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 5E6F1100043
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 09:49:31 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 51059100198
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 09:49:31 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 28 Feb 2023 09:49:29 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] diffoscope: upgrade 235 -> 236
Date: Tue, 28 Feb 2023 17:49:15 +0800
Message-ID: <1677577759-20868-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 09:49:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177826

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../diffoscope/{diffoscope_235.bb => diffoscope_236.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_235.bb => diffoscope_236.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_235.bb b/meta/recipes-support/diffoscope/diffoscope_236.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_235.bb
rename to meta/recipes-support/diffoscope/diffoscope_236.bb
index e4cc2a95b8..9f89f35c11 100644
--- a/meta/recipes-support/diffoscope/diffoscope_235.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_236.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "3279f6637f1e9f757ca9b8c2870ed79ceead5971e5a15d952a0579b2b45720a2"
+SRC_URI[sha256sum] = "84c46840dafffe0223056718e4250ceb52484452a992b85e345e3cf8a2cf7d4b"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.34.1


