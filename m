Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B565CCD183
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 02:57:06 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.6639.1760410617233429569
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 19:56:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mUMnu0Ob;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760410617; x=1791946617;
  h=from:to:subject:date:message-id;
  bh=ZwmebLGkVQs6GvN+Y2Qi0ZjOtIpK6FIpvwiQiz8AIAM=;
  b=mUMnu0ObUEdO8eVaRz7ytpIEiOye7Q3fHktQDk/BQAJ47TdTsyAJLbHK
   cGY6T9Ur/zS79OVZqnH/dRR4zYE1G5gIL9/azm9kr4iNufs+oVfRDR69C
   vDXGqv7Hsox4XXew5APPoFpgG6YwM4Eli8DkP+JPG9l8W42T9/c5WFv6O
   j37jWC8iVcYVmH67pQI120B5CIqv1PE5WVTzflWm+FVqoBHOISlV4uoHR
   fvRFIsnV3xjDpJlusMDu2ADd10f4T9czpwWuFNPfGKXbCRDhpsT9BatCT
   b8SdhNtLixMXTe6xQHt+x2emaHPTKS3pqemaNXJmzU8PmRohQAbHibQ6S
   Q==;
X-CSE-ConnectionGUID: VDmaHUf1SiqiqkMlOiNrSg==
X-CSE-MsgGUID: I8W6Ok0aRzS/jZlccVbypg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="194671849"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="194671849"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 11:56:55 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 39B231000344
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 02:56:55 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E5747C00232
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 02:56:54 +0000 (UTC)
Received: from zhengrq-VirtualBox.fnst-internet.local (unknown [10.193.135.3])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 089C1101BB58
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 02:56:52 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] [OE-core] kea: fix conflict between kea-dhcp4 and kea-dhcp6 multilibs
Date: Tue, 14 Oct 2025 10:56:39 +0800
Message-Id: <20251014025639.5114-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 02:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224803

There are conflict of config files between kea and lib32-kea:
  | Error: Transaction test error:
  | file /etc/kea/kea-dhcp4.conf conflicts between attempted installs of lib32-kea-3.0.1-r0.core2_32 and kea-3.0.1-r0.x86_64_v3
  | file /etc/kea/kea-dhcp6.conf conflicts between attempted installs of lib32-kea-3.0.1-r0.core2_32 and kea-3.0.1-r0.x86_64_v3

Update this patch after kea was upgraded to 3.0.1.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../kea/files/fix-multilib-conflict.patch     | 47 ++++++++++++++-----
 1 file changed, 36 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
index 9e1f28b560..4bfcf49391 100644
--- a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
+++ b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
@@ -1,7 +1,8 @@
-From 06ebd1b2ced426c420ed162980eca194f9f918ae Mon Sep 17 00:00:00 2001
-From: Kai Kang <kai.kang@windriver.com>
-Date: Tue, 22 Sep 2020 15:02:33 +0800
-Subject: [PATCH] There are conflict of config files between kea and lib32-kea:
+From cdef313bd34c5abd897b80f25554b0c66737ed05 Mon Sep 17 00:00:00 2001
+From: Liu Yiding <liuyd.fnst@fujitsu.com>
+Date: Tue, 14 Oct 2025 01:37:35 +0000
+Subject: [PATCH] There are conflict of config files between
+ kea and lib32-kea:
 
 | Error: Transaction test error:
 |  file /etc/kea/kea-ctrl-agent.conf conflicts between attempted installs of
@@ -16,14 +17,15 @@ Because they are all commented out, replace the expanded libdir path with
 
 Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/issues/2602]
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
-Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
-
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
 ---
  src/bin/keactrl/kea-ctrl-agent.conf.pre | 3 ++-
- src/bin/keactrl/kea-dhcp4.conf.pre      | 4 ++--
- src/bin/keactrl/kea-dhcp6.conf.pre      | 4 ++--
- 3 files changed, 6 insertions(+), 5 deletions(-)
+ src/bin/keactrl/kea-dhcp4.conf.pre      | 6 +++---
+ src/bin/keactrl/kea-dhcp6.conf.pre      | 6 +++---
+ 3 files changed, 8 insertions(+), 7 deletions(-)
 
+diff --git a/src/bin/keactrl/kea-ctrl-agent.conf.pre b/src/bin/keactrl/kea-ctrl-agent.conf.pre
+index 29d8111..de71f41 100644
 --- a/src/bin/keactrl/kea-ctrl-agent.conf.pre
 +++ b/src/bin/keactrl/kea-ctrl-agent.conf.pre
 @@ -85,7 +85,8 @@
@@ -36,6 +38,8 @@ Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
  //      "parameters": {
  //          "param1": "foo"
  //      }
+diff --git a/src/bin/keactrl/kea-dhcp4.conf.pre b/src/bin/keactrl/kea-dhcp4.conf.pre
+index 2a58507..86b5abf 100644
 --- a/src/bin/keactrl/kea-dhcp4.conf.pre
 +++ b/src/bin/keactrl/kea-dhcp4.conf.pre
 @@ -255,7 +255,7 @@
@@ -47,7 +51,7 @@ Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
      //       "parameters": {
      //           "base-name": "kea-forensic4"
      //       }
-@@ -271,7 +271,7 @@
+@@ -271,14 +271,14 @@
      //       // of specific options or perhaps even a combination of several
      //       // options and fields to uniquely identify a client. Those scenarios
      //       // are addressed by the Flexible Identifiers hook application.
@@ -56,6 +60,16 @@ Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
      //       "parameters": {
      //           "identifier-expression": "relay4[2].hex"
      //       }
+     //   },
+     //   {
+     //       // the MySQL host backend hook library required for host storage.
+-    //       "library": "@libdir@/kea/hooks/libdhcp_mysql.so"
++    //       "library": "$libdir/kea/hooks/libdhcp_mysql.so"
+     //   }
+     // ],
+ 
+diff --git a/src/bin/keactrl/kea-dhcp6.conf.pre b/src/bin/keactrl/kea-dhcp6.conf.pre
+index c69a508..2bb488f 100644
 --- a/src/bin/keactrl/kea-dhcp6.conf.pre
 +++ b/src/bin/keactrl/kea-dhcp6.conf.pre
 @@ -201,7 +201,7 @@
@@ -67,7 +81,7 @@ Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
      //       "parameters": {
      //           "base-name": "kea-forensic6"
      //       }
-@@ -217,7 +217,7 @@
+@@ -217,14 +217,14 @@
      //       // of specific options or perhaps even a combination of several
      //       // options and fields to uniquely identify a client. Those scenarios
      //       // are addressed by the Flexible Identifiers hook application.
@@ -76,3 +90,14 @@ Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
      //       "parameters": {
      //           "identifier-expression": "relay6[0].option[37].hex"
      //       }
+     //   },
+     //   {
+     //       // the MySQL host backend hook library required for host storage.
+-    //       "library": "@libdir@/kea/hooks/libdhcp_mysql.so"
++    //       "library": "$libdir/kea/hooks/libdhcp_mysql.so"
+     //   }
+     // ],
+ 
+-- 
+2.43.0
+
-- 
2.43.0


