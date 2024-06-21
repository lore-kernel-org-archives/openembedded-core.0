Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B86C2BBCA
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 02:17:25 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.64107.1718936239658529387
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 19:17:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=C5MFfkml;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718936239; x=1750472239;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=xhVFu/v4c9zdZYO2BlUs4/dQapLXYbXRAYYaZeQdrs8=;
  b=C5MFfkmlJrP3kUEnQdmfxP0GMsZtx0EcesYunRUcX5hLFSrC7pU1cc6p
   bTKcJd2TgPHC97J0D0WS6DnOYkj/yYb4t16CCQJXjCvSnGcMrX2Yh/CCt
   s23eTygT2J2Wgxj1nykT8pDRuesP+kdXSeff/ZSjxiOWCOGGfJ9gqtmsJ
   I0JGFetNETE0skEEAPtpfc9rUsYKwy10Z9yfZkIA12oSyF3dgYJEVHQ0v
   Z0kIhTCRvMCHriW/SqdqbgWxq/TH6JgXXUov2WgGRL+pE6Dtd2WmeHy6d
   UFCISsGDjKOHBpeRNlDdTv0tlWCZtyefLuCMHveT+YCiMJ3iG2Zq2XAWU
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="152461004"
X-IronPort-AV: E=Sophos;i="6.08,253,1712588400"; 
   d="scan'208";a="152461004"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 11:17:17 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1D9FBE8D39
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:15 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5C581D7298
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E3B5EE5185
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 94B811A0002;
	Fri, 21 Jun 2024 10:17:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/22] hwlatdetect: upgrade 2.6 -> 2.7
Date: Fri, 21 Jun 2024 10:16:37 +0800
Message-Id: <1718936206-8080-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
References: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28468.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28468.003
X-TMASE-Result: 10--0.916300-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yfx0ykrbAxjCRzUPAqhCjtiMJxigKCCiS78F
	Hrw7frluf146W0iUu2v8LO5wKi8YUlWcCzOjQR80aDCzqDR7DPZ9LQinZ4QefCP/VFuTOXUT3n8
	eBZjGmUzkwjHXXC/4I8ZW5ai5WKly2CI9Xeu/1KuOVolhUUMxnwjmaOLCk7Q0mgDsCkqs4SB9kP
	YzxaFtvYjlECp9pX+UoWWEPzyNfHAR8wd5sX3w/W/S1Qyp9IJG/r/b+dmSKFo6AH9/PcRd1xUpP
	R4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 02:17:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200976

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-rt/rt-tests/rt-tests.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 70315c4694..3fbdfa2038 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,5 +1,5 @@
-SRCREV = "217cd8518c5f7777d490892aa9c765a6b2782cb5"
-PV = "2.6"
+SRCREV = "5bd94923ffda2ab326d081926dbfc6775fb5050b"
+PV = "2.7"
 PE = "1"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=main;protocol=https"
-- 
2.34.1


