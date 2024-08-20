Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F79C54730
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 06:52:29 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.12716.1724136738033251363
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 23:52:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lgyE4kS3;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724136740; x=1755672740;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=laDQ35g9SV4m7iDojM96rBGA7WxHu0Qr04kiD/uYBZU=;
  b=lgyE4kS3pRd5rKi3ZBZEfq4vyyrh6514RvcaDq793rxyX3PTsfUdxCBt
   4o5ZC3rt0NalYxiNL1yVk/J4oTII233cGvFlcnfuZwwDEB8W4vOUcXekk
   Pl4r+owMz9Drb4/k8ad1txyJWfXBR8zzGsqPChfDIoXsnFidtwxbWxLVT
   1Ja4UNwwokar529JemM2fJfyHwVuBVp8RfJdbTbCXbbZZz1EjznLgklbn
   zAXcV0HVQvGRL9s58xLqdZv0FT7fEFoLeFszzRfwxrSjnf+f20R9Khr25
   EXvUvfEAAG/n4E1+aVkHPqD1c5MfY6h+nhMtnUEgRN8k0S1/Zmub0o+Vw
   w==;
X-CSE-ConnectionGUID: FQ0jqT0jTIK8fdfejJOSOA==
X-CSE-MsgGUID: obvZrWuDRAuEqoaV3ZeFEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="150507974"
X-IronPort-AV: E=Sophos;i="6.10,161,1719846000"; 
   d="scan'208";a="150507974"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 15:52:18 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7DD02CA1ED
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:16 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C089FD7483
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5283D20086134
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:15 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F0B781A0002;
	Tue, 20 Aug 2024 14:52:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 20/24] rpcbind: upgrade 1.2.6 -> 1.2.7
Date: Tue, 20 Aug 2024 14:51:39 +0800
Message-Id: <1724136703-20023-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
References: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28606.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28606.004
X-TMASE-Result: 10--0.135500-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yTo39wOA02LhTJDl9FKHbrlgDeovr2tertMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuLHENGl+3A8Ea8g1x8eqF7DGRtqVMwHzkec
	bX3igKbaYL7Af4qgNypg+xMERr0NZLT4SwCkKtFGeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8hxKp
	vEGAbTDiontfM1q8NHQ7VzanMV3UFIedyVsI4Nuhu1gx9+Ec+UTlt+KldcAWdXFH+rZ4XvwCiPs
	3m8sVkppHIsowKq5XiMB1B2IT/BF4K+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 06:52:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203538

From: Wang Mingyu <wangmy@fujitsu.com>

0001-systemd-use-EnvironmentFile.patch
refreshed for 1.2.7

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-systemd-use-EnvironmentFile.patch    | 21 +++++++++----------
 .../{rpcbind_1.2.6.bb => rpcbind_1.2.7.bb}    |  2 +-
 2 files changed, 11 insertions(+), 12 deletions(-)
 rename meta/recipes-extended/rpcbind/{rpcbind_1.2.6.bb => rpcbind_1.2.7.bb} (96%)

diff --git a/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch b/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch
index 79dc96050e..1d7ba7d508 100644
--- a/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch
+++ b/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch
@@ -9,34 +9,33 @@ Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
 ---
  configure.ac               | 2 ++
- systemd/rpcbind.service.in | 2 +-
- 2 files changed, 3 insertions(+), 1 deletion(-)
+ systemd/rpcbind.service.in | 1 +
+ 2 files changed, 3 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 2dd9471..47a46c0 100644
+index 8f4cef3..4705413 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -69,5 +69,7 @@ AC_CHECK_HEADERS([nss.h rpcsvc/mount.h])
+@@ -86,5 +86,7 @@ AC_CHECK_HEADERS([nss.h])
  # 2 "evals" needed to expand variable names
  AC_SUBST([_sbindir])
  AC_CONFIG_COMMANDS_PRE([eval eval _sbindir=$sbindir])
 +AC_SUBST([_sysconfdir])
 +AC_CONFIG_COMMANDS_PRE([eval eval _sysconfdir=$sysconfdir])
  
- AC_OUTPUT([Makefile systemd/rpcbind.service])
+ AC_OUTPUT([Makefile systemd/rpcbind.service systemd/rpcbind.socket])
 diff --git a/systemd/rpcbind.service.in b/systemd/rpcbind.service.in
-index 7b1c74b..f45ee1e 100644
+index c892ca8..e0511bd 100644
 --- a/systemd/rpcbind.service.in
 +++ b/systemd/rpcbind.service.in
-@@ -11,7 +11,7 @@ Wants=rpcbind.target
- 
+@@ -12,6 +12,7 @@ Wants=rpcbind.target
  [Service]
  Type=notify
--# distro can provide a drop-in adding EnvironmentFile=-/??? if needed.
+ # distro can provide a drop-in adding EnvironmentFile=-/??? if needed.
 +EnvironmentFile=-@_sysconfdir@/rpcbind.conf
- ExecStart=@_sbindir@/rpcbind $RPCBIND_OPTIONS -w -f
+ ExecStart=@_sbindir@/rpcbind $RPCBIND_OPTIONS @warmstarts_opt@ -f
  
  [Install]
 -- 
-2.23.0
+2.34.1
 
diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb b/meta/recipes-extended/rpcbind/rpcbind_1.2.7.bb
similarity index 96%
rename from meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
rename to meta/recipes-extended/rpcbind/rpcbind_1.2.7.bb
index aeca86e564..d308071d29 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.7.bb
@@ -18,7 +18,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
            file://rpcbind_add_option_to_fix_port_number.patch \
            file://0001-systemd-use-EnvironmentFile.patch \
           "
-SRC_URI[sha256sum] = "5613746489cae5ae23a443bb85c05a11741a5f12c8f55d2bb5e83b9defeee8de"
+SRC_URI[sha256sum] = "f6edf8cdf562aedd5d53b8bf93962d61623292bfc4d47eedd3f427d84d06f37e"
 
 inherit autotools update-rc.d systemd pkgconfig update-alternatives
 
-- 
2.34.1


