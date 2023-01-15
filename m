Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1182CC63797
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 05:24:37 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.134799.1673760267039897440
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jan 2023 21:24:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HlMiH4h/;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673760265; i=@fujitsu.com;
	bh=PxPHATYeLbLBJ902CYDN7hYrm+T2emSXZ1b6cD5Teks=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=HlMiH4h/oxlpaOvO6EWPpPPzuQkSTBcClLdiNcHr5cPerhOF/S74V9NXq3XnP7MFm
	 wO7dd77qYAn3uiDad5Q8ZpOOoOeJEZvsP+qetcnpil6h+NQg2Qd8Yop8AuzpFzpHlT
	 uW8TeGanf6d6agTFpnCmwt2x7Xpm6wmYGMaOw3r8V3oWUrr73jDb4d9AgIfcgJLKWk
	 /Szy+VKJcXdRXDTUty5L+NMehtksEzMSph3471v9FlNj8FvQ0GDSVT25lz9QGMCq3e
	 v0reUY/0JldjBr55B6wNgoBw6fOR9SNE5ecK3vuI6hdAT+VyDHMZg2iDVbAG+8MJzM
	 /WcLCVHLZa2rA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRWlGSWpSXmKPExsViZ8OxWZej73C
  ywaUVKhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bOXatZC9ZxVRzuXMvewLiHs4uRk0NI4AGj
  xPKVJl2MXED2ZSaJt+c3s0Ik9jJKzFmhA2KzCUhJ3Lj/n62LkYNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAq8TRl81grSwCqhLTfzxgAbF5BRwl/vRuZQSxJQQUJKY8fM8MYnMKOEk8PfqREWSkEF
  DN9jZxiHJBiZMzn7BAjJeQOPjiBTNEq6LE7MvNLBB2pUTrh19QtprE1XObmCcwCs5C0j4LSfs
  CRqZVjKbFqUVlqUW6lnpJRZnpGSW5iZk5eolVuol6qaW65anFJbpGeonlxXqpxcV6xZW5yTkp
  enmpJZsYgUGbUqyuuoPx3LI/eocYJTmYlER5I78dShbiS8pPqcxILM6ILyrNSS0+xCjDwaEkw
  buh8XCykGBRanpqRVpmDjCCYNISHDxKIrzaHUBp3uKCxNzizHSI1ClGRSlx3hc9QAkBkERGaR
  5cGyxqLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5n0KMoUnM68EbvoroMVMQItD6g+CLC5
  JREhJNTB5GVQeW3x2a/GkK6+1/sgIzFr32KL99oVnbbf4sxfXpLkVua90dneQLNmzb1Xnit27
  9vOszbo7PeGW6lZ/c/HughtPd4WuDJCSv7+Bx4OtONXe+92sgvfxld8X7QqLeCyce7G+MeWB/
  Z4fbZf+rFhTws/IOonj1+bZDpqXH75oi9A4pKD2zmlK/0n/F/YffukK6/1pvP0ookn3+JKlZR
  JT2A+c12jlluTgZDsmo/b48B2FttWZ16sFeE9ofIqKOXP4YxKn0hepU5u+Mnz4fW+JIYPQP+P
  qd4cmHMkKLVdftqrPK6jh4x5HyYNTO/1qqx983BzGEB6wYVLpwssdkmuXCZX1qfF1CHbf/rvO
  1XqtEktxRqKhFnNRcSIA64pQPlUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-548.messagelabs.com!1673760264!85505!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21363 invoked from network); 15 Jan 2023 05:24:24 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-22.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Jan 2023 05:24:24 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 5179C142
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:24:24 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 44C0873
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:24:24 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 15 Jan 2023 05:24:22 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-dbusmock: upgrade 0.28.6 -> 0.28.7
Date: Sun, 15 Jan 2023 13:24:07 +0800
Message-ID: <1673760250-2563-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673760250-2563-1-git-send-email-wangmy@fujitsu.com>
References: <1673760250-2563-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175873

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 blue5-obex template: Fix OBEX PullAll
 power_profiles template: Fix Actions property type
 README: Explain container tests and how to debug them

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-dbusmock_0.28.6.bb => python3-dbusmock_0.28.7.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.28.6.bb => python3-dbusmock_0.28.7.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb b/meta/recipes-devtools/python/python3-dbusmock_0.28.7.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.28.7.bb
index 1290fcd2f1..4ea21a56ea 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.28.7.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "3b496fab84aff3936054f747e9a22bb07ac5783b1d967c6cc39536c7ba315fce"
+SRC_URI[sha256sum] = "0786977750dbcbde6e2553339a2e66d9a8d4453d5c848b945e8fd1badb736ffd"
 
 PYPI_PACKAGE = "python-dbusmock"
 
-- 
2.25.1


