Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEEF6C6FA9E
	for <webhook@archiver.kernel.org>; Sun,  5 Mar 2023 08:07:15 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.5247.1678003626839204429
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Mar 2023 00:07:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=h1Rj8Qhc;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678003624; i=@fujitsu.com;
	bh=U278LzQRwAIxnFMQqr5/iZQA60GK1p6+IUBQOXOy0qk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=h1Rj8Qhc4i6Diz8wL8RHpVYLesbpaeomlocCuAnFSUsv6KY1M1XlcwunjF/rHNh2V
	 n1SGn4qN+eU0V7VJUR+SabPg/ccea3SPDIWSX5jHLvz7XPnvE0kL1hm/V7c6k5WygC
	 M221T+04CE/N6mB+ayfeA2XBF6LrZumX4KsrOtxqU1+DSMrXMqD3pwFT3Ni2DptSTa
	 ka8r3v4KhYiKeMxqnIKQ7u9utEUzTPgUJH4n4Y4/OcXQvRs6vJOQteZvrkXI3s0TFQ
	 yG8B7azfL4Jx8QN1yxOR3FV0V40chPgBnL1FakrAIjpfWwqyLjM5ZoG2ZoSkIPEixJ
	 azScnhm7YWGEA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpLvClyX
  F4P9sfos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePHhNCCpVwVF2ZeZ2xg3MTZxcjFISTwgFHi
  /LlJ7BDOFSaJuV8uM0M4exglNu9YwNLFyMnBJiAlceP+f7YuRg4OEQE9iav/REHCzAIqEi9+9
  7CD2MIC7hIt8+Yzg9gsQPFzJz+wgdi8Ak4S649MBLMlBBQkpjx8D1bDKeAs0bfsL5gtBFRz+e
  E2qHpBiZMzn7BAzJeQOPjiBTNEr6LE7MvNLBB2pUTrh19QtprE1XObmCcwCs5C0j4LSfsCRqZ
  VjObFqUVlqUW6hgZ6SUWZ6RkluYmZOXqJVbqJeqmlunn5RSUZuoZ6ieXFeqnFxXrFlbnJOSl6
  eaklmxiBwZtSnDh/B+Plvr96hxglOZiURHkDfzGnCPEl5adUZiQWZ8QXleakFh9ilOHgUJLgf
  erGkiIkWJSanlqRlpkDjCSYtAQHj5II70NPoDRvcUFibnFmOkTqFKOilDjvMh+ghABIIqM0D6
  4NFr2XGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzOnkATeHJzCuBm/4KaDET0GKN0wwgi0s
  SEVJSDUzMs44+THr7wibq6a5lBcJ6Hrv/bTeot+vrYFpQffF+zrxd/21dy5ymxj/oi9qtKus3
  7W5flotlq5mV88e7K9+5hut/CJrCUrU0Ks1X+ppHiU2R01LB9/M4f0wsC+eSkZy4Ir16noLhD
  pn1j65952UXqryUmOBUlnKX+87MRqF9uhv4VL8yuyr6BnqWVXQ2Tfy7OSkvwM/ivVK+4I+Zu5
  bvNpjKEGfAbvW6IWye8lPf2vrUJfHWd/bueGvotojhkwijVK1X+XfHadMmFP3xjOKYd044o7I
  4O+OWvJ7/W7a6Ty8TC0SkV1rZH4qq9f9jG8f7+XSBYLnkgg0XzEvP2dc0MTYGcEom1WjWvtNU
  YinOSDTUYi4qTgQAFZ3K7FkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-728.messagelabs.com!1678003623!176781!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5963 invoked from network); 5 Mar 2023 08:07:04 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-21.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Mar 2023 08:07:04 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 9EEAC1B7
	for <openembedded-core@lists.openembedded.org>; Sun,  5 Mar 2023 08:07:03 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 934591AD
	for <openembedded-core@lists.openembedded.org>; Sun,  5 Mar 2023 08:07:03 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 5 Mar 2023 08:07:02 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-setuptools: upgrade 67.3.3 -> 67.4.0
Date: Sun, 5 Mar 2023 16:06:41 +0800
Message-ID: <1678003602-30550-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678003602-30550-1-git-send-email-wangmy@fujitsu.com>
References: <1678003602-30550-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Mar 2023 08:07:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178036

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* #3832: Update vendored "importlib-metadata" (to 6.0.0) and
  "importlib-resources" (to 5.10.2)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-setuptools_67.3.3.bb => python3-setuptools_67.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools_67.3.3.bb => python3-setuptools_67.4.0.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools_67.3.3.bb b/meta/recipes-devtools/python/python3-setuptools_67.4.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_67.3.3.bb
rename to meta/recipes-devtools/python/python3-setuptools_67.4.0.bb
index 053b671e2a..1a29d37a02 100644
--- a/meta/recipes-devtools/python/python3-setuptools_67.3.3.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_67.4.0.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "ed4e75fafe103c79b692f217158ba87edf38d31004b9dbc1913debb48793c828"
+SRC_URI[sha256sum] = "e5fd0a713141a4a105412233c63dc4e17ba0090c8e8334594ac790ec97792330"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.34.1


