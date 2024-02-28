Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD23BC54E59
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:52 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.8398.1709105620778007770
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=frLH7iYJ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105626; x=1740641626;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=waCy0/bvk5mpdG112yThEohjIs9OtP3lfzVhYMoB5QI=;
  b=frLH7iYJVo8hRnsHY1Bbr80KF0a0Y54GcAi5S1Te4RIExchfOOZpH7FM
   dad0wZXKZ4ScSLj4LsTzqCb+7kaAe8WDY+/uegIR15FJb3AcOA4iaPlcw
   1SdtHUQQQQiONVBe2Tyo3Mw41Qgd/9zwMxNhOFeETRybxj0Wd2+ObL04A
   AHAw5dDrzh8I5ojfTcgPAUuXVNrSt0FHzaV0tjVEXbEVe7Ei3dikRPX0L
   d0bdeFS/1zL3tN4LfhkwEX7sbBzyTVvMUdsoFuHB4ougaBaUHXE1IiIm+
   fyWQf6RGuwR4tWkodwJSDU+UMKpSH4l0ZkNHHVsqnaxOg+TWXwXHNomR0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="150677549"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="150677549"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:45 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A82371590FA
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:42 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id DE956BF4AF
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 81AB541180
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:41 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2F78D1A006A;
	Wed, 28 Feb 2024 15:33:41 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 48/48] xprop: upgrade 1.2.6 -> 1.2.7
Date: Wed, 28 Feb 2024 15:32:55 +0800
Message-Id: <1709105575-24259-48-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10--1.797800-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyuwDXa1aGLkoYPc
	XuILVCbaA8yb9zTkGEYF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyWY5v+NllnxQoFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXLoqD8Dww3vvgFw4JZCkk1oJfo8VdDaX/njSp
	179pHJKg4WwFUcnXOHKqyQnwTLsEbX93/ETXuM027RlDUXY3IlMWYlpSOAMdz+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196373

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix C23 build by renaming variable 'true'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xprop_1.2.6.bb => xprop_1.2.7.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{xprop_1.2.6.bb => xprop_1.2.7.bb} (86%)

diff --git a/meta/recipes-graphics/xorg-app/xprop_1.2.6.bb b/meta/recipes-graphics/xorg-app/xprop_1.2.7.bb
similarity index 86%
rename from meta/recipes-graphics/xorg-app/xprop_1.2.6.bb
rename to meta/recipes-graphics/xorg-app/xprop_1.2.7.bb
index 438a897f1e..96e364b2b3 100644
--- a/meta/recipes-graphics/xorg-app/xprop_1.2.6.bb
+++ b/meta/recipes-graphics/xorg-app/xprop_1.2.7.bb
@@ -15,4 +15,4 @@ DEPENDS += "libxmu"
 PE = "1"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "580b8525b12ecc0144aa16c88b0aafa76d2e799b44c8c6c50f9ce92788b5586e"
+SRC_URI[sha256sum] = "4436e3148bb91a162406230d9f736a49ca8b50b74790015dc15d78d6ce8e825f"
-- 
2.34.1


