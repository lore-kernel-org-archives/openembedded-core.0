Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E4CC3DA78
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 05:26:37 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.134832.1673760389893736293
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jan 2023 21:26:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=aMnxBG7a;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673760388; i=@fujitsu.com;
	bh=hawC9CkOCt2zGFrbpD8chfmekDuU1YFU5jbp614VYaQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=aMnxBG7ag0GNdxATylO+VPglajCrNm7YKLT9g4jQlmnMHvJJEcsoFmDUVd76MALbr
	 aufqF773+M/bAZP/PPTf5ScL3/llGhf3VbZmtyKCrHZGZhrrxT3PPW2OQxtiXQSBcn
	 h36/dOPcqeFNaPBIDHKxkxepnmxk65ZB99DQrg4/7S9vIgBoLKs8bEMgWs4Xiz/sGm
	 mXMGLww91Pi6TMQoBJKYmo+CljAXH5eYksFlrXA0ZWBNF6WH/fDwQSPsHsQaXyWFlH
	 EM+/UBLaurImlyqJmUvVBRftYaQQgU3A/h6PXCHWCKbGIoY1zjE60XQmbq1kB/lAQv
	 xl0umbiSzBTIw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORqFvadzj
  ZYP9rVos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeP7t0bmgn7OiuOTf7I0MK7g6GLk4hASeMwo
  MX3DbyYI5zqTxIrZG1kgnL2MErum7mTtYuTkYBOQkrhx/z9bFyMHh4iAnsTVf6IgYWYBFYkXv
  3vYQWxhAQeJVf1XmUFsFgFViedbD4C18go4Sux7NhksLiGgIDHl4Xswm1PASeLw9k9gNUJANb
  OmrmOHqBeUODnzCQvEfAmJgy9eQPUqSsy+3MwCYVdKtH74BWWrSVw9t4l5AqPgLCTts5C0L2B
  kWsVoWpxaVJZapGupl1SUmZ5RkpuYmaOXWKWbqJdaqlueWlyia6iXWF6sl1pcrFdcmZuck6KX
  l1qyiREYuinFbL93MJ5f9kfvEKMkB5OSKG/kt0PJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4N
  zQeThYSLEpNT61Iy8wBxhFMWoKDR0mEV7sDKM1bXJCYW5yZDpE6xagoJc77ogcoIQCSyCjNg2
  uDxe4lRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8T0Gm8GTmlcBNfwW0mAlocUj9QZDFJYk
  IKakGpoxpEYL1cRHfDVcci9x/pnHHjVWsU8KvyIooMHrwTE5t+skoxft3tpmy85qWtWEsv2Nf
  3lOIVZ6kZR18SMRufvcBiQ41s9O7Cib+mX/P7ZJn27S7e18vOMdv5bvr+pQd6vxMMzN+hiwXt
  Flu67K7n29uv2RWvdr5uHzm32ujzs9ZIOG7xjewK1JCWrJvScnRNYKNUzSTuXp/pSUcvMImxX
  Rj2c8Val/UV85ZWSTZ0e87ub3NecPxZAmX/cqBdboyHAaC0693WNU7vZvoEpPMmqPUyPJSO23
  ubLY9ax/NsJp5aYmQeAH3l6LzTSFCG1oZHiV8d40taq+vC395VXErn55mq8rVd/Eadfdefr6s
  xFKckWioxVxUnAgAryI2XlgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-591.messagelabs.com!1673760372!232228!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7511 invoked from network); 15 Jan 2023 05:26:13 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-14.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Jan 2023 05:26:13 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id B0A60100182
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:26:12 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id A3DC1100043
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:26:12 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 15 Jan 2023 05:26:10 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] stress-ng: upgrade 0.15.01 -> 0.15.02
Date: Sun, 15 Jan 2023 13:25:40 +0800
Message-ID: <1673760341-2623-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673760341-2623-1-git-send-email-wangmy@fujitsu.com>
References: <1673760341-2623-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:26:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175881

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../stress-ng/{stress-ng_0.15.01.bb => stress-ng_0.15.02.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.15.01.bb => stress-ng_0.15.02.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.15.01.bb b/meta/recipes-extended/stress-ng/stress-ng_0.15.02.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.15.01.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.15.02.bb
index 0d95cad69f..c554bb403e 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.15.01.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.15.02.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
            file://0001-Pass-LD_GOLD-1-via-makefile-to-enable-gold-linker.patch"
-SRCREV = "8c7c3d95555c50148470553b55477db895a4f1ad"
+SRCREV = "4164f6842c712c2d9a13619c3c70fd35d8d02cdb"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native libbsd"
-- 
2.25.1


