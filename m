Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 793F9C3527D
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:14 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.3526.1649312349952067016
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 23:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tw5H5sRk;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649312348; i=@fujitsu.com;
	bh=1dGvBgd0QKrdOBCJRQZxSa0svZmGT6iHkCRiAXzNLCQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=tw5H5sRkj8Puyvp8gsURFjThL4gZuUsF23REHqjsCxHSrkKHc/0BVlS9Z7nu4o9a7
	 zWOGiGNBxBvdocVHxFcLecsbIcoaJPt93zkChLcChS54WOfkGXV40sN89twOPMRum1
	 mZ17qm2rlIZpI098sz2NkKXUwIeWwSmPepsbDI/dJJqj2uKYFxgePywmiEpni0q8gD
	 NPTr3ScMNIkwp9bEX5VpZaDrHMZF5tVQqBvxK6RkqP5A/nu+0hff4R6TFGuwpctm81
	 /H2ydVEa+xeGx2nZXCvxNlWZGkLQfJ6E2bvj6nxrkP8VGQEaE6ho4plKfrnh6mNg9N
	 UOUUQL0aGk+HA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRWlGSWpSXmKPExsViZ8MxSTe6yS/
  J4N1RVYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePXj2/sBT2cFW0TF7I3MK7m6GLk4hASeMwo
  8eZjAxuEc55JonnyImYI5wSjxO7WG0AOJwebgLrE45uvGbsYOThEBPQkrv4TBQkzC6hKdF9cw
  w4SFhawl9j5PgYkzCKgIrHy/RoWEJtXwF1i57cFYLaEgILElIfvwSZyCnhIzPjdxA5iCwHVrL
  nfwwZRLyhxcuYTFojxEhIHX7xghuhVkjix4iMThF0h8frwJai4msTVc5uYJzAKzkLSPgtJ+wJ
  GplWMdklFmekZJbmJmTm6hgYGuoaGprrmQMrMTC+xSjdRL7VUNzk1r6QoESitl1herJdaXKxX
  XJmbnJOil5dasokRGMopxW7LdjDu6/upd4hRkoNJSZSXtc4vSYgvKT+lMiOxOCO+qDQntfgQo
  wwHh5IE76EGoJxgUWp6akVaZg4wrmDSEhw8SiK8yiBp3uKCxNzizHSI1ClGRSlx3qJGoIQASC
  KjNA+uDRbLlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ824AmcKTmVcCN/0V0GImoMV1B31
  BFpckIqSkGpjin3mHefjNtNksE/0mvDdTP2VZmtcZyUvXYlXYKl42Cj0SLb9/dBWb7I8WM7tD
  bhsfP8yqcjZ48OW0Dq9hn0dyyUyr+cH97HtvLCl0O3BmLfccoSsHVvP4nXhyZq82Y/hRMYOok
  rWnU/9493xr1c6NP2f86OpEllCGcq2OIja+872z5wtw7I5a//yEUfM//p5VmbPOTHiwdMG+G3
  3uob4zzx6Lzv1dHnBZIlciwJRZ4+rcOKtVht8c3R+mTvH/M+sq36UWr7cP5VpY3/1RU8ncset
  3yfJtftdS1RNr/X9ldZ7LDa4tk+8znlKrliV4TLj9da6kSuydvNLQs0fWbp5s6LStfleBep20
  gtq550osxRmJhlrMRcWJAKAp6rhgAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-532.messagelabs.com!1649312347!44021!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6097 invoked from network); 7 Apr 2022 06:19:07 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Apr 2022 06:19:07 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id E2825100461
	for <openembedded-core@lists.openembedded.org>;
 Thu,  7 Apr 2022 07:19:06 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id C899A10046D
	for <openembedded-core@lists.openembedded.org>;
 Thu,  7 Apr 2022 07:19:06 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 7 Apr 2022 07:18:54 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [OE-core] [PATCH] python3-zipp: upgrade 3.7.0 -> 3.8.0
Date: Thu, 7 Apr 2022 14:19:16 +0800
Message-ID: <1649312356-25963-5-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649312356-25963-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1649312356-25963-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 15:41:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164100

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
=========
Removed compatibility code.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-zipp_3.7.0.bb => python3-zipp_3.8.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.7.0.bb => python3-zipp_3.8.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.7.0.bb b/meta/recipes-devtools/python/python3-zipp_3.8.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-zipp_3.7.0.bb
rename to meta/recipes-devtools/python/python3-zipp_3.8.0.bb
index 495e7f51f0..f1fd383842 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.7.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.8.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-SRC_URI[sha256sum] = "9f50f446828eb9d45b267433fd3e9da8d801f614129124863f9c51ebceafb87d"
+SRC_URI[sha256sum] = "56bf8aadb83c24db6c4b577e13de374ccfb67da2078beba1d037c17980bf43ad"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.25.1


