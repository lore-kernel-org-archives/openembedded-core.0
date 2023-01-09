Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40EB6C54EBD
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 05:15:26 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.64470.1673241319311590558
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 21:15:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qeAU6VXD;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673241317; i=@fujitsu.com;
	bh=vU+gUufmYRJxJDxCLKHDcfqpdlYZdiAtaGtWAo9uZ1A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=qeAU6VXDzPL9N3a9a16D7l0RUGLULpmEQmuSg1Wy/irCkhZThxC/+kJDAl035i2s6
	 CVP1sm5AsgeDBQ70Xo4XpJAGeiBxh/X5NBaNv88RoCfYGPto/JtwS9YaZcw75Y9U7d
	 nwHuVj1npz5SFVhaLpNY4zxJ6riL0F/oLw6+wofysunzhwHJhlFb5caxScElJ432n9
	 ZLmUa16cC623gArjiCPIfj57DjLP5iusFrBWlobR7/tkjnGxvStibI3Zga98XzblVB
	 G3RIrVXq/LT1yV7BV2c1m5zKDX47xSy4OozlXtwSLkd3P9lsUY8IU5cXpthNDYKkof
	 QLe9YSCNezW0Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8ORpPtk0e5
  kg8nn9S3u/HzH7sDocW7jCsYAxijWzLyk/IoE1ow3N5YxFZzkrLixuIOpgfEaRxcjF4eQwANG
  iR+Pp7NDOJeZJA7uWsgC4exhlHi08DNjFyMnB5uAlMSN+//Zuhg5OEQE9CSu/hMFCTMLqEi8+
  N3DDhIWFnCQ+DtDBSTMAhRef/4/C4jNK+Ak0djawAxiSwgoSEx5+J4ZpJxTwFniQLskSFgIqO
  TC5SNsEOWCEidnPmGBmC4hcfDFC6hWRYnZl5tZIOxKidYPv6BsNYmr5zYxT2AUnIWkfRaS9gW
  MTKsYzYpTi8pSi3QNTfWSijLTM0pyEzNz9BKrdBP1Ukt1y1OLS3QN9RLLi/VSi4v1iitzk3NS
  9PJSSzYxAgM3pZi9eAfjg2V/9A4xSnIwKYnyclTtShbiS8pPqcxILM6ILyrNSS0+xCjDwaEkw
  Tt74e5kIcGi1PTUirTMHGAUwaQlOHiURHi5ZgKleYsLEnOLM9MhUqcYdTk+HLqyl1mIJS8/L1
  VKnLcWZIYASFFGaR7cCFhEX2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzCsxD2gKT2ZeCdy
  mV0BHMAEd8WPqTpAjShIRUlINTAkO5Ww7AhT+C+hcuCfWdb1CQtFM8/qBn5c+Pyn/fuLj73Nl
  0aVL3Vwjju56e6tJLnLD4jV277/+WnJdrNr3r0b33tz3RzWWb/Io7jzX7nTz71JWY7O7PJm9i
  zUKohRK3eef02W8l+vGs2ANz80Pv/ufu/iKzritf4TxUKxIcewnt9P7LKv7Xr3beHPtJQvHtZ
  6Sa9Jq/8gFOtWFb5tYFCPSEDDth+X8zfkC/WnvNOs5m1x/KPf87vsaVqp6yODDyYzD5X87m1p
  mfT6z74Aet/29mVcOrfw66+mmwP8WZc+1Lt+LjQ+2mL3A/YJTgqzqv2zNI/6PyxY0nju3sbrl
  U0HOHf2IyBtNpQs+bFu4arESS3FGoqEWc1FxIgBqAE1MYwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-587.messagelabs.com!1673241316!302132!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10705 invoked from network); 9 Jan 2023 05:15:16 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-8.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Jan 2023 05:15:16 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 5FAA91AC
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Jan 2023 05:15:16 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 53E337B
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Jan 2023 05:15:16 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 9 Jan 2023 05:15:14 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libva-utils: upgrade 2.17.0 -> 2.17.1
Date: Mon, 9 Jan 2023 13:14:55 +0800
Message-ID: <1673241297-28966-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673241297-28966-1-git-send-email-wangmy@fujitsu.com>
References: <1673241297-28966-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 05:15:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175660

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* fix: Fix possible memory leak
* fix: fix coding issues of array size and function return types

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libva/{libva-utils_2.17.0.bb => libva-utils_2.17.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libva/{libva-utils_2.17.0.bb => libva-utils_2.17.1.bb} (95%)

diff --git a/meta/recipes-graphics/libva/libva-utils_2.17.0.bb b/meta/recipes-graphics/libva/libva-utils_2.17.1.bb
similarity index 95%
rename from meta/recipes-graphics/libva/libva-utils_2.17.0.bb
rename to meta/recipes-graphics/libva/libva-utils_2.17.1.bb
index c5a563b853..1e475e804b 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.17.0.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.17.1.bb
@@ -15,7 +15,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b148fc8adf19dc9aec17cf9cd29a9a5e"
 
 SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.17-branch;protocol=https"
-SRCREV = "42c02a6a37b1bfce91a7f15c898750f2ee9e3d6a"
+SRCREV = "3a291be22cfe70e41bad8a376fa278efa651fdff"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))$"
-- 
2.25.1


