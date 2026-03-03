Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65BEBEC0491
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 10:09:57 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14941.1772532590284588399
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 02:09:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MqBd8Y1a;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772532593; x=1804068593;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yJwS7yshTffSuDhG9C7moN6MpEEn6Hq648JcT58xfSs=;
  b=MqBd8Y1aUQLFJ+3Wz1g2tT/YiWGrCbAApM5i72dgfUM9jz/AI+StoFVD
   CLdkXD1V7i78IFscXVxd9jVnLiDZJn0zqPifqHLRfqrniGcA6mb8S1Z+v
   S+UFJ+iS45bviocVs7a30qGYHRXuNTsBfkqvm5LL0J9xuSSr6zHcZFUdW
   n72KQD8pqmV88jJAeGMtPisWmJqJ1smQhLB44WFR6VTDpIa5/N2Ynwx/Q
   /LG2wEKDWfoaYzQvyoTlPCzT09W/nBBgwKmYM4gOExKBs9fnx/kN8dpJ1
   uFen5uHz2ry/XHRgka9JXHz06uQY4D59V5s//peJAVrcDlovKGdmFrsRx
   g==;
X-CSE-ConnectionGUID: 4x2suFa3Sve0jL/SEX+d6w==
X-CSE-MsgGUID: vZz/LyzcSC2xj3YZiReLyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="219676201"
X-IronPort-AV: E=Sophos;i="6.21,321,1763391600"; 
   d="scan'208";a="219676201"
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 46D38407579
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:09:54 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E66A7C0219C
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:09:53 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 3C7931001CE9;
	Tue,  3 Mar 2026 10:09:50 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/23] less: upgrade 691 -> 692
Date: Tue,  3 Mar 2026 18:09:12 +0800
Message-ID: <20260303100929.1624-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260303100929.1624-1-wangmy@fujitsu.com>
References: <20260303100929.1624-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 10:09:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232283

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Revert HOME key to scroll to beginning of file and END key to scroll to end of file
- Configure tty to leave CR and NL unmodified
- Add commands to lesskey parser (forw-bell-hilite, goto-pos and osc8-jump).
- Add key sequences to lesskey parser (\kE, \kF, \kH, \kI, \kM, and \kS).
- Fix bug using negative value with -z option
- Fix bug handling empty terminfo capabilties
- Fix memory leak in setupterm
- Make lesstest ignore system locale (nl_langinfo)

License-Update: Copyright year updated to 2026.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/less/{less_691.bb => less_692.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/less/{less_691.bb => less_692.bb} (91%)

diff --git a/meta/recipes-extended/less/less_691.bb b/meta/recipes-extended/less/less_692.bb
similarity index 91%
rename from meta/recipes-extended/less/less_691.bb
rename to meta/recipes-extended/less/less_692.bb
index 8354dc4486..6f621905a0 100644
--- a/meta/recipes-extended/less/less_691.bb
+++ b/meta/recipes-extended/less/less_692.bb
@@ -21,7 +21,7 @@ SECTION = "console/utils"
 
 LICENSE = "GPL-3.0-or-later | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
-                    file://LICENSE;md5=8051a271adb36d1462531a3b40c22878 \
+                    file://LICENSE;md5=bee5763a5e2bccdcdbd9bfe982ffc82b \
                     "
 DEPENDS = "ncurses"
 
@@ -29,7 +29,7 @@ SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "88b480eda1bb4f92009f7968b23189eaf1329211f5a3515869e133d286154d25"
+SRC_URI[sha256sum] = "61300f603798ecf1d7786570789f0ff3f5a1acf075a6fb9f756837d166e37d14"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.43.0


