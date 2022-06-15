Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC050CCA47F
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 08:11:33 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.2013.1655280684896587613
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 01:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JXJ4e2VO;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655280683; i=@fujitsu.com;
	bh=NlGqDHVvj28n2zRhPk2HIrnwfoAUNgLMOXpHvci4MtU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=JXJ4e2VOFM1oAC/wG5EQBW5Lt4TRmh9qaQlKHCrMYjGpbmGo+7FFoQYOjWwq57qR1
	 fNvZX25Hrmc+oNyiBVr2GIZLJsTNCJ9wjgsTST2OScFFYb7SE8uODFDmKCckWIvkTv
	 Wg7jWuyWSKdikWf/b9gXxH8DCoYScJTHTWQGkwnlM1x84EwmY/mW4DIty52Se8Tfoa
	 CAvXAf5xbgsyKBOrtHL3UARB3LiIONwazEtj4MNy+t+E7Bkx15R7C9fQ24FDnIjNGO
	 WLP+MWvPlCvZ50/0EeUx49DOrPtRsAmVZcHCGiq0rB7Dao1kAhzwINbcf44eXYV2P6
	 9+hiXM+bz6aEA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8OxWVdryso
  kgwm/NS3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oxTm16wFPSxV/z6u5u5gXEPWxcjF4eQwANG
  icffFjNBOGeYJC6f7GaFcPYwSjRufwHkcHKwCahJTL91A8jm4BAR0JO4+k8UJMwsoCLx4ncPO
  4gtLGAq8fXfOkYQm0VAVWLH1oNMIDavgKPEzGf7mEFsCQEFiSkP34PZnAJOEre2HgKrFwKq6d
  h9nRGiXlDi5MwnLBDzJSQOvngB1asoMftyMwuEXSExY8Y2NghbTeLquU3MExgFZyFpn4WkfQE
  j0ypGq6SizPSMktzEzBxdQwMDXUNDU11jS11TI73EKt1EvdRS3fLU4hJdILe8WC+1uFivuDI3
  OSdFLy+1ZBMjMIhTitVNdjB2r/ypd4hRkoNJSZRXefLKJCG+pPyUyozE4oz4otKc1OJDjDIcH
  EoSvK6TgHKCRanpqRVpmTnAiIJJS3DwKInw1oO08hYXJOYWZ6ZDpE4xKkqJ88Z0AiUEQBIZpX
  lwbbAovsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmLcTZDxPZl4J3PRXQIuZgBY37lsBsrg
  kESEl1cA0JfzI3UVJPJLZT/iPPQ4/POefeY+Hd8KpBpvc6QaWYj//NvEudXsot2n56r5VpfOf
  TNI1cC08Xrnw/vQv1ndeF2q1LF9T36ii/+9dxdYut68Fwt034nnD7BZuDs2ZKjJ7Ua6wbp/x3
  K59SRf2BqruEY5ZIzt1GePUzMQLZW/+2W4sOXOubL9bcZhw2fnsEoa/Yr7W9bvvMtxU1FpZc/
  Q+O+f7ZdsdxWcI7l9X8+DcnjV/FsxiT/3bsmunCfe2nmeTpvb8Fy9ZtXp/tc9j/rMHc5ZU1Ya
  cX7bpzpzYj5Fa7h2HpsQd4wt58cNI4OonzwyePysrd1o/umT5POib6j2N8P9GyT/lfXYsZ3i+
  fcLkvUosxRmJhlrMRcWJAKZ5t/VdAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-548.messagelabs.com!1655280682!40357!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11167 invoked from network); 15 Jun 2022 08:11:22 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-19.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Jun 2022 08:11:22 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 3BA2314C
	for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 09:11:22 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 00206151
	for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 09:11:22 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 15 Jun 2022 09:11:06 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] file: upgrade 5.41 -> 5.42
Date: Wed, 15 Jun 2022 16:10:37 +0800
Message-ID: <1655280638-6528-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655280638-6528-1-git-send-email-wangmy@fujitsu.com>
References: <1655280638-6528-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 08:11:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166911

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/file/{file_5.41.bb => file_5.42.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/file/{file_5.41.bb => file_5.42.bb} (97%)

diff --git a/meta/recipes-devtools/file/file_5.41.bb b/meta/recipes-devtools/file/file_5.42.bb
similarity index 97%
rename from meta/recipes-devtools/file/file_5.41.bb
rename to meta/recipes-devtools/file/file_5.42.bb
index 653887e97a..8efcf09c9c 100644
--- a/meta/recipes-devtools/file/file_5.41.bb
+++ b/meta/recipes-devtools/file/file_5.42.bb
@@ -13,7 +13,7 @@ DEPENDS:class-native = "bzip2-replacement-native"
 
 SRC_URI = "git://github.com/file/file.git;branch=master;protocol=https"
 
-SRCREV = "504206e53a89fd6eed71aeaf878aa3512418eab1"
+SRCREV = "a42b38690579de23403e0aff9b7b2f9cdf55f534"
 S = "${WORKDIR}/git"
 
 inherit autotools update-alternatives
-- 
2.25.1


