Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C99AC77B76
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 06:57:01 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.47820.1681714618959137110
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Apr 2023 23:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oiRbMDXU;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681714617; i=@fujitsu.com;
	bh=ss3tKRznQw5ia36pdevhLJ9TWBiLdWzIAMm1Fth8UHo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=oiRbMDXUGET6k4IV3s7yWJHUBECPzV2GSYFFmuGam/f0PxTblMRuobZkvEL8XthVx
	 i7ff6ANJ9RgzZHnzKablsVI+Ug66JwrI9tJG4zlBk4xrO3TjIwBHvuF5w029Rk2v6s
	 JUx0Dh1WeaAwLSRHGZzs+J3DneuIxBOKXLSlYJgIU4KUA7RSC3NgY7ostK0wsvPi77
	 XQq7aUGg+OGlcOW0WEAEyUf7Y8oanDJwCZZSzvZU1N8NuRmwhgyrPhNFtOyHClDeMa
	 jChKVHj+UfwKpoq89fM/50t1HNvxTgQStK+6jpD2LWKYa17u8LKUKGAz+oHitiezO2
	 RniW6eUPuMbmA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8OxWXfHW5s
  Ug+X/VS3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oxLr9YwFnRzVfx69IqtgXEZZxcjF4eQwANG
  iV/7O9kgnCtMEtP3NLBDOHsZJb69aWfuYuTkYBOQkrhx/z9QFQeHiICexNV/oiBhZgEViRe/e
  9hBbGEBP4lt5xeDlbMIqEp8WXeGEcTmFXCSmPvhMQuILSGgIDHl4XuwGk4BZ4k9358xgdhCQD
  Utb6+yQ9QLSpyc+YQFYr6ExMEXL5ghehUlZl9uhppTKdH64ReUrSZx9dwm5gmMgrOQtM9C0r6
  AkWkVo1lxalFZapGuoYFeUlFmekZJbmJmjl5ilW6iXmqpbnlqcYmuoV5iebFeanGxXnFlbnJO
  il5easkmRmDwphQzJu9gvNr3V+8QoyQHk5Io74tU6xQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKE
  rwNr21ShASLUtNTK9Iyc4CRBJOW4OBREuE1fgaU5i0uSMwtzkyHSJ1iVJQS561/A5QQAElklO
  bBtcGi9xKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd5rL4Cm8GTmlcBNfwW0mAlosZwS2OK
  SRISUVANThHxnz0t+g6JXubcP8D/zYlmYHxf2KlVhUlejyRLWBdU3LG81Pt5kM3NtSuTefMmO
  tEe7qm+atAR4X3J++zhWKKHW+PMx9U/SKziunfnH8/ig1taDMinzWGTCP31vKFNZyyF8qPolw
  /Tiwxy5zy6fnx4o5NC+jOXPv0u17Nfdw4xVd/Qzptpz6It1XJD+IWlaoPLINvtf02Kriyq8Vb
  ZGzJuPtUyP0y/5b8fGudH++SaNr/1MOeLr3B7OlTy3aJaR8v/67CNT52juXJe+K5PPum7jrfK
  k/3cKVO9fl13oYZ+532i3/fUjGoe5rTrqpky+4KIp0jXX//Tie6/28256kvVz91VB71Rbnbcx
  Dy4rsRRnJBpqMRcVJwIAz0G9A1kDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-591.messagelabs.com!1681714616!445699!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24365 invoked from network); 17 Apr 2023 06:56:56 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-18.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 06:56:56 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 3989015E
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:56:56 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 2CA2815B
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:56:56 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 07:56:54 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-zeroconf: upgrade 0.55.0 -> 0.56.0
Date: Mon, 17 Apr 2023 14:56:32 +0800
Message-ID: <1681714595-18749-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681714595-18749-1-git-send-email-wangmy@fujitsu.com>
References: <1681714595-18749-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 06:57:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180137

From: Wang Mingyu <wangmy@fujitsu.com>

Feature
==========
    Reduce denial of service protection overhead

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-zeroconf_0.55.0.bb => python3-zeroconf_0.56.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.55.0.bb => python3-zeroconf_0.56.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.55.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.56.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.55.0.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.56.0.bb
index 83027e5fb..20dc96219 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.55.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.56.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
-SRC_URI[sha256sum] = "f919c0a1989af87c1c4a8786a3bcd8e78243856237cef27dcb762a7e69e4b32a"
+SRC_URI[sha256sum] = "d21916e98de8d4cb822134b25746dcf321531b8662757a7da402798ba627062e"
 
 inherit pypi setuptools3
 
-- 
2.34.1


