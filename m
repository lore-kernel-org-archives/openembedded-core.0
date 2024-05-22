Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50084C25B77
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:15:09 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.5652.1716369303011323183
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qSdpDkXX;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369303; x=1747905303;
  h=from:to:cc:subject:date:message-id;
  bh=TObyaMsgIBxlJzdHkuTZMV5/hcMz8ibBQRTr6kTqeEY=;
  b=qSdpDkXXSn6Y1jmyXu/6AcPc05D9RP1Lsf/Ak7bu7JLJWqpQVeaPlyrj
   yB7NrWrDOLIXUeR9ymX2dLaAWHPNmxOvTORL5NfhptQiPzpDTWzmUG8fT
   iZIY+FIQAjs+lceXQm+iuPipx7nnlfF/0Qem84OaIoGW2LBaL8XeXq7Mv
   hsvuXpqlbFjG9U1AewHlPhrzgFkDHzgEL2mOe7I5x4FYqxHi1ZeD4Ql9i
   frF1wMY/EgGUfmzKA2Sf1YDVr6FBlKXXCPdWhlJKP5KIxUkM0JJJJusqt
   ZpZfaCgJj3ez+WT5kioKJBMDjWQIA1/UW03yorib6xGFK7Pkl1HhL8mFo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="137912192"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="137912192"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:00 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6E8A5CC145
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:14:58 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9741031B07
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:14:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 22F7F22882F
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:14:57 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9FABF1A000C;
	Wed, 22 May 2024 17:14:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/42] appstream: upgrade 1.0.2 -> 1.0.3
Date: Wed, 22 May 2024 17:14:08 +0800
Message-Id: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10--1.573500-10.000000
X-TMASE-MatchedRID: 6IstDyeExSCjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyviaAqHGEwBKZUa
	UNfMJ7AxUpd9fEj7LqIP+Fbf+/0nMo9ZQxTBaq6pPPov5T+l6PH9/10UwQkQ7N20KhkCTcTU6dC
	Tp1R4Uo2tNSYQOwXP6vNKf5FJECasV7yRVP7gUWUD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpiAH/xyJs7whjsZfRzVSVqXJN65fjGjYMQAoD1kmRw6GZUjspoiX02F+v+O
	t3kmhvZg/0qbmKKjw15OPD8XJFfpB8TzIzimOwPruuVAw9Gg4LEQdG7H66TyHEqm8QYBtMO90Eh
	GuVLWTNLYIIfDCpacg+3+0DRwMJ72QIw+3ZV6zPDi4Ab3SH4/pteju0+j9LEHfDbWYjou3Xv1MZ
	Ye4V3BTgCjsT0Qy14gr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:15:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199696

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 * qt: Fix relocation of Config.cmake files
 * cli: check-syscompat: Recognize available required controls as available
 * validator: Guard issue emission functions with G_GNUC_PRINTF
 * validator: Always use secure string formatting for issue emit function
 * utils: Explicitly set format style when installing catalog metadata
 * Suppress static-analyzer drawing wrong conclusions on GCC 14

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../appstream/{appstream_1.0.2.bb => appstream_1.0.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/appstream/{appstream_1.0.2.bb => appstream_1.0.3.bb} (93%)

diff --git a/meta/recipes-support/appstream/appstream_1.0.2.bb b/meta/recipes-support/appstream/appstream_1.0.3.bb
similarity index 93%
rename from meta/recipes-support/appstream/appstream_1.0.2.bb
rename to meta/recipes-support/appstream/appstream_1.0.3.bb
index 7eb12a04c5..625e85a0ae 100644
--- a/meta/recipes-support/appstream/appstream_1.0.2.bb
+++ b/meta/recipes-support/appstream/appstream_1.0.3.bb
@@ -28,7 +28,7 @@ SRC_URI = " \
 	https://www.freedesktop.org/software/appstream/releases/AppStream-${PV}.tar.xz \
 	file://0001-remove-hardcoded-path.patch \
 "
-SRC_URI[sha256sum] = "1a5148ca97dcbf5eb6e9c380278bb0d20938569292ea8652df1b3cac8bd2736b"
+SRC_URI[sha256sum] = "5ab6f6cf644e7875a9508593962e56bb430f4e59ae0bf03be6be7029deb6baa4"
 
 S = "${WORKDIR}/AppStream-${PV}"
 
-- 
2.34.1


