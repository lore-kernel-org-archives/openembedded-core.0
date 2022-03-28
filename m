Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB1DC433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 09:53:13 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.8979.1648461193049249336
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 02:53:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bDTMZJWq;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648461191; i=@fujitsu.com;
	bh=uINBjccL67qyCc7MZYqB8RTFFCIdGniPGXDf0IKFuD8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=bDTMZJWqBciBoVSqe3VoXRCHyxfwe6Qo8cKA8jMwQE52RysLhEIJvm90DxfCFCS2S
	 idFdMP/MjmKyOyj1EaUO4dD8MV3a5fJB9yMLrRZljRrB2Qsp7gA31Pta+Wp4cERlMP
	 N+pb10eit1kBnIg87uoaydMBm03UXakWKQLDYwuTl6N3Pnsc7FTA13Fny8DsgNCH6N
	 ra8WY1DzUiuLocDy4s0Z/6QHNgINS/Em76wn2F09LlUQb4QhSI7yjlTR8B+3iy2Soa
	 7TyHwYvTZdJ4hJbYJ6SY0Xi8ZdgZgvTRPDqo8OLBJBsx7S0Zt3g6F5/ZofuJVJ0Vfi
	 IxaJ/sDX+0HrQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8ORqNvS6ph
  k0HRF2+LOz3fsDowe5zauYAxgjGLNzEvKr0hgzTj/wqJgKmfFjsd3WRsYd3N0MXJxCAk8ZpTY
  e6qREcI5zySx/Ec7K4Szh1Hi4rUz7F2MnBxsAmoS02/dAEpwcIgI6Elc/ScKEmYWUJF48bsHr
  ERYwEXi45UORhCbRUBVYu+NqWwgNq+Ak8Tty1vAaiQEFCSmPHzPDBEXlDg58wkLxBwJiYMvXj
  BD1ChKzL7czAJhV0jMmtXGBGGrSVw9t4l5AiP/LCTts5C0L2BkWsVonVSUmZ5RkpuYmaNraGC
  ga2hoqmtsqWtkYKCXWKWbqJdaqlueWlyia6SXWF6sl1pcrFdcmZuck6KXl1qyiREYlCnF6id2
  MD5d+VPvEKMkB5OSKK9RpmOSEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQneW81AOcGi1PTUirTMH
  GCEwKQlOHiURHhNm4DSvMUFibnFmekQqVOMilLivMEtQAkBkERGaR5cGywqLzHKSgnzMjIwMA
  jxFKQW5WaWoMq/YhTnYFQS5nUBmcKTmVcCN/0V0GImoMVr39mCLC5JREhJNTAtDVngdaHno11
  6kRtXCKPh4fkNdy6c1wx0+apjIKH55ermgxmVRTzyfs8Yk07qKPQLuDjOfyxgGP12e0/C3IKD
  Go3brux/ce8OE+8ew5Uznts/XeUdyh1Y3fzaXz7Qeb/Z3+9Rh2WkA52Tok7+yp//qXLKjvDyD
  UsfT8vx/P/z8ARlNiH/VyJ6wv2TjU/7puqFcK+03f5XXvHRzfei5xuTjBcfinx5JO4c5+79a/
  6c/BSkM8ueQWvTYsb+QzwHt5fuWfbtxsFLTJe7qn8G93kd3vX+u9HPo6sutZVNKl+i1vJg9qZ
  X4qVun+0Yv/YnP3huu4nj0AF1lYCXKpI/nlQkHU7ha41I++CYxlD3dYqMEktxRqKhFnNRcSIA
  /bpIWEUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-565.messagelabs.com!1648461188!257613!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18958 invoked from network); 28 Mar 2022 09:53:08 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Mar 2022 09:53:08 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 3055A100196
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:53:08 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 0B4FF10018B
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:53:08 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Mar 2022 10:53:04 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] glib-networking: upgrade 2.70.1 -> 2.72.0
Date: Mon, 28 Mar 2022 17:52:49 +0800
Message-ID: <1648461173-15770-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 09:53:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163696

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{glib-networking_2.70.1.bb => glib-networking_2.72.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.70.1.bb => glib-networking_2.72.0.bb} (93%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.70.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb
similarity index 93%
rename from meta/recipes-core/glib-networking/glib-networking_2.70.1.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.72.0.bb
index 44bc08f159..d578f17aa5 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.70.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.sha256sum] = "2a16bfc2d271ccd3266e3fb462bc8a4103c02e81bbb339aa92d6fb060592d7bc"
+SRC_URI[archive.sha256sum] = "100aaebb369285041de52da422b6b716789d5e4d7549a3a71ba587b932e0823b"
 
 PACKAGECONFIG ??= "openssl ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 
-- 
2.25.1


