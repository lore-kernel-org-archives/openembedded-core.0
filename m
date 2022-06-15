Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02368C43334
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 08:16:44 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.2053.1655280999921616098
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 01:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lmm+QYi5;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655280998; i=@fujitsu.com;
	bh=z9NKO7Bf1E6hIHLBJKQCipHrtSzNTc9STZbdiNcD3vM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=lmm+QYi5/1kw3z5MiFXtw5ZB82dLpbrEcx8RRU3nQePBvO2iWJ1acwRc+EzG5Yu5y
	 SS9dn22kKUZ4ypUp2PQUFkxGa6AathYElXkWogD9PFEFnG1hHhQ05bsHifjy9EA0pK
	 8N5VLGx/Kn8qzzEhYglLlw9bzQsCGC2X0dBZ/AlblcBKDs8wR72livhN/Ys121FiID
	 rt3g/xFEPqYl5hQ5rjQwvmVBL0VIEXI1ewmd1g49qkXM5aa0uLSyWIuu2P4CgsCkRh
	 iVGnH7Mh1/1h9sQmaXPZcpYTIcPDm16F+gBviu8/XbCcsLnUl14gSPJXLrYbExbsbq
	 /qIKq0tqAGl5Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8ORqJs6dWW
  SQfc3FYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPJtfmMBbvZKqY8v8vYwPiKtYuRi0NI4DGj
  ROPCLpYuRk4g5zyTxOr5ShCJPYwS159/BEuwCahJTL91A6iDg0NEQE/i6j9RkDCzgIrEi9897
  CC2sIC9xL9PZ8HKWQRUJWY0/GQCsXkFHCU+PfoOZksIKEhMefieGcTmFHCSeDNjFjvEXkeJow
  sXMUPUC0qcnPmEBWK+hMTBFy+YIXoVJWZfbmaBsCskZszYxgZhq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaJVUlJmeUZKbmJmja2hgoGtoaKprbK5raKmXWKWbqJdaqlueWlyia6SXWF6sl1pcrFdc
  mZuck6KXl1qyiREYwinFqsI7GDtW/tQ7xCjJwaQkyqs8eWWSEF9SfkplRmJxRnxRaU5q8SFGG
  Q4OJQle10lAOcGi1PTUirTMHGA8waQlOHiURHjrQVp5iwsSc4sz0yFSpxgVpcR5YzqBEgIgiY
  zSPLg2WAxfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMWzEFaApPZl4J3PRXQIuZgBY37ls
  BsrgkESEl1cBkY8Sna8WasN7bgJPD+lrDhqTTt68vfC48RfKaimrD2/MFdfk9e8VNqn7e3Hd1
  kXTP5d/Fm7P3PbT+uVHswVndry+OT1+4W1TITefDndy+bZfmbezd+daiOSgi9JWH5TwpX88rb
  0x3fjGJ1l2yneHdByurkrycB528DHdqJ1qK/d8QvOxdxTWbJ9u3fUmecnlD9p+pL76cCLzEGr
  9X+fcKBet4kw19wUIJHV+X7P7HsmjtXsu8Z8I7D0cKt2Yd47sRWJZWoM6i9q8jyOrG0dBzuZo
  H7HYw5TXobv3eESzdt+SHz2lr/gYXSweToi1nFk3R1Dg5qdpgm+ZXw4sblz02VmIPYGBfUVS7
  v4STu+ScEktxRqKhFnNRcSIAOaovElwDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-571.messagelabs.com!1655280997!148568!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15233 invoked from network); 15 Jun 2022 08:16:37 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Jun 2022 08:16:37 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 2AE04100195
	for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 09:16:37 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 1010D10018D
	for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 09:16:37 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 15 Jun 2022 09:16:21 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] gnu-config: update to latest version
Date: Wed, 15 Jun 2022 16:16:02 +0800
Message-ID: <1655280963-6605-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655280963-6605-1-git-send-email-wangmy@fujitsu.com>
References: <1655280963-6605-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 08:16:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166918

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 0b2bcc0b26..faeb5fce94 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -9,8 +9,8 @@ DEPENDS:class-native = "hostperl-runtime-native"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-SRCREV = "f56a7140386d08a531bcfd444d632b28c61a6329"
-PV = "20220516+git${SRCPV}"
+SRCREV = "02ba26b218d3d3db6c56e014655faf463cefa983"
+PV = "20220525+git${SRCPV}"
 
 SRC_URI = "git://git.savannah.gnu.org/git/config.git;protocol=https;branch=master \
            file://gnu-configize.in"
-- 
2.25.1


