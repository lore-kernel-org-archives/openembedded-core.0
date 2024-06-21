Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F87C41513
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 02:17:35 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.64111.1718936246888124085
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 19:17:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VDgGkX2z;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718936246; x=1750472246;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=z41hvOQL8KzCX+ZklTO2dUv5WMfSW0F/AF63hpBwcC8=;
  b=VDgGkX2zeMJYxT50l7L1GLB6j4Y51U3igFJtUvXiselC5jatbTUJiNk5
   Zsxo2+tSdwySrzl9u0lxQPA9DtAPA4LWlMgpjjTuh8ORk7Gn9WPgesCD4
   AKcebIwHSADzmC5KnK6XAWmkeO3pmaJgUyVE9mWYy7C7JsERLwYe1q0hZ
   LJPnja5b3GVSl5mX8USP+vJ3O7TbAMotumctKqFX/hfUeev4Q6WgXj0U7
   zpQFYZBOIs9+BG0IS0ew8fP889TBEmUOPm0MCCh1/0wb83otAOHapyYs2
   ddA7sPNthBbu6+YDZlr+rsWl6PtLwQayV6c2SEsWZ5tema7GgbmAI7Y2O
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="143508309"
X-IronPort-AV: E=Sophos;i="6.08,253,1712588400"; 
   d="scan'208";a="143508309"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 11:17:24 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 92533D9230
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:22 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C90ACD8B72
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 472A220086EB3
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:16 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E8D221A0002;
	Fri, 21 Jun 2024 10:17:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 19/22] ofono: upgrade 2.7 -> 2.8
Date: Fri, 21 Jun 2024 10:16:43 +0800
Message-Id: <1718936206-8080-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
References: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28468.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28468.003
X-TMASE-Result: 10--0.871000-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysvPRFFhcWhYOEO
	iHvBs/Z/MFh4PjoRkMwNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt7ssb
	EkSX6c0mxPw24dAVn78FbFOtYZ9NBe4OGWN8bTes7Cl8sx4HBG8wWHcWGDLCckHPVkBTu31McAn
	YbZC2m1HSthEIbj3+KgDLqnrRlXra/ZOFeDeXHgN0H8LFZNFG76sBnwpOylLMENoxpJVIgcemee
	UqYeLn6ZoB+Hw53/BtNio0b4cOpn6pbwGR7NffPU811PiklQfPQcX+DQuN17cq7A+EGpW/ZqkR+
	V+kYaAuIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 02:17:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200984

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix issue with handling USB TTY device detection.
- Fix issue with handling GOBI versus QRTR detection.
- Fix issue with handling QMI based PCIe devices.
- Fix issue with handling CRSM result parameters.
- Fix issue with handling PPP ACCM for Quectel modems.

License-Update: use SPDX-License-Identifier to specify license.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ofono/{ofono_2.7.bb => ofono_2.8.bb}                     | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/ofono/{ofono_2.7.bb => ofono_2.8.bb} (91%)

diff --git a/meta/recipes-connectivity/ofono/ofono_2.7.bb b/meta/recipes-connectivity/ofono/ofono_2.8.bb
similarity index 91%
rename from meta/recipes-connectivity/ofono/ofono_2.7.bb
rename to meta/recipes-connectivity/ofono/ofono_2.8.bb
index bc1f3efd04..2aed02cdc0 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.7.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.8.bb
@@ -4,14 +4,15 @@ HOMEPAGE = "http://www.ofono.org"
 BUGTRACKER = "https://01.org/jira/browse/OF"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
-                    file://src/ofono.h;beginline=1;endline=20;md5=3ce17d5978ef3445def265b98899c2ee"
+                    file://src/ofono.h;beginline=1;endline=20;md5=5edd2126537851842453c61fbf551851 \
+                    "
 DEPENDS = "dbus glib-2.0 udev mobile-broadband-provider-info ell"
 
 SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
     file://ofono \
 "
-SRC_URI[sha256sum] = "dabf6ef06b94beaad65253200abe3887046a4e722f4fe373c4264f357ae47ad3"
+SRC_URI[sha256sum] = "b5aef455b3a374ce43bad43c2ade9d0430d9c0d28952385c44ac7d0dc933bbb8"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
-- 
2.34.1


