Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4033C7618A
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 11:11:49 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.5086.1678878700838739257
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 04:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PyDAmZQt;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678878699; i=@fujitsu.com;
	bh=GdkcwFIdqzcyDObp+GF/9NJ4ntzF4NZjkfwe1Poa2a0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=PyDAmZQt76ZoUmPl4aAqzSsyxvwKrYlElIkq/ZROKc3MunIn29ijbt/u02exmKgMI
	 uEqi5BkzgIti4bRgt2+P1U/12L1TT5R5CZMBG0FUuqrle0xEWrwONHpQzln1eXWSku
	 rYZICPVMExCekgLTdeoT9vdxB9wYChUsqEitFAJe/EYpq78vzWSvOoM0trb4rfkSvv
	 dOL6Gm5P49orGYaw2jMW0a2LmXa4WRhL2vgk0p48jKHOO88lbAqQywzECTiGwRt+Nd
	 +TUaxvqP7aLELroJYqZo53i3oU7LccP8KGrQttNhDtUnPO7BGn70AIz4WqKfHBrybA
	 VJFlojNhgVAmA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORpPtquWC
  KwaqDxhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aaA5sYC2bzVLybupCpgbGVu4uRi0NI4AGj
  xKVVu5ghnMtMEguuT2eBcPYwSqx9fh3I4eRgE5CSuHH/P1sXIweHiICexNV/oiBhZgEViRe/e
  9hBwsIC7hJbXmuAhFkEVCW+zP7GBGLzCjhJLD6xlh3ElhBQkJjy8D0zSDmngLPExwWZIGEhoJ
  KXT/azQpQLSpyc+YQFYrqExMEXL5ghWhUlZl9uZoGwKyQapx9igrDVJK6e28Q8gVFwFpL2WUj
  aFzAyrWI0K04tKkst0jU00UsqykzPKMlNzMzRS6zSTdRLLdUtTy0u0TXSSywv1kstLtYrrsxN
  zknRy0st2cQIDNyUYpUXOxif9f3VO8QoycGkJMr7Z41AihBfUn5KZUZicUZ8UWlOavEhRhkOD
  iUJXr4lgilCgkWp6akVaZk5wCiCSUtw8CiJ8EbUA6V5iwsSc4sz0yFSpxgVpcR5TYGxJyQAks
  gozYNrg0XuJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvJeWAU3hycwrgZv+CmgxE9Bi3nk
  CIItLEhFSUg1MC5v/aaz/9M3A49vrxN9RFwSD9ppucz42PbF3r/JeScn20sP+VgUpqumntB8+
  45oVMkHTtWGxk1r8ze37Py9qf3Uoc7P40osFUwUfzBG+3bY9/8lmvmm/THTthd9wBd8Q/dXgE
  ecdWDjHWMD0v34/g5D0pHW9hffrXDiO9a6vW8IY+nFvj9c+576qr9/bVL9rHNj/0qf75Em+83
  XCfUKzt6SZbZCUMdl449ClGSX+z7LFwvxWKOen2iZ4e3po8X6psmxl6Tr3iUO55huvxjJhU+v
  dPd3FbQJtuQ0e/cbXFHTTP+458Xad3Enm/3oZmRxvskKYalVYt85t/Vj3Suq4KHu6T/zdaZr1
  X5qPT1RiKc5INNRiLipOBADHe+MBVwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-571.messagelabs.com!1678878698!148898!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15053 invoked from network); 15 Mar 2023 11:11:38 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-20.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2023 11:11:38 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 8ADA41AE
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 11:11:38 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 7FF691AD
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 11:11:38 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 15 Mar 2023 11:11:37 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-setuptools: upgrade 67.4.0 -> 67.6.0
Date: Wed, 15 Mar 2023 19:11:20 +0800
Message-ID: <1678878683-19486-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678878683-19486-1-git-send-email-wangmy@fujitsu.com>
References: <1678878683-19486-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 11:11:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178541

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
#3804: Added caching for supported wheel tags.
#3846: Added pruning heuristics to PackageFinder based on exclude.
#3843: Although pkg_resources has been discouraged for use, some projects still
consider pkg_resources viable for usage. This change makes it clear that
pkg_resources should not be used, emitting a DeprecationWarning when imported.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-setuptools_67.4.0.bb => python3-setuptools_67.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools_67.4.0.bb => python3-setuptools_67.6.0.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools_67.4.0.bb b/meta/recipes-devtools/python/python3-setuptools_67.6.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_67.4.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_67.6.0.bb
index 1a29d37a02..aa1d525c02 100644
--- a/meta/recipes-devtools/python/python3-setuptools_67.4.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_67.6.0.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "e5fd0a713141a4a105412233c63dc4e17ba0090c8e8334594ac790ec97792330"
+SRC_URI[sha256sum] = "2ee892cd5f29f3373097f5a814697e397cf3ce313616df0af11231e2ad118077"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.34.1


