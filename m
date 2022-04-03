Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A4FC38A05
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:19 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web12.7532.1649245786679798382
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 04:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wASeBpsW;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649245785; i=@fujitsu.com;
	bh=4+nhgyC9OlEPDJ8w+O9eM1wb0qm4X0zp/lMkEZncSbU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=wASeBpsWePebuRqtjQkasjZJrrajHP4M2hG1pRImQGL/OY0Vxm9kKxZ2AGJ+QanN7
	 RkqUYMpmzKzMJtf5W4BsPZBUboSy2BpHmrkMRTlRdc4d7VjqnmTNyUXYBgs4VTGQuP
	 PojkiE4RKjgT+7268CAkuXBftJysn7vmsyqpPaWvaCGMcV0w7k6ZtXi0STr4nAwQaS
	 P/6PDXCjDe6xCBfPmWSAqH518hcX4b9PWWqj0LbZa4gNH/mmjraOHQB9MnhNZKvZ95
	 rWupT0p1UU6/bIOUYLOGiMTbCwk41i7JCWVjOXGM0SrkHLjwOfwO0c2jdsdNUyto94
	 yLWFLWny9a3qA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRWlGSWpSXmKPExsViZ8MxSTeizjf
  J4N9nXYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPttensBde5Kt7c/M/cwHiKs4uRi0NI4DGj
  xILDz1ggnPNMEmsv7WSGcHYzSjzqX8/excjJwSagJjH91g3WLkYODhEBPYmr/0RBwswCKhIvf
  veAlQgLWEs8+3uLBcRmAYr/ePafEcTmFXCS2HDgC5gtIaAgMeXhe2YQm1PAWeLohBNMILYQUE
  3jhOlMEPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZebWSDsColZs9qYIGw1iavnNjFPYBSchaR9FpL
  2BYxMqxjtkooy0zNKchMzc3QNDQx0DQ1Ndc1MdQ0tjPQSq3QT9VJLdZNT80qKEoHSeonlxXqp
  xcV6xZW5yTkpenmpJZsYgcGcUuy4bQfjqb6feocYJTmYlER595f7JgnxJeWnVGYkFmfEF5Xmp
  BYfYpTh4FCS4N1SBZQTLEpNT61Iy8wBRhZMWoKDR0mEV6sGKM1bXJCYW5yZDpE6xagoJc77Ei
  QhAJLIKM2Da4NF8yVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrxeIFN4MvNK4Ka/AlrMBLT
  43RlPkMUliQgpqQYmj1XvHyZ+9muqfLXrbnLamZlT/rXeDz7hMOe5X8VVy8f127YYViUvPCX3
  deWPMn89Z6MHIn4++guNN2jIJmQo3dS4eNMtSzvVZ8ejw2XlR1c8uCM9X3ib3rHSH1ckZ0wu6
  g2dIfmKZ/ft0o2R9h9vGjX0ys2eVr38zJzvdkXm10MvnDNheMwaq8muypnYKjF3zZ/WznKxzy
  cMemM1a8VVth50t//ae+BHpc2q40lz2/wtrD8s8dLSem1xz+nx1aQXmw4t93t1K9pVM8r8ZEG
  ONN/C3KDw8vayv+v1OaY1H13eOsn9wQGGH7NbzX6z2276aSn//dL9uO0J+ocvK7/4+Vfz8dTS
  iV+ORG5ty+fTV2Ipzkg01GIuKk4EALWvnT9hAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-528.messagelabs.com!1649245784!30044!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22227 invoked from network); 6 Apr 2022 11:49:44 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-2.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Apr 2022 11:49:44 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 4D568100463
	for <openembedded-core@lists.openembedded.org>;
 Wed,  6 Apr 2022 12:49:44 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 406E1100460
	for <openembedded-core@lists.openembedded.org>;
 Wed,  6 Apr 2022 12:49:44 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 6 Apr 2022 12:49:26 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libbsd: upgrade 0.11.5 -> 0.11.6
Date: Mon, 4 Apr 2022 02:45:40 +0800
Message-ID: <1649011540-28857-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649011540-28857-1-git-send-email-wangmy@fujitsu.com>
References: <1649011540-28857-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Apr 2022 16:33:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164072

License-Update:
    year updated to 2022
    license file changed

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libbsd/{libbsd_0.11.5.bb => libbsd_0.11.6.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libbsd/{libbsd_0.11.5.bb => libbsd_0.11.6.bb} (90%)

diff --git a/meta/recipes-support/libbsd/libbsd_0.11.5.bb b/meta/recipes-support/libbsd/libbsd_0.11.6.bb
similarity index 90%
rename from meta/recipes-support/libbsd/libbsd_0.11.5.bb
rename to meta/recipes-support/libbsd/libbsd_0.11.6.bb
index bb8766a070..74fc8ef4e5 100644
--- a/meta/recipes-support/libbsd/libbsd_0.11.5.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.11.6.bb
@@ -29,12 +29,12 @@ HOMEPAGE = "https://libbsd.freedesktop.org/wiki/"
 # License: public-domain-Colin-Plumb
 LICENSE = "BSD-3-Clause & BSD-4-Clause & ISC & PD"
 LICENSE:${PN} = "BSD-3-Clause & ISC & PD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0b31944ca2c1075410a30f0c17379d3b"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c2c635b94c8dcd3593f53e10fa8a499e"
 SECTION = "libs"
 
 SRC_URI = "https://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "1a9c952525635c1bb6770cb22e969b938d8e6a9d7912362b98ee8370599b0efd"
+SRC_URI[sha256sum] = "19b38f3172eaf693e6e1c68714636190c7e48851e45224d720b3b5bc0499b5df"
 
 inherit autotools pkgconfig
 
-- 
2.25.1


