Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF82D41D7E
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:25:15 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.82720.1731403501519628021
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gG2g7ZOZ;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403509; x=1762939509;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=P0OEtFbDqyctvtzxI5gHX4qU6Gv2jYHi9A61qyLF98I=;
  b=gG2g7ZOZduucUuF++5GVTQP7poLzaBr8QgGxgfTvUYJvwRFPV5kjaeGJ
   0nZUSwB42lG6kfYxsbgFVwO9xBP85v348SlB1Y79K1xGq4Ji2cpqpyjFR
   F05CV/qeFaCnTGHHbPaPGlJ6pHN6n+5NX5F0ppEyXhUfqIXWkKl7WuoqC
   8klg4WOpe3jiS8n0Mwvh+VQpnysK64XdT37iz8H0nOZN2y8MFm6KrB8F3
   uqTfd1QcgVwHRZx71HqvCfQ2feRn9RKdk41IIFqfCwWjW5I7TVZfl7sKZ
   RHV/xkjWYjArXz+R5+oGWrCGFFRIIGZtv8zvTe04V/O8yGh4Zw+mBWYfk
   Q==;
X-CSE-ConnectionGUID: ERzJeR1aSHemabU2acI+9A==
X-CSE-MsgGUID: rOfWHvA/R4yrgGUDxDoRNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="158940843"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="158940843"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:08 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id AA974D500F
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:06 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4142729FA0
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D093B34796
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:05 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 805FC1A000A;
	Tue, 12 Nov 2024 17:25:05 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 16/47] librepo: upgrade 1.18.1 -> 1.19.0
Date: Tue, 12 Nov 2024 17:24:12 +0800
Message-Id: <1731403483-21399-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10--0.591400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyswAYdq1VTXo9E+
	RmFtCk0B4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat0542PK/53RnQ7FZx2
	5js+HUUPi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFAhPJEXC2fgfbdvdZhkHRUAaLN
	fGVB/pFUW3Rptjh97dsrr0yjoq+806wL4ww5eDXzictLeVKXpx1b/c0NtTC5M7gv02ehhC8ux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206999

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix input termination for pgpParsePkts
- Introduce entropy for fastestmirror option
- Fix upper case xattr incompatible to Amazon S3

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../librepo/{librepo_1.18.1.bb => librepo_1.19.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/librepo/{librepo_1.18.1.bb => librepo_1.19.0.bb} (94%)

diff --git a/meta/recipes-devtools/librepo/librepo_1.18.1.bb b/meta/recipes-devtools/librepo/librepo_1.19.0.bb
similarity index 94%
rename from meta/recipes-devtools/librepo/librepo_1.18.1.bb
rename to meta/recipes-devtools/librepo/librepo_1.19.0.bb
index b3bd2812dd..634967fcbc 100644
--- a/meta/recipes-devtools/librepo/librepo_1.18.1.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.19.0.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;pr
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "9f186ad20936811ba515c5f0345ccc71603459a3"
+SRCREV = "7955987e33ba98dddb3fc2c63bb6dc892e3505fa"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


