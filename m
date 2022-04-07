Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA13C4707F
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:14 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web08.3527.1649312349840943800
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 23:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=w/3hcCr/;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649312348; i=@fujitsu.com;
	bh=ReMfJcAJDVP7IHPtNYuCzkYICJNlAZbf5INC5ZGyA50=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=w/3hcCr/lQCZwcrmaPa/L8cJk7sFqQG5YceKFGrhu3DTyyT1FqAWcZe9Up3W3z5H5
	 PT3CInnsRk1QKwhioS2zhUDLgneesMHBvBzBo1DRR4jwJbwujXuGAQVmf1yVE+ZtCi
	 CWYQ9y4ITsOQ30RpBYTJtHdpCS0Voo3o6FGMp7wVu0kazcUafgYOs8o74jgVTEkBSm
	 BY95xrkfKaxny/Keqaxrr2llgq/X+rJStuKESMgSA/a0CotjAqLV+unlglZGXDm/Ko
	 /RjQKz/d3kmRghBMQCJCW1urSn8OS5odLSLB8cLys6XsdpRgGj6M1y6ygQG2PSk47/
	 HwjxgUF4EnK/A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8MxSTe6yS/
  J4EC/isWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnHh2UKWgofcFfOWHWFsYDzD1cXIxSEk8JhR
  4vHzG6wQznkmif79i6CcE4wSR27uYe9i5ORgE1CXeHzzNWMXIweHiICexNV/oiBhZgFVie6La
  8BKhAX0JTZu+MEIYrMIqEhsPvKIBcTmFXCXWHrgLROILSGgIDHl4XtmEJtTwENixu8msF4hoJ
  o193vYIOoFJU7OfMICMV9C4uCLF8wQvUoSJ1Z8hJpTIfH68CWouJrE1XObmCcwCs5C0j4LSfs
  CRqZVjFZJRZnpGSW5iZk5uoYGBrqGhqa6prpGpqZ6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrF
  lbnJOSl6eaklmxiBQZxSzPp/B2N330+9Q4ySHExKorysdX5JQnxJ+SmVGYnFGfFFpTmpxYcYZ
  Tg4lCR4DzUA5QSLUtNTK9Iyc4ARBZOW4OBREuFVBknzFhck5hZnpkOkTjEqSonzfgNJCIAkMk
  rz4NpgUXyJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvHpApPJl5JXDTXwEtZgJaXHfQF2R
  xSSJCSqqBadfXiS/5/069tXz3E2s7v4RPu7gfCP4SrZm84sS9bR1b7duNJs+dNMWg4Xj9GZ3k
  CEU25fTLVrnN/2X4F5w+t3cy173v89L3iMfdKHTOdfrxc4Vy86S/xusN62xcTc6JH1648Ledd
  ZnojrICK/aep1qfUz2f2P/Y+c1aJTRe1qZBVmPpxsLCvzu6u9ilZSSqmptilL31d2jxHv8952
  aM45qunkd/G8VOHd7esEFvadLhPRNuvSyonPvj+1+PSuVr19WNWHb9zb2VWLb3cuH+c9lzbpe
  36NiWnZzndu7Oy2+mKcrXnp0MvmG5yJPlj/6v5fa9s+ce1W1dyaITardLJNK7hum6+ppfJuvY
  t/G/fKHEUpyRaKjFXFScCAD1E/aCXQMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-587.messagelabs.com!1649312347!91621!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5168 invoked from network); 7 Apr 2022 06:19:07 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-11.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Apr 2022 06:19:07 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D8A20100472
	for <openembedded-core@lists.openembedded.org>;
 Thu,  7 Apr 2022 07:19:06 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id C38D1100467
	for <openembedded-core@lists.openembedded.org>;
 Thu,  7 Apr 2022 07:19:06 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 7 Apr 2022 07:18:52 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: python3-sphinx: upgrade 4.4.0 -> 4.5.0
Date: Thu, 7 Apr 2022 14:19:15 +0800
Message-ID: <1649312356-25963-4-git-send-email-xuhuan.fnst@fujitsu.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/164101

From: Xu Huan <xuhuan.fnst@fujitsu.com>

License-Update:
- The following description added to "License for Sphinx":
  # +Unless otherwise indicated, all code in the Sphinx project is licenced under the
  # +two clause BSD licence below.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-sphinx_4.4.0.bb => python3-sphinx_4.5.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-sphinx_4.4.0.bb => python3-sphinx_4.5.0.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_4.4.0.bb b/meta/recipes-devtools/python/python3-sphinx_4.5.0.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-sphinx_4.4.0.bb
rename to meta/recipes-devtools/python/python3-sphinx_4.5.0.bb
index 97ec2619cb..f4d27f3275 100644
--- a/meta/recipes-devtools/python/python3-sphinx_4.4.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_4.5.0.bb
@@ -2,11 +2,11 @@ DESCRIPTION = "Python documentation generator"
 HOMEPAGE = "http://sphinx-doc.org/"
 SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & MIT & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=de4349dda741c550eb8b20f6b92f38d7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=72c536e78c21c567311b193fe00cd253"
 
 PYPI_PACKAGE = "Sphinx"
 
-SRC_URI[sha256sum] = "6caad9786055cb1fa22b4a365c1775816b876f91966481765d7d50e9f0dd35cc"
+SRC_URI[sha256sum] = "7bf8ca9637a4ee15af412d1a1d9689fec70523a68ca9bb9127c2f3eeb344e2e6"
 
 inherit setuptools3 pypi
 
-- 
2.25.1


