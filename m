Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F3AC54E64
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 00:37:33 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.7934.1711413451975710632
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 17:37:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SOrh1mrE;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711413451; x=1742949451;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=AX5y2G4JbQd8gwdalHOe8f0B/15UbRrwQwlYes2G6nI=;
  b=SOrh1mrEbv/lHFuw/Ehe5KLNd5wMIWQ+CZq7WR1jFwcP+q2/2+p73k++
   G+4VYYFEv7/vedVIuns871vYUYsWaX1xo7Oe+H4BHIxeYpp82drHk4Xh+
   NwkmfzAOtSQtnR85lmwN2nCkh9lcvYXv53mRMmlPsGmWxBJRKEbaBrYUs
   3wWP8F85CpZSyLNtNXNCtJF8Nmj7RNgiLdlWVPwfqEIXR3lKNpjbGAOzi
   +FbvhNrRx9gg+3v6GCffrzGZzm/iGemFmHJjq3RgpbLp9lhp6pOk6bPvs
   05BcY6C8Ha9FMV3XSxof0pqrsTuEZRicN/6IZZCdcNxEwRONU6dfXru8A
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="140944104"
X-IronPort-AV: E=Sophos;i="6.07,154,1708354800"; 
   d="scan'208";a="140944104"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:37:29 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 814EEE0AA7
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:27 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A6372D560D
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 320F520097BFD
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:26 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D13B01A006A;
	Tue, 26 Mar 2024 08:37:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-Core] [PATCH 12/34] libpciaccess: upgrade 0.18 -> 0.18.1
Date: Tue, 26 Mar 2024 08:34:30 +0800
Message-Id: <1711413292-3025-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28274.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28274.003
X-TMASE-Result: 10-2.200700-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmI/dksnGuGmFbtj8w9EqUz1uce7gFxhKa0BQOqUsWgx5oFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXKjY/pIi+4DHhXR9/OlyPY5SNkKJaecsmq/qC
	71fxommDqMEK/HmQbdDOF5fk+B+yF1zOWMn+qw7fxHmBDYzkgsYLcO6zFAgOX+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 00:37:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197502

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libpciaccess_0.18.bb => libpciaccess_0.18.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libpciaccess_0.18.bb => libpciaccess_0.18.1.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb b/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb
rename to meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb
index 74b308c912..d311fd95e0 100644
--- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb
@@ -16,7 +16,7 @@ inherit features_check pkgconfig meson
 
 REQUIRED_DISTRO_FEATURES ?= "x11"
 
-SRC_URI[sha256sum] = "5461b0257d495254346f52a9c329b44b346262663675d3fecdb204a7e7c262a9"
+SRC_URI[sha256sum] = "4af43444b38adb5545d0ed1c2ce46d9608cc47b31c2387fc5181656765a6fa76"
 
 LICENSE = "MIT & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=54c978968e565218eea36cf03ef24352"
-- 
2.34.1


