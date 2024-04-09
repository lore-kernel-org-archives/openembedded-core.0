Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 100A0CD129C
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 07:10:47 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.130847.1712646636313859235
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:10:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=c+62X99k;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1712646639; x=1744182639;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=WluoEGRSB85t2RxKkghm+a7xsKM1QXucIDiIH5fhuq8=;
  b=c+62X99k/rnF51cnCwR8HpCQI6il7SKif7pp8kM0lSJ9TxpkhuJQiDNX
   fXD15Ay1EmVAqlSKoBzRHEFzuEANRCvVMx+Lc2Vw6YKJdZv7+na2duYDX
   VpkvFyrYZZWeRVRQPZvuPrqxCmGCm4554DkIW68kbWQtkE+pFam0hzJBT
   2kggvL9DNovyZ+HJTkLt6dwM6ZX3hHayr6zfprRnu5rZw3WmxI7JimtkT
   O6hT/jtjNM91/bBHU4OG2ilWqM6bjlmiYP5vYx+qj3SBt85FGOltQELWy
   p4WkKI2riYMAC70xBP/AfTHsAyw4I8PJYo+g4B0qVw8gLa8H86C4CGypB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="133820339"
X-IronPort-AV: E=Sophos;i="6.07,188,1708354800"; 
   d="scan'208";a="133820339"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:10:38 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D57FE2A2353
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:35 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 144EBEA0B0
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9778C20093260
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4655A1A0002;
	Tue,  9 Apr 2024 15:10:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/33] dnf: upgrade 4.19.0 -> 4.19.2
Date: Tue,  9 Apr 2024 15:09:52 +0800
Message-Id: <1712646620-16608-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28306.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28306.006
X-TMASE-Result: 10--5.521500-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mr/1vXbkGjWeWAI7Mvq/sL5+79
	DJRUi35poiRiRqJbjhYBXdtZPWfJ2i/7QU2czuUNA9lly13c/gEQtuqs6BbPJ6lOQjQcrzOlfSa
	aVTZG9Su3cjl8ldLv7G6J2k+mxn+fYwDOL7t3RyFvTnqYKYXTRn0tCKdnhB58I/9UW5M5dRM+8F
	JNGdxYq46HM5rqDwqtoEXe2HYcoX1C/BH4NRdLRI96wyiN2u9vAQk77Z+1fSTug7DbT/gz6A==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 07:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198023

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Bump libdnf version to 0.73.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/dnf/{dnf_4.19.0.bb => dnf_4.19.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dnf/{dnf_4.19.0.bb => dnf_4.19.2.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf_4.19.0.bb b/meta/recipes-devtools/dnf/dnf_4.19.2.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.19.0.bb
rename to meta/recipes-devtools/dnf/dnf_4.19.2.bb
index 184dbea963..cc91dbe400 100644
--- a/meta/recipes-devtools/dnf/dnf_4.19.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.19.2.bb
@@ -20,7 +20,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
 
 SRC_URI:append:class-native = "file://0001-dnf-write-the-log-lock-to-root.patch"
 
-SRCREV = "566a61f9d8a2830ac6dcc3a94c59224cef1c3d03"
+SRCREV = "9b2b2e8ddab99caba4bc8059cab4263163172e81"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


