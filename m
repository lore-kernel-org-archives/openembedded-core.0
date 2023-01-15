Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1188AC677F1
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 05:24:37 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.134802.1673760270517286894
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jan 2023 21:24:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Luh/iXVR;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673760271; i=@fujitsu.com;
	bh=mFCeHQdO+lzgMBaaD4IrjwasdtEHo9Jv+UXuCNcuuqg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Luh/iXVRtOYeGV/jxHYx/TC+9CAAHpdJC+2z6bXwqw8vzXKdJH5xhGwYPtHSG+TG7
	 U5FyMn4XQ5UdClyqjxvKMpRQwduEa7glsK1uhSSau34edLhVlZljPjGaXnuWN6RLgM
	 t3YX3ZBojMnCu536DZqmqhi8dHd2Zdqh+j9/CdAzkmScLQvjU8TjYXe3uxWf5doLvZ
	 8FYjQwIotOv2ZI9znMMHuQfYN0X8b9fMcYNPXWvIQqKWm0dlrS4S2vdpmnEr6p3QRJ
	 Xmzq4YoqtBFWRAQ529fUqJOKOLkIHW1+4IpJqUjPDVMA+ahLp4qSGEd1ddZfetc/7m
	 Jq9rOR4WT65ew==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8MxSZev73C
  ywdnXKhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aug19YCvZzVhy4vJ65gfE0RxcjF4eQwGNG
  iXOfVrBBONeZJP5s6mSBcPYySsw5cgMow8nBJiAlceP+fyCbg0NEQE/i6j9RkDCzgIrEi9897
  CC2sIC7xOZdU1hAbBYBVYmJD++DxXkFHCVerPgIZksIKEhMefieGcTmFHCSeHr0IyPISCGgmu
  1t4hDlghInZz5hgRgvIXHwxQtmiFZFidmXm1kg7EqJ1g+/oGw1iavnNjFPYBSchaR9FpL2BYx
  MqxhNi1OLylKLdI30kooy0zNKchMzc/QSq3QT9VJLdctTi0uAMonlxXqpxcV6xZW5yTkpenmp
  JZsYgYGbUqzwfQdj99I/eocYJTmYlER5I78dShbiS8pPqcxILM6ILyrNSS0+xCjDwaEkwbuh8
  XCykGBRanpqRVpmDjCKYNISHDxKIrzaHUBp3uKCxNzizHSI1ClGRSlx3hc9QAkBkERGaR5cGy
  xyLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5n0KMoUnM68EbvoroMVMQItD6g+CLC5JREh
  JNTBZ98y+kGDqvcLtqpiHbLSh0Nwnou46Nz8erOh8wip/urvgnzS/9ufTr36zsCzuW1X0kpHR
  pVw+des7D6vDFc8LDDvr702N9PK/oZSZFZbud3dhlYFRhF7H7clP787UuJ8rJ2EildKmfyxnw
  oWw9o2xZ4Pznj3dL/byiZXkjnBL2VVik9b7ZDzYp3UvJ1Aoc3XIpbwTQhPmHFiZE/jqslcvZ0
  fsq+TMhtltSy1V9h7tLt0o/13Pu6Bw05bHU64X7/8WcZMxKmmb9q0bEz9vSfm9pY9Z7PYX0Su
  7X1aGaNXZ/WtZF8Z9q87psOoO+VLxK6bnX124dHNCvpCWx5HHLC8eb1R+cf+P7LP4T/NVLf8q
  sRRnJBpqMRcVJwIAQT5gxFcDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-565.messagelabs.com!1673760270!244969!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30504 invoked from network); 15 Jan 2023 05:24:30 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-21.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Jan 2023 05:24:30 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 5112E1000D5
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:24:30 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 3AB8F1000D2
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:24:30 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 15 Jan 2023 05:24:28 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hypothesis: upgrade 6.61.0 -> 6.62.0
Date: Sun, 15 Jan 2023 13:24:09 +0800
Message-ID: <1673760250-2563-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673760250-2563-1-git-send-email-wangmy@fujitsu.com>
References: <1673760250-2563-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175875

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
we now support @example(...).xfail(), with the same (optional) condition, reason, and raises arguments as pytest.mark.xfail().

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-hypothesis_6.61.0.bb => python3-hypothesis_6.62.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.61.0.bb => python3-hypothesis_6.62.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.61.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.61.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb
index 204471c186..4369a697bd 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.61.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "fbf7da30aea839d88898f74bcc027f0f997060498a8a7605880688c8a2166215"
+SRC_URI[sha256sum] = "76f1141e8237f6dd0780a171bec5d6aec873208ccc27b5f9753d4cccd8904272"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.25.1


