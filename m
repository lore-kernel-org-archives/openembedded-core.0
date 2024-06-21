Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C57C2BD09
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 02:17:36 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.64036.1718936249112223071
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 19:17:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KIoCdkw3;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718936251; x=1750472251;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=LzDGKtnNFPk/LoOMf2Lxg7r8XesLA8xiY03OsLmJ19Y=;
  b=KIoCdkw3CdM51nalJYaV6uW/eAFPN0xnQqF/U0xFmI4fTQH+hncmwv1g
   4Ah8hPfHov/2SMpxb//g7U773PqJX2CQ9iuQwvdZszbyZITeHQmGNp0UA
   YRbZDQDPkmeI8wEuCZq9R4fp92fWsNemDV5EwP+ThgTywP8Epe38tTDyf
   tqR0XCF0t3mmrBkP3ClRkcQXJkQrqNJUtIZmmL2azpLWbAhHZslFzXhcX
   aVT4gcKDG4arV5SpfE2oFShTHbJ+stKJDO8nozlto6f/Vdzod/yXaGIZn
   lX2nkACX4dRmjTxzPWxerADkw+WjAQCbCMR8AW5gnTVxGukSxz7JCLYRy
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="164461642"
X-IronPort-AV: E=Sophos;i="6.08,253,1712588400"; 
   d="scan'208";a="164461642"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 11:17:17 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C63F7CA1E5
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:15 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 13671BDCA7
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 51BF820086E86
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:14 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 03FEA1A000C;
	Fri, 21 Jun 2024 10:17:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 14/22] kea: upgrade 2.4.1 -> 2.6.0
Date: Fri, 21 Jun 2024 10:16:38 +0800
Message-Id: <1718936206-8080-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
References: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28468.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28468.003
X-TMASE-Result: 10--6.477500-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yXg2y0j5vXZGK2GKtdiFmTl4YeSlHZYFonYW
	2eXId8+tdB9aRZ3DyIREQmn/v85tKlpCIuRr0RxKuce7gFxhKa1UENBIMyKD0QfxTM57BPHDvwU
	evDt+uW5ZxNzgEBrkgUb5H/7zTJtBXEG1LCXlWK5IcJTn2HkqsTEvENg7dSUMWx+lge6piSQOsb
	dDU8hPqKcmUcf5zANO/FvJJqAJsBdKQhXDXm7aNqncG1vVsfbQXLILvyEBT86bKItl61J/yUGDD
	kbg1gJk32mPO5tnascgBwKKRHe+r7csKOUWvGYJVVVgNVHpJLEK92MY8UVUkF4Anqsv2xrjr2zM
	wb8bU8A=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 02:17:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200989

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2024.

fix_pid_keactrl.patch
refreshed for 2.6.0

Changelog:
 https://gitlab.isc.org/isc-projects/kea/-/wikis/Release-Notes/release-notes-2.6.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch  | 7 +++----
 .../kea/{kea_2.4.1.bb => kea_2.6.0.bb}                     | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)
 rename meta/recipes-connectivity/kea/{kea_2.4.1.bb => kea_2.6.0.bb} (94%)

diff --git a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
index 63a6a2805b..e206805688 100644
--- a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
+++ b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
@@ -1,4 +1,4 @@
-From c878a356712606549f7f188b62f7d1cae08a176e Mon Sep 17 00:00:00 2001
+From d297e8ae315e14ae4c5c5ad98183a57f9c43b2de Mon Sep 17 00:00:00 2001
 From: Armin kuster <akuster808@gmail.com>
 Date: Wed, 14 Oct 2020 22:48:31 -0700
 Subject: [PATCH] Busybox does not support ps -p so use pgrep
@@ -7,16 +7,15 @@ Upstream-Status: Inappropriate [embedded specific]
 Based on changes from Diego Sueiro <Diego.Sueiro@arm.com>
 
 Signed-off-by: Armin kuster <akuster808@gmail.com>
-
 ---
  src/bin/keactrl/keactrl.in | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/bin/keactrl/keactrl.in b/src/bin/keactrl/keactrl.in
-index 450e997..c353ca9 100644
+index cccfdac..20ae2e6 100644
 --- a/src/bin/keactrl/keactrl.in
 +++ b/src/bin/keactrl/keactrl.in
-@@ -149,8 +149,8 @@ check_running() {
+@@ -146,8 +146,8 @@ check_running() {
      # Get the PID from the PID file (if it exists)
      get_pid_from_file "${proc_name}"
      if [ ${_pid} -gt 0 ]; then
diff --git a/meta/recipes-connectivity/kea/kea_2.4.1.bb b/meta/recipes-connectivity/kea/kea_2.6.0.bb
similarity index 94%
rename from meta/recipes-connectivity/kea/kea_2.4.1.bb
rename to meta/recipes-connectivity/kea/kea_2.6.0.bb
index 19309ce314..0f9e7b6891 100644
--- a/meta/recipes-connectivity/kea/kea_2.4.1.bb
+++ b/meta/recipes-connectivity/kea/kea_2.6.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Kea is the next generation of DHCP software developed by ISC. It
 HOMEPAGE = "http://kea.isc.org"
 SECTION = "connectivity"
 LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ea061fa0188838072c4248c1318ec131"
+LIC_FILES_CHKSUM = "file://COPYING;md5=618093ea9de92c70a115268c1d53421f"
 
 DEPENDS = "boost log4cplus openssl"
 
@@ -18,7 +18,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://fix_pid_keactrl.patch \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
            "
-SRC_URI[sha256sum] = "815c61f5c271caa4a1db31dd656eb50a7f6ea973da3690f7c8581408e180131a"
+SRC_URI[sha256sum] = "207ceae33eb3b81ec4e6ac5605249a85b93779333b62aadf39e489f11dbcdc8d"
 
 inherit autotools systemd update-rc.d upstream-version-is-even
 
-- 
2.34.1


