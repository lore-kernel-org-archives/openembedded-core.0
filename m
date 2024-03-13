Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDE81C54E79
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:09:29 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.10638.1710313760595481985
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:09:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=puXAIJmL;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313760; x=1741849760;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ArPZ2nN6KAOA1tnXA470L2qyQS8vVFU9eUKs3H/jVRs=;
  b=puXAIJmL2aoEup4B/w4ZV7Vz7sV3QsZmR1MHZg+jMZoJ0pqrWxfR2CGJ
   J16M+9GHlTrL7kcnHCujx9XOXHSVD6afEzKqa2MklavC9JkSQGHYuqEgm
   r69SqCHlnfDdJ6b0L90FJ6YjI5ttjprRSYrzrSH34mvaT9O9MOXSliRB2
   vxT3/ITZcX1Cc49G4UrSRcVw3Sd7XawVluRy4fuWCQhDwuVUnTlLDZNun
   aUQml3ZTkwwQJovXrxBiwqt+Tvd1JTzdkWt4XlJwQjmJGtDc5/3m8Z+SM
   izEwIz7ZIvtw5Ke/eToxi94B/1ItItiNOD4HJDhU07i3iMJ+74pZvUlGR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="140106876"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="140106876"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:09:17 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 92298E6006
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:15 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id BFBE3CFAB4
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 409E920097CD1
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:14 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E2F4C1A006B;
	Wed, 13 Mar 2024 15:09:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/36] libxcb: upgrade 1.16 -> 1.16.1
Date: Wed, 13 Mar 2024 15:08:10 +0800
Message-Id: <1710313714-12541-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 10-0.857900-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyslr/X7qYoEs76p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3HZonBD1OvOD6Xn
	Ba2uOA62D/SpuYoqPDS5rYfHE0OO95UcZtwNsCroURSScn+QSXt8dWDYdvqmp9zw4lzv7RUmOhz
	Oa6g8KrZVp6D6TcRSrOQNQIbp7kdQhnC+FJC6GUdoaOMqJkFpnmvAjFNGRqc767HYtJm964DoqI
	X5KQvL2wdQE7UcUdi1zBReiI6QK5B0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuEVM/dBEMBtjA
	KW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197015

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Enable large file support
-Fix compilation on Windows
-gitlab CI: use latest xcbproto from git to build against
-configure.ac: drop `pthread-stubs` dependency on NetBSD
-gitlab CI: regenerate container used for builds

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxcb_1.16.bb => libxcb_1.16.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxcb_1.16.bb => libxcb_1.16.1.bb} (93%)

diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.16.1.bb
similarity index 93%
rename from meta/recipes-graphics/xorg-lib/libxcb_1.16.bb
rename to meta/recipes-graphics/xorg-lib/libxcb_1.16.1.bb
index 04b1eaa910..de3290aa9f 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.16.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7"
 SRC_URI = "http://xcb.freedesktop.org/dist/libxcb-${PV}.tar.xz \
            file://0001-use-_Alignof-to-avoid-UB-in-ALIGNOF.patch"
 
-SRC_URI[sha256sum] = "4348566aa0fbf196db5e0a576321c65966189210cb51328ea2bb2be39c711d71"
+SRC_URI[sha256sum] = "f24d187154c8e027b358fc7cb6588e35e33e6a92f11c668fe77396a7ae66e311"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.34.1


