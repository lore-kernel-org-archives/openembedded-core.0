Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B31C54E68
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:09:50 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.10807.1710313781793570320
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:09:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CblmJWEj;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313782; x=1741849782;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=8bHb9UugHELb1NZEM5XUk7U/ZbUMSiFkAosdNvYQySk=;
  b=CblmJWEjsuhQnY5korLKv0aDT8nBpv6UaLjyGK48HGTkr9uWfbfOSjNn
   +MVd6ietgOFQUJiNHi9aie85zcd8po8iKg9yEiorYwn2+jHfYI88sy3oG
   ukkrlzLzwqk0I0Zlt5RpL3Zd+CgO4ILr9bOwlFIY9XtxzUSDXj6IXbO57
   bcZVhGtGxb14p7RkOzNiy1+ZRst4hupldbyukYZmwppMi+Gb+vaRuItH0
   c8okhZJ08PBxk0Ppt0okcc7thFfzHTYZqXxklQ3aJCD6hnzZ7f68R1twV
   EiMEmmm+AI9gLTPpCfZwvFRkI/cld54+B5Xj0yiYF1s3ZgAzX5EdUpmIw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="152149470"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="152149470"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:09:40 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9BD1EE9648
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:37 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D2794CFAAD
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:36 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5F76020097CD1
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:36 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0CF8A1A006B;
	Wed, 13 Mar 2024 15:09:36 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 34/36] xauth: upgrade 1.1.2 -> 1.1.3
Date: Wed, 13 Mar 2024 15:08:32 +0800
Message-Id: <1710313714-12541-34-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 10--0.357900-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrfb+ZO7kHlEisNm4gV6sNhKk4
	lLAFOnmCzORhxlIyWpdQ4/Ulort2ra7ZTBeIvbkuqhcdnP91eXFMkOX0UoduuYFVify+qaIW0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q1/OBWacv+iVVXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZKwtsccrr7GNwPmHEqI77VL3ddi36vTw/OJN6f+YbO7HzM5/
	dHvkXbjdAKAtSk80KpO0o7i8PM/CvFtMNZ7wIdTcGu5+oSfExlLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197036

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-unifdef Lynx
-unifdef hpux
-configure: raise minimum autoconf requirement to 2.70
-configure: Use AC_SYS_LARGEFILE to enable large file support
-Unbold brackets for optional n at start of commands
-Handle -Wempty-body warning for WRITES() macro
-Remove unnecessary casts from malloc() calls
-Variable scope reductions, as suggested by cppcheck
-config: Add missing AC_CONFIG_SRCDIR

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xauth_1.1.2.bb => xauth_1.1.3.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{xauth_1.1.2.bb => xauth_1.1.3.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-app/xauth_1.1.2.bb b/meta/recipes-graphics/xorg-app/xauth_1.1.3.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-app/xauth_1.1.2.bb
rename to meta/recipes-graphics/xorg-app/xauth_1.1.3.bb
index 1ad18ef63b..b0ca33bf4b 100644
--- a/meta/recipes-graphics/xorg-app/xauth_1.1.2.bb
+++ b/meta/recipes-graphics/xorg-app/xauth_1.1.3.bb
@@ -9,7 +9,7 @@ DEPENDS += "libxau libxext libxmu"
 PE = "1"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "78ba6afd19536ced1dddb3276cba6e9555a211b468a06f95f6a97c62ff8ee200"
+SRC_URI[sha256sum] = "e7075498bae332f917f01d660f9b940c0752b2556a8da61ccb62a44d0ffe9d33"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.34.1


