Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E4D5CD12A0
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 07:10:47 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.130850.1712646642177723217
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lbO/EQ3z;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1712646643; x=1744182643;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=DhsHHhhHlG3ZmXGPP4Ag6XrInoKCsCGBIztRh+jIHCQ=;
  b=lbO/EQ3zdZ5Zeo5vGetm6FL8MGLHXanZLFTetY6CrO+y6ipYYG0WHHeq
   CoklmF5ljIBxJKg3hUvutl959C45AaIbKMZjzbH4AI9y1twLKbzfN2MLP
   YJrepVSOym0tMZLUv36WY2rYs45kLMhA0b/m68jCIFOLvb6KT5bgB0UPJ
   SXBeB2IoEsOMRy6Gi+W6o0CJMeJ0joFw1hRy+s942bOEM/9GKdrPvnmtz
   cemG8r/Xb154FRVWaS2U7fOH0V32GWNLqfO6ZYx8/9fuLSJ/ydToBadMZ
   6mDIFNBWoIhNmDQ34g1nyHROIs6CrfrZ3Q6Glv5Ahfx7C1ZdWMRjYSeaB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="134320631"
X-IronPort-AV: E=Sophos;i="6.07,188,1708354800"; 
   d="scan'208";a="134320631"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:10:41 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7F218D480A
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:39 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7C83130D85
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 03BC920097E7F
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A5A971A0002;
	Tue,  9 Apr 2024 15:10:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/33] gnutls: upgrade 3.8.4 -> 3.8.5
Date: Tue,  9 Apr 2024 15:09:57 +0800
Message-Id: <1712646620-16608-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28306.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28306.006
X-TMASE-Result: 10--0.263300-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yaoXHZz/dXlxnJdsOLB4zv79wRnyxuPjhFk7
	bKtaEQ1aRcgCVeCxp/saeTDe8Abi/Unhx5itBwM1wnkyfDvzh5jvQYvK/M6DTMRaF1V1c2e/OcY
	/jkDGKiI/iNv5iBRd5/L3NxFKQpq19zYU6zlEINu5x7uAXGEprdXLiEcLf+DIsrDwfHQQaK2/BR
	68O365busIM/D0ygBYYYDr7r40bnZ4VMEOH2fwTFhRyidsElYk+KgiyLtJrSCYzmTRc9qqaZ6ba
	/D5x6cp4vM1YF6AJbbCCfuIMF6xLSdET58jp62Soj9pCOJ4ch+yieF/8x29hnrKl9ygNY4ESJds
	YL1V37CAGtghjvE5gKd+qAvugRijXBjzTbHInEVrhIaME50jyAJ4BeSKKnytS7+RMq/2CK6rA4c
	7UV2fQpvi2PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 07:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198029

From: Wang Mingyu <wangmy@fujitsu.com>

Add-ptest-support.patch
refreshed for 3.8.5

Changelog:
==========
* libgnutls: Due to majority of usages and implementations of
  RSA decryption with PKCS#1 v1.5 padding being incorrect,
  leaving them vulnerable to Marvin attack, the RSAES-PKCS1-v1_5
  is being deprecated (encryption and decryption) and will be
  disabled in the future.
* libgnutls: Added support for RIPEMD160 and PBES1-DES-SHA1 for
  backward compatibility with GCR.
* libgnutls: A couple of memory related issues have been fixed in RSA PKCS#1
  v1.5 decryption error handling and deterministic ECDSA with earlier
  versions of GMP.
* build: Fixed a bug where building gnutls statically failed due
  to a duplicate definition of nettle_rsa_compute_root_tr().

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/gnutls/gnutls/Add-ptest-support.patch | 8 ++++----
 .../gnutls/{gnutls_3.8.4.bb => gnutls_3.8.5.bb}           | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.8.4.bb => gnutls_3.8.5.bb} (97%)

diff --git a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
index 1152d3797f..8edd31d6b9 100644
--- a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
+++ b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
@@ -1,4 +1,4 @@
-From ff6a345235b2585c261752e47a749228672b07dc Mon Sep 17 00:00:00 2001
+From bfa70adcbda4e505cf2e597907852e78e0439ee2 Mon Sep 17 00:00:00 2001
 From: Ravineet Singh <ravineet.a.singh@est.tech>
 Date: Tue, 10 Jan 2023 16:11:10 +0100
 Subject: [PATCH] gnutls: add ptest support
@@ -26,7 +26,7 @@ index 843193f..816b09f 100644
  
  include $(top_srcdir)/cligen/cligen.mk
 diff --git a/configure.ac b/configure.ac
-index d6e03cf..e3f15fb 100644
+index 934377e..4406eae 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1213,6 +1213,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
@@ -39,10 +39,10 @@ index d6e03cf..e3f15fb 100644
  
  hw_features=
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index fb9e55a..c2d226a 100644
+index e39a3b3..861dd63 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -658,6 +658,12 @@ SH_LOG_COMPILER = $(SHELL)
+@@ -663,6 +663,12 @@ SH_LOG_COMPILER = $(SHELL)
  AM_VALGRINDFLAGS = --suppressions=$(srcdir)/suppressions.valgrind
  LOG_COMPILER = $(LOG_VALGRIND)
  
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.5.bb
similarity index 97%
rename from meta/recipes-support/gnutls/gnutls_3.8.4.bb
rename to meta/recipes-support/gnutls/gnutls_3.8.5.bb
index 20139b4dd4..21506a04dc 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.5.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://Add-ptest-support.patch \
            "
 
-SRC_URI[sha256sum] = "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"
+SRC_URI[sha256sum] = "66269a2cfe0e1c2dabec87bdbbd8ab656f396edd9a40dd006978e003cfa52bfc"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
 
-- 
2.34.1


