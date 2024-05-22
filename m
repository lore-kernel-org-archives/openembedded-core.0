Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C14C2BA12
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:16:02 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.5638.1716369328359877289
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Wt3lRcau;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369333; x=1747905333;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Nsrnp86O/LIIIfwm5/EF2viLe+iZYe0jbulTVp6yPlE=;
  b=Wt3lRcauGd75qDJkFqkX52c+e/tj/7NajSnI6whKqfC+bVQR79xKgynJ
   tnQksewCCKYz3N6EYF3fHg0JKth5nEZ99gr2R7pA4LwSDKVo4NjdPJeq2
   9DeQPo88XhiHMra8Z73M+n0qBTl17jsX+KyogSyt/5EpNjgid1yvk4Rf3
   4UaUQai5t+VtQLO11v8J29WqTWVeggUWH9dieH6spqGhDeA+gktT6FFUV
   VVFd3opiysGGBkffZVvpErjjDoFqzj5cwXimB+cEs8n0xNUYtJ1+zTpUD
   kwu02/CT5rV3ozsD8auoha+1YcxBzPGSTlOvHfRuak/dS3i1bRPLrt9Nq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="147064681"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="147064681"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:32 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7354BCD6E7
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:30 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id AE480D5A18
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 446D121CB3A
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E2F5A1A000B;
	Wed, 22 May 2024 17:15:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 21/42] libslirp: upgrade 4.7.0 -> 4.8.0
Date: Wed, 22 May 2024 17:14:28 +0800
Message-Id: <1716369289-22526-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10-1.065900-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yfx0ykrbAxjCRzUPAqhCjtjAuQ0xDMaXkH4q
	tYI9sRE/KqrQ7lLcMnwGFBbDeVn4ha7Kv+wYXRsgb056mCmF00ZV4BnlVId1nZsoi2XrUn/J8m+
	hzBStansUGm4zriL0oQtuKBGekqUpnH7sbImOEBSahRg8m2MGfZEeGanFvvXxFZ2uq69MYC5B6F
	RaTWSpM+BSWc2flAIfsI8jdcbhzGewacOicCSyduZh/B9JNx7rD+/p4tNhVAPsfZ9V6Q6rCZgvU
	oiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199715

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-connectivity/slirp/libslirp_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/slirp/libslirp_git.bb b/meta/recipes-connectivity/slirp/libslirp_git.bb
index 334b786b9b..05830ce833 100644
--- a/meta/recipes-connectivity/slirp/libslirp_git.bb
+++ b/meta/recipes-connectivity/slirp/libslirp_git.bb
@@ -5,8 +5,8 @@ LICENSE = "BSD-3-Clause & MIT"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bca0186b14e6b05e338e729f106db727"
 
 SRC_URI = "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master"
-SRCREV = "3ad1710a96678fe79066b1469cead4058713a1d9"
-PV = "4.7.0"
+SRCREV = "ce314e39458223c2c42245fe536fbe1bcd94e9b1"
+PV = "4.8.0"
 S = "${WORKDIR}/git"
 
 DEPENDS = " \
-- 
2.34.1


