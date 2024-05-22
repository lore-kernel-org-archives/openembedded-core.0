Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2DA1C41513
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:16:00 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.5660.1716369316183619180
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GvhE+mxw;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369323; x=1747905323;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=u+hknMxQSnysXDs0P96C9aX/F4qgrIQTzhluEoalXxE=;
  b=GvhE+mxwHfhV56KOF9e0B0EeBk0mJN+ZQqRcswaxe6bPelkith/rNHMI
   LP4AdMqxx/vmlpDQoeCtdgKcvMyHutz8fZcLr/SL2Mm3ML6xyn25bx0Wx
   efPJSSfJSriyi9QK7NbhKza5phNJfkMlIDkLL/kAdFa9ZDtJQZeoarnoO
   CeH7lxkafXQuZJ79bVnGhaILjb0FuB4SgbWrRGQNWBgbg0gLV/+vaVZak
   8UTA4PYi+YJ1C+nie7mGfRwK9jj8QgGUCcosI9LUpnnVPmB9BLN/9R5ld
   koDrBso+I/vjTIQx84gAOAc7MtykTcQ+zZHBSb70Tz5Kt0G3mNL7PkIVe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="161119202"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="161119202"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:22 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 894BBD8016
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:19 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id BDED6BDCA2
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5B2F821CB3A
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:18 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 075DB1A000B;
	Wed, 22 May 2024 17:15:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/42] ell: upgrade 0.64 -> 0.65
Date: Wed, 22 May 2024 17:14:18 +0800
Message-Id: <1716369289-22526-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10--2.625500-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyysPB8dBBorYIP
	FubbBVyAoTssFGSH7W3mn3xyPJAJoh2P280ZiGmRnVTWWiNp+v8Tzg4hNEhhM2Esl9SD1TzOnpt
	r8PnHpyni8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFFBSED+fcfPqDcNpHUZMiex30D
	35uNQCPaYG7iFa9U8dGcnHp/jOaG7Pp2/+ApcCsDsKUIOHPQ8CPaxaYP4ASfeG1WEj/ClOyOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199706

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Add support for bitmaps manipulation macros.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/ell/{ell_0.64.bb => ell_0.65.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.64.bb => ell_0.65.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.64.bb b/meta/recipes-core/ell/ell_0.65.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.64.bb
rename to meta/recipes-core/ell/ell_0.65.bb
index c4f16905fd..04086595eb 100644
--- a/meta/recipes-core/ell/ell_0.64.bb
+++ b/meta/recipes-core/ell/ell_0.65.bb
@@ -15,7 +15,7 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "760f3901078409f66cadf1bb24c8bdc60f13d53f6dd66b88631221d2494f8405"
+SRC_URI[sha256sum] = "9ee7ac57b188d391cead705d3596a6d3240341786475149db297782a52269aa5"
 
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
-- 
2.34.1


