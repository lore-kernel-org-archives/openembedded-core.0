Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19292CD12A3
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 07:10:58 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.130218.1712646651456928089
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XfkdLkP4;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1712646651; x=1744182651;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pQUr5Fo2bTEYridZ/3RFGp/SuRObF0NHiGD4E/vHPRE=;
  b=XfkdLkP4QvkQDOSCZuV4Znb795fF66gvW1LiD/PZTKxNOVF9mxSPdNrP
   X144v9yMl3PHZWwzVWm1FJn65eHh+r7dgzk0NzoZpbfMXY/FJzLcST4Bd
   fZUzko8zgzo4GM2wkzi56sZDMPaFFWrvDXPWsmoeoUAYOjoHvoyvEagUR
   rfSwySrl6y8loygesjoMCJWGD6rvxXvkkUClQ+N5Ie/4CavYPiUKMpGws
   U5Lm4yaqymktOcgH5TNVOyA2gkS6/cu4259pVw3ud10jWJ7edS1v9As37
   SNT2IDllGDCEnx8QXadZ21qe4wdT63UTT7UXx19sTJMRqBi8jZ/7k4z3f
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="155014166"
X-IronPort-AV: E=Sophos;i="6.07,188,1708354800"; 
   d="scan'208";a="155014166"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:10:49 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 58712DCC00
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:47 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4B714D5D0D
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D0BCA20093260
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7F3D81A0002;
	Tue,  9 Apr 2024 15:10:45 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 22/33] mtdev: upgrade 1.1.6 -> 1.1.7
Date: Tue,  9 Apr 2024 15:10:09 +0800
Message-Id: <1712646620-16608-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28306.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28306.006
X-TMASE-Result: 10-1.602900-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mra9qiaDSLgo14YeSlHZYFosWC
	LeeL2Ypg4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16u0p9
	DaZRzoN2ou9R/jXkQwHk48PxckV+kHxPMjOKY7A9wK7mZ44aKbi8z+bJ2nm9UKrauXd3MZDXtbO
	tq4+YAAE1K+AG864RZ1kb6sZZFGGqxVoj21MHqghUa/27XjipN45ntlQ4pilrsW+wf7o1izv3tG
	R2gJDolRBrRVHURo+1jgo81taOvxFPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 07:10:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198039

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
-test: link using libmtdev.la
-Fix test warnings

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wayland/{mtdev_1.1.6.bb => mtdev_1.1.7.bb}                 | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{mtdev_1.1.6.bb => mtdev_1.1.7.bb} (80%)

diff --git a/meta/recipes-graphics/wayland/mtdev_1.1.6.bb b/meta/recipes-graphics/wayland/mtdev_1.1.7.bb
similarity index 80%
rename from meta/recipes-graphics/wayland/mtdev_1.1.6.bb
rename to meta/recipes-graphics/wayland/mtdev_1.1.7.bb
index 7c1cb5e4ec..24803c4238 100644
--- a/meta/recipes-graphics/wayland/mtdev_1.1.6.bb
+++ b/meta/recipes-graphics/wayland/mtdev_1.1.7.bb
@@ -12,7 +12,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ea6bd0268bb0fcd6b27698616ceee5d6"
 
 SRC_URI = "http://bitmath.org/code/${BPN}/${BP}.tar.bz2"
-SRC_URI[md5sum] = "bf8ef2482e84a00b5db8fbd3ce00e249"
-SRC_URI[sha256sum] = "15d7b28da8ac71d8bc8c9287c2045fd174267bc740bec10cfda332dc1204e0e0"
+SRC_URI[sha256sum] = "a107adad2101fecac54ac7f9f0e0a0dd155d954193da55c2340c97f2ff1d814e"
 
 inherit autotools pkgconfig
-- 
2.34.1


