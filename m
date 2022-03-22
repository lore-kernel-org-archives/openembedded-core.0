Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49465C4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 10:40:10 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.8273.1647945609429083168
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 03:40:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Ekp0SuTS;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647945607; i=@fujitsu.com;
	bh=t8v4BZs5x9roiamit/2yueYzCcBQRQEkKkR1R7fnhok=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Ekp0SuTSXJOjN0SzAktRDPOoDimt6uRD2k9k+Q8nDCwhrsEqH8phhjgmojuxHnrSt
	 rwEB/FZR2ykhJt1vn9/H7iCmAhk8rzryXmSO+p3pLAgI+O5HWUFKL4ORAPOQ5OfHVp
	 3QGv2ArYk7UAJGKqWTWA3iWq4mvCKYPViSBNPNYpxS+ipg6J+KruzMJLJNhhn6R/Y0
	 iyACFauZq5G6QIcfoNEimzXryesLh85rfG3Ud6CZq/dper4F//cLSt/7A53lMKVdT7
	 yLr2G7xUKpeBbenGub91yLm7R2bi2CNiYPReSSfZ5StAHFTgVscofCFNMY7Ubln2Nr
	 v6gqNfvw0iLug==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8MxSbdtuWW
  SQbe6xZ2f79gdGD3ObVzBGMAYxZqZl5RfkcCacWH9HpaCv+wVP+/9YGxgXM7excjFISTwmFFi
  zYq/rBDOeSaJ/3M7gTKcQM4eRon+NTYgNpuAmsT0WzeAijg4RAT0JK7+EwUJMwuoSLz43QNWL
  ixgKbF37X5mEJtFQFXi5JFjYOW8Ao4Sn69bg4QlBBQkpjx8D1bCKeAkMf/cLyaQEiGgkvkzFE
  DCvAKCEidnPmGBmC4hcfDFC2aIVkWJ2ZebWSDsColZs9qYIGw1iavnNjFPYBSchaR9FpL2BYx
  Mqxhtk4oy0zNKchMzc3QNDQx0DQ1Ndc3MdC3N9BKrdBP1Ukt1k1PzSooSgbJ6ieXFeqnFxXrF
  lbnJOSl6eaklmxiBIZxS7JSwg/FR30+9Q4ySHExKorxvWi2ThPiS8lMqMxKLM+KLSnNSiw8xy
  nBwKEnwHl0MlBMsSk1PrUjLzAHGE0xagoNHSYQ3oxsozVtckJhbnJkOkTrFqCglzvt3GVBCAC
  SRUZoH1waL4UuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHlFQKbwZOaVwE1/BbSYCWixPqs
  ZyOKSRISUVAOT4KzIOI2W/7OXfnsn6KzFZWHRVDbN2qbjvn/Pl4/7EkIaCrii9KJfC4u9Fzcu
  jpjxjfVDU1JkUsIF4/D/1uqLz65kefH+g9q5OJ/0qa+ywu8G7+QI+fan58Fr/VDbBR16govUH
  Zf8lnkfrjXFT0JDfPU/7emf+eJ6pSt9+Nhzu7y/v05W+L3zw8rp5svD//50MXoW88fkRnb0ue
  0Ziy6Y3bfXC4yUdu3P62GtsXEt+FlorCDwyDlmxqu+bL61+53Pud+eM61/ywIenlwjyXlS8/u
  fnb63e7JMZktqseUkg6oz+md7XzO0LOa9+/pNg63yym2Hdr7V+DD7uqnhP9c330u7pnIn5sX8
  Xrxx6XslluKMREMt5qLiRAB69RNmXAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-532.messagelabs.com!1647945605!242127!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3803 invoked from network); 22 Mar 2022 10:40:05 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Mar 2022 10:40:05 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 68EDC100440
	for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 10:40:05 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 35AB1100453
	for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 10:40:05 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 22 Mar 2022 10:40:01 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] vala: upgrade 0.54.7 -> 0.56.0
Date: Tue, 22 Mar 2022 18:39:47 +0800
Message-ID: <1647945587-5282-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647945587-5282-1-git-send-email-wangmy@fujitsu.com>
References: <1647945587-5282-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 10:40:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163544

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/vala/vala_0.54.7.bb | 3 ---
 meta/recipes-devtools/vala/vala_0.56.0.bb | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)
 delete mode 100644 meta/recipes-devtools/vala/vala_0.54.7.bb
 create mode 100644 meta/recipes-devtools/vala/vala_0.56.0.bb

diff --git a/meta/recipes-devtools/vala/vala_0.54.7.bb b/meta/recipes-devtools/vala/vala_0.54.7.bb
deleted file mode 100644
index bb38252cf5..0000000000
--- a/meta/recipes-devtools/vala/vala_0.54.7.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI[sha256sum] = "62079ca1ff02e5d17ae72aa9a5adc61ae6afdcfebb0d9f06063a36efbeaca0c7"
diff --git a/meta/recipes-devtools/vala/vala_0.56.0.bb b/meta/recipes-devtools/vala/vala_0.56.0.bb
new file mode 100644
index 0000000000..a4d6760f10
--- /dev/null
+++ b/meta/recipes-devtools/vala/vala_0.56.0.bb
@@ -0,0 +1,3 @@
+require ${BPN}.inc
+
+SRC_URI[sha256sum] = "d92bd13c5630905eeb6a983dcb702204da9731460c2a6e4e39f867996f371040"
-- 
2.25.1


