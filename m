Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11650C76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 09:34:49 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.40196.1681119281783970790
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 02:34:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nZgteIgW;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681119279; i=@fujitsu.com;
	bh=jLfZjbY6nIq6iSXY3jmfpPW8tSZP+xEso6NT2XVftnE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=nZgteIgWvUwZvHx24Cf3h7dRerkSh415GFxUbwnlOQzuvmjcZ0CafPefU5Rxdmh2g
	 3dJTXP1OVZAHGZqJPKyBuHCKyDmUAYZ+oKtcbZSUJsA1h0yy5izhRRBJMaqomBdTKL
	 dz3Yc/ULglw7OuUIFU4AZPTqjIH+EFNoV9X935VESDrZytNa2UuCPw8M1Hijg41MDm
	 KuOKnfy46PPE2f6lzsCdpU2geQjHoys76ARoaP4OAJZvqh1rP5uDgCP2GrothebOUl
	 6Bh64vQfVN2GgS0ooCL6JnOQKXUb4Y2+pPXUzd2dnUpM7Ucgc2Xq7LlQq87CxeTOe3
	 lTtADS+Ui/Ytw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8OxWVf/hnG
  KwfJ57BZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8a69g7Wglauiiff+1kaGJs4uxg5OYQEHjBK
  LPpU1MXIBWRfZpJ49vMvI0RiD6PEx7tKIDabgJTEjfv/2boYOThEBPQkrv4TBQkzC6hIvPjdw
  w5iCws4Slxq/MUIUsIioCox+UYuSJhXwEni1uLfzCC2hICCxJSH78FsTgFniXvvj7FCbHKS2D
  nlBTtEvaDEyZlPWCDGS0gcfPECqldRYvblZhYIu0KicfohJghbTeLquU3MExgFZyFpn4WkfQE
  j0ypG8+LUorLUIl1Dc72kosz0jJLcxMwcvcQq3US91FLdvPyikgxdQ73E8mK91OJiveLK3OSc
  FL281JJNjMDATSlOurODcWffX71DjJIcTEqivF1cxilCfEn5KZUZicUZ8UWlOanFhxhlODiUJ
  HgZLgPlBItS01Mr0jJzgFEEk5bg4FES4ZW4BpTmLS5IzC3OTIdInWLU5VjbcGAvsxBLXn5eqp
  Q4L8d5oCIBkKKM0jy4EbCIvsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmPfMRaApPJl5JXC
  bXgEdwQR0BJeLAcgRJYkIKakGpqBPdt/UyuP/xMcsXVYzM2DfoVjbqWEPTt/68H169pUZ299d
  T3Gf8Kf8ncAH1ivPL8/We5KptXfWDDUh1svd/2SyruSUiG6/2b/r8e63WWkrWz92Rl2vrXjpo
  D0t4Hl515X7Hq2LVLwmy95ty7a2Lu4vF2W7uze0LHv+w89dc3znKU5ymcl+y9pydbiSZF+kT9
  HS17MvtB6/8Kjy0KtZe16nHbUVemqrs+dSXeyTvOzISfXSltwrTqpO/FC43kbxOV+4YtJbLta
  ezG82v67lXTN9GaKdvkbuvqn2yganPSGnnBpLtsU8Ppnt0r3kUKVpWcN94XRHy/9W783nHLzP
  E1xmWhe1V+68gRh36XxPTiWW4oxEQy3mouJEAKEJJCtjAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-25.tower-745.messagelabs.com!1681119278!193019!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12111 invoked from network); 10 Apr 2023 09:34:39 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-25.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 09:34:39 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 8C2E0159
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:34:38 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 7FD5E155
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:34:38 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 10:34:37 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] xserver-xorg: upgrade 21.1.7 -> 21.1.8
Date: Mon, 10 Apr 2023 17:34:14 +0800
Message-ID: <1681119256-25106-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681119256-25106-1-git-send-email-wangmy@fujitsu.com>
References: <1681119256-25106-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179870

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{xserver-xorg_21.1.7.bb => xserver-xorg_21.1.8.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.7.bb => xserver-xorg_21.1.8.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.7.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.7.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index 212c7d39c2..19db7ea434 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.7.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -3,7 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[sha256sum] = "d9c60b2dd0ec52326ca6ab20db0e490b1ff4f566f59ca742d6532e92795877bb"
+SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.34.1


