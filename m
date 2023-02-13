Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BBC3C6379F
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 02:41:05 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.5706.1676256060929649935
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 18:41:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ZQ6NLGxw;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676256059; i=@fujitsu.com;
	bh=SyTMzC9dq3sXOlcGuBo6IQprcM3slf+8RS1bqXqH1xA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ZQ6NLGxwxfOtPpb2ljBCDtpWGpxPuV4WitmiUCaWx5aYmFPQI+pFtql5KMOd+iL76
	 Oz+Z17F+2+DfSb/akkcEG5EjVjj/ugrqzJyiy9K04BExv2m+Zet4bxFX6JS0wxOoOT
	 fMnJJjw88y7KzEFQ3mLqPAZBgMmDYgvL/V53qvAMukccGwtWQyr80JTCZwV+wxvyo1
	 inKSYrXv9amGACKce7dQFi4XPIDsUIHZZy+Woo47UJlZADcVs30uIBun1CV/Af2APF
	 ZsT7gMO+izFrshXMcCtV12KbTzl5O0CUWcGUUXlH+D6cRk5GvDwipvUC72Kh6JUCcC
	 WepMddJUQ6l/w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8MxSddq8ct
  kg/PHmCzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oxbB2axF/TzVixeN4+tgfE9dxcjJ4eQwGNG
  iV9XK7sYuYDs60wSs/f9YIFw9jJK9D++zQhSxSYgJXHj/n+2LkYODhEBPYmr/0RBwswCKhIvf
  vewg9jCAj4SC9e1sYHYLAKqEqumnmICsXkFnCT6WieAjZEQUJCY8vA9M4jNKeAssfXod2aII5
  wkug4sY4OoF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdKtH74BWWrSVw9t4l5AqPgLCTts5C
  0L2BkWsVoWpxaVJZapGuql1SUmZ5RkpuYmaOXWKWbqJdaqlueWlyia6iXWF6sl1pcrFdcmZuc
  k6KXl1qyiREYuCnFLGY7GNv7/uodYpTkYFIS5e3jeJksxJeUn1KZkVicEV9UmpNafIhRhoNDS
  YJXagFQTrAoNT21Ii0zBxhFMGkJDh4lEV6LCUBp3uKCxNzizHSI1ClGRSlxXv6FQAkBkERGaR
  5cGyxyLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5t09C2gKT2ZeCdz0V0CLmYAWP+YDW1y
  SiJCSamByry/M3hFn9/rr1OOBai+nVs5t/v7ZllMgoek968E31Z8DswxWrDrU/6C60kaB38HQ
  ffsdaSUOzfWF84SnZ18rW1X9cv2Z9Lnr0k9v5DxukB94+NyZr3MvaQUZimxucpivkNpXt+DHi
  mq2r9c/Bv7+a8TxaG6RGu+fptTG5/qh+qoqq4K37RTRdCzOl2r12v120bPfe3QEDX5qtYjcYq
  vl7156XFLih0vm/7DpsQ+v3eNnvfDJ+Sxz7WX1jI7M1reRdwP2h1TNWPj19RyZwxPORIpG9rW
  dKXNz0rML0nbefXyG0LYVD0rDuObvz1Tr8a84/kNz0r6vL2ON5issCjc/kLJvevxJ85V2dXcU
  ZVWUWIozEg21mIuKEwGpTsibVwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-587.messagelabs.com!1676256057!809632!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1048 invoked from network); 13 Feb 2023 02:40:58 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-23.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Feb 2023 02:40:58 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 9FB551000DC
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:40:57 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 93F241000D7
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:40:57 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 13 Feb 2023 02:40:56 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-sphinx-rtd-theme: upgrade 1.1.1 ->  1.2.0
Date: Mon, 13 Feb 2023 10:40:42 +0800
Message-ID: <1676256044-19550-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676256044-19550-1-git-send-email-wangmy@fujitsu.com>
References: <1676256044-19550-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:41:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177078

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 docutils 0.18 is supported. (#1381)
 Sphinx 6 support added
 Added sphinxcontrib-jquery as a dependency (#1385 #1421)
 Python 3.11 is officially supported and tested. (#1395)
 Python 3.4 and 3.5 are officially not supported (#1395)
 Automatically use sphinxcontrib-jquery in Sphinx 6+ (#1399)
 Use new context vars logo_url, favicon_url and root_doc when available (#1405)
 Translations updated: French, Hungarian, Croatian
 Translations added: Danish, Chinese (Taiwan)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...inx-rtd-theme_1.1.1.bb => python3-sphinx-rtd-theme_1.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx-rtd-theme_1.1.1.bb => python3-sphinx-rtd-theme_1.2.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.1.1.bb b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.1.1.bb
rename to meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.0.bb
index a8b2653ccd..0845646978 100644
--- a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.1.1.bb
+++ b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.0.bb
@@ -10,7 +10,7 @@ DEPENDS = "python3-sphinx"
 
 PYPI_PACKAGE = "sphinx_rtd_theme"
 
-SRC_URI[sha256sum] = "6146c845f1e1947b3c3dd4432c28998a1693ccc742b4f9ad7c63129f0757c103"
+SRC_URI[sha256sum] = "a0d8bd1a2ed52e0b338cbe19c4b2eef3c5e7a048769753dac6a9f059c7b641b8"
 UPSTREAM_CHECK_REGEX ?= "/sphinx-rtd-theme/(?P<pver>(\d+[\.\-_]*)+)/"
 
 inherit setuptools3 pypi
-- 
2.34.1


