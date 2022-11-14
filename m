Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA8C0C433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 03:25:46 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.1774.1668396338000339388
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Nov 2022 19:25:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tlWW2D98;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668396336; i=@fujitsu.com;
	bh=OY/NBwivfLxSXebZwBY9VpgSHVSHhswmxCBVLvkDRqk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=tlWW2D98YOHEx8WPWAeGumiagjiEjMulKIM+fXw9aAC5DqdiJiCYU/Zlkgcdnq+5p
	 r57DUk/sbBBeBbrKBoXfGmL0ErMY0hKsuzX+yMb7V/kxz6ZA4V5y0HvzG7tA/d7kke
	 LaSGvJM1/JFg15FyDRrGOXwEgRFdxDMF9QdQpV83PBgAzbG9WA7+WB7SfrLUF7TIQj
	 eyskVMfe2ROMKEK90K7b4vFNU9fJKt5+d1ua/yt9PpgW18hEzqh4Rst6TPE/4JHn6B
	 PPRicluahHcdsGvp4CuM+xtnG4nP7KRixpPZexGGtayI20THKQujCQZ/fcNL/UgtNL
	 /2Jg+GiswPoGw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqKu3tTD
  ZYMNfRYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePFvXlsBVe5Km5c3s7YwPiCs4uRi0NI4DGj
  xLoHm9ghnGtMEpM3bGTqYuQEcvYwShw4kwliswlISdy4/5+ti5GDQ0RAT+LqP1GQMLOAisSL3
  z3sILawgJNE087PzCA2i4CqxPGVP1lBbF6g+Kr1S8FsCQEFiSkP3zNDxAUlTs58wgIxR0Li4I
  sXzBA1ihKzLzezQNgVErNmtTFB2GoSV89tYp7AyD8LSfssJO0LGJlWMZoXpxaVpRbpGhroJRV
  lpmeU5CZm5uglVukm6qWW6ublF5Vk6BrqJZYX66UWF+sVV+Ym56To5aWWbGIEBmNKccrFHYxP
  lv3RO8QoycGkJMrLv74wWYgvKT+lMiOxOCO+qDQntfgQowwHh5IE74XNQDnBotT01Iq0zBxgZ
  MCkJTh4lER4SzcBpXmLCxJzizPTIVKnGC05ps7+t5+ZYzmYnPm17QCzEEtefl6qlDjvCpB5Ai
  ANGaV5cONg0XuJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvHZC1PJl5JXBbXwEdxAR00Pf
  IPJCDShIRUlINTKu6j5rKdofdinE5a7COu/jM767zHpz5CsmKjr6Jh59Ovq9Wm33KUC8ptnZq
  6lUzfq6kXeEzJvpvnz3h4ccdXddS5Iw65mu1uf5Vv/Tx3jQ9d3t3z95Ud4Uz8Ta++yqP3X+j+
  HD2J6MoSdHeyVMs5ilE1NrnBPBn71ygpnn8fqgpX77j+0+xE59fytrH/WKz6KmION4boVtidp
  wUmJW5mCk+Jpv7/rNZ3sKPnSQD7U93zulidRNoXKmy8MPDiLLzLEsqzMxLPT6rH7T9HRVVvaa
  tZXr6vabM5A21h+QVX1+reBMWezRz+9VavV7rzhIDxbX5FzI5mZMWVHOfmGNhKn7JwEBp1ier
  JzIPuB2UWIozEg21mIuKEwH86qFMWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-728.messagelabs.com!1668396334!807402!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3046 invoked from network); 14 Nov 2022 03:25:34 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 Nov 2022 03:25:34 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 079FC100188
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 03:25:34 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id EFA97100182
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 03:25:33 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 14 Nov 2022 03:25:32 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] wayland-protocols: upgrade 1.27 -> 1.28
Date: Mon, 14 Nov 2022 11:25:17 +0800
Message-ID: <1668396317-24100-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 03:25:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173221

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{wayland-protocols_1.27.bb => wayland-protocols_1.28.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.27.bb => wayland-protocols_1.28.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.27.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.28.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.27.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.28.bb
index 5223a13f1a..2366cc7859 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.27.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.28.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] = "9046f10a425d4e2a00965a03acfb6b3fb575a56503ac72c2b86821c69653375c"
+SRC_URI[sha256sum] = "c7659fb6bf14905e68ef605f898de60d1c066bf66dbea92798573dddec1535b6"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-- 
2.25.1


