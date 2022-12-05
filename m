Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED652C4321E
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 02:31:21 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.5465.1670207478634279818
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Dec 2022 18:31:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=G/1vhLZ4;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670207477; i=@fujitsu.com;
	bh=15/BJnonh8pmhCfNnJAWMrHzujlGEnrzvuLJZqZEIco=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=G/1vhLZ4HyBcUuNQv5Yg3Yqvav4cCJWc9v+CGbv1+cGIFoeFgquyr7QSHXYFrEsUr
	 59ZVmDZrLqiA17GPX/noUyYBALRe9r4sAfT2j2fkzlYKb+aV5c4AZxeDbfBHrpCdmg
	 OnRFcOg5K7cE09RlLcRbozCg7x9vtAJ7dXgTxp0tpexbU45LnIFmMTdJZ/C8RlRS1y
	 PSCBJrK1Dfqg/ZF6iJDQVIsO4UAb4myXUhij0/xS0qgKEcaCtzJRkmztc103Ou07VV
	 sYyqHKZPJEFz7X+l30D16yzXHDJAVMrHXEcmociVa8G9Br90R0ZYVvK46wB1Xcw8dq
	 pcp6SLH2au/Bg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8OxWfdLeG+
  yweQuVos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePM0y6mgomcFQue72FpYFzC0cXIxSEkcJ9R
  oqthBzuEc4lJ4ujpBYxdjJxAzm5GiZfvY0BsNgEpiRv3/7N1MXJwiAjoSVz9JwoSZhZQkXjxu
  4cdxBYWsJHYvOYvG4jNAhRf1LYRLM4r4Chx9n4z2EgJAQWJKQ/fM4PYnAJOEt9WPWGCWOUo0X
  JkCSNEvaDEyZlPWCDmS0gcfPGCGaJXUWL25WYWCLtCYtasNiYIW03i6rlNzBMYBWchaZ+FpH0
  BI9MqRrPi1KKy1CJdQ0u9pKLM9IyS3MTMHL3EKt1EvdRS3fLU4hJdQ73E8mK91OJiveLK3OSc
  FL281JJNjMDQTSlmu76DccayP3qHGCU5mJREeZUedScL8SXlp1RmJBZnxBeV5qQWH2KU4eBQk
  uCNDutNFhIsSk1PrUjLzAHGEUxagoNHSYRXyBsozVtckJhbnJkOkTrFqMsx82vbAWYhlrz8vF
  QpcV4VkBkCIEUZpXlwI2AxfYlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMK+bL9AUnsy8Erh
  Nr4COYAI6YiN/F8gRJYkIKakGpozOpZ5XXoms4Sg50b/yncm+Brb981T7xAzqU3aUPubdzczz
  bVfgTF234r6K43sfMM3YvcczcEeNybTygtSCb8scYgr+rms+euqQI9tu45zSeVskJwl8bFbde
  GLDCu6rQnvfPdimt6qFydRnsjVXis6m99aHD2pOm9Dxl9Ny34w70yKVbx+M7mpcqSo+J+yE7q
  w43okGt7UUIxs/KvQUcKx+WZL25U2vrN7JcH+F+INf5kZvfMW+dBnXxMqTOrdWpa3+w5XfwxR
  /o1V0rboTz6aE9492e8iX7pgdzFzDFeSzewOnSd91rolCr6RTLd7kBSdOLJ0k4H+tvuyDTODl
  3WJf1ql/FGV0141stRRrV2Ipzkg01GIuKk4EABz6A65kAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-587.messagelabs.com!1670207475!128900!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4303 invoked from network); 5 Dec 2022 02:31:16 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-4.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Dec 2022 02:31:16 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id B5D437B
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:31:15 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id A9AD673
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:31:15 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 5 Dec 2022 02:31:14 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] sqlite3: upgrade 3.39.4 -> 3.40.0
Date: Mon, 5 Dec 2022 10:30:40 +0800
Message-ID: <1670207442-7087-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670207442-7087-1-git-send-email-wangmy@fujitsu.com>
References: <1670207442-7087-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 02:31:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174268

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sqlite/{sqlite3_3.39.4.bb => sqlite3_3.40.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.39.4.bb => sqlite3_3.40.0.bb} (86%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.39.4.bb b/meta/recipes-support/sqlite/sqlite3_3.40.0.bb
similarity index 86%
rename from meta/recipes-support/sqlite/sqlite3_3.39.4.bb
rename to meta/recipes-support/sqlite/sqlite3_3.40.0.bb
index fefab16e64..82718432b5 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.39.4.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.40.0.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "f31d445b48e67e284cf206717cc170ab63cbe4fd7f79a82793b772285e78fdbb"
+SRC_URI[sha256sum] = "0333552076d2700c75352256e91c78bf5cd62491589ba0c69aed0a81868980e7"
 
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_IGNORE += "CVE-2019-19242"
-- 
2.25.1


