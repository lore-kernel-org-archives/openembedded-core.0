Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D541DC77B76
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 06:47:10 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web10.48370.1681714026393361031
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Apr 2023 23:47:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xxwLGGQY;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681714024; i=@fujitsu.com;
	bh=1WWZ4r0ndMlIBTvHQkfevYKnPNd68a86Gz3K8XpPlz8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=xxwLGGQY3Amaw4dv66YTHDdsVHGuMDMAMlwR+DMcG67K+00Z1HyyUGthdSXCRzjOn
	 tpCvTMA3KlpdKbrZsVT7E8KBBEBK4AkY8DM9Nx6hp1UOZVJ6K9uKxBysa/8voPJKok
	 vkco9NuYGBN1CReMeZ+lHBOQkGM4p7P6cqr3W6QYTuHLRs8GxqqmrsylpenqXkaoRA
	 u9P5WDR7qDlVRdSn6nZaQoqWYOLXIMwxuFX/nGuW8PrL6e7lzJRmrxmc0MzbqOCTPS
	 80EAhSiHMTUmS7Nxa7Wb0bLfbaGjw/tXJa1rDRdNaQC+D57bm667yaq3U8mbp3zfkF
	 4g+vliWVmSzjw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxSTfjtU2
  KwaoLXBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aCy3PYCy5wVZx6MZm9gfExZxcjF4eQwGNG
  iR2rHzFBONeZJJa9vcgC4exllHjfuBMow8nBJiAlceP+f7YuRg4OEQE9iav/REHCzAIqEi9+9
  7CD2MIC/hJNt5+wgNgsAqoSJ+8/ZwSxeQWcJC4v7WIGsSUEFCSmPHwPZnMKOEvsP/kDbLwQUM
  3d25+YIOoFJU7OhJjDLCAhcfDFC6heRYnZl5tZIOxKidYPv6BsNYmr5zYxT2AUnIWkfRaS9gW
  MTKsYzYpTi8pSi3QNDfWSijLTM0pyEzNz9BKrdBP1Ukt1y1OLS3QN9RLLi/VSi4v1iitzk3NS
  9PJSSzYxAoM3pZipagfji76/eocYJTmYlER5X6RapwjxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4
  A14bpMiJFiUmp5akZaZA4wkmLQEB4+SCK/xM6A0b3FBYm5xZjpE6hSjopQ4r8QroIQASCKjNA
  +uDRa9lxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8157ATSFJzOvBG76K6DFTECL5ZTAFpc
  kIqSkGpgybgnNcbrmtp5hmyfXrT7eLV0qB074J2u+TwvXfJPQndr6YHtUwCtJgWmi8hdXpUwV
  ybF/+3ufHePS4yfm5p9dc1V7ftLFHy/uyi7i+CLAvHvf0Qrrm8LpuiEC+rYR07y6X3u4aT5Mn
  Bqd8rni9McfCyLDGJmfCMaH/m7uznz/8LSuaGPdo5JIC1HxxWdCGN50rzvv/285w7+l7B8TWj
  ac1ZnPYKh50Ihx2s+tBzqEKg6Xz9malTR7u6rnv8Wb7uX2C7leZTBWPhga05C5/dhXns7Fdsc
  u90wtYb8uVikmOz95xmxBk8dWdnNKotoUshZNlHb5fuf1v3OTNNWOzPj9Xb7ZT+bknPhn8887
  5ScqsRRnJBpqMRcVJwIAKJut+lkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-585.messagelabs.com!1681714023!734444!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24104 invoked from network); 17 Apr 2023 06:47:04 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-5.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 06:47:04 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C58441000D2
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:47:03 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id B87F31000FC
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:47:03 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 07:47:02 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-elementpath: upgrade 4.1.0 -> 4.1.1
Date: Mon, 17 Apr 2023 14:46:32 +0800
Message-ID: <1681713993-18603-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681713993-18603-1-git-send-email-wangmy@fujitsu.com>
References: <1681713993-18603-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 06:47:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180129

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
 Simplify type annotations for XSD datatypes
 Full test coverage of sequence type functions with bugfixes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-elementpath_4.1.0.bb => python3-elementpath_4.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_4.1.0.bb => python3-elementpath_4.1.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_4.1.0.bb b/meta-python/recipes-devtools/python/python3-elementpath_4.1.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-elementpath_4.1.0.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_4.1.1.bb
index 5b8560782..c5f96f2de 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_4.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
 
-SRC_URI[sha256sum] = "dbd7eba3cf0b3b4934f627ba24851a3e0798ef2bc9104555a4cd831f2e6e8e14"
+SRC_URI[sha256sum] = "cd2bff3de8cddf8a480f728e648c6cae47d8ab66696c7d830a7a84536d8cae58"
 
 PYPI_PACKAGE = "elementpath"
 inherit pypi setuptools3
-- 
2.34.1


