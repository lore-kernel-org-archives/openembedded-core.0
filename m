Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF6D4C4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 06:59:18 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.8397.1667545148707574928
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 23:59:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NO3Fa/kW;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667545146; i=@fujitsu.com;
	bh=s5M+re9urHZHFk/pFWOBhTjn54di0knQJZ0kQliLqWk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=NO3Fa/kWpz3TrjRDNUiohAuzF5YZfMzZscN2Oxm6YgmwV4lqXfFJlHYynPrIy/l20
	 QyXNjhzJ6cpl3Sstfz2t8yYcf0dONA9qHXWd/o/upvRvwO60Ji0qPVI2Wzs5d+UQm9
	 ilGVLkcvj4mFY96s/+J8CgPg8CWJpZXp7V+eDIgPYXtKZydsLEfuPkYpm+v5Pkpz4n
	 4B9ejN0deYcRsK3BFM8s9qlFRRXGMWokQD04ctbBQD3nH1TsZRG8TBjjTru05tyoop
	 Qp5HPlviWMIu4HgVReWnc81nII8ns05Jyz1a2J1v0YOKf3NffL0ekrtbreT4zJ4vv7
	 Ws1eRiehK60Zw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRWlGSWpSXmKPExsViZ8ORpGu1IyX
  ZYHe3oMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnHuzQamgrOcFV37NzE2MP7g6GLk4hASeMAo
  cWTTNFYI5zKTxOF3h9i6GDmBnP2MEkv2SYHYbAIKEgu3ngEq4uAQEdCTuPpPFCQsLOAtcfrFO
  0YQm0VARWLG1zPsIDavgLtEU8cKsDESQK1THr5nhogLSpyc+YQFxGYWkJA4+OIFM8hICQFFid
  nT5SHKKyRmzWpjgrDVJK6e28Q8gZFvFpLuWUi6FzAyrWI0K04tKkst0jXWSyrKTM8oyU3MzNF
  LrNJN1Est1c3LLyrJ0DXUSywv1kstLtYrrsxNzknRy0st2cQIDLiU4vT1OxjfLf2jd4hRkoNJ
  SZS3jjclWYgvKT+lMiOxOCO+qDQntfgQowwHh5IEb942oJxgUWp6akVaZg4w+GHSEhw8SiK8v
  +cBpXmLCxJzizPTIVKnGHU5Zn5tO8AsxJKXn5cqJc7rvB2oSACkKKM0D24ELBIvMcpKCfMyMj
  AwCPEUpBblZpagyr9iFOdgVBLmDQe5hCczrwRu0yugI5iAjthWnQRyREkiQkqqgWmVTEXL4Qv
  yMZXME1xbzu3M2Z4VIj/Hd4Mgu7Wgk2zw6yfyPx7fv+lkX3gr+awyd0ldRhRvINOUtbpJ4uvX
  2+afWnh67dS+uROangXMuzxZxNOFa7GrN8eFwOb5/BsTdolcXMXmdVv7cMLGyCRuNqfQBd3PD
  4tnO27f/69Y/i47U6DEdA3GPT07z/+60/Co9DmjQG/7hhPn+vnL9v5rtOFw7zAR3nvuhMuzTZ
  XHX3G8dL7j2NKcev1HvO+3fPl3i9zv3ll88aVTRIzZjfZApgNvX73JC3Hc9maj1I+tfVE1xrv
  yhKfdZX2oc2jTNU7Wg/o+fJP41zxeqiinH8VXKl9UFu2yucAo1ODDBcZ+ZiWW4oxEQy3mouJE
  ALihS6M/AwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-732.messagelabs.com!1667545145!34444!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11176 invoked from network); 4 Nov 2022 06:59:06 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-3.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Nov 2022 06:59:06 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id BF5591B7
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Nov 2022 06:59:05 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id B48271AD
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Nov 2022 06:59:05 +0000 (GMT)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 4 Nov 2022 06:59:04 +0000
From: <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] python3-sphinx-rtd-theme: upgrade 1.0.0 -> 1.1.0
Date: Fri, 4 Nov 2022 14:58:56 +0800
Message-ID: <1667545136-2541-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 06:59:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172700

Changelog:
https://sphinx-rtd-theme.readthedocs.io/en/stable/changelog.html

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...inx-rtd-theme_1.0.0.bb => python3-sphinx-rtd-theme_1.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx-rtd-theme_1.0.0.bb => python3-sphinx-rtd-theme_1.1.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.0.0.bb b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.1.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.0.0.bb
rename to meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.1.0.bb
index df34e11bb7..a4c882eab0 100644
--- a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.0.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.1.0.bb
@@ -10,7 +10,7 @@ DEPENDS = "python3-sphinx"
 
 PYPI_PACKAGE = "sphinx_rtd_theme"
 
-SRC_URI[sha256sum] = "eec6d497e4c2195fa0e8b2016b337532b8a699a68bcb22a512870e16925c6a5c"
+SRC_URI[sha256sum] = "6e20f00f62b2c05434a33c5116bc3348a41ca94af03d3d7d1714c63457073bb3"
 UPSTREAM_CHECK_REGEX ?= "/sphinx-rtd-theme/(?P<pver>(\d+[\.\-_]*)+)/"
 
 inherit setuptools3 pypi
-- 
2.25.1


