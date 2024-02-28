Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3813EC54E58
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:31 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.8415.1709105606125349280
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mAsNt4Jo;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105606; x=1740641606;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=bkABaaF5l2mDwrp+b1daILPJOJEV6NE0P+0d8PZOORk=;
  b=mAsNt4JoTqC4QDViPNibULw3EVpX1WuNKAZxkdZtrc8MRPgM4mNYFZCs
   tsZMzEJf3hRBeNqrK3izRt2Y3MtcoIk6X5VXTF8GzUfdMLPBo3eTzTF7F
   YXd4Var48PA9uBq/YUIs+wUtcdunCzezqVQRZk9jpfAqqlbkT6bRt0Shs
   LsPhdkTyf7IZeCh3qe3CLB/lHIZfdz+nmkh8Q7ICY+r7IRzGJ9BTToY73
   x2wtIWa4yE+RGb7EKhjNSMZeEi/1MeXnPt3Uk4MH/rzarAJisGLX9wlZa
   AO0fIVIEvRQXc6+wqnwWldVez9hNLgFtQExMHHYIU25iFJvoVNU1YjO2E
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="129959012"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="129959012"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:24 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id D4376D4804
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:21 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D78D7BF4A6
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7508741180
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:20 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 229831A006A;
	Wed, 28 Feb 2024 15:33:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/48] libhandy: upgrade 1.8.2 -> 1.8.3
Date: Wed, 28 Feb 2024 15:32:18 +0800
Message-Id: <1709105575-24259-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10-2.560100-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrARyXsbS4pUZUjspoiX02F6+X
	jxY1c4Onldhq7sfFh4dKhBUJyxjhBu1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4qHvyg1ZsxTflwt7DABrvp91e7Xbb6Im2g8JAnaMw0RVwSC6qIZ5nkmjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipcgGc1dSIUH/2Pme+sRsvX9XGpuug8oKD5U1li
	7S7X8f1ktwh/hVbDzhazZfQWgjsfSUA4c+wbAqarxl3/M2HG9VU/ClD6AmKdf6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196336

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- HdyStyleManager
  - Support contrast setting in the settings portal
  - Remove an extra unref
- Translation updates
  - Catalan
  - Georgian
  - Romanian
  - Turkish

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libhandy/{libhandy_1.8.2.bb => libhandy_1.8.3.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libhandy/{libhandy_1.8.2.bb => libhandy_1.8.3.bb} (95%)

diff --git a/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb b/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb
similarity index 95%
rename from meta/recipes-gnome/libhandy/libhandy_1.8.2.bb
rename to meta/recipes-gnome/libhandy/libhandy_1.8.3.bb
index e863e8d13b..7f5f02a7ba 100644
--- a/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=libhandy-1-8"
-SRCREV = "48ae7ec0f7f9ee5f666da38b0e39e66874957166"
+SRCREV = "9b0071408ce86a3ef843806fddd723a85f6f2416"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.(\d*[02468])+(\.\d+))"
-- 
2.34.1


