Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1940C4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 10:35:05 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.6817.1646735703463962373
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 02:35:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RcRMRtKf;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646735701; i=@fujitsu.com;
	bh=P5mE82pKqjz7KYAeGzVNow0/DClF6rPWfBIioL2zTvU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=RcRMRtKf5vcaCAftl2KWPlyRNHA4LI2chitD+y0xCMfYzWi9H8cSv0qDGnqNu6a5P
	 9gJ+LpGCiHd0icBbIY0quMJuINzUmR+VWE982hP++2HIYPcjUttswblVXZSmfH/CJD
	 HGcgbSeIZ1F/LLovjefNVcWVZihtZ5VqIy8skJj6CRiRr0u3hUW41HRE8CcDgYh9pW
	 vOveIppO7RbwLfb9/PJ2ntJk7KtdG6AxiriSAoy8M41iqBTDd69CBxyaVNQMQysgvD
	 JLdf2Xsda+IoAjcw+BVZUP6uBpoALtYeLGedEgArMd3EUobfX8gwaiRttrsy8w04NJ
	 rC/6uQGacdHyw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8ORqBtqqJ5
  ksKdRxOLOz3fsDowe5zauYAxgjGLNzEvKr0hgzZi1S6FgGk/FjJM/mRsYW7i7GLk4hAQeM0q0
  T1zNCOGcZ5LYufM0C4RznFGic8Ympi5GTg42ATWJ6bdusHYxcnCICOhJXP0nChJmFlCRePG7h
  x3EFhZwkdj3ZhuYzQIU//hjNhuIzSvgJLHx63JmEFtCQEFiysP3YDangLPE9b8rGEFGCgHVrH
  0WClEuKHFy5hMWiPESEgdfvIBqVZSYfbmZBcKukJg1q40JwlaTuHpuE/MERsFZSNpnIWlfwMi
  0itEuqSgzPaMkNzEzR9fQwEDX0NBU19xQ19DYWC+xSjdRL7VUNzk1r6QoESitl1herJdaXKxX
  XJmbnJOil5dasokRGMgpxe6tOxgv9/3UO8QoycGkJMpbz6aeJMSXlJ9SmZFYnBFfVJqTWnyIU
  YaDQ0mCd48+UE6wKDU9tSItMwcYVTBpCQ4eJRHeUi2gNG9xQWJucWY6ROoUoy7HtveX9jILse
  Tl56VKifOuAZkhAFKUUZoHNwIW4ZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfO+BpnCk5l
  XArfpFdARTEBH2BmpgRxRkoiQkmpguvCAoT+4m8fgwY692c+qDq4P8Fz5NqB3hYZgZ7VAZ9z8
  spz1UYy/HLPvFXy4dGtOQX9fVMc83jzWpJVL/HMf7+Xq/L7R4XDu6VDDG49Ny5vmBnof4vd3l
  fT9IpG/8PyBi5pHf8fwCx7O1nhvyPfxMycrQ1HHNVul0JWW329/bH68Mtf39fp/j4/PanO8uq
  pyuqISS9ChhmmB5c6zTijtY1jpb5H6zbd63r3C6l+H/AIPP52gkLrxwpFddyPyjSZ/3zM/0Sx
  q83T5k39/TTr+8MU1YZVWOS0V793S7HY6LZ1n3FfEbw0JZ+yqaC36HTL3QaF5x82pryqMjQ9c
  qCvZHrXriIrssQkJT/Rcz0nLK7EUZyQaajEXFScCAKAjb05rAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-26.tower-545.messagelabs.com!1646735701!3576!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23243 invoked from network); 8 Mar 2022 10:35:01 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-26.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Mar 2022 10:35:01 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 8AE0F10018F
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Mar 2022 10:35:00 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 5180E100195
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Mar 2022 10:35:00 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 8 Mar 2022 10:34:52 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pycairo: upgrade 1.20.1 -> 1.21.0
Date: Tue, 8 Mar 2022 18:34:35 +0800
Message-ID: <1646735675-58918-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646735675-58918-1-git-send-email-wangmy@fujitsu.com>
References: <1646735675-58918-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 10:35:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162898

Changelog:
=========
* Require Python 3.7+ :pr:'250'
* Require meson 0.53+
* Using 'setup.py' directly to build/install pycairo is deprecated.
  Use meson instead.
* 'setup.py' now requires setuptools. Previously it was optional.
* The complete API reference is now included in the typing stubs,
  so it can be consumed/shown by IDEs. :pr:'236' :pr:'252'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pycairo_1.20.1.bb => python3-pycairo_1.21.0.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pycairo_1.20.1.bb => python3-pycairo_1.21.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.20.1.bb b/meta/recipes-devtools/python/python3-pycairo_1.21.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-pycairo_1.20.1.bb
rename to meta/recipes-devtools/python/python3-pycairo_1.21.0.bb
index 5c236d40a3..29452c7660 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.20.1.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.21.0.bb
@@ -13,8 +13,7 @@ DEPENDS = "cairo python3"
 SRC_URI = "https://github.com/pygobject/pycairo/releases/download/v${PV}/pycairo-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "https://github.com/pygobject/pycairo/releases/"
 
-SRC_URI[md5sum] = "fa88a28cadbfb34192fe743d32c0ee33"
-SRC_URI[sha256sum] = "1ee72b035b21a475e1ed648e26541b04e5d7e753d75ca79de8c583b25785531b"
+SRC_URI[sha256sum] = "251907f18a552df938aa3386657ff4b5a4937dde70e11aa042bc297957f4b74b"
 
 S = "${WORKDIR}/pycairo-${PV}"
 
-- 
2.25.1


