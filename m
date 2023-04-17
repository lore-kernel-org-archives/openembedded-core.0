Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE9C0C77B72
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 06:52:50 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.48436.1681714367678866624
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Apr 2023 23:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jNCo2waP;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681714366; i=@fujitsu.com;
	bh=XKQ9Alo93s55jeDaa2EWnOzp2ph5qdi1IUV9R3axrvI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jNCo2waPEe6lXa1FelHHor9qTGKW5URBqdYKlbqMZTkGT5NJfE93Ej5t0BUnHH+qD
	 4CgwYOC2nPuIRWtzMmK6/cDj3n7sQ62ks87sdYXWBpo2KyEIHB/xacXMuDZae8bo9b
	 ussY+ae51gEpb4bDpIlTTtSILpd+zArLYcnDaNcUPnhQadvDCLiCOwGaaoy4552cmm
	 r1+UU16esl9tYSGcE50GYd9yhq7o+JVTZabtH9tHqhsy7bUrReXGoPhXnS8z0sxvrr
	 HK6uOJaoU1lQr2lobb8y/sbw10KNjd7UcnhDNBgeNMnJ9WhnKGs8t3DVBGDSkO4Jx6
	 Ru6w8SjeqqGIQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpLv3jU2
  KwY6PqhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bB863MBf85K7ZvXMzawDiTs4uRi0NI4AGj
  xLoPP5khnCtMEm+6LjBBOHsZJU7+Ws/excjJwSYgJXHj/n+2LkYODhEBPYmr/0RBwswCKhIvf
  veAlQgLBEg8WT2FEcRmEVCVuDTtGhOIzSvgJPH+9XGwuISAgsSUh++ZQWxOAWeJjccesoLYQk
  A1/3c1s0DUC0qcnPmEBWK+hMTBFy+YIXoVJWZfhqiREKiUaP3wC8pWk7h6bhPzBEbBWUjaZyF
  pX8DItIrRrDi1qCy1SNfQUC+pKDM9oyQ3MTNHL7FKN1EvtVS3PLW4RNdIL7G8WC+1uFivuDI3
  OSdFLy+1ZBMjMHhTipU9djA+7furd4hRkoNJSZT3Rap1ihBfUn5KZUZicUZ8UWlOavEhRhkOD
  iUJ3obXNilCgkWp6akVaZk5wEiCSUtw8CiJ8Bo/A0rzFhck5hZnpkOkTjEqSonztoL0CYAkMk
  rz4Npg0XuJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvtRdAU3gy80rgpr8CWswEtFhOCWx
  xSSJCSqqBacniz4X+f7kmP0k/sSJ94R2+Y+vn2G3X4V+0+rTtjmfbY2fvTBE2aBc3ZMpbUGrw
  LbNh3/E5B31vFSvcWNrHyPD724e8OLvo+leNM2QZNvEk7RX5Ou/uMQmlaOngcNvsd3Pzajur8
  3ke89+rOt7V2/Wq0PmQ9syT/BmZ/lX3s8wv6ETXnv0d9SjoyfPbdyYn3bi+VFjHRffHhrlXz2
  r37Q34eSW8WrH5mn5+vdeEGGHBFyt9T35nVq24LGmzlU2B25nVqbf24jvlK4/vlZ1QZksXtH6
  5dNERK7+nWw/ouC6sediZf7l6XSY368ZgrYtbErz/VMg+ENjGW5AkOH1S0YkXesskik+f9FU0
  W651V4mlOCPRUIu5qDgRALJQywNZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-548.messagelabs.com!1681714365!290042!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1078 invoked from network); 17 Apr 2023 06:52:45 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-6.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 06:52:45 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 52F5D1B5
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:52:45 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 46DA11AC
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:52:45 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 07:52:43 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymisp: upgrade 2.4.169.3 -> 2.4.170
Date: Mon, 17 Apr 2023 14:52:17 +0800
Message-ID: <1681714339-18687-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681714339-18687-1-git-send-email-wangmy@fujitsu.com>
References: <1681714339-18687-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 06:52:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180133

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add: support breakOnDuplicate option for attributes:add()
- Update reportlab_generator.py.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.4.169.3.bb => python3-pymisp_2.4.170.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.169.3.bb => python3-pymisp_2.4.170.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.169.3.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.170.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.169.3.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.170.bb
index 4f8a13051..dbfcebe5d 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.169.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.170.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "39f5acf1f618cde6cb14dd815cbff5297a8af25a"
+SRCREV = "6b28d8e606747cade1638f651ea531850027ddf4"
 S = "${WORKDIR}/git"
 
 inherit python_poetry_core
-- 
2.34.1


