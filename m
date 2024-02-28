Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4319C54E4A
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:30 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.8389.1709105605373369203
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rNsVjvUQ;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105605; x=1740641605;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=UTOC8/UOnopBqXxlmf8qxeEMuEf05xpK4Y30RguvaQU=;
  b=rNsVjvUQNOaH1Lq0ez/NH+jaw9pw3q+27gwy8GCJgB/+i39GFWXNJYva
   yTSjGrX1FPjx8cWFGhWCeS8PgqoK2MY2FS+wEa3VtiAGScAg6tmQW7z7z
   bNv1gfFNxR4sQOBHF3rpiecLwzriNVFxpDnTHDWzfKaMhujq9QI1UhB1f
   bfY1vvpP1f5Ukkj6q98hSB1GrN7Htp7dqzYCbdnMGVH1Vhi8PiMPKfxlz
   oSZNAe1sj8hhFSe2/H2jgPTCd8Zv5VcdJj5FGcLf3QZZZWqRTtbfQMukD
   SsPYf9IHdB1/M7C6L5gu3Xj1k+Y+wsQDQ5jEu/ITo+7HaMsi9jxxN2JZV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="129444212"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="129444212"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:22 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id DBBD1C32E3
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:20 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 13594D52AF
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9CB232008FF86
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:19 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 49E041A006A;
	Wed, 28 Feb 2024 15:33:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/48] libgpg-error: upgrade 1.47 -> 1.48
Date: Wed, 28 Feb 2024 15:32:17 +0800
Message-Id: <1709105575-24259-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10--11.099200-10.000000
X-TMASE-MatchedRID: Sudfee3ORQqjz0nOeth/yR1kSRHxj+Z5nJdsOLB4zv4H4DTIEE89jL4z
	fTpGjdbaOonEFBGmbYmEXcNnT4S7NfN4L4izsa/k/HTKStsDGMKUq+GQ/zyJdL5/tqn0MloNf/t
	6odHFylT93kA1ImA+YGetXQVroYqadh9gYos97K2HZXNSWjgdU8asJhDgVSnqoqzcfAo50trZ3y
	a1EhGxQyTDw/BUeX+fIgh5J3RnkhWhhjsqgSuNbxF4zyLyne+AGbJMFqqIm9woHPvh7mvjlrFtF
	Cd5U3JHDZ5ps1PQIgxsV8o+pqqC6M3zUc8zGlQgb056mCmF00ZV4BnlVId1nZsoi2XrUn/Jn6Kd
	MrRsL14qtq5d3cxkNYm64L5jDeG7Q8wWCIaUGyGFjMTYxvyy09b2p3E9ImGl9r4HYxar880=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196335

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Do-not-fail-when-testing-config-scripts.patch
refreshed for 1.48

Changelog:
===========
 * New configure option --with-libtool-modification.
 * New option parser flag to detect commands given without a double
   dash.  There is also the new meta command "command-mode" to set
   this flag via a config file.
 * Added an es_fopen mode flag "sequential" with support on Windows.
 * Added an es_fopen mode flag "wipe" to cleanup internal buffers at
   close time.
 * New function gpgrt_wipememory.
 * Improvements to setenv on Windows.
 * Fixed call to estream-printf string filters.
 * Many improvements to the yat2m tool.
 * Updates to the build system.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-Do-not-fail-when-testing-config-scripts.patch     | 7 +++----
 .../{libgpg-error_1.47.bb => libgpg-error_1.48.bb}         | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.47.bb => libgpg-error_1.48.bb} (95%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch b/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
index ee3147f3df..d72838bb05 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
@@ -1,4 +1,4 @@
-From a45989a64af20ef6a9f7c1552f19bba116e7cd0a Mon Sep 17 00:00:00 2001
+From 75622f8b21459eb556b36edc3537fdaded7f04bf Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 28 Feb 2020 09:19:56 +0000
 Subject: [PATCH] Do not fail when testing config scripts
@@ -9,16 +9,15 @@ failure is due to that.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  src/Makefile.am | 1 -
  1 file changed, 1 deletion(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index c61adde..1b8b4ff 100644
+index 9389e99..6ded263 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -323,6 +323,5 @@ gpg-error-config: gpgrt-config gpg-error-config-old gpg-error-config-test.sh
+@@ -324,6 +324,5 @@ gpg-error-config: gpgrt-config gpg-error-config-old gpg-error-config-test.sh
  	else                                                   \
  	  echo "no";                                           \
  	  echo "***  Please report to <https://bugs.gnupg.org> with gpg-error-config-test.log"; \
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb
similarity index 95%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.47.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.48.bb
index 0f35fd95b2..9f2b49209d 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "9e3c670966b96ecc746c28c2c419541e3bcb787d1a73930f5e5f5e1bcbbb9bdb"
+SRC_URI[sha256sum] = "89ce1ae893e122924b858de84dc4f67aae29ffa610ebf668d5aa539045663d6f"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.34.1


