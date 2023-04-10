Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA22BC77B6F
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 09:37:48 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.41089.1681119465067330640
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 02:37:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SHKyEUpS;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681119467; i=@fujitsu.com;
	bh=65wQgpl0gNefD5W0WW0iHOII8P2+J+CR4rmoTlDKjSQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=SHKyEUpSAJK86kpHc7z8+IxiqIMuA58gjQ0gCadkwa2PkIp4UbIMNGzD026d+axRh
	 W/H3oTIfg9Ki2fEdV37RZLGV51etYzi1qZvvXlUdtIEab0v+8A3TnEz97p4WqrnR4v
	 WPqfJqkc5EQn8NqUt588dW6iv/0GvuQK6IrX7J/dp8Q+6jVWCj2kBvwswEhpgc+BA4
	 ihNquLHxha0OtBH/aaZOcyiT+sYsgROt/xgpmqghuphA9gZhEbYF7CdcKeI4Lg+kQD
	 iAS2XQCGsDcxQWrO9sNs/p0zrupSGlQuh2V+Iklogy/jFOSGYvVnu9C+yp+4WfGvEy
	 DSrtde8LU/fOQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRWlGSWpSXmKPExsViZ8ORpPv6hnG
  KwaWDzBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bXptqCJt6K9y8fsDUwvuHuYuTkEBJ4wCjx
  4Fp1FyMXkH2ZSWLdprvMEM4eRomDV26yg1SxCUhJ3Lj/n62LkYNDREBP4uo/UZAws4CKxIvfP
  WAlwgK+Eksfr2IEKWERUJWYvjIWxOQVcJI4uoQfpEJCQEFiysP3zCA2p4CzRFdDIxvECU4SHQ
  dvMoHYvAKCEidnPmGBmC4hcfDFC2aIXkWJ2ZebWSDsConG6YeYIGw1iavnNjFPYBSchaR9FpL
  2BYxMqxhNi1OLylKLdI31kooy0zNKchMzc/QSq3QT9VJLdctTi0t0DfUSy4v1UouL9Yorc5Nz
  UvTyUks2MQJDNqWYuW8H49fev3qHGCU5mJREebu4jFOE+JLyUyozEosz4otKc1KLDzHKcHAoS
  fAyXAbKCRalpqdWpGXmAOMHJi3BwaMkwitxDSjNW1yQmFucmQ6ROsWoKCXOy3EeKCEAksgozY
  Nrg8XsJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvGcuAk3hycwrgZv+CmgxE9BiLhcDkMU
  liQgpqQam2TPe5s8/H/PWZ4Lgpb7f89ttXjmvE21+p/gogNfpRs0aJxuNj1O/HNE3m+AY/7Mm
  cYW6apdOxH0f1UbfnNB9WX18e9Q3Mi4setT/5s7TDV/eqWxxuRoirv7ha2vljl/XlrXtbki4f
  9Q3ZonpC2+r999UzbbpHVHapmgaOsnx3sbWZv7LF/++qfV45XDwvxkD20HmYENrgxZJhu2Whs
  bvZ+97XWuYZq/2cvvnr3eqjPiubDF54bDou1ckX5+H9vU7e1tFV1w8s1a6pX59Jkt75+O7f/c
  oKVa/ZRQvSy3l6XKskqvpri6vXcpq93Rb262PKhePf8hcqHHywNHPi95/XrZIzJVPcnsdz3YF
  6xBdJZbijERDLeai4kQAuxfp7FQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-591.messagelabs.com!1681119466!381818!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12974 invoked from network); 10 Apr 2023 09:37:47 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-6.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 09:37:47 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id A85F11C8
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:37:46 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 9CD6A1B8
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:37:46 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 10:37:44 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-importlib-metadata: upgrade 6.0.0 -> 6.2.0
Date: Mon, 10 Apr 2023 17:37:19 +0800
Message-ID: <1681119440-25219-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681119440-25219-1-git-send-email-wangmy@fujitsu.com>
References: <1681119440-25219-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179876

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- #384: PackageMetadata now stipulates an additional get method allowing for
  easy querying of metadata keys that may not be present.
- #428: packages_distributions now honors packages and modules with Python
  modules that not .py sources (e.g. .pyc, .so).
- #434: Expand protocol for PackageMetadata.get_all to match the upstream
  implementation of email.message.Message.get_all in python/typeshed#9620.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ib-metadata_6.0.0.bb => python3-importlib-metadata_6.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_6.0.0.bb => python3-importlib-metadata_6.2.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb
index b33a1b5858..b7bc91552e 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "e354bedeb60efa6affdcc8ae121b73544a7aa74156d047311948f6d711cd378d"
+SRC_URI[sha256sum] = "9127aad2f49d7203e7112098c12b92e4fd1061ccd18548cdfdc49171a8c073cc"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.34.1


