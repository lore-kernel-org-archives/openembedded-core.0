Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 794C4C54E64
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 00:35:43 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.7826.1711413334870131923
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 17:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PxghB6Q7;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711413335; x=1742949335;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=lFbOANYNCTZdAILw1YE0BCStA0F90w7d2pyA4EwzqoM=;
  b=PxghB6Q7Na8eyxufuut4zvPW9Ai1Looh/CCf2R4JHdoV6Fq4C+stHPVM
   D25meKETM7FcYfSiaTt8/Rap5ymWF8IlHqcROzA2DlAr2hYgh2/2V0GbR
   08//pzWgO3y97QVRX9u5IvJArkpK7uTPqqxPOyqKuKc1T7GuopYy4zU2c
   Jioq3KlupxcNiYqC68P8GSRoBlCDZYt/TfiOYs1VuqZkaCqQ5WM/aoyM4
   Ex8nab6vfHJihd/xmnjZPcAyG6j49FiUzGy9TO3fA09isoOnZ3OhshP+A
   XAGNzfgIpmxc/12WcOeYDvD4MqEUQfeVSgrEQqy76cDnh+YZrPIPHDVSz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="141792291"
X-IronPort-AV: E=Sophos;i="6.07,154,1708354800"; 
   d="scan'208";a="141792291"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:35:32 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 58F5A10A32C
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:35:30 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8667F56F7C
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:35:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 094F720097BFD
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:35:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8B9E61A006A;
	Tue, 26 Mar 2024 08:35:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-Core] [PATCH 08/34] gnutls: upgrade 3.8.3 -> 3.8.4
Date: Tue, 26 Mar 2024 08:34:26 +0800
Message-Id: <1711413292-3025-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28274.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28274.003
X-TMASE-Result: 10--1.280500-10.000000
X-TMASE-MatchedRID: 19A9OAtP7iyjz0nOeth/yc3WPbtc5Qfm1QQ6Jx/fflYIp79RyzRFTJlA
	4IpB7gNO5jmTk07qyg1oE+yMQ19+VD+VN2FJHFGNHWRJEfGP5nkWqeZpZ9fc83JRGdBA2jmIhi9
	5Kz020gbzgfRAkJS4G7EUASMCyVmD5C77zP3+r+XO4IB3sFRqtl74SxX0ZznQWAuSz3ewb23RAJ
	wLsqJFdiqq0O5S3DJ8ivFp0d/OglZtF6/n498MP/LeH1FBnhK0wTlc9CcHMZe+kux37vSFMT11q
	DA2H+XsF7rRco9crC5sV8o+pqqC6L6IKGi2xfSIqoeab9Xgz88xVUWGXs3C8zwNN9VEtNDMx1nb
	PgCF6iGxfbhqGxLk+4Ay6p60ZV62fJ5/bZ6npdjGVuWouVipcjhN6zO+fVoa1+oUE8ADiXOyZkj
	zUKKYFsxj7d1LBbbUv2d239reto7VDs619UyJzV51bDaV451cb8FscxehCalZ4xJ7Uv+P8P6/2/
	nZkihaOgB/fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 00:35:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197498

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
Add-ptest-support.patch
refreshed for 3.8.4

Changelog:
============
** libgnutls: RSA-OAEP encryption scheme is now supported
** libgnutls: Fix side-channel in the deterministic ECDSA.
** libgnutls: Fixed a bug where certtool crashed when verifying a certificate
   chain with more than 16 certificates.
** libgnutls: Compression libraries are now loaded dynamically as needed
   instead of all being loaded during gnutls library initialization.
   As a result, the library initialization should be faster.
** build: The gnutls library can now be linked with the static library
   of GMP.  Note that in order for this to work libgmp.a needs to be
   compiled with -fPIC and libhogweed in Nettle also has to be linked
   to the static library of GMP.  This can be used to prevent custom
   memory allocators from being overriden by other applications.
** API and ABI modifications:
gnutls_x509_spki_get_rsa_oaep_params: New function.
gnutls_x509_spki_set_rsa_oaep_params: New function.
GNUTLS_PK_RSA_OAEP: New enum member of gnutls_pk_algorithm_t.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-.hmac-file-should-be-excuted-in-target-envi.patch |  7 +++----
 .../gnutls/gnutls/Add-ptest-support.patch             | 11 +++++------
 .../gnutls/{gnutls_3.8.3.bb => gnutls_3.8.4.bb}       |  2 +-
 3 files changed, 9 insertions(+), 11 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.8.3.bb => gnutls_3.8.4.bb} (97%)

diff --git a/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch b/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
index 4bdc40d932..723ef9ab83 100644
--- a/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
+++ b/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
@@ -1,4 +1,4 @@
-From 21a8295bac3805e4490ba2b5f136e7f4c121061b Mon Sep 17 00:00:00 2001
+From 47194bcefbddb6ae5ea62943dcb42d625d2831b4 Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@fujitsu.com>
 Date: Mon, 23 May 2022 10:44:43 +0900
 Subject: [PATCH] Creating .hmac file should be excuted in target environment,
@@ -6,16 +6,15 @@ Subject: [PATCH] Creating .hmac file should be excuted in target environment,
 
 Upstream-Status: Inappropriate [https://gitlab.com/gnutls/gnutls/-/issues/1373]
 Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
-
 ---
  lib/Makefile.am | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/lib/Makefile.am b/lib/Makefile.am
-index 6d4e8d2..24ef108 100644
+index a50d311..193ea19 100644
 --- a/lib/Makefile.am
 +++ b/lib/Makefile.am
-@@ -206,8 +206,7 @@ hmac_file = .libs/.$(gnutls_so).hmac
+@@ -198,8 +198,7 @@ hmac_file = .libs/.$(gnutls_so).hmac
  
  all-local: $(hmac_file)
  
diff --git a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
index f87cf536fa..09d55b35f7 100644
--- a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
+++ b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
@@ -1,11 +1,10 @@
-From 81861f7ba690956c064ebe8dce6c313951fa2a9f Mon Sep 17 00:00:00 2001
+From 45217917a0a5ab6983e691b8d2a9a376cb77c7c5 Mon Sep 17 00:00:00 2001
 From: Ravineet Singh <ravineet.a.singh@est.tech>
 Date: Tue, 10 Jan 2023 16:11:10 +0100
 Subject: [PATCH] gnutls: add ptest support
 
 Upstream-Status: Inappropriate [embedded specific]
 Signed-off-by: Ravineet Singh <ravineet.a.singh@est.tech>
-
 ---
  Makefile.am       | 3 +++
  configure.ac      | 2 ++
@@ -27,10 +26,10 @@ index 843193f..816b09f 100644
  
  include $(top_srcdir)/cligen/cligen.mk
 diff --git a/configure.ac b/configure.ac
-index b25ba14..860ddef 100644
+index d6e03cf..e3f15fb 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1150,6 +1150,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
+@@ -1213,6 +1213,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
  
  AM_CONDITIONAL(NEEDS_LIBRT, test "$gnutls_needs_librt" = "yes")
  
@@ -40,10 +39,10 @@ index b25ba14..860ddef 100644
  
  hw_features=
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index d530ad0..71c592f 100644
+index fb9e55a..c2d226a 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -648,6 +648,12 @@ SH_LOG_COMPILER = $(SHELL)
+@@ -658,6 +658,12 @@ SH_LOG_COMPILER = $(SHELL)
  AM_VALGRINDFLAGS = --suppressions=$(srcdir)/suppressions.valgrind
  LOG_COMPILER = $(LOG_VALGRIND)
  
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.3.bb b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
similarity index 97%
rename from meta/recipes-support/gnutls/gnutls_3.8.3.bb
rename to meta/recipes-support/gnutls/gnutls_3.8.4.bb
index 27d6753be0..20139b4dd4 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.3.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://Add-ptest-support.patch \
            "
 
-SRC_URI[sha256sum] = "f74fc5954b27d4ec6dfbb11dea987888b5b124289a3703afcada0ee520f4173e"
+SRC_URI[sha256sum] = "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
 
-- 
2.34.1


