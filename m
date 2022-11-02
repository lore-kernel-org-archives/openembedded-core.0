Return-Path: <yanxk.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52233C636D3
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 03:05:47 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.2522.1675393536749907238
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Feb 2023 19:05:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=XRZxHh8X;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: yanxk.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675393534; i=@fujitsu.com;
	bh=Rpx1EqZFhi+LFy9pJ6926F5TIyrW7gnTxlqapK2VWeg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=XRZxHh8XkTzdyAy9o1J3q8h9YqL8mpzAxX+FeKU6mPirGVBMMi0aUKu3GJ9BS8Ywk
	 rYHoBvYhmX5Pkm4SPkYxkFL9SLrcbqI/EWu/hoGBeyOG30s/6Xuvtzr37ABBHZnzi3
	 b4ekQzYi9bwGU55gYT+s7wEKyu5+5UhKaRuqnc4CspAunbA9KsAnhJhMAy8jx7anTH
	 xlHYAjPo88e2tMi5qeBTPLnJA5D84gXhnELrcT8dQxbW8VQEz4OV/yJ8a1PRDw4qRb
	 prJhVai9dO/BGMquQNvWuvs9XCA/zx7AqDK0VavgM5YaLnK8vJ76LbChebH27eJ0Iq
	 1LrKyEYSc5t7Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8ORqPu38k6
  ywfYdJhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8b/K+/ZCyaxVVzZvZi5gXE2axcjF4eQwGNG
  iXsnGlggnOtMEgfurWCGcPYyShzreMXYxcjJwSYgJ7H48VSgFg4OEQE9iav/REHCzAKeEl3zZ
  rKA2MICzhJLn/0Fs1kEVCT2bHgOZvMKuErMXXaeCcSWABqzY/UTJoi4oMTJmU9YIOZoSrRu/8
  0OYctLNG+dzQxRryRx59dlRgi7UqL1wy8WCFtN4uq5TcwTGAVmIRk1C8moWUhGLWBkXsVoVpx
  aVJZapGusl1SUmZ5RkpuYmaOXWKWbqJdaqpuXX1SSoWuol1herJdaXKxXXJmbnJOil5dasokR
  GLwpxYlCOxi/9f7VO8QoycGkJMp7Nu9OshBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3ohioJxgU
  Wp6akVaZg4wkmDSEhw8SiK860uB0rzFBYm5xZnpEKlTjMYcdxfu3cvM8fHPxb3MQix5+XmpUu
  K8LyqASgVASjNK8+AGwSL8EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3mvlQFN4MvNK4Pa
  9AjqFCeiUu9Y3QU4pSURISTUwpa790Lf/VsaDEq3amn8f7r88ONUvcuMygxd/qpZt62zauHZB
  b3qIPYO+gZaks+X8lUdr45ZO25Ny/Jpk8m0+5ljluft0/sumVOn8MvSaw7DCwpPxpbnMzokZw
  Tz8Ivv4NG+c8pf7ffsGc6byrUmF15u3LZmYFzEj1M7vxsWZaiwmBwUk/l8WL54wY4L49nd5eV
  31O6+clzOS+rJhedNtlnPXVE6XfN204fuZwydtew+tOGQl8Ld/U6ftyr6a40sKKicvqzhUYuM
  fpJR7s9xH/htr0iWrrTI5cV/7V8s0eVefZFN2+O74ruLr1Ylhv5480KuPq2S68f3/ur79R59k
  9Wae2h3+2H7vGdnpL35aT1diKc5INNRiLipOBADK8+Z8awMAAA==
X-Env-Sender: yanxk.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-732.messagelabs.com!1675393533!20285!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3527 invoked from network); 3 Feb 2023 03:05:33 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Feb 2023 03:05:33 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 4B738100194
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Feb 2023 03:05:33 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 3E970100195
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Feb 2023 03:05:33 +0000 (GMT)
Received: from localhost.localdomain (10.167.218.229) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 3 Feb 2023 03:05:31 +0000
From: <yanxk.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: <fnstml-fujitsuten@fujitsu.com>, Yan Xinkuan <yanxk.fnst@fujitsu.com>
Subject: [meta-oe][PATCH] bc ptest: fix bugs caused by input method
Date: Wed, 2 Nov 2022 09:15:27 +0800
Message-ID: <1667351727-9064-1-git-send-email-yanxk.fnst@fujitsu.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.218.229]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 03:05:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176704

From: Yan Xinkuan <yanxk.fnst@fujitsu.com>

fix some bugs related to echo function caused by input method.

echo would work fine now, difference as below:

before:		=E2=80=9CPASS: bc/*.b=E2=80=9D

now:	 	PASS: bc/*.b

Signed-off-by: Yan Xinkuan <yanxk.fnst@fujitsu.com>
---
 meta/recipes-extended/bc/bc/run-ptest | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/bc/bc/run-ptest b/meta/recipes-extended/bc/bc/run-ptest
index 66a1b9d708..ba5abe6805 100644
--- a/meta/recipes-extended/bc/bc/run-ptest
+++ b/meta/recipes-extended/bc/bc/run-ptest
@@ -2,8 +2,8 @@
 
 for TEST in *.b; do
 	if bc -l $TEST </dev/null; then
-		echo =E2=80=9CPASS: bc/$TEST=E2=80=9D
+		echo "PASS: bc/$TEST"
 	else
-		echo =E2=80=9CFAIL: bc/$TEST=E2=80=9D
+		echo "FAIL: bc/$TEST"
 	fi
 done
-- 
2.25.1


