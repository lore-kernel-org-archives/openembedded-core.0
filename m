Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23167C63797
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 05:21:17 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.134753.1673760076613186132
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jan 2023 21:21:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Z67CVtzD;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673760074; i=@fujitsu.com;
	bh=FG+yPFHhRd3jWtglYIxtZwViSO1ZmxZ3h/gv5XgGqpQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Z67CVtzD4dJWaMtzt5Ti8cBAKzZvYW9FffbuWB9rBt58guNHuDCIFKrPh0tBIoZsV
	 8pXX0NPNG7vo6YxQJpoTDtGuWuWSCx0M2te84iKMma7ELk8H4DMytcwtQkIhmTHERO
	 +Zq/uTSPZv9ZOMFxjNua9Re5917e/ZTF6nsUeJFfFPpZTuNdG9O4scW9GhvkdYq7QS
	 q/8+rzwES3f8Kqh5k7Y3iTNNHSgBQrqAkHY2AbYSqUVNzA+8+sSanFY+iDJYRf6rwc
	 d1U6UgS8wK8dUVzO7IKbHnwxPRZGnM6k/Hf5hT67IFdBGRiR9gyVsmDZz+l5yqVAoi
	 wLxcvz/BC5CRQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORqOvRezj
  Z4Mc0Y4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaP1wW/Wgoc8Fau7rjA2MM7n7mLk4hASeMwo
  sXHLBnYI5zqTxILPy5kgnL2MEtd/72fsYuTkYBOQkrhx/z9bFyMHh4iAnsTVf6IgYWYBFYkXv
  3vYQWxhARuJLz8WMIPYLAKqElseHGUCsXkFHCVO7l4OZksIKEhMefgerIZTwEliYc8MsF4hoJ
  pjLz+xQdQLSpyc+YQFYr6ExMEXL5ghehUlZl9uZoGwKyVaP/yCstUkrp7bxDyBUXAWkvZZSNo
  XMDKtYjQtTi0qSy3SNddLKspMzyjJTczM0Uus0k3USy3VLU8tLtE11EssL9ZLLS7WK67MTc5J
  0ctLLdnECAzdlGLG3B2MO5f90TvEKMnBpCTKG/ntULIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lC
  d4NjYeThQSLUtNTK9Iyc4BxBJOW4OBREuHV7gBK8xYXJOYWZ6ZDpE4xKkqJ81b2ACUEQBIZpX
  lwbbDYvcQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmNcAZDxPZl4J3PRXQIuZgBaH1B8EWVy
  SiJCSamBKKLuWPm0XQ5/5M9WNvu1XW8Kc2Y/v38H475xS3bcr3Uc/HG0POZaWL9B08upjpR6R
  himRTG99GxKWLJDMi2JZd/eh9xUdi2uzCquZZxtZLvq7wM1UVnCidkBvoECO4tNPBlIzYpJnF
  3E4PT/ty/7djPNu9HRbO2vF2N7L5t4vy5QXx64yZGx/63F5zfppnDry7mG2Gl0/qlZns+1iPb
  ddnF9pnoq6guBL8e/zd4n492+3YAxY+uT+vU3yevueOHGe+NTY6i6zeZPL7S3/r7+RfdA3a3n
  pFIFJZ/cKWAqySTYd2O91NfbTEbbjk/wDZq6bsPDJkdmexg1SfL0//yfP81tYbHZqXY3cvIC8
  p45KLMUZiYZazEXFiQDOeuZQWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-587.messagelabs.com!1673760072!233065!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28780 invoked from network); 15 Jan 2023 05:21:12 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-23.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Jan 2023 05:21:12 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 708BB100188
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:21:12 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 63700100182
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:21:12 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 15 Jan 2023 05:21:10 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libpcap: upgrade 1.10.2 -> 1.10.3
Date: Sun, 15 Jan 2023 13:20:52 +0800
Message-ID: <1673760055-2483-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673760055-2483-1-git-send-email-wangmy@fujitsu.com>
References: <1673760055-2483-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175863

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
Source code:
   Sort the PUBHDR variable in Makefile.in in "ls" order.
   Fix typo in comment in pflog.h.
   Remove two no-longer-present files from .gitignore.
   Update code and comments for handling failure to set promiscuous
     mode based on new information.
Building and testing:
   install: Fixed not to install the non-public pcap-util.h header.
   pcap-config: add a --version flag.
   Makefile.in: Add some missing files in the distclean target.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libpcap/{libpcap_1.10.2.bb => libpcap_1.10.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.10.2.bb => libpcap_1.10.3.bb} (95%)

diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.2.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.3.bb
similarity index 95%
rename from meta/recipes-connectivity/libpcap/libpcap_1.10.2.bb
rename to meta/recipes-connectivity/libpcap/libpcap_1.10.3.bb
index 48c9bb09d3..eb0a650130 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.2.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.3.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5eb289217c160e2920d2e35bddc36453 \
 DEPENDS = "flex-native bison-native"
 
 SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.gz"
-SRC_URI[sha256sum] = "db6d79d4ad03b8b15fb16c42447d093ad3520c0ec0ae3d331104dcfb1ce77560"
+SRC_URI[sha256sum] = "2a8885c403516cf7b0933ed4b14d6caa30e02052489ebd414dc75ac52e7559e6"
 
 inherit autotools binconfig-disabled pkgconfig
 
-- 
2.25.1


