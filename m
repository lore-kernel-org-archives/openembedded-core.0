Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB163E7718A
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 23:57:15 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.116564.1733788632224844440
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 15:57:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=t2q5QujJ;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733788632; x=1765324632;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=jAKZig/cA5PRS6DTx/JVGymrJZHntwHOnnur10WvwrU=;
  b=t2q5QujJv27GUgiVOigGqy2kleLmNo2kqEJIIOwu+S/ZTSfp343oMjiD
   WSglzfdQYarR3jTZvgaZo9dVEmW/QBSuXNpVJZdunvqAK4olxAaDK3Mzw
   mtL3bYfH+8fwM1WbaWen6+RgEPCmtjkxdKiuyw/EUXkQ0YZZHLmLQrKH1
   MVuNOTftm7YkXWBjEiOrcgQG+eouKh5njWHtfDSSnaSR/KzGk7iqkP0y4
   8lylyyX0c3IwtWeI9D/YJ7sMD+sFs9t+oJVqAWL6coL6Yw1ikf8H63fEP
   xMI0qfpq9I2d1Ql7tGBvg5tgFXCw4ngYmw63xMKL9zq15hnpiNKl13h4X
   g==;
X-CSE-ConnectionGUID: yBuENO/rR4iEpn0FQVK+Og==
X-CSE-MsgGUID: OUPkbEsuSimroLQ8RlPM4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="162028200"
X-IronPort-AV: E=Sophos;i="6.12,220,1728918000"; 
   d="scan'208";a="162028200"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 08:57:09 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0A40EE8529
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:08 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id CFED1CFBC8
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6530520076D0F
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:07 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0BF421A006C;
	Tue, 10 Dec 2024 07:57:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 17/20] sudo: upgrade 1.9.16p1 -> 1.9.16p2
Date: Tue, 10 Dec 2024 07:56:49 +0800
Message-Id: <1733788612-20933-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
References: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28848.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28848.003
X-TMASE-Result: 10-0.444900-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGOxl9HNVJWpcngIgpj8eDcBpkajQR5gb3lQwtQm7iV5jKra
	uXd3MZDVdQFJd25n07v2Ietkj/e9UfInESPN1YkGJdccfzTUFnZuS1vA3EzqSmVdQJ3uz9UgATZ
	i25sDv8tTIOyXFGDC14pLL/wawbVoyoB4P7dCh9lPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 23:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208511

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../sudo/{sudo_1.9.16p1.bb => sudo_1.9.16p2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.16p1.bb => sudo_1.9.16p2.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.16p1.bb b/meta/recipes-extended/sudo/sudo_1.9.16p2.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.16p1.bb
rename to meta/recipes-extended/sudo/sudo_1.9.16p2.bb
index 5907b0556d..fbe507ad32 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.16p1.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.16p2.bb
@@ -7,7 +7,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "404994e23ae8bcf4be59ed6fd3759ad70a8cefa9bcf71640b33f176afec243b0"
+SRC_URI[sha256sum] = "976aa56d3e3b2a75593307864288addb748c9c136e25d95a9cc699aafa77239c"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.34.1


