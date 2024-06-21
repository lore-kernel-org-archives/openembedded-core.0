Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48AF3C2BA18
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 02:17:15 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.64029.1718936233782481070
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 19:17:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OYJEq9KJ;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718936233; x=1750472233;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=SDKRJ7EG7nbccvXm3vVc11FWrnFWnMRAUlclYVFa6aM=;
  b=OYJEq9KJeagNkiw9pamEGDqjXbpRr1Zpb2qRkpN0WqCfOSZbrTEBx4qx
   +X1dTm4YKiM/yQFthOSNsvvQyisJ2C+kIQyXbZa35grpUiBkojdds/cep
   dlrbhDkgDJJ5LHp8E6ZRhv6RHXDpMOLI9zXnH6NFoRPSvuvejibq6qWjI
   znHyuib4DvPX1Y2z1YQyYNUyZJCvTpfX2McmGH6HaeaXLVvdeSGZH81G9
   2FgUJ2RMKvtFzdlNYALI71+u41zt5Vmakxn5DPYVzhvRDB/QwakHiI9m+
   v3qj4pehJMNkOmrThw3L2nb26G36/tMumwyX8KL8jNO00jOYY2TrExlHX
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="143508257"
X-IronPort-AV: E=Sophos;i="6.08,253,1712588400"; 
   d="scan'208";a="143508257"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 11:17:10 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D99CBD9224
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:08 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 24BC9D7296
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A05FAE5185
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 512531A0002;
	Fri, 21 Jun 2024 10:17:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/22] alsa-plugins: upgrade 1.2.7.1 -> 1.2.12
Date: Fri, 21 Jun 2024 10:16:26 +0800
Message-Id: <1718936206-8080-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
References: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28468.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28468.003
X-TMASE-Result: 10--0.701500-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yUIIxwDaU5mrSV3lGyX22Zffc2Xd6VJ+ygyf
	XeYFOVFH0JBo+IVTgnESuJRtSU84o+CnSW1s2x7bzYK5U+QI3O43l2plwgrtWDBwx50fHFECIUt
	KH5AJM9ki+t+0AiFaYsrbguuTTSDuTBhdFGvbKaeVUcz8XpiS9AT2OEnoCt48rSPg4ph0OIIou9
	3QjOaftd3BOg2Ew0Gz7yPb9ClzPjzOtS99eBvZ8DsKXyzHgcEbojQrbrPpzzpjBPNXvTQQwqPFj
	JEFr+olX8emX/Nw6OXpaGIM46J67MZW5ai5WKlyQZ1EpNbsYrToylmegJpgMLcbLJGNjKASVcwz
	foPvCCn/A3+JqCWwjZirIJG/hbqAoEDoY/9ass5kSRrWZzFfLwnb3Hne8pvY/r/b+dmSKFo6AH9
	/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 02:17:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200969

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 disable -ldl check for *BSDs, find <soundcard.h> path

0001-arcam_av.c-Include-missing-string.h.patch
removed since it's included in 1.2.12

License-Update: samplerate: Make LGPL-only

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-arcam_av.c-Include-missing-string.h.patch | 25 -------------------
 ...gins_1.2.7.1.bb => alsa-plugins_1.2.12.bb} |  8 +++---
 2 files changed, 3 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-plugins/0001-arcam_av.c-Include-missing-string.h.patch
 rename meta/recipes-multimedia/alsa/{alsa-plugins_1.2.7.1.bb => alsa-plugins_1.2.12.bb} (97%)

diff --git a/meta/recipes-multimedia/alsa/alsa-plugins/0001-arcam_av.c-Include-missing-string.h.patch b/meta/recipes-multimedia/alsa/alsa-plugins/0001-arcam_av.c-Include-missing-string.h.patch
deleted file mode 100644
index ff7745d637..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-plugins/0001-arcam_av.c-Include-missing-string.h.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From b01b176a665ba65979d74922955f51dc4888a713 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 23 Aug 2022 15:21:16 -0700
-Subject: [PATCH] arcam_av.c: Include missing string.h
-
-bzero() function needs this header to be included
-
-Upstream-Status: Submitted [https://github.com/alsa-project/alsa-plugins/pull/47]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- arcam-av/arcam_av.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/arcam-av/arcam_av.c b/arcam-av/arcam_av.c
-index 63f9b4e..29fc537 100644
---- a/arcam-av/arcam_av.c
-+++ b/arcam-av/arcam_av.c
-@@ -27,6 +27,7 @@
- #include <signal.h>
- #include <stddef.h>
- #include <stdio.h>
-+#include <string.h>
- #include <termios.h>
- #include <unistd.h>
- 
diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.7.1.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.12.bb
similarity index 97%
rename from meta/recipes-multimedia/alsa/alsa-plugins_1.2.7.1.bb
rename to meta/recipes-multimedia/alsa/alsa-plugins_1.2.12.bb
index 9500462d5c..819cdf8e7b 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.7.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.12.bb
@@ -19,13 +19,11 @@ LICENSE = "LGPL-2.1-only & GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     file://COPYING.GPL;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://m4/attributes.m4;endline=33;md5=bb8c6b2a67ac15156961e242fec33e50 \
-                    file://rate/rate_samplerate.c;endline=35;md5=fd77bce85f4a338c0e8ab18430b69fae \
+                    file://rate/rate_samplerate.c;endline=35;md5=07fcfc9e83a7159ad14a7196ecdc7d48 \
                     "
 
-SRC_URI = "https://www.alsa-project.org/files/pub/plugins/${BP}.tar.bz2 \
-           file://0001-arcam_av.c-Include-missing-string.h.patch \
-           "
-SRC_URI[sha256sum] = "8c337814954bb7c167456733a6046142a2931f12eccba3ec2a4ae618a3432511"
+SRC_URI = "https://www.alsa-project.org/files/pub/plugins/${BP}.tar.bz2"
+SRC_URI[sha256sum] = "7bd8a83d304e8e2d86a25895d8dcb0ef0245a8df32e271959cdbdc6af39b66f2"
 
 DEPENDS += "alsa-lib"
 
-- 
2.34.1


