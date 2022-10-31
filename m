Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C1BFA3740
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 08:17:40 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.6891.1667204255806805498
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 01:17:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NfgxadiV;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667204254; i=@fujitsu.com;
	bh=Iv06Nj+j/K0UsW6/8xKTskqWbb4LLoEzRl51vOb0gdY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=NfgxadiV1oKScPBnlQ+OIxk1zfwRQOeM2mQOnNvkeUqsQBRGNP2kKHbqGCkfF3445
	 P0WTq+v7YXGqsiIILmQP6zn1MRHpXiusKJts8hSfSBobT16FGVBtLqtxcgjCQyKc+z
	 kGT/1Jfq9Tws9/C2rq0c2+SMcFcKzf9E2WBUq/mMa7M8o073QotWdGeFV18FsG/tGO
	 2zFj7w+M49j7Q/MW5P1HiWy8STmvY/L/ryPbKDD5+IhLOi8Q5vMwjrm9ljltoMXL1a
	 4k73DOHaJuGqOJV345Wg8UZxh6WglqWcmySRRoVryYOdfmsBmLPR6WYs38D9Pkkrz6
	 a2xgcNFFHxl/g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRWlGSWpSXmKPExsViZ8ORqDu3JT7
  ZYOUDdYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePK+sOMBRPZK848W8XawLiBrYuRi0NI4DGj
  xJzv75ghnGtMEpeedEA5exglNh7dzdLFyMnBJiAlceP+f6AWDg4RAT2Jq/9EQcLMAioSL373s
  IPYwgK2ErsO3wCzWQRUJTr+zGACsXkFHCXuzZ3BBmJLCChITHn4nhkiLihxcuYTFog5EhIHX7
  xghqhRlJh9uZkFwq6QmDWrjQnCVpO4em4T8wRG/llI2mchaV/AyLSK0aw4tagstUjX0FAvqSg
  zPaMkNzEzRy+xSjdRL7VUtzy1uETXSC+xvFgvtbhYr7gyNzknRS8vtWQTIzAYU4rVAnYwflz2
  R+8QoyQHk5Ior3dxfLIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd5fDUA5waLU9NSKtMwcYGTAp
  CU4eJREeEuqgdK8xQWJucWZ6RCpU4zGHJsOX9nLzDF19r/9zEIsefl5qVLivK2lQKUCIKUZpX
  lwg2ARe4lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMK8byEKezLwSuH2vgE5hAjqFrT0O5JS
  SRISUVAOTh8p1tiXbzTMt7TyrU7RnVEfF7Tr9U2Dy0+BfqnUfNjYxfFv1QWXDsnOrvtU5aZSo
  uytrh5lVrbqZFq88jfeBdfcFQ6ublQemb2P4umc/s0HmFtbyywG3vzfaBX96ZvZNcjq7oImBc
  ZDeg+k3PJMSD/vNVv2i/Hj+icZ7lh7PN2W3aPKt5b677dqB5SKv1ffPWnzmj3pryfcfP4qurP
  2e0ir6wZd/jz37H4XJ85r6Np9/k+THl+m7VyWh7PBzvVSlLtsvCp2eRt+LO1mmJq1dnrrS4K5
  18cmlelv2Pf74+fOFRRtWmizmsZ4ocGcK+2wZzrgLDHEvtkT6N+tNj7m4b1JMdXPpwdnWPZLK
  p7e6K7EUZyQaajEXFScCAGHczq9TAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-565.messagelabs.com!1667204253!519527!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17507 invoked from network); 31 Oct 2022 08:17:33 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 31 Oct 2022 08:17:33 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 592F2100194
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 08:17:33 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 4D4CF10018D
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 08:17:33 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 31 Oct 2022 08:17:31 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] Add nativesdk of systemd-systemctl
Date: Mon, 31 Oct 2022 16:17:20 +0800
Message-ID: <1667204240-3627-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 08:17:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172293

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../systemd/nativesdk-systemd-systemctl.bb      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta/recipes-core/systemd/nativesdk-systemd-systemctl.bb

diff --git a/meta/recipes-core/systemd/nativesdk-systemd-systemctl.bb b/meta/recipes-core/systemd/nativesdk-systemd-systemctl.bb
new file mode 100644
index 0000000000..66b5ec5e6e
--- /dev/null
+++ b/meta/recipes-core/systemd/nativesdk-systemd-systemctl.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Wrapper for enabling systemd services"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+PR = "r0"
+
+inherit nativesdk
+
+SRC_URI = "file://systemctl"
+
+S = "${WORKDIR}"
+
+do_install() {
+	install -d ${D}${bindir}
+	install -m 0755 ${WORKDIR}/systemctl ${D}${bindir}
+}
-- 
2.25.1


