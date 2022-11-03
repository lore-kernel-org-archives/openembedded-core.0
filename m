Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E12C4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 05:31:19 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web08.15890.1667453476234957803
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 22:31:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RHGbieCk;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667453474; i=@fujitsu.com;
	bh=YbCFcmL/LunOjEeKJPouSM4qyG0OHpuk6ndGl0msR8k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=RHGbieCkUvdKpluYBJH9aKfuqHUFeCPkAUAmxzfIQa2popWzTJl7g0e/jR/G3eOyQ
	 qKcA/k3FMYTvIaiHZYtyTtEZfgGYv0QinUFGQOQ7BZbRkZ8lwoe/ZrCoWFfGJpNmgB
	 2uSuo3nj7Ni26SVQEdvkGKebaQD1Pn2cqVL1bj4xNQOPgV+c4vZmj3U2uNqs1bfLTa
	 tbMK+qdHFCoKfg7EJqTHnt0iCStiL+0xeXaFUUHD7B8/ql52RO274jwvnr4OX92SOw
	 YtuWQEYIhdWkzK9/MJg2xEWUcVVcfizMitM6bTGJ9FYnEcswTMQvMu3OhzpGCJah9i
	 97zdhsc75qYwQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORpKsYlJx
  sMHeDvsWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmtH3Pr/gHU9Fz85frA2My7i7GLk4hATuM0p8
  6jjLCuFcZpKYd6SNEcLZzShxbNoKoAwnB5uAlMSN+//Zuhg5OEQE9CSu/hMFCTMLqEi8+N3DD
  mILC1hKPN26hQ3EZgGKN3/6BxbnFXCSON35gwXElhBQkJjy8D0ziM0p4Czxs30WmC0EVLNyxx
  oWiHpBiZMzn7BAzJeQOPjiBTNEr6LE7MvNUHMqJGbNamOCsNUkrp7bxDyBUXAWkvZZSNoXMDK
  tYjQrTi0qSy3SNTTVSyrKTM8oyU3MzNFLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuuzE3OSdHL
  Sy3ZxAgM3ZRihUs7GN8s+6N3iFGSg0lJlPfKzqRkIb6k/JTKjMTijPii0pzU4kOMMhwcShK8W
  oHJyUKCRanpqRVpmTnAOIJJS3DwKInwXvcDSvMWFyTmFmemQ6ROMepyzPzadoBZiCUvPy9VSp
  w3EmSGAEhRRmke3AhYTF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMy7FWQVT2ZeCdymV0B
  HMAEdsa06CeSIkkSElFQDE1tYxFGtDzXxZSVWbT92fGjtEZjBbPiqSzu3vqP04NWbns85d6pu
  OL1csfPMotlPwxfHG2ro7wyIPVmmNuGjpWJOZ5lVxcnsa6tsqpOP/1vrm1k0ncu2vIhx2bmLj
  PN0mHZOPm3o5ah9hrXuScibMlYGkYb5TVEx/1bXynM92rdATvPTu9eGpUY6Xb/u3D75787Zgy
  cCVLweVOv4XNka2mByb66fp/SK2qK3eaGb//d8V7NaIGiRoFIT9WDK7R0HeTzlzc9b5F6+XcP
  +pmuBysGijQvt32h/qrqgvr6XledHnVjTTTWrviDRlScal6nOTvs7zW6SYuAnrq7r8oUV6Soh
  hx7Z1s7Nd2nIU+hRYinOSDTUYi4qTgQAgkeEemQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-571.messagelabs.com!1667453473!6569!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26271 invoked from network); 3 Nov 2022 05:31:13 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-11.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Nov 2022 05:31:13 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 7C52273
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Nov 2022 05:31:13 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 70CFF1AF
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Nov 2022 05:31:13 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 3 Nov 2022 05:31:11 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] diffstat: upgrade 1.64 -> 1.65
Date: Thu, 3 Nov 2022 13:30:47 +0800
Message-ID: <1667453448-28192-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667453448-28192-1-git-send-email-wangmy@fujitsu.com>
References: <1667453448-28192-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 05:31:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172605

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2022

Changelog:
==========
 correct case where there is no unified-context.
 trim trailing '/' from pathnames, e.g., to handle "diff -ru FOO/ BAR/ | diffstat -K"
 update configure macros
 update config.guess, config.sub

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../diffstat/{diffstat_1.64.bb => diffstat_1.65.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/diffstat/{diffstat_1.64.bb => diffstat_1.65.bb} (81%)

diff --git a/meta/recipes-devtools/diffstat/diffstat_1.64.bb b/meta/recipes-devtools/diffstat/diffstat_1.65.bb
similarity index 81%
rename from meta/recipes-devtools/diffstat/diffstat_1.64.bb
rename to meta/recipes-devtools/diffstat/diffstat_1.65.bb
index 717f503039..59db7b1d78 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.64.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.65.bb
@@ -5,14 +5,14 @@ reviewing large, complex patch files."
 HOMEPAGE = "http://invisible-island.net/diffstat/"
 SECTION = "devel"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f605b1986cc3b808ec0e4fa9d0e0f2d9"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6450594049f0eed1052e634ddcbeec28"
 
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://run-ptest \
            file://avoid-check-user-break-cc.patch \
            "
 
-SRC_URI[sha256sum] = "b8aee38d9d2e1d05926e6b55810a9d2c2dd407f24d6a267387563a4436e3f7fc"
+SRC_URI[sha256sum] = "8cf27424926debcd85921755c3915559288244bd103f62d740dc6b83b557a28a"
 
 inherit autotools gettext ptest
 
-- 
2.25.1


