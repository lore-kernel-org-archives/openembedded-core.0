Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C0BC3DA64
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 05:40:44 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.61551.1722490838217291068
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jul 2024 22:40:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=K3HXQ4lN;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722490838; x=1754026838;
  h=from:to:cc:subject:date:message-id;
  bh=7X0Gy4BGVFDwQ2i8oQfFZznvzERA4vtPot3AKdPUTSU=;
  b=K3HXQ4lN7pTevlL1gpWo6RqeYtPl3Vwe7AFarBoUAFIMJHLsY26hN+u8
   WDtIqaay9FO79v9mgsD1m/K1L/5YUbriH7T2g6/Bmu0GsgtlPh5NrVanJ
   VTYJAbDo9coS834uFBJBgfHdrNVg2T7T5XtN9dQP5p+cFiV4ooW2n4PFy
   nZ1SXCz2OXWzgoW9DBauRVWNmQRGg0QTi3RYj9uxDBkvRvDIjmvDTB5ND
   7Kt4VDqPHRLbzvHZwBjTHGKguZGvtOYNVADY/y2WxdNDfk/aXkuJWeB5l
   a0yhM8FPhgLmO3z04shJCtHdH1aAyUonMWDw4UZqDt1upECndEXwc+O0x
   Q==;
X-CSE-ConnectionGUID: kndbH651T3aL0fBBhs0MsA==
X-CSE-MsgGUID: MIDvEH10ToSH5FrPuN9Klg==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="148338809"
X-IronPort-AV: E=Sophos;i="6.09,253,1716217200"; 
   d="scan'208";a="148338809"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 14:40:35 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5A889C68E5
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Aug 2024 14:40:33 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 93EECD50F8
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Aug 2024 14:40:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1652B2008611F
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Aug 2024 14:40:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C08191A0002;
	Thu,  1 Aug 2024 13:40:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] cryptodev: upgrade 1.13 -> 1.14
Date: Thu,  1 Aug 2024 13:40:23 +0800
Message-Id: <1722490823-21846-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28568.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28568.005
X-TMASE-Result: 10--6.550200-10.000000
X-TMASE-MatchedRID: EGTy8EHGssijz0nOeth/yX84FZpy/6JV1jd10P+8LE/uUsaVMCjJLWwq
	zyL5yo6vw9n86z9anTW61NiYskObR3zLTypR/JvIQgjHANpTmatN8rmPQRlvK98pqleQItEFUVg
	5dDbqFVtF5oy0hpH5nan1DY+JU2fBPubnqD2XLwjy3h9RQZ4StPSzAdIVxUnoYA3qL69rXq53y7
	kSqxRZ3+7avOjKm0LIpimlO7mS2ubgUbgLLPhW5hF4zyLyne+AMrX+p1uNztBM+b8yxBqvA8i+U
	JljoDHw7T3f4H3X0iF9j7dgJ8N1iK7Kv+wYXRsgSs47mbT7SAQZskwWqoib3Gh76/bDpGErrvte
	iIRNz3WKQkvhJNmThYyCITJXo1Pu/bu+3CdDf0DIK8EiqyqNR11kFRebn5yamyiLZetSf8mfop0
	ytGwvXiq2rl3dzGQ1c5/s5fvMyDhDu/K2d4eUyt+ZbCRrSPmgO/q1p2tFBUBChicVlZ9BNg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 05:40:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202725

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Disable-installing-header-file-provided-by-another-p.patch
0001-tests-Makefile-do-not-use-Werror.patch
removed since they're included in 1.14

Changelog:
===========
* Fix compilation issues after API changes in several Linux kernels
* Split install targets to help package maintainers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-linux_1.13.bb => cryptodev-linux_1.14.bb} |  0
 ...odule_1.13.bb => cryptodev-module_1.14.bb} |  3 ---
 ...-tests_1.13.bb => cryptodev-tests_1.14.bb} |  4 ---
 meta/recipes-kernel/cryptodev/cryptodev.inc   |  4 +--
 ...ng-header-file-provided-by-another-p.patch | 25 -------------------
 ...001-tests-Makefile-do-not-use-Werror.patch | 25 -------------------
 6 files changed, 2 insertions(+), 59 deletions(-)
 rename meta/recipes-kernel/cryptodev/{cryptodev-linux_1.13.bb => cryptodev-linux_1.14.bb} (100%)
 rename meta/recipes-kernel/cryptodev/{cryptodev-module_1.13.bb => cryptodev-module_1.14.bb} (74%)
 rename meta/recipes-kernel/cryptodev/{cryptodev-tests_1.13.bb => cryptodev-tests_1.14.bb} (74%)
 delete mode 100644 meta/recipes-kernel/cryptodev/files/0001-Disable-installing-header-file-provided-by-another-p.patch
 delete mode 100644 meta/recipes-kernel/cryptodev/files/0001-tests-Makefile-do-not-use-Werror.patch

diff --git a/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb b/meta/recipes-kernel/cryptodev/cryptodev-linux_1.14.bb
similarity index 100%
rename from meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb
rename to meta/recipes-kernel/cryptodev/cryptodev-linux_1.14.bb
diff --git a/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb b/meta/recipes-kernel/cryptodev/cryptodev-module_1.14.bb
similarity index 74%
rename from meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb
rename to meta/recipes-kernel/cryptodev/cryptodev-module_1.14.bb
index 5192cf03ed..6fb75675bb 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-module_1.14.bb
@@ -7,9 +7,6 @@ inherit module
 # Header file provided by a separate package
 DEPENDS += "cryptodev-linux"
 
-SRC_URI += "file://0001-Disable-installing-header-file-provided-by-another-p.patch \
-           "
-
 EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
 
 RCONFLICTS:${PN} = "ocf-linux"
diff --git a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.13.bb b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.14.bb
similarity index 74%
rename from meta/recipes-kernel/cryptodev/cryptodev-tests_1.13.bb
rename to meta/recipes-kernel/cryptodev/cryptodev-tests_1.14.bb
index 458ad8ecf2..f6a286e1b7 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.13.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.14.bb
@@ -4,10 +4,6 @@ SUMMARY = "A test suite for /dev/crypto device driver"
 
 DEPENDS += "openssl"
 
-SRC_URI += " \
-           file://0001-tests-Makefile-do-not-use-Werror.patch \
-           "
-
 EXTRA_OEMAKE='KERNEL_DIR="${STAGING_EXECPREFIXDIR}" PREFIX="${D}"'
 
 do_compile() {
diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
index 64a9c2926b..8d0aad4a01 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux;branch=master;protocol=https \
            "
-SRCREV = "bb8bc7cf60d2c0b097c8b3b0e807f805b577a53f"
-PV = "1.13+git${SRCPV}"
+SRCREV = "135cbff90af2ba97d88f1472be595ce78721972c"
+PV = "1.14"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-kernel/cryptodev/files/0001-Disable-installing-header-file-provided-by-another-p.patch b/meta/recipes-kernel/cryptodev/files/0001-Disable-installing-header-file-provided-by-another-p.patch
deleted file mode 100644
index c7fdef4da4..0000000000
--- a/meta/recipes-kernel/cryptodev/files/0001-Disable-installing-header-file-provided-by-another-p.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 66d85d3f26e21cf7c38b27de0dcc42376f5d853e Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Sun, 6 Apr 2014 19:51:39 -0400
-Subject: [PATCH] Disable installing header file provided by another package
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
-
-Upstream-Status: Inappropriate [ OE specific ]
-
----
- Makefile | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index d83aee6..c8d8ae5 100644
---- a/Makefile
-+++ b/Makefile
-@@ -36,7 +36,6 @@ install: modules_install
- 
- modules_install:
- 	$(MAKE) $(KERNEL_MAKE_OPTS) modules_install
--	install -m 644 -D crypto/cryptodev.h $(DESTDIR)/$(includedir)/crypto/cryptodev.h
- 
- install_tests: tests
- 	$(MAKE) -C tests install DESTDIR=$(PREFIX)
diff --git a/meta/recipes-kernel/cryptodev/files/0001-tests-Makefile-do-not-use-Werror.patch b/meta/recipes-kernel/cryptodev/files/0001-tests-Makefile-do-not-use-Werror.patch
deleted file mode 100644
index 3285548a57..0000000000
--- a/meta/recipes-kernel/cryptodev/files/0001-tests-Makefile-do-not-use-Werror.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 47438e53e1156db0916c0f4683a24fe4d82152f2 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Fri, 10 Sep 2021 10:44:42 +0200
-Subject: [PATCH] tests/Makefile: do not use -Werror
-
-Otherwise, openssl 3 deprecation warnings become errors.
-Reported at https://github.com/cryptodev-linux/cryptodev-linux/issues/67
-
-Upstream-Status: Inappropriate [upstream needs to update the code]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
----
- tests/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/Makefile b/tests/Makefile
-index 2fb7a9a..e94f80e 100644
---- a/tests/Makefile
-+++ b/tests/Makefile
-@@ -1,4 +1,4 @@
--CFLAGS += -I.. $(CRYPTODEV_CFLAGS) -Wall -Werror
-+CFLAGS += -I.. $(CRYPTODEV_CFLAGS) -Wall
- 
- comp_progs := cipher_comp hash_comp hmac_comp
- 
-- 
2.34.1


