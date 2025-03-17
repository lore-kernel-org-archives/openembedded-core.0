Return-Path: <maxj.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FD9C28B2F
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 01:41:55 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.42702.1742175711238490120
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 18:41:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LNMu9UuH;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: maxj.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742175711; x=1773711711;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+OEKZRfDDmWvxGSmkxKPYdr2IeP63I0XUVQBsod9Zgc=;
  b=LNMu9UuH5qRAbM1z+Ez6BOT4VBeJ4aJdYVt+Mk4eCIBAk+S3f6Nu9hwg
   WYM5Is+POdly1ffzg0EWl6M+k/04JDe0wRPvDzESt8i9beBosDwCcU/nF
   w6hpJpYruQpWiezOuWM0dGGIVzzu/q38MQWKPFNbwGxkNjcb5Upxlv1X/
   b7jqI9+L2oqrxeO00gA7pnH3YlNwbICmOPOkhuRcnzI2DlLWw2oEsmOaQ
   /y04vFQ1krkLq8k46PoCpHZGutg9U/NK8LT/78GGrtUoMYXQynX4YUDp4
   sannL0yo+EpTqm32lChDdGHAiAymPzfZTn+Eyj3TWxIU/RGEzQoboxlNt
   Q==;
X-CSE-ConnectionGUID: 0C2F0LQ0QTqh/B0hcfmkaQ==
X-CSE-MsgGUID: gW8kw5m0Q86lZytJxNwKlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="193577513"
X-IronPort-AV: E=Sophos;i="6.14,252,1736780400"; 
   d="scan'208";a="193577513"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 10:41:48 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 517AAE9EF9
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 10:41:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 14005D5018
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 10:41:46 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9CFB21A009A
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 09:41:45 +0800 (CST)
From: Ma Xinjian <maxj.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] kea: fix conflict between multilibs
Date: Mon, 17 Mar 2025 09:41:44 +0800
Message-Id: <20250317014144.2113-1-maxj.fnst@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 01:41:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213061

From: Lei Maohui <leimaohui@fujitsu.com>

There are conflict of config files between kea and lib32-kea:
  | Error: Transaction test error:
  | file /etc/kea/kea-dhcp6.conf conflicts between attempted installs of lib32-kea-2.6.1-r0.core2_32 and kea-2.6.1-r0.core2_64

Similar to:
  | 8cc65e7eb0 kea: fix conflict between multilibs

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 .../fix-kea-dhcp6-multilib-conflict.patch     | 40 +++++++++++++++++++
 meta/recipes-connectivity/kea/kea_2.6.1.bb    |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-connectivity/kea/files/fix-kea-dhcp6-multilib-conflict.patch

diff --git a/meta/recipes-connectivity/kea/files/fix-kea-dhcp6-multilib-conflict.patch b/meta/recipes-connectivity/kea/files/fix-kea-dhcp6-multilib-conflict.patch
new file mode 100644
index 0000000000..5b43f5a31a
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/fix-kea-dhcp6-multilib-conflict.patch
@@ -0,0 +1,40 @@
+From 4433f5454618dc3b41ff936447f29b37923ea57b Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@fujitsu.com>
+Date: Fri, 14 Mar 2025 07:47:15 +0000
+Subject: [PATCH] kea: fix conflict between multilibs
+
+There are conflict of config files between kea and lib32-kea:
+  | Error: Transaction test error:
+  | file /etc/kea/kea-dhcp6.conf conflicts between attempted installs of lib32-kea-2.6.1-r0.core2_32 and kea-2.6.1-r0.core2_64
+
+Similar to:
+  | 8cc65e7eb067413b4a9b1449c51f88158f3a6ae1 kea: fix conflict between multilibs
+
+Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/issues/2602]
+Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
+---
+ src/bin/keactrl/kea-dhcp6.conf.pre | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
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
diff --git a/meta/recipes-connectivity/kea/kea_2.6.1.bb b/meta/recipes-connectivity/kea/kea_2.6.1.bb
index ff7fb51fe0..0dd406812a 100644
--- a/meta/recipes-connectivity/kea/kea_2.6.1.bb
+++ b/meta/recipes-connectivity/kea/kea_2.6.1.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://kea-dhcp6-server \
            file://kea-dhcp-ddns-server \
            file://fix-multilib-conflict.patch \
+           file://fix-kea-dhcp6-multilib-conflict.patch \
            file://fix_pid_keactrl.patch \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
            file://0001-Replace-Name-NameString-with-vector-of-uint8_t.patch \
-- 
2.43.0


