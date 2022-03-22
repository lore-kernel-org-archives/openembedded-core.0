Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F271C4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 10:38:29 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.8282.1647945507741616951
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 03:38:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NHFhX2el;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647945505; i=@fujitsu.com;
	bh=onJGak05GQyQe29kkaFF/wAzRrGZwcpHm22CPObMNmw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=NHFhX2elmy2TkbRyxM+LigHjk3IJWbR7sZ7mEUoFa1B7xk0EoB1TVNC/PNV/0Hb62
	 G5mg8FWtwe6dX18Z82sCaAPdRw3jpSm4G+mND/OS4zoqRmB/qItKjTFpgqup9Jg7//
	 qdxNpgbPxPhuH/HH2xWNZwC+PnC1JVfl+va+bbXjbNaXiYX4qtOTz9nQl9QokJnYXW
	 WNQmSMWFfY6a0h5aBtZWpMwRANh4CA2/y+kqK3Ps7Wk6HOt73X/GkC0BG/54TTsPk8
	 /2JZpnF6zb/J+LnLin37vjZCbpuWw1gBqT2QRWfe2gCT4WK728IBX0oTQqSL3LQcNm
	 1zsmzh892ogKg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8MRoqu43DL
  J4OACCYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePa6bmsBU28FQ/7fjA2MO7m7mLk4hASmMEk
  seb4ZpYuRk4gZw+jxI0JZiA2m4CaxPRbN1i7GDk4RAT0JK7+EwUJMwuoSLz43cMOYgsLOEs8+
  7iaFcRmEVCV6P8ykRHE5hVwlPh1fhkbiC0hoCAx5eF7ZpAxnAJOElNO5UNscpTon3GBDaJcUO
  LkzCcsEOMlJA6+eMEM0aooMftyMwuEXSExa1Yb0wRG/llIWmYhaVnAyLSK0TapKDM9oyQ3MTN
  H19DAQNfQ0FTXzFLX3EQvsUo3US+1VDc5Na+kKBEoq5dYXqyXWlysV1yZm5yTopeXWrKJERiU
  KcWuXjsYj/T91DvEKMnBpCTK+6bVMkmILyk/pTIjsTgjvqg0J7X4EKMMB4eSBO/RxUA5waLU9
  NSKtMwcYITApCU4eJREeDO6gdK8xQWJucWZ6RCpU4yKUuK8T5cCJQRAEhmleXBtsKi8xCgrJc
  zLyMDAIMRTkFqUm1mCKv+KUZyDUUmYV2QZ0BSezLwSuOmvgBYzAS3WZzUDWVySiJCSamCyb9a
  7+mwt15wCw4S8+xNPLPpQZfVfhWn2mpxWd68pCZVCTa71B82iLlpV3jw9Wb/KaBHjTRH/Pb1d
  i1dUZ/Nuu+GSYrPP0f+fo5KEj//RD9f9kz6XCmZaleTnR7wM3y0+333eNp8df7jX8TnFf/872
  cwg/1K/V9DeVXUT9wjPX5bOa1N1mV8nPj/fbhf7Xs1zE7d47M58ln5WrEOk+C3LtCu6K72y+z
  ZGzJ939YDgesOfc498jt932mvOhAupValTWHT4Hn7/bx5fu+vsyq8B008xzzf/+iJ+wytzEa2
  584/uNWfe8akqL/lutp2t9aOej5abeRXP3Mv/6lx1cT1vSRP/t3SHj/cUV+m/kkpSYinOSDTU
  Yi4qTgQAUcp2YkUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-532.messagelabs.com!1647945505!109929!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13473 invoked from network); 22 Mar 2022 10:38:25 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-12.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Mar 2022 10:38:25 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 22MAcJ2s024007
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 10:38:24 GMT
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 22 Mar 2022 10:38:23 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libjitterentropy: upgrade 3.3.1 -> 3.4.0
Date: Tue, 22 Mar 2022 18:38:08 +0800
Message-ID: <1647945489-5242-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647945489-5242-1-git-send-email-wangmy@fujitsu.com>
References: <1647945489-5242-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 10:38:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163539

License-Update: year updated to 2022

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...opy_3.3.1.bb => libjitterentropy_3.4.0.bb} | 4 ++--
 1 file changed, 21 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libjitterentropy/{libjitterentropy_3.3.1.bb => libjitterentropy_3.4.0.bb} (58%)

diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.3.1.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.4.0.bb
similarity index 58%
rename from meta/recipes-support/libjitterentropy/libjitterentropy_3.3.1.bb
rename to meta/recipes-support/libjitterentropy/libjitterentropy_3.4.0.bb
index 38b48908a3..f80ed11cc1 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.3.1.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.4.0.bb
@@ -5,12 +5,12 @@ stamp. It is a small-scale, yet fast entropy source that is viable in almost \
 all environments and on a lot of CPU architectures."
 HOMEPAGE = "http://www.chronox.de/jent.html"
 LICENSE = "GPL-2.0-or-later | BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1c94a9d191202a5552f381a023551396 \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=64a87180908540620ce364b5e69b3b03 \
                     file://LICENSE.gplv2;md5=eb723b61539feef013de476e68b5c50a \
                     file://LICENSE.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
                     "
 SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git;branch=master;protocol=https"
-SRCREV = "887c9871ea110e397812ff7f3b28a6269f0a2ffc"
+SRCREV = "2e5019cfe63038faaa405ce53715effe4ea580e4"
 S = "${WORKDIR}/git"
 
 # remove at next version upgrade or when output changes
-- 
2.25.1


