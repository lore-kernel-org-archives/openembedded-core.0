Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD77FC27C78
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:16:01 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.5638.1716369328359877289
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HjlvEzaa;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369337; x=1747905337;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=5G0nhZlQWGYU48JkVjw5dvtInFFluuTken163ihziic=;
  b=HjlvEzaaB+o238uL89dUY+b34zNj76uIXAk72oYWN7yIbyU+wk1Jw5gX
   54oyoav8KHSuYXEZIrIBi8/bmUX6RevtiG+SduQSa4avrmxtk2v5QgTaP
   pIOZ0WZSJcGIMeSJ6SRo2E4IKODCBTvUt4bkoOhTSvJudj1LnOZxob+mS
   0lZKQlKsDoWnIOkHoNmXZCAdnhWsCfOpg6zYFlvRVZV6Vz2D8LDiFw0JA
   qJiQXf9RlODiPcHZoIYZLx5rkhLbGRc+HQkKNS2sCYRGVf9slqGwBOBxM
   JtBCKH7WQ0/em+ZvUnbCpU3yRhVpv4r3+4eQ0bogT3Irf4Tst2M1+PMkc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="147064690"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="147064690"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:36 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 44C98D29E1
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:34 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 77553D6FF0
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 05A88220B79
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A66B31A000B;
	Wed, 22 May 2024 17:15:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 26/42] msmtp: upgrade 1.8.25 -> 1.8.26
Date: Wed, 22 May 2024 17:14:33 +0800
Message-Id: <1716369289-22526-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10--7.176400-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxe9JbKiTZnHrwP
	67iqSMi1X7u0Q0QdE7rO8+IWUN2xGz13WcdbGR6Q8t4fUUGeErTVy4hHC3/gyLKw8Hx0EGitvwU
	evDt+uW5tMXimGWsZZAYUFsN5WfiFyGOiXr1rOL6dVNZaI2n6/3LhUU/qa4OGvGsAbY6bunYRei
	5DA7ytSVslxAfd+6tXeTjw/FyRX6QfE8yM4pjsD67rlQMPRoOCxEHRux+uk8h+ICquNi0WJCaPd
	Nsna2NSdMURzEsujYhVqMzrTkJJ2uDC2ZVZ8EjaftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199720

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add support for SCRAM-SHA-256-PLUS and SCRAM-SHA-1-PLUS authentication, and
  prefer SCRAM methods over the PLAIN method because of their superior
  properties.
- With --read-envelope-from, a Resent-From header is now used if it is present
  and appears before any From header

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/msmtp/{msmtp_1.8.25.bb => msmtp_1.8.26.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.25.bb => msmtp_1.8.26.bb} (91%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.25.bb b/meta/recipes-extended/msmtp/msmtp_1.8.26.bb
similarity index 91%
rename from meta/recipes-extended/msmtp/msmtp_1.8.25.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.26.bb
index b575fad5e1..13820fe930 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.25.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.26.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "2dfe1dbbb397d26fe0b0b6b2e9cd2efdf9d72dd42d18e70d7f363ada2652d738"
+SRC_URI[sha256sum] = "6cfc488344cef189267e60aea481f00d4c7e2a59b53c6c659c520a4d121f66d8"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.34.1


