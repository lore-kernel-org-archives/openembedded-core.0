Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3431C636CD
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 10:20:40 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.80488.1675765230496633823
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 02:20:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Yohp+o99;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675765228; i=@fujitsu.com;
	bh=T2piFGeeKHlmqsNNxU+NovgrLwD56cWLSjcbn2mn8QI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Yohp+o99GQuEsGDjAJ/vq7LylqKfB8yxFA9ziBR0QTF/2/VIg1ddxvdUPolfC3/qT
	 gyxZ65xn3FQ7fDH2tUZdPcnTNvlMbQsbOZhcaiEtUCWLE7UIY/9oGBbJgZt48nCR4T
	 jzv+Rbs6MMNGUZ9vK0eG3DrlDezZrbPf/0RIIFp0YizWDvyzgMM9n8oJUjG7HzIjjI
	 LZjpbOva6AFWSIXzwthTmS7RsSOSof1rs1qA8D6pd22Rq0OzS04KUwywjaMzaWYyQK
	 DlVNldbWxBff3gbnNPnWXrY6z0i5WQYKaFH9bmZfZ887BKVeFR8yrFfgptiPUzMd4s
	 RENQ3dtmfis7A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRWlGSWpSXmKPExsViZ8ORqPtG9VG
  ywY+jvBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0b/jwWMBW3cFZ/nXWJvYHzM2cXIxSEk8JhR
  4ujss6wQznUmic/Lt7NBOHsYJdau+cbUxcjJwSYgJXHj/n+gBAeHiICexNV/oiBhZgEViRe/e
  9hBbGEBO4mVc5aClbMAxefOv8cCUs4r4Cjx8WACSFhCQEFiysP3zCA2r4CgxMmZT1ggxkhIHH
  zxghmiRlFi9uVmFgi7UqL1wy8oW03i6rlNzBMY+WchaZ+FpH0BI9MqRtPi1KKy1CJdU72kosz
  0jJLcxMwcvcQq3US91FLd8tTiEl1DvcTyYr3U4mK94src5JwUvbzUkk2MwEBMKWYx28HY3vdX
  7xCjJAeTkijveulHyUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeFlUgHKCRanpqRVpmTnAqIBJS
  3DwKInwpoGkeYsLEnOLM9MhUqcYFaXEecUlgBICIImM0jy4NlgkXmKUlRLmZWRgYBDiKUgtys
  0sQZV/xSjOwagkzOuhADSFJzOvBG76K6DFTECLQ1QfgiwuSURISTUwrfRWmFMVuv9EjklQct7
  zymXPFPi/8HcUTsr+J8bno/Nv72TpFVVdf7h0zNbemt2i8GVl+abSrUGJx8Py586qOZd7Unjt
  nn23+r5oe7LdV/o2Ofz1beewGd+v/m2culrO71bIDT69A7XegZ7VkcsdN+z4ERe5tjjtaW2Gr
  v7jhCMTfl2oPrL7I3uqVbVtvcHzgLCa7f33jWzFXlgL/Is4Uz39q3VCUdKH0h/tR6/HbbjebB
  X5/1h/mniH5XomJrfArSKSU9RP5RV9KLDl+z7x8K7NR/ZPP9fi9HWLpcOeBSn73x3/dlJvmfK
  PLdWrzUrcVE8fDmjduq1B1jKiNNnX43LUdod5tV/1VaTe7wm/qsRSnJFoqMVcVJwIAPh72SM/
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-587.messagelabs.com!1675765227!99212!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9444 invoked from network); 7 Feb 2023 10:20:28 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Feb 2023 10:20:28 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id CE7ED100191
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Feb 2023 10:20:27 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C242B100043
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Feb 2023 10:20:27 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 7 Feb 2023 10:20:26 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] btrfs-tools: upgrade 6.1.2 -> 6.1.3
Date: Tue, 7 Feb 2023 18:20:16 +0800
Message-ID: <1675765217-3462-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 10:20:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176809

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
* fi mkswapfile: fix setting size
* mkfs: check zoned support of libblkid
* check: improve error messages for mismatched references
* other:
   * pass CFLAGS to static build
   * documentation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../btrfs-tools/{btrfs-tools_6.1.2.bb => btrfs-tools_6.1.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.1.2.bb => btrfs-tools_6.1.3.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb
index b10d7efdb5..b4dfc5b3f3 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;b
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            file://0001-Use-pread-pwrite-ftruncate-stat-instead-of-64bit-equ.patch \
            "
-SRCREV = "660d10d3fb2e87909d379b0ea3c52934543455c7"
+SRCREV = "908b4b4450320e30fdef693f09b42f4eb93702c3"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.34.1


