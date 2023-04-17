Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF6FFC77B70
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 06:53:20 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.48441.1681714394426185739
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Apr 2023 23:53:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Wxe9XYWx;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681714392; i=@fujitsu.com;
	bh=6bln0UT5wxOywJkg7jZHaKmOjaB6Q10+XEER9aNhbio=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Wxe9XYWxpnoBSqzJtMeixgIncWzQmyJXqKlzTYfOFAX3CV7LzTs7PckhfzyUBZY7d
	 z3VBkniACI9a5DDLifbYSHuSFBwXm1nadxGJ7+m5fxW5FufeMMXuZKWBFXLL4oJMtl
	 R6v/tDGf63wYra/Er1WtdDy7cIKX8XGK7qUFGx5j7vrQ2zX8j5ZTq2bpN7GGoWvmSm
	 7T7tVIvc56V3V/nKzu+wbZr5h00d78XHW+m2Ly/w+MwgCcvdE1X3gVec+Anh1VK2e5
	 OYxXOeIA9we2NPAwQI3mNxow82oWe3nXipX2eDtsXUT/eEIQy2+d2Y/34omvtH1RLs
	 Nq1XO5jg6qhbQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpHvjjU2
  KwYyrShZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bjx+fZC+5yVPw51szewNjE0cXIxSEkcJ9R
  4urfP+wQzhUmif+PfzNDOHsZJRb92svUxcjJwSYgJXHj/n+2LkYODhEBPYmr/0RBwswCKhIvf
  vewg9jCAh4Su7obwMpZBFQlnrRdArN5BZwkbm2/zwxiSwgoSEx5+B7M5hRwlth47CEriC0EVP
  N/VzMLRL2gxMmZT1gg5ktIHHzxAqpXUWL2ZYgaCYFKidYPv6BsNYmr5zYxT2AUnIWkfRaS9gW
  MTKsYzYpTi8pSi3QNDfWSijLTM0pyEzNz9BKrdBP1Ukt1y1OLS3SN9BLLi/VSi4v1iitzk3NS
  9PJSSzYxAoM3pVjZYwfj076/eocYJTmYlER5X6RapwjxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4
  G14bZMiJFiUmp5akZaZA4wkmLQEB4+SCK/xM6A0b3FBYm5xZjpE6hSjopQ4bytInwBIIqM0D6
  4NFr2XGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzXnsBNIUnM68EbvoroMVMQIvllMAWlyQ
  ipKQamPYeOhL5/fovvVcpqxs/xN1wrJOUXKZ74uWd/cm3+P9U6wr0HXnjkOKmbz/p3G2X9mN7
  lPqFDM50nnn6xnVDeW6f+Vm3Dluf7jY/jzOvyxZ9WNYTa/3wZpeEsZst46pFnHcX115+8+Lr8
  x+dLrbhRh9OZl7+PDs7NLLixZdkmazvXyPWtG1N1/s79ZXWli0lux8/m3IysOqvtfi++T+u2F
  rPeHQ26sQ6L/Egm1VWslvTDSe9Mtior8SWfTf3kX2t8vI/rycGxE1UN/GffOTxv1Xvn8ebHTR
  zcc2O3Oc08YD7xUr/wE+m1U0W8jFe1xg0b++accN1ZlbMdzWWcBvun0tsbsqVxTO8soudPa3z
  U5QSS3FGoqEWc1FxIgC2E7wXWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-571.messagelabs.com!1681714392!400153!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17953 invoked from network); 17 Apr 2023 06:53:12 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-23.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 06:53:12 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 43BC47B
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:53:12 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 378971AC
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:53:12 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 07:53:10 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-web3: upgrade 6.1.0 -> 6.2.0
Date: Mon, 17 Apr 2023 14:52:19 +0800
Message-ID: <1681714339-18687-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681714339-18687-1-git-send-email-wangmy@fujitsu.com>
References: <1681714339-18687-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 06:53:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180135

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-web3_6.1.0.bb => python3-web3_6.2.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_6.1.0.bb => python3-web3_6.2.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_6.1.0.bb b/meta-python/recipes-devtools/python/python3-web3_6.2.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-web3_6.1.0.bb
rename to meta-python/recipes-devtools/python/python3-web3_6.2.0.bb
index b813e632b..8e09cabbb 100644
--- a/meta-python/recipes-devtools/python/python3-web3_6.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_6.2.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dc2732bdc5e50382737979791cbb3b7"
 
-SRC_URI[sha256sum] = "55e58f2b8705f0911db5a395343b158d5e4edae9973f5dcb349512ae5a349af5"
+SRC_URI[sha256sum] = "7695ee81162c644de0dfd0f5372f96a73be557b46365d218f581ca10197c6389"
 
 inherit pypi setuptools3
 
-- 
2.34.1


