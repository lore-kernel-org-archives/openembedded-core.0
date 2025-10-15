Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC20CCD18E
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 02:13:59 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.6373.1760494433045114438
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 19:13:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CoBw4M62;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760494434; x=1792030434;
  h=from:to:subject:date:message-id;
  bh=7HNyk5i0Z8BD5RdTVUHEUKXDK4UR3YjCUJxe7yh+mRI=;
  b=CoBw4M625leRkLQ2zWJqfGVLqLGQq0w8ECiR9/H55bPe/dPov/0W94YS
   FBNaYWSq5XicgG3HT3Sd1nWDDQtYTn1NGWVVQZGXrnOL8H22qsOLGYIXK
   JmETA0eZOUbAvp8DE/t8X6f0K+P09v1XJMsSgmldBtKoOBQsgGSFGDSz8
   u5mQhRmmYod9u50aGdmFxaq407fVRFv6r6E4nnOxaXfXd54+acgklm1Fy
   XiTYfJvBI7yZLVAuEoVJJKIVMCjOBQXkgBf2/Pe2VaCknncknnX31RGYS
   W9usjvPRoMj2clfls4vyoXLTnaUJ8lrZdLep0cMM8rI0o7apS8hSkIp4s
   w==;
X-CSE-ConnectionGUID: kWsYctXYQW6zQ+xq/fR7qQ==
X-CSE-MsgGUID: 1bTz+WWqRAOUO5pTxkIBiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="215957025"
X-IronPort-AV: E=Sophos;i="6.19,229,1754924400"; 
   d="scan'208";a="215957025"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 11:13:52 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 1463A1403
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 02:13:51 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id C5705100044D
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 02:13:50 +0000 (UTC)
Received: from zhengrq-VirtualBox.fnst-internet.local (unknown [10.193.135.3])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id E208E14001E6
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 02:13:48 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] kea: fix conflict between kea-dhcp4 and kea-dhcp6 multilibs
Date: Wed, 15 Oct 2025 10:13:36 +0800
Message-Id: <20251015021336.10550-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 02:13:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224871

There are conflict of config files between kea and lib32-kea:
  | Error: Transaction test error:
  | file /etc/kea/kea-dhcp4.conf conflicts between attempted installs of lib32-kea-3.0.1-r0.core2_32 and kea-3.0.1-r0.x86_64_v3
  | file /etc/kea/kea-dhcp6.conf conflicts between attempted installs of lib32-kea-3.0.1-r0.core2_32 and kea-3.0.1-r0.x86_64_v3

Update this patch after kea was upgraded to 3.0.1.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../kea/files/fix-multilib-conflict.patch     | 44 +++++++++++++++----
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
index 9e1f28b560..68a566773a 100644
--- a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
+++ b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
@@ -1,7 +1,8 @@
-From 06ebd1b2ced426c420ed162980eca194f9f918ae Mon Sep 17 00:00:00 2001
+From cdef313bd34c5abd897b80f25554b0c66737ed05 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
-Date: Tue, 22 Sep 2020 15:02:33 +0800
-Subject: [PATCH] There are conflict of config files between kea and lib32-kea:
+Date: Tue, 14 Oct 2025 01:37:35 +0000
+Subject: [PATCH] There are conflict of config files between
+ kea and lib32-kea:
 
 | Error: Transaction test error:
 |  file /etc/kea/kea-ctrl-agent.conf conflicts between attempted installs of
@@ -17,13 +18,15 @@ Because they are all commented out, replace the expanded libdir path with
 Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/issues/2602]
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
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
@@ -36,6 +39,8 @@ Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
  //      "parameters": {
  //          "param1": "foo"
  //      }
+diff --git a/src/bin/keactrl/kea-dhcp4.conf.pre b/src/bin/keactrl/kea-dhcp4.conf.pre
+index 2a58507..86b5abf 100644
 --- a/src/bin/keactrl/kea-dhcp4.conf.pre
 +++ b/src/bin/keactrl/kea-dhcp4.conf.pre
 @@ -255,7 +255,7 @@
@@ -47,7 +52,7 @@ Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
      //       "parameters": {
      //           "base-name": "kea-forensic4"
      //       }
-@@ -271,7 +271,7 @@
+@@ -271,14 +271,14 @@
      //       // of specific options or perhaps even a combination of several
      //       // options and fields to uniquely identify a client. Those scenarios
      //       // are addressed by the Flexible Identifiers hook application.
@@ -56,6 +61,16 @@ Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
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
@@ -67,7 +82,7 @@ Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
      //       "parameters": {
      //           "base-name": "kea-forensic6"
      //       }
-@@ -217,7 +217,7 @@
+@@ -217,14 +217,14 @@
      //       // of specific options or perhaps even a combination of several
      //       // options and fields to uniquely identify a client. Those scenarios
      //       // are addressed by the Flexible Identifiers hook application.
@@ -76,3 +91,14 @@ Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
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


