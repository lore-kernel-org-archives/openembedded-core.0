Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15346C3DA78
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 05:24:37 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.134802.1673760270517286894
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jan 2023 21:24:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ov/M2gNI;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673760268; i=@fujitsu.com;
	bh=gVVeb5xo5uAYhU9j+iv4athlrv/bfVPNSvsACoglQ8M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ov/M2gNID32u4OiXhzSkAbHNLJvsLmQC/HyTdSYulPSFUzFlAbDaqr2O69lZn1xFf
	 6AH5TTQAnQdyrAYVxSQHohEoUJ8wa/uv9f3Vs9skm5ehcGc3skagTh8DJpdsID7BUD
	 8Tr8dEGEYjCCq+sl3/Rqs9T2PRsJdON/x5HgXSpzdcTI2eymDQw+8JjfT04GZhjZtg
	 kxTfbmONziQVDOs60uZrAhkjT4zaC92J3X8Ua19Z/H5chC7Hfmr/HvWZDoO39qL3Z/
	 iSrMrVDE94orVkUZDfTwcNQ9bNAWh3+BmhNfaqxRI6O1qvO9e3py0ksV7mRCTHvnbi
	 9KXMukmPJvbOg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRWlGSWpSXmKPExsViZ8ORpMvTdzj
  ZoP0bs8Wdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrF44lGWgmdcFTufTGJrYHzP2cXIxSEk8IBR
  ovXRbEYI5wqTxOXPh5i6GDmBnL2MEt9WaIDYbAJSEjfu/2frYuTgEBHQk7j6TxQkzCygIvHid
  w87iC0s4Cbx4ew1VhCbRUBV4vnTm2DlvAKOEm+eSoGEJQQUJKY8fM8MYnMKOEk8PfqREaRECK
  hke5s4SJhXQFDi5MwnLBDTJSQOvnjBDNGqKDH7cjMLhF0p0frhF5StJnH13CbmCYyCs5C0z0L
  SvoCRaRWjWXFqUVlqka6hgV5SUWZ6RkluYmaOXmKVbqJeaqlueWpxia6RXmJ5sV5qcbFecWVu
  ck6KXl5qySZGYNimFKv07WB8u+yP3iFGSQ4mJVHeyG+HkoX4kvJTKjMSizPii0pzUosPMcpwc
  ChJ8G5oPJwsJFiUmp5akZaZA4whmLQEB4+SCK92B1Cat7ggMbc4Mx0idYpRUUqc90UPUEIAJJ
  FRmgfXBovbS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeZ+CTOHJzCuBm/4KaDET0OKQ+oM
  gi0sSEVJSDUy1UZvORqy3eiQeE9j4ynfXqU3bxNjnOXy8d+dRLOdMfjGGTe1v78rv4c1j91nR
  ELnZdO9hyaD2zayfJBIv2duzdJiLRQfkaW3eaxrY/uvP89W/aqd8r+Ptd+9a+rYnNutoMh8r+
  24/yxNCTYw/zsSF88+omTK9mb0ufy9Txd05XhILX7KdeyzmdkuAlZdT05Lz8onyR6yuv441Xj
  ib9S9R6zKbc+Cv+j7tp8Yb5vuse1r2tNV1WcndeSVT7vXxlcV7aN1349H49GHdubaJuuIqN38
  n65W2LFB+8bVG969tnwtT49VvtXYNs+r//GFRu7dI2knMLc61//+Z/0Vdp31fyTS8bi0zlbjf
  wr7tmBJLcUaioRZzUXEiAI1kTeRWAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-548.messagelabs.com!1673760267!85515!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21573 invoked from network); 15 Jan 2023 05:24:28 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-22.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Jan 2023 05:24:28 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id C1FE31AF
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:24:27 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id B650E1AC
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:24:27 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 15 Jan 2023 05:24:26 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hatchling: upgrade 1.12.1 -> 1.12.2
Date: Sun, 15 Jan 2023 13:24:08 +0800
Message-ID: <1673760250-2563-3-git-send-email-wangmy@fujitsu.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175874

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Add macos-max-compat option to the wheel target that is enabled by default to
support the latest version 22.0 of the packaging library

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-hatchling_1.12.1.bb => python3-hatchling_1.12.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.12.1.bb => python3-hatchling_1.12.2.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.12.1.bb b/meta/recipes-devtools/python/python3-hatchling_1.12.2.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-hatchling_1.12.1.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.12.2.bb
index fa56d7a42a..7f5a29879b 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.12.1.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.12.2.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS += "python3-pluggy-native python3-pathspec-native python3-packaging-native python3-editables-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "5b36c903d4d76790b1c1f2b7c8f5446fb733fab6ce39b203401d2337d441b411"
+SRC_URI[sha256sum] = "8a6d719d96653a0f3901072b12710c9c3cc934f9061b443775c6789b45333495"
 
 do_compile:prepend() {
     export PYTHONPATH=src
-- 
2.25.1


