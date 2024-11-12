Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 094ECD3ABF4
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:25:36 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.82431.1731403533470941677
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cb10q+rn;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403535; x=1762939535;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=73ZtJO0shn9n/j5WnKcdyV3tDWeqc26CNmr/xdA1g1g=;
  b=cb10q+rnzjpybow2MNKdM9lgwUZ4UdQbSNwr6ERFjXvX0J39PWGScYFW
   pByh9TUOfg6OMD3GR/B42JVazkz2KsIkvfSSwSFRIaE3TmgjYJPo+Ksu6
   m1OCNMup81tCeA+G2YPEva5ICemb6M4XeEXtbunehHAO7W7XGNMMeM+P5
   Fgu0PXpkokHKvcx2pxHOocZ7PUk0aJQ2JAW4bjzgiB+6XukFMp8/7oodS
   l4W9N4A388EvqYRxRNrYXxchpaK+JevrJQQCNjcn2EXpYxzwuJOEHN5TX
   ArO5nslB1mJFLKT4on95l0zOqye4iCx0lWQNRdwZ1zM5QZJQo4B47ei60
   Q==;
X-CSE-ConnectionGUID: B8ykf0J3TTKK4S8jjPQzwQ==
X-CSE-MsgGUID: rELDx8rxQ02JWc9r/k4WLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="180062626"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="180062626"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:32 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6CB5FD647A
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:29 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id ECF87D5062
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7539120071A35
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 24FE61A000A;
	Tue, 12 Nov 2024 17:25:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 24/47] mmc-utils: upgrade to latest revision
Date: Tue, 12 Nov 2024 17:24:20 +0800
Message-Id: <1731403483-21399-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10-1.371100-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkoGJI46UKmS/fLeH1FBnhK0wTlc9CcHMZerwqxtE531VL6p
	xbTOjavyHQPFz2EMgFAGFBbDeVn4hZcFdomgH0lnFEUknJ/kEl5jFT88f69nG/oLR4+zsDTtjoc
	zmuoPCq0dOW0+bpHEuJoC3k8FF+BolhAGQIivtFzuut9L8Z20aKTXlFtb5+ZjPGGyVgbCR/aRiC
	xPi0dKLKQ3UAun1mP0LTEb7/ukI1wdJuEZuYbKVcUkrvIudlEZl07dDrsiYvyCLhFTP3QRDAbYw
	Clu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:25:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207011

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 94015d6f83..7bf21a1fe2 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "123fd8b2ac3933be1319486fb1f32236a4a86a7c"
+SRCREV = "523d8f3cfb219d800f45860892e742e3a355f1bb"
 
 PV = "0.1+git"
 
-- 
2.34.1


