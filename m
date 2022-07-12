Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2614C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 07:48:47 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web11.6306.1657612114964251466
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 00:48:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oVuk+S2o;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657612113; i=@fujitsu.com;
	bh=UED/7ju4NbQYDZ0n+nhlVlIHU1+Uc+DbACxc7aeuBls=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=oVuk+S2oHd9Ug564ytPBXSV0qqMHh24Cjeu/y/t0NS97sgtvEdxjlWqhnOK7GVjSN
	 32SOOv4cub3J8VPIp6NEb+qilO1EU2yFN73E58yWndag3ZwGDz2snGqKf1sbc8hWP0
	 TfeqV1yp9/Vk58+BryHl9c0FMUde60CIiwalMYXzuey9z7sQjxZJUP9lPhw8BoyQK3
	 eaXhTZ/tSlp/9e5aQfJgLEyPY1Ip92h48HUQAqm34+q0N6uPhPbS8NpCEsG27Q0yko
	 VQ+DvKhzOBspAqbvD36FedbAJBpFIpRVw7ihFqhgqzIlK8uuKBRq7wFKXy0wqEzIHN
	 tX1hO0Bdu25AQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORqBugfjb
  J4GerqcWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmtG0ZjdrwVfuiv19SQ2MF7i6GLk4hAQeM0r8
  3XeTtYuRE8i5xiRxaSMbRGIPo8SXiQ3sIAk2ATWJ6bduABVxcIgI6Elc/ScKEmYWUJF48bsHr
  ERYwFWi5dELdpASFgFViZnT6kBMXgEnial9aiAVEgIKElMevmcGsTkFnCWWz+lmBCkRAirZvF
  MGJMwrIChxcuYTFojhEhIHX7xghmhVlJh9uZkFwq6QmDFjGxuErSZx9dwm5gmMgrOQtM9C0r6
  AkWkVo2VSUWZ6RkluYmaOrqGBga6hoamusa6FmV5ilW6iXmqpbnlqcYmuoV5iebFeanGxXnFl
  bnJOil5easkmRmDgphQzh+1g/NP7U+8QoyQHk5Iob5702SQhvqT8lMqMxOKM+KLSnNTiQ4wyH
  BxKErw2KkA5waLU9NSKtMwcYBTBpCU4eJREeE2UgdK8xQWJucWZ6RCpU4yKUuK8AqpACQGQRE
  ZpHlwbLHIvMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmnQYyhSczrwRu+iugxUxAi+Uiz4A
  sLklESEk1MK29K3xzfny0PffTg6KODzYmv1xX3Fxee4CtmSP1jmrsr2jrMvHp3Qu2TZb9JOwX
  HshYt8VNeg7DqbKNUrOK3zhWFkobn2kN3Xmgfvfhy61njZgma1VeerBPzzfwldjdhc3R7+583
  x125G/jjz7eiHuNR5aXiHD9ZHhy56z9Fq3rWVbJFtHVXZ67nzY3Vv9Oabqh2VbtcWRe5zWXZ+
  +ErjtYSd+LOzmzOV1rq/WHXd+XLGvbw5Joymmknyx7rDRmTuX1ufmx9Zd9WP7XuSu97tHyLnj
  zfqHgCzP9ty9mzFnb+VqsN+5d4O8NCf//6xpGuC1endW+bEG6uHjJ7dvPHTdYRN/xWKsUMivF
  ePZ3USWW4oxEQy3mouJEAETThttXAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-585.messagelabs.com!1657612112!89794!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31729 invoked from network); 12 Jul 2022 07:48:32 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Jul 2022 07:48:32 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 779D910018D
	for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 08:48:32 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 6B793100043
	for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 08:48:32 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 12 Jul 2022 08:48:30 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-urllib3: upgrade 1.26.9 -> 1.26.10
Date: Tue, 12 Jul 2022 15:48:07 +0800
Message-ID: <1657612088-30882-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657612088-30882-1-git-send-email-wangmy@fujitsu.com>
References: <1657612088-30882-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 07:48:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167907

Add dependence python3-logging.

Changelog:
=========
* Removed support for Python 3.5
* Fixed an issue where a "ProxyError" recommending configuring the proxy as HTTP
  instead of HTTPS could appear even when an HTTPS proxy wasn't configured.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-urllib3_1.26.9.bb => python3-urllib3_1.26.10.bb}  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_1.26.9.bb => python3-urllib3_1.26.10.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_1.26.9.bb b/meta/recipes-devtools/python/python3-urllib3_1.26.10.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-urllib3_1.26.9.bb
rename to meta/recipes-devtools/python/python3-urllib3_1.26.10.bb
index 95ae4a54a4..a8e2073d71 100644
--- a/meta/recipes-devtools/python/python3-urllib3_1.26.9.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_1.26.10.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
 
-SRC_URI[sha256sum] = "aabaf16477806a5e1dd19aa41f8c2b7950dd3c746362d7e3223dbe6de6ac448e"
+SRC_URI[sha256sum] = "879ba4d1e89654d9769ce13121e0f94310ea32e8d2f8cf587b77c08bbcdb30d6"
 
 inherit pypi setuptools3
 
@@ -15,6 +15,7 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-netclient \
     ${PYTHON_PN}-pyopenssl \
     ${PYTHON_PN}-threading \
+    ${PYTHON_PN}-logging \
 "
 
 CVE_PRODUCT = "urllib3"
-- 
2.25.1


