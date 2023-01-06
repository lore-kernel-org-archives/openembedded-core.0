Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C37C3DA7A
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 01:49:27 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.3802.1672969762241916347
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jan 2023 17:49:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Ho4R1vxR;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672969760; i=@fujitsu.com;
	bh=+5vBEdtZabL4cEUmQx7sEVioLRSaFP9ctz6hLJelfbg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Ho4R1vxRhUdDGXjgdilYDfalLLid/DwWiwdTGSFYANEjZsU/HhMyUXkgvhBJEJdI0
	 ys2ItTZhoHUtadi+silMPtaAr0nJNmbwXFpXS8IForXseF/WQHLcy/RqO997k1peO5
	 kwEs3bRXfRfZAlXIXx5ZJICMsDPkRWom7H4joNunUs0mqPfp5mwFmyx8kSehl/fM0r
	 2/gI/VStkr+1PT957Io/Xm49PVptu7lBTpyj8q6rCLMuVI482vbV+W4H0/2a52OzGe
	 acsB3GLaViAdOtGwFdryAI18sCEkOB620A76XosK4S3gaEeOOm0htKpMhCyPGJjToz
	 uPAVV+ej9/DnA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8ORpCtftz3
  ZYMYCdos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeNK/3rmgr2cFRtWbWNpYDzI0cXIySEk8IBR
  4v5Xni5GLiD7MpPEzlsfmCCcvYwSr648ZwKpYhPQkNg99TJzFyMHh4iAnsTVf6IgYWYBNYmjL
  38yg9jCAnESbR+3MoLYLAIqEgua5rGA2LwCLhLXjz4HsyUEFCSmPHzPDBEXlDg58wkLxBwJiY
  MvXjBD1ChJvL20hxHCrpRo/fALqldN4uq5TcwTGPlnIWmfhaR9ASPTKkbz4tSistQiXUNTvaS
  izPSMktzEzBy9xCrdRL3UUt28/KKSDF1DvcTyYr3U4mK94src5JwUvbzUkk2MwGBMKU7g3sH4
  aNkfvUOMkhxMSqK84a3bkoX4kvJTKjMSizPii0pzUosPMcpwcChJ8HbWbk8WEixKTU+tSMvMA
  UYGTFqCg0dJhFcyDyjNW1yQmFucmQ6ROsWoKCXOe6oGKCEAksgozYNrg0XjJUZZKWFeRgYGBi
  GegtSi3MwSVPlXjOIcjErCvE/KgabwZOaVwE1/BbSYCWhxyMKtIItLEhFSUg1MS2W6nxsteGH
  b3q3/eOPt+OaF2/gZuU0W3G6dzrFs56mAa7PFGJnke9Wl5Q6w6N5/nrGXJ4sl6fRveduYqMeT
  /j/IOjKj5AZbd59dyecXB/w3FRzp/FD+r1JI7ILXnraUd8p9bGIWJw8xsO4/WliU/L7oxHa+/
  R4MfDNezQ169167baVFpf2V8uV8bexbdX9v2a9zea2w9j0DxdnnS+NZGuu0gkLWrled1Xjm61
  q7jt/5G99cijXWylhTqma49dOCg/MWVrXZxkTme4vuWvr/rsyvkp0+R0pO7p2zeuK1cC/fzm+
  r/n2IS3F9YPmlov3468yUC1Hu0bNnv/ybs/C/UZ/aq6DfDkcEFZj9tHtTlFiKMxINtZiLihMB
  Cm1nCUEDAAA=
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-2.tower-745.messagelabs.com!1672969758!133514!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9867 invoked from network); 6 Jan 2023 01:49:19 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-2.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 6 Jan 2023 01:49:19 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 8CC1D1B1
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Jan 2023 01:49:18 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 80F857B
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Jan 2023 01:49:18 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 6 Jan 2023 01:49:17 +0000
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH] libpng: Enable NEON for aarch64 to enensure consistency with arm32.
Date: Fri, 6 Jan 2023 09:49:00 +0800
Message-ID: <1672969740-3842-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 01:49:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175553

- When NEON is not enabled for arm32, it shouldn't be disable enable-arm-neon for other arches.
- NEON is enabled for aarch64 by default, so, to ensure consistency with arm32, reference to libpng-1.6.38/configure, added enable_hardware_optimizations option for aarch64.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta/recipes-multimedia/libpng/libpng_1.6.39.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
index d9dcf37..b17261a 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
@@ -22,7 +22,8 @@ BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
 inherit autotools binconfig-disabled pkgconfig
 
 # Work around missing symbols
-EXTRA_OECONF:append:class-target = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off", d)}"
+EXTRA_OECONF:append:class-target = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", " ", d)}"
+EXTRA_OECONF:append:aarch64 = " --enable-hardware-optimizations=on "
 
 PACKAGES =+ "${PN}-tools"
 
-- 
1.8.3.1


