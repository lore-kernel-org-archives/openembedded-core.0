Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E96C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 02:01:40 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.2238.1742263292044874481
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 19:01:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UizvHzGS;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742263292; x=1773799292;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+4PVrNgQUMPcxgiqzwHIadghESBYQYPxhO8M/6TaqgQ=;
  b=UizvHzGS5u/RMEOK/bEPYP65ulRoS4hXFry6T1/XdmrRg9ijiYfkvvQU
   fGaLPnWcqDI/zTAP2dQTPNpPBVwD0iOASd92Y6p7Uy5LNH7wDR4Nv0q4l
   tuPBbVolLbZju601YvUmzPc6TCqS2mGtmkvgBT9C8i/gAGj0zU9SdLymW
   H9MFcoBuC8EXVy8IImigwgu5DStNh9bvXlj9s14ijQ2BqUIf4nxAtNypx
   9/cTUJwaDttL4E7wWGE6A0Ke/rfAT1YGYHIGB5GnePaTcnZnNm3gbgY/I
   ENHD7cF+wONI31kNKhI2FgX/4U1fV3QEvK9wsFhyBWHAoR+UEA1waFSjl
   w==;
X-CSE-ConnectionGUID: 6ZcET3LLTRuRSidjoDVoLg==
X-CSE-MsgGUID: jcp4roXmRQiU7Dp3uaEobQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="193453288"
X-IronPort-AV: E=Sophos;i="6.14,255,1736780400"; 
   d="scan'208";a="193453288"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 11:01:30 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0759BE8525
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 11:01:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id BC2CD1043F
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 11:01:26 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F34981A00A1;
	Tue, 18 Mar 2025 10:01:25 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-Core] [PATCH v2] kea: fix conflict between kea-dhcp6 multilibs
Date: Tue, 18 Mar 2025 10:01:04 +0800
Message-Id: <20250318020104.1864-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250317014144.2113-1-maxj.fnst@fujitsu.com>
References: <20250317014144.2113-1-maxj.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 02:01:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213131

There are conflict of config files between kea and lib32-kea:
  | Error: Transaction test error:
  | file /etc/kea/kea-dhcp6.conf conflicts between attempted installs of lib32-kea-2.6.1-r0.core2_32 and kea-2.6.      1-r0.core2_64

Similar to:
  | 8cc65e7eb0 kea: fix conflict between multilibs

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 .../kea/files/fix-multilib-conflict.patch     | 28 ++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
index 5b135b3aee..763639327a 100644
--- a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
+++ b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
@@ -8,17 +8,21 @@ Subject: [PATCH] There are conflict of config files between kea and lib32-kea:
      lib32-kea-1.7.10-r0.core2_32 and kea-1.7.10-r0.core2_64
 |  file /etc/kea/kea-dhcp4.conf conflicts between attempted installs of
      lib32-kea-1.7.10-r0.core2_32 and kea-1.7.10-r0.core2_64
+|  file /etc/kea/kea-dhcp6.conf conflicts between attempted installs of
+     lib32-kea-2.6.1-r0.core2_32 and kea-2.6.1-r0.core2_64
 
 Because they are all commented out, replace the expanded libdir path with
 '$libdir' in the config files to avoid conflict.
 
 Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/issues/2602]
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
 
 ---
  src/bin/keactrl/kea-ctrl-agent.conf.pre | 3 ++-
  src/bin/keactrl/kea-dhcp4.conf.pre      | 4 ++--
- 2 files changed, 4 insertions(+), 3 deletions(-)
+ src/bin/keactrl/kea-dhcp6.conf.pre      | 4 ++--
+ 3 files changed, 6 insertions(+), 5 deletions(-)
 
 diff --git a/src/bin/keactrl/kea-ctrl-agent.conf.pre b/src/bin/keactrl/kea-ctrl-agent.conf.pre
 index e6ae8b8..50a3092 100644
@@ -56,3 +60,25 @@ index 6edb8a1..b2a7385 100644
      //       "parameters": {
      //           "identifier-expression": "relay4[2].hex"
      //       }
+diff --git a/src/bin/keactrl/kea-dhcp6.conf.pre b/src/bin/keactrl/kea-dhcp6.conf.pre
+index 271021b..5b85854 100644
+--- a/src/bin/keactrl/kea-dhcp6.conf.pre
++++ b/src/bin/keactrl/kea-dhcp6.conf.pre
+@@ -201,7 +201,7 @@
+     //       // of all devices serviced by Kea, including their identifiers
+     //       // (like MAC address), their location in the network, times
+     //       // when they were active etc.
+-    //       "library": "@libdir@/kea/hooks/libdhcp_legal_log.so",
++    //       "library": "$libdir/kea/hooks/libdhcp_legal_log.so",
+     //       "parameters": {
+     //           "path": "/var/lib/kea",
+     //           "base-name": "kea-forensic6"
+@@ -218,7 +218,7 @@
+     //       // of specific options or perhaps even a combination of several
+     //       // options and fields to uniquely identify a client. Those scenarios
+     //       // are addressed by the Flexible Identifiers hook application.
+-    //       "library": "@libdir@/kea/hooks/libdhcp_flex_id.so",
++    //       "library": "$libdir/kea/hooks/libdhcp_flex_id.so",
+     //       "parameters": {
+     //           "identifier-expression": "relay6[0].option[37].hex"
+     //       }
-- 
2.43.0


