Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13453C3DA78
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 05:24:47 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.134753.1673760277371956098
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jan 2023 21:24:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Jx8CJ/wq;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673760275; i=@fujitsu.com;
	bh=vHeNIIDnQ9BXXwoOJ6KB9QTOO5Lvg2s4Da0r0DUcYTU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Jx8CJ/wq2mvRcyW6BIPTqcUG57riXfRDeJxnbXPGBAFudkLcPaj/gxLMLf/7J+iaL
	 JJvkLK6vqLBNB+NMP4S8+D1jZp/IxTHSycXDFQHcoTDCk70fKZz9dqwcfJek1hGjN9
	 labkUMFzZi4r9Vm/mSqK+7Mmm/57dL9VekYoajms0dH8XD6l5d6m0rMcPmpM3sI9W2
	 Saf9feELJ0xA4xUt9v5ltpsKDO+ipSccRdQia0MyhVYQjwVCXAoy13r5OC4RFa+O2Z
	 92mbB0AoUs3rWXMqS6yQL0gLdqfBuDFOnyP5rxXVf1CabdM0oJeDSR0CYwRqVPAo4w
	 o1OJAiCqWUmcQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORqCvUdzj
  Z4N16CYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePx/WtMBfe4K9bNX8XcwHiXq4uRi0NI4DGj
  RMvSNkYI5zqTxMbnM1ggnL2MEpO/zwfKcHKwCUhJ3Lj/n62LkYNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAr8Sy+T+YQWwWAVWJ7XtPM4HYvAKOEjP+3mEDsSUEFCSmPHwPVsMp4CTx9OhHRpCRQk
  A129vEIcoFJU7OfMICMV5C4uCLF8wQrYoSsy83s0DYlRKtH35B2WoSV89tYp7AKDgLSfssJO0
  LGJlWMZoWpxaVpRbpGuslFWWmZ5TkJmbm6CVW6SbqpZbqlqcWl+ga6iWWF+ulFhfrFVfmJuek
  6OWllmxiBAZuSjFb9Q7Gt0v/6B1ilORgUhLljfx2KFmILyk/pTIjsTgjvqg0J7X4EKMMB4eSB
  O+GxsPJQoJFqempFWmZOcAogklLcPAoifBqdwCleYsLEnOLM9MhUqcYFaXEeV/0ACUEQBIZpX
  lwbbDIvcQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmPcpyBSezLwSuOmvgBYzAS0OqT8Isrg
  kESEl1cC04RPLm8vMAlu26D4xyOxd0rZJpujUj89lf04ECG2yt5S6oyH96G6S62Lb6FtHRF7y
  nzf99EZOgDH8gvpT3aL3jF7ttu63dxso3bI9qNjN0538QEV+2rVXQS3fumdf3iw7q3ZhxOStN
  1dfm28/c8p8tzNaJzZPOntW9RQP1/HlG7b/Xi3iFyE18VJ4ixEX05203fNvybSeO/1v75m7SU
  /6dqbGrFXQPWRa5N8r0LlkdcSr289iP94W3Xd82q+8temac2TDLn3VzPj952ejiGS5dqDG0wO
  2e7n82oXy9FpFOkojbm8RTJPMSTvt/Z6v8aec5XGzM/N/vt7a9c1zBv+kCUdXPZIRCzm4NDY1
  WcSEVYmlOCPRUIu5qDgRAEcNu/tXAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-591.messagelabs.com!1673760274!232515!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16271 invoked from network); 15 Jan 2023 05:24:34 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Jan 2023 05:24:34 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 0C747100182
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:24:34 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id F3EAD100043
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:24:33 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 15 Jan 2023 05:24:32 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-importlib-metadata: upgrade 5.2.0 -> 6.0.0
Date: Sun, 15 Jan 2023 13:24:10 +0800
Message-ID: <1673760250-2563-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673760250-2563-1-git-send-email-wangmy@fujitsu.com>
References: <1673760250-2563-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:24:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175876

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* #419: Declared "Distribution" as an abstract class, enforcing
  definition of abstract methods in instantiated subclasses. It's no
  longer possible to instantiate a "Distribution" or any subclasses
  unless they define the abstract methods.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ib-metadata_5.2.0.bb => python3-importlib-metadata_6.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_5.2.0.bb => python3-importlib-metadata_6.0.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_5.2.0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_5.2.0.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb
index 893c63d7e5..b33a1b5858 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_5.2.0.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "404d48d62bba0b7a77ff9d405efd91501bef2e67ff4ace0bed40a0cf28c3c7cd"
+SRC_URI[sha256sum] = "e354bedeb60efa6affdcc8ae121b73544a7aa74156d047311948f6d711cd378d"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.25.1


